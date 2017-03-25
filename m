From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 25 Mar 2017 11:20:40 +0100
Subject: [PATCH v2 0/4] mmc: meson-gx: smaller functional extensions
Message-ID: <aae9e7c7-d8a2-72b1-22f7-f0ad513d4667@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes the switch to bitfield macros and a few smaller
functional extensions.

Successfully tested on a Odroid C2 (S905GXBB) with a 128GB eMMC.

Measured with a simple
dd if=/dev/mmcblk0 of=/dev/null iflag=direct bs=100M count=1
read performance increases from 13.5 MB/s to 16.8 MB/s by
switching to CMD23 mode.

v2:
- removed few unused defines
- improved name of function to get timeout value

Heiner Kallweit (4):
  mmc: meson-gx: use bitfield macros
  mmc: meson-gx: use per port interrupt names
  mmc: meson-gx: switch to dynamic timeout values
  mmc: meson-gx: add CMD23 mode

 drivers/mmc/host/meson-gx-mmc.c | 129 ++++++++++++++++++++++------------------
 1 file changed, 70 insertions(+), 59 deletions(-)

-- 
2.12.0
