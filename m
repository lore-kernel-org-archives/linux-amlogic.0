Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1E360A3814
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yb0JgIN6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mEJW8ySfMFTQ4Iux48AY76WuvW6IzDIix+H69WqMvZA=; b=Yb0JgIN62QVfLGXG7L0jTuS6GF
	o3D6AkdRokha4hOMv8HoAvMFbXwmDO29HpfqxU67lVUXl6nxn9MYazfd18VRVG2goKjAYaniFPNUi
	RJRcuQmRnNyuj4pUCT8gShdokHgI75ba6vjTKrxSo+dP74POAnyMEs+ykMdmiug83rif+pN9QHSAf
	y2G4Fb5k1GGpg0Wkvwa2rfYfnxBsU24dp7qIkK4lWeX6mSU7T2yMyYnd1mfYL49eK7F+8o9gVGECC
	Z22K8t/inpoeHESkcvuXCK3qdLX0LfeqAx9DOUZG3DTHVQf6o3KDkVK7Z+9RfqOEKT2sjTiYGmRf7
	DnnCG3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3z-0000000EtCl-1Y0D;
	Thu, 22 Oct 2026 20:06:59 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz3s-0000000Et4M-25aA
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:06:53 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1859395e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699610; x=1793304410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=96350WqdsGhyHxXINfUlMmZbjGGRzw92jsjc9LeGtoU=;
        b=PdVWCB/LgtnWInar9wBbPnphJRMoKclgYPpx7U7qV79qJgjZtZg6QPZs3Gb/elhtAY
         8nW9twSaVSbOGlfNA05t6tfK2GNpMWRzCcARAtNxTDYPSdsp+ldJwar946qNscBJgF8A
         7rBWAI4kI6i3ZsqgOlVCtP4hOHTcytWJkmvVw8om3Fqxn086EJjzy1bnuWltZu6xj5c2
         twvbSPgIcK2Es+rjV2MbssJct5zttUIWy0CoAU0JlMjd6HvhPILmnRMvZxWWtTa/Pvc4
         DOUO3vQXRjm6CVui63XziMMu0g4fehJqdaSyuX+vxY+AgioM8FJB7WBIoRUIZe/ydzyT
         Mylw==
X-Forwarded-Encrypted: i=1; AKwUvBz7SVpC4+SX0BXSwUodlRS+CM2feGMqeBILNVYuZxvOzC65LXL5sI23icpcfa8RWpNuSFGyjk/qmP+/F7iS@lists.infradead.org
X-Gm-Message-State: AFq9FYLE2/6j2UZP7LS7VhWThpHWfX0P4F+pPHRTk09ODfJHD7Kq/SF5
	tHH2tiIIyU3kEwtA74aa1McXIFR3vhqERPvStEassrUnYRjpMKouedmZ
X-Gm-Gg: AYBFou3iSCdHouauc19tSaNoF7ujumt1jG8KXKSf9z2BeiLDYNIJB72dmFmcVrv6jL3
	vgqt8UHgFFgImaVFnFEpq+LwQ8CVBQdPy/VLyZlC0RE6TyEXGOCtrqjKzx2HeZUQW9IKSETCSWm
	vXjpcyIw8g8rrLx++rH/Vy/a+unynfcsSTZx5Awz3r5I5iiZOQ1I19k34HZ8yZuuTL+7iam02HE
	hnui2cK9/ol10kBCt869Zsh8tu9bA9Sx+GEfKYT+NwgqDOJ6UsROR1+94HhC7d8ZqsMVOUoD9TR
	gvrxlF1R711fy8kH8czuU13kcbfCv7ujtrvWPcHSrrdg5WIaXt5vG8HpAaCBwkDd3u5ggwxgE+P
	dyFOkuiKfffGWton6nCxI/o/hcHMaV9smx0pSQem9B2+zgEpimjfNz/bb01b+Lm34xlArM8LqbQ
	CXdMiVhDJ8GHCJ0VTeaQckhQv2LJTJWK5HqJkWH3gyCLwAM2YgWMSc8aOJrrbQjobNMVpAP4Hs+
	DXfsxe5s2qK8gZzLPY/NZrR3ay8tvTRKiiz0gxyzN38Gl+8xyQihBtzyMy/fmFEsNPiIrHT5gmm
	WIEOg8fkcC5Yli8=
X-Received: by 2002:a05:600c:83c9:b0:4a1:7ba9:da2c with SMTP id 5b1f17b1804b1-4a211ef7beamr1761675e9.25.1792699610441;
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Thu, 22 Oct 2026 21:06:37 +0100
Message-ID: <20261022200640.3101932-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_130652_663098_CD130710 
X-CRM114-Status: GOOD (  24.04  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays.

The T7 has no boards yet, so it follows the generic rules. Its receive
delay line is fine tuning, 200ps steps up to 3000ps. Its transmit side
only has a quarter-period phase step, the full 2ns at 1Gbit/s, so there
is nothing to fine tune and the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 122 ++++++++++++------
 1 file changed, 85 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..95a185691503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -91,8 +92,6 @@ struct meson8b_dwmac {
 	const struct meson8b_dwmac_data	*data;
 	phy_interface_t			phy_mode;
 	struct clk			*rgmii_tx_clk;
-	u32				tx_delay_ns;
-	u32				rx_delay_ps;
 	struct clk			*timing_adj_clk;
 };
 
@@ -272,20 +271,91 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					meson8b_clk_disable_unprepare, clk);
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock, on top of what
+ * phy-mode describes. The TX clock has no fine tuning, its only step is
+ * a quarter of the clock period, so the TX property is refused.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 rx_delay_ps = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "tx-internal-delay-ps is not supported, the PHY adds the TX delay\n");
+
+	if (!of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps)) {
+		if (!phy_interface_mode_is_rgmii(dwmac->phy_mode))
+			return dev_err_probe(dwmac->dev, -EINVAL,
+					     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+		/* the RX delay line moves in 200ps steps and reaches 3000ps */
+		if (!rx_delay_ps || rx_delay_ps > 3000 || rx_delay_ps % 200)
+			return dev_err_probe(dwmac->dev, -EINVAL,
+					     "The RGMII RX delay range is 200..3000ps in 200ps steps\n");
+	}
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   rx_delay_ps / 200));
+
+	return 0;
+}
+
+/*
+ * Delay handling of the SoCs up to the G12A. It reads phy-mode as the
+ * list of delays this glue has to add, falls back to a 2ns TX delay and
+ * takes the vendor delay properties, all of which ethernet-controller.yaml
+ * rules out. The boards in the tree depend on it, so it stays, but a new
+ * SoC must not use it.
+ */
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
+	struct device_node *np = dwmac->dev->of_node;
+	u32 tx_delay_ns, rx_delay_ps = 0;
 	int ret;
 
+	/* use 2ns as fallback since this value was previously hardcoded */
+	if (of_property_read_u32(np, "amlogic,tx-delay-ns", &tx_delay_ns))
+		tx_delay_ns = 2;
+
+	/* RX delay defaults to 0ps since this is what many boards use */
+	if (of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps)) {
+		if (!of_property_read_u32(np, "amlogic,rx-delay-ns",
+					  &rx_delay_ps))
+			/* convert ns to ps */
+			rx_delay_ps *= 1000;
+	}
+
+	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
+		if (rx_delay_ps > 3000 || rx_delay_ps % 200) {
+			dev_err(dwmac->dev,
+				"The RGMII RX delay range is 0..3000ps in 200ps steps");
+			return -EINVAL;
+		}
+	} else {
+		if (rx_delay_ps != 0 && rx_delay_ps != 2000) {
+			dev_err(dwmac->dev,
+				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+			return -EINVAL;
+		}
+	}
+
 	rx_adj_config = 0;
 	cfg_rxclk_dly = 0;
-	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK,
-				   dwmac->tx_delay_ns >> 1);
+	tx_dly_config = FIELD_PREP(PRG_ETH0_TXDLY_MASK, tx_delay_ns >> 1);
 
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay)
 		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
-					   dwmac->rx_delay_ps / 200);
-	else if (dwmac->rx_delay_ps == 2000)
+					   rx_delay_ps / 200);
+	else if (rx_delay_ps == 2000)
 		rx_adj_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
 
 	switch (dwmac->phy_mode) {
@@ -411,35 +481,6 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
-	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
-		dwmac->tx_delay_ns = 2;
-
-	/* RX delay defaults to 0ps since this is what many boards use */
-	if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
-				 &dwmac->rx_delay_ps)) {
-		if (!of_property_read_u32(pdev->dev.of_node,
-					  "amlogic,rx-delay-ns",
-					  &dwmac->rx_delay_ps))
-			/* convert ns to ps */
-			dwmac->rx_delay_ps *= 1000;
-	}
-
-	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
-		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
-			dev_err(dwmac->dev,
-				"The RGMII RX delay range is 0..3000ps in 200ps steps");
-			return -EINVAL;
-		}
-	} else {
-		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
-			dev_err(dwmac->dev,
-				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
-			return -EINVAL;
-		}
-	}
-
 	dwmac->timing_adj_clk = devm_clk_get_optional(dwmac->dev,
 						      "timing-adjustment");
 	if (IS_ERR(dwmac->timing_adj_clk))
@@ -452,7 +493,11 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	if (!dwmac->data->init_delays)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "missing init_delays callback\n");
+
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,22 +520,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
-	.has_prg_eth1_rgmii_rx_delay = true,
+	.init_delays = meson_t7_init_delays,
 	.has_pipeline_clk = true,
 };
 
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
