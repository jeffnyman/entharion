#!/usr/bin/env python3

# Extract the version, release, and serial numbers from a Z-code game file.
# Also show if the file's real length is greater than the length encoded
# in the header.

import os
import sys


def parse(filename):
    if filename == "-":
        filename = "(stdin)"
        dat = sys.stdin.buffer.read()
        reallen = len(dat)
        dat = dat[0:28]
    else:
        with open(filename, "rb") as fl:
            dat = fl.read(28)
        reallen = os.stat(filename).st_size

    if len(dat) < 28:
        print("short data: " + filename)
        return

    zversion = int(dat[0])
    release = int(0x100 * dat[2] + dat[3])
    serial = dat[18:24].decode("latin-1")
    length = int(0x100 * dat[26] + dat[27])

    if zversion <= 3:
        length *= 2
    elif zversion <= 5:
        length *= 4
    else:
        length *= 8

    lengthmsg = ""

    if length == 0:
        lengthmsg = " (no encoded length)"
    elif reallen < length:
        lengthmsg = f" (short by {length - reallen} bytes)"
    elif reallen > length:
        lengthmsg = f" (padded by {reallen - length} bytes)"

    print(f"z{zversion} release {release} serial {serial}{lengthmsg}: {filename}")


if not sys.argv[1:]:
    print("Usage: python3 zcanalyze.py files...")
    sys.exit(-1)

for filename in sys.argv[1:]:
    try:
        parse(filename)
    except (OSError, UnicodeDecodeError) as ex:
        print(filename + ":", ex)
