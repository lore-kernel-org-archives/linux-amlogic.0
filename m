Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3D7CD1288
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x25/i2RpHSKh99ezGeS+lM1CQh9jAsIVuDb1Il0wUIE=; b=OFGI4KxQE6BD6Z
	qZNVKzkQKHBaZse+VWYIJR2ccpLTX2PSP/06YiVg+Pw2AdZbQuUfv7wvU9h3yj6rFSM/Bc1S4YzPY
	01U7J95NazJ8ThzdArcKXZhVVezka7rH2R3TawZluBKp4TQkfmIjbYz52O5OHnlr1J9j78DtrOZl9
	+18QcN4RtgBDwJLeyP0hiVKH80bDz9+t17SdxFmYtvT/NLsXR0EuP0GIzmg6ycF6+thCKCoEXwylu
	wjCbvQZ10waOQxAxXRR7MwjaGYPjor3p6Ac5Nov+RxnbEyJ7I1ku/rZQ3ptHc5R+LpdOs6CxiwDyX
	yxrzbpZvoorDiE6ckbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7Y-00000003YUT-3TH2;
	Sat, 08 Nov 2025 23:13:24 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7W-00000003YS7-3l61
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:24 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so3127930a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643601; x=1763248401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIdZxomTiawbxwfqpMnoqPSizZxwJiiryInuVxUgs40=;
        b=SRfe7JHiDNeBT9XxqEp+H/WAH2z/P3K+5gwPooRK3JbVjniCuCidsqCVgGbKvmgabi
         AOHFwV2ZzVO02Oy+V/R5D7DSXtx8xqMnmHkhdgcLNK4O25dwlGAbNQIjh9ZTQve/sEgn
         3JnrXuOeUdmGFoUCr5WIiPOOSGwEkDdPh6e/6pmq7Cu5gWgQs8KxisjGZ4U3g6pWnyDW
         lhLprEP7xiO9H8MZNWJcg4eGxIz/4vcGXSwQmCsBoAvsM2QG0Df/L4VnE2iJHerXEGPM
         xft3Spm/zMwUHN4JSmVjyFoOk7nEJSQmwdQdUoDzPcqaBg/18ZQMwqTFxKIMemUjczro
         wNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643601; x=1763248401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OIdZxomTiawbxwfqpMnoqPSizZxwJiiryInuVxUgs40=;
        b=OqSCApjRvxaeW/tNW7EYI0hMAvic3r1eXcJJIEzKoCep1013FgaXWeRTkioQEHEji5
         8QuzHBwX4TmY4OHJCZXZ/Alua2s0BWfYNdcIJ6s2EonmUlV1RIA/6FrhzjLtV0x2SX46
         eaA3NpR225lUOJdwQXDEqWvcy2hs+no37dk8OE5UhVv7t1Ai2TVO1DpPSlyNpeHIf2jA
         z+XesunAynJpr+H0t92jqgUEOd/iHfMvV074vSkhmt2vD35IMJZ4TuJQJ+fUZdDeOEuV
         +XFoPWhP9fXs+NE0h3z+c+wrGsHgolQgY5YAaeKhHxSihqRvxaqMGPzxMSXzmwmSSVtN
         Ww8g==
X-Gm-Message-State: AOJu0YzOIOPKh8JThkUznYSZHkHF2QnMb7E/hSIyqwE6iGEKQIA61tR/
	k+TyNbsb1OT+EzDJaZNA6dPtuSk0YYl89YcCqb5Wh9gsUsOrhma/ExwR2NbaFQ==
X-Gm-Gg: ASbGncsRpEzqKzRU8nDCpYmv4Opl7FSvrDu4L1Gyh1JmtcNH5ue1HsZ0nvRCpHIl/C0
	DYyo/zFPST3Y/XKp1uN/hvFLn7EiEpdwP4y1uadd7STdQS/Wp5aSiYHvoyAcpuoGi2l5rnnr/cl
	pcZQYVxPO/fylYDWUgObdnGboDmVy6t2v5y/PR6tSa0iw6bICd2DZZCDxjs4LZPRM7AtMdmv7zP
	h5jX6GNvjRxVBI8QUbYaQo/LT0iecoDyv8+gIIT2sWIbHB6KzXW5ZeLigiiPWSzQ9z1eyhZoF8B
	hFo2hpm3Em2/1mvrou4c/xoGaQFAEql96FN7jB/FLDqG3cXuWP/NuHhGzmQ/8kK01dnPsEf2uHt
	FyCdCTL1JDWRDh6urbH1ucA0JHaZfj3XeGsoLJ0iByroOHcr15ByBA/+c6gQ6CukQZ/D0J8FFsB
	MkCJYjYd8AKH3AX8Q/nHyCs6gTM6qpGNosTcqaGMUY+oI06lN7X/3NvpPKLcGcfn7KcVQxkoaW+
	zyiXuyG2HtEwmkpGPPjc2lW5AqoWOVB
X-Google-Smtp-Source: AGHT+IFQjlRv39XcJklWKjtg5/kXtIXi7GGXYRLVU3hdPD9cbN+MwifNhIboaa4CWjMgje18D1/dkg==
X-Received: by 2002:a05:6402:2106:b0:640:8eed:5601 with SMTP id 4fb4d7f45d1cf-6415e104231mr2993008a12.2.1762643600704;
        Sat, 08 Nov 2025 15:13:20 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/7] mmc: meson-mx-sdio: Use devm_clk_get_enabled()
Date: Sun,  9 Nov 2025 00:12:48 +0100
Message-ID: <20251108231253.1641927-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151322_968615_FF489738 
X-CRM114-Status: GOOD (  13.41  )
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

This simplifies the code. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 2448f21bd683..1159cc911359 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -103,7 +103,6 @@ struct meson_mx_mmc_host {
 	struct device			*controller_dev;
 
 	struct clk			*parent_clk;
-	struct clk			*core_clk;
 	struct clk_divider		cfg_div;
 	struct clk			*cfg_div_clk;
 	struct clk_fixed_factor		fixed_factor;
@@ -627,6 +626,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	struct platform_device *slot_pdev;
 	struct mmc_host *mmc;
 	struct meson_mx_mmc_host *host;
+	struct clk *core_clk;
 	void __iomem *base;
 	int ret, irq;
 	u32 conf;
@@ -676,9 +676,9 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_free_mmc;
 
-	host->core_clk = devm_clk_get(host->controller_dev, "core");
-	if (IS_ERR(host->core_clk)) {
-		ret = PTR_ERR(host->core_clk);
+	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
+	if (IS_ERR(core_clk)) {
+		ret = PTR_ERR(core_clk);
 		goto error_free_mmc;
 	}
 
@@ -692,16 +692,10 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_free_mmc;
 
-	ret = clk_prepare_enable(host->core_clk);
-	if (ret) {
-		dev_err(host->controller_dev, "Failed to enable core clock\n");
-		goto error_free_mmc;
-	}
-
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
-		goto error_disable_core_clk;
+		goto error_free_mmc;
 	}
 
 	conf = 0;
@@ -715,14 +709,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	ret = meson_mx_mmc_add_host(host);
 	if (ret)
-		goto error_disable_clks;
+		goto error_disable_div_clk;
 
 	return 0;
 
-error_disable_clks:
+error_disable_div_clk:
 	clk_disable_unprepare(host->cfg_div_clk);
-error_disable_core_clk:
-	clk_disable_unprepare(host->core_clk);
 error_free_mmc:
 	mmc_free_host(mmc);
 error_unregister_slot_pdev:
@@ -742,7 +734,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
 	of_platform_device_destroy(slot_dev, NULL);
 
 	clk_disable_unprepare(host->cfg_div_clk);
-	clk_disable_unprepare(host->core_clk);
 
 	mmc_free_host(host->mmc);
 }
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
