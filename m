From: uticdmarceau2007@gmail.com (David Marceau)
Date: Tue, 2 May 2017 21:39:38 -0400
Subject: ZoomTak UPlus flashing
In-Reply-To: <7ce87c03-17eb-7ad0-9c0f-2541dca2b5f9@suse.de>
References: <851f5607-17c3-a811-6f52-80e1eac111b1@gmail.com>
 <7ce87c03-17eb-7ad0-9c0f-2541dca2b5f9@suse.de>
Message-ID: <b10a39fd-5fc9-0179-3869-f61b9c8c2349@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Odroid c2 device advantages:
============================
1)necessary accessories were reasonably inexpensive
#1)emmc 5.0 to microsd reader/writer which plugs into
#2)USB 3.0 microsd reader/writer

2)archlinux wiki recipe to write the archlinux image to that emmc module
was straightforward and succeeded the very first time

3)network/terminal/lxde desktop all needed a bit of tweaking to get up
with archlinux, but the result was adequate.

Odroid c2 device drawbacks with archlinux:
==========================================
-the kernel seems to be stuck at 3.14 and the recipes to change that are
clearly described as risky.  The time and investment to build the kernel
is significant.  Unless it is already built and ready to install easily,
the desire to install is very low if we have a low-confidence level of
installing a working bootable and improved kernel.
-android5.0 youtube didn't work properly even with the android updates
and the odroid utility image updates.  It was hit and miss and media
playing would freeze 5s to 10s in a youtube video.
-full throughput of the the graphics chipset within archlinux never seem
to be achieved when compared to the android 5.0 within certain
applications like chrome and tvplus.


RECOMMENDATIONS
===============

To encourage more archlinux/amlogic s905 odroid c2 users to do more
newer kernel testing, here is what I would recommend:
1.1)we need a quick test and recover cycle
1.1.0)we need download links to the latest amlogic images to test
against for which the amlogic linux user group needs bug reports for.

2)we need the steps to flash the particular boot image and kernel image
and other respective partitions on the appropriate devices(emmc or microsd)

3)we need links to the accessories we can buy to make that quick test
and recover cycle happen.
ODROID's C2 ACCESSORIES STORE is wonderful, I have what I need to wipe
and write the emmc5.0 storage with a new image.
THE ZOOMTAK UPLUS box on the other hand with the S912 chipset uses a
different emmc5.0 layout(FBGA169?) which means I need to find a
different reader/writer for it.  I am still uncertain which
reader/writer to get. I have not found the documentation to read/write
the image for the board in the ZoomTAK uplus.  What little info I did
find about usb fbga169 readers was they were significantly more
expensive discouraging me from the idea of backing up the current image
and reflashing it with something else.  I believe I can pull it out in
the same way the odroid c2's emmc modules can be pulled out, but I have
yet to try.  I haven't found much out there about zoomtak uplus
teardowns and my mother-in-law's constantly watching her Chinese soaps
so I have to minimize my tinkering with the inside of the box :)
Does anyone have a good url where we can buy a reasonably priced usb
emmc reader/writer for zoomtak uplus emmc modules?
I bought 2 emmc modules for the odroid c2, one for android and the other
for archlinux.  It worked out well.  The android emmc is for the
mother-in-law during the day.  The archlinux emmc is for me when I am
trying different thing on my spare time.  I aim to do something similar
with the zoomtak box, but I need to do some research first before
actually tearing up the box and risking breaking things in the process.

4)faster recover procedures to allow to get on with daily usage after
testing/reporting bugs on newer kernels will encourage more testers.
For archlinux, it's very easy to update the packages of the os itself,
but not to install and test the newer kernels.  If it crashes and can't
boot up, that implies a reflash of the entire emmc storage or at least
that's the quick answer.  The longer more precise answer pointing to the
older existing kernel from within the boot on arm-based boards is
trickier than on intel-boards.  On intel-boards we can backtrack by
simply reverting back to an older kernel by deleting the questionable
kernel and refreshing the boot table using a grub-update or
mkgrubinitcfg from a usb bootable thumb drive. Honestly my familiarity
to do something on arm-based boards with uboot is very little(NONE) and
tend to avoid and focus on running applications rather than kernels.
I've read about tools that can help on radxa boards(NON-AMLOGIC) but
the procedures to use them particular for radxa boards were unclear
which left me to sticking with stock radxa kernel.  I'm currently
feeling encouraged to use the latest kernel from amlogic, but I am
feeling incapable of going from the current archlinux stable kernel to
the amlogic latest kernel and then back to the archlinux stable kernel.
Anything out to alleviate the painpoint to save time to recover to the
older kernel with certainly help with great certainty for others to join
the testing knowing full well no matter what they test won't brick their
device to take them a great amount of time to recover from the tested
kernel that bricks the device.

You are probably aware of this already:  having the stock android image
for the zoomtak uplus image is that there usually is a special directory
in the android image that has the android linux kernel build config
file...which is used to build the custom zoomtak uplus kernel in the
first place.

There were rumors floating that 32-bit amlogic linux images could run
without changes on the odroid c2, is that true?  If that is the case, is
it possible that an odroid c2 64-bit archlinux image could run without
changes on the zoomtak uplus box?  Are the amlogic chipset boards
somewhat compatible boards or are they entirely incompatible?

Thank you for listening.


On 05/01/2017 07:52 AM, Andreas F?rber wrote:
> Hi David,
> 
> Am 27.04.2017 um 03:49 schrieb David Marceau:
>> I recently bought a ZoomTak Uplus(amlogic S912), but documentation to
>> flash it in a manner similar to the odroid c2 is sparse/scattered.  It
>> has the stock android 6.0 kernel on it.  If there are any diagnostics
>> tools or tests you would like to make from within the existing android,
>> I would volunteer myself to those also.
> 
> Your help in making meson-tools [1] work with S912 would be appreciated!
> 
> IIRC S905X and S912 were lacking the initial @AML header at offset 16
> that my tools currently expect.
> 
> You should backup (via dd from Android) the first ~4 MB of your eMMC for
> non-destructive offline analysis.
> 
> First steps would then be to tweak unamlbootsig code to deal with
> aml_encrypt_gxl [2] format input, then modify amlbootsig code to
> correctly generate the @AML headers, matching your original input.
> README.md has some hints on how to use hexdump and diff tools for this.
> 
> Next step would then be to split off fip.bin at the appropriate offset
> of unamlbootsig output (via dd), modify fip.bin via fip_create or
> (patched) fiptool, write it back into unamlbootsig's output (using dd)
> and run amlbootsig on it. If you're really lucky, writing that onto an
> SD card and powering up the box with it would give you serial output you
> can distinguish from the eMMC's (to make sure you're actually booting
> from SD). If you're unlucky, eMMC comes first in the boot order, so that
> shorting eMMC pins or zero'ing/overwriting the eMMC would be the only
> ways to test new bootloaders, which might brick your board, and at least
> meson-tools v0.1 doesn't include any recovery tools.
> 
> 
> Note that currently there is no mainline U-Boot for S912. If you wanted
> to hack on that based on existing S905 code, you could instead try to
> chain-load your U-Boot from your box's U-Boot by loading it from a FAT
> partition on SD/USB to some memory location (at least on my R-Box Pro
> tftp boot wasn't working) and then running it via "go" command.
> 
> But then again you should just start with enabling the mainline kernel
> for your box and loading it from a FAT partition on SD/USB or via TFTP.
> Once Linux has a .dts, it is much easier to import that into U-Boot.
> 
> Cheers,
> Andreas
> 
> [1] https://github.com/afaerber/meson-tools
> [2] https://github.com/khadas/u-boot/tree/ubuntu/fip
> 
