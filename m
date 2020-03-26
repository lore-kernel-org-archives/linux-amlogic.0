Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551DDC43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283DE206E6
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XDeTzq7Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FtpRIc5l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 283DE206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSVlLSSyOxwg1wbgAPxzwvBSRnQKuD4gtQQbABVEdF8=; b=XDeTzq7YOS8GBa
	TOlrpzctc5jujvtJ38Tw/4kfl/4dMlDUnkiPJ10i1Q32g/KjnlpESKq6STM+jjoLsE8xT33bfBHCq
	OHHJ5dq72bshUk95ucu2GjW4a3HZ5dyWxjCihyNcmZ5oJpSh1HgwZtqd8WDdsRHXa2vXrQIhPeqg3
	Mue/NIUEx3ytO7IuzGjlIl2BBKxN7s1fRph1P87rcbl2oUl+KxIfxn3H5SY2zkBFvN5WnmDq4sNuE
	oA+elhynO05NysQGUK2flTBeyDU07AAD2DOTjLpltxtMy0RUoBgmvp0hrim53Foc4sjZIHUx8H4iE
	q7QNG4iSOCuZNB/Q2W0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHSrV-0008CX-68; Thu, 26 Mar 2020 13:47:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHSoy-0005hB-Uw
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 13:45:23 +0000
Received: by mail-wm1-x341.google.com with SMTP id b12so6525269wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 06:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4OQGeeefykddJTLyHhR+pmXKSb4WyyElXj03N7FWqg=;
 b=FtpRIc5lQGp8K83aq1yBJ9kHII2tvynMr9OZ1jinKDHRFhKu+pu1lRsB8/ypHmm0sB
 2rNd5Uf7wqk4JllPfjgUO4QdjbgiMucnOFVmi7JmOz7a5rEaxq+cwr+3OI1uMs7cZxS9
 V1xSKr5BaUH7tJA/Jaki3uukc35M2swP5S50gL7AQZFbitadAoEPF0HF4rSnQj09drKs
 Lw4xeykbulQmyPURhw+KjGVPnNniAoYdSZt9TQ/l0UFDnGdQ5FZyxqkvSMlbX+ybckzZ
 TlkvOdAxuQatyA/6VzLxIH1ChGhBZCnKbFceW3Y/6jZ0c67Ht4N0xzyGbnpfLEaI7vvj
 Oymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4OQGeeefykddJTLyHhR+pmXKSb4WyyElXj03N7FWqg=;
 b=SRmst6i4WpixL6TZOPK27+Ui8GWIMyapWVwM3vAkvBQL61kiUCuoYZMLGRjq56n3Sg
 C6ofe1jx8FOL0Wp94Ck6OkPwH6MY05qYUCNrDUya420UP4oU818wZcXMcAYxfM6TCXKZ
 pErnC+2YnNJceGoz0oMRYhXXAPVnwuRXqeKS1H1zM2yuogqJci5ZafACrwx0EkD8cVZe
 TPF0GQyXcdATHFWyfNt+gvdWyWFhm8bCuOQ+SSejpevtmWJEPJSys1NJ5UUrzJKsUSZH
 WxcKzup0vliSYINn67Mbs7PC99oceuJf8Pcgs0j4Sd/81xATHPJ1IfHL74wpak0YPlpa
 PgMg==
X-Gm-Message-State: ANhLgQ0PlOmhQg4XL63Kvy9Ljzi7AkmQWWT6r4NSpp6A82w799eFzgZ7
 YrLCCRvdaGFh5W1x3jM0umlz/A==
X-Google-Smtp-Source: ADFU+vtNV2p2MdHTs3Aw9mAjq2g8w1y4nKcuV9ppnHa1G0n4fScralNm+HVi6ta7Q/aw94MiqSd2kA==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr2519wmc.171.1585230318771;
 Thu, 26 Mar 2020 06:45:18 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 06:45:18 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 06/14] usb: dwc3: meson-g12a: refactor usb2 phy init
Date: Thu, 26 Mar 2020 14:44:58 +0100
Message-Id: <20200326134507.4808-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_064521_020857_8FE14011 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Refactor the USB2 PHY init code patch to handle the Amlogic GXL/GXM
not having the PHY mode control registers in the Glue but in the PHY
registers.

The Amlogic GXL/GXM will call phy_set_mode() instead of programming the
PHY mode control registers, thus add two new callbacks to the SoC match
data.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 74 +++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 69381c42a6d3..328e74def56f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -136,11 +136,21 @@ struct dwc3_meson_g12a_drvdata {
 	const char **phy_names;
 	int num_phys;
 	int (*setup_regmaps)(struct dwc3_meson_g12a *priv, void __iomem *base);
+	int (*usb2_init_phy)(struct dwc3_meson_g12a *priv, int i,
+			     enum phy_mode mode);
+	int (*set_phy_mode)(struct dwc3_meson_g12a *priv, int i,
+			    enum phy_mode mode);
 };
 
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 					 void __iomem *base);
 
+static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					  enum phy_mode mode);
+
+static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
+					int i, enum phy_mode mode);
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -148,6 +158,8 @@ static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.phy_names = meson_g12a_phy_names,
 	.num_phys = ARRAY_SIZE(meson_g12a_phy_names),
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
 };
 
 static struct dwc3_meson_g12a_drvdata a1_drvdata = {
@@ -157,6 +169,8 @@ static struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.phy_names = meson_a1_phy_names,
 	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
 	.setup_regmaps = dwc3_meson_g12a_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_g12a_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_g12a_set_phy_mode,
 };
 
 struct dwc3_meson_g12a {
@@ -175,8 +189,8 @@ struct dwc3_meson_g12a {
 	const struct dwc3_meson_g12a_drvdata *drvdata;
 };
 
-static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
-					  int i, enum phy_mode mode)
+static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
+					 int i, enum phy_mode mode)
 {
 	if (mode == PHY_MODE_USB_HOST)
 		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
@@ -185,11 +199,41 @@ static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
 	else
 		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
 				U2P_R0_HOST_DEVICE, 0);
+
+	return 0;
+}
+
+static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					 enum phy_mode mode)
+{
+	int ret;
+
+	regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+			U2P_R0_POWER_ON_RESET,
+			U2P_R0_POWER_ON_RESET);
+
+	if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
+		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
+				   U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
+
+		ret = priv->drvdata->set_phy_mode(priv, i, mode);
+	} else
+		ret = priv->drvdata->set_phy_mode(priv, i,
+						  PHY_MODE_USB_HOST);
+
+	if (ret)
+		return ret;
+
+	regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
+			U2P_R0_POWER_ON_RESET, 0);
+
+	return 0;
 }
 
 static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 {
-	int i;
+	int i, ret;
 
 	if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
 		priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
@@ -203,23 +247,9 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
 			continue;
 
-		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				   U2P_R0_POWER_ON_RESET,
-				   U2P_R0_POWER_ON_RESET);
-
-		if (priv->drvdata->otg_switch_supported && i == USB2_OTG_PHY) {
-			regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS,
-				U2P_R0_ID_PULLUP | U2P_R0_DRV_VBUS);
-
-			dwc3_meson_g12a_usb2_set_mode(priv, i,
-						      priv->otg_phy_mode);
-		} else
-			dwc3_meson_g12a_usb2_set_mode(priv, i,
-						      PHY_MODE_USB_HOST);
-
-		regmap_update_bits(priv->u2p_regmap[i], U2P_R0,
-				   U2P_R0_POWER_ON_RESET, 0);
+		ret = priv->drvdata->usb2_init_phy(priv, i, priv->otg_phy_mode);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -372,7 +402,9 @@ static int dwc3_meson_g12a_otg_mode_set(struct dwc3_meson_g12a *priv,
 
 	priv->otg_phy_mode = mode;
 
-	dwc3_meson_g12a_usb2_set_mode(priv, USB2_OTG_PHY, mode);
+	ret = priv->drvdata->set_phy_mode(priv, USB2_OTG_PHY, mode);
+	if (ret)
+		return ret;
 
 	dwc3_meson_g12a_usb_otg_apply_mode(priv);
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
