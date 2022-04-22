Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2936C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Apr 2022 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2OfMNdJhYwgOdLmREB5fv32ng/ppFsy7KZBWY8Okjo=; b=XXKdQJ7dah5p/j
	yqTRIIhaBGgATf62A7G85lAgjfaHcpp/yVYBqG7eN9i1ZUUa/vB7Gh72CRuyNkLf6h4Xo+Q8Uk/6M
	UG0fBCgIRnos5gJELhpscLfqsAIerY79wO4AHd8QP3U6g1wqEeMk4hdjvnDBB5fy6bDo9a6NGqH0P
	GxdG2opoFs19QzW+cs1oHqaMASLIfVvkMWxoBVweEqp+TJ1712RGwy1NlrSY6yxQxZBkPggKSTPHU
	w3tJfbK/KlOv8/+bSg5ob5UZ3FhaWZ8jAnsHyhqahVQC/dD2ybikXHBu2uUoRfYlH/evYMLe9Euyb
	L7ojYSv2GIj6SEfZSJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhrFm-0009vN-9I; Fri, 22 Apr 2022 11:15:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhrFO-0009kY-Qv; Fri, 22 Apr 2022 11:14:48 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 22 Apr 2022
 19:14:42 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
CC: Jiri Slaby <jirislaby@kernel.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 2/2] tty: serial: meson: Added S4 SOC compatibility
Date: Fri, 22 Apr 2022 19:13:20 +0800
Message-ID: <20220422111320.19234-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220422111320.19234-1-yu.tu@amlogic.com>
References: <20220422111320.19234-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_041447_383593_F446C4BD 
X-CRM114-Status: UNSURE (   8.42  )
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
index 58bd2723c004..c748e5dd5348 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -790,11 +790,19 @@ static int meson_uart_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct meson_uart_data s4_uart_data = {
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
+		.data = (void *)&s4_uart_data,
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
