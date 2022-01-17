Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E652C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 02:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ZsdMqpsXsX62AwH0Gzp+0/hc54OuyCdsI2j9AI+zL0=; b=uitWpCcO6z48rY
	nEbb6iBybXcnY4LQNyQUnWLG/WwN2XgKBsOOQCf+Hxiz2PFyXRI2GFs/NzQeo4kXIPs9HZnYYwJGn
	dZAhlqEjvM9GmlcjW29lsTItthkZUj/BYD9c4g7CIUjLHtn9f0lKYk0/nzaS4tYD6SsbfVe2/cnj5
	3zYy5ZoVndkq1MW5ec5MefxVi7nZASmBGALsEsIBT3mXmksGVHEjsNjVQcAIFM/zgtzEGozgVwqmA
	z8kpplwPtYlM5wambxUARkNZkHZhzY2aS9HP6g7OmErqjCOXHqvvlkVX7xc/bokqa2B19Hr6YfslI
	OZK/+fZ5vah9hrRz+y6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9IEH-00DIjA-3D; Mon, 17 Jan 2022 02:58:45 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9IE3-00DIgc-4T; Mon, 17 Jan 2022 02:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1642388301;
 bh=JGr2weHXTxFi2FBYoPnWBMe7jsciVyJNcATS4sCqvi0=;
 h=From:To:Cc:Subject:Date;
 b=jKxftl1Bwn2KBbcIMoHyZ8jP7OC3Fvc/W8K9PfybQIaDl2bHIozgkFf0giiC+Esh7
 uovCeKsRct3SqDHOdHTHX/ImMFmGVc1JMnlx2pNQ5UncrNzWBK5ob8de4Vh3Xca/nh
 Y+2gmNN0RvCFQOetYLFvC+LvjqAaEBob7f+CGuwM=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrsza8.qq.com (NewEsmtp) with SMTP
 id E900C0C4; Mon, 17 Jan 2022 10:58:16 +0800
X-QQ-mid: xmsmtpt1642388296ti8y3o2r2
Message-ID: <tencent_0589E3FF08A4905922F78BC38602361C5505@qq.com>
X-QQ-XMAILINFO: NqPEjZpmuGEFRaoDyprIgkXuk3dUIQyMkzK+WHIbhIFdQ0G4Nugt3kB5ayloZS
 HM9mp0jweU7D+t19VetxxU7sGTlTUq6boUV/LO3W0dVqQMq9VzMdE5G8vvV/AeffhvFvM+Lb3Tvf
 P+gXe9NgqiKnMn7SF7qQ7kEpiwx0WgcgJAThc4HeWc1teZq5cnvPL/RCdX67sLlNpu4qYMDWv4rL
 4d4B7T7oop0MqNqL6erS1tIiBHEVxbLuREWwAq7+U6x9BmFUDqRuXHeP9aErKk/mYnnOiV/mvO43
 aRPUMuK6aQIV+IfsR5N0WgBVuJmvLluSBeY0sYF1IbbpAO30v+MMmprvhK9ydFvS/cGODo8JdGs9
 /bsepshyp7Yx8K2T8d9SgX3UBCsmKUAg94I8Z32LyjhsBDtsrjSS/neihzSQFkF+vtI/VSCYdIGe
 7Lhwvp14UB+sXc1G64ZJJb0HJ9tge/Y6jnxYkUqkXw3f95wEQT977NxhsIOS0mdQJtkgeaBnUFml
 akd1G+lTJ539j0Hdqw8eZgPAq/lJmEOZ7P74ir6iNOMmEAYTvU83Iq9cy0L1oCc7dGichWjNHPmb
 LTlLXKXEbve6e3648uQMmoVO+7pBx0opJrDWxRECugK6i9IevCKVn7OWTqhhwiJB+jCgfbCb0bmZ
 MCUdccXjVCOxyqLYNauINVKqalxKSo+FfjLLz3juOJXism7sio+/brBZCcraIM+3XFAeVlmlL+TT
 a+hOYIeonl9B4z2y8ZRV2g+odtvuco1S8F7UQPedUcy3DihMiINoDkhgnH+XfEV4cprHk0e4Vhjo
 y3Xt1BXlsxisRk68JScRfHmfZu8TyqE2aq2WgaFAcZ1Lzi7jlwbJIv4JBZ4S7HXJLvHRIuqUCfL6
 w2aUeVwy0B
From: xkernel.wang@foxmail.com
To: martin.blumenstingl@googlemail.com, srinivas.kandagatla@linaro.org,
 narmstrong@baylibre.com, khilman@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Xiaoke Wang <xkernel.wang@foxmail.com>
Subject: [PATCH v2] nvmem: meson-mx-efuse: replace unnecessary devm_kstrdup()
Date: Mon, 17 Jan 2022 10:56:21 +0800
X-OQ-MSGID: <20220117025621.3214-1-xkernel.wang@foxmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_185831_863464_D172B3A5 
X-CRM114-Status: UNSURE (   8.31  )
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

From: Xiaoke Wang <xkernel.wang@foxmail.com>

Replace unnecessary devm_kstrdup() so to avoid redundant memory allocation.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
Changelogs:
Simplify the patch to replace unnecessary devm_kstrdup().
 drivers/nvmem/meson-mx-efuse.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 07c9f38..13eb143 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -209,8 +209,7 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(efuse->base))
 		return PTR_ERR(efuse->base);
 
-	efuse->config.name = devm_kstrdup(&pdev->dev, drvdata->name,
-					  GFP_KERNEL);
+	efuse->config.name = drvdata->name;
 	efuse->config.owner = THIS_MODULE;
 	efuse->config.dev = &pdev->dev;
 	efuse->config.priv = efuse;
-- 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
