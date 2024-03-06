#!/usr/bin/bash
gcc -c -o echotc.o -I ./picotcp/build/include echotc.c -ggdb
gcc -o echotc.elf echotc.o ./picotcp/build/lib/libpicotcp.a -ggdb
