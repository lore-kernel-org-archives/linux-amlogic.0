From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 16:29:04 +0200
Subject: [PATCH v2 u-boot 0/3] Add USB Support for Amlogic Meson GXL SoCs
Message-ID: <1523456947-4242-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset adds support for USB for the Amlogic Meson GXL SoCs following
the work done for Linux by Martin Blumenstingl at [1] [2] [3].

The support consist of :
 - A port of dwc3-of-simple from Linux to U-boot
 - A change to support more than 2 PHYs in the DWC3 DM driver
 - An USB2 PHY Driver and an USB3 PHY Driver

The DWC3 Controller has up to 4 PHYs connected :
 - 2 USB2 PHYs and an USB3 PHY for GXL SoCs
 - 3 USB2 PHYs and an USB3 PHY for the GXM SoC Variant
This is enabled by the "usb: host: dwc3: Add support for multiple PHYs" patch.
This patch is based on the "xhci-dwc3: Couple of fixes for USB3 support"
serie from Vignesh R, on the u-boot-usb tree.

The DWC3 Controller glue is generic enough to use the dwc3-of-simple from Linux
and can be easily ported to U-Boot as a Simple-Bus with Glue-Specific clocks
and Reset lines setup.

This depends on the recently applied :
 - clk: Add get/enable/disable/release for a bulk of clocks at [4]
 - reset: Add get/assert/deassert/release for bulk of reset signals at [5]
in order to manage the clocks and resets of the Glue in a clean fashion.

The USB PHY driver supports the standard generic PHY interface and supports
the power-on/off calls and set the Host mode by default.
They are based on the excellent work from Martin Blumenstingl merged in linux.

Changes since v1:
 - switch to submitted clk/reset bulk API
 - splitted dwc3 multiple phy init error between poweroff & exit

[1] https://lkml.kernel.org/r/20180303184700.21480-1-martin.blumenstingl at googlemail.com
[2] https://lkml.kernel.org/r/20180128202245.25021-1-martin.blumenstingl at googlemail.com
[3] https://lkml.kernel.org/r/20180303214309.25643-1-martin.blumenstingl at googlemail.com
[4] http://lists.infradead.org/pipermail/linux-amlogic/2018-April/006952.html
[5] http://lists.infradead.org/pipermail/linux-amlogic/2018-April/006949.html

Neil Armstrong (3):
  usb: host: Add simple of glue driver for DWC3 USB Controllers
    integration
  usb: host: dwc3: Add support for multiple PHYs
  phy: Add Amlogic Meson USB2 & USB3 Generic PHY drivers

 drivers/phy/Kconfig               |   8 ++
 drivers/phy/Makefile              |   1 +
 drivers/phy/meson-gxl-usb2.c      | 238 ++++++++++++++++++++++++++++++++++++++
 drivers/phy/meson-gxl-usb3.c      | 201 ++++++++++++++++++++++++++++++++
 drivers/usb/host/Kconfig          |   7 ++
 drivers/usb/host/Makefile         |   1 +
 drivers/usb/host/dwc3-of-simple.c | 123 ++++++++++++++++++++
 drivers/usb/host/xhci-dwc3.c      | 113 ++++++++++--------
 8 files changed, 645 insertions(+), 47 deletions(-)
 create mode 100644 drivers/phy/meson-gxl-usb2.c
 create mode 100644 drivers/phy/meson-gxl-usb3.c
 create mode 100644 drivers/usb/host/dwc3-of-simple.c

-- 
2.7.4
