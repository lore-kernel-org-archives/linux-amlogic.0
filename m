From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 23 Nov 2018 15:02:16 +0100
Subject: [PATCH RFC 3/8] drm/meson: add support for HDMI2.0 2160p modes
In-Reply-To: <20181123140221.15700-1-narmstrong@baylibre.com>
References: <20181123140221.15700-1-narmstrong@baylibre.com>
Message-ID: <20181123140221.15700-4-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now we support the TMDS Clock > 3.4GHz and support the SCDC Control
operation in the DW-HDMI Controller, we can enable support for the
HDMI2.0 3840x2160 at 60/50 RGB444 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 0fbe525b94c8..1bcd642b6e42 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -848,6 +848,8 @@ struct meson_hdmi_venc_vic_mode {
 	{ 93, &meson_hdmi_encp_mode_2160p24 },
 	{ 94, &meson_hdmi_encp_mode_2160p25 },
 	{ 95, &meson_hdmi_encp_mode_2160p30 },
+	{ 96, &meson_hdmi_encp_mode_2160p25 },
+	{ 97, &meson_hdmi_encp_mode_2160p30 },
 	{ 0, NULL}, /* sentinel */
 };
 
-- 
2.19.1
