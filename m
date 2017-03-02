From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu,  2 Mar 2017 16:29:30 +0100
Subject: [PATCH v2 0/2] drm: bridge: dw-hdmi: Add support for Custom PHYs
Message-ID: <1488468572-31971-1-git-send-email-narmstrong@baylibre.com>
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

Most of these uses case are implemented in Laurent Pinchart v4 patchset at [3] :
 - Conversion to regmap for register access
 - Add more callbacks ops to handle Custom PHYs
 - Fixes a bug that considers the input to be always RBG and sends bad pixel
   format to a DVI sink by disabling CSC

This is why the following patchset implements :
 - Configure the Input format from the plat_data
 - Add PHY callback to handle HPD and RxSens out of the dw-hdmi drive

This patchset makes the Amlogix GX SoCs HDMI output successfully work, and is
also tested on the RK3288 ACT8846 EVB Board.

Changes since v1 at [2] :

Changes since RFC at [1] :
 - Regmap fixup for 4bytes register access, tested on RK3288 SoC
 - Move phy callbacks to phy_ops and move Synopsys PHY calls into default ops
 - Move HDMI link data into shared header
 - Move Pixel Encoding enum to shared header

[1] http://lkml.kernel.org/r/1484656294-6140-1-git-send-email-narmstrong at baylibre.com
[2] http://lkml.kernel.org/r/1485774318-21916-1-git-send-email-narmstrong at baylibre.com
[3] http://lkml.kernel.org/r/20170301223915.29888-1-laurent.pinchart+renesas at ideasonboard.com


Neil Armstrong (2):
  drm: bridge: dw-hdmi: Take input format from plat_data
  drm: bridge: Move HPD handling to PHY operations

 drivers/gpu/drm/bridge/dw-hdmi.c | 193 +++++++++++++++++++++++++--------------
 include/drm/bridge/dw_hdmi.h     |  17 ++++
 2 files changed, 143 insertions(+), 67 deletions(-)

-- 
1.9.1
