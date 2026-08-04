#!/usr/bin/env python3

# Extract the magic number, release, and serial numbers from a Glulx game file.
# Also show if the file's real length is greater than the length encoded
# in the header. Optionally rename the file to encode release/serial.

import os
import re
import sys


def sanitize(s):
    # Keep only characters that are safe across filesystems.
    return re.sub(r"[^A-Za-z0-9_-]", "_", s)


def parse(filename, rename=False):
    if filename == "-":
        filename = "(stdin)"
        dat = sys.stdin.buffer.read()
        reallen = len(dat)
        dat = dat[0:60]  # Read up to the end of the Glulx header
    else:
        with open(filename, "rb") as fl:
            dat = fl.read(60)

        reallen = os.stat(filename).st_size

    if len(dat) < 60:
        print("short data: " + filename)
        return

    # Verify Glulx Magic Number 'Glul' (4 bytes at 0x00)
    magic = dat[0:4]

    if magic != b"Glul":
        print(f"not a raw glulx file (magic {magic!r}): {filename}")
        return

    # Extract Glulx values using Big-Endian decoding
    # Length: 4 bytes at 0x0C
    length = int.from_bytes(dat[12:16], byteorder="big")

    # Release: 2 bytes at 0x34
    release = int.from_bytes(dat[52:54], byteorder="big")

    # Serial: 6 bytes at 0x36
    serial = dat[54:60].decode("latin-1", errors="ignore")

    lengthmsg = ""

    if length == 0:
        lengthmsg = " (no encoded length)"
    elif reallen < length:
        lengthmsg = f" (short by {length - reallen} bytes)"
    elif reallen > length:
        lengthmsg = f" (padded by {reallen - length} bytes)"

    print(f"glulx release {release} serial {serial}{lengthmsg}: {filename}")

    if rename and filename != "(stdin)":
        dirpath, base = os.path.split(filename)
        stem, ext = os.path.splitext(base)
        safe_serial = sanitize(serial)
        newbase = f"{stem}-r{release}-s{safe_serial}{ext}"
        newpath = os.path.join(dirpath, newbase)

        if os.path.abspath(newpath) == os.path.abspath(filename):
            print(f"  (already named correctly: {filename})")
            return

        if os.path.exists(newpath):
            print(f"  refusing to rename, target exists: {newpath}")
            return

        os.rename(filename, newpath)
        print(f"  renamed -> {newpath}")


if not sys.argv[1:]:
    print("Usage: python3 glulxanalyze.py [--rename] files...")
    sys.exit(-1)

args = sys.argv[1:]
do_rename = False
if args and args[0] == "--rename":
    do_rename = True
    args = args[1:]

for filename in args:
    try:
        parse(filename, rename=do_rename)
    except (OSError, UnicodeDecodeError) as ex:
        print(filename + ":", ex)
