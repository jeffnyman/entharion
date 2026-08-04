#!/usr/bin/env python3

# Extract the magic number, release, and serial numbers from a Glulx game
# file -- either a raw .ulx file, or a .gblorb Blorb container that wraps
# one. Also show if the file's real length is greater than the length
# encoded in the header. Optionally rename the file to encode
# release/serial.

import os
import re
import sys


def sanitize(s):
    # Keep only characters that are safe across filesystems.
    return re.sub(r"[^A-Za-z0-9_-]", "_", s)


def find_glulx_in_blorb(data):
    """Given the full bytes of a .gblorb (IFF FORM/IFRS) file, locate the
    embedded GLUL chunk. Returns (header_bytes, chunk_length) or None if
    this isn't a Blorb file, or no Glulx (GLUL) resource is found inside
    it (e.g. it's a Z-code/Blorb instead)."""

    if data[0:4] != b"FORM" or data[8:12] != b"IFRS":
        return None

    pos = 12  # chunks start right after "FORM" + size(4) + "IFRS"
    ridx_entries = None

    while pos + 8 <= len(data):
        cid = data[pos : pos + 4]
        clen = int.from_bytes(data[pos + 4 : pos + 8], byteorder="big")
        cstart = pos + 8

        if cid == b"RIdx":
            chunk_data = data[cstart : cstart + clen]
            num = int.from_bytes(chunk_data[0:4], byteorder="big")
            entries = []
            for i in range(num):
                off = 4 + i * 12
                usage = chunk_data[off : off + 4]
                number = int.from_bytes(chunk_data[off + 4 : off + 8], byteorder="big")
                start = int.from_bytes(chunk_data[off + 8 : off + 12], byteorder="big")
                entries.append((usage, number, start))
            ridx_entries = entries
            break

        pos = cstart + clen + (clen % 2)  # IFF chunks are padded to even length

    if not ridx_entries:
        return None

    exec_start = None
    for usage, _number, start in ridx_entries:
        if usage == b"Exec":
            exec_start = start
            break

    if exec_start is None or exec_start + 8 > len(data):
        return None

    chunktype = data[exec_start : exec_start + 4]
    chunklen = int.from_bytes(data[exec_start + 4 : exec_start + 8], byteorder="big")

    if chunktype != b"GLUL":
        return None  # e.g. a Z-code (ZCOD) game -- not a Glulx file

    gstart = exec_start + 8
    header = data[gstart : gstart + 60]
    return header, chunklen


def parse(filename, rename=False):
    if filename == "-":
        filename = "(stdin)"
        full = sys.stdin.buffer.read()
        dat = full[0:60]
        reallen = len(full)

        if full[0:4] == b"FORM":
            result = find_glulx_in_blorb(full)
            if result is None:
                print("FORM file but no embedded glulx (GLUL) resource: " + filename)
                return
            dat, reallen = result
    else:
        with open(filename, "rb") as fl:
            head = fl.read(12)

            if head[0:4] == b"FORM":
                fl.seek(0)
                full = fl.read()
                result = find_glulx_in_blorb(full)
                if result is None:
                    print(
                        "FORM file but no embedded glulx (GLUL) resource: " + filename
                    )
                    return
                dat, reallen = result
            else:
                fl.seek(0)
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
