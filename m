Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8311C43461
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F9E20797
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwN2GHnX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gDDpJ+qo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83F9E20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B2kIYN1jvta4BgzlyY26BsnpU8pMR2BOhS16B3M3Pfo=; b=YwN2GHnXJBM0Gg85SS1G5y1N0
	kPuGrGDQ9KbROBiznRDWyWt3o2czo1s+efFyB4BXR1TvrkMPt1U2EcDsEXAeMCUqnkctQCA7TxBML
	9IoKTWe5FHd4q1vHa1OSK1y4Mp4ChD/Xr/IGtmhOnUXAPlwgwDdfQlmCv3TfoYOK14a5hILz/ZN8Y
	S6EqMyOCSH6AdFCMgrGDuTxSimWBjt4gc6ZAeBNEwxRowWU67PrLPPvr+AP85D2a9Bv55ikQ6tTRZ
	Mc/rVbH+kukOIJqj3ugm+29niCHErjP20JdRlU6Sd64eQlkY43ej1FQahjrKI6XzRvccSLab7LJxh
	IKBZFgpMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDybm-0007Cb-Q1; Thu, 03 Sep 2020 23:25:34 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDybO-000725-0k
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 23:25:17 +0000
Received: by mail-pf1-x444.google.com with SMTP id c142so3564958pfb.7
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 16:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VAUtvcHaucBqw/xKruQ8sUGNoGTZknTunbUiV4pTWE4=;
 b=gDDpJ+qosozaMJj1Btae6p2MZQMhhZnGxFLO3kw8aeDYZAhuNuDrZAt6QpEJdyl1Bh
 e9bDDjK9n9qUsEaDggXkEziJ4G6PWex0Z1sTvchqG+Ks8r9MQq8uaYR6wipPM7daCa0x
 yOqVA8gm9K1D/hzBdyWum0YnxXlUF0vcVdxhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VAUtvcHaucBqw/xKruQ8sUGNoGTZknTunbUiV4pTWE4=;
 b=ZtbU8Ak2hibl8RZVprxc3211XrtaLjqHzXzcedH2udhZ87hhUpt8AjFNBVoHLE5wNk
 rhv6Z2Tk8vyLi0J37S8PKjnR9g2JY9NRa8wM1bWe+Fh046+s4f5gHUiN1iJWSh6JAuWi
 bI9EAtR3ODE5pEavvgBkEGd+yPQyyT5XUROOmK+hb8+t7Lb6rGVeK4j1FJ0pj2o4/pN7
 l9hQKkr4FsgAxs8HACTyW/SG1tsBBBcGsKKppo8Am+EZYPfrSVe+ErOixzJg/DfOzCm0
 vI7BQU3XpzllliWWPXuoHehWk/84IVdAYiQ3xtVUTEynVaOwEdTIi9cxtIIwF3jh0Nwk
 FNlA==
X-Gm-Message-State: AOAM533OXal2PUjaVfPfS6/DrLiqBX4IhYbhJyESLRnUOet/IsaRFbbU
 vSAaxVL8Wix58Cdvt0fquMLOOw==
X-Google-Smtp-Source: ABdhPJzn/88aILgq2HYbhieGtLauiT7tbZJ6vkVgfNIx/4y3oZ7eUz4kgYyWk0ioH1XoMhXU/q43PA==
X-Received: by 2002:a62:52d6:: with SMTP id g205mr6104288pfb.144.1599175508292; 
 Thu, 03 Sep 2020 16:25:08 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 4/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.19
Date: Thu,  3 Sep 2020 16:24:39 -0700
Message-Id: <20200903162412.4.I84eb3e0a738635d524c90d1a688087bc295f7c32@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
References: <20200903232441.2694866-1-dianders@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_192510_122575_EB5A5390 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-amlogic@lists.infradead.org,
 swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe") but applied to a whole pile of drivers.  This batch converts
the drivers that appeared to be around in the v4.19 timeframe.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/dw_mmc-bluefield.c   | 1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c | 1 +
 drivers/mmc/host/meson-mx-sdio.c      | 1 +
 drivers/mmc/host/sdhci-of-dwcmshc.c   | 1 +
 drivers/mmc/host/sdhci-omap.c         | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/mmc/host/dw_mmc-bluefield.c b/drivers/mmc/host/dw_mmc-bluefield.c
index aa38b1a8017e..10baf122bc15 100644
--- a/drivers/mmc/host/dw_mmc-bluefield.c
+++ b/drivers/mmc/host/dw_mmc-bluefield.c
@@ -55,6 +55,7 @@ static struct platform_driver dw_mci_bluefield_pltfm_driver = {
 	.remove		= dw_mci_pltfm_remove,
 	.driver		= {
 		.name		= "dwmmc_bluefield",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_bluefield_match,
 		.pm		= &dw_mci_pltfm_pmops,
 	},
diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
index 83e1bad0a008..39794f93826f 100644
--- a/drivers/mmc/host/dw_mmc-hi3798cv200.c
+++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
@@ -200,6 +200,7 @@ static struct platform_driver dw_mci_hi3798cv200_driver = {
 	.remove = dw_mci_hi3798cv200_remove,
 	.driver = {
 		.name = "dwmmc_hi3798cv200",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = dw_mci_hi3798cv200_match,
 	},
 };
diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 9b2cf7afc246..a6ff8b4ad1a5 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -755,6 +755,7 @@ static struct platform_driver meson_mx_mmc_driver = {
 	.remove  = meson_mx_mmc_remove,
 	.driver  = {
 		.name = "meson-mx-sdio",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(meson_mx_mmc_of_match),
 	},
 };
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index 64ac0dbee95c..4b673792b5a4 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -214,6 +214,7 @@ MODULE_DEVICE_TABLE(of, sdhci_dwcmshc_dt_ids);
 static struct platform_driver sdhci_dwcmshc_driver = {
 	.driver	= {
 		.name	= "sdhci-dwcmshc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_dwcmshc_dt_ids,
 		.pm = &dwcmshc_pmops,
 	},
diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
index 1ec74c2d5c17..7893fd3599b6 100644
--- a/drivers/mmc/host/sdhci-omap.c
+++ b/drivers/mmc/host/sdhci-omap.c
@@ -1297,6 +1297,7 @@ static struct platform_driver sdhci_omap_driver = {
 	.remove = sdhci_omap_remove,
 	.driver = {
 		   .name = "sdhci-omap",
+		   .probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		   .pm = &sdhci_omap_dev_pm_ops,
 		   .of_match_table = omap_sdhci_match,
 		  },
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
