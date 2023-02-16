Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C189C636D4
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Feb 2023 02:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BNCGi4QmbZumKPG0xjAkl06eXt8vbq/6x3rP8rJTlXI=; b=1vW
	zkGphKocHOthvfCJ89BERWmrO8H/1yrB68xKHEY8Q9M84S8mTMmUPYXbc8i8DE0P2CH0UIO/jEmNT
	nDdPuM3yLFsLZgzf1THtgK63dG5sxAD64lab1GboG1DSZvBDZ2s4ZlcSqGdGltswvU82AgVrXBtpL
	tIrWMD9D9EP5+wRmrTKb8o+L6GyGEiOMNi8THatlcJK9Gd+ybzNjJ1NGz0tWcibhK5fNVa0eLYWmv
	9kZy/kwn8CJLELdaSz0Jr2AduSNv0UAaj64JLPxK29mVhHjF4ZCwrsILpjEvDtIzTwUGU+uVczuav
	AXajpVrrc9hxfvzJgBorTQtyy3QvmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSUQS-008L2v-KR; Thu, 16 Feb 2023 02:55:12 +0000
Received: from mxhk.zte.com.cn ([63.216.63.40])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSUQQ-008L1V-Is; Thu, 16 Feb 2023 02:55:12 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4PHKLM213Cz8R043;
	Thu, 16 Feb 2023 10:55:07 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 31G2swIL024296;
	Thu, 16 Feb 2023 10:54:58 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Thu, 16 Feb 2023 10:54:59 +0800 (CST)
Date: Thu, 16 Feb 2023 10:54:59 +0800 (CST)
X-Zmail-TransId: 2af963ed9b030d7e5fb5
X-Mailer: Zmail v1.0
Message-ID: <202302161054598138273@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <p.zabel@pengutronix.de>
Cc: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
        <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyXSByZXNldDogbWVzb246IFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UoKQ==?=
X-MAIL: mse-fl1.zte.com.cn 31G2swIL024296
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 63ED9B0B.000 by FangMail milter!
X-FangMail-Envelope: 1676516107/4PHKLM213Cz8R043/63ED9B0B.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63ED9B0B.000/4PHKLM213Cz8R043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_185510_794635_9E3755B3 
X-CRM114-Status: UNSURE (   9.77  )
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

From: Ye Xingchen <ye.xingchen@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to Use devm_platform_ioremap_resource(), as this is exactly
what this function does.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
v1 -> v2
change devm_platform_get_and_ioremap_resource() to
devm_platform_ioremap_resource().
 drivers/reset/reset-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 26dc54778615..13878ca2779d 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -116,14 +116,12 @@ MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 static int meson_reset_probe(struct platform_device *pdev)
 {
 	struct meson_reset *data;
-	struct resource *res;

 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	data->reg_base = devm_ioremap_resource(&pdev->dev, res);
+	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(data->reg_base))
 		return PTR_ERR(data->reg_base);

-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
