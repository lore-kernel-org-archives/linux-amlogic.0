From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 22:17:50 +0200
Subject: [PATCH v2 5/6] serial: meson: remove use of flag UPF_IOREMAP
In-Reply-To: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
References: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
Message-ID: <9ca8e0bb-4caf-f541-5daa-9c48a06f2974@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Flag UPF_IOREMAP is used by the 8250 subsystem only, it's not used
by the serial core. Therefore I don't see any benefit in using it
here.

In addition fix the order of calls in meson_uart_release_port.
Unmapping needs to be done first, reversing call order in
meson_uart_request_port.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/tty/serial/meson_uart.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 1220c9ac..171eb673 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -404,12 +404,9 @@ static int meson_uart_verify_port(struct uart_port *port,
 
 static void meson_uart_release_port(struct uart_port *port)
 {
-	if (port->flags & UPF_IOREMAP) {
-		devm_release_mem_region(port->dev, port->mapbase,
-					port->mapsize);
-		devm_iounmap(port->dev, port->membase);
-		port->membase = NULL;
-	}
+	devm_iounmap(port->dev, port->membase);
+	port->membase = NULL;
+	devm_release_mem_region(port->dev, port->mapbase, port->mapsize);
 }
 
 static int meson_uart_request_port(struct uart_port *port)
@@ -420,13 +417,10 @@ static int meson_uart_request_port(struct uart_port *port)
 		return -EBUSY;
 	}
 
-	if (port->flags & UPF_IOREMAP) {
-		port->membase = devm_ioremap_nocache(port->dev,
-						     port->mapbase,
-						     port->mapsize);
-		if (port->membase == NULL)
-			return -ENOMEM;
-	}
+	port->membase = devm_ioremap_nocache(port->dev, port->mapbase,
+					     port->mapsize);
+	if (!port->membase)
+		return -ENOMEM;
 
 	return 0;
 }
@@ -623,7 +617,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	port->mapbase = res_mem->start;
 	port->mapsize = resource_size(res_mem);
 	port->irq = res_irq->start;
-	port->flags = UPF_BOOT_AUTOCONF | UPF_IOREMAP | UPF_LOW_LATENCY;
+	port->flags = UPF_BOOT_AUTOCONF | UPF_LOW_LATENCY;
 	port->dev = &pdev->dev;
 	port->line = pdev->id;
 	port->type = PORT_MESON;
-- 
2.12.2
