Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6379FCCFA13
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 14:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNBnWdli8AIiBuQu09sLVgi6rmkOp6feleSxY4Hojyk=; b=jzZZjvtdkBiZJv
	P2PAL51jL4jWDPt9jdV5rJP7tsa4MknSqUiLXUfrFeu9C9Kzhz8r3h2/swt/vs+ZhjdR7TNtUSwxv
	S3h8qzAaR48m0cquPumysqsd/gj5rCF1BeRwm2EmD5Uz2yAh5kR1ulCE7g/4mWVhxMRFgw7bVq7/K
	dyE0wyMVHotV9iiggnErSxhGHHtQhNvkq/09TCZLpSe5ffxIZ67WoYv378VCO/Dx5KLiMpHXg4PNm
	DENWgW9D5c2qnIF6sfnGTIDpPku0W3O0+A0Xd90ahrbw764hqXT62Tno9qlPv5tjHlZkAefybzVpd
	eo2aZDd0H6V3opngEBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6p-00000005cEj-1lIS;
	Mon, 10 Nov 2025 14:43:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6l-00000005cBD-2zVR;
	Mon, 10 Nov 2025 14:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3CWXVBhOiA+tRvKyE+/GGXUPBWvE2q22xR+ZQCaN5h4=; b=vEvs389teh52/YLlwapr+eFGbh
	YuUw1usZIlOM1GPy58FgHHlEQtKt2gb16aeU8f64kgwh3pXr7uSut0pbN/nzgvnwt+mQsP2D4MrhO
	8CFRuwSB0QyXyC1qhkmaEt1LCNinruhztYD2fatvjD451MH3GIVNsGi3vsTqrBOS/VSPaJlQM+/GA
	1tKShjcbUBH5O+YT8qBIrkoWfTpwh6JNpR9Kej1hdlpoQaP0pR8WaX2yUbPzQAvfCPikBWpBYb6cj
	WARnywcYiXoT2U7y0wn0wRamh2c1cWMHp5y4ub5kJ5r6LzKxN3jxfqWN52vdOJsgVM5uAb2Jve/yC
	jvpQz4Sw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41032 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIT6c-000000001Eb-3hIR;
	Mon, 10 Nov 2025 14:42:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIT6b-0000000DpPX-1LQ0;
	Mon, 10 Nov 2025 14:42:53 +0000
In-Reply-To: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
References: <aRH50uVDX4_9O5ZU@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: meson8b: use
 stmmac_get_phy_intf_sel()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vIT6b-0000000DpPX-1LQ0@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Nov 2025 14:42:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064303_762195_8877C635 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c    | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 865cd6166134..e4d5c41294f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -238,22 +238,12 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 {
 	int phy_intf_sel;
 
-	switch (dwmac->phy_mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		/* enable RGMII mode */
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		/* disable RGMII mode -> enables RMII mode */
-		phy_intf_sel = PHY_INTF_SEL_RMII;
-		break;
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(dwmac->phy_mode);
+	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
 			phy_modes(dwmac->phy_mode));
-		return -EINVAL;
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 	}
 
 	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_EXT_PHY_MODE_MASK,
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
