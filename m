Return-Path: <SRS0=iDid=3K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AAAC2D0CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 17:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7801B2253D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jan 2020 17:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3Wu6tT2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eG+XPRzq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7801B2253D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FiOp2zbn6iQhNgcW/+LO+S98HRVGdgddAcdrnZxumqk=; b=n3Wu6tT2+O0y5B
	ctb73j1aFm3QfbmBQAt0Qv0syJYODcsVmlpbYNQAGKjM0K6pf/bfNZtCmfn2/lrRLK+jj4PkRNaxd
	/EZxFEuwab58YYJ4kUykJ22E4RjStplAQd13llKw0gOW6AlwWxzOwAl9jCEKSkcWLnhA4hp0gIOL7
	OVV3snxtuzMj5O8G4t4BQeVr7DTgqtKPhpaGDwlCycUtpAa8N8LzYetpi1GWLAy7ibul3u6Bqt0Op
	cdcpi1wKwkd7r1LrARhMrj0fkt70RLXepJ2QMgX44kYpFYMFn9kiWTyxXPkZXLarcWDBmvMJMFVJ3
	aSZY8odxEokpkRE0qb8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itxFu-0003xL-EN; Tue, 21 Jan 2020 17:23:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itxFr-0003wM-7F
 for linux-amlogic@lists.infradead.org; Tue, 21 Jan 2020 17:23:57 +0000
Received: by mail-wr1-x444.google.com with SMTP id z7so4114737wrl.13
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jan 2020 09:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=qulnROX80EQfKAAAdi+58//mX5ebVC1xGhbdWeXljF8=;
 b=eG+XPRzqZ6F4FmKkHJAHP7CO4l7BZ/6BzcAqbm2s8SSy6AGDVp+wczEGbXiWb1iJrF
 Qel8TreGnPjZz8PUCYkTC4w3bpZrvq14Te2kY9eKJjYdYs9OKTlRsPOaYb8aVn3OFn2m
 8i/m6y6AhASt6vHlvmwxUINw4oLnuf9zpJ25d0aMoMs/1BiDVPVBaUcmDTy6tHSSpuqN
 I+/L6N5zkTNiF5VxEIju3XoRsRyhOKys1YQrLc/gedSp9HHhZSrJ+79xczPT9EcTosSD
 QdD2EsKS16F8ivI0zBotGeSgd5Z+xtBoOU6Uh7Ogew341LgTJs5I/MBo3Dh3lyqwhGLi
 ILdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=qulnROX80EQfKAAAdi+58//mX5ebVC1xGhbdWeXljF8=;
 b=SPDufnjviePHYlYiE2V1Wo9HlnAz0+QfoWjUeJxRYYu2yQ9XYv8XIiD6DC9PWbCNr5
 1+i7MuaxWEW3l5ppR1su+XsFUNm2nyaRw3MZdnwTwKurFCHbgJtvc7LDCHJJh1talVj5
 E5iK0pa0Oo9kw6xBiPto5eZUkyM2xdEx5pNLDV0XTM5NyYuUCahRdlrYRxUap0Kl/+FC
 qpoK1bZ1IM6BVDVu+RqNN96ABzeDDl0GfgWsIxEqsKFNeupdTujUuevPiifP4NVTmmu2
 aSPc8ZLb8Gxosdd4KSI24UUam4cAvP7T7fyyJK8zGB+EZ6odGT82XkK0a8RGKrzysyjD
 x97g==
X-Gm-Message-State: APjAAAWc0Mz8zVyOD8/2Rx8aERdpnrNgjkMGVh/L4+P+G5T4Vl/Wvbdz
 1vCiO932Lc6GViK1ff2rxWpQ9w==
X-Google-Smtp-Source: APXvYqwUr3/YtOFR0+Q8ydmqs0w6X6w2Ly6cdHXfv3xa7K7S7JB/WxuwUXO9y+ENpSp33UCBQnBQfQ==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr6609447wrc.175.1579627433651; 
 Tue, 21 Jan 2020 09:23:53 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm52906783wrm.28.2020.01.21.09.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 09:23:52 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH v3] tty: serial: meson_uart: Add support for kernel debugger
Date: Tue, 21 Jan 2020 18:22:52 +0100
Message-ID: <867e1klo48.fsf@julienm-fedora-R90NQGV9.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_092355_263183_2E536D68 
X-CRM114-Status: GOOD (  12.77  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Changes since v2 [1]:
* Increase UART timeout to 10 ms
  -> For some reasons the previous value (1ms) is now too low with recent kernel.
     It made KGDB hang when printing long string for example.
     By setting this timeout to 10 ms, we avoid this kind of issue.

Changes since v1 [0]:
* Use readl_poll_timeout_atomic instead of looping with read + cpu_relax
  -> read every 5 usecs during 1 msec
* add some comments


* Test environment:
Board: "Le Potato"
https://libre.computer/products/boards/aml-s905x-cc/

Kernel Tree:
https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git

Kernel command line arguments:
kgdboc=ttyAML0,115200 kgdbretry=4 nokaslr kgdbcon

Kernel modules:
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_KERNEL=y
CONFIG_FRAME_POINTER=y
CONFIG_KGDB=y
CONFIG_KGDB_SERIAL_CONSOLE=y

WARNING: for single step instruction I had to adapt/apply this patch:
https://lore.kernel.org/patchwork/patch/562423/


[0]: https://patchwork.kernel.org/patch/10792397/
[1]: https://patchwork.kernel.org/patch/10801583/

 drivers/tty/serial/meson_uart.c | 65 +++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index fbc5bc022a39..b79c6d64bfb2 100644
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
@@ -76,6 +77,8 @@
 #define AML_UART_PORT_OFFSET		6
 #define AML_UART_DEV_NAME		"ttyAML"
 
+#define AML_UART_POLL_USEC		5
+#define AML_UART_TIMEOUT_USEC		10000
 
 static struct uart_driver meson_uart_driver;
 
@@ -427,6 +430,64 @@ static void meson_uart_config_port(struct uart_port *port, int flags)
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
@@ -442,6 +503,10 @@ static const struct uart_ops meson_uart_ops = {
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
2.21.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
