Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A622C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Apr 2022 05:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2znoJg/PAVnTj8q4R6X4XPZB8G8FkJlEl5+wyg3XQA=; b=nG5fHq7WCrPSEK
	6Ga300ANNu/02vx2+gUHrTkfaZ6Pda3aieg4rY9iVhuCtTmNa1qAVyYGlGu360SIf+EQoW//uEgyl
	1tZRvkQw74oSLHuNkq6Fqi/hSlPpPutthv2hmb7pPAlIzxlaX5Hnj4b0mFW+ASHYC+lEkk2GtqfEf
	BbyhQ6VS/yJ3eUr4k+UdDXaDExdeTSFvkRLMVt/4YIy9wAlGXa7RuEvXH6ItDtY3qTEkI8A3Qc3XV
	1temPG+SGIjB4Clx20ZHPv8vI5KwCtUkJuC5U9qJ4uFP/nbRfozq+wYo+56DBcANLM3+uQ/ZDGssN
	sxkxSG0L8/9q6MclsOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngK1H-00FgAf-8P; Mon, 18 Apr 2022 05:33:51 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngK0u-00Fg3n-Gf; Mon, 18 Apr 2022 05:33:29 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Mon, 18 Apr 2022
 13:33:26 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V2 2/2] tty: serial: meson: Added S4 SOC compatibility
Date: Mon, 18 Apr 2022 13:32:02 +0800
Message-ID: <20220418053202.24528-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220418053202.24528-1-yu.tu@amlogic.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_223328_591194_DBF4D9CF 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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

Make UART driver compatible with S4 SOC UART. Meanwhile, the S4 SOC
UART uses 12MHz as the clock source for baud rate calculations.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 drivers/tty/serial/meson_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 58bd2723c004..43941f21735f 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -790,11 +790,19 @@ static int meson_uart_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct meson_uart_data s4_uart_date = {
+	.has_xtal_div2 = true,
+};
+
 static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson6-uart" },
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
 	{ .compatible = "amlogic,meson-gx-uart" },
+	{
+		.compatible = "amlogic,meson-s4-uart",
+		.data = (void *)&s4_uart_date,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
