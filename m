From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 19:18:00 +0100
Subject: [PATCH 2/3] tty: serial: meson: merge the two register sections for
 AML_UART_CONTROL
In-Reply-To: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
References: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117181801.29734-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

In the code there are two separate sections which each describe some of
the bits in the AML_UART_CONTROL register.
Merge these into one section to make the code easier to read.
No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/tty/serial/meson_uart.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 78b5d2d15a97..72d425579a4d 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -34,8 +34,15 @@
 /* AML_UART_CONTROL bits */
 #define AML_UART_TX_EN			BIT(12)
 #define AML_UART_RX_EN			BIT(13)
+#define AML_UART_TWO_WIRE_EN		BIT(15)
+#define AML_UART_STOP_BIN_LEN_MASK	(0x03 << 16)
+#define AML_UART_STOP_BIN_1SB		(0x00 << 16)
+#define AML_UART_STOP_BIN_2SB		(0x01 << 16)
+#define AML_UART_PARITY_TYPE		BIT(18)
+#define AML_UART_PARITY_EN		BIT(19)
 #define AML_UART_TX_RST			BIT(22)
 #define AML_UART_RX_RST			BIT(23)
+#define AML_UART_CLEAR_ERR		BIT(24)
 #define AML_UART_RX_INT_EN		BIT(27)
 #define AML_UART_TX_INT_EN		BIT(28)
 #define AML_UART_DATA_LEN_MASK		(0x03 << 20)
@@ -56,15 +63,6 @@
 					 AML_UART_FRAME_ERR  | \
 					 AML_UART_TX_FIFO_WERR)
 
-/* AML_UART_CONTROL bits */
-#define AML_UART_TWO_WIRE_EN		BIT(15)
-#define AML_UART_PARITY_TYPE		BIT(18)
-#define AML_UART_PARITY_EN		BIT(19)
-#define AML_UART_CLEAR_ERR		BIT(24)
-#define AML_UART_STOP_BIN_LEN_MASK	(0x03 << 16)
-#define AML_UART_STOP_BIN_1SB		(0x00 << 16)
-#define AML_UART_STOP_BIN_2SB		(0x01 << 16)
-
 /* AML_UART_MISC bits */
 #define AML_UART_XMIT_IRQ(c)		(((c) & 0xff) << 8)
 #define AML_UART_RECV_IRQ(c)		((c) & 0xff)
-- 
2.15.0
