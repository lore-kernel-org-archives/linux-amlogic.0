Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B94C282C4
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 17:30:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 482CC218D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 17:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="baV1qC53";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E/G1eVpc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 482CC218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LP1RP5M4IndKrt1Ja+UWNmwTyYaRyE09JsFWtgArMBg=; b=baV1qC53hhvOjI
	qB9Bp6+RncaoAoBIVBhxO0E5o7q5p+1VdaXd8HOaa8Egc6bq9mFquhEULmMznEcrmjGP/reo6JtOd
	pYTkMoTfGD7fKJG1YeHdKUZKE8rd3L0ZxSNX1eVrVQ21+sbSGAfsmmOPCl9I+Hs10icCkLEzNoncc
	bp4dEA4XGZfTeia9JXzcl7r5NEDecJ5qrKVAJR9nVTT5U/6YvoGzvBuEyEw3v3YzYhVOyBCTTxXNp
	wRnAnaE9+CrRq4HwkV3A5RgXVnSqbQgFFy0fXIx8NtDpDv/W89Bv0n53l5pZJKOm4oEnNJuBEIwio
	kgpzKbqvk6t1OvjIMbgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grnVM-00045f-VG; Thu, 07 Feb 2019 17:30:28 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grnVA-0003w6-QW
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 17:30:19 +0000
Received: by mail-ed1-x542.google.com with SMTP id g4so556715eds.4
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 09:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=goV4oeui+QjZXGASbWEnmi9tnJ5aRRm3TV6+qGVkZCw=;
 b=E/G1eVpclGbPqa6wEwR+w2v8D7LjGwl1tAIfNRowttC7eNOQpkPu667FDpDXYrNELx
 5QCX2dVTrTZAu3VHSS9v+/14Q4WKrnAktZHQnCYhQ9zBaPPPCYy9otw/JYxe/dwQq2n1
 pbNLeVX7sgvao51xy6MK8X5Jz3EWf1YxW0Nju7yEqa7N0LhU7Ji2ExddPoPXbJtKiaIS
 C3q7393v1NxEk8BRT/i5rsTfe5VLQs5ZGYMBdVXZNCf3FMGV0d2HfSXa5yoMzVsLCtsN
 fjs2CJXo59KZTAgbsHExzLwyNorAH2U6mcTEhqaxjIWdMbJ4Q+1IISoBjmkkhzDbX3zZ
 yPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=goV4oeui+QjZXGASbWEnmi9tnJ5aRRm3TV6+qGVkZCw=;
 b=lP4wTZhqMAIXJy784iTY3VmzAEIRtjrGnoH3dCk0MJu8b2Aka/kkINE3tyUfwXDgD0
 b22avqJuHFaC/Hs29DfyjyrHZZHeIZR3zTXx1liJTwVqBoj7Gcun2n6QP+ujKFpu1GKz
 GUYR3jmFRsfFYtGaY+Nz+DZ9W/mIw7m+VrCfVx5lf+ke1GCPo7oXsaS9fbAAj8JIvnIZ
 np69E7NNXy+1C7gvXiT2HeIvNUUc6qRIC08HiSBOx2RsdV6kcMkOEF/AnAcMXRF/yS7r
 cNa+1CSsvsGPlJttNt6fHIBgQ+nZeqI7zKjbOn++Ev/q+1/12pPDAbUbJCBGeV199cjo
 1JAg==
X-Gm-Message-State: AHQUAubGtIeRkTc6kKGGG1WUHN9CZXZLhGfRysi5rn8ovN3utg59/UrX
 80g+tzoYiPnMt/U0A6M2yEt0YA==
X-Google-Smtp-Source: AHgI3Ia1KW0iSGh1qbZtY6aDlkL1lwFh8uSLrKbWxO0couClL/4F1IkZWaqSpRyPGLODpi3nwn7HSg==
X-Received: by 2002:a17:906:12cf:: with SMTP id
 l15mr7724322ejb.31.1549560614919; 
 Thu, 07 Feb 2019 09:30:14 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:a0f9])
 by smtp.gmail.com with ESMTPSA id w27sm4275214eje.76.2019.02.07.09.30.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Feb 2019 09:30:13 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] tty: serial: meson_uart: Add support for kernel debugger
Date: Thu,  7 Feb 2019 18:11:29 +0100
Message-ID: <86k1ibv74r.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_093016_870550_05A6931D 
X-CRM114-Status: GOOD (  13.29  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Julien Masson <jmasson@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The kgdb invokes the poll_put_char and poll_get_char when communicating
with the host. This patch implement the serial polling hooks for the
meson_uart to be used for KGDB debugging over serial line.

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---

Changes since v1 [0]:
* Use readl_poll_timeout_atomic instead of looping with read + cpu_relax
  -> read every 5 usecs during 1 msec
* add some comments

[0]: https://lore.kernel.org/lkml/1549015162-17418-1-git-send-email-jmasson@baylibre.com

 drivers/tty/serial/meson_uart.c | 65 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8a84259..bcff572 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -14,6 +14,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
@@ -75,6 +76,8 @@
 #define AML_UART_PORT_NUM		6
 #define AML_UART_DEV_NAME		"ttyAML"
 
+#define AML_UART_POLL_USEC		5
+#define AML_UART_TIMEOUT_USEC		1000
 
 static struct uart_driver meson_uart_driver;
 
@@ -426,6 +429,64 @@ static void meson_uart_config_port(struct uart_port *port, int flags)
 	}
 }
 
+#ifdef CONFIG_CONSOLE_POLL
+/*
+ * Console polling routines for writing and reading from the uart while
+ * in an interrupt or debug context (i.e. kgdb).
+ */
+
+static int meson_uart_poll_get_char(struct uart_port *port)
+{
+	u32 c;
+	unsigned long flags;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	if (readl(port->membase + AML_UART_STATUS) & AML_UART_RX_EMPTY)
+		c = NO_POLL_CHAR;
+	else
+		c = readl(port->membase + AML_UART_RFIFO);
+
+	spin_unlock_irqrestore(&port->lock, flags);
+
+	return c;
+}
+
+static void meson_uart_poll_put_char(struct uart_port *port, unsigned char c)
+{
+	unsigned long flags;
+	u32 reg;
+	int ret;
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	/* Wait until FIFO is empty or timeout */
+	ret = readl_poll_timeout_atomic(port->membase + AML_UART_STATUS, reg,
+					reg & AML_UART_TX_EMPTY,
+					AML_UART_POLL_USEC,
+					AML_UART_TIMEOUT_USEC);
+	if (ret == -ETIMEDOUT) {
+		dev_err(port->dev, "Timeout waiting for UART TX EMPTY\n");
+		goto out;
+	}
+
+	/* Write the character */
+	writel(c, port->membase + AML_UART_WFIFO);
+
+	/* Wait until FIFO is empty or timeout */
+	ret = readl_poll_timeout_atomic(port->membase + AML_UART_STATUS, reg,
+					reg & AML_UART_TX_EMPTY,
+					AML_UART_POLL_USEC,
+					AML_UART_TIMEOUT_USEC);
+	if (ret == -ETIMEDOUT)
+		dev_err(port->dev, "Timeout waiting for UART TX EMPTY\n");
+
+out:
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+#endif /* CONFIG_CONSOLE_POLL */
+
 static const struct uart_ops meson_uart_ops = {
 	.set_mctrl      = meson_uart_set_mctrl,
 	.get_mctrl      = meson_uart_get_mctrl,
@@ -441,6 +502,10 @@ static const struct uart_ops meson_uart_ops = {
 	.request_port	= meson_uart_request_port,
 	.release_port	= meson_uart_release_port,
 	.verify_port	= meson_uart_verify_port,
+#ifdef CONFIG_CONSOLE_POLL
+	.poll_get_char	= meson_uart_poll_get_char,
+	.poll_put_char	= meson_uart_poll_put_char,
+#endif
 };
 
 #ifdef CONFIG_SERIAL_MESON_CONSOLE
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
