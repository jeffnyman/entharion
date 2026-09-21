#!/usr/bin/env python3

# Build the Dialog games: compile each source listed below to every format
# it targets, into dialog-code.
#
# One compiler does all of it. dialogc emits z5, z8, zblorb, and aa, so the
# same source becomes both a Z-machine story and an Aa-machine one, and the
# two can be played against the same acceptance script.
#
# Nothing is overwritten unless it comes out byte for byte the same. Most
# of dialog-code was downloaded rather than built, and a rebuilt file that
# differs by even a byte would leave the acceptance recordings describing a
# game that no longer exists. A build that differs is written beside the
# original with .built on the end and reported, so the difference can be
# looked at. Pass --force to take the new file anyway.
#
# Three things this script exists to remember:
#
#   - The format must be named. Writing to a name ending .zblorb is not
#     enough: without -t zblorb the compiler quietly emits a bare z8.
#   - The standard library shipped beside a game is often older than the
#     compiler. Pas De Deux carries version 0.31, which the current
#     compiler rejects, so every game builds against vendor/dialog.
#   - Each game wants its own heap sizes, and a game that runs out of heap
#     only says so at play time. The sizes here are the author's own.
#
# Serial numbers are pinned, because Dialog stamps the build date into the
# story and an unpinned build changes two bytes a day.

import os
import shlex
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCE = os.path.join(ROOT, "dialog-source")
CODE = os.path.join(ROOT, "dialog-code")
DIALOG = os.path.join(ROOT, "vendor", "dialog")

# Every game built here, with the flags its author gave it. "where" is the
# directory the compiler runs in, which is also where a game's resources
# are looked for. Outputs are named per format; the .aastory names are the
# ones rezrov's acceptance scripts already point at.
GAMES = [
    {
        "name": "picture-test",
        "where": ".",
        "sources": ["picture-test.dg"],
        "serial": "2026-09-20",
        "flags": [],  # built without -s, so the object names are still in it
        "outputs": {
            "aa": "picture-test.aastory",
            "zblorb": "picture-test-r2-s260920.zblorb",
        },
    },
    {
        # The only Dialog game here built as a bare z5. Every other one is
        # z8 or a Blorb, and Dialog's z5 backend packs addresses on a
        # different scale, so this is the one that exercises it.
        "name": "cloak-of-darkness",
        "where": ".",
        "sources": ["cloak-of-darkness.dg"],
        "serial": "2026-09-21",
        "flags": [],
        "outputs": {
            "aa": "cloak-of-darkness.aastory",
            "z5": "cloak-of-darkness-r2-s260921.z5",
        },
    },
    {
        "name": "pas-de-deux",
        "where": "pas-de-deux-rel2",
        "sources": ["pas-de-deux.dg"],
        "serial": "2019-11-25",
        "flags": ["-s", "-H", "1400", "-A", "400", "-L", "200"],
        "cover": "cover/pasdedeux.png",
        "outputs": {
            "aa": "pas-de-deux.aastory",
            "zblorb": "pas-de-deux-r2-s191125.zblorb",
        },
    },
]


def posix(path):
    return path.replace("\\", "/")


def compiler():
    # A native compiler if one has been built, otherwise the Linux one
    # through WSL. Building the native one needs mingw ("sudo apt install
    # mingw-w64", then "make -C vendor/dialog/src dialogc.exe") and takes
    # WSL out of the loop entirely.
    native = os.path.join(DIALOG, "src", "dialogc.exe")

    if os.path.exists(native):
        return native, False

    ported = os.path.join(DIALOG, "src", "dialogc")

    if not os.path.exists(ported):
        raise SystemExit(
            "no compiler: build one with 'make -C vendor/dialog/src dialogc'"
        )

    return ported, sys.platform == "win32"


def run(where, line, through_wsl):
    if not through_wsl:
        done = subprocess.run(line, cwd=where, capture_output=True, text=True)
    else:
        # One shell, moved to the source directory first, because the
        # compiler resolves a game's resources relative to where it runs.
        inside = 'cd "$(wslpath %s)" && %s' % (
            shlex.quote(posix(where)),
            " ".join(shlex.quote(part) for part in line),
        )
        done = subprocess.run(
            ["wsl.exe", "-e", "bash", "-lc", inside], capture_output=True, text=True
        )

    told = [
        note
        for note in (done.stdout + done.stderr).splitlines()
        if note.startswith("Error")
    ]

    return done.returncode == 0, told


def settle(fresh, wanted, force):
    # Put a freshly built file where it belongs, unless that would change a
    # file already there.
    if not os.path.exists(wanted):
        os.replace(fresh, wanted)
        return "new"

    with open(fresh, "rb") as a, open(wanted, "rb") as b:
        same = a.read() == b.read()

    if same:
        os.replace(fresh, wanted)
        return "same"

    if force:
        os.replace(fresh, wanted)
        return "replaced"

    return "differs, left as " + os.path.basename(fresh)


def build(game, tool, through_wsl, force):
    where = os.path.abspath(os.path.join(SOURCE, game["where"]))
    library = posix(os.path.relpath(os.path.join(DIALOG, "stdlib.dg"), where))
    named = tool if not through_wsl else posix(os.path.relpath(tool, where))

    for fmt, name in sorted(game["outputs"].items()):
        fresh = os.path.join(CODE, name + ".built")

        line = [named, "-t", fmt, "--override-serial", game["serial"]]
        line += game["flags"]

        if fmt == "zblorb" and "cover" in game:
            line += ["-c", game["cover"]]

        line += ["-o", posix(os.path.relpath(fresh, where))]
        line += game["sources"] + [library]

        went, told = run(where, line, through_wsl)

        if not went:
            print("%-18s %-34s failed" % (game["name"], name))

            for note in told:
                print("    " + note)

            continue

        print("%-18s %-34s %s" % (game["name"], name, settle(fresh, os.path.join(CODE, name), force)))


def main():
    wanted = [word for word in sys.argv[1:] if word != "--force"]
    force = "--force" in sys.argv[1:]
    tool, through_wsl = compiler()

    for game in GAMES:
        if wanted and game["name"] not in wanted:
            continue

        build(game, tool, through_wsl, force)


if __name__ == "__main__":
    main()
