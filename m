From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Feb 2018 23:39:23 +0100
Subject: [PATCH v2 0/5] improvements and fixes for the phy-meson-gxl-usb2
 driver
Message-ID: <20180212223928.22993-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This contains two fixes and two (minor) fixes for the phy-meson-gxl-usb2
driver:
- a clock and reset line is used for the PHYs. this was not clear from
  the Amlogic GPL kernel sources since the clock is enabled very early
  in the boot process (either because the hardware defaults to "on",
  the bootrom enables it or a bootloader before BL3-3/u-boot enables it)
- we don't read the controller's dr_mode anymore because the USB2 PHY
  can only be switched into host mode if the USB3 PHY knows about it.
  Thus auto-detecting the mode doesn't work for this PHY so it's removed
  in patch #3
- do not log an error message when the phy-supply is not ready yet and
  we have to return -EPROBE_DEFER
- improve the naming of some U2P_R2 test mode registers


changes since v1 at [0]:
- collected Rob's Reviewed-by on patch #1 and Yixun's Tested-by
- rebased on top of v4.16-rc1


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006293.html


Martin Blumenstingl (5):
  dt-bindings: phy: meson-gxl-usb2-phy: add the reset line and clock
  phy: amlogic: phy-meson-gxl-usb2: support the clock and reset line
  phy: amlogic: phy-meson-gxl-usb2: default to host mode
  phy: amlogic: phy-meson-gxl-usb2: don't log an error on -EPROBE_DEFER
  phy: amlogic: phy-meson-gxl-usb2: rename some of the U2P_R2 registers

 .../devicetree/bindings/phy/meson-gxl-usb2-phy.txt |  4 ++
 drivers/phy/amlogic/Kconfig                        |  1 -
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 78 ++++++++++++++++------
 3 files changed, 61 insertions(+), 22 deletions(-)

-- 
2.16.1
