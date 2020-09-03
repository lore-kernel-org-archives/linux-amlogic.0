Return-Path: <SRS0=B1XO=CM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86397C43461
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A0BC20797
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2020 23:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Ld9SGXK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VhBq0Pd1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A0BC20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UhbTao4lUxY/piIvkeV8+9DRubS/vuQYprSdM62g5kg=; b=1Ld9SGXK834TmFusO6kV/FoQg
	eAoJCoup2+oWPn3kbCYVOexXmb3PykEJjHsbwD5zhO1k/kKWrOBminIXOzP/qSmuJcX1/pC+CNqQP
	kCWWq2LKXXE3KBMgXe7EYrjzCVDb5XPq36de4n7xRt6/AtXIPrV1TNd0dn+WC02R9WQ1BDKDHBQki
	fhW8vaedGPmedLEKnDvXn7n8h3wadREfHf/FXXBoITy5BGDKwgnpuJvajMxeGu3lqU/Hf2LCcP83n
	QBmjAPE6JQtfDaTN+HU6oKQM6ojJncZSaS189jb0h2z53podoSZRyxUveXIUCO/PHxxmEPrBL2uj3
	602hrqPGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDybv-0007Gn-9b; Thu, 03 Sep 2020 23:25:43 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDybQ-00073i-Hc
 for linux-amlogic@lists.infradead.org; Thu, 03 Sep 2020 23:25:17 +0000
Received: by mail-pg1-x541.google.com with SMTP id v15so3338257pgh.6
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Sep 2020 16:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ak7sgXD1yUS+b4yneXUgmseigL5T/tHURONnrfZ0LI4=;
 b=VhBq0Pd1fQUl41cTBulPJPpdxGflwL0G7Gqg1UwnWwh7hC3EHSfa7oPF3xPReYY4jn
 BAWM7qrieI6Kba9y15jYXktkL7ZlLYJjFqbAHH+2+qgP7TtD6dXZkTSM/dM7KV4y/BQ2
 YfsUkkK/A9E3N0HUpkt7fYZBAsf2ixttwmFIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ak7sgXD1yUS+b4yneXUgmseigL5T/tHURONnrfZ0LI4=;
 b=GkNhJJh0cKIu+f4PJPs61BedEM/LC8Om0IMuD/kUJ/K+AXGfgdk+uleab4Y/9Ry7Bd
 Z0XakGK/1ngywi0J+TTHxLfSSoo4DVcATRIQAcwGgXVxC4yDanlIahAUv+xWlPp2j+nl
 5DpFT71qGag07FWU2yCuduV0b+Lkwj/Cz8g38m2mqxjeZVT5n5r8jsHxNgT138cztlWH
 t4HblSvdxZPvoNNzYHoPQ2HfzO/aBeylsHDJ8x5paFzliHgUcnZiE20IEQ/qFujO25zh
 Zvg77faIkEycf5DfZF18QRhfJKMC0TrcaAJ+ImprgoOT/aMEzMxEY75ZrONj8vtolQJ7
 6v6g==
X-Gm-Message-State: AOAM532fJImUcDp9swq5QJgZKdfRiPI7wNc5M/BQfIySz/BaQfkeXRo2
 uUfOQE/D6XEeiHDaYXJ9V7qPhA==
X-Google-Smtp-Source: ABdhPJzWCp1ofM9pNblsz3oLmRdRBFRUQauHQjSC92yoCjre8k5Y3NiZEW1Bbb485EaunCczoEjv5Q==
X-Received: by 2002:a62:ea01:: with SMTP id t1mr6001343pfh.125.1599175510807; 
 Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id q7sm3614459pgg.10.2020.09.03.16.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 16:25:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 6/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that are
 newer than 5.4
Date: Thu,  3 Sep 2020 16:24:41 -0700
Message-Id: <20200903162412.6.Ib121debfb18e5f923a3cd38fe9c36aa086c650c5@changeid>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200903232441.2694866-1-dianders@chromium.org>
References: <20200903232441.2694866-1-dianders@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_192512_639676_3235F651 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 Douglas Anderson <dianders@chromium.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 linux-arm-kernel@lists.infradead.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 linux-amlogic@lists.infradead.org, swboyd@chromium.org,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
probe") but applied to a whole pile of drivers.  This batch converts
the drivers that appeared to have been added after kernel 5.4.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/meson-mx-sdhc-mmc.c | 1 +
 drivers/mmc/host/owl-mmc.c           | 1 +
 drivers/mmc/host/sdhci-esdhc-mcf.c   | 1 +
 drivers/mmc/host/sdhci-milbeaut.c    | 1 +
 drivers/mmc/host/sdhci-of-sparx5.c   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
index 53e3f6a4245a..7cd9c0ec2fcf 100644
--- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
+++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
@@ -903,6 +903,7 @@ static struct platform_driver meson_mx_sdhc_driver = {
 	.remove  = meson_mx_sdhc_remove,
 	.driver  = {
 		.name = "meson-mx-sdhc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(meson_mx_sdhc_of_match),
 	},
 };
diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
index df43f42855e2..ccf214a89eda 100644
--- a/drivers/mmc/host/owl-mmc.c
+++ b/drivers/mmc/host/owl-mmc.c
@@ -689,6 +689,7 @@ MODULE_DEVICE_TABLE(of, owl_mmc_of_match);
 static struct platform_driver owl_mmc_driver = {
 	.driver = {
 		.name	= "owl_mmc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = owl_mmc_of_match,
 	},
 	.probe		= owl_mmc_probe,
diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
index 71bf086a9812..ca7a1690b2a8 100644
--- a/drivers/mmc/host/sdhci-esdhc-mcf.c
+++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
@@ -509,6 +509,7 @@ static int sdhci_esdhc_mcf_remove(struct platform_device *pdev)
 static struct platform_driver sdhci_esdhc_mcf_driver = {
 	.driver	= {
 		.name = "sdhci-esdhc-mcf",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sdhci_esdhc_mcf_probe,
 	.remove = sdhci_esdhc_mcf_remove,
diff --git a/drivers/mmc/host/sdhci-milbeaut.c b/drivers/mmc/host/sdhci-milbeaut.c
index 4e7cc0680f94..148b37ac6564 100644
--- a/drivers/mmc/host/sdhci-milbeaut.c
+++ b/drivers/mmc/host/sdhci-milbeaut.c
@@ -333,6 +333,7 @@ static int sdhci_milbeaut_remove(struct platform_device *pdev)
 static struct platform_driver sdhci_milbeaut_driver = {
 	.driver = {
 		.name = "sdhci-milbeaut",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(mlb_dt_ids),
 	},
 	.probe	= sdhci_milbeaut_probe,
diff --git a/drivers/mmc/host/sdhci-of-sparx5.c b/drivers/mmc/host/sdhci-of-sparx5.c
index 747f108a0ace..28e4ee69e100 100644
--- a/drivers/mmc/host/sdhci-of-sparx5.c
+++ b/drivers/mmc/host/sdhci-of-sparx5.c
@@ -255,6 +255,7 @@ MODULE_DEVICE_TABLE(of, sdhci_sparx5_of_match);
 static struct platform_driver sdhci_sparx5_driver = {
 	.driver = {
 		.name = "sdhci-sparx5",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = sdhci_sparx5_of_match,
 		.pm = &sdhci_pltfm_pmops,
 	},
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
