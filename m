Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459F8C352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A9CC206B9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZRd/zM4z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lrvSCM3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A9CC206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnNllM07U4R3QKanMQByKrf6fVljjV+F+gJwP51iDsk=; b=ZRd/zM4zaTrPZk
	hqqgAFaQfJEI8YIvDbNd6o5dFR8218HzbmCG/fbPG7mkKZRwk0gtFqONul1OyXrIMOgDElTgqNkAk
	I7Bp9EdMr7DgZruPgrslQGOqvjrL0+0l9ivRomj9NSeqaWw3umsBVofPRHF8fWOMvgCLBuWAX2nNa
	5Zgs5O+inQi3ciYxTh7ZTgcPlOrp35YfeOcMvGtc+zdFyPefYH1GVcT5atHhPZXbyzY7bp0HY8chW
	NX22JI12Zf4tR/bQPIGGzMkrc6BF+crSh2Szz7jli5iymVGT7UqM7p/NX3KopA5fwSrfZJWMVawi+
	eyW/PwXGRIYgs1bnseCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3VW-0001Rj-Sd; Thu, 16 Apr 2020 12:20:38 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3UI-00069q-7x
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 12:19:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id r26so4636295wmh.0
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZcSlgg353LajR7zMDfYkV7be68AlVwenv5Lg46D/qo=;
 b=lrvSCM3YnqpwxmjWfgNiTZc4qJuxtPbIrkSDVdgwC7z+FUCOZnV4wID9RLmQTcr3um
 6QX7PfzocPTyBfGEdFr78wYyP5DA34wv9f79M7Na1uLWAtxX0/nI57u8gHv8i2XuVtbx
 swZm0DURVdqAW2KFpfBu9GY7JMotE9pIm1wDhM9/gDOzJkepkYYA1t69erXciZyvJhBb
 dMhbZvo7AH0Glsun3clOT4NwMwejy9sHc/BW2llvZw+85KBc+aQLJGJ8eWiBxCg6qQf2
 ri+i4gtbEPvoYLfX5/daGTNTC3uGaYqv/AJTMoMveDb0N9LB1o/bAeJvTfOnWQ0AT97s
 OdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZcSlgg353LajR7zMDfYkV7be68AlVwenv5Lg46D/qo=;
 b=ToAS0FcZ99e0o5bUthYCysNOxlwT2VngrcEKtM1c2xDxfdaKkCmzf+lZTOtTZskX1E
 HGWjBAELGPvahfZNESZwn74DHgd8niIH54aPqwYr/bym6lYYCTnsFcN9lbXK3ONL68r2
 k3Inh91GQq3R048zJcdY6rypWIhli6DFsEILlot9814hbpcDMkQc+T6Sb3KQNp6y/DaH
 wqvHGxeqp4rg3xOORYMgUFjJYzpL8j4E+TtHHa0sv33gM7ykzYQqXjohRdbN8L9d2eR5
 zriWt7xDuWCeYAm0CdbjdcvtguInCDovSitdSSNix0zWY/+8fkkBmF1VSNKmcnxFfYfW
 TMwg==
X-Gm-Message-State: AGi0PuZoZCCc9BYbSfb42CuuSNWMAtnohg2cf2orci2NnErmmPch9Hnf
 HvYdbfQjtfaX9P8jlIa5dwIyNw==
X-Google-Smtp-Source: APiQypKQT1DUgq3Kq2lfPKLc8C7IAbCXliG8RO8XPli0CLlx/EuucBvI2894V3GAKF2Q9nznPpM0rQ==
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr4412345wml.7.1587039560147;
 Thu, 16 Apr 2020 05:19:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i13sm22035602wro.50.2020.04.16.05.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:19:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v3 3/8] usb: dwc3: meson-g12a: add support for GXL and GXM SoCs
Date: Thu, 16 Apr 2020 14:19:05 +0200
Message-Id: <20200416121910.12723-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200416121910.12723-1-narmstrong@baylibre.com>
References: <20200416121910.12723-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_051922_319737_A8BA4CE6 
X-CRM114-Status: GOOD (  14.44  )
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

In order to add support for the Amlogic GXL/GXM USB Glue, this adds
the corresponding :
- PHY names
- clock names
- USB2 PHY init and mode set
- regmap setup

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 102 ++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index cc0b8a253932..61507abb0ff7 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -101,6 +101,11 @@
 #define PHY_COUNT						3
 #define USB2_OTG_PHY						1
 
+static struct clk_bulk_data meson_gxl_clocks[] = {
+	{ .id = "usb_ctrl" },
+	{ .id = "ddr" },
+};
+
 static struct clk_bulk_data meson_g12a_clocks[] = {
 	{ .id = NULL },
 };
@@ -111,6 +116,10 @@ static struct clk_bulk_data meson_a1_clocks[] = {
 	{ .id = "xtal_usb_ctrl" },
 };
 
+static const char *meson_gxm_phy_names[] = {
+	"usb2-phy0", "usb2-phy1", "usb2-phy2",
+};
+
 static const char *meson_g12a_phy_names[] = {
 	"usb2-phy0", "usb2-phy1", "usb3-phy0",
 };
@@ -145,16 +154,25 @@ struct dwc3_meson_g12a_drvdata {
 	int (*usb_post_init)(struct dwc3_meson_g12a *priv);
 };
 
+static int dwc3_meson_gxl_setup_regmaps(struct dwc3_meson_g12a *priv,
+					void __iomem *base);
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 					 void __iomem *base);
 
 static int dwc3_meson_g12a_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
-					  enum phy_mode mode);
+					 enum phy_mode mode);
+static int dwc3_meson_gxl_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					enum phy_mode mode);
 
 static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 					int i, enum phy_mode mode);
+static int dwc3_meson_gxl_set_phy_mode(struct dwc3_meson_g12a *priv,
+				       int i, enum phy_mode mode);
 
 static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv);
+static int dwc3_meson_gxl_usb_init(struct dwc3_meson_g12a *priv);
+
+static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv);
 
 /*
  * For GXL and GXM SoCs:
@@ -169,6 +187,34 @@ static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv);
  * reset to recover usage of the port.
  */
 
+static struct dwc3_meson_g12a_drvdata gxl_drvdata = {
+	.otg_switch_supported = true,
+	.otg_phy_host_port_disable = true,
+	.clks = meson_gxl_clocks,
+	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
+	.setup_regmaps = dwc3_meson_gxl_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_gxl_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_gxl_set_phy_mode,
+	.usb_init = dwc3_meson_gxl_usb_init,
+	.usb_post_init = dwc3_meson_gxl_usb_post_init,
+};
+
+static struct dwc3_meson_g12a_drvdata gxm_drvdata = {
+	.otg_switch_supported = true,
+	.otg_phy_host_port_disable = true,
+	.clks = meson_gxl_clocks,
+	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
+	.phy_names = meson_gxm_phy_names,
+	.num_phys = ARRAY_SIZE(meson_gxm_phy_names),
+	.setup_regmaps = dwc3_meson_gxl_setup_regmaps,
+	.usb2_init_phy = dwc3_meson_gxl_usb2_init_phy,
+	.set_phy_mode = dwc3_meson_gxl_set_phy_mode,
+	.usb_init = dwc3_meson_gxl_usb_init,
+	.usb_post_init = dwc3_meson_gxl_usb_post_init,
+};
+
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
@@ -209,6 +255,21 @@ struct dwc3_meson_g12a {
 	const struct dwc3_meson_g12a_drvdata *drvdata;
 };
 
+static int dwc3_meson_gxl_set_phy_mode(struct dwc3_meson_g12a *priv,
+					 int i, enum phy_mode mode)
+{
+	return phy_set_mode(priv->phys[i], mode);
+}
+
+static int dwc3_meson_gxl_usb2_init_phy(struct dwc3_meson_g12a *priv, int i,
+					enum phy_mode mode)
+{
+	/* On GXL PHY must be started in device mode for DWC2 init */
+	return priv->drvdata->set_phy_mode(priv, i,
+				(i == USB2_OTG_PHY) ? PHY_MODE_USB_DEVICE
+						    : PHY_MODE_USB_HOST);
+}
+
 static int dwc3_meson_g12a_set_phy_mode(struct dwc3_meson_g12a *priv,
 					 int i, enum phy_mode mode)
 {
@@ -558,6 +619,18 @@ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
 	return 0;
 }
 
+static int dwc3_meson_gxl_setup_regmaps(struct dwc3_meson_g12a *priv,
+					void __iomem *base)
+{
+	/* GXL controls the PHY mode in the PHY registers unlike G12A */
+	priv->usb_glue_regmap = devm_regmap_init_mmio(priv->dev, base,
+					&phy_meson_g12a_usb_glue_regmap_conf);
+	if (IS_ERR(priv->usb_glue_regmap))
+		return PTR_ERR(priv->usb_glue_regmap);
+
+	return 0;
+}
+
 static int dwc3_meson_g12a_setup_regmaps(struct dwc3_meson_g12a *priv,
 					 void __iomem *base)
 {
@@ -598,6 +671,25 @@ static int dwc3_meson_g12a_usb_init(struct dwc3_meson_g12a *priv)
 	return dwc3_meson_g12a_usb_init_glue(priv, priv->otg_phy_mode);
 }
 
+static int dwc3_meson_gxl_usb_init(struct dwc3_meson_g12a *priv)
+{
+	return dwc3_meson_g12a_usb_init_glue(priv, PHY_MODE_USB_DEVICE);
+}
+
+static int dwc3_meson_gxl_usb_post_init(struct dwc3_meson_g12a *priv)
+{
+	int ret;
+
+	ret = priv->drvdata->set_phy_mode(priv, USB2_OTG_PHY,
+					  priv->otg_phy_mode);
+	if (ret)
+		return ret;
+
+	dwc3_meson_g12a_usb_otg_apply_mode(priv, priv->otg_phy_mode);
+
+	return 0;
+}
+
 static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 {
 	struct dwc3_meson_g12a	*priv;
@@ -829,6 +921,14 @@ static const struct dev_pm_ops dwc3_meson_g12a_dev_pm_ops = {
 };
 
 static const struct of_device_id dwc3_meson_g12a_match[] = {
+	{
+		.compatible = "amlogic,meson-gxl-usb-ctrl",
+		.data = &gxl_drvdata,
+	},
+	{
+		.compatible = "amlogic,meson-gxm-usb-ctrl",
+		.data = &gxm_drvdata,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-usb-ctrl",
 		.data = &g12a_drvdata,
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
