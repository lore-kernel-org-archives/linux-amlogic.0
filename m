From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 19:17:59 +0100
Subject: [PATCH 1/3] tty: serial: meson: remove duplicate "clear error" bit
 definition
In-Reply-To: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
References: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117181801.29734-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The "clear error" bit in the AML_UART_CONTROL register is defined twice.
Remove the AML_UART_CLR_ERR definition and replace it with
AML_UART_CLEAR_ERR.
AML_UART_CLEAR_ERR was chosen to be kept since the datasheet's
description for this bit is "Clear Error" (so developer's don't have to
translate this to "CLR_ERR").
No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/tty/serial/meson_uart.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index daafe60175da..78b5d2d15a97 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -36,7 +36,6 @@
 #define AML_UART_RX_EN			BIT(13)
 #define AML_UART_TX_RST			BIT(22)
 #define AML_UART_RX_RST			BIT(23)
-#define AML_UART_CLR_ERR		BIT(24)
 #define AML_UART_RX_INT_EN		BIT(27)
 #define AML_UART_TX_INT_EN		BIT(28)
 #define AML_UART_DATA_LEN_MASK		(0x03 << 20)
@@ -263,10 +262,10 @@ static void meson_uart_reset(struct uart_port *port)
 	u32 val;
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val |= (AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLR_ERR);
+	val |= (AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLEAR_ERR);
 	writel(val, port->membase + AML_UART_CONTROL);
 
-	val &= ~(AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLR_ERR);
+	val &= ~(AML_UART_RX_RST | AML_UART_TX_RST | AML_UART_CLEAR_ERR);
 	writel(val, port->membase + AML_UART_CONTROL);
 }
 
@@ -276,9 +275,9 @@ static int meson_uart_startup(struct uart_port *port)
 	int ret = 0;
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val |= AML_UART_CLR_ERR;
+	val |= AML_UART_CLEAR_ERR;
 	writel(val, port->membase + AML_UART_CONTROL);
-	val &= ~AML_UART_CLR_ERR;
+	val &= ~AML_UART_CLEAR_ERR;
 	writel(val, port->membase + AML_UART_CONTROL);
 
 	val |= (AML_UART_RX_EN | AML_UART_TX_EN);
-- 
2.15.0
