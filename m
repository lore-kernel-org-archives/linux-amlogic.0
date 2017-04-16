From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 16 Apr 2017 22:13:25 +0200
Subject: [PATCH 3/6] serial: meson: remove unneeded variable assignment in
 meson_serial_port_write
In-Reply-To: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
Message-ID: <c1371fc8-ebc2-0d14-e409-02e2fbf3ba94@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

AML_UART_TX_EN is set in meson_uart_startup and there's no place in
the driver where it gets cleared. Therefore we don't have to set it
here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 22857f1e..714b29ad 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -497,7 +497,6 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 	}
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val |= AML_UART_TX_EN;
 	tmp = val & ~(AML_UART_TX_INT_EN | AML_UART_RX_INT_EN);
 	writel(tmp, port->membase + AML_UART_CONTROL);
 
-- 
2.12.2
