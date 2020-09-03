Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03710C433E2
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75972078E
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5q4cP5D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fywm/KnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75972078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=coYQ8ZpVPMk+2s9PPzjaap+16xZb7SF5OsBZqORVM2A=; b=a5q4cP5D/DjKm42Q31yBrCQ9Y
	rKH3EU1nqFRGN7Z2s/9vSMhKLqw80OD8h3Emok/rHh/W+Gr/CdtpyeRMqMFJp0uc6enp0LhG11lrf
	5VV2uueigvJ9e12zchQy/FTFt9r1PJN1p+ChgEPIqzUvI0+2GYnh4q3DedIVjWqCok3vKQsc8n0AU
	DX1a7O/Ca9bUY3Va+KyJRhXAc1i0Sznqow5OetVPYiTbnsWNbiGqM+E2g3bl8TS8tR1YxE3MiTb0e
	KdX5zEWXbG995CEI1BNsjq6S+0G0W2SCUzNHQqHcu7R2caqXfAViSUQejLETRfS7T4A9IN+v01+4q
	VxjHxkiAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDybg-00079y-Ip; Thu, 03 Sep 2020 23:25:28 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDybN-00071p-4x
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 23:25:15 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mm21so2292196pjb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 16:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3Silfeuvcl4kFvZfCEi0iNKtoIc6amr53FeYznXPLY=;
 b=Fywm/KnARDujk3kviDnTvg5Pzu5ITteK2BzgBrSgWH267O/quBchd8mdypWa+2dAQ4
 I4MfECk2zW6oL11efjvlJ9FO2XMUh/0vsq6+JEgZ9gyS/3f6tyHUkqi0P3/H1ZURF80H
 d12vvD1zoSH6MMHXLbmg5z7NUNja90YIwXbik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3Silfeuvcl4kFvZfCEi0iNKtoIc6amr53FeYznXPLY=;
 b=EQRaw20akA6GM9do3MpSa2EBN+DUPCvCdceQUpmrccRovMRTsGbbxz8L37SOhm9MU0
 7Qd+3LMREPRgZn+DwO7dZZgTOKwVI4d582HigfsF56JdASZTASujkv2cuCRppyMZWmbW
 FIRRqQKFDvJjrYDnYKFH2ovbaMwhiLuKz6rwhum0g0mIGx/CMWpxI06JK3F/qu5jHabp
 fF1ejxmd3iHhP5KEQoLXqMxXRNXB37Z783LmRyzCI5XA5bloUxg5DkA0XsvmYw4T4Cq+
 6SWf/ksWjdwewBP+1/uPPJNMucymJUodu4hYdeGWUEzTHmQ7M8H0aPwUU+RU24dOl1EE
 5rgA==
X-Gm-Message-State: AOAM530AiehjRkzOar34xFoI+OcmXlOSChFJD1gyHbXurfzoCrIESCwF
 ZV7dtDdtoR4ZMIOED52ufadqhQ==
X-Google-Smtp-Source: ABdhPJwWfzAZ10vPfR0QJaoB8eHonW3CA+X8yz8LX3T/aJxkGo07VPL8MlU0us3e1q5HTyrCwErD2A==
X-Received: by 2002:a17:90a:8b04:: with SMTP id
 y4mr5135673pjn.115.1599175507021; 
 Thu, 03 Sep 2020 16:25:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:06 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 3/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.14
Date: Thu,  3 Sep 2020 16:24:38 -0700
Message-Id: <20200903162412.3.Id1ff21470f08f427aedd0a6535dcd83ccc56b278@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
References: <20200903232441.2694866-1-dianders@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_192509_350410_25A1E0E6 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Saiyam Doshi <saiyamdoshi.in@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, swboyd@chromium.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hu Ziji <huziji@marvell.com>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Robert Richter <rrichter@marvell.com>, Stefan Wahren <wahrenst@gmx.net>,
 Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe") but applied to a whole pile of drivers.  This batch converts
the drivers that appeared to be around in the v4.14 timeframe.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/bcm2835.c                    | 1 +
 drivers/mmc/host/cavium-octeon.c              | 1 +
 drivers/mmc/host/dw_mmc-zx.c                  | 1 +
 drivers/mmc/host/meson-gx-mmc.c               | 1 +
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 1 +
 drivers/mmc/host/sdhci-cadence.c              | 1 +
 drivers/mmc/host/sdhci-xenon.c                | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/mmc/host/bcm2835.c b/drivers/mmc/host/bcm2835.c
index 35320bc9dc02..8c2361e66277 100644
--- a/drivers/mmc/host/bcm2835.c
+++ b/drivers/mmc/host/bcm2835.c
@@ -1474,6 +1474,7 @@ static struct platform_driver bcm2835_driver = {
 	.remove     = bcm2835_remove,
 	.driver     = {
 		.name		= "sdhost-bcm2835",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= bcm2835_match,
 	},
 };
diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index e299cdd1e619..2c4b2df52adb 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -327,6 +327,7 @@ static struct platform_driver octeon_mmc_driver = {
 	.remove		= octeon_mmc_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = octeon_mmc_match,
 	},
 };
diff --git a/drivers/mmc/host/dw_mmc-zx.c b/drivers/mmc/host/dw_mmc-zx.c
index d9e483432a61..51bcc6332f3a 100644
--- a/drivers/mmc/host/dw_mmc-zx.c
+++ b/drivers/mmc/host/dw_mmc-zx.c
@@ -222,6 +222,7 @@ static struct platform_driver dw_mci_zx_pltfm_driver = {
 	.remove		= dw_mci_pltfm_remove,
 	.driver		= {
 		.name		= "dwmmc_zx",
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= dw_mci_zx_match,
 		.pm		= &dw_mci_zx_dev_pm_ops,
 	},
diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index a68b43082f61..4ec41579940a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1264,6 +1264,7 @@ static struct platform_driver meson_mmc_driver = {
 	.remove		= meson_mmc_remove,
 	.driver		= {
 		.name = DRIVER_NAME,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(meson_mmc_of_match),
 	},
 };
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 32ab991544ef..90b395a187fa 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -357,6 +357,7 @@ static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
 static struct platform_driver renesas_internal_dmac_sdhi_driver = {
 	.driver		= {
 		.name	= "renesas_sdhi_internal_dmac",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &renesas_sdhi_internal_dmac_dev_pm_ops,
 		.of_match_table = renesas_sdhi_internal_dmac_of_match,
 	},
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 13ff023fbee9..c5f789675302 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -463,6 +463,7 @@ static const struct dev_pm_ops renesas_sdhi_sys_dmac_dev_pm_ops = {
 static struct platform_driver renesas_sys_dmac_sdhi_driver = {
 	.driver		= {
 		.name	= "sh_mobile_sdhi",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm	= &renesas_sdhi_sys_dmac_dev_pm_ops,
 		.of_match_table = renesas_sdhi_sys_dmac_of_match,
 	},
diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
index 4d9f7681817c..6f2de54a5987 100644
--- a/drivers/mmc/host/sdhci-cadence.c
+++ b/drivers/mmc/host/sdhci-cadence.c
@@ -463,6 +463,7 @@ MODULE_DEVICE_TABLE(of, sdhci_cdns_match);
 static struct platform_driver sdhci_cdns_driver = {
 	.driver = {
 		.name = "sdhci-cdns",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.pm = &sdhci_cdns_pm_ops,
 		.of_match_table = sdhci_cdns_match,
 	},
diff --git a/drivers/mmc/host/sdhci-xenon.c b/drivers/mmc/host/sdhci-xenon.c
index 4703cd540c7f..24c978de2a3f 100644
--- a/drivers/mmc/host/sdhci-xenon.c
+++ b/drivers/mmc/host/sdhci-xenon.c
@@ -677,6 +677,7 @@ MODULE_DEVICE_TABLE(of, sdhci_xenon_dt_ids);
 static struct platform_driver sdhci_xenon_driver = {
 	.driver	= {
 		.name	= "xenon-sdhci",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_xenon_dt_ids,
 		.pm = &sdhci_xenon_dev_pm_ops,
 	},
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
