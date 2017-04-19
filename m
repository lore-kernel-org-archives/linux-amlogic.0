From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 22:17:44 +0200
Subject: [PATCH v2 3/6] serial: meson: remove unneeded variable assignment in
 meson_serial_port_write
In-Reply-To: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
Message-ID: <ed7c1b5a-342d-fdc4-e362-86cda86c573a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

There's no need to set AML_UART_TX_EN in each call to
meson_serial_port_write. In addition to meson_uart_startup
set this flag in meson_serial_console_setup and
meson_serial_early_console_setup.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- enable AML_UART_TX_EN in both console setup functions
---
 drivers/tty/serial/meson_uart.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 22857f1e..e93a1e47 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -124,6 +124,15 @@ static void meson_uart_stop_rx(struct uart_port *port)
 	writel(val, port->membase + AML_UART_CONTROL);
 }
 
+static void meson_uart_enable_tx_engine(struct uart_port *port)
+{
+	u32 val;
+
+	val = readl(port->membase + AML_UART_CONTROL);
+	val |= AML_UART_TX_EN;
+	writel(val, port->membase + AML_UART_CONTROL);
+}
+
 static void meson_uart_shutdown(struct uart_port *port)
 {
 	unsigned long flags;
@@ -497,7 +506,6 @@ static void meson_serial_port_write(struct uart_port *port, const char *s,
 	}
 
 	val = readl(port->membase + AML_UART_CONTROL);
-	val |= AML_UART_TX_EN;
 	tmp = val & ~(AML_UART_TX_INT_EN | AML_UART_RX_INT_EN);
 	writel(tmp, port->membase + AML_UART_CONTROL);
 
@@ -536,6 +544,8 @@ static int meson_serial_console_setup(struct console *co, char *options)
 	if (!port || !port->membase)
 		return -ENODEV;
 
+	meson_uart_enable_tx_engine(port);
+
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 
@@ -574,6 +584,7 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
 	if (!device->port.membase)
 		return -ENODEV;
 
+	meson_uart_enable_tx_engine(&device->port);
 	device->con->write = meson_serial_early_console_write;
 	return 0;
 }
-- 
2.12.2
