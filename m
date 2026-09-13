Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A88C88E40
	for <linux-amlogic@archiver.kernel.org>; Sun, 13 Sep 2026 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tui//yVFXD0G4uDp6jO3DNlNMb8I/TDBm5Wi6qRLCSc=; b=gArdlWtSUZiNsb
	BX3uSLJi44dyeFueuQZS10se+c28tMpILBt5GBklGcMlfszAjH2nLnKv9RqXfNQbJZ1syzWS5d3ox
	bZRh+7h+w34rIxYMH12Pc9PKG81lnBJ7az4KR1P9CkTxPZq7HRgN4WSqsC5XE+1mpKn5bR+Ox73FR
	ydpoqrXTwKkWt8uxi/ZqU6OYOxmIej1mI9f9TMWVJWQVkxjZC0oNrgzAlA/UBcYR6iH/p+e1RZBHa
	moNKLGBEPW8tGQbbLL90V/Bw//Aq6/8LaSsiX5iGYEqscHcYLdeMTaPSj4c6UiclrEv8M4Mr1JD7m
	YQSvzXvYD1A8tFFCbjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5b6R-00000001LbN-05gZ;
	Sun, 13 Sep 2026 03:42:03 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5b6N-00000001Lac-3KGV
	for linux-amlogic@lists.infradead.org;
	Sun, 13 Sep 2026 03:42:01 +0000
Received: by mail-qk2-x11.google.com with SMTP id af79cd13be357-93a135ffb08so53516785a.2
        for <linux-amlogic@lists.infradead.org>; Sat, 12 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270918; x=1789875718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=IRvbPHjUaz7RVl3xOsUibO4c0bRAoIS8JeIHC5zcDuFVOXrsluAeXuxNc0Hf2JU7T5
         MlHCbnlIugVo7YbmDx1NWkUN0vWlU/naOwLFXPgvC8mdo4APrZMtJyxwxjHVY4D2+G+a
         yircdHs4AefNtIXhRgLIk8tm+VPOe2Ib9x1WGVofFQAF2bOidmiN3/T3X4kZ92+qdAhv
         hD1rM5y4I9hM5g8hk46PBehwlFRycsBKKNdXvNGFa++aByFkYPtNcvWzULVdmCTP+eFN
         DsgBSO6qYaNoMnvh+nMtKPSLARISZ+n2kbjrt9sqpPDQHtV4U/pTggMGIRPHVDrH8Tq2
         1PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270918; x=1789875718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=UQ4wJR3c+qeKwokvGEbTRt/sZZ05o7L3+V+pS/e3wgeak+Nkdi8C1WMDunkv1RVkVD
         XjDgir4PHpeXy4H3OMIXCtWD8FQbAFxdHpNpp6Fwme0FL4+OpwfTSrIztqRv8SqqzoOf
         WD2n2QMwldyBTkuQReROnbx+fisxkd4/jOyJoeYG6x7LC/UFnfKg/WxEnq9erw98qrLc
         F3bcKu03+civVThhepf/6363kv0HtzEsDkiXE22+3TBVDtYTaPr60tkM276GghoRqRVY
         N1804KhwhiJgBp3V6ln+ix4K/inRO8EltI7+yKiD/i3OVUAkDnFzjFcbqVy7KuQOcYZm
         1qgQ==
X-Forwarded-Encrypted: i=1; AKwUvByqoSZQARd/CYcVgebAw6tei1YATQWS7/qjwBTpXKFz9gENbqSIV22GJGcVmh9oUQJO9tyK2HyFQtHucvsF@lists.infradead.org
X-Gm-Message-State: AFuF++nFpR9tqTq/Jv+q0a3sclxdPbKFjPJICojcdo0/At6WzHwBOopX
	/F2A0BRbO3pDuC7dWabLDEzHZaDS+Ad2ZWhsrOm2wI7XdmVqPH8aVZE=
X-Gm-Gg: AYBFou3csgr6o1SsbXeNyapWVMGMlMpd5mbLHMgjoxluI3VKsteO+8OyavxixXbf+NZ
	H7QViIyVtBhSbFWzeciRysh0efTwvEdQwbvk26bxw5QXy776mSEDCB/Aws/HugRW5RHlye6xLSJ
	djg+lvcDrxdqJYBWZ66aYJ0SR3tGH+pQNb7H8QfhXxMnJbKriQ6p4ou+8OFwfcHEwJwGWYKYU6e
	yZ8lF55wChi+lAbw7qk4CLHhB3vQ3Ze3R+Yapxdx7K+EGKqOeZIyIbmz7ynwoUUwnrGntyqoVFI
	1BHTwngU0uRxXPQ0ruH4L9UYABG3z1/OY8epCvZuJV7eyAmZISj8bs1fmeW/qUdHOsMjreIlTuE
	b2N72FyRpclM8RklNw30A7I+B04pfwf+caJPooVe13mV+4zIFQhxlcgoTl2FtTfbhCcCUNVPj49
	x3lCo5W4VJ5xT68Vh62zRauElh/Y854CRw15goSYg6quneSb3R7Ip6rftyUMhnMFDQkPv2Ashk2
	eiLU6mcfuZ0caErx7tUJ3IeTPip8S02IFbi2Q+7g65C0dcYMTpn/MdywjX3Hx9fbikIgLNkG/Zp
	7/QT3pdy/jvXXGWlI2wYdtCngh8S
X-Received: by 2002:a05:620a:d8d:b0:939:597:e7af with SMTP id af79cd13be357-93a038fa617mr775671985a.35.1789270918119;
        Sat, 12 Sep 2026 20:41:58 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80d453esm652916385a.38.2026.09.12.20.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 20:41:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-serial@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] tty: serial: meson: fix UART driver lifetime
Date: Sat, 12 Sep 2026 23:41:48 -0400
Message-ID: <20260913034148.15068-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_204159_851107_FD059A0B 
X-CRM114-Status: GOOD (  18.99  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Moving Amlogic UART registration into probe left the first driver
registration behind if uart_add_one_port() failed. Adding the separate
ttyS driver later also exposed a global last-port test: removing the last
port of one driver kept it registered whenever the other had a port.

Track whether probe registered the driver and undo it when port addition
fails. On remove, retain the current driver only if a remaining port maps
to that driver. Serialize the shared lifecycle decisions against parallel
probe and remove operations.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bcb5645f99ef ("tty: serial: meson: redesign the module to platform_driver")
Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index a6cb2a535..4bd9d9826 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -80,6 +81,7 @@ static struct uart_driver meson_uart_driver_ttyAML;
 static struct uart_driver meson_uart_driver_ttyS;
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
+static DEFINE_MUTEX(meson_uart_mutex);
 
 struct meson_uart_data {
 	struct uart_driver *uart_driver;
@@ -692,6 +694,16 @@ static struct uart_driver *meson_uart_current(const struct meson_uart_data *pd)
 		pd->uart_driver : &meson_uart_driver_ttyAML;
 }
 
+static bool meson_uart_has_ports(struct uart_driver *uart_driver)
+{
+	for (int id = 0; id < AML_UART_PORT_NUM; id++)
+		if (meson_ports[id] &&
+		    meson_uart_current(meson_ports[id]->private_data) == uart_driver)
+			return true;
+
+	return false;
+}
+
 static int meson_uart_probe(struct platform_device *pdev)
 {
 	const struct meson_uart_data *priv_data;
@@ -702,6 +714,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	int ret = 0;
 	int irq;
 	bool has_rtscts;
+	bool registered = false;
 
 	if (pdev->dev.of_node)
 		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
@@ -731,11 +744,6 @@ static int meson_uart_probe(struct platform_device *pdev)
 	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
 	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
 
-	if (meson_ports[pdev->id]) {
-		return dev_err_probe(&pdev->dev, -EBUSY,
-				     "port %d already allocated\n", pdev->id);
-	}
-
 	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
@@ -748,11 +756,22 @@ static int meson_uart_probe(struct platform_device *pdev)
 
 	uart_driver = meson_uart_current(priv_data);
 
+	mutex_lock(&meson_uart_mutex);
+
+	if (meson_ports[pdev->id]) {
+		ret = dev_err_probe(&pdev->dev, -EBUSY,
+				    "port %d already allocated\n", pdev->id);
+		goto out_unlock;
+	}
+
 	if (!uart_driver->state) {
 		ret = uart_register_driver(uart_driver);
-		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "can't register uart driver\n");
+		if (ret) {
+			ret = dev_err_probe(&pdev->dev, ret,
+					    "can't register uart driver\n");
+			goto out_unlock;
+		}
+		registered = true;
 	}
 
 	port->iotype = UPIO_MEM;
@@ -781,9 +800,14 @@ static int meson_uart_probe(struct platform_device *pdev)
 	}
 
 	ret = uart_add_one_port(uart_driver, port);
-	if (ret)
+	if (ret) {
 		meson_ports[pdev->id] = NULL;
+		if (registered)
+			uart_unregister_driver(uart_driver);
+	}
 
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 	return ret;
 }
 
@@ -794,15 +818,19 @@ static void meson_uart_remove(struct platform_device *pdev)
 
 	port = platform_get_drvdata(pdev);
 	uart_driver = meson_uart_current(port->private_data);
+
+	mutex_lock(&meson_uart_mutex);
 	uart_remove_one_port(uart_driver, port);
 	meson_ports[pdev->id] = NULL;
 
-	for (int id = 0; id < AML_UART_PORT_NUM; id++)
-		if (meson_ports[id])
-			return;
+	if (meson_uart_has_ports(uart_driver))
+		goto out_unlock;
 
 	/* No more available uart ports, unregister uart driver */
 	uart_unregister_driver(uart_driver);
+
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 }
 
 static struct meson_uart_data meson_g12a_uart_data = {
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
