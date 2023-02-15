Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF9AC636D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 20:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0NOPtURmP1FPMYm5/mRE0Uv2cPzTr/ktMWoO6yC0Dfs=; b=pWcL3ZChpRK65H
	P9qAYpUkBZUjCWb+yn2tCthbnYjAXSsK1OQDLRzpMXTKl1+ckAoojy2UhyP7eL4eYS62XceMBy53x
	ZbPKalKxOBfDDtgleBpwYRWwpTTGiF1peaow2SLOV/cSN/ZeTTDQTyPhTWxViqjcWc31O2Huao3Kv
	9wtlZB4nKxkD8KT2kS4Fo4s048f83GWRGx+dx2bU6DSS3M++vAOu9Nb51XtYIY2MPP4ur1M0gCWYW
	njjEVc1eBCk0MtmGb8eykiL94eCqcTnnDDOC/JDnEpWcgWtdWFoP0vM88YOFT8NQLs8mPLdo4TCUS
	xlcuUSsC3FjJoYHDgDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNyf-0072v9-12; Wed, 15 Feb 2023 20:02:05 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNyb-0072sg-CH; Wed, 15 Feb 2023 20:02:02 +0000
Received: by mail-wr1-x435.google.com with SMTP id a2so20350382wrd.6;
        Wed, 15 Feb 2023 12:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p/93qkHziK9obLRpx7s6x9Dm+hSwWIeNTx1UzQJzP0=;
        b=AZnqJPqMZOka5cvE6XA1KMdsK6oMOXVdbQ7FjkPlBB1BgHIhEh4r3ogIzFiaG8tsyI
         tSc8d0bryya78ZfL52bExaEBUbZdwhjYN3FkcuZMSZtajksr1XkwWc4b5osyc4py7D+o
         D/8x3LnttNM9yH7KypKgxAf8rhXkaIE7Wj1OySrNJ2PC8WnHj/IU9mTVDvKjq6QXV9wl
         i3daOcyKwwgHJUbd3Cf/fbb+pTPpR7FeW4Ibg4rzijX3ok+6Sk1W043t17vGv5elOK75
         VaGmlulcXv9+FkP03+9JILQp0adUqbAEH7tC5T+Z6DAz2NPMXo58SR3wA79/gyrcRf84
         vT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4p/93qkHziK9obLRpx7s6x9Dm+hSwWIeNTx1UzQJzP0=;
        b=Bd8D/H87yyqce+H4rppCp9dFhvq3dIfdaxEztxAdHwTWx4ibKQl1cIag4K65EsmtmS
         ATUtgwagNf4Iz+z7HKD6u9R65ycfY9bZo4+ZHqerUhcC328NtR2WMraKckv59mrwDt5y
         4SXnDPTkCsCtWI3OMTGpoXtXhqAbi7PwBbCVv9m0hucJ9cWvHcapZfIQ1QPptythvNMW
         r+D6xJIcsBEy1APHoyB3B140hcTeV2TQgGW8XCKS1k0HQUlUni9d1yhw0MWUHPLsvsrq
         PqxpnM3oJhuQx/k9ZJTIb7jimkHuTLK1GBgGxJ1OIRI4RyTYLNmNXaLmQWxjEAg7RxQI
         hqKQ==
X-Gm-Message-State: AO0yUKUdUd/fwh5FfMbBfgj3+MuziNw5XcMv1fsuNq3Z4mtXjzhmFyAQ
	HBm5JsbneNHYOR1XdKbqO2Y=
X-Google-Smtp-Source: AK7set80hLi4T7IC40nFTB6niTVhOKpElP4k5KAJuhCtGhUbGJHMSCutnkaAQU/rTCdvZq14QTWSAg==
X-Received: by 2002:a5d:43c2:0:b0:2c3:e868:cf54 with SMTP id v2-20020a5d43c2000000b002c3e868cf54mr2575042wrr.13.1676491314038;
        Wed, 15 Feb 2023 12:01:54 -0800 (PST)
Received: from ?IPV6:2a01:c23:b9d5:9700:ccee:9a0d:2992:c73? (dynamic-2a01-0c23-b9d5-9700-ccee-9a0d-2992-0c73.c23.pool.telefonica.de. [2a01:c23:b9d5:9700:ccee:9a0d:2992:c73])
        by smtp.googlemail.com with ESMTPSA id w11-20020adff9cb000000b002c54e9f6bc2sm11892065wrr.77.2023.02.15.12.01.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 12:01:53 -0800 (PST)
Message-ID: <b316c6ba-a373-f1d2-27d2-9add5e25a9d2@gmail.com>
Date: Wed, 15 Feb 2023 20:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: use devm_clk_get_enabled() for core clock
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_120201_457665_A8F2C435 
X-CRM114-Status: GOOD (  11.16  )
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

Use devm_clk_get_enabled() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 079c52dbe..6ed95c555 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -155,7 +155,6 @@ struct meson_host {
 	struct	mmc_command	*cmd;
 
 	void __iomem *regs;
-	struct clk *core_clk;
 	struct clk *mux_clk;
 	struct clk *mmc_clk;
 	unsigned long req_rate;
@@ -1166,6 +1165,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct meson_host *host;
 	struct mmc_host *mmc;
+	struct clk *core_clk;
 	int cd_irq, ret;
 
 	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
@@ -1228,17 +1228,13 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		host->pins_clk_gate = NULL;
 	}
 
-	host->core_clk = devm_clk_get(&pdev->dev, "core");
-	if (IS_ERR(host->core_clk))
-		return PTR_ERR(host->core_clk);
-
-	ret = clk_prepare_enable(host->core_clk);
-	if (ret)
-		return ret;
+	core_clk = devm_clk_get_enabled(&pdev->dev, "core");
+	if (IS_ERR(core_clk))
+		return PTR_ERR(core_clk);
 
 	ret = meson_mmc_clk_init(host);
 	if (ret)
-		goto err_core_clk;
+		return ret;
 
 	/* set config to sane default */
 	meson_mmc_cfg_init(host);
@@ -1322,8 +1318,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	free_irq(host->irq, host);
 err_init_clk:
 	clk_disable_unprepare(host->mmc_clk);
-err_core_clk:
-	clk_disable_unprepare(host->core_clk);
 	return ret;
 }
 
@@ -1338,7 +1332,6 @@ static int meson_mmc_remove(struct platform_device *pdev)
 	free_irq(host->irq, host);
 
 	clk_disable_unprepare(host->mmc_clk);
-	clk_disable_unprepare(host->core_clk);
 
 	return 0;
 }
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
