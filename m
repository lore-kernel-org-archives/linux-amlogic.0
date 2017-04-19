From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 22:17:31 +0200
Subject: [PATCH v2 2/6] serial: meson: remove dead code in
 meson_uart_change_speed
In-Reply-To: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
Message-ID: <3405accb-1996-8363-417c-a7f37ae361b0@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

val is set in both branches of the if clause, therefore the two
removed lines are dead code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/tty/serial/meson_uart.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index e2e25da1..22857f1e 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -298,8 +298,6 @@ static void meson_uart_change_speed(struct uart_port *port, unsigned long baud)
 	while (!meson_uart_tx_empty(port))
 		cpu_relax();
 
-	val = readl(port->membase + AML_UART_REG5);
-	val &= ~AML_UART_BAUD_MASK;
 	if (port->uartclk == 24000000) {
 		val = ((port->uartclk / 3) / baud) - 1;
 		val |= AML_UART_BAUD_XTAL;
-- 
2.12.2
