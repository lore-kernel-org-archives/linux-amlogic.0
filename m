From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri,  9 Nov 2018 16:26:57 +0100
Subject: [PATCH u-boot 18/19] ARM: meson: factorize common code out amlogic's
 boards
In-Reply-To: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1541777218-472-19-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Now we have moved all the Amlogic board support to common generic board code,
we can move the identical board_init() and ft_board_setup() functions to
weak functions into the board-common mach-meson file.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/mach-meson/board-common.c  | 17 +++++++++++++++++
 board/amlogic/odroid-c2/odroid-c2.c | 12 ------------
 board/amlogic/p212/p212.c           | 12 ------------
 board/amlogic/q200/q200.c           | 12 ------------
 board/amlogic/s400/s400.c           | 12 ------------
 5 files changed, 17 insertions(+), 48 deletions(-)

diff --git a/arch/arm/mach-meson/board-common.c b/arch/arm/mach-meson/board-common.c
index 0446507..249e0d9 100644
--- a/arch/arm/mach-meson/board-common.c
+++ b/arch/arm/mach-meson/board-common.c
@@ -14,6 +14,11 @@
 
 DECLARE_GLOBAL_DATA_PTR;
 
+__weak int board_init(void)
+{
+	return 0;
+}
+
 int dram_init(void)
 {
 	const fdt64_t *val;
@@ -34,6 +39,18 @@ int dram_init(void)
 	return 0;
 }
 
+__weak int meson_ft_board_setup(void *blob, bd_t *bd)
+{
+	return 0;
+}
+
+int ft_board_setup(void *blob, bd_t *bd)
+{
+	meson_init_reserved_memory(blob);
+
+	return meson_ft_board_setup(blob, bd);
+}
+
 void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
 {
 	int ret;
diff --git a/board/amlogic/odroid-c2/odroid-c2.c b/board/amlogic/odroid-c2/odroid-c2.c
index d784d6b..62f0f4c 100644
--- a/board/amlogic/odroid-c2/odroid-c2.c
+++ b/board/amlogic/odroid-c2/odroid-c2.c
@@ -17,11 +17,6 @@
 #define EFUSE_MAC_OFFSET	52
 #define EFUSE_MAC_SIZE		6
 
-int board_init(void)
-{
-	return 0;
-}
-
 int misc_init_r(void)
 {
 	u8 mac_addr[EFUSE_MAC_SIZE];
@@ -46,10 +41,3 @@ int misc_init_r(void)
 
 	return 0;
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/p212/p212.c b/board/amlogic/p212/p212.c
index 33992a2..546c4d9 100644
--- a/board/amlogic/p212/p212.c
+++ b/board/amlogic/p212/p212.c
@@ -18,11 +18,6 @@
 #define EFUSE_MAC_OFFSET	52
 #define EFUSE_MAC_SIZE		6
 
-int board_init(void)
-{
-	return 0;
-}
-
 int misc_init_r(void)
 {
 	u8 mac_addr[EFUSE_MAC_SIZE];
@@ -48,10 +43,3 @@ int misc_init_r(void)
 
 	return 0;
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/q200/q200.c b/board/amlogic/q200/q200.c
index b59c11b..6db1b26 100644
--- a/board/amlogic/q200/q200.c
+++ b/board/amlogic/q200/q200.c
@@ -18,11 +18,6 @@
 #define EFUSE_MAC_OFFSET	52
 #define EFUSE_MAC_SIZE		6
 
-int board_init(void)
-{
-	return 0;
-}
-
 int misc_init_r(void)
 {
 	u8 mac_addr[EFUSE_MAC_SIZE];
@@ -53,10 +48,3 @@ int misc_init_r(void)
 
 	return 0;
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_init_reserved_memory(blob);
-
-	return 0;
-}
diff --git a/board/amlogic/s400/s400.c b/board/amlogic/s400/s400.c
index c2b50f6..02a0e92 100644
--- a/board/amlogic/s400/s400.c
+++ b/board/amlogic/s400/s400.c
@@ -13,21 +13,9 @@
 #include <asm/arch/eth.h>
 #include <asm/arch/mem.h>
 
-int board_init(void)
-{
-	return 0;
-}
-
 int misc_init_r(void)
 {
 	meson_eth_init(PHY_INTERFACE_MODE_RGMII, 0);
 
 	return 0;
 }
-
-int ft_board_setup(void *blob, bd_t *bd)
-{
-	meson_init_reserved_memory(blob);
-
-	return 0;
-}
-- 
2.7.4
