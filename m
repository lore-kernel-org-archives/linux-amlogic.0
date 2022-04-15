Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FEAC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Apr 2022 23:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJXHTdjMh0MH4t2V5WED8SOELFzHu16oiBTulVA/3+g=; b=umIltObLbh2LKv
	tKNmE2GpHRyQkWfloKw06s3HR2aTx+z+Voir1PBVMTZPsNV3k+15wtlrBFu3lJSL5eSl1I9Hgl1e2
	xRyo9ghJpS4Z/v14i3ck2wIFHAoRYLq89Lwgk9roI5bvx/7ZfDD+tKTZwTg0DxJz60xnXqPNY4kzS
	h5K73qLCKeMFxI64TteC3l5rm7UW/svBeiC6JosI9FhrLG88tU9CfS1ZQVYipeU8kJKlVeB2WoB5w
	c+BdOcOJMD5vgCXeursaJN606gZLnZbHylx/rMqX3dqZyUl/ZPMS+iAKBnTdDuY7cROdCOybPqRes
	kC3elEmEOoApl5RSnmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfV6y-00Bevc-V1; Fri, 15 Apr 2022 23:12:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfV6m-00BetI-C0; Fri, 15 Apr 2022 23:12:09 +0000
Received: by mail-ej1-x633.google.com with SMTP id r13so17517851ejd.5;
 Fri, 15 Apr 2022 16:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=EPTnUhcqYTiOpiX4Cdd1dlt3vybWZ5oAgXayn7jFUS0=;
 b=c9J2ZmChukJUKPILfJ1XwoVOwSOzEHgXi3hZRePBn8GW2a26K9GX1JZwnyXYY1SM2H
 cdOfQiBl3ow9D1OYsrIVkSMS92DMJpC1qtF6UB8GhosX47EqKLezI+Yn0qFwfdEHRb8I
 M6bhYlKIDiEzpWC2XVxRPlBUvfbG0XLE6EimbSsHCXg63RAPhPxLIbwz0wYdef9U8sDp
 l60msYcKuYAURSz4vGCCFWo7RMXdNBYD0JOg90nCMe8mBoK+/rVcenHHsnVuD/isobPT
 K5Ab0VRZrBApEaMyrzKeSZv7FlHK5S+/quUc3P0U9ocO1i2OBpG8L/rpjhKFSsk+EAJg
 h8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=EPTnUhcqYTiOpiX4Cdd1dlt3vybWZ5oAgXayn7jFUS0=;
 b=o8FonaDjytlT3g0gDRxCn+2wfLaq3cGHEY/WD1l/VORg411MmKPfGE6mCLNdm8WZME
 q1lKuOExGjELVU9KyQQJccB4hClE3JrOsu2qiXIQ2kF/hemSYkyC1PQeA+dSlbKodGke
 iGvtqsi0BS902ui9gdncZmOxjdJGWLuvA+TgMUR6IxRaXDUiLZgxuRBH8pUaRkQNcxHF
 FZ8rpgJecI29w/yMhpCLibT9QB/O/fvv+ncz2losoqXgKy1cF7yTRAhmQo7OcRIbhMk2
 efuC462q6N3TLhztr5g2tjZUoWTr07ZRK1AQX5cRnhjpR58U1wwhsbyE6CvyeEsTMCrW
 iatA==
X-Gm-Message-State: AOAM531xatpjFjlvlrZr8ftXwVSr7E2cdTrprlAv5acZf0aUg3VSX7hU
 tbINOvw5Y563hdS2eZhXp54=
X-Google-Smtp-Source: ABdhPJySl3USeTNbzlkGtqhmGo1FM1w1eWuyuk8AWGxKLxFdL9mkQw8oDig8wFwYpqzOkWQ7MJnEwA==
X-Received: by 2002:a17:906:730c:b0:6ef:6d06:2a92 with SMTP id
 di12-20020a170906730c00b006ef6d062a92mr909477ejc.694.1650064326443; 
 Fri, 15 Apr 2022 16:12:06 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7?
 (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de.
 [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
 by smtp.googlemail.com with ESMTPSA id
 b23-20020a05640202d700b00422da9b980esm1046431edx.22.2022.04.15.16.12.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 16:12:05 -0700 (PDT)
Message-ID: <268b3cd5-2388-2553-bdba-c72853f91aa3@gmail.com>
Date: Sat, 16 Apr 2022 01:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: switch to device-managed dmam_alloc_coherent()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_161208_456383_8CDCE6BA 
X-CRM114-Status: UNSURE (   9.47  )
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

Using the device-managed version allows to simplify clean-up in probe()
error path and remove().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 9f815cfbd..d4134b18d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1301,8 +1301,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		/* data bounce buffer */
 		host->bounce_buf_size = mmc->max_req_size;
 		host->bounce_buf =
-			dma_alloc_coherent(host->dev, host->bounce_buf_size,
-					   &host->bounce_dma_addr, GFP_KERNEL);
+			dmam_alloc_coherent(host->dev, host->bounce_buf_size,
+					    &host->bounce_dma_addr, GFP_KERNEL);
 		if (host->bounce_buf == NULL) {
 			dev_err(host->dev, "Unable to map allocate DMA bounce buffer.\n");
 			ret = -ENOMEM;
@@ -1310,12 +1310,12 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		}
 	}
 
-	host->descs = dma_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
-		      &host->descs_dma_addr, GFP_KERNEL);
+	host->descs = dmam_alloc_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
+					  &host->descs_dma_addr, GFP_KERNEL);
 	if (!host->descs) {
 		dev_err(host->dev, "Allocating descriptor DMA buffer failed\n");
 		ret = -ENOMEM;
-		goto err_bounce_buf;
+		goto err_free_irq;
 	}
 
 	mmc->ops = &meson_mmc_ops;
@@ -1323,10 +1323,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_bounce_buf:
-	if (!host->dram_access_quirk)
-		dma_free_coherent(host->dev, host->bounce_buf_size,
-				  host->bounce_buf, host->bounce_dma_addr);
 err_free_irq:
 	free_irq(host->irq, host);
 err_init_clk:
@@ -1348,13 +1344,6 @@ static int meson_mmc_remove(struct platform_device *pdev)
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
 	free_irq(host->irq, host);
 
-	dma_free_coherent(host->dev, SD_EMMC_DESC_BUF_LEN,
-			  host->descs, host->descs_dma_addr);
-
-	if (!host->dram_access_quirk)
-		dma_free_coherent(host->dev, host->bounce_buf_size,
-				  host->bounce_buf, host->bounce_dma_addr);
-
 	clk_disable_unprepare(host->mmc_clk);
 	clk_disable_unprepare(host->core_clk);
 
-- 
2.35.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
