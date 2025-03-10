Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A49C28B2E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Mar 2025 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLkxXr1fJTj2GQ/WwXMXUkhunEFLoiS6nxZKupmtiRU=; b=dQPCaJKdjhJp1h
	iis2vEsEMFoDdeWioo0DkCuSlN/uUQ2ZZoqEa1GRvOsn9KozcIgc0gORQ2H0t/qy53QZNLJaAvtHR
	6zbjcl4JsNoGSHPmJyCw2BEFZEX8UkJ3VrsIoxrz8Ek+kUAzDAbNc69AJ4dn6tlK4YSn8m+a//8nb
	1N9Lpa+Alx79UUQ36zes5+o5RlshlBHXPuBbe3Pxl8M6oCU1k1/5Yzco6ol/D7k3UA+q3yPiiGHgx
	aivRTasmiAq+ZgowtTYFB1KS4cxUCiSb593cAOeAFPj9Y4j3N+/+2PLIEUt6BJnd6/LdqYsEPIuvP
	qU+INYP3E/jMNuQULOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trc7I-00000002aSU-3Dzc;
	Mon, 10 Mar 2025 12:20:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbyK-00000002Y69-3UpN;
	Mon, 10 Mar 2025 12:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yzZe1gV6CHm+hAifr5i33tZFqQ6giFyv3lN1GIZuF9M=; b=Z1RyWBPbYpVSmho+mXWzi6iJaA
	CNh2NaTUMZvLuxbbSeJ29xlqBLX+n7gG/ImOrqRlvLV++R1fVlGx9Yo7EQkHQkPCSUA5aqrTWF4KO
	ai89LWlgj4o5LQSChjxU1IcW2MhZJnwKWN/lqbPLYWqpqujiOJYoA+6RuBchlRAMpIgtt1txSOTTE
	Qe/wXeft3MB3TwbG8Uen5/45dF6QG8zd8SGeWdRGl0HiCGt+NgPDJRlKGSQZYemE9XgD+XknA/0wi
	lh7wD5mBDAhEHQUZK5qXQG0qXjTJhn5DRbW182NfBlEJjzME89u8c2uCSnXQ+0LYmGcFOi4K/gjnq
	3cXF+AcA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40488 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1trby6-0002YW-0z;
	Mon, 10 Mar 2025 12:10:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1trbxk-005qYA-Up; Mon, 10 Mar 2025 12:10:28 +0000
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/9] net: stmmac: remove of_get_phy_mode()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1trbxk-005qYA-Up@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Mar 2025 12:10:28 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_051104_869027_626C58FC 
X-CRM114-Status: GOOD (  12.59  )
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

devm_stmmac_probe_config_dt() already gets the PHY mode from firmware,
which is stored in plat_dat->phy_interface. Therefore, we don't need to
get it in platform code.

Rearrange the initialisation order so we can pass plat_dat into
anarion_config_dt(), thereby providing plat_dat->phy_interface as
necessary there.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-anarion.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
index ef99ef3f1ab4..fe47a5c337f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
@@ -59,7 +59,9 @@ static void anarion_gmac_exit(struct platform_device *pdev, void *priv)
 	gmac_write_reg(gmac, GMAC_RESET_CONTROL_REG, 1);
 }
 
-static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
+static struct anarion_gmac *
+anarion_config_dt(struct platform_device *pdev,
+		  struct plat_stmmacenet_data *plat_dat)
 {
 	struct anarion_gmac *gmac;
 	phy_interface_t phy_mode;
@@ -79,11 +81,7 @@ static struct anarion_gmac *anarion_config_dt(struct platform_device *pdev)
 
 	gmac->ctl_block = ctl_block;
 
-	err = of_get_phy_mode(pdev->dev.of_node, &phy_mode);
-	if (err)
-		return ERR_PTR(err);
-
-	switch (phy_mode) {
+	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_RGMII:
 		fallthrough;
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -111,14 +109,14 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	gmac = anarion_config_dt(pdev);
-	if (IS_ERR(gmac))
-		return PTR_ERR(gmac);
-
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
+	gmac = anarion_config_dt(pdev, plat_dat);
+	if (IS_ERR(gmac))
+		return PTR_ERR(gmac);
+
 	plat_dat->init = anarion_gmac_init;
 	plat_dat->exit = anarion_gmac_exit;
 	anarion_gmac_init(pdev, gmac);
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
