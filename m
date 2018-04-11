From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 17:40:41 +0200
Subject: [PATCH u-boot 2/2] pinctrl: meson: Update pinmux with new Linux
 bindings
In-Reply-To: <1523461241-30436-1-git-send-email-narmstrong@baylibre.com>
References: <1523461241-30436-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1523461241-30436-3-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The pinctrl bindings has changed for Amlogic Meson SoCs since Linux 4.13,
update the pinctrl driver to take this in account.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 12 ++++++------
 drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 14 +++++++-------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
index 87c9912..928356f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
@@ -14,7 +14,7 @@
 
 #include "pinctrl-meson.h"
 
-#define EE_OFF	14
+#define EE_OFF	15
 
 static const unsigned int emmc_nand_d07_pins[] = {
 	PIN(BOOT_0, EE_OFF), PIN(BOOT_1, EE_OFF), PIN(BOOT_2, EE_OFF),
@@ -319,8 +319,6 @@ static const char * const gpio_periphs_groups[] = {
 	"GPIOX_10", "GPIOX_11", "GPIOX_12", "GPIOX_13", "GPIOX_14",
 	"GPIOX_15", "GPIOX_16", "GPIOX_17", "GPIOX_18", "GPIOX_19",
 	"GPIOX_20", "GPIOX_21", "GPIOX_22",
-
-	"GPIO_TEST_N",
 };
 
 static const char * const emmc_groups[] = {
@@ -355,6 +353,8 @@ static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
 	"GPIOAO_10", "GPIOAO_11", "GPIOAO_12", "GPIOAO_13",
+
+	"GPIO_TEST_N",
 };
 
 static const char * const uart_ao_groups[] = {
@@ -410,11 +410,11 @@ static struct meson_bank meson_gxbb_aobus_banks[] = {
 
 struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
-	.pin_base	= 14,
+	.pin_base	= 15,
 	.groups		= meson_gxbb_periphs_groups,
 	.funcs		= meson_gxbb_periphs_functions,
 	.banks		= meson_gxbb_periphs_banks,
-	.num_pins	= 120,
+	.num_pins	= 119,
 	.num_groups	= ARRAY_SIZE(meson_gxbb_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_periphs_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxbb_periphs_banks),
@@ -426,7 +426,7 @@ struct meson_pinctrl_data meson_gxbb_aobus_pinctrl_data = {
 	.groups		= meson_gxbb_aobus_groups,
 	.funcs		= meson_gxbb_aobus_functions,
 	.banks		= meson_gxbb_aobus_banks,
-	.num_pins	= 14,
+	.num_pins	= 15,
 	.num_groups	= ARRAY_SIZE(meson_gxbb_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
index eebfaa9..fdc379b 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
@@ -14,7 +14,7 @@
 
 #include "pinctrl-meson.h"
 
-#define EE_OFF	10
+#define EE_OFF	11
 
 static const unsigned int emmc_nand_d07_pins[] = {
 	PIN(BOOT_0, EE_OFF), PIN(BOOT_1, EE_OFF), PIN(BOOT_2, EE_OFF),
@@ -290,7 +290,7 @@ static struct meson_pmx_group meson_gxl_periphs_groups[] = {
 	GPIO_GROUP(GPIOCLK_0, EE_OFF),
 	GPIO_GROUP(GPIOCLK_1, EE_OFF),
 
-	GPIO_GROUP(GPIO_TEST_N, EE_OFF),
+	GPIO_GROUP(GPIO_TEST_N, 0),
 
 	/* Bank X */
 	GROUP(sdio_d0,		5,	31),
@@ -472,8 +472,6 @@ static const char * const gpio_periphs_groups[] = {
 	"GPIOX_5", "GPIOX_6", "GPIOX_7", "GPIOX_8", "GPIOX_9",
 	"GPIOX_10", "GPIOX_11", "GPIOX_12", "GPIOX_13", "GPIOX_14",
 	"GPIOX_15", "GPIOX_16", "GPIOX_17", "GPIOX_18",
-
-	"GPIO_TEST_N",
 };
 
 static const char * const emmc_groups[] = {
@@ -588,6 +586,8 @@ static const char * const tsin_a_groups[] = {
 static const char * const gpio_aobus_groups[] = {
 	"GPIOAO_0", "GPIOAO_1", "GPIOAO_2", "GPIOAO_3", "GPIOAO_4",
 	"GPIOAO_5", "GPIOAO_6", "GPIOAO_7", "GPIOAO_8", "GPIOAO_9",
+
+	"GPIO_TEST_N",
 };
 
 static const char * const uart_ao_groups[] = {
@@ -692,11 +692,11 @@ static struct meson_bank meson_gxl_aobus_banks[] = {
 
 struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
 	.name		= "periphs-banks",
-	.pin_base	= 10,
+	.pin_base	= 11,
 	.groups		= meson_gxl_periphs_groups,
 	.funcs		= meson_gxl_periphs_functions,
 	.banks		= meson_gxl_periphs_banks,
-	.num_pins	= 101,
+	.num_pins	= 100,
 	.num_groups	= ARRAY_SIZE(meson_gxl_periphs_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxl_periphs_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxl_periphs_banks),
@@ -708,7 +708,7 @@ struct meson_pinctrl_data meson_gxl_aobus_pinctrl_data = {
 	.groups		= meson_gxl_aobus_groups,
 	.funcs		= meson_gxl_aobus_functions,
 	.banks		= meson_gxl_aobus_banks,
-	.num_pins	= 10,
+	.num_pins	= 11,
 	.num_groups	= ARRAY_SIZE(meson_gxl_aobus_groups),
 	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
 	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
-- 
2.7.4
