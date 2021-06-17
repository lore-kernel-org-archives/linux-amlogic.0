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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E4C48BE5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92B10613E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92B10613E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KUBC7kKYjHEQ89w/6yVWQvuDEqtbQbN4Pkq+KwJD4Jk=; b=wzSkVifR2kOFA1
	OtUS8Kb+XeklTdxjW2Na1odP+bMwX3EcapvtgltFBZ4fvxSM3DxOeQCcXSTfD/c45qQiawf6DDmzh
	5diojzKXEtBbFpxX6JVmuWIf3ommYLQVkq/UI5hnYRNjhmZS/yaOKawJfa1wW0iCdde6O3uBiDJoC
	1ekY7ey8YSwqjuJXt2fiHHgZv+buIdSj4JLub4ULzksU7P7hsGMkCYeKrrIoZO6/jNOnaO7IT48d0
	pD2RnHbxUqM3+hoeesd8TZAj42gH1L8QI8v3j9DnA/H5egHeihLQeAre6vhUv57EKzogz6xd8OPSv
	bTYN01uuWgtOEEtEWHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxvz-00Balu-KX; Thu, 17 Jun 2021 19:44:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxvX-00BaVS-Qt; Thu, 17 Jun 2021 19:43:49 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 k22-20020a17090aef16b0290163512accedso5986788pjz.0; 
 Thu, 17 Jun 2021 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ru7VYZQFM1VVEN15+QmGHBxSNzsOgYyzaqlXuO2dVxw=;
 b=Lw7iEBZ4GD3k2g+fSKiJqkf85PV7RM3V4AcTlkHE5CxPdrnHgXsvsxuqGq0RDe33cc
 uXNcINgRIEnA+CdK0wQphN7H3fTlGDe6qrFFTaROCmFtZh4Qxi8KQnf86KtaRN4Xc6cr
 0XUhUmpCpx2hWZmv9Cml21ppM2R6msZ+TrI+m5GWaQpy3o0cLh11y3+2F0aiC3Sik1ss
 xQnYIGhqlo38r6HMGmpCkGg72/bHRGYACDbGpqds5QboQHg95wXexwhhtTXK4aTVkqb3
 F5dbsdVhnlHIM73fLHOFmwWUDC/ktoK1e5xKgkLkcK2A/3F3BJrBa0e1J3MpMai/Y4Di
 p9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ru7VYZQFM1VVEN15+QmGHBxSNzsOgYyzaqlXuO2dVxw=;
 b=bvraSQqtPzPAXPUJD5mbBU/CFw4N5O5mAtgEvRoWmTaAAQoB2omgPhFqe6WIyq3d6R
 scqRpuDOiBd4D5QLEtUYiVRPG2iHbSI4zBbJ/X+Q3zS5DPA4kLortIX3e6sjZWKkfqR4
 JlCZvxAr+pZvv/g8Ffbf8wjxCim8LeCu33Y9sHZOw496hD6TRrueQT7WAAVOB5lXlvq0
 BBAcWlgN7Q/yBghxlqxjazcl1Bgv57bw7SOaM6RE6ZBzvuDaBFje0zjGNNGfh+DmjcVU
 o1iAe2RyXqyCzadwqtMgam838qMMtDRVBKOP60snNXjl+euLmsDAPzMtnsXomtWrqBY3
 vQWA==
X-Gm-Message-State: AOAM533kkocTMyA7ParVIuWpuWqIdzI6ZLqciHLI9U6ggApVaEQzKE3y
 CYVvA1KWKOndr3LZFLlVeJNdNu/bB8g=
X-Google-Smtp-Source: ABdhPJy8kifTsQYkHADB3X/VjwWX4edCBRIlpmtaNoexFdNOuNYczcrBwE+yOodX+UnG3Bcu8rQXdQ==
X-Received: by 2002:a17:90b:197:: with SMTP id
 t23mr6968654pjs.61.1623959023215; 
 Thu, 17 Jun 2021 12:43:43 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:43:42 -0700 (PDT)
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
Subject: [RFCv1 4/8] phy: amlogic: meson8b-usb2: Use phy set_mode callback
 function
Date: Thu, 17 Jun 2021 19:41:39 +0000
Message-Id: <20210617194154.2397-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124347_930767_A0A794AC 
X-CRM114-Status: GOOD (  14.71  )
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

Reorder the code for phy set_mode in .set_mode callback function.
For now configure the phy in host mode.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 62 ++++++++++++++++++--------
 1 file changed, 43 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 2b32a3eabccf..18e0986f6ed2 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -173,11 +173,43 @@ static int phy_meson8b_usb2_exit(struct phy *phy)
 	return 0;
 }
 
-static int phy_meson8b_usb2_power_on(struct phy *phy)
+static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
+				    int submode)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 	u32 reg;
 
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+		if (priv->match->host_enable_aca) {
+			regmap_update_bits(priv->regmap, REG_ADP_BC,
+					   REG_ADP_BC_ACA_ENABLE,
+					   REG_ADP_BC_ACA_ENABLE);
+
+			udelay(ACA_ENABLE_COMPLETE_TIME);
+
+			regmap_read(priv->regmap, REG_ADP_BC, &reg);
+			if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
+				dev_warn(&phy->dev, "USB ID detect failed!\n");
+				return -EINVAL;
+			}
+		}
+		break;
+	default:
+		dev_warn(&phy->dev, "USB ID detect failed to setnode! %d\n", mode);
+		return -EINVAL;
+	}
+
+	priv->dr_mode = mode;
+
+	return 0;
+}
+
+static int phy_meson8b_usb2_power_on(struct phy *phy)
+{
+	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
 	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
@@ -197,24 +229,12 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
 			   REG_CTRL_SOF_TOGGLE_OUT);
 
-	if (priv->dr_mode == USB_DR_MODE_HOST) {
-		regmap_update_bits(priv->regmap, REG_DBG_UART,
-				   REG_DBG_UART_SET_IDDQ, 0);
-
-		if (priv->match->host_enable_aca) {
-			regmap_update_bits(priv->regmap, REG_ADP_BC,
-					   REG_ADP_BC_ACA_ENABLE,
-					   REG_ADP_BC_ACA_ENABLE);
-
-			udelay(ACA_ENABLE_COMPLETE_TIME);
-
-			regmap_read(priv->regmap, REG_ADP_BC, &reg);
-			if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
-				dev_warn(&phy->dev, "USB ID detect failed!\n");
-				clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
-				return -EINVAL;
-			}
-		}
+	ret = phy_meson8b_usb2_setmode(phy, priv->dr_mode, 0);
+	if (ret) {
+		phy_meson8b_usb2_power_off(phy);
+		dev_err(&phy->dev, "Failed to initialize PHY with mode %d\n",
+			priv->dr_mode);
+		return ret;
 	}
 
 	return 0;
@@ -238,6 +258,7 @@ static const struct phy_ops phy_meson8b_usb2_ops = {
 	.exit           = phy_meson8b_usb2_exit,
 	.power_on	= phy_meson8b_usb2_power_on,
 	.power_off	= phy_meson8b_usb2_power_off,
+	.set_mode	= phy_meson8b_usb2_setmode,
 	.owner		= THIS_MODULE,
 };
 
@@ -261,6 +282,9 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	if (!priv->match)
 		return -ENODEV;
 
+	/* start in host mode */
+	priv->dr_mode = PHY_MODE_USB_HOST;
+
 	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &phy_meson8b_usb2_regmap_conf);
 	if (IS_ERR(priv->regmap))
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
