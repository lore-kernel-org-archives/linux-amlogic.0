Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E32AC04FF6
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2024 05:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFAYAat0246LKKUIwL7ibOWMva3kXlSRs1bZsslfsIg=; b=12lgVlI1XQGti4
	FBiHarGnIcwtZW5g2ow4OTcgXT72eCF/s5+bG5hkXiVTUO5GmNkTibCYb9MWkL5s20KXhSSPQUqxJ
	KfRLCkAx9gYpUC5GHJASDfUWKmeJDQT69EdipBcmkOsKJqgqrddeRV6OiN5MEns6eBBMHRwRaeuB2
	L+JSeSjDjPOQUyTHL9dhTQY9l3Cv01NSHFtV/bR8/4lfb4tfPbtUnyXJIrBOs/ru8L+hhshIVN+cj
	vKvmWursI8ZpBMVtTuNEzrHGk4AHv55v3I3vz29ryIiQEvlK9tvdXAlfb4qqS7u8OzQdrF0KzcPMP
	LV+O2780TRN61L0QPqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwbgK-0000000AyPU-2ZXH;
	Tue, 16 Apr 2024 05:48:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwbgI-0000000AyOx-0sZw;
	Tue, 16 Apr 2024 05:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5427CCE0EE2;
	Tue, 16 Apr 2024 05:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC4AC113CE;
	Tue, 16 Apr 2024 05:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713246510;
	bh=TenS7osWv9s/9Jh6uxGzY8R47mJAGgM3ek3C2c2/Yho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbER8nYLUIIjS30NXjJqeds3Ul9G382K+Go27g16/LkqOliUU2PcQbgsZ7IwVvPQB
	 AvpNaz1cli8oqhHZWJJnULv7FWqPsLzHGW/ntcCQTkCP87G4atKjmkVRZok/QHp07I
	 R65Of2LEoRmDC0O/0gSeiMm7/PJUX0jIikO6fvjaVMeXb0oD2UZxMBacBGXuPpGOL/
	 XuKWsqTFXsNO6SESO2ZjELkmC2A0GgsJCCRtO42v0FglZEN7LSM8VhPfrPDOj98Viy
	 Ikxqi9XqxbXNGjNGLvnL536ZmKVPxi+imFyZWeeLasK+K2+Jz2Qs+Fpd6WihkgMQt3
	 yJGntA62YB6Rg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] serial: meson+qcom: don't advance the kfifo twice
Date: Tue, 16 Apr 2024 07:48:25 +0200
Message-ID: <20240416054825.6211-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <1dd9e3a1-29d0-4628-9b6a-b7e9fc09bf0f@samsung.com>
References: <1dd9e3a1-29d0-4628-9b6a-b7e9fc09bf0f@samsung.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_224834_638563_FF74D4EF 
X-CRM114-Status: GOOD (  10.41  )
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

Marek reports, that the -next commit 1788cf6a91d9 (tty: serial: switch
from circ_buf to kfifo) broke meson_uart and qcom_geni_serial. The
commit mistakenly advanced the kfifo twice: once by
uart_fifo_get()/kfifo_out() and second time by uart_xmit_advance().

To advance the fifo only once, drop the superfluous uart_xmit_advance()
from both.

To count the TX statistics properly, use uart_fifo_out() in
qcom_geni_serial (meson_uart_start_tx() already uses that).

I checked all other uses of uart_xmit_advance() and they appear correct:
either they are finishing DMA transfers or are after peek/linear_ptr
(i.e. they do not advance fifo).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
---
 drivers/tty/serial/meson_uart.c       | 1 -
 drivers/tty/serial/qcom_geni_serial.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 4587ed4d4d5d..8eb586ac3b0d 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -162,7 +162,6 @@ static void meson_uart_start_tx(struct uart_port *port)
 			break;
 
 		writel(ch, port->membase + AML_UART_WFIFO);
-		uart_xmit_advance(port, 1);
 	}
 
 	if (!kfifo_is_empty(&tport->xmit_fifo)) {
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 7814982f1921..2bd25afe0d92 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -855,7 +855,6 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 					     unsigned int chunk)
 {
 	struct qcom_geni_serial_port *port = to_dev_port(uport);
-	struct tty_port *tport = &uport->state->port;
 	unsigned int tx_bytes, remaining = chunk;
 	u8 buf[BYTES_PER_FIFO_WORD];
 
@@ -863,8 +862,7 @@ static void qcom_geni_serial_send_chunk_fifo(struct uart_port *uport,
 		memset(buf, 0, sizeof(buf));
 		tx_bytes = min(remaining, BYTES_PER_FIFO_WORD);
 
-		tx_bytes = kfifo_out(&tport->xmit_fifo, buf, tx_bytes);
-		uart_xmit_advance(uport, tx_bytes);
+		tx_bytes = uart_fifo_out(uport, buf, tx_bytes);
 
 		iowrite32_rep(uport->membase + SE_GENI_TX_FIFOn, buf, 1);
 
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
