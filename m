Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A92DCA6004
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Oct 2026 10:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGb65fb45tjgQ2n6SwLWuHrbkZTdfZrO2bS7kF1tFFk=; b=ypAK73oa7NAr+X
	ttZgUiIQEXzWzmUnxr2vW1crFXU4Vl/9/+QqpNCQh/Tivf2HtH87YaCt1qbKi6S3T8t0S08Li1kpa
	e1D4jsnXyaiFRPhgoaR952LS802yIPndem1AAGxGQjtwJTogu24yeRC8vKllnUfdmScneHZ0eqDeD
	a4U8aX1f2UnJGlk+lx1p0KXUWo97NMmf0OaqJMGdsdkgPMuwZ/mm5DKdiNkSi1MmodKlip4r0VUH5
	F0RWx6ec6ASVlwDyiDcaL1kE/2lvPjXa5cqhXdI2rMcFwsIk9ytoZIIgBLo2tJgAnlvsfWR1SAyoe
	QmipPNxA8JoSOVgdjxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnM-00000007sCa-2l43;
	Sat, 10 Oct 2026 10:59:16 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFUnF-00000007s1k-0Xzn
	for linux-amlogic@lists.infradead.org;
	Sat, 10 Oct 2026 10:59:10 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4be28b82so456662f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 10 Oct 2026 03:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629947; x=1792234747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlLKyjGQ0AAc4TW5PQo15LeRFFyi9d2wMG56ClxAqWI=;
        b=gzN/qlXBvZ3lXdtAngVixDY9q8vwSOe8gHocgiSbx57P2qAAg2KUAfg+AY/BHljHeJ
         jafe5aGAXW1+nbNJMLbKwjGY4WK3uMVsY6HMyOlGLrUiS8/vXqVI/IxxC6bfQ5BcPNpX
         1g+xsW4jioSofUrnaMF2k5cIk8SQ6KecLbAUhEFber8gNqxFqzKOwj0hTo5TcJD87IFD
         xMLUyvMn/GDlYjlhXMEO7NOZ90Zsyv8Q6rycYBZiAoT/lcLDZYdElW7KRJGeFsCyT+RP
         F5A1zOZNI4Zh/JX0qrneYHHcno8VUIjDYHibqLl9fZxRvmu7U7ev1f4j5D/pEAYEOrMC
         RxRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKvSx4WxB+LpIkcB4yUCVbFQQs7mPDRuMVS0Fb35UoDjxq2nKd8GuxAbXdI2HAxPPFt9uIVGb6cPIsuYfP@lists.infradead.org
X-Gm-Message-State: AFq9FYJikWVXa3Rks2j/5kz6U5uaQ4k8aYQ0mTLucm1+htEtvLpEsUej
	QYZKumlfhMsnppStxWSZCu58i9jQIPkZvrEAjHR65MSGnkwgwPYHrji2
X-Gm-Gg: AYBFou2DdfJZNzDOIvnI/Z1VIG2HeKib4d2+twexEdcI6a4nEVHwKsF7pBTm0lXXw/z
	hJJhFfpqOBoZ9hIS/GTmxlhAC6LHimK1o8UpjlELQKpi6ZRgwqaEeYcWfljU4HVkwLjP3szGa+S
	wrN8xAkN9uTiUmiGkWIifjjEMdzGd4BdMFef6Qnz4P8hq9MlvCL07v38vaTauQ7wNulLC9RlC/E
	6v9ZC/zlZ3gfPYNn9LzKD7hitwLnZe9xvmPwfnLOhXIf/ek7V3wXFF38X33KF9ocYfu52SOT2t5
	lKSmzomV13jwQUzKLCdOvxi1ioz8mGQEF37q3t2yXe3X2S+gHk5oKi2os+3EV6ut7c7iBV+euaH
	fbLzHVoncUNaaoSGz7V94yhQx0X9slGuDMKOpkTF5oDE6TqMINXw3gGwaLGr6GlubX5ZUQKE3oA
	IAeVm/Xsr7Tcb/2KG2xYEfzrXeWFaByaWj6B65XQH+AjnsaOkO0KGvHMsMXvqwTWf18m8Xpmph0
	WwrjfntxDCdUvSrDlCpth1w/KFpOdMCKTk=
X-Received: by 2002:adf:e004:0:20b0:487:88b:4681 with SMTP id ffacd0b85a97d-48dba9db07cmr6245470f8f.10.1791629947476;
        Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:06 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH v3 4/8] net: stmmac: dwmac-meson8b: apply the RGMII delays the T7 way
Date: Sat, 10 Oct 2026 11:58:56 +0100
Message-ID: <20261010105900.247342-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_035909_215384_1EF956A2 
X-CRM114-Status: GOOD (  18.47  )
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

RGMII needs a delay on each of its two clocks. phy-mode says whether
the board provides them with longer traces, and the generic
tx-internal-delay-ps and rx-internal-delay-ps properties say this
controller provides them. Whatever is left is the PHY's job.

The existing code reads phy-mode as naming the chip that adds the
delay, which is the opposite, and it ignores both properties. Changing
it would change every board already relying on it, so the T7 gets a
path of its own and the rest stays as it is.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 103 +++++++++++++-----
 1 file changed, 76 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..1861a0d45b2d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -82,6 +82,7 @@ struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
+	bool mac_applies_dt_delays;
 };
 
 struct meson8b_dwmac {
@@ -272,6 +273,49 @@ static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
 					meson8b_clk_disable_unprepare, clk);
 }
 
+static int meson_dwmac_init_dt_delays(struct meson8b_dwmac *dwmac,
+				      struct plat_stmmacenet_data *plat_dat)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 tx_delay_ps = 0, rx_delay_ps = 0;
+	phy_interface_t phy_mode;
+	bool mac_tx, mac_rx;
+
+	mac_tx = !of_property_read_u32(np, "tx-internal-delay-ps", &tx_delay_ps);
+	mac_rx = !of_property_read_u32(np, "rx-internal-delay-ps", &rx_delay_ps);
+
+	/* one step is a quarter of the RGMII clock period, 2ns at 1Gbit/s */
+	if (tx_delay_ps > 6000 || tx_delay_ps % 2000)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "The RGMII TX delay must be 0, 2000, 4000 or 6000ps\n");
+
+	/* the RX delay line moves in 200ps steps and reaches 3000ps */
+	if (rx_delay_ps > 3000 || rx_delay_ps % 200)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "The RGMII RX delay range is 0..3000ps in 200ps steps\n");
+
+	phy_mode = phy_fix_phy_mode_for_mac_delays(dwmac->phy_mode, mac_tx,
+						   mac_rx);
+	if (phy_mode == PHY_INTERFACE_MODE_NA)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "Cannot provide the delays %s asks for\n",
+				     phy_modes(dwmac->phy_mode));
+
+	plat_dat->phy_interface = phy_mode;
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW,
+				FIELD_PREP(PRG_ETH0_TXDLY_MASK,
+					   tx_delay_ps / 2000));
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   rx_delay_ps / 200));
+
+	return 0;
+}
+
 static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 {
 	u32 tx_dly_config, rx_adj_config, cfg_rxclk_dly, delay_config;
@@ -411,32 +455,34 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
+	if (!dwmac->data->mac_applies_dt_delays) {
+		/* use 2ns as fallback since this value was previously hardcoded */
+		if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
+					 &dwmac->tx_delay_ns))
+			dwmac->tx_delay_ns = 2;
+
+		/* RX delay defaults to 0ps since this is what many boards use */
+		if (of_property_read_u32(pdev->dev.of_node, "rx-internal-delay-ps",
+					 &dwmac->rx_delay_ps)) {
+			if (!of_property_read_u32(pdev->dev.of_node,
+						  "amlogic,rx-delay-ns",
+						  &dwmac->rx_delay_ps))
+				/* convert ns to ps */
+				dwmac->rx_delay_ps *= 1000;
 		}
-	} else {
-		if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
-			dev_err(dwmac->dev,
-				"The only allowed RGMII RX delays values are: 0ps, 2000ps");
-			return -EINVAL;
+
+		if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
+			if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
+				dev_err(dwmac->dev,
+					"The RGMII RX delay range is 0..3000ps in 200ps steps");
+				return -EINVAL;
+			}
+		} else {
+			if (dwmac->rx_delay_ps != 0 && dwmac->rx_delay_ps != 2000) {
+				dev_err(dwmac->dev,
+					"The only allowed RGMII RX delays values are: 0ps, 2000ps");
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -452,7 +498,10 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	if (dwmac->data->mac_applies_dt_delays)
+		ret = meson_dwmac_init_dt_delays(dwmac, plat_dat);
+	else
+		ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -490,8 +539,8 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
-	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
+	.mac_applies_dt_delays = true,
 };
 
 static const struct of_device_id meson8b_dwmac_match[] = {
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
