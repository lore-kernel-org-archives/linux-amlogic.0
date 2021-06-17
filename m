Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C22C48BE5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AB3C6113E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AB3C6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntJOpdDGswI645AT8qA3IJN+t3BBTnRFOjQA9jc+FH8=; b=hcftSW5m+22m1+
	qFfE8F67D1FMACj/HiJBoALrXpXA2heL0ugZwJn7LYnTJE+SAUjcmBERVB0h0SN5biCRrQfitcifv
	3o4Mgl5mzQOPlFrN2OVE1yVkHru2YseM2/Q8GeTatjBbrgy9l0i1yYIAGbNAp9tjkLza63y/kzkt6
	QJisNjRXDVUin+dqp9WRaxBveIUk9eiBGOSlGEM/srC8n+xg2i0b7SkNZGnZWoi7dMcxsLMs4iLFM
	/5M4oMd4VD8W7QaNsm2MATDJkoo1SzSlk1nHTFHsXDRMtnx7rhmz/ZEkicUULeD8IX+u1a4bZueCm
	qvUgR8A0HQ+gqaVAuLmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxut-00BaDF-L3; Thu, 17 Jun 2021 19:43:07 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxug-00Ba9V-Bl; Thu, 17 Jun 2021 19:42:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id k6so5822516pfk.12;
 Thu, 17 Jun 2021 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9HgQ9eAiW96/ovGrHzecsI1VfEM+0/YBZu4OcH2CPvU=;
 b=IDSWM3vrjvw7MeiWIr15DCD+wCW8pjSkdRreLc5MeLbze+tu8Nh8QKvgpZssU2jVh+
 EMQCfONigNWK4SDSJ/Hw4tHIUeJBc9nrRMdXQo22qr2+R+URmi6vb6T/1TOssz/c/3IK
 eS5oGDLvCKwpthgHfrcJj4g0SKG5ZZRClREimHO1848jnbGediRxvFf61qDukJXFpd1h
 SzBCWnmdPDWqQo+KA1dJBHSG6GUv7To0iQ8M2XI0kWZhmbHCuLU2u8Qt+kMsKhGPdyWn
 Dg7Dn+CNiwz/MxDpXDkKaL2AGon9BTny6fi0WRb+pWbR6spNHihtCmD4S79nIpyFoZA+
 0ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9HgQ9eAiW96/ovGrHzecsI1VfEM+0/YBZu4OcH2CPvU=;
 b=ZCBnR8AbB1hoFEM+vp2hRYWgZZsAIhDoSfXw8pP2CctdCQmCiZaZBJt3ZAtCtlsET9
 keTY10OANIgtB6/T5dwKkZim2CaZAD8KpJQa0YWpmmU4LAs6q9SVbzS4Z43iPqjoku1U
 ui9Z9Kla15qYpezwvDAfwihoW9HDOHSXgF7ISwVsVUzSkSSp0p/yinXnZi2y8WrvSHqZ
 pU3/JLxMl+DK/QkM6oyxmFYs1hF215J9HUhOv+Gc1efguOza790rWDPHhBfwlwCq4S7/
 7sOGzyMC/eFK4ldReQjkl/bNNLVU58Klk2iCs65ic9Ebn+E4OPtnA0FuW06XU3UkvltN
 hT3w==
X-Gm-Message-State: AOAM531nuq85986cHz0hlWOoDF7wHCenWHrRV1VwXW6d4wUoFyxBe7rU
 P+J++jyFc/vqf8pCb6eSiUVyJh2Qwz4=
X-Google-Smtp-Source: ABdhPJx5ZIxR9ySXUG7SX502EB68UiuFkiJPUuTxkOHSdD37m0SDC1zBokNef3WrEmJMyPMDImpLdw==
X-Received: by 2002:a63:5360:: with SMTP id t32mr6385187pgl.192.1623958973053; 
 Thu, 17 Jun 2021 12:42:53 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:42:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: --to=linux-phy@lists.infradead.org,
 --to=linux-arm-kernel@lists.infradead.org,
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFCv1 1/8] phy: amlogic: meson8b-usb2: Use clock bulk to get clocks
 for phy
Date: Thu, 17 Jun 2021 19:41:36 +0000
Message-Id: <20210617194154.2397-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124254_448064_8A55C8F0 
X-CRM114-Status: GOOD (  15.02  )
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

Use clock bulk helpers to get/enable/disable clocks,
it will be easier to handle clocks. No functional change intended.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 44 ++++++++++++++------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 03c061dd5f0d..771b73f3b44e 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -121,11 +121,16 @@ struct phy_meson8b_usb2_match_data {
 	bool			host_enable_aca;
 };
 
+static const char * const meson_phy_clks[] = {
+	"usb_general",
+	"usb",
+};
+
 struct phy_meson8b_usb2_priv {
 	struct regmap					*regmap;
 	enum usb_dr_mode				dr_mode;
-	struct clk					*clk_usb_general;
-	struct clk					*clk_usb;
+	int                                             num_clks;
+	struct clk_bulk_data                            *clks;
 	struct reset_control				*reset;
 	const struct phy_meson8b_usb2_match_data	*match;
 };
@@ -151,16 +156,9 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 		}
 	}
 
-	ret = clk_prepare_enable(priv->clk_usb_general);
+	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
 	if (ret) {
-		dev_err(&phy->dev, "Failed to enable USB general clock\n");
-		return ret;
-	}
-
-	ret = clk_prepare_enable(priv->clk_usb);
-	if (ret) {
-		dev_err(&phy->dev, "Failed to enable USB DDR clock\n");
-		clk_disable_unprepare(priv->clk_usb_general);
+		dev_err(&phy->dev, "Failed to enable USB clock\n");
 		return ret;
 	}
 
@@ -197,8 +195,7 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			regmap_read(priv->regmap, REG_ADP_BC, &reg);
 			if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
 				dev_warn(&phy->dev, "USB ID detect failed!\n");
-				clk_disable_unprepare(priv->clk_usb);
-				clk_disable_unprepare(priv->clk_usb_general);
+				clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
 				return -EINVAL;
 			}
 		}
@@ -216,8 +213,7 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 				   REG_DBG_UART_SET_IDDQ,
 				   REG_DBG_UART_SET_IDDQ);
 
-	clk_disable_unprepare(priv->clk_usb);
-	clk_disable_unprepare(priv->clk_usb_general);
+	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
 
 	return 0;
 }
@@ -234,6 +230,7 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	struct phy *phy;
 	struct phy_provider *phy_provider;
 	void __iomem *base;
+	int i, ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -252,13 +249,18 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->clk_usb_general = devm_clk_get(&pdev->dev, "usb_general");
-	if (IS_ERR(priv->clk_usb_general))
-		return PTR_ERR(priv->clk_usb_general);
+	priv->num_clks = ARRAY_SIZE(meson_phy_clks);
+	priv->clks = devm_kcalloc(&pdev->dev, priv->num_clks,
+				  sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_clks; i++)
+		priv->clks[i].id = meson_phy_clks[i];
 
-	priv->clk_usb = devm_clk_get(&pdev->dev, "usb");
-	if (IS_ERR(priv->clk_usb))
-		return PTR_ERR(priv->clk_usb);
+	ret = devm_clk_bulk_get(&pdev->dev, priv->num_clks, priv->clks);
+	if (ret)
+		return ret;
 
 	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
 	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
