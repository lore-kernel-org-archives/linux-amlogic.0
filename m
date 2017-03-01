From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed,  1 Mar 2017 10:20:18 +0100
Subject: [PATCH] MAINTAINERS: drm-meson: Update git entries
Message-ID: <1488360018-16835-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the main git entry and the drm-misc experiment git for small
patches.

Cc: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 527d137..98e8d6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4182,6 +4182,8 @@ W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/gpu/drm/meson/
 F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+T:	git git://anongit.freedesktop.org/drm/drm-meson
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR EXYNOS
 M:	Inki Dae <inki.dae@samsung.com>
-- 
1.9.1
