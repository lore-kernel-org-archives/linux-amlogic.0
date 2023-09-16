Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B259ECD37B6
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Sep 2023 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmmZcEBa61VnpBH7AQ++T9VkOyZuaurGiZYo2saUKTM=; b=KGETVNwiDjDZsw
	PXMIy5YqGa63TuQGvwoLs3jYzqKGirpQNXEyyHTLdhM5QAIjeIoV3HEF2kfKDTiFQIpjVTOeaEF5q
	mm/2tTMxaMRpooc+TbCIUQQqGc0sDtvKdOLmR0NMp9LYaZXFYHYZztwyPnYaveATdtwlklvLX2Tgg
	CA0RW8A9oixfM8sWXucJeSpSPYfdJRBDZjgiDOdlr5+qrCuvxH3WNozcGTGub24bajOM3ZR1eUASH
	E4iwYeTjepj2BsVHfxDxCEUhf5db/FLnr0DXupD+3VX/1gGIWC9NG5uD3h9L9pfWmyTDQtlo1Vf99
	/irUwfslBTDLlBmC0b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOv-00C990-2C;
	Sat, 16 Sep 2023 08:11:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOs-00C95m-1A;
	Sat, 16 Sep 2023 08:11:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7DBB5CE2BD0;
	Sat, 16 Sep 2023 08:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6093C433C8;
	Sat, 16 Sep 2023 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851889;
	bh=08rPVmjgSTC5liiFw2rBYcil6Ema5CtgYx2svnPVZ9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RJ+Cti+Eoi31M9upPtCd/V3Dy9zjfLqjLJ8ymW2fPjh3cBGsvwyt3foSM3X2Lvzly
	 F176DdkyuaiJyVeZ8YbAR9fPZtBC0kNTQ3dXyJaWzx++9eQwalLawksMYzretBdns7
	 A5NDFD6A0e2Mhjok6m03ntOhIVBzkChFkTqJNmkf0RYPtkGQkRqRwoXkpJClV/Bjo7
	 m4mSN5aTce7zZzV5AaeZl9qkegCjOlLbzr62jtcNwF+E4IwcquAbtF6VSGdcrGf6PB
	 ZZbseIbpKwKyV7+hg0Vs4UZ3QNHsXgvxZ49SfUAizzvgEDd8J7182hfOT3CTScLsS8
	 4OqTv6K7FtJxg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 08/23] net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:14 +0800
Message-Id: <20230916075829.1560-9-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011134_757986_678D2BE3 
X-CRM114-Status: GOOD (  15.35  )
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

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

The remove_new() callback now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 29 ++++++-------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 9b0200749109..a9916fd07616 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -384,22 +384,20 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	if (val)
 		return val;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
-	if (!gmac) {
-		err = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!gmac)
+		return -ENOMEM;
 
 	gmac->pdev = pdev;
 
 	err = ipq806x_gmac_of_parse(gmac);
 	if (err) {
 		dev_err(dev, "device tree parsing error\n");
-		goto err_remove_config_dt;
+		return err;
 	}
 
 	regmap_write(gmac->qsgmii_csr, QSGMII_PCS_CAL_LCKDT_CTL,
@@ -459,11 +457,11 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	if (gmac->phy_mode == PHY_INTERFACE_MODE_SGMII) {
 		err = ipq806x_gmac_configure_qsgmii_params(gmac);
 		if (err)
-			goto err_remove_config_dt;
+			return err;
 
 		err = ipq806x_gmac_configure_qsgmii_pcs_speed(gmac);
 		if (err)
-			goto err_remove_config_dt;
+			return err;
 	}
 
 	plat_dat->has_gmac = true;
@@ -473,21 +471,12 @@ static int ipq806x_gmac_probe(struct platform_device *pdev)
 	plat_dat->tx_fifo_size = 8192;
 	plat_dat->rx_fifo_size = 8192;
 
-	err = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-	if (err)
-		goto err_remove_config_dt;
-
-	return 0;
+	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 
 err_unsupported_phy:
 	dev_err(&pdev->dev, "Unsupported PHY mode: \"%s\"\n",
 		phy_modes(gmac->phy_mode));
-	err = -EINVAL;
-
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return err;
+	return -EINVAL;
 }
 
 static const struct of_device_id ipq806x_gmac_dwmac_match[] = {
@@ -498,7 +487,7 @@ MODULE_DEVICE_TABLE(of, ipq806x_gmac_dwmac_match);
 
 static struct platform_driver ipq806x_gmac_dwmac_driver = {
 	.probe = ipq806x_gmac_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name		= "ipq806x-gmac-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
