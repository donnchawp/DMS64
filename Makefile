TARGETS := dmsreader.prg dmsreader.bin dmsreader.d64 dmswriter.prg
C1541 := /usr/local/bin/c1541
X64 := open /Applications/Vice64/x64.app

.PRECIOUS: %.d64

all: $(TARGETS)

%.bin: %.asm
	acme --cpu 6510 --format cbm --outfile $@ $<

%.prg: %.bas
	petcat -w2 -o $@ $<

%.d64: %.bin %.prg
	$(C1541) -format dmsreader,id d64 dmsreader.d64 -write dmsreader.prg -write dmsreader.bin -write dmswriter.prg

%: %.d64
	$(X64) $<

clean:
	rm -f $(TARGETS) *.prg *.d64

