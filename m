From: hverkuil@xs4all.nl (Hans Verkuil)
Date: Fri, 23 Mar 2018 13:59:12 +0100
Subject: [PATCHv2 0/3] dw-hdmi: add property to disable CEC
Message-ID: <20180323125915.13986-1-hverkuil@xs4all.nl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Some boards (amlogic) have two CEC controllers: the DesignWare controller
and their own CEC controller (meson ao-cec).

Since the CEC line is not hooked up to the DW controller we need a way
to disable that controller. This patch series adds the cec-disable
property for that purpose.

Regards,

	Hans

Changes since v1:

- Move the dts change to meson-gx.dtsi since according to Neil it is
  valid for all meson-gx boards.
- Fix bad subject line of patch 1.

Hans Verkuil (3):
  dt-bindings: display: dw_hdmi.txt: add cec-disable property
  drm: bridge: dw-hdmi: check the cec-disable property
  arm64: dts: meson-gx.dtsi: add cec-disable

 Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                    | 3 ++-
 3 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.15.1
