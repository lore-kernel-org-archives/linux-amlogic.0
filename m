Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C9EC636D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=D/6aBYxAYy5QlDRGNvepMZcg//YuD9rzI5y221Bbnzk=; b=uEA
	H/Iqqp7tdti1JdfEU19tBLW6Mhu+QijUKRmyKdmvkLBPT/SXm3iycS2fLNGLn7PxTZ3FCU3Y8z0GA
	JGnxgQyCKimaoZRbLfLXCkmhgfRaYkmzZQWHVawZvAdX9bbY8zDslBKiaR9LKbxvGfsuw+M6QemNX
	hLlDDX0QI6WV7IIZqmEE5+cSW8dMKz8n1EBbZqdse0FSx+x0FwMuQdtxrfFiczlb4YsvJgZ6wnC5B
	e9F73pRASFaZuP7wa3YLXExeqtNcCmu4Kj7ZhBzDSnNPV0BrQplRvwIKHA75lDPiJfzS1KDD3x7OA
	9XHagRKU951dYcwmnGKzQHIGgYXx3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDnO-005H3G-6e; Wed, 15 Feb 2023 09:09:46 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSDnL-005H1m-NV; Wed, 15 Feb 2023 09:09:45 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4PGsj20TMwz501Qn;
	Wed, 15 Feb 2023 17:09:42 +0800 (CST)
Received: from xaxapp03.zte.com.cn ([10.88.97.17])
	by mse-fl1.zte.com.cn with SMTP id 31F99SAv099156;
	Wed, 15 Feb 2023 17:09:28 +0800 (+08)
	(envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid31;
	Wed, 15 Feb 2023 17:09:31 +0800 (CST)
Date: Wed, 15 Feb 2023 17:09:31 +0800 (CST)
X-Zmail-TransId: 2af963eca14bffffffff88a92eb5
X-Mailer: Zmail v1.0
Message-ID: <202302151709312778128@zte.com.cn>
Mime-Version: 1.0
From: <ye.xingchen@zte.com.cn>
To: <p.zabel@pengutronix.de>
Cc: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
        <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSByZXNldDogbWVzb246IFVzZSBkZXZtX3BsYXRmb3JtX2dldF9hbmRfaW9yZW1hcF9yZXNvdXJjZSgp?=
X-MAIL: mse-fl1.zte.com.cn 31F99SAv099156
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63ECA156.000/4PGsj20TMwz501Qn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_010943_955046_A5C2F756 
X-CRM114-Status: UNSURE (   9.26  )
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
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Ye Xingchen <ye.xingchen@zte.com.cn>
---
 drivers/reset/reset-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 26dc54778615..5336da695cc6 100644
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
+	data->reg_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(data->reg_base))
 		return PTR_ERR(data->reg_base);

-- 
2.25.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
