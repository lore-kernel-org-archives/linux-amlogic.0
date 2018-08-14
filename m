From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 14 Aug 2018 15:07:53 +0200
Subject: [PATCH u-boot 2/3] boards: amlogic: use common function for
 environment initialization
In-Reply-To: <20180814130754.19294-1-b.galvani@gmail.com>
References: <20180814130754.19294-1-b.galvani@gmail.com>
Message-ID: <20180814130754.19294-3-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Clean up board files by moving the duplicate environment
initialization to arch code.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/include/asm/arch-meson/sm.h      |  1 +
 arch/arm/mach-meson/sm.c                  | 27 +++++++++++++++++++++++
 board/amlogic/khadas-vim/khadas-vim.c     | 25 +--------------------
 board/amlogic/libretech-cc/libretech-cc.c | 25 +--------------------
 board/amlogic/nanopi-k2/nanopi-k2.c       | 25 +--------------------
 board/amlogic/odroid-c2/odroid-c2.c       | 25 +--------------------
 board/amlogic/p212/p212.c                 | 25 +--------------------
 7 files changed, 33 insertions(+), 120 deletions(-)

diff --git a/arch/arm/include/asm/arch-meson/sm.h b/arch/arm/include/asm/arch-meson/sm.h
index 83d6441803..db2be38fc5 100644
--- a/arch/arm/include/asm/arch-meson/sm.h
+++ b/arch/arm/include/asm/arch-meson/sm.h
@@ -7,5 +7,6 @@
 #define __MESON_SM_H__
 
 ssize_t meson_sm_read_efuse(uintptr_t offset, void *buffer, size_t size);
+void meson_init_env_from_efuse(void);
 
 #endif /* __MESON_SM_H__ */
diff --git a/arch/arm/mach-meson/sm.c b/arch/arm/mach-meson/sm.c
index 0bba5e4a07..2628591fe6 100644
--- a/arch/arm/mach-meson/sm.c
+++ b/arch/arm/mach-meson/sm.c
@@ -6,6 +6,7 @@
  */
 
 #include <common.h>
+#include <environment.h>
 #include <asm/arch/gx.h>
 #include <linux/kernel.h>
 
@@ -14,6 +15,11 @@
 #define FN_EFUSE_READ			0x82000030
 #define FN_EFUSE_WRITE			0x82000031
 
+#define EFUSE_SN_OFFSET		20
+#define EFUSE_SN_SIZE		16
+#define EFUSE_MAC_OFFSET	52
+#define EFUSE_MAC_SIZE		6
+
 static void *shmem_input;
 static void *shmem_output;
 
@@ -54,3 +60,24 @@ ssize_t meson_sm_read_efuse(uintptr_t offset, void *buffer, size_t size)
 
 	return regs.regs[0];
 }
+
+void meson_init_env_from_efuse(void)
+{
+	static u8 mac[EFUSE_MAC_SIZE];
+	char serial[EFUSE_SN_SIZE];
+	ssize_t len;
+
+	if (!eth_env_get_enetaddr("ethaddr", mac)) {
+		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
+					  mac, EFUSE_MAC_SIZE);
+		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac))
+			eth_env_set_enetaddr("ethaddr", mac);
+	}
+
+	if (!env_get("serial#")) {
+		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
+					  EFUSE_SN_SIZE);
+		if (len == EFUSE_SN_SIZE)
+			env_set("serial#", serial);
+	}
+}
diff --git a/board/amlogic/khadas-vim/khadas-vim.c b/board/amlogic/khadas-vim/khadas-vim.c
index 692bf2add3..4483a96761 100644
--- a/board/amlogic/khadas-vim/khadas-vim.c
+++ b/board/amlogic/khadas-vim/khadas-vim.c
@@ -6,18 +6,12 @@
 
 #include <common.h>
 #include <dm.h>
-#include <environment.h>
 #include <asm/io.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/mem.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
 int board_init(void)
 {
 	return 0;
@@ -25,26 +19,9 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
 			  MESON_GXL_USE_INTERNAL_RMII_PHY);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-					  EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
+	meson_init_env_from_efuse();
 
 	return 0;
 }
diff --git a/board/amlogic/libretech-cc/libretech-cc.c b/board/amlogic/libretech-cc/libretech-cc.c
index ccab1272c5..86b1d213ff 100644
--- a/board/amlogic/libretech-cc/libretech-cc.c
+++ b/board/amlogic/libretech-cc/libretech-cc.c
@@ -6,18 +6,12 @@
 
 #include <common.h>
 #include <dm.h>
-#include <environment.h>
 #include <asm/io.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
 int board_init(void)
 {
 	return 0;
@@ -25,26 +19,9 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII,
 			  MESON_GXL_USE_INTERNAL_RMII_PHY);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-					  EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
+	meson_init_env_from_efuse();
 
 	return 0;
 }
diff --git a/board/amlogic/nanopi-k2/nanopi-k2.c b/board/amlogic/nanopi-k2/nanopi-k2.c
index ae29dd6fa4..e61c23f8c6 100644
--- a/board/amlogic/nanopi-k2/nanopi-k2.c
+++ b/board/amlogic/nanopi-k2/nanopi-k2.c
@@ -5,18 +5,12 @@
 
 #include <common.h>
 #include <dm.h>
-#include <environment.h>
 #include <asm/io.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
 int board_init(void)
 {
 	return 0;
@@ -24,25 +18,8 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
+	meson_init_env_from_efuse();
 
 	return 0;
 }
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index 2a2755c387..fffd225485 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -5,18 +5,12 @@
 
 #include <common.h>
 #include <dm.h>
-#include <environment.h>
 #include <asm/io.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
 int board_init(void)
 {
 	return 0;
@@ -24,25 +18,8 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE) 
-			env_set("serial#", serial);
-	}
+	meson_init_env_from_efuse();
 
 	return 0;
 }
diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index 06c2eaee47..57f776f404 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -6,18 +6,12 @@
 
 #include <common.h>
 #include <dm.h>
-#include <environment.h>
 #include <asm/io.h>
 #include <asm/arch/gx.h>
 #include <asm/arch/sm.h>
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-#define EFUSE_SN_OFFSET		20
-#define EFUSE_SN_SIZE		16
-#define EFUSE_MAC_OFFSET	52
-#define EFUSE_MAC_SIZE		6
-
 int board_init(void)
 {
 	return 0;
@@ -25,25 +19,8 @@ int board_init(void)
 
 int misc_init_r(void)
 {
-	u8 mac_addr[EFUSE_MAC_SIZE];
-	char serial[EFUSE_SN_SIZE];
-	ssize_t len;
-
 	meson_gx_eth_init(PHY_INTERFACE_MODE_RMII, 0);
-
-	if (!eth_env_get_enetaddr("ethaddr", mac_addr)) {
-		len = meson_sm_read_efuse(EFUSE_MAC_OFFSET,
-					  mac_addr, EFUSE_MAC_SIZE);
-		if (len == EFUSE_MAC_SIZE && is_valid_ethaddr(mac_addr))
-			eth_env_set_enetaddr("ethaddr", mac_addr);
-	}
-
-	if (!env_get("serial#")) {
-		len = meson_sm_read_efuse(EFUSE_SN_OFFSET, serial,
-			EFUSE_SN_SIZE);
-		if (len == EFUSE_SN_SIZE)
-			env_set("serial#", serial);
-	}
+	meson_init_env_from_efuse();
 
 	return 0;
 }
-- 
2.17.1
