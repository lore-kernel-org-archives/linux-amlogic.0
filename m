From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 25 Feb 2018 12:38:53 +0100
Subject: [PATCH v2 1/2] pinctrl: meson: meson8b: fix requesting GPIOs greater
 than GPIOZ_3
In-Reply-To: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
References: <20180225113854.20731-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180225113854.20731-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8b is a cost reduced variant of the Meson8 SoC. It's package size
is smaller than Meson8.
Unfortunately there are a few key differences which cannot be seen
without close inspection of the code and the public S805 datasheet:
- the GPIOX bank is missing the GPIOX_12, GPIOX_13, GPIOX_14 and
  GPIOX_15 GPIOs
- the GPIOY bank is missing the GPIOY_2, GPIOY_4, GPIOY_5, GPIOY_15 and
  GPIOY_16 GPIOs
- the GPIODV bank is missing all GPIOs except GPIODV_9, GPIODV_24,
  GPIODV_25, GPIODV_26, GPIODV_27, GPIODV_28 and GPIODV_29
- the GPIOZ bank is missing completely
- there is a new GPIO bank called "DIF"

This means that Meson8b only has 83 actual GPIO lines. Without any holes
there would be 130 GPIO lines in total (120 are inherited from Meson8
plus 10 new from the DIF bank).

GPIOs greater GPIOZ_3 (whose ID is 83 - as a reminder: this is exactly
the number of actual GPIO lines on Meson8b and also the value of
meson8b_cbus_pinctrl_data.num_pins) cannot berequested. Using CARD_6
(which used ID 100 prior to this patch, "base of the GPIO controller was
382) as an example:
$ echo 482 > /sys/class/gpio/export
export_store: invalid GPIO 482

This removes all non-existing pins from to dt-bindings header file
(include/dt-bindings/gpio/meson8b-gpio.h). This allows us to have a
consecutive numbering for the GPIO #defines (GPIOY_2 doesn't exist for
example, so previously the GPIOY_3 ID was "GPIOY_1 + 2", after this
patch it is "GPIOY_1 + 1"). As a nice side-effect this means that we get
compile-time (instead of runtime) errors if Meson8b .dts uses a pin that
only exists on Meson8.

Additionally the pinctrl-meson8b driver has to be updated to handle this
new GPIO numbering. By default a struct meson_bank only handles GPIO
banks where the pins are numbered consecutively because it calculates
the bit offsets based on the GPIO IDs.
This is solved by  taking the original BANK() definition and splitting it
into consecutive subsets (X0..11 and X16..21). The bit offsets for each
new bank includes the skipped GPIOs (the definition of the "X0..11" bank
is identical to the old "X" bank apart from the "last IRQ" field, the
definition of the new, split "X16..21" bank takes the original "X" bank
and adds 16 - the start of the new split bank - to the "first IRQ",
pullen bit, pull bit, dir bit, out bit and in bit).

Commit 984cffdeaeb7ea ("pinctrl: Fix gpio/pin mapping for Meson8b")
fixed the same issue by setting "ngpio" (of the gpio_chip) to 130.
Unfortunately this broke in db80f0e158e621 ("pinctrl: meson: get rid of
unneeded domain structures").
The solution from this patch was considered to be better than the
previous attempt at fixing this because it provides compile-time error
checking for the GPIOs that exist on Meson8 but don't exist on Meson8b.

The following pins were tested on an Odroid-C1 using the sysfs GPIO
interface checking that their value (high or low) could be read:
- GPIOX_0, GPIOX_1, GPIOX_2, GPIOX_3, GPIOX_4, GPIOX_5, GPIOX_6,
  GPIOX_7, GPIOX_8, GPIOX_9, GPIOX_10, GPIOX_11, GPIOX_18, GPIOX_19,
  GPIOX_20, GPIOX_21
- GPIOY_3, GPIOY_7, GPIOY_8
(some of these had to be pulled up because they were low by default,
others were high by default so these had to be pulled down)

Reported-by: Linus L?ssing <linus.luessing@c0d3.blue>
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8b.c |  20 +++---
 include/dt-bindings/gpio/meson8b-gpio.h | 121 ++++++++++++++++++++++++++++----
 2 files changed, 120 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
index 5bd808dc81e1..bb2a30964fc6 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8b.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
@@ -884,20 +884,24 @@ static struct meson_pmx_func meson8b_aobus_functions[] = {
 };
 
 static struct meson_bank meson8b_cbus_banks[] = {
-	/*   name    first              last        irq      pullen  pull    dir     out     in  */
-	BANK("X",    GPIOX_0,		GPIOX_21,   97, 118, 4,  0,  4,  0,  0,  0,  1,  0,  2,  0),
-	BANK("Y",    GPIOY_0,		GPIOY_14,   80,  96, 3,  0,  3,  0,  3,  0,  4,  0,  5,  0),
-	BANK("DV",   GPIODV_9,		GPIODV_29,  59,  79, 0,  0,  0,  0,  7,  0,  8,  0,  9,  0),
-	BANK("H",    GPIOH_0,		GPIOH_9,    14,  23, 1, 16,  1, 16,  9, 19, 10, 19, 11, 19),
-	BANK("CARD", CARD_0,		CARD_6,     43,  49, 2, 20,  2, 20,  0, 22,  1, 22,  2, 22),
-	BANK("BOOT", BOOT_0,		BOOT_18,    24,  42, 2,  0,  2,  0,  9,  0, 10,  0, 11,  0),
+	/*   name        first          last        irq       pullen   pull     dir      out      in   */
+	BANK("X0..11",	 GPIOX_0,	GPIOX_11,   97, 108,  4,  0,   4,  0,   0,  0,   1,  0,   2,  0),
+	BANK("X16..21",	 GPIOX_16,	GPIOX_21,  113, 118,  4, 16,   4, 16,   0, 16,   1, 16,   2, 16),
+	BANK("Y0..1",	 GPIOY_0,	GPIOY_1,    80,  81,  3,  0,   3,  0,   3,  0,   4,  0,   5,  0),
+	BANK("Y3",	 GPIOY_3,	GPIOY_3,    83,  83,  3,  3,   3,  3,   3,  3,   4,  3,   5,  3),
+	BANK("Y6..14",	 GPIOY_6,	GPIOY_14,   86,  94,  3,  6,   3,  6,   3,  6,   4,  6,   5,  6),
+	BANK("DV9",	 GPIODV_9,	GPIODV_9,   59,  59,  0,  9,   0,  9,   7,  9,   8,  9,   9,  9),
+	BANK("DV24..29", GPIODV_24,	GPIODV_29,  74,  79,  0, 24,   0, 24,   7, 24,   8, 24,   9, 24),
+	BANK("H",	 GPIOH_0,	GPIOH_9,    14,  23,  1, 16,   1, 16,   9, 19,  10, 19,  11, 19),
+	BANK("CARD",	 CARD_0,	CARD_6,     43,  49,  2, 20,   2, 20,   0, 22,   1, 22,   2, 22),
+	BANK("BOOT",	 BOOT_0,	BOOT_18,    24,  42,  2,  0,   2,  0,   9,  0,  10,  0,  11,  0),
 
 	/*
 	 * The following bank is not mentionned in the public datasheet
 	 * There is no information whether it can be used with the gpio
 	 * interrupt controller
 	 */
-	BANK("DIF",  DIF_0_P,		DIF_4_N,    -1,  -1, 5,  8,  5,  8, 12, 12, 13, 12, 14, 12),
+	BANK("DIF",	 DIF_0_P,	DIF_4_N,    -1,  -1,  5,  8,   5,  8,  12, 12,  13, 12,  14, 12),
 };
 
 static struct meson_bank meson8b_aobus_banks[] = {
diff --git a/include/dt-bindings/gpio/meson8b-gpio.h b/include/dt-bindings/gpio/meson8b-gpio.h
index c38cb20d7182..bf0d76fa0e7b 100644
--- a/include/dt-bindings/gpio/meson8b-gpio.h
+++ b/include/dt-bindings/gpio/meson8b-gpio.h
@@ -15,18 +15,113 @@
 #ifndef _DT_BINDINGS_MESON8B_GPIO_H
 #define _DT_BINDINGS_MESON8B_GPIO_H
 
-#include <dt-bindings/gpio/meson8-gpio.h>
-
-/* GPIO Bank DIF */
-#define DIF_0_P		120
-#define DIF_0_N		121
-#define DIF_1_P		122
-#define DIF_1_N		123
-#define DIF_2_P		124
-#define DIF_2_N		125
-#define DIF_3_P		126
-#define DIF_3_N		127
-#define DIF_4_P		128
-#define DIF_4_N		129
+/* EE (CBUS) GPIO chip */
+#define GPIOX_0		0
+#define GPIOX_1		1
+#define GPIOX_2		2
+#define GPIOX_3		3
+#define GPIOX_4		4
+#define GPIOX_5		5
+#define GPIOX_6		6
+#define GPIOX_7		7
+#define GPIOX_8		8
+#define GPIOX_9		9
+#define GPIOX_10	10
+#define GPIOX_11	11
+#define GPIOX_16	12
+#define GPIOX_17	13
+#define GPIOX_18	14
+#define GPIOX_19	15
+#define GPIOX_20	16
+#define GPIOX_21	17
+
+#define GPIOY_0		18
+#define GPIOY_1		19
+#define GPIOY_3		20
+#define GPIOY_6		21
+#define GPIOY_7		22
+#define GPIOY_8		23
+#define GPIOY_9		24
+#define GPIOY_10	25
+#define GPIOY_11	26
+#define GPIOY_12	27
+#define GPIOY_13	28
+#define GPIOY_14	29
+
+#define GPIODV_9	30
+#define GPIODV_24	31
+#define GPIODV_25	32
+#define GPIODV_26	33
+#define GPIODV_27	34
+#define GPIODV_28	35
+#define GPIODV_29	36
+
+#define GPIOH_0		37
+#define GPIOH_1		38
+#define GPIOH_2		39
+#define GPIOH_3		40
+#define GPIOH_4		41
+#define GPIOH_5		42
+#define GPIOH_6		43
+#define GPIOH_7		44
+#define GPIOH_8		45
+#define GPIOH_9		46
+
+#define CARD_0		47
+#define CARD_1		48
+#define CARD_2		49
+#define CARD_3		50
+#define CARD_4		51
+#define CARD_5		52
+#define CARD_6		53
+
+#define BOOT_0		54
+#define BOOT_1		55
+#define BOOT_2		56
+#define BOOT_3		57
+#define BOOT_4		58
+#define BOOT_5		59
+#define BOOT_6		60
+#define BOOT_7		61
+#define BOOT_8		62
+#define BOOT_9		63
+#define BOOT_10		64
+#define BOOT_11		65
+#define BOOT_12		66
+#define BOOT_13		67
+#define BOOT_14		68
+#define BOOT_15		69
+#define BOOT_16		70
+#define BOOT_17		71
+#define BOOT_18		72
+
+#define DIF_0_P		73
+#define DIF_0_N		74
+#define DIF_1_P		75
+#define DIF_1_N		76
+#define DIF_2_P		77
+#define DIF_2_N		78
+#define DIF_3_P		79
+#define DIF_3_N		80
+#define DIF_4_P		81
+#define DIF_4_N		82
+
+/* AO GPIO chip */
+#define GPIOAO_0	0
+#define GPIOAO_1	1
+#define GPIOAO_2	2
+#define GPIOAO_3	3
+#define GPIOAO_4	4
+#define GPIOAO_5	5
+#define GPIOAO_6	6
+#define GPIOAO_7	7
+#define GPIOAO_8	8
+#define GPIOAO_9	9
+#define GPIOAO_10	10
+#define GPIOAO_11	11
+#define GPIOAO_12	12
+#define GPIOAO_13	13
+#define GPIO_BSD_EN	14
+#define GPIO_TEST_N	15
 
 #endif /* _DT_BINDINGS_MESON8B_GPIO_H */
-- 
2.16.2
