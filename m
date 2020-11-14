Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F80EC61DD8
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A1652231B
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 20:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2KcIoEFF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="df1iiyg4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A1652231B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BtbUDmd/4SxTMm5ftv/zeTYtmFVi2nRFWvE1vKftCzM=; b=2KcIoEFF18gC1YJ3JiOROR9cf
	2nHbChiV/0impwdaY2nkLAzvcuyur1b4lMn6MEXuvCiC5mOW5QRHfMd2MRGm2Q8HW8sipAuBW6h4E
	Am5b5tahIGm/AZXvWodgIWs4xOQm5iuf1uYh+lI7qPeViVA95IuK7d6j1/fuZEPeaqefErl/2R2gD
	P/B9orQcme9cvmwHxj9b8f+qcqKe4KOkCq8ftPzqySkbDK9XNSVz7FpAdi+nAKIR5Kuo6ZPhi4x7g
	qiP6Lb9gVe5dKBP9XJfPt0pHv3XvAxDp2wG2E1XRqFi5Z+xktR7okLlPV1pWqu9WbWynRy4DvsnwN
	rc1fpl4Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke1kV-0004E3-No; Sat, 14 Nov 2020 20:02:16 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke1k9-00048R-4B; Sat, 14 Nov 2020 20:01:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id a65so19797440wme.1;
 Sat, 14 Nov 2020 12:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4KSCu27l61jUmMvpofG000bGUgTYBDrDcAVkMbuCyA=;
 b=df1iiyg4RObmAz6QqEy/oZPHW8DWWG/RColzjhlKYrQg7ZJLAafNl84K5Ci7Gg8mEY
 t0RzAt9YobM37tHebL1M6oVNF9sjMKtuT4BmuEZmzaZW9RTUigUC7dhR085dOTAWZcbq
 6GjIskkHp3my2xaxquushjDsVSeP5XW7o0QElyVPXaqea8GuE38jQJzasvgT52jupqOK
 AlyILAVDOaONhl7FWFzhz/gxU4n7JX/zQLZyK0I/5xCK5l1IQxTiQHsrwEizO0W6sUL6
 kxGrQUJ5MaqCLTaLwK3MMWF/2mgJ9/hQWvRaHTN3llRg8PBc59T6md65s/a2nmYY2q5L
 QMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4KSCu27l61jUmMvpofG000bGUgTYBDrDcAVkMbuCyA=;
 b=raMzzXIghhI+JTV65h0HKfttozOgRLmL/rjjIfyp7dYTKlKn6tkyLk9QWnqJ373Pdg
 JEteBgx2rddJhM9qClN/Gj86HNGQFNCWBYnoQ48GuGEvZ13JPNtZ5ZEYTP1EqvVwAp0e
 8NdoZ9wt9frQSIGfnmSudfzblSxD2HuFi4LEvdRHDandLJErkO7vD69PzVTRzoXRbLBd
 OgdPHwL5H/eZHKEQdSmRGpfcku4r438FL6h1oqpvzKPt771IZ5VwOrd/Uum+NfGw1Y2S
 A99qXHBt7/FPZo4LaJjeh7QhAPvmnR3K94GjO4H51xde4PADqk3svWr+qev9voTXAH6M
 v/rg==
X-Gm-Message-State: AOAM531QAZWoOTVUy9QGEufz9d4Wj6/0mdlpr/j45aOr3SxSXwzjSuSt
 svmxYK3sshAg/70mQfQFU90=
X-Google-Smtp-Source: ABdhPJxx3Gum24To/Or5CD3liT8L73i8srmistHejB729Rq0H7lIKKJ92dirWgs92RWgZMy+WiwwLg==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr8276033wmk.131.1605384112102; 
 Sat, 14 Nov 2020 12:01:52 -0800 (PST)
Received: from localhost.localdomain (p4fc3ea77.dip0.t-ipconnect.de.
 [79.195.234.119]) by smtp.googlemail.com with ESMTPSA id
 g138sm14342953wme.39.2020.11.14.12.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 12:01:51 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, kuba@kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: [PATCH RFC v1 4/4] net: stmmac: dwmac-meson8b: add support for the
 RGMII RX delay on G12A
Date: Sat, 14 Nov 2020 21:01:04 +0100
Message-Id: <20201114200104.4148283-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_150153_293598_4D4912AD 
X-CRM114-Status: GOOD (  20.52  )
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
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A (and newer: G12B, SM1) SoCs have a more advanced RX
delay logic. Instead of fine-tuning the delay in the nanoseconds range
it now allows tuning in 200 picosecond steps. This support comes with
new bits in the PRG_ETH1[19:16] register.

Add support for validating the RGMII RX delay as well as configuring the
register accordingly on these platforms.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 63 ++++++++++++++-----
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index a6e2077ed871..ae081fbc0552 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -69,10 +69,21 @@
  */
 #define PRG_ETH0_ADJ_SKEW		GENMASK(24, 20)
 
+#define PRG_ETH1			0x4
+
+/* Defined for adding a delay to the input RX_CLK for better timing.
+ * Each step is 200ps. These bits are used with external RGMII PHYs
+ * because RGMII RX only has the small window. cfg_rxclk_dly can
+ * adjust the window between RX_CLK and RX_DATA and improve the stability
+ * of "rx data valid".
+ */
+#define PRG_ETH1_CFG_RXCLK_DLY		GENMASK(19, 16)
+
 struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	bool has_prg_eth1_rgmii_rx_delay;
 };
 
 struct meson8b_dwmac {
@@ -270,30 +281,35 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
-	u32 tx_dly_config, rx_dly_config, delay_config;
+	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
 	int ret;
 
+	rx_adj_config = 0;
+	cfg_rxclk_dly = 0;
 	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
 				   dwmac->tx_delay_ns >> 1);
 
-	if (dwmac->rx_delay_ps == 2000)
-		rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
-	else
-		rx_dly_config = 0;
+	if (dwmac->data->has_prg_eth1_rgmii_rx_delay)
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps == 2000)
+		rx_adj_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
 
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-		delay_config = tx_dly_config | rx_dly_config;
+		delay_config = tx_dly_config | rx_adj_config;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 		delay_config = tx_dly_config;
+		cfg_rxclk_dly = 0;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		delay_config = rx_dly_config;
+		delay_config = rx_adj_config;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RMII:
 		delay_config = 0;
+		cfg_rxclk_dly = 0;
 		break;
 	default:
 		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
@@ -301,7 +317,7 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 		return -EINVAL;
 	}
 
-	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
+	if (rx_adj_config & PRG_ETH0_ADJ_ENABLE) {
 		if (!dwmac->timing_adj_clk) {
 			dev_err(dwmac->dev,
 				"The timing-adjustment clock is mandatory for the RX delay re-timing\n");
@@ -323,6 +339,9 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
 				delay_config);
 
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
 	return 0;
 }
 
@@ -424,11 +443,20 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 			dwmac->rx_delay_ps *= 1000;
 	}
 
-	if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
-		dev_err(&pdev->dev,
-			"The only allowed RX delays values are: 0ps, 2000ps");
-		ret = -EINVAL;
-		goto err_remove_config_dt;
+	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
+		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
+			dev_err(dwmac->dev,
+				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+			ret = -EINVAL;
+			goto err_remove_config_dt;
+		}
+	} else {
+		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
+			dev_err(dwmac->dev,
+				"The RGMII RX delay range is 0..3000ps in 200ps steps");
+			ret = -EINVAL;
+			goto err_remove_config_dt;
+		}
 	}
 
 	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
@@ -470,10 +498,17 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = false,
+};
+
+static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct of_device_id meson8b_dwmac_match[] = {
@@ -495,7 +530,7 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 	},
 	{
 		.compatible = "amlogic,meson-g12a-dwmac",
-		.data = &meson_axg_dwmac_data,
+		.data = &meson_g12a_dwmac_data,
 	},
 	{ }
 };
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
