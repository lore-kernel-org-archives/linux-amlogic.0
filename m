Return-Path: <SRS0=hIX+=QM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5B9C282CB
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 16:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1272080F
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Feb 2019 16:02:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fJcs9cdd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WSV81ETS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1272080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+4zUIOpBH8hrauLt9RO2B9gxhvtu5bRjHw8svJzUR3c=; b=fJcs9cddKSs1CN
	va7utTKKbtfZte7zP0utHk0p3hKY96c3wo/05+25k3oHb8PXJmYyC+JtyPsZV5MQtL4xRtgGHGd89
	ONrZ3InIt1Nyog1BOhK3pFqDdy4J5bXaQhrE4ulYTFdrcVw/MMP+PFmswlR4zWnxjxUTNLlHCeGqI
	fWmeMq8vuAoCIpUd6L8XoTLKt3jEibB+/ffTEgYyMABVq7r0kbSr8aiGhdNwskJu86ZYKjWPFroIU
	EAVK6q7EsRxUnGqDZ1hmHbw/eH0hdvzqnSWzlqilncl1vVrJl1OqHmFqR/ppa0ddLj+aUBPVxGwRB
	c9KbmKrzuMbB1FHjRT9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr3AZ-0001aY-ET; Tue, 05 Feb 2019 16:01:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr38Y-0006mA-O5
 for linux-amlogic@lists.infradead.org; Tue, 05 Feb 2019 16:00:59 +0000
Received: by mail-wm1-x341.google.com with SMTP id b11so4221078wmj.1
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Feb 2019 07:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=obC/o0x/Of+oiYvDNo+3FmUgPGJAQl+NE5x85eXAQHI=;
 b=WSV81ETS+kogLHB4BvEl6z/BdttOBfQ9jLyogcbwsk8O19p2eJ0F87NbLRjxhPSY5m
 jru04119WHfN5Ojw0FqEIYDTbm883PI2wFjbPV4qVeN6TE1SfV707mJos0aAAXrdVjGd
 UVZ5O98son0kInTPtFBdl31QBQT018TiJbDlPq7hHUXTPeGDswp1xUuOQQZ8kCCNFzvM
 0jLnZk08zYrCG96BfpERA2AJPeweqEfm5iBeW6P6cOHy5hGmAzVKwOA3hR5EeQ1MzCL6
 DacGQGFQCsj1er9+HxPHY6gwsKFFNujj76py9cyjFI5vhpJzinV5mzWrxZX+qJW771AT
 AZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=obC/o0x/Of+oiYvDNo+3FmUgPGJAQl+NE5x85eXAQHI=;
 b=MaFxn2vYhBHvDaDE23bP3jWcmeZKU8H8jDYYeuQXSlmXuLNxZtrtDrA+1IuaDqD00D
 rVLiUS5DIU4LAy/d8ccGQkaC98xbS/4/zrNKV9JVwSn95khh/r3WzUwKRVKdGB0Tv6SM
 EpL044xeeFFAeGQ6DOQEm+vF4jENqjyRP9MVegep3/pCLrTPDjkuWmCHbJ1lolxsB3IX
 zYuApKuX48gTqbiJfeJhP/c1Yibczay5g0pwZJjWgyQSLq7wdhHfOMrhaZFcIjzdanDa
 Y/nTEupnyTWy2m/mWYMD0K9koZgV/Cc3GNeaoDYvHGg8Dz9cl8Co2x8muKnBYGlud/J8
 4j7A==
X-Gm-Message-State: AHQUAuZin1KenHAU3yW+ow4YZ18mYBJ7KetqZ6p8bIM353qZivZd8VTa
 mr35sIP2wm0VAgJsMBdC3RWoeg==
X-Google-Smtp-Source: AHgI3IYSrGj7kHlF8uGsZVxlBXMYAo+pXQSmbx+a+mIkXGS/XNkMYdNI1G7+AD7n1YIQ7vnG8Tm7QQ==
X-Received: by 2002:a1c:d082:: with SMTP id h124mr4071012wmg.21.1549382388516; 
 Tue, 05 Feb 2019 07:59:48 -0800 (PST)
Received: from localhost ([2620:10d:c092:180::1:a0f9])
 by smtp.gmail.com with ESMTPSA id s66sm11635832wmf.34.2019.02.05.07.59.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Feb 2019 07:59:47 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] tty: serial: meson_uart: Add support for kernel debugger
Date: Fri, 1 Feb 2019 08:36:59 +0100
Message-ID: <864l9i1b0t.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_075951_275707_7712E6DD 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The kgdb invokes the poll_put_char and poll_get_char when communicating
with the host. This patch implement the serial polling hooks for the
meson_uart to be used for KGDB debugging over serial line.

Signed-off-by: Julien Masson <jmasson@baylibre.com>
---
 drivers/tty/serial/meson_uart.c | 46 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 8a84259..49b20da 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -426,6 +426,48 @@ static void meson_uart_config_port(struct uart_port *port, int flags)
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
+
+	spin_lock_irqsave(&port->lock, flags);
+
+	while (!(readl(port->membase + AML_UART_STATUS) & AML_UART_TX_EMPTY))
+		cpu_relax();
+
+	writel(c, port->membase + AML_UART_WFIFO);
+
+	while (!(readl(port->membase + AML_UART_STATUS) & AML_UART_TX_EMPTY))
+		cpu_relax();
+
+	spin_unlock_irqrestore(&port->lock, flags);
+}
+
+#endif /* CONFIG_CONSOLE_POLL */
+
 static const struct uart_ops meson_uart_ops = {
 	.set_mctrl      = meson_uart_set_mctrl,
 	.get_mctrl      = meson_uart_get_mctrl,
@@ -441,6 +483,10 @@ static const struct uart_ops meson_uart_ops = {
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
