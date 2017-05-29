From: cyrozap@gmail.com (Forest Crossman)
Date: Mon, 29 May 2017 18:48:31 -0500
Subject: S905 BL30/BL1 (boot ROM) reverse engineering
Message-ID: <CAO3ALPyf9KW4HiV1G=y_4uyF1x9=WZgXVEoEPR8nPGpJfp_T0g@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi, all,

If any of you are interested in a FOSS replacement for some or all of
the Amlogic bootloader blobs, please read on and let me know what you
think! Also, I apologize if this email is a little hard to follow--I
spent a lot of time editing, but it still reads like a brain-dump. If
you have any questions, please don't hesitate to ask!

Last year around the time of the "2.0 GHz is actually 1.5 GHz"
scandal, I started reverse-engineering the BL30 binary for my
ODROID-C2. In September, I posted some of my findings to the ODROID
forums:

- https://forum.odroid.com/viewtopic.php?f=141&t=23044&start=150#p158346
- https://forum.odroid.com/viewtopic.php?f=141&t=23044&start=200#p158470

(Please note that the stuff about BL1/BL2 in first post is wrong, and
since I've only learned all of these things from reverse engineering,
I may have gotten some other stuff wrong, too.)

To help others with the BL30 RE efforts, I wrote some code to download
and pack the binary into an ELF file, making it easier for
disassemblers to load the firmware:

- https://github.com/cyrozap/bl30-elf

Unfortunately, the generated ELF file doesn't have any debugging
symbols, so everything has to be labeled from scratch at the moment.
To remedy this, I'll try to export symbols from my Hopper database. If
I can do that, I'll distribute a .map file and try to figure out how
to add it to the ELF. If any of you know anything about how ELF files
and debug symbols work, I could really use some help here because I
have almost no clue what I'm doing.

About a month after I did that stuff with BL30, someone wrote a blog
post on how to dump the boot ROM (BL1):

- http://www.fredericb.info/2016/10/amlogic-s905-soc-bypassing-not-so.html

In order to understand the boot process better, I decided to try and
dump BL1 from my ODROID-C2 myself. One thing that tripped me up with
the BL1-dumping process was that the SHA-1 hash
(bff0c7fb88b4f03e732dc7a4ce504d748d0d47dd) in that blog post is wrong.
The file that hash is computed on is the full boot ROM, but it has an
extra newline ("\n", 0x0A) byte appended to it--that's why it's 65537
bytes long instead of 65536 bytes. The real hashes for the 65536-byte
ROM are:

- MD5: 84759768f30699652fee3429387c188f
- SHA-1: 644201c13ea26f2458911d544818d8134a341bd2
- SHA-256: 0f144735c74fe85107556601e34f5007d3b1a095631c677ee9fc8c2a1cd46832

I was thinking of writing a better kernel module and instructions to
dump BL1 since the process in that post was very difficult to
duplicate, but since I'm not very experienced with kernel programming,
that would take a significant amount of work, so please let me know if
any of you would be interested in that.

Just like with the BL30 binary, I've annotated some of the BL1
disassembly in Hopper and I might try to make an ELF-generator repo
for it (and maybe add symbols if I learn how to do that). As expected,
the binary is the assembled/compiled form of ARM's reference BL1 with
significant modifications for the S905 SoC and its
optionally-authenticated boot process.

Anyways, I really don't want to have to do all the reverse engineering
and FOSS re-implementation by myself, so if any of you are interested
in helping (or even just curious to see how everything works), please
let me know and I'll put more effort into making this work more
accessible. And again, if you have any questions, please ask!

Thanks for reading!

-- 
Forest Crossman
