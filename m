Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84081C433E6
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359FC224B1
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 23:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359FC224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rw6QtFoN4nSppVDYIegotf9lr1j+9Ds5TjTCnvuCNgw=; b=yWJxpgqX4OYFpuSUXX7QLHdPI
	/+gLhxfejr4fbts2rPm/p0gntG5c/jgmdBLqR6O9HM3/WCF3tA2E93EVyVWqahR5SOEUGkTeP3xdE
	Tus8oL+4nVwZj3UxWntkZ68eGfaCw2DU+PMFjm1Sp1Ia0ZbefCDM42JY9UqV07pVmY94VgoECrEST
	sU414aMwl7ifIcdOTS2zAPvR5LMPTHzAhgh30jz9FyJMsqVlM0vW4Z84gqWJvq4zL1W9rE8uO5cBU
	Vq11W7X5n+KYTPceiFvVgjQOhWnawZKuNRPOdTxlm3rGAjve49uTTAmNn2EZ8KMLrGsl5Y+RWdPiC
	aOUfqa9ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksDat-0002kf-MN; Wed, 23 Dec 2020 23:30:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksDae-0002gZ-G6; Wed, 23 Dec 2020 23:30:46 +0000
Received: by mail-wr1-x435.google.com with SMTP id 91so685244wrj.7;
 Wed, 23 Dec 2020 15:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xDe0p+fCHjgP8/3HdTwCfTdFrh+VCfBpvFU7FupxqxM=;
 b=a5m/JD67n1sNEG2yCgdvaAqsVhI24bs4L0yvW0M8S/t3WevCKohih9wiop8NQpIS0O
 5MaRETZRwCb6ENQtw5rsIbozTQesm4BiQ1sWLzm3co7YWM7gg88Zf3wj/vtGCVxhI4aA
 6u+AP7AZ5QFQyosIjijRm8qWYAsxwNuA3OpXK7dFZxIrhpvh54B3oDv1Vd3CK35zdp4/
 wIrqnT2U+ySQKdVz0PbAAWimPNlWCENelG3fPVCVdayZIdmwp1HN2ake1+3QqQj4F7cX
 1jCRFBwMvtD31Sw6NEE5562GFAtpYqXnGJVrH3BA2wpKfv69RHE1QeQWBJWo+EWQFxpA
 N3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xDe0p+fCHjgP8/3HdTwCfTdFrh+VCfBpvFU7FupxqxM=;
 b=PLyazKwjzIzfzxMn3PnBjgEqyL+oIHZwNZmIR80wCM1HNRPusa/973JUjXOYTzFcS/
 kCLVOhAKc7LCR4LVftrVnDCxyyIMrxTfo7+DpzFyjCZA6Kyq05dzu4kmEw+ifvY2Sjwc
 9XjNrUHzayuUUxF5gmlcwDalAY4Qv3Wc7wwz5hURIugWz7LJIP0ch1J/yG5IBPg5gdwD
 gbI3h6kYXgS2cFy6NBXgEqBqW8C5CSKIE2qH+xPz4eeFS0jzP39pZZvV/gE64jRo29rQ
 yg0NgG9aX8QTYb6jCCX1ZwR8rNXfY1fONSNlHAjeQzMT0e5JRIW5XlqJcRqfdPE7m3yG
 247w==
X-Gm-Message-State: AOAM533Uq4iII8vA5JOk/6hCT1dSGXYnd7jBs5hqw6qZ4oK8kCaSG9JH
 CqVg6+YxFy1fLwq1wCrZXtNm3w5WHXA=
X-Google-Smtp-Source: ABdhPJw5Ez/gToiq52vpj3Abpb+v5FIko90pZbplhBepbNdPFGa/+E4ZV0SpTwefYDAkozF55ECLcw==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr31960136wrt.246.1608766243040; 
 Wed, 23 Dec 2020 15:30:43 -0800 (PST)
Received: from localhost.localdomain
 (p200300f1371a0900428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l16sm37926657wrx.5.2020.12.23.15.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 15:30:42 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v3 5/5] net: stmmac: dwmac-meson8b: add support for the RGMII
 RX delay on G12A
Date: Thu, 24 Dec 2020 00:29:05 +0100
Message-Id: <20201223232905.2958651-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_183044_624059_3EAAC56E 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 61 +++++++++++++++----
 1 file changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 4937432ac70d..55152d7ba99a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -68,10 +68,21 @@
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
@@ -323,6 +339,9 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
 				delay_config);
 
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
 	return 0;
 }
 
@@ -423,11 +442,20 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
@@ -469,10 +497,17 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
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
@@ -494,7 +529,7 @@ static const struct of_device_id meson8b_dwmac_match[] = {
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
