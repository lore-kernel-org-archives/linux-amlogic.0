From: ben.dooks@codethink.co.uk (Ben Dooks)
Date: Tue,  5 Jul 2016 19:24:03 +0100
Subject: [PATCHv2] i2c: meson: allow build with COMPILE_TEST
In-Reply-To: <1467742788-16431-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1467742788-16431-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <1467743043-18703-1-git-send-email-ben.dooks@codethink.co.uk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Ben Dooks <ben-linux@fluff.org>

This driver could be included in COMPILE_TEST so allow it to be
compiled when COMPILE_TEST is selected.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: linux-amlogic at lists.infradead.org
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c at vger.kernel.org
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index efa3d9b..1a6f2de 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -637,7 +637,7 @@ config I2C_LPC2K
 
 config I2C_MESON
 	tristate "Amlogic Meson I2C controller"
-	depends on ARCH_MESON
+	depends on ARCH_MESON || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface on the Amlogic Meson family of SoCs.
-- 
2.8.1
