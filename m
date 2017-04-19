From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 22:17:47 +0200
Subject: [PATCH v2 4/6] serial: meson: make use of uart_port member mapsize
In-Reply-To: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
Message-ID: <61a749b8-6d5f-8ec6-bc41-b1f2796c7c65@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Member mapsize of struct uart_port is meant to store the resource size.
By using it we can get rid of meson_uart_res_size().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/tty/serial/meson_uart.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index e93a1e47..1220c9ac 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -402,26 +402,11 @@ static int meson_uart_verify_port(struct uart_port *port,
 	return ret;
 }
 
-static int meson_uart_res_size(struct uart_port *port)
-{
-	struct platform_device *pdev = to_platform_device(port->dev);
-	struct resource *res;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(port->dev, "cannot obtain I/O memory region");
-		return -ENODEV;
-	}
-
-	return resource_size(res);
-}
-
 static void meson_uart_release_port(struct uart_port *port)
 {
-	int size = meson_uart_res_size(port);
-
 	if (port->flags & UPF_IOREMAP) {
-		devm_release_mem_region(port->dev, port->mapbase, size);
+		devm_release_mem_region(port->dev, port->mapbase,
+					port->mapsize);
 		devm_iounmap(port->dev, port->membase);
 		port->membase = NULL;
 	}
@@ -429,12 +414,7 @@ static void meson_uart_release_port(struct uart_port *port)
 
 static int meson_uart_request_port(struct uart_port *port)
 {
-	int size = meson_uart_res_size(port);
-
-	if (size < 0)
-		return size;
-
-	if (!devm_request_mem_region(port->dev, port->mapbase, size,
+	if (!devm_request_mem_region(port->dev, port->mapbase, port->mapsize,
 				     dev_name(port->dev))) {
 		dev_err(port->dev, "Memory region busy\n");
 		return -EBUSY;
@@ -443,7 +423,7 @@ static int meson_uart_request_port(struct uart_port *port)
 	if (port->flags & UPF_IOREMAP) {
 		port->membase = devm_ioremap_nocache(port->dev,
 						     port->mapbase,
-						     size);
+						     port->mapsize);
 		if (port->membase == NULL)
 			return -ENOMEM;
 	}
@@ -641,6 +621,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->uartclk = clk_get_rate(clk);
 	port->iotype = UPIO_MEM;
 	port->mapbase = res_mem->start;
+	port->mapsize = resource_size(res_mem);
 	port->irq = res_irq->start;
 	port->flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
 	port->dev = &pdev->dev;
-- 
2.12.2
