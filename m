Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127F0C4332B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:21:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B31BF208C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ryC4/SN6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rEaAC2+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B31BF208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Slmmnuor3/QQ7tZASL/4MCPg/0LgRXB22NiM4z4pKJ8=; b=ryC4/SN6Q3Kj0z
	XhTx8h5LK1m7rB2rjJcK1vC+KB/kA6BVTja/QtpQk2mbovv+0XBbw77n+6bQCssvh9M0kDlZ+FIuE
	AlfJeedRHnD2mKxZDev9moR7NPLH6yS0oRg5woWaerDzseDIS2FgNWce0R41oSbF0Znskq1QPwgGc
	nfjdjj7GnzWbNTNnGDdRg8A/10u92qERF+bYnFvO3GOADrDyIjmCoApI6Z1WBmoVjtKBPd1AOAwcT
	VeeE6VPHjuAlXQcMmDyayRKAGFGqiSidctkbolYqA9ksB+sDS1V1uJimlRWLhU2TvCLVk7mA7flES
	3FHAHBLcWFHSibaZn9zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGggu-0002lI-RI; Tue, 24 Mar 2020 10:21:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgfq-0001rB-Br
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 10:20:44 +0000
Received: by mail-wm1-x344.google.com with SMTP id g62so2804028wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vevMugysMeZ18EOmMAcbQ1H4E68kSGbbm2Ev/+c6lUw=;
 b=rEaAC2+Cy/ijpd7Vap0HEzeSfQwjvK1gYaAKrWDLtlEaS5nXJWcDYXj5JKHU809eNt
 ZECNK8P+m+WV3n64pvxlKNqbPnB+DdPWqc+ijN9p/WxhygbFunNLTjJdJjPT30CbGW4b
 VVQ4cL0J7cz0kFKonq4tCj+07l3f196VMI+mpvuRyZCL9TuVnBl8VC9WcsydEFaTgtgE
 0kmmcM4p+vXYFPYGlIeemEwsP3i9xL3B/aG3rY6nj/shLyUZwIWcIR8s9IXEc+7N93GT
 J46RTHadc+rt3sL+3piUE2dF+tYsOLOVj2ndAA2lm20xKEcXlpv5fR7SAtd3ZcUf7f4K
 btig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vevMugysMeZ18EOmMAcbQ1H4E68kSGbbm2Ev/+c6lUw=;
 b=etROI1xai2MQenFb+KIxag4cCIOhuRENFHupvAHEVamEFH6AfaH/itOUkYC1OZw/vU
 SSLckJ5T7ZhSHA7QKOw6A/J2d+cg2o159XCVpiQ6KG0MZfEK9AZq+Hi5f4e6Mu6QWm4w
 9C+HNEdgLL+NhwSuqrl2wduBwkg8fb71TVDkLISWupSPbrvTFB1ZQSTfn7J7mp/EdffS
 nDdGI809y4zc5pPRQVC4un28NVSalE6NF0RyMjZ+pclaedJKxLzybfe4odphjt5sQgG6
 1mSKPMGc2VOirjEFB/CRxOmMZQYAkQQd79IbE5g27fF0L/Rdg5Rpcsb5tOylgI5pYWxH
 Zu2w==
X-Gm-Message-State: ANhLgQ3nttKeRZKO85S0ur+YgN1H/5YxkpVV785vHRvfgw5OCIllqeEK
 e8T98RXp1c3cd9dRQAZn5FB4HA==
X-Google-Smtp-Source: ADFU+vvDJf2Avo97Xe5bVFATihkIhVjh0/x6nK0MsmtW3Bm46KvS5uiWic5eD6DBiajtLLmcLTZZoQ==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr4838622wmb.102.1585045240690; 
 Tue, 24 Mar 2020 03:20:40 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 03:20:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH 02/13] usb: dwc3: meson-g12a: specify phy names in soc data
Date: Tue, 24 Mar 2020 11:20:19 +0100
Message-Id: <20200324102030.31000-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200324102030.31000-1-narmstrong@baylibre.com>
References: <20200324102030.31000-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_032042_404807_062B1DDD 
X-CRM114-Status: GOOD (  11.34  )
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

To handle the variable USB2 PHY counts on GXL and GXM SoCs, add the
possible PHY names for each SoC in the compatible match data.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 39 +++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 902553f39889..7ba5fb3d0e22 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -96,16 +96,8 @@
 	#define USB_R5_ID_DIG_TH_MASK				GENMASK(15, 8)
 	#define USB_R5_ID_DIG_CNT_MASK				GENMASK(23, 16)
 
-enum {
-	USB2_HOST_PHY = 0,
-	USB2_OTG_PHY,
-	USB3_HOST_PHY,
-	PHY_COUNT,
-};
-
-static const char *phy_names[PHY_COUNT] = {
-	"usb2-phy0", "usb2-phy1", "usb3-phy0",
-};
+#define PHY_COUNT						3
+#define USB2_OTG_PHY						1
 
 static struct clk_bulk_data meson_g12a_clocks[] = {
 	{ .id = NULL },
@@ -117,22 +109,36 @@ static struct clk_bulk_data meson_a1_clocks[] = {
 	{ .id = "xtal_usb_ctrl" },
 };
 
+static const char *meson_g12a_phy_names[] = {
+	"usb2-phy0", "usb2-phy1", "usb3-phy0",
+};
+
+static const char *meson_a1_phy_names[] = {
+	"usb2-phy0", "usb2-phy1"
+};
+
 struct dwc3_meson_g12a_drvdata {
 	bool otg_switch_supported;
 	struct clk_bulk_data *clks;
 	int num_clks;
+	const char **phy_names;
+	int num_phys;
 };
 
 static struct dwc3_meson_g12a_drvdata g12a_drvdata = {
 	.otg_switch_supported = true,
 	.clks = meson_g12a_clocks,
 	.num_clks = ARRAY_SIZE(meson_g12a_clocks),
+	.phy_names = meson_g12a_phy_names,
+	.num_phys = ARRAY_SIZE(meson_g12a_phy_names),
 };
 
 static struct dwc3_meson_g12a_drvdata a1_drvdata = {
 	.otg_switch_supported = false,
 	.clks = meson_a1_clocks,
 	.num_clks = ARRAY_SIZE(meson_a1_clocks),
+	.phy_names = meson_a1_phy_names,
+	.num_phys = ARRAY_SIZE(meson_a1_phy_names),
 };
 
 struct dwc3_meson_g12a {
@@ -171,10 +177,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
 	else
 		priv->otg_phy_mode = PHY_MODE_USB_HOST;
 
-	for (i = 0 ; i < USB3_HOST_PHY ; ++i) {
+	for (i = 0; i < priv->drvdata->num_phys; ++i) {
 		if (!priv->phys[i])
 			continue;
 
+		if (!strstr(priv->drvdata->phy_names[i], "usb2"))
+			continue;
+
 		regmap_update_bits(priv->regmap, U2P_R0 + (U2P_REG_SIZE * i),
 				   U2P_R0_POWER_ON_RESET,
 				   U2P_R0_POWER_ON_RESET);
@@ -284,17 +293,19 @@ static const struct regmap_config phy_meson_g12a_usb3_regmap_conf = {
 
 static int dwc3_meson_g12a_get_phys(struct dwc3_meson_g12a *priv)
 {
+	const char *phy_name;
 	int i;
 
-	for (i = 0 ; i < PHY_COUNT ; ++i) {
-		priv->phys[i] = devm_phy_optional_get(priv->dev, phy_names[i]);
+	for (i = 0 ; i < priv->drvdata->num_phys ; ++i) {
+		phy_name = priv->drvdata->phy_names[i];
+		priv->phys[i] = devm_phy_optional_get(priv->dev, phy_name);
 		if (!priv->phys[i])
 			continue;
 
 		if (IS_ERR(priv->phys[i]))
 			return PTR_ERR(priv->phys[i]);
 
-		if (i == USB3_HOST_PHY)
+		if (strstr(phy_name, "usb3"))
 			priv->usb3_ports++;
 		else
 			priv->usb2_ports++;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
