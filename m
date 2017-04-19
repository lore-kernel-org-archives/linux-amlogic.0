From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 22:18:16 +0200
Subject: [PATCH v2 6/6] serial: meson: change interrupt description to tty name
In-Reply-To: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
Message-ID: <e2b3ef2d-dfe4-de91-c8e1-4046fc2ebdb5@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Change interrupt description from driver name to tty name
(e.g. ttyAML0). If multiple serial ports are enabled this
allows to determine which interrupt belongs to which port
in /proc/interrupts.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- use new port->name instead of of node name
---
 drivers/tty/serial/meson_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 171eb673..082e038e 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -295,7 +295,7 @@ static int meson_uart_startup(struct uart_port *port)
 	writel(val, port->membase + AML_UART_MISC);
 
 	ret = request_irq(port->irq, meson_uart_interrupt, 0,
-			  meson_uart_type(port), port);
+			  port->name, port);
 
 	return ret;
 }
-- 
2.12.2
