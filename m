From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:46 +0100
Subject: [PATCH u-boot 07/19] configs: meson: change default load addresses
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-8-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

The original chosen addresses conflict with the BL2 initialisation.
So far there was no issue with them but if we preload binaries in
RAM (ROMUSB boot) before running the BL2 they get corrupted by the
execution of BL2 init.

If we load them around 0x08000000, there is no such issue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/configs/meson64.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/configs/meson64.h b/include/configs/meson64.h
index 1929a3e..80c883e 100644
--- a/include/configs/meson64.h
+++ b/include/configs/meson64.h
@@ -41,9 +41,9 @@
 
 #ifndef CONFIG_EXTRA_ENV_SETTINGS
 #define CONFIG_EXTRA_ENV_SETTINGS \
-	"fdt_addr_r=0x01000000\0" \
-	"scriptaddr=0x1f000000\0" \
-	"kernel_addr_r=0x01080000\0" \
+	"fdt_addr_r=0x08008000\0" \
+	"scriptaddr=0x08000000\0" \
+	"kernel_addr_r=0x08080000\0" \
 	"pxefile_addr_r=0x01080000\0" \
 	"ramdisk_addr_r=0x13000000\0" \
 	"fdtfile=amlogic/" CONFIG_DEFAULT_DEVICE_TREE ".dtb\0" \
-- 
2.7.4
