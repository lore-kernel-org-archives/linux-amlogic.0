Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01F9C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0E9206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lW2/m4lZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y/mudMCy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0E9206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLhAXvf1oGJMwzZ0ra6YvcU2b7Sn2t4S65qEQW/Ypvw=; b=lW2/m4lZXWB//B
	V/gXKTDr87OBqs4bdrb77TyocyR/ERsSc7PfOiYzyBNhgv0WzUYzyybGmsMGonrSU4kyfwPnyVChu
	zWgzDjUajR/w5IxMQUXnAOmp9EpKQtGpZuREQauT4T+YK2dgTMmkWDpS0w7rr74zp3eMqEEQRejgH
	/erYvWKDT9rVLuhViNlZBIM8UZWDPQdoQrNxX+fe5lkZVFt9sugVlavYfvkJPHtD5DjOUqw73c06b
	mHDR+92ubvMc7MXfP/zX4XlaxrodoX9JEnKjIhedNQpIS6mOfSkcAictAajuYva1OGuN6Rc5CZmpx
	XMrarDUqylBvFi5o/7Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsAaS-0004US-DG; Mon, 29 Jul 2019 18:41:32 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsAZP-0003fx-L9
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 18:40:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id g17so62952634wrr.5
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uXX4nW8uApaN5prOQ3tt1oKZQOOA4D/lJ+3xaeto/As=;
 b=Y/mudMCy9V+QjQt70RqfnbUHYMk4Ss8CSL/LCgTrpNOEKgAFWdvekQ6IPJuwsuE2Nv
 NZR/nlBFLC6XbOGVgB8DY/igh/RI8GpWrWYD06FAlUO43DOx2Y9KrTXMmW0E+eoasZXy
 VaumqO+Vsa76E7Us20um8r5I6JfYvohu+5IEuN99fB2jZ7ZdGxt2XKJSkU34O76Kc4CY
 f6+GPbJJd1XSVQsw1E0vyQTn0dfG7FVjEzN28PtmAxcUoqDsW6BQiPmENJqDUPBrA0x6
 KW0UxHOxTHJmTOzo8tw+0O07pUXB/rQvrsVV2wi5eyRSV8FYOFBIsw8N2C4UA4YX4MyQ
 GzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXX4nW8uApaN5prOQ3tt1oKZQOOA4D/lJ+3xaeto/As=;
 b=pOnP2CpMvKML8u92yTt0PT1/cVUKyINnT4YbfzWs0MRLArWCUsf/GfWpLaF75oY/XH
 ye4BeMx9QqQQHVeqjswKn2FQaVDrS8ft+pZX5OpIvLpv7xm68Pd9VcacQKlcVMKZhT8m
 cOLPppnmNygJtrs7GXYTC5D/EjL9xq/ExF0Gm9Mu8OTfl626M/GRHPIWKVvWu8Pddvq7
 +byBwHBGJGQ06VX78T2cmGe54PrevMpAxgxsQk15A2zvJ0K+94ffoC9wgIYbpIJcmMwR
 L1RDhKSKyslIEEliTDrps1dFjLvTVUKlls1gHvXWRZgEhzhTax8sY/YgpKpWtPxSARbB
 kIAw==
X-Gm-Message-State: APjAAAUcH+WHdBuIj/UyWbWAoenjHe5lS8gFSxDDYJfYX70tInZYxQYg
 dbYQ8KH8Ng9kNO2bNV47O7gc6w==
X-Google-Smtp-Source: APXvYqyT7+E9yhALDT4WJ7fusIqGWt+HjrfbfJRzWjySTaW2SjRWy2CfoC7XRRlMgCVm6rS5+/QCfQ==
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr45001624wrw.323.1564425626227; 
 Mon, 29 Jul 2019 11:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
 by smtp.gmail.com with ESMTPSA id g8sm60735790wmf.17.2019.07.29.11.40.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 11:40:25 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 1/5] nvmem: meson-efuse: Move data to a container struct
Date: Mon, 29 Jul 2019 19:39:37 +0100
Message-Id: <20190729183941.18164-2-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729183941.18164-1-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_114027_703470_EB2C20C7 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

No functional changes, just a cleanup commit to tidy up a bit. Move the
nvmem_* and clk structures in a container struct.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/nvmem/meson-efuse.c | 47 ++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 39bd76306033..9924b98db772 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -14,6 +14,12 @@
 
 #include <linux/firmware/meson/meson_sm.h>
 
+struct meson_efuse {
+	struct nvmem_device *nvmem;
+	struct nvmem_config config;
+	struct clk *clk;
+};
+
 static int meson_efuse_read(void *context, unsigned int offset,
 			    void *val, size_t bytes)
 {
@@ -37,21 +43,23 @@ MODULE_DEVICE_TABLE(of, meson_efuse_match);
 static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct nvmem_device *nvmem;
-	struct nvmem_config *econfig;
-	struct clk *clk;
+	struct meson_efuse *efuse;
 	unsigned int size;
 	int ret;
 
-	clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
+	efuse = devm_kzalloc(&pdev->dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(efuse->clk)) {
+		ret = PTR_ERR(efuse->clk);
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get efuse gate");
 		return ret;
 	}
 
-	ret = clk_prepare_enable(clk);
+	ret = clk_prepare_enable(efuse->clk);
 	if (ret) {
 		dev_err(dev, "failed to enable gate");
 		return ret;
@@ -59,7 +67,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 
 	ret = devm_add_action_or_reset(dev,
 				       (void(*)(void *))clk_disable_unprepare,
-				       clk);
+				       efuse->clk);
 	if (ret) {
 		dev_err(dev, "failed to add disable callback");
 		return ret;
@@ -70,21 +78,18 @@ static int meson_efuse_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
-	if (!econfig)
-		return -ENOMEM;
-
-	econfig->dev = dev;
-	econfig->name = dev_name(dev);
-	econfig->stride = 1;
-	econfig->word_size = 1;
-	econfig->reg_read = meson_efuse_read;
-	econfig->reg_write = meson_efuse_write;
-	econfig->size = size;
+	efuse->config.dev = dev;
+	efuse->config.name = dev_name(dev);
+	efuse->config.stride = 1;
+	efuse->config.word_size = 1;
+	efuse->config.reg_read = meson_efuse_read;
+	efuse->config.reg_write = meson_efuse_write;
+	efuse->config.size = size;
+	efuse->config.priv = efuse;
 
-	nvmem = devm_nvmem_register(&pdev->dev, econfig);
+	efuse->nvmem = devm_nvmem_register(&pdev->dev, &efuse->config);
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	return PTR_ERR_OR_ZERO(efuse->nvmem);
 }
 
 static struct platform_driver meson_efuse_driver = {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
