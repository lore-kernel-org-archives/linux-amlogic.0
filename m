Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB44C2D0FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7B523126
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:25:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMkahBdW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="l0Q6aaZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7B523126
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqH8IMN9O0FaQ0gywKebdddwUkiDRaDCTN48prANc4k=; b=gMkahBdWDv7/pU
	PMme0sBfnl77LL8Oi4htDeOlhvJaIkZbIf982TI7EPAQx8XIBys8X6iydr2Js/pubWpWgCnI+6hRZ
	Qkj4Kw4lej2MbWLbhBG/9T3qasTjAByQi+57IWoFSNHDQBTBALwaMMsbW529VgryIiNyt9xshM5Zf
	RZGAfDOPpO1EJUAnFcVkono4/NY8Wbsj6mYcOAoeM7TZW4FFBbU0hXpQMxDNVm7SJzIDv14n9WmDl
	DGpt3nYdbFvAqX/IDyDlYV8NR+ZGI5O+xtD9BFQxs2N0un7K8uLs2nx6PKY2QfrjI3wJhUAd1Jjht
	1iFpmBG4u2KzvlNbWXkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYdLJ-0006q4-5i; Tue, 12 May 2020 22:25:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYdKK-0003d8-Ai; Tue, 12 May 2020 22:24:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id v12so17998052wrp.12;
 Tue, 12 May 2020 15:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHVRsCOT9MyMisZFgSTwlSLvLYQeGqXXf2R8XWiMUgQ=;
 b=l0Q6aaZMyvU10IB4ybnWRKE3f63txu5zwml68AOPUfCKi3ap27AmbKA2je7xoYYPYX
 HXgjZdpYg+hbCSgdJKfruqF6k5Lm1VCHZIgR5EJ3KIXSCpY/8ioJwWuAb3OTli6eXFac
 Y8Aw79TNWRjuNNhDbhMjA7Qmuo3f4RHVaiwY777BVjJfetkNXmOKjCXrBKpaWdaIHYvH
 l4JyKVPQ9E1veTLB9ocMA30dlNfmUCk2JxRPs6L5E+e7vU6S09OoSz4SN/1133K+exaO
 2x3KAiOPgffuEmcEo9Q1yrFlXM+YdaDIc5E1qZQqL65z5oE8Dtmc9sZKCiHpkdi89AZe
 Y9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHVRsCOT9MyMisZFgSTwlSLvLYQeGqXXf2R8XWiMUgQ=;
 b=T78EATDfMZYLMGHkEXiKAGDCwHNijFD3R3PfXKDwnJ5cepclyrH4R3j5M9bK3U9qKV
 7u9U+6RaJbsiKmdWJbmF4izExNqi0QdxWuD/wAF1F/7mZa/CbBt22iXoYs6Sa8ZxnQ3Q
 cWoNAYRaNayl4K5dDbo/vURlSU6OcFXml5CyjnsWILFtSU1TQOIO9c0d4WIScUkzCLR7
 6wBNtT4RSLz2ICXlBKmmlnev0qhhSqY7eSrA00W0PuFTWFPC2fP0MI2Inm/EmYiZFeI3
 wN9x3pWGR+NSjNplDvj3ISmN6/BqViTkZKvWIm24pvujIQBLcU5IpjxFrKWsOWKIZUc/
 Wxpw==
X-Gm-Message-State: AGi0PuZACbMcB94KomSiuSmluxLXMZ8cca5+m0ZmICMZZT92rHGbwb3D
 PZy8VkRVX/Es2x0mhpj1hF4=
X-Google-Smtp-Source: APiQypLlX7OBgWwJ5Mrl6AtPKJWwIkazZXuqTvjrOxW56YG+AWsf3arrFPANxHmM2ma91CACjvd0yA==
X-Received: by 2002:adf:c38c:: with SMTP id p12mr28947458wrf.357.1589322278537; 
 Tue, 12 May 2020 15:24:38 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b2sm21758758wrm.30.2020.05.12.15.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:24:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 4/6] phy: amlogic: meson8b-usb2: Don't set
 REG_ADP_BC_ACA_ENABLE on Meson8
Date: Wed, 13 May 2020 00:24:22 +0200
Message-Id: <20200512222424.549351-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
References: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_152440_380172_3BEFB8AE 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>, hexdump0815@googlemail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Skip setting REG_ADP_BC_ACA_ENABLE on Meson8 SoCs and polling for the
REG_ADP_BC_ACA_PIN_FLOAT bit. The vendor also skips this part on Meson8
SoCs.
This fixes initialization of the host-only USB PHY on Meson8 which would
otherwise fail with "USB ID detect failed!".

Fixes: 4a3449d1a0a10c ("phy: meson8b-usb2: add support for the USB PHY on Meson8 SoCs")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
Tested-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 48 ++++++++++++++++++++------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 86824cc21f11..7236b8885f07 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/phy/phy.h>
@@ -105,12 +106,17 @@
 #define RESET_COMPLETE_TIME				500
 #define ACA_ENABLE_COMPLETE_TIME			50
 
+struct phy_meson8b_usb2_match_data {
+	bool			host_enable_aca;
+};
+
 struct phy_meson8b_usb2_priv {
-	struct regmap		*regmap;
-	enum usb_dr_mode	dr_mode;
-	struct clk		*clk_usb_general;
-	struct clk		*clk_usb;
-	struct reset_control	*reset;
+	struct regmap					*regmap;
+	enum usb_dr_mode				dr_mode;
+	struct clk					*clk_usb_general;
+	struct clk					*clk_usb;
+	struct reset_control				*reset;
+	const struct phy_meson8b_usb2_match_data	*match;
 };
 
 static const struct regmap_config phy_meson8b_usb2_regmap_conf = {
@@ -166,7 +172,8 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
 			   REG_CTRL_SOF_TOGGLE_OUT);
 
-	if (priv->dr_mode == USB_DR_MODE_HOST) {
+	if (priv->dr_mode == USB_DR_MODE_HOST &&
+	    priv->match->host_enable_aca) {
 		regmap_update_bits(priv->regmap, REG_ADP_BC,
 				   REG_ADP_BC_ACA_ENABLE,
 				   REG_ADP_BC_ACA_ENABLE);
@@ -216,6 +223,10 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	priv->match = device_get_match_data(&pdev->dev);
+	if (!priv->match)
+		return -ENODEV;
+
 	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &phy_meson8b_usb2_regmap_conf);
 	if (IS_ERR(priv->regmap))
@@ -254,11 +265,28 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+static const struct phy_meson8b_usb2_match_data phy_meson8_usb2_match_data = {
+	.host_enable_aca = false,
+};
+
+static const struct phy_meson8b_usb2_match_data phy_meson8b_usb2_match_data = {
+	.host_enable_aca = true,
+};
+
 static const struct of_device_id phy_meson8b_usb2_of_match[] = {
-	{ .compatible = "amlogic,meson8-usb2-phy", },
-	{ .compatible = "amlogic,meson8b-usb2-phy", },
-	{ .compatible = "amlogic,meson-gxbb-usb2-phy", },
-	{ },
+	{
+		.compatible = "amlogic,meson8-usb2-phy",
+		.data = &phy_meson8_usb2_match_data
+	},
+	{
+		.compatible = "amlogic,meson8b-usb2-phy",
+		.data = &phy_meson8b_usb2_match_data
+	},
+	{
+		.compatible = "amlogic,meson-gxbb-usb2-phy",
+		.data = &phy_meson8b_usb2_match_data
+	},
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, phy_meson8b_usb2_of_match);
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
