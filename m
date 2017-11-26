From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:40:55 +0100
Subject: [PATCH 2/4] i2c: meson: reduce timeout
In-Reply-To: <20171126164057.27728-1-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
Message-ID: <20171126164057.27728-3-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The datasheet doesn't specify a suggested timeout and 500ms seems very
long: reduce it to 100ms.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/i2c/meson_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
index 2434d9ed53..84e1997c76 100644
--- a/drivers/i2c/meson_i2c.c
+++ b/drivers/i2c/meson_i2c.c
@@ -9,7 +9,7 @@
 #include <dm.h>
 #include <i2c.h>
 
-#define I2C_TIMEOUT_MS		500
+#define I2C_TIMEOUT_MS		100
 
 /* Control register fields */
 #define REG_CTRL_START		BIT(0)
-- 
2.14.3
