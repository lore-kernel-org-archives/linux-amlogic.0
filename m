From: hgkr.klein@gmail.com (Helmut Klein)
Date: Wed, 22 Mar 2017 21:46:00 +0100
Subject: [PATCH 3/3] meson_uart: adds the core clock handling to the driver
Message-ID: <321e8a6f-0ec1-af24-8e9d-23000bf67806@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

the added lines are 1:1 ripped off amlogic's driver. They do what i want 
them to do.

I've hot no idea, if they are acceptable in that form.


diff -Napur a/drivers/tty/serial/meson_uart.c 
b/drivers/tty/serial/meson_uart.c
--- a/drivers/tty/serial/meson_uart.c	2017-03-09 21:09:47.000000000 +0100
+++ b/drivers/tty/serial/meson_uart.c	2017-03-22 19:01:38.581613578 +0100
@@ -600,6 +600,7 @@ static int meson_uart_probe(struct platf
  	struct resource *res_mem, *res_irq;
  	struct uart_port *port;
  	struct clk *clk;
+	struct clk *core_clk;
  	int ret = 0;

  	if (pdev->dev.of_node)
@@ -625,6 +626,15 @@ static int meson_uart_probe(struct platf
  	if (!port)
  		return -ENOMEM;

+	core_clk = devm_clk_get(&pdev->dev, "core");
+	if (!IS_ERR(core_clk)) {
+		ret = clk_prepare_enable(core_clk);
+		if(ret) {
+			dev_err(&pdev->dev, "couldn't enable clkc\n");
+			return ret;
+		}
+	}
+
  	clk = clk_get(&pdev->dev, NULL);
  	if (IS_ERR(clk))
  		return PTR_ERR(clk);
