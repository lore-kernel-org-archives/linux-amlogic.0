Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79599C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD052087C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 12:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hu6X1pVb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD052087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zofoujHnEw5rvEb6N/RAJmLyTW/wgQ2aroY+4XS92mo=; b=hu6X1pVbF6hQITNF4/ECLBMVX3
	6hr2gIToi9r3awLhmBB93Wtl7QQPVNYn85Z63RIvuz1WThSvxF1Tqv3JA2HLRFsHS7m0qoCNwhM9i
	ZdpiKL8qNwdNHadg8Gyc4M41PaU7gZRpKV5CJdlpChKWmb+7u64g8eoFLy/IhFMYrwpoRCqC44sG5
	pInzhkDi6gmu/8egqkihpHZKuRpNagJzp4Bu29nTrTJWyhRx9eLpnEYbaVQjhf+jCZx6oPO+1xtmk
	qeA6bqCCOUJpwInHwU57e5jiJahLZq06qfXF3grVJDYw7dGDI4zbytaUj1nZox8prCzwYNohO0GhV
	D8fdwb3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKMq1-0001nj-W1; Sat, 27 Apr 2019 12:53:54 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKMpK-0000m5-Gr
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 12:53:18 +0000
Received: from orion.localdomain ([77.2.90.210]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MoNy4-1h0jOB13NY-00ooZP; Sat, 27 Apr 2019 14:52:55 +0200
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 25/41] drivers: tty: serial: timbuart: fix formatting issues
Date: Sat, 27 Apr 2019 14:52:06 +0200
Message-Id: <1556369542-13247-26-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556369542-13247-1-git-send-email-info@metux.net>
References: <1556369542-13247-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:dHmoa7nRbvk336kCXOJfWYY+mUp7+Lq3TccEDqKxr5HUdU0dY6C
 yzuj71JxmIOUypO0f3pRhohp2gsNBabdH6V+CbQXryApBGH2Qcpkk/9cghWYtQLFmk7hZJw
 tepHWArJtIL3O9kTqTVYZs321PvyO/k3/FRT6KFOh/DxNZXymlya5ap69Okq5lTHOD9MAiI
 qb5auophN8XTtreo3NFMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1IFakNoqoRU=:g2IC/h4Lb8irwRUcRILQAP
 iJHtLIZRLP5jlnbby/VOYf6KFSoGCWWof47H5xhbtd8s1pPKoP5Yb+s+gq5hl2M/COoUG5QaR
 o6990bSVnv8p2v0LIt58daQqegXiGmvrX4cpJlges1GbZrSY/dExLVQyUMuGYKgXZ4gS+QCUi
 DUWO0R9GfpV81xuEYMWDH+/Bw+/jx758tebwFjMi5P+XAhZe3AahPniroFjOQEaLlPc9OACxV
 z0m/HLrSRyTVwbdzn/R3WyGR5qG8Qydf6ZCXFxsqGvglAFE7wX96D7Hbirq0yAOWUhNcrV99V
 nl69e4FBSN4KlDivbdI7WQri0vhNY84IvRo1IiEE/ZHpTnuXBQHi6+rKrCr888njr6X3lV11R
 +NNhXY2FcFDgZ+HnlvCcFs5NnEra46YiNivW4ohwP8Oc33TYcFbJRX84sZu0ky/s9ufExRy/n
 oi7lKs3kB8WUj9e5TOxMzeT8ZLvxwUxMNfWe7y49JmYueF3lZK4WAPTe0h3NNGjnfXRcs5X3q
 Rdh1w66GcZg+tXQYCR/QeLxPzFeL9uKD2DNxghOUH9XdzyEJC73ltkEoOg++LUt52xUMj5LRo
 HsVfsVAiJN/tqJkb5OzZGSqYP7kx3Ap2w5Tz+Np1uXHj61xGc5qFy/gaf3O2/0K3Be+jXiMFG
 34KWo5PYCkalr9cKipeGjgZoZ3bQ0/g8AlKtDf5ADS6q158yxnznvMGHnPdlIOp7B57YTmsrg
 fLdpcQxU+qvrnDCsyjp/20ZqPkXCHMuK4kASFw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_055311_195922_4EEEE532 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 vz@mleia.com, linux@prisktech.co.nz, sparclinux@vger.kernel.org,
 khilman@baylibre.com, macro@linux-mips.org, slemieux.tyco@gmail.com,
 matthias.bgg@gmail.com, jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix checkpatch warnings:

    WARNING: Missing a blank line after declarations
    #43: FILE: drivers/tty/serial/timbuart.c:43:
    +	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~RXFLAGS;
    +	iowrite32(ier, port->membase + TIMBUART_IER);

    WARNING: Missing a blank line after declarations
    #50: FILE: drivers/tty/serial/timbuart.c:50:
    +	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~TXBAE;
    +	iowrite32(ier, port->membase + TIMBUART_IER);

    WARNING: Missing a blank line after declarations
    #86: FILE: drivers/tty/serial/timbuart.c:86:
    +		u8 ch = ioread8(port->membase + TIMBUART_RXFIFO);
    +		port->icount.rx++;

    WARNING: Missing a blank line after declarations
    #202: FILE: drivers/tty/serial/timbuart.c:202:
    +	u8 cts = ioread8(port->membase + TIMBUART_CTRL);
    +	dev_dbg(port->dev, "%s - cts %x\n", __func__, cts);

    WARNING: Block comments use * on subsequent lines
    #296: FILE: drivers/tty/serial/timbuart.c:296:
    +	/* The serial layer calls into this once with old = NULL when setting
    +	   up initially */

    WARNING: Block comments use a trailing */ on a separate line
    #296: FILE: drivers/tty/serial/timbuart.c:296:

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/tty/serial/timbuart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/timbuart.c b/drivers/tty/serial/timbuart.c
index dcce936..d80c332 100644
--- a/drivers/tty/serial/timbuart.c
+++ b/drivers/tty/serial/timbuart.c
@@ -40,6 +40,7 @@ static void timbuart_stop_rx(struct uart_port *port)
 {
 	/* spin lock held by upper layer, disable all RX interrupts */
 	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~RXFLAGS;
+
 	iowrite32(ier, port->membase + TIMBUART_IER);
 }
 
@@ -47,6 +48,7 @@ static void timbuart_stop_tx(struct uart_port *port)
 {
 	/* spinlock held by upper layer, disable TX interrupt */
 	u32 ier = ioread32(port->membase + TIMBUART_IER) & ~TXBAE;
+
 	iowrite32(ier, port->membase + TIMBUART_IER);
 }
 
@@ -83,6 +85,7 @@ static void timbuart_rx_chars(struct uart_port *port)
 
 	while (ioread32(port->membase + TIMBUART_ISR) & RXDP) {
 		u8 ch = ioread8(port->membase + TIMBUART_RXFIFO);
+
 		port->icount.rx++;
 		tty_insert_flip_char(tport, ch, TTY_NORMAL);
 	}
@@ -199,6 +202,7 @@ static void timbuart_tasklet(unsigned long arg)
 static unsigned int timbuart_get_mctrl(struct uart_port *port)
 {
 	u8 cts = ioread8(port->membase + TIMBUART_CTRL);
+
 	dev_dbg(port->dev, "%s - cts %x\n", __func__, cts);
 
 	if (cts & TIMBUART_CTRL_CTS)
@@ -293,7 +297,8 @@ static void timbuart_set_termios(struct uart_port *port,
 	baud = baudrates[bindex];
 
 	/* The serial layer calls into this once with old = NULL when setting
-	   up initially */
+	 * up initially
+	 */
 	if (old)
 		tty_termios_copy_hw(termios, old);
 	tty_termios_encode_baud_rate(termios, baud, baud);
@@ -500,4 +505,3 @@ static int timbuart_remove(struct platform_device *dev)
 MODULE_DESCRIPTION("Timberdale UART driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:timb-uart");
-
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
