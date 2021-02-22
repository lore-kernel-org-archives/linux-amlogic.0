Return-Path: <SRS0=VW75=HY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C0FC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Feb 2021 06:12:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F23C864DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Feb 2021 06:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F23C864DD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wQxubgTJYHkWcNyLbov0ud/atZT1geMu5ntC5FJT66I=; b=zum8JS2lMmCYaqJbd2H4fRyJOq
	4PdQ+TzVOE8+rEwDm353F1rQhrOFJh+VwjAYdoRY7hQdFdGYtXvscnicLLsLOcc7J1POnHgy1B0k6
	dLj8Gpv+Wg+Zq1+KBB3rmEZJ1eDoosDbMcB3QdgoyO+GBLTaceYBIkIj2pohUP0euTSErnvkXqroR
	CjBm6Rdz7ElduKVFntjTGUwkOn9M62tN/UklnGT5MKJgAhaexWjlKUnuvIPJxNtOGAmf55kB/+xOI
	83Oivud4c/wMMT/wLQa8F4GIhAfT15B1TFZqpbgEQCdx91BPv4KfU7YsBQW0TqHprd1oBLasysF8x
	00Fsljsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE4S7-0002Ed-6Z; Mon, 22 Feb 2021 06:12:15 +0000
Received: from cmccmta3.chinamobile.com ([221.176.66.81])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE4S3-0002Dv-0D
 for linux-amlogic@lists.infradead.org; Mon, 22 Feb 2021 06:12:13 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea60334ad764c-e1583;
 Mon, 22 Feb 2021 14:10:32 +0800 (CST)
X-RM-TRANSID: 2eea60334ad764c-e1583
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee560334ad53d8-bb2a8;
 Mon, 22 Feb 2021 14:10:32 +0800 (CST)
X-RM-TRANSID: 2ee560334ad53d8-bb2a8
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: glaroque@baylibre.com, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org
Subject: [PATCH] thermal: amlogic: Omit superfluous error message in
 amlogic_thermal_probe()
Date: Mon, 22 Feb 2021 14:11:05 +0800
Message-Id: <20210222061105.6008-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_011211_602756_40A321B1 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The function devm_platform_ioremap_resource has already contains error
message, so remove the redundant dev_err here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/thermal/amlogic_thermal.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index ccb1fe18e..bba9f3b14 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -253,10 +253,8 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pdata);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(dev, "failed to get io address\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	pdata->regmap = devm_regmap_init_mmio(dev, base,
 					      pdata->data->regmap_config);
-- 
2.20.1.windows.1




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
