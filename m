From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Mon, 1 May 2017 13:52:50 +0200
Subject: ZoomTak UPlus flashing (was: odroid c2 owner here)
In-Reply-To: <851f5607-17c3-a811-6f52-80e1eac111b1@gmail.com>
References: <851f5607-17c3-a811-6f52-80e1eac111b1@gmail.com>
Message-ID: <7ce87c03-17eb-7ad0-9c0f-2541dca2b5f9@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi David,

Am 27.04.2017 um 03:49 schrieb David Marceau:
> I recently bought a ZoomTak Uplus(amlogic S912), but documentation to
> flash it in a manner similar to the odroid c2 is sparse/scattered.  It
> has the stock android 6.0 kernel on it.  If there are any diagnostics
> tools or tests you would like to make from within the existing android,
> I would volunteer myself to those also.

Your help in making meson-tools [1] work with S912 would be appreciated!

IIRC S905X and S912 were lacking the initial @AML header at offset 16
that my tools currently expect.

You should backup (via dd from Android) the first ~4 MB of your eMMC for
non-destructive offline analysis.

First steps would then be to tweak unamlbootsig code to deal with
aml_encrypt_gxl [2] format input, then modify amlbootsig code to
correctly generate the @AML headers, matching your original input.
README.md has some hints on how to use hexdump and diff tools for this.

Next step would then be to split off fip.bin at the appropriate offset
of unamlbootsig output (via dd), modify fip.bin via fip_create or
(patched) fiptool, write it back into unamlbootsig's output (using dd)
and run amlbootsig on it. If you're really lucky, writing that onto an
SD card and powering up the box with it would give you serial output you
can distinguish from the eMMC's (to make sure you're actually booting
from SD). If you're unlucky, eMMC comes first in the boot order, so that
shorting eMMC pins or zero'ing/overwriting the eMMC would be the only
ways to test new bootloaders, which might brick your board, and at least
meson-tools v0.1 doesn't include any recovery tools.


Note that currently there is no mainline U-Boot for S912. If you wanted
to hack on that based on existing S905 code, you could instead try to
chain-load your U-Boot from your box's U-Boot by loading it from a FAT
partition on SD/USB to some memory location (at least on my R-Box Pro
tftp boot wasn't working) and then running it via "go" command.

But then again you should just start with enabling the mainline kernel
for your box and loading it from a FAT partition on SD/USB or via TFTP.
Once Linux has a .dts, it is much easier to import that into U-Boot.

Cheers,
Andreas

[1] https://github.com/afaerber/meson-tools
[2] https://github.com/khadas/u-boot/tree/ubuntu/fip

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)
