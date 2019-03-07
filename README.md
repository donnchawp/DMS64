# dms64
Disk Masher 64

DMS 64, create images of Commodore 64 disks and split the image into multiple files.
Copyright Donncha O Caoimh, https://odd.blog/
Version 1.0 originally written in 1994 but fixed and spread online in Feb 2012
Announcement post: https://odd.blog/2012/02/22/the-commodore-64-disk-masher-c64-dms/

Create a disk image with DMSREADER. You'll need 2 blank disks or 2 D64
files to write to. Multiple files with the extension .DMS will be created.

Recreate the original disk by using DMSWRITER.

The source code here is a mess and won't compile but I'm currently working on the assembly part of it with ACME assembler, and using Vice petcat to tokenise the BASIC programmes.

How it works:
reading:

dmsreader loads dmsread.asm which is located at $1000 (4096) if not loaded already.
It turns the screen black and then asks for source and destination devices.
SYS 4096 runs the code at $1000 which copies memory to $CE00 and $CF00.
It sets $CE03 (52739) to the destination drive number and opens a command channel to the source drive. (https://wpguru.co.uk/2014/06/commodore-1541-dos-commands/ https://en.wikipedia.org/wiki/Commodore_DOS)
It also opens a read channel (5) to the same drive to read tracks directly.

ASM For reading sectors from disk:
http://codebase64.org/doku.php?id=base:reading_a_sector_from_disk

Compiled ASM with Acme.
Install ACME with brew:
$ brew install acme

