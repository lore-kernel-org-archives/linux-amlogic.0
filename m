Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89A6C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMy8l+/gYPrnoJS0pkKt1RmHEX0Itg13svz8if2m+GI=; b=yW4g5bn/0MbNu5
	Achn9ZLCye0ppsL0r9cnYWroyM2GZXTtu5Y8M87ejbjo6HLdokrh8gz439uzvA6U4RzJ4WHjBN7Fr
	hzNo+mYOoFCaghHLN5+3ysfAuZoe8xKLll2bqhhJSp2JTh2DXd2T+0OaV/ID1aeOR/1F8FmQzGpgk
	ZWvGIVjYf/Cnr13nQsJDfxUi+5AmP9YMAWpLeEMVAkHfrVonO2zFnUy5x9MjHeYAfcLL7j9gKxwB+
	wrRIZqyN2UKzWcqlWltMnOQ2mudqocdg9U3m46sTUrvMZtrGD1iIvR7TduOVVklUY5opEK03WEL9D
	0KxYhBLUBPvTjEnMDRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVEF-003e5E-7M; Fri, 25 Feb 2022 07:41:27 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVCv-003dXE-Ce; Fri, 25 Feb 2022 07:40:06 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2176.14; Fri, 25 Feb 2022
 15:39:55 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V7 2/6] tty: serial: meson: Use devm_ioremap_resource to get
 register mapped memory
Date: Fri, 25 Feb 2022 15:39:18 +0800
Message-ID: <20220225073922.3947-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220225073922.3947-1-yu.tu@amlogic.com>
References: <20220225073922.3947-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_234005_492322_F2D52664 
X-CRM114-Status: UNSURE (   7.71  )
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

Replace devm_request_mem_region and devm_ioremap with
devm_ioremap_resource to make the code cleaner.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>
---
 drivers/tty/serial/meson_uart.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 6b80e41b4cc1..7570958d010c 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -720,15 +720,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENOMEM;
 
-	if (!devm_request_mem_region(&pdev->dev, res_mem->start,
-				     resource_size(res_mem),
-				     dev_name(&pdev->dev))) {
-		dev_err(&pdev->dev, "Memory region busy\n");
-		return -EBUSY;
-	}
-
-	port->membase = devm_ioremap(&pdev->dev, res_mem->start,
-				     resource_size(res_mem));
+	port->membase = devm_ioremap_resource(&pdev->dev, res_mem);
 	if (IS_ERR(port->membase))
 		return PTR_ERR(port->membase);
 
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
