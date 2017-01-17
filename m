From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 17 Jan 2017 13:31:30 +0100
Subject: [RFC/RFT PATCH 0/4] drm/bridge: dw-hdmi: Add support for Custom PHYs
Message-ID: <1484656294-6140-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic GX SoCs implements a Synopsys DesignWare HDMI TX Controller
in combination with a very custom PHY.

Thanks to Laurent Pinchart's changes, the HW report the following :
 Detected HDMI TX controller v2.01a with HDCP (Vendor PHY)

The following differs from common PHY integration as managed in the current
driver :
 - Amlogic PHY is not configured through the internal I2C link
 - Amlogic PHY do not use the ENTMDS, SVSRET, PDDQ, ... signals from the controller
 - Amlogic PHY do not export HPD ands RxSense signals to the controller

And finally, concerning the controller integration :
 - the Controller registers are not flat memory-mapped, and uses an
    addr+read/write register pair to write all registers.
 - Inputs only YUV444 pixel data

This is why the following patchset implements :
 - Conversion to regmap for register access
 - Add more callbacks ops to handle Custom PHYs
 - Configure the Input format from the plat_data
 - Fixes a bug that considers the input to be always RBG and sends bad pixel
   format to a DVI sink by disabling CSC

This patchset makes the Amlogix GX SoCs HDMI output successfully work, but I
do not have access to Renesas, i.MX or RockChip SoCs to test against
potentiel regressions, like the regmap conversion.

This patchset is based on the latest Laurent Pinchart dw-hdmi serie at [1].

[1] http://lkml.kernel.org/r/20170117082910.27023-1-laurent.pinchart+renesas at ideasonboard.com

Neil Armstrong (4):
  drm/bridge: dw-hdmi: Switch to regmap for register access
  drm/bridge: dw-hdmi: Add support for custom PHY handling
  drm/bridge: dw-hdmi: Enable CSC even for DVI
  drm/bridge: dw-hdmi: Take input format from plat_data

 drivers/gpu/drm/bridge/dw-hdmi.c | 194 +++++++++++++++++++++++++--------------
 include/drm/bridge/dw_hdmi.h     |  18 ++++
 2 files changed, 143 insertions(+), 69 deletions(-)

-- 
1.9.1
