From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:40:54 +0100
Subject: [PATCH 1/4] i2c: meson: improve Kconfig description
In-Reply-To: <20171126164057.27728-1-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
Message-ID: <20171126164057.27728-2-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Expand the Kconfig description with hardware features.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/i2c/Kconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/Kconfig b/drivers/i2c/Kconfig
index 1989f8eb57..a7931aa6d4 100644
--- a/drivers/i2c/Kconfig
+++ b/drivers/i2c/Kconfig
@@ -141,7 +141,12 @@ config SYS_I2C_MESON
 	bool "Amlogic Meson I2C driver"
 	depends on DM_I2C && ARCH_MESON
 	help
-	  Add support for the Amlogic Meson I2C driver.
+	  Add support for the I2C controller available in Amlogic Meson
+	  SoCs. The controller supports programmable bus speed including
+	  standard (100kbits/s) and fast (400kbit/s) speed and allows the
+	  software to define a flexible format of the bit streams. It has an
+	  internal buffer holding up to 8 bytes for transfers and supports
+	  both 7-bit and 10-bit addresses.
 
 config SYS_I2C_MXC
 	bool "NXP i.MX I2C driver"
-- 
2.14.3
