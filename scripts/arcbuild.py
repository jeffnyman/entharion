#!/usr/bin/env python3

# Build the Arcturus games: compile every .storyarc in arcturus-source and,
# where a matching picture pack exists in arcturus-code, put story and
# pictures together in one .zblorb.
#
# Arcturus ships its whole toolchain in vendor/arcturus/build, written in
# Python with no dependencies, so nothing needs installing. Two tools do
# the work: arcc compiles a story, and arcimg packs the art.
#
# Output files are named for what the compiled header says, <game>-r<release>
# -s<serial>, because a story that does not declare a serial takes the build
# date and so changes its name whenever it is rebuilt.

import os
import re
import struct
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SOURCE = os.path.join(ROOT, "arcturus-source")
CODE = os.path.join(ROOT, "arcturus-code")
BUILD = os.path.join(ROOT, "vendor", "arcturus", "build")

# The stamp a built file carries, which is not part of the game's name.
STAMP = re.compile(r"-r\d+-s[0-9-]+$")


def named(path):
    # The game's own name, with any build stamp taken off the end.
    return STAMP.sub("", os.path.splitext(os.path.basename(path))[0])


def stamp(story):
    with open(story, "rb") as fl:
        header = fl.read(24)

    release = struct.unpack(">H", header[2:4])[0]
    serial = header[18:24].decode("latin-1")
    return "r%d-s%s" % (release, serial)


def run(tool, *args):
    line = [sys.executable, os.path.join(BUILD, tool)] + list(args)
    done = subprocess.run(line, capture_output=True, text=True)

    if done.returncode != 0:
        sys.stderr.write(done.stdout + done.stderr)
        raise SystemExit("%s failed on %s" % (tool, args[0]))

    return done.stdout


def art(game):
    # The picture pack for a game, if it has one. Arcturus publishes these
    # as pictures-only Blorbs, so they are art rather than playable games.
    for name in sorted(os.listdir(CODE)):
        if name.endswith(".blorb") and named(name) == game:
            return os.path.join(CODE, name)

    return None


def build(source):
    game = named(source)
    plain = os.path.join(CODE, game + ".z5")

    run("arcc", source, "-o", plain, "-q")

    story = os.path.join(CODE, "%s-%s.z5" % (game, stamp(plain)))
    os.replace(plain, story)
    print("%-20s %s" % (game, os.path.basename(story)))

    pictures = art(game)

    if pictures is None:
        return

    packed = story[: -len(".z5")] + ".zblorb"

    run("arcimg", "pack", pictures, "--zblorb", story, "-o", packed)
    print("%-20s %s" % ("", os.path.basename(packed)))


def main():
    wanted = sys.argv[1:]

    for name in sorted(os.listdir(SOURCE)):
        if not name.endswith(".storyarc"):
            continue

        source = os.path.join(SOURCE, name)

        if wanted and named(source) not in wanted:
            continue

        build(source)


if __name__ == "__main__":
    main()
