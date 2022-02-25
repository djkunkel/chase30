.PHONY: all clean


#CC65DIR=/data/data/com.termux/files/home/6502/cc65-master

all: chase.nes


chase.nes: game.o famitone2.o audio.o tileset.o mapper30.cfg nrom.cfg
	$(CC65_HOME)\bin\ld65.exe -C mapper30.cfg -o chase.nes $(CC65_HOME)/lib/crt0.o game.o famitone2.o audio.o tileset.o $(CC65_HOME)/lib/neslib2.lib $(CC65_HOME)/lib/nes.lib

game.o: game.c
	$(CC65_HOME)\bin\cc65.exe -Oi game.c --add-source
	$(CC65_HOME)\bin\ca65.exe game.s

audio.o: audio.s sounds.s music.s
	$(CC65_HOME)\bin\ca65.exe audio.s

tileset.o: tileset.s tileset.chr
	$(CC65_HOME)\bin\ca65.exe tileset.s

famitone2.o: famitone2.s
	$(CC65_HOME)\bin\ca65.exe famitone2.s

clean:
	rm game.s *.o *.nes