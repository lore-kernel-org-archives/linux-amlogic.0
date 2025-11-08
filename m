Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C53CD1288
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqIYPpLSDYiiV0KYmDC1OwoWqPoMLyMRks1uUXdEd7s=; b=A64MBiYAfY1HJ7
	/QV07izx1WWloiA1ad3OhWNUw3fQI9yTKRhr82XKEGKyXqcVl3d2ZKUbWgOCbg4jzlA1Qhc0YglKq
	s9O9DB7cOHNGDRrd1wugFN3TpvLU68m7bzYsPjRdKSRq+D6PvNw2M/7Xs0oQnRF/GE1gg1CsK1N9i
	sSKrMYOqwVUHbnctwF+jZ0YUPxxpX/ilRTpmRLlQKqXawnScTjo5vRArA+UNlB5P9SV+ypS5Bi4sa
	FpnpOiGaTY+Ra3X+GM++luHt6cVLRf2914km+QkWfnLxujg2G8Cr3+7JbbjA/4nqLhktqEN8RV0Ay
	h89+Ugc/18iHzKmw3Z9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7e-00000003Yar-2aqC;
	Sat, 08 Nov 2025 23:13:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7b-00000003YWD-2MOm
	for linux-amlogic@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso3435605a12.2
        for <linux-amlogic@lists.infradead.org>; Sat, 08 Nov 2025 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643605; x=1763248405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MEwQ3w0WXL0SbyJSEK5ayMTVI87i1RH9nRchsrOxNc=;
        b=AsLDNHxuBxUawAmUxvHxixzanpSB6uiZN8E8yNrVNbIgGekUdLuBYW+bmUH+eONAjv
         kEeNOop5peDEWdgKqtj2iktQWDJ1vMcUG0sAPBHnH6BHMqUnycCuzEAENxvSC8Xe0MZN
         mF/6zf+XZtq9mwk5CrqlgOzdzGn5uMrDRI081w/UQZCz0viXQDO1loZwO6X/06ehpDTX
         6ipkA8MXV+JhinEff6iy+P24lVMYS1M3PFjK3WufCCcs2mKZjSwEYAnc8hcr5ttdhidQ
         1R8hC+5oxcsFg8T0TP4t5DEAxi+D0D9Rnb9d7SxGAwwOUAZfjhCToX1H3xFW6v267SG8
         kfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643605; x=1763248405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1MEwQ3w0WXL0SbyJSEK5ayMTVI87i1RH9nRchsrOxNc=;
        b=YKqs5Jkf0GeFXDnrR5z35GkOEgQIv70giDY7G54JEXIFoFJ56mliySAwvicTQJSCDJ
         T5sYoAorLbdjMiqVC0vAA2yf/be+soKm48tJ6HOQPYWpQdDFM92kXsYU4+r8D6m9Pj3U
         vt/ciEqmqfg2DLI9F0OTrjZyjZm6slMSN+cw7gkkLqY4doP3AcB9O9YFGL3HDfRlPw7W
         MbftZHnRaC5bdpfXgca6Lnv03mGPNAbhhaEZTmZuWMS0oAjFickgBxzCy17i/Do6B6OY
         ISmgPSIXRV2JJOMO6HX5FKQnLTI11mTRqJaU311E3iXtSy/+X1ebRbQuH/6DhxU5lWUi
         0SFQ==
X-Gm-Message-State: AOJu0YxVYZ5jEyP9gZyMOK7bj6bJkkTxxlfnG4t4LtyN2GVUGG7+17On
	WQ12ZqEBWLXCIQHVdi2R61/xGXIbO47P7+Ytzg5MNBS98O06zb7SlAi3H6wtuQ==
X-Gm-Gg: ASbGnctLuCgHQJMBDnthCr8dNt6MIhyQ4IzSK3G8Z8BCMkVaS0CvI49L23LO0o2X0h4
	Wt3XKYJKCJPIl5edOG21rpKNsW4NGDphPEicHiZj6lCNtlXFPksanlUkhTjzQ60KpRxzky6nXIn
	FUJ93OInA6Z24Ip/tD19YZ9WF1k+BYxS6fikdlvM21ZSpvx3qb6y39upKIoqegtI0vxpfCiRkma
	/9b0m75vP8CUVwTm4yzP7KR7G1gO3ienoJKjOp7p49i+cszYApCzh7hxtfTSkVSkI24hATNoRhJ
	Vm4oZgKqcpUoShygwDNZ3Mu4vxJaJtL6qJAoS+ZBc7Om6SSCdl/GQRaqVNqJ47X2dgMzAJsO+CE
	f52mW51ec81be791p9al34dSgVSkGXCybb1yGLZwhdKIfGj1NQ8VSMrpWx9+Btj8SoZL/DB8g5w
	2gLMbn22BR1s376JSOmUqLrwsr2DHtPFF19RW4rL8fusb9h4VhJs/URTWYhEYExyLeQJ3QVBXkb
	YGnI0Z4Fk6YkDXd5s5uvxhEw2yRVJHyWvxXYKfzrOk=
X-Google-Smtp-Source: AGHT+IEsR1rp3/X0FtnDGE5wBY+8APLUTqmqxSkpd5bpl/RawvNHr6XzcekK44kWFCslKuF52z+IjQ==
X-Received: by 2002:a05:6402:305c:10b0:640:ebca:e680 with SMTP id 4fb4d7f45d1cf-6415e80f7fdmr2452169a12.37.1762643605472;
        Sat, 08 Nov 2025 15:13:25 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:24 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 4/7] mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
Date: Sun,  9 Nov 2025 00:12:50 +0100
Message-ID: <20251108231253.1641927-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151327_636840_25285F81 
X-CRM114-Status: GOOD (  13.46  )
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

From: Binbin Zhou <zhoubinbin@loongson.cn>

Use new function devm_mmc_alloc_host() to simplify the code.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index ce1828d915da..214ce84f1ddd 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -648,7 +648,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	else if (IS_ERR(slot_pdev))
 		return PTR_ERR(slot_pdev);
 
-	mmc = mmc_alloc_host(sizeof(*host), &slot_pdev->dev);
+	mmc = devm_mmc_alloc_host(&slot_pdev->dev, sizeof(*host));
 	if (!mmc) {
 		ret = -ENOMEM;
 		goto error_unregister_slot_pdev;
@@ -667,13 +667,13 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 					     &meson_mx_sdio_regmap_config);
 	if (IS_ERR(host->regmap)) {
 		ret = PTR_ERR(host->regmap);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	ret = devm_request_threaded_irq(host->controller_dev, irq,
@@ -681,24 +681,24 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 					meson_mx_mmc_irq_thread, IRQF_ONESHOT,
 					NULL, host);
 	if (ret)
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 
 	core_clk = devm_clk_get_enabled(host->controller_dev, "core");
 	if (IS_ERR(core_clk)) {
 		ret = PTR_ERR(core_clk);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	host->cfg_div_clk = meson_mx_mmc_register_clk(&pdev->dev, base);
 	if (IS_ERR(host->cfg_div_clk)) {
 		ret = PTR_ERR(host->cfg_div_clk);
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	ret = clk_prepare_enable(host->cfg_div_clk);
 	if (ret) {
 		dev_err(host->controller_dev, "Failed to enable MMC clock\n");
-		goto error_free_mmc;
+		goto error_unregister_slot_pdev;
 	}
 
 	conf = 0;
@@ -718,8 +718,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 
 error_disable_div_clk:
 	clk_disable_unprepare(host->cfg_div_clk);
-error_free_mmc:
-	mmc_free_host(mmc);
 error_unregister_slot_pdev:
 	of_platform_device_destroy(&slot_pdev->dev, NULL);
 	return ret;
@@ -737,8 +735,6 @@ static void meson_mx_mmc_remove(struct platform_device *pdev)
 	of_platform_device_destroy(slot_dev, NULL);
 
 	clk_disable_unprepare(host->cfg_div_clk);
-
-	mmc_free_host(host->mmc);
 }
 
 static const struct of_device_id meson_mx_mmc_of_match[] = {
-- 
2.51.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
