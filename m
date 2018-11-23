From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 23 Nov 2018 15:02:13 +0100
Subject: [PATCH RFC 0/8] drm/meson: Add support for HDMI2.0 4k60
Message-ID: <20181123140221.15700-1-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patchset aims to add support for the following HDMI2.0 4k60 modes:
- 594Mhz TMDS frequency needing TMDS Scramling and 1/40 rate for RGB/YUV4:4:4
- 297MHz TMDS frequency with YUV4:2:0 encoding

The first mode uses the SCDC helpers introduced by intel to :
- discover where the monitor support SCDC
- setup the SCDC parameters
This is implemented in the dw-hdmi bridge driver by handling scrambling
support during the bridge setup and by exporting an helper for the PHY
setup to setup the SCDC configuration for the 1/40 TMDS rate.
This code will only be active if the encoder support a TMDS rate > 340MHz.

The second mode is implemented by added the missing 4:2:0 bypass handling
in the dw-hdmi bridge driver and adding a "mtmdsclock" separating the
pixel clock from the tmds clock in the mode setup phase.
We also enable support for these modes in the connector only if the platform
glue code explicits the support.

The remaining patches adds support for :
- 1/40 TMDS rate aka DIV40 in the dw-hdmi meson PHY setup
- 4:2:0 output and clock setup

The dw-hdmi support re-uses the support done by Rockchip engineers on the
Linux 4.4 BSP kernel.

These modes has been validated using a MuxLab HDMI Signal Analyser in
addition to different UHD TVs supporting full 4k60 or the 4:2:0 variant.

Neil Armstrong (7):
  drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support
  drm/meson: add HDMI div40 TMDS mode
  drm/meson: add support for HDMI2.0 2160p modes
  drm/bridge: dw-hdmi: add support for YUV420 output
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: Add YUV420 output support
  drm/meson: Output in YUV444 if sink supports it

Zheng Yang (1):
  drm/bridge: dw-hdmi: support dynamically get input/out color info

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 136 ++++++++++++++++++----
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h |   1 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 129 +++++++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  95 +++++++++++----
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   8 +-
 drivers/gpu/drm/meson/meson_venc.h        |  11 ++
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   7 ++
 9 files changed, 330 insertions(+), 67 deletions(-)

-- 
2.19.1
