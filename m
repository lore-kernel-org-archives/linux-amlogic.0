From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 4 Jan 2017 12:14:22 +0100
Subject: [GIT PULL] drm/meson fixes for 4.10
Message-ID: <8157f476-f2ac-18b9-ddd6-01fd06e3dbd7@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Dear DRM/DRI Maintainer,

Please pull this meson DRM fixes for v4.10.

The following changes since commit 0c744ea4f77d72b3dcebb7a8f2684633ec79be88:

  Linux 4.10-rc2 (2017-01-01 14:31:53 -0800)

are available in the git repository at:

  git://people.freedesktop.org/~narmstrong/linux tags/meson-drm-fixes-for-4.10

for you to fetch changes up to 5db60ea93d4fbf146c8f7ca286b8b2a091761460:

  drm/meson: Fix CVBS VDAC disable (2017-01-04 12:09:30 +0100)

----------------------------------------------------------------
- plan atomic check oops fix
- fix CVBS init when HDMI is configured by bootloader
- fix CVBS VDAC disable

----------------------------------------------------------------
Neil Armstrong (3):
      drm/meson: Fix plane atomic check when no crtc for the plane
      drm/meson: Fix CVBS initialization when HDMI is configured by bootloader
      drm/meson: Fix CVBS VDAC disable

 drivers/gpu/drm/meson/meson_plane.c     |  3 +++
 drivers/gpu/drm/meson/meson_venc.c      | 19 +++++++++++++++++++
 drivers/gpu/drm/meson/meson_venc_cvbs.c |  2 +-
 3 files changed, 23 insertions(+), 1 deletion(-)

Thanks,
Neil
