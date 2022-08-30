Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3230EECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zl4v3nlRtCZBv69ogd2/HzV+mHSaHVoBZ9XYszV+QK8=; b=NdtA/vMP8NGiJf
	9wrQRzu9o3tJMJ3QpZsIIYOaBrZyRbBE9eTYMZRlzbZLRWVmYfu45Qskr4nqMnqp/uATDXkTvp9Fz
	PKWBR+sbMJ/X1t7wr7AFDk8Icq4uEkj7nIoXX+8+7E+XO3UvsdCpE6ASeTq5fQ3q1o7rxi4WeZ9Wf
	C0EIvScwR04QTCCcc3o+8xLDhB2OnQEkO1xiSXJiASRCXr/LgObA50xiXFqG8NbivcaeqDU1MzVuM
	77FrlvNQ6YZ0fgYbQv4nAaktvzg9V7Wk6q9cUUdTzdYhXP75ankpwKr5tuMy+8g+5rBLpQNWe3VcJ
	Mt1AGStqS6p2K/cAsFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4qm-000kmS-FY; Tue, 30 Aug 2022 17:16:32 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4qa-000kaU-Gu; Tue, 30 Aug 2022 17:16:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id s7so221308wro.2;
        Tue, 30 Aug 2022 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=aYslhMiebwj7+4K29cnHKNgB9pRwPd88BFhx8bY7ouM=;
        b=QclIAbxg3S4UhOG46RtLaDjvT59WEIZr//Zghr1EHfcBN/aRLlnISCNhVjMJQW7PfI
         9L+CnEdbVkf9c5jm8bDnwVxX+ku9D9HvbFjgzT/XfehjSCkUtR6ByNphMoiEXjWfcAMF
         umLSP8zeW9Rm1tfjKLBhj4DDSGGPEnLi9tmTfQfNvVpV4qwmsrQ6GS57FhU+duRjTbWJ
         Wda8DarGYonTi6v0XWlL1idY8otPBBSqtM9mIjknjqhyaywWE3C+aIidxN5yzy23KrnY
         XRckdEAaKCxqz6azufVCUlztbKNUhkU0UOqaz5EPkhMDDZpFkOup7x+NUyRCYZzmXOA4
         N6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=aYslhMiebwj7+4K29cnHKNgB9pRwPd88BFhx8bY7ouM=;
        b=vsvdI0/cjtDUvtamGi6kkmKo3P4uQSrjlbGy7lQmIURrqW/Ugcdun5OMPQAjKPBfjc
         BhVABCAD/wmRdLXwP9UF6Myb+5GQ6H6AQ6FQnBhl5UDtsBJwH/lgrB/QStcAarTDsZGr
         JYs8uDy0wLW5nuUZE0fI+cA5PuHtwwC81HGQPT0eAKeWBKyyxb0B8aRZU/LR6pUJr20a
         tyeVfDQYF7LwrvIRCzORij61hMW2bViPZgwp0bK/BtIbUe7gFCVki3OOSZO8i9TgGoHX
         bv3S/FOEK2U1N7drjD4F4gX7DP8UY6xGChUH0Huskp7+YE7wJWP8xuZLBAbz/66admE0
         a2TQ==
X-Gm-Message-State: ACgBeo3YGCSm0qn6nWsCmXYb8yFYroajrI65xjOXZp4RrUjEobhbxzi0
	Ik0KRKcltM3UKGWOdYYxVKw=
X-Google-Smtp-Source: AA6agR7yhSuJYjzN6H3sQo9VVl3vOnuDoEKHCd3iysGHC95CwGJ/+8NKMi2iGatotF3XCNwDqvbtYA==
X-Received: by 2002:a05:6000:258:b0:226:dc6e:9ef8 with SMTP id m24-20020a056000025800b00226dc6e9ef8mr5167855wrz.215.1661879778047;
        Tue, 30 Aug 2022 10:16:18 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c143:e900:5d45:6499:bc12:87fc? (dynamic-2a01-0c23-c143-e900-5d45-6499-bc12-87fc.c23.pool.telefonica.de. [2a01:c23:c143:e900:5d45:6499:bc12:87fc])
        by smtp.googlemail.com with ESMTPSA id u1-20020a05600c440100b003a31ca9dfb6sm13463745wmn.32.2022.08.30.10.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:16:17 -0700 (PDT)
Message-ID: <9308a2a3-e828-bd9d-ab83-a68376aab5c3@gmail.com>
Date: Tue, 30 Aug 2022 19:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] phy: amlogic: use devm_clk_get_enabled() to simplify the code
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_101620_595240_9EF2D960 
X-CRM114-Status: UNSURE (   9.71  )
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

Simplify the code by using devm_clk_get_enabled().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 32 ++++---------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 54d65a6f0..d2a1da8d9 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -388,7 +388,6 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	struct phy_g12a_usb3_pcie_priv *priv;
 	struct phy_provider *phy_provider;
 	void __iomem *base;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -408,43 +407,24 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap_cr))
 		return PTR_ERR(priv->regmap_cr);
 
-	priv->clk_ref = devm_clk_get(dev, "ref_clk");
+	priv->clk_ref = devm_clk_get_enabled(dev, "ref_clk");
 	if (IS_ERR(priv->clk_ref))
 		return PTR_ERR(priv->clk_ref);
 
-	ret = clk_prepare_enable(priv->clk_ref);
-	if (ret)
-		return ret;
-
 	priv->reset = devm_reset_control_array_get_exclusive(dev);
-	if (IS_ERR(priv->reset)) {
-		ret = PTR_ERR(priv->reset);
-		goto err_disable_clk_ref;
-	}
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
 
 	priv->phy = devm_phy_create(dev, np, &phy_g12a_usb3_pcie_ops);
-	if (IS_ERR(priv->phy)) {
-		ret = PTR_ERR(priv->phy);
-		dev_err_probe(dev, ret, "failed to create PHY\n");
-		goto err_disable_clk_ref;
-	}
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy), "failed to create PHY\n");
 
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
 
 	phy_provider = devm_of_phy_provider_register(dev,
 						     phy_g12a_usb3_pcie_xlate);
-	if (IS_ERR(phy_provider)) {
-		ret = PTR_ERR(phy_provider);
-		goto err_disable_clk_ref;
-	}
-
-	return 0;
-
-err_disable_clk_ref:
-	clk_disable_unprepare(priv->clk_ref);
-
-	return ret;
+	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
 static const struct of_device_id phy_g12a_usb3_pcie_of_match[] = {
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
