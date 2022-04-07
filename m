Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9276AC4321E
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97ZWG1mCuoVWU80cN8ENulNSBw2XIS1wcE8uzP7ReMw=; b=dfzh/Ag6qaQG+l
	2rL75vBFS5/PC+St11GELdRIpAHyvc3L/bo9Y3dgLeymsDs1HguJ+c+S+TEjVV7++ZjGXtfIF8NWt
	tXlpZBu115TLLpAQwd6GzaGeMKo8WD2bLXXnNVE2JJy9TzS1nk60HIG92fKBv3NEgQEOOUr7KPl99
	++HsEEQqrU687ve4vXA8B+q6tlQvqI/Zhf8uGvp+3Uxc6yZCNOpagOwg/TXNGBm9B4IQKmtbfoffA
	Rw18wofiN+ND8c4C6ciqEADmHvQlwDfmfeAhNQkBQIL4oVWEZcukXRlkJcZdY+zuJtgLTn4bl2ZMg
	SAmhRxQN492kpvXZqcNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncNmC-00AXlM-BE; Thu, 07 Apr 2022 08:46:00 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncNIi-00AIfm-Rq; Thu, 07 Apr 2022 08:15:34 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Thu, 7 Apr 2022
 16:15:28 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH 3/3] tty: serial: meson: Added S4 SOC compatibility
Date: Thu, 7 Apr 2022 16:13:55 +0800
Message-ID: <20220407081355.13602-4-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220407081355.13602-1-yu.tu@amlogic.com>
References: <20220407081355.13602-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_011532_935867_4045964A 
X-CRM114-Status: UNSURE (   8.00  )
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
 drivers/tty/serial/meson_uart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 7e77693a1318..03c9a305d805 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -803,6 +803,10 @@ static const struct of_device_id meson_uart_dt_match[] = {
 	{ .compatible = "amlogic,meson8-uart" },
 	{ .compatible = "amlogic,meson8b-uart" },
 	{ .compatible = "amlogic,meson-gx-uart" },
+	{
+		.compatible = "amlogic,meson-s4-uart",
+		.data = (void *)true,
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
