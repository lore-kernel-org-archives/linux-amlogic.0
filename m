Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE83CCFA13
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fv99JOhJpvPkLoj2pPJrl/XFaVrNsqx84pLSnt0XPg8=; b=gjZrGi0w/d/S2S
	xTI+LyewTjOfVujHkBz6+bf+pIpQ5fINXoA3ioeVYKodUE0yJjxxs1xFcWiFCl1KpKvKG8ActbNfw
	b+2VaZwJhURZ5OpIh7ACEhgl/sxV0zPs3i3Isf+KTmsLqAkbvbbeZwSCNTHxtNQEFWoSfaz3x/xYr
	geK2yYdw//Q0D9bCbFBfU315E+yCLL3RKNk4oXzoYGRedIDixuj9Xxx1125JmcxQe6l8XBAoySEwD
	sh4UBa5hckWK+b+aoMTOeLN5E8mCjP6KaLvMGuzVW5HjwIQPuZfxNh8A/zH/sAtiftuZRfQDy1daU
	PekWwqfIzmvgBib0vXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7h-00000003Ydd-0pzQ;
	Sat, 08 Nov 2025 23:13:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7e-00000003YZO-1cz4
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:31 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso518369a12.3
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643608; x=1763248408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cijZ+09YTsl3uHzpkuOiO4+DMdT2cKq32KSIaXuX+bQ=;
        b=GgB9LgCQwNBxc5JBw8lHT4DH5ZZaPpm9ycr+dld+O8jrah+JA1iA0mgZ3jTy09mJxi
         LQNwtyp8+BfLcYFFJ+HEUI5B0qRQp74TQOOPiRbrLVmmLWoz/OeV5yaAR0Wv07YTQ5qv
         9SBGzhjnJ0HxSLYBL0M6D74eZ+HGshaiJLptmCE1yYYooyoBxn3cgki+VrVuOmjWJyG5
         fdoZLmAQRmRAgc+y6f17yO41tW+4lQ6aq/NaeLMQTAuvUPZBSaVd/FMbwuDVJ1sqAF0T
         IzZ7HCigNVNgciH404Swb9sK74jEVZSINeTYSeLlwREvnoCEzIlncAubMc66QOCJiL/W
         +0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643608; x=1763248408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cijZ+09YTsl3uHzpkuOiO4+DMdT2cKq32KSIaXuX+bQ=;
        b=TMSRgQQpq+ynHFuqr5+qYO5CuKs14xnwMECgtERsYz59iC6ORIif1z0B/J2O+fDx3L
         NKlHvIp4dwN4vn/Zvitf6Uu56guIE4gClEfb1PEqxci4hQnJMxVNVBjayGtswsM72WK7
         wpqlB0Kxgs0BY5cFjcJCQpNFqesHsghXoY1zovnO7v+1lSe0qMRECn0/cvNkjALiIYT4
         XSS2hZZ7XDe7GGzhafo5wk2Qz+LBuOtWyK/2WzhSRdGOg7fSANSbkIgXWWn8HPYMOBN3
         BmLh2GHHHWacKLqQlKoSkqUcyYxt0NB6DN5divlHspfYoGzU8DQ8qpbnJKF0LQmQYzfO
         VugA==
X-Gm-Message-State: AOJu0YwImR2iMOum/vv8EXZ+ISlquFyyQS5jq6rIdWthwaD+BbGSwszG
	XqSjDvCeevF3TppcT2Dae146cahojGAyn6eA7vwgcQz8LNXRq7nuIa1D1bXgcg==
X-Gm-Gg: ASbGncuhLo5rgIZBO3GlUVZT3Ilw3sBXDmvddZKtPVmM3jN+B2ooZBy6oOIdQN3S45J
	rU7yKU5ezDtbYVKZLA23/QkgD7v0F1l1vZrf0D2kcJ7Qz+8/GAui0lJPUNbdiipF2+TpmveqkP5
	Ts8cIqW6c3IQgjTPyG5EclN6htwQSszA0GrxyxDpxM56Oj38QOYMO986kxg6mng533/H3ynt6jE
	UdOLy2It2dwNgHRu9Mk+G46TiydFC+c4l6A5hDAPCjKjACNGe8dCag7IdEyq+i7sItLj0p1Qa8J
	PtLbfAdCD/kCeX9E7fBOx79qhPE/SVS1f517KMcOwia2pbNwvCcpwV+jGI9ptEwKoyXfO7wiDBz
	hU9DrQW8yqK4gRMMlmg3T5Cc0K9EAJQAN7c6vUc1yfOUWqYxxMDaml+XgcbH3yYeKbl8ogqtZyA
	7KVF9dlm4mKjUmYqthtvCgPQicshcZaK/9ad5b3O7UqfanieSHo8ZADh7ltjI02PlavA7Uyljhr
	7fFvS5d2dgtqNnYiR/9b8mpKuQ3vddCqtCZ5Yeoekg=
X-Google-Smtp-Source: AGHT+IGhMEgUC8oM2+pqlrfLLlvVoY4z7bHF+SAAYNYxAbvCQcc6jUd5lgOvOXrATxrEZssO/EG4/Q==
X-Received: by 2002:a05:6402:4310:b0:63b:dc3e:f01c with SMTP id 4fb4d7f45d1cf-6415e6cc622mr2587683a12.12.1762643608311;
        Sat, 08 Nov 2025 15:13:28 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 5/7] mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
Date: Sun,  9 Nov 2025 00:12:51 +0100
Message-ID: <20251108231253.1641927-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151330_461012_B062A06B 
X-CRM114-Status: GOOD (  12.60  )
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

This streamlines probe error handling / logging with other drivers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 214ce84f1ddd..052bcf8f32df 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -520,16 +520,14 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
 	struct device *slot_dev = mmc_dev(mmc);
 	int ret;
 
-	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id)) {
-		dev_err(slot_dev, "missing 'reg' property\n");
-		return -EINVAL;
-	}
+	if (of_property_read_u32(slot_dev->of_node, "reg", &host->slot_id))
+		return dev_err_probe(slot_dev, -EINVAL,
+				     "missing 'reg' property\n");
 
-	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS) {
-		dev_err(slot_dev, "invalid 'reg' property value %d\n",
-			host->slot_id);
-		return -EINVAL;
-	}
+	if (host->slot_id >= MESON_MX_SDIO_MAX_SLOTS)
+		return dev_err_probe(slot_dev, -EINVAL,
+				     "invalid 'reg' property value %d\n",
+				     host->slot_id);
 
 	/* Get regulators and the supported OCR mask */
 	ret = mmc_regulator_get_supply(mmc);
@@ -666,7 +664,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &meson_mx_sdio_regmap_config);
 	if (IS_ERR(host->regmap)) {
-		ret = PTR_ERR(host->regmap);
+		ret = dev_err_probe(host->controller_dev, PTR_ERR(host->regmap),
+				    "Failed to initialize regmap\n");
 		goto error_unregister_slot_pdev;
 	}
 
@@ -680,12 +679,16 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 					meson_mx_mmc_irq,
 					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
 					NULL, host);
-	if (ret)
+	if (ret) {
+		dev_err_probe(host->controller_dev, ret,
+			      "Failed to request IRQ\n");
 		goto error_unregister_slot_pdev;
+	}
 
 	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
 	if (IS_ERR(core_clk)) {
-		ret = PTR_ERR(core_clk);
+		ret = dev_err_probe(host->controller_dev, PTR_ERR(core_clk),
+				    "Failed to get and enable 'core' clock\n");
 		goto error_unregister_slot_pdev;
 	}
 
@@ -697,7 +700,8 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
-		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
+		dev_err_probe(host->controller_dev, ret,
+			      "Failed to enable MMC (cfg div) clock\n");
 		goto error_unregister_slot_pdev;
 	}
 
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
