From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 09 Dec 2016 17:27:12 +0100
Subject: [RESEND GIT PULL] drm: Add support for the Amlogic Video Processing
 Unit
Message-ID: <584ADB60.3030305@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

[Resent pull request using an HTTPS github URL]

Dear DRM/DRI Maintainer,

The following changes since commit bc33b0ca11e3df467777a4fa7639ba488c9d4911:

  Linux 4.9-rc4 (2016-11-05 16:23:36 -0700)

are available in the git repository at:

  https://github.com/superna9999/linux.git tags/meson-drm-for-4.10

for you to fetch changes up to 1de7ac686bbc5db809ab97eb715ce926a3c41a9c:

  MAINTAINERS: add entry for Amlogic DRM drivers (2016-12-06 09:54:15 +0100)

----------------------------------------------------------------
Add support for the Amlogic Meson Video Processing Unit
- Only CVBS/Composite output for Amlogic Meson GXBB/GXL/GXM SoCs
- Add MAINTAINERS entry
- Add DT bindings documentation

----------------------------------------------------------------
Neil Armstrong (3):
      drm: Add support for Amlogic Meson Graphic Controller
      dt-bindings: display: add Amlogic Meson DRM Bindings
      MAINTAINERS: add entry for Amlogic DRM drivers

 .../bindings/display/amlogic,meson-vpu.txt         |  112 ++
 MAINTAINERS                                        |    9 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/meson/Kconfig                      |    9 +
 drivers/gpu/drm/meson/Makefile                     |    4 +
 drivers/gpu/drm/meson/meson_canvas.c               |   68 +
 drivers/gpu/drm/meson/meson_canvas.h               |   42 +
 drivers/gpu/drm/meson/meson_crtc.c                 |  208 +++
 drivers/gpu/drm/meson/meson_crtc.h                 |   32 +
 drivers/gpu/drm/meson/meson_drv.c                  |  343 +++++
 drivers/gpu/drm/meson/meson_drv.h                  |   59 +
 drivers/gpu/drm/meson/meson_plane.c                |  230 ++++
 drivers/gpu/drm/meson/meson_plane.h                |   30 +
 drivers/gpu/drm/meson/meson_registers.h            | 1395 ++++++++++++++++++++
 drivers/gpu/drm/meson/meson_vclk.c                 |  167 +++
 drivers/gpu/drm/meson/meson_vclk.h                 |   34 +
 drivers/gpu/drm/meson/meson_venc.c                 |  254 ++++
 drivers/gpu/drm/meson/meson_venc.h                 |   72 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c            |  293 ++++
 drivers/gpu/drm/meson/meson_venc_cvbs.h            |   41 +
 drivers/gpu/drm/meson/meson_viu.c                  |  331 +++++
 drivers/gpu/drm/meson/meson_viu.h                  |   64 +
 drivers/gpu/drm/meson/meson_vpp.c                  |  162 +++
 drivers/gpu/drm/meson/meson_vpp.h                  |   35 +
 25 files changed, 3997 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
 create mode 100644 drivers/gpu/drm/meson/Kconfig
 create mode 100644 drivers/gpu/drm/meson/Makefile
 create mode 100644 drivers/gpu/drm/meson/meson_canvas.c
 create mode 100644 drivers/gpu/drm/meson/meson_canvas.h
 create mode 100644 drivers/gpu/drm/meson/meson_crtc.c
 create mode 100644 drivers/gpu/drm/meson/meson_crtc.h
 create mode 100644 drivers/gpu/drm/meson/meson_drv.c
 create mode 100644 drivers/gpu/drm/meson/meson_drv.h
 create mode 100644 drivers/gpu/drm/meson/meson_plane.c
 create mode 100644 drivers/gpu/drm/meson/meson_plane.h
 create mode 100644 drivers/gpu/drm/meson/meson_registers.h
 create mode 100644 drivers/gpu/drm/meson/meson_vclk.c
 create mode 100644 drivers/gpu/drm/meson/meson_vclk.h
 create mode 100644 drivers/gpu/drm/meson/meson_venc.c
 create mode 100644 drivers/gpu/drm/meson/meson_venc.h
 create mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c
 create mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.h
 create mode 100644 drivers/gpu/drm/meson/meson_viu.c
 create mode 100644 drivers/gpu/drm/meson/meson_viu.h
 create mode 100644 drivers/gpu/drm/meson/meson_vpp.c
 create mode 100644 drivers/gpu/drm/meson/meson_vpp.h

Thanks,
Neil
