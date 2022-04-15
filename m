Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718BDC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Apr 2022 14:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7x+Iq/zs5L9UGHGNq2SlcSd23fRNJ/erCSupctKPKPQ=; b=rV9FVnRjl1Wbg4
	VapKDiF/d3CPoyOejvG8LCP1h8HEmv2I479I5nT9JWe5mpJzL4U4/KlNPBe286aL06Dwk8+5Clp1L
	HawrcULuhAGu2STf2/yPT4pwvYGGd4cJgrWrLsYkhUg4qTI0vpDAyZBerJWgZ5oACTDgfS0Rot4dX
	lND3pQs9Afwsq8UBF2uB70k1Kx6D/YOwSDSWJrs0nzDAX+akpHso+iKNycoVREDNlnNinmmXN21Gp
	rckuGOjmTtkRjXt4P5wm/VRXL+URi61s9ElpNm9UTfQP7W/FHODQiGs1cMTiE+CgDHcPCWVHJJFJk
	ZlQakiqrbiSE355frfkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfMXv-00AH0A-LS; Fri, 15 Apr 2022 14:03:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfMXk-00AGyb-F7; Fri, 15 Apr 2022 14:03:25 +0000
Received: by mail-ej1-x62a.google.com with SMTP id t11so15482317eju.13;
 Fri, 15 Apr 2022 07:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=D4t9NO5NWJPGH0i73+EeLfUPoJ/RYJ61BCd8WF3HY3U=;
 b=gJVfexSeMKIpTELwnxi0/aK+eQbdD4ybXANL0WSG3e8ojlhpGpCTz29IoOBWPmGCE7
 UysZIUlLD1wTvqhq2midcSyN5VSdysBGs9wQhnx1yDEk6mJs/fGzB7ApkSQ8dNLZXV0P
 7gx3wF4/aYewcfqRfNTYo0bNgfjGDHJ5E8Xpl0Vl2NLLhHuxeAqNj631vEh8Wb2l+fxi
 pVWFxNFaspcU8cc4Nr8xMj57Nq1oVGFvW0kiDRi7mMGLIlsDQKzFQFI7BvqVCLRv4m4f
 t3LBwcvoiPH64GGntfQbfhC9XA9Sp60JHh/2Z2jwZs22/col97vp73vfA/sFCAGtK3xf
 Y0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=D4t9NO5NWJPGH0i73+EeLfUPoJ/RYJ61BCd8WF3HY3U=;
 b=dHFo+ykmdJRU9treIVGKFu+pEXUAD13HggQWmSH3n0V6/awYEbzQpOuoutXaXmkX+n
 4ZQAcE/xSOo3b+9BzIizYiU2hgKKYWBY1hCqrDZsvA+xI8xhPf/1i+QWxEyaV4U5ZB9R
 DIInTELuNxibYBHpGH+aCyapVehwEtnIyQM+upQfnhl8xNx+w9M28OVp9kuvOaM90as4
 QvtB9ZnvOkBDtCMI+lez0y8IfJvKP7ATx7Oz5PCxLBAedwSTSerVDIicju+mvixV5CPK
 FGx87h5WxGdlANBHHS7untJWYQJzoqW7+UUCWEsPzJVoZIipiycOt48RGAHvISmF0hyY
 9qDw==
X-Gm-Message-State: AOAM530iLHFrrIvM3AtWCjE1R+TNOTBrtmG3Y/lf7yRupMSZBSGFtFR3
 5+lWzcGL3nDetoIZokt38cvQKOOLmQg=
X-Google-Smtp-Source: ABdhPJwguWo/qCKtqqQziyyXQFp4ykoVs3hQQo2jNNd6BGD/yWfFyG+adj4pmzYkTSqD0zrmwwis2Q==
X-Received: by 2002:a17:907:9604:b0:6ec:9b5:c55b with SMTP id
 gb4-20020a170907960400b006ec09b5c55bmr5881200ejc.321.1650031401424; 
 Fri, 15 Apr 2022 07:03:21 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6faa:ed00:b906:e23f:946b:b9f7?
 (dynamic-2a01-0c22-6faa-ed00-b906-e23f-946b-b9f7.c22.pool.telefonica.de.
 [2a01:c22:6faa:ed00:b906:e23f:946b:b9f7])
 by smtp.googlemail.com with ESMTPSA id
 n14-20020a50934e000000b0042053e79386sm2700015eda.91.2022.04.15.07.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 07:03:20 -0700 (PDT)
Message-ID: <8e416f95-1084-ee28-860e-7884f7fa2e32@gmail.com>
Date: Fri, 15 Apr 2022 16:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] phy: amlogic: fix error path in phy_g12a_usb3_pcie_probe()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_070324_552615_20C83F7F 
X-CRM114-Status: GOOD (  10.07  )
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

If clk_prepare_enable() fails we call clk_disable_unprepare()
in the error path what results in a warning that the clock
is disabled and unprepared already.
And if we fail later in phy_g12a_usb3_pcie_probe() then we
bail out w/o calling clk_disable_unprepare().
This patch fixes both errors.

Fixes: 36077e16c050 ("phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo PHY Driver")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 5b471ab80..54d65a6f0 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -414,19 +414,19 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(priv->clk_ref);
 	if (ret)
-		goto err_disable_clk_ref;
+		return ret;
 
 	priv->reset = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(priv->reset))
-		return PTR_ERR(priv->reset);
+	if (IS_ERR(priv->reset)) {
+		ret = PTR_ERR(priv->reset);
+		goto err_disable_clk_ref;
+	}
 
 	priv->phy = devm_phy_create(dev, np, &phy_g12a_usb3_pcie_ops);
 	if (IS_ERR(priv->phy)) {
 		ret = PTR_ERR(priv->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
+		dev_err_probe(dev, ret, "failed to create PHY\n");
+		goto err_disable_clk_ref;
 	}
 
 	phy_set_drvdata(priv->phy, priv);
@@ -434,8 +434,12 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 
 	phy_provider = devm_of_phy_provider_register(dev,
 						     phy_g12a_usb3_pcie_xlate);
+	if (IS_ERR(phy_provider)) {
+		ret = PTR_ERR(phy_provider);
+		goto err_disable_clk_ref;
+	}
 
-	return PTR_ERR_OR_ZERO(phy_provider);
+	return 0;
 
 err_disable_clk_ref:
 	clk_disable_unprepare(priv->clk_ref);
-- 
2.35.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
