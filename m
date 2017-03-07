From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue,  7 Mar 2017 17:42:18 +0100
Subject: [PATCH v3 0/6] drm: bridge: dw-hdmi: Add support for Custom PHYs
Message-ID: <1488904944-14285-1-git-send-email-narmstrong@baylibre.com>
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

Most of these uses case are implemented in Laurent Pinchart v5.1 patchset at [3] :
 - Conversion to regmap for register access
 - Add more callbacks ops to handle Custom PHYs
 - Fixes a bug that considers the input to be always RBG and sends bad pixel
   format to a DVI sink by disabling CSC

This is why the following patchset implements :
 - Configure the Input format from the plat_data
 - Add PHY callback to handle HPD and RxSense out of the dw-hdmi driver

To implement the input format handling, the Synopsys HDMIT TX Controller input
V4L bus formats are used and missing formats + documentation are added.

This patchset makes the Amlogic GX SoCs HDMI output successfully work, and is
also tested on the RK3288 ACT8846 EVB Board.

Changes since v2 at [4] :
 - Rebase on laurent patch "Extract PHY interrupt setup to a function"
 - Reduce phy operations
 - Switch the V4L bus formats and encodings instead of custom enum

Changes since v1 at [2] :
 - Drop patches submitted by laurent

Changes since RFC at [1] :
 - Regmap fixup for 4bytes register access, tested on RK3288 SoC
 - Move phy callbacks to phy_ops and move Synopsys PHY calls into default ops
 - Move HDMI link data into shared header
 - Move Pixel Encoding enum to shared header

[1] http://lkml.kernel.org/r/1484656294-6140-1-git-send-email-narmstrong at baylibre.com
[2] http://lkml.kernel.org/r/1485774318-21916-1-git-send-email-narmstrong at baylibre.com
[3] http://lkml.kernel.org/r/20170303172007.26541-1-laurent.pinchart+renesas at ideasonboard.com
[4] http://lkml.kernel.org/r/1488468572-31971-1-git-send-email-narmstrong at baylibre.com

Laurent Pinchart (1):
  drm: bridge: dw-hdmi: Extract PHY interrupt setup to a function

Neil Armstrong (5):
  media: uapi: Add RGB and YUV bus formats for Synopsys HDMI TX
    Controller
  documentation: media: Add documentation for new RGB and YUV bus
    formats
  drm: bridge: dw-hdmi: Switch to V4L bus format and encodings
  drm: bridge: dw-hdmi: Add Documentation on supported input formats
  drm: bridge: dw-hdmi: Move HPD handling to PHY operations

 Documentation/gpu/dw-hdmi.rst                   |   15 +
 Documentation/gpu/index.rst                     |    1 +
 Documentation/media/uapi/v4l/subdev-formats.rst | 4992 ++++++++++++++++++-----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c       |  465 ++-
 include/drm/bridge/dw_hdmi.h                    |   68 +
 include/uapi/linux/media-bus-format.h           |   13 +-
 6 files changed, 4368 insertions(+), 1186 deletions(-)
 create mode 100644 Documentation/gpu/dw-hdmi.rst

-- 
1.9.1
