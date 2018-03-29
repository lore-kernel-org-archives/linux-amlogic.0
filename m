From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 14:56:02 +0200
Subject: [PATCH] serial: meson: Update compatible with new Linux bindings
Message-ID: <1522328162-13786-1-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson SoCs serial bindings were not written when serial
support was pushed into Linux and U-Boot.
A clean bindings document has been merged into Linux tree to correctly
handle the multiple clocks feeding the serial peripheral.
This update the U-Boot serial_meson driver with the new compatible
string for Amlogic Meson GX Socs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/serial/serial_meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/serial/serial_meson.c b/drivers/serial/serial_meson.c
index 363affb..6412ca6 100644
--- a/drivers/serial/serial_meson.c
+++ b/drivers/serial/serial_meson.c
@@ -125,6 +125,7 @@ static const struct dm_serial_ops meson_serial_ops = {
 
 static const struct udevice_id meson_serial_ids[] = {
 	{ .compatible = "amlogic,meson-uart" },
+	{ .compatible = "amlogic,meson-gx-uart" },
 	{ }
 };
 
-- 
2.7.4
