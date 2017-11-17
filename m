From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 19:18:01 +0100
Subject: [PATCH 3/3] tty: serial: meson: fix typo in the "stop bit" register
 definition
In-Reply-To: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
References: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117181801.29734-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This simply fixes a typo in the preprocessor macros. No functional
changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/tty/serial/meson_uart.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 72d425579a4d..8a842591b37c 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -35,9 +35,9 @@
 #define AML_UART_TX_EN			BIT(12)
 #define AML_UART_RX_EN			BIT(13)
 #define AML_UART_TWO_WIRE_EN		BIT(15)
-#define AML_UART_STOP_BIN_LEN_MASK	(0x03 << 16)
-#define AML_UART_STOP_BIN_1SB		(0x00 << 16)
-#define AML_UART_STOP_BIN_2SB		(0x01 << 16)
+#define AML_UART_STOP_BIT_LEN_MASK	(0x03 << 16)
+#define AML_UART_STOP_BIT_1SB		(0x00 << 16)
+#define AML_UART_STOP_BIT_2SB		(0x01 << 16)
 #define AML_UART_PARITY_TYPE		BIT(18)
 #define AML_UART_PARITY_EN		BIT(19)
 #define AML_UART_TX_RST			BIT(22)
@@ -351,11 +351,11 @@ static void meson_uart_set_termios(struct uart_port *port,
 	else
 		val &= ~AML_UART_PARITY_TYPE;
 
-	val &= ~AML_UART_STOP_BIN_LEN_MASK;
+	val &= ~AML_UART_STOP_BIT_LEN_MASK;
 	if (cflags & CSTOPB)
-		val |= AML_UART_STOP_BIN_2SB;
+		val |= AML_UART_STOP_BIT_2SB;
 	else
-		val |= AML_UART_STOP_BIN_1SB;
+		val |= AML_UART_STOP_BIT_1SB;
 
 	if (cflags & CRTSCTS)
 		val &= ~AML_UART_TWO_WIRE_EN;
-- 
2.15.0
