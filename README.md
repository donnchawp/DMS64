# DMS64 — Disk Masher 64

A Commodore 64 disk imaging utility. Reads C64 disks into split `.DMS` files and restores them back.

Originally written in 1994, fixed up and released online in February 2012.
[Announcement post](https://odd.blog/2012/02/22/the-commodore-64-disk-masher-c64-dms/)

## Usage

**DMSREADER** — creates a disk image. It reads every track/sector from a source disk and saves the data as multiple `.DMS` files (`a.dms`, `b.dms`, ...) to a destination disk. You need two drives (or two D64 images in an emulator).

**DMSWRITER** — restores a disk image. It loads the `.DMS` files and writes the sectors back to a blank disk, recreating the original.

## Prerequisites

Install the following tools (all available via Homebrew on macOS):

- **[ACME](https://sourceforge.net/projects/acme-crossass/)** — 6502/6510 cross-assembler
- **[VICE](https://vice-emu.sourceforge.io/)** — provides `petcat` (BASIC tokeniser), `c1541` (disk image tool), and `x64` (C64 emulator)

```
brew install acme vice
```

## Building

Build everything (assembles ASM, tokenises BASIC, packages into a D64 disk image):

```
make all
```

This produces:

| File | Description |
|---|---|
| `dmsreader.bin` | Assembled reader machine code |
| `dmsreader.prg` | Tokenised reader BASIC loader |
| `dmswriter.bin` | Assembled writer machine code |
| `dmswriter.prg` | Tokenised writer BASIC loader |
| `dmsreader.d64` | D64 disk image containing all four files above |

### Creating the D64 disk image

The `make all` target handles this automatically. Under the hood, `c1541` formats a blank D64 and writes all four `.prg`/`.bin` files onto it:

```
c1541 -format dmsreader,id d64 dmsreader.d64 \
  -write dmsreader.prg \
  -write dmsreader.bin \
  -write dmswriter.prg \
  -write dmswriter.bin
```

### Running in VICE

To build and launch DMSREADER in the VICE emulator:

```
make dmsreader
```

### Other targets

```
make clean      # Remove all build artifacts
```

## Source files

| File | Role |
|---|---|
| `dmsreader.bas` | BASIC loader — prompts for devices, iterates disk geometry, calls ASM |
| `dmsreader.asm` | Assembly — sector read via KERNAL, SAVE to `.DMS` file |
| `dmswriter.bas` | BASIC loader — loads `.DMS` files, iterates geometry, calls ASM |
| `dmswriter.asm` | Assembly — LOAD from `.DMS` file, sector write via KERNAL |

Each tool has a BASIC program that controls the high-level flow (opening drive channels, sending DOS commands to position the drive head) and an assembly routine that handles the byte-level I/O through the C64 KERNAL.

## License

GPLv3. See [LICENSE](LICENSE).

Copyright Donncha O Caoimh — https://odd.blog/
