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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84A8C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E120613D5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E120613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODdKPZZnYa+Tr0OzXfLsbmN+5/FwBc+MTrxbNEEHMD8=; b=TnYS8CiOU6qkXR
	6bmJvIZbNezFlW4o4gNRQPUIZoDHOqnH6Ck+7eOkBOQ8PciUjNQkz+e4YQ9URgkoyQybiFBZyH5/w
	fHoHdsywvLxGJFMdkrJ8FKnXYU+C0J2XrMyNusdsbeG2SDRj68x9TJs7UkXi2R9TMW3JlExfsM03c
	A4EX+JxiwHvSaFNyPW7NTKDsx2L3DChQ5pyQ/IjTjYM3SuPwD2Ok2iXvE6AgNNpqGTpAmllTeKERN
	EoFVBBQwEKJR8ifQJillToEBQthWcryDfrrjXzfGu1lD6pElIbwVIAaukjcysN5b1zmlAf17Ze6mb
	c+ukJXR7sTxwfn037SOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxx6-00BbOH-Ll; Thu, 17 Jun 2021 19:45:24 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxw2-00Ban2-6V; Thu, 17 Jun 2021 19:44:19 +0000
Received: by mail-pf1-x42f.google.com with SMTP id a127so5833203pfa.10;
 Thu, 17 Jun 2021 12:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=083k0zv8Ytg086lmX8X+TtAKRzXKvvth7IVx9plMtXg=;
 b=iuajfJilA0fwo4o/4oh4VDEAW6K9CA+mAVG1N73pVcpReCbdShNd7WB85LybfZQHjB
 Xby86N2VkOHbLyYxQhP0vKv//8KimP7qM2RAnzNuEewy84WGVtavZPyAfT0PMEevO3kh
 YaCKWXcZGDrqVekkPU+9J9+1Ei4tLb74yW5VYooD8DsMYNcE8WIgtr31HhazXJFoAoJ/
 hQs+rCZgYmqhhuNKGE8q7CaRprAt6+6XzW/O5CC6BAL4huoAdKKyxewif5XV+9HJ0lxb
 0lQhHy7HhGKhmK/hs8qUlRhJcBWJYce1ZjdCFMBc6WrmHw3Y9np3Oja+5GynM0VhzNmB
 bwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=083k0zv8Ytg086lmX8X+TtAKRzXKvvth7IVx9plMtXg=;
 b=rJj+VNW3Mgm8vxqBYJfB9Kue4TvEe23gitl4inXXhsmZ+nDINvzFovMNHYISS8irCr
 7DIwKBN7qtwZwxM0TXNFhi8+xEOv6Td5GFYFy5r3rgPYuM5HlvGFV4ibOLU4y+16zOod
 sve6KrEwRpX53J8rwEi41Y01JGo1KQUNbqLOqSmcgWFTVmqWQtIaHTycxtnhuaY2u59Z
 wz6SeYEZ3knu+4mHKngU3qc1KwAfSNoPes2awyVIIdNFNyZhT51tk9/asfBSYMhMfpc5
 ACNC5dKABDt0v+DZQJLWd0xWne4DazMhqc/cmpUgyhp1ThgBD9j1/2Cfuk9FHVJUZsYl
 lN5w==
X-Gm-Message-State: AOAM530pemsywRaKRBSZTeg2iVBt6uMx02Bf/fnXyddnqD7Y+T9OC6cv
 4Nsv3Nsm9d20daslHKCgc7w49VBKxls=
X-Google-Smtp-Source: ABdhPJxt9c7UvvRETV6duPF5gupqd/aXsSexrgfUjLHqotY9ZIoS1gjWqBegyutCZwZkYOgqDB/Dmw==
X-Received: by 2002:a65:4242:: with SMTP id d2mr6293256pgq.243.1623959056538; 
 Thu, 17 Jun 2021 12:44:16 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:44:16 -0700 (PDT)
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
Subject: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
Date: Thu, 17 Jun 2021 19:41:41 +0000
Message-Id: <20210617194154.2397-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124418_354295_692F8B70 
X-CRM114-Status: GOOD (  15.29  )
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

Reoder the code for phy reset mode in .reset callback function.
Reset control is shared between two phy so use the phy name
as shared id.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 35 ++++++++++++++++++--------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index ab23a584d7b7..c1ed2e5c80d8 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -133,6 +133,7 @@ struct phy_meson8b_usb2_priv {
 	struct clk_bulk_data                            *clks;
 	struct reset_control				*reset;
 	const struct phy_meson8b_usb2_match_data	*match;
+	int						is_enabled;
 };
 
 static const struct regmap_config phy_meson8b_usb2_regmap_conf = {
@@ -147,14 +148,6 @@ static int phy_meson8b_usb2_init(struct phy *phy)
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 	int ret;
 
-	if (!IS_ERR_OR_NULL(priv->reset)) {
-		ret = reset_control_reset(priv->reset);
-		if (ret) {
-			dev_err(&phy->dev, "Failed to trigger USB reset\n");
-			return ret;
-		}
-	}
-
 	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
 	if (ret) {
 		dev_err(&phy->dev, "Failed to enable USB clock\n");
@@ -173,6 +166,22 @@ static int phy_meson8b_usb2_exit(struct phy *phy)
 	return 0;
 }
 
+static int phy_meson8b_usb2_reset(struct phy *phy)
+{
+	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	if (priv->is_enabled) {
+		ret = reset_control_reset(priv->reset);
+		if (ret) {
+			dev_err(&phy->dev, "Failed to trigger USB reset\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
 				    int submode)
 {
@@ -200,6 +209,8 @@ static int phy_meson8b_usb2_setmode(struct phy *phy, enum phy_mode mode,
 		return -EINVAL;
 	}
 
+	phy_meson8b_usb2_reset(phy);
+
 	priv->dr_mode = mode;
 
 	return 0;
@@ -209,6 +220,8 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 
+	priv->is_enabled = 0;
+
 	if (priv->dr_mode == USB_DR_MODE_HOST)
 		regmap_update_bits(priv->regmap, REG_DBG_UART,
 				   REG_DBG_UART_SET_IDDQ,
@@ -221,6 +234,8 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 	int ret;
 
+	priv->is_enabled = 1;
+
 	regmap_update_bits(priv->regmap, REG_CONFIG, REG_CONFIG_CLK_32k_ALTSEL,
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
@@ -229,7 +244,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
 			   0x5 << REG_CTRL_FSEL_SHIFT);
-
 	/* reset the PHY */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
 			   REG_CTRL_POWER_ON_RESET);
@@ -257,6 +271,7 @@ static const struct phy_ops phy_meson8b_usb2_ops = {
 	.power_on	= phy_meson8b_usb2_power_on,
 	.power_off	= phy_meson8b_usb2_power_off,
 	.set_mode	= phy_meson8b_usb2_setmode,
+	.reset		= phy_meson8b_usb2_reset,
 	.owner		= THIS_MODULE,
 };
 
@@ -301,7 +316,7 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
 	if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
 		return PTR_ERR(priv->reset);
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
