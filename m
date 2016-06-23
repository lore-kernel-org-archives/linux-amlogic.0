From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 23 Jun 2016 16:40:25 -0700
Subject: [RFT] MMC driver for s905/GXBB
Message-ID: <m2h9cjv5hy.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello all,

For those of you that have been waiting/asking for MMC support on
mainline for the s905/GXBB, you can stop waiting and start testing.

The v4.7/integ branch of the amlogic tree[1] has the first pass of a
driver.  

It's had some basic testing on the Amlogic P200 dev board and the
odroidc2 using external SD cards.  Testing included creating
filesystems, basic file copy/delete/md5sum and card detect support.

Notably untested is the eMMC support, but I wanted to get it out sooner
rather than later for broader testing.

Also, for data xfer it's using memcpy (actually sg_copy_*_buffer) so
it's not terribly efficient, but the next step is to take better
advantage of the DMA-like descriptors in the MMC hardware to speed up
bigger xfers.

After a bit more cleanup and testing, I hope to get this posted to the
MMC list next week.

Happy testing,

Kevin

[1] https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git/log/?h=v4.7/integ
