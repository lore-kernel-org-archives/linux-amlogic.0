Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE3ACCF9F8
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 14:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7hDALG8thzXoGeYypLbeScdjx8KbsQJN8nJf/g7M/o=; b=afBw3hXVk/XXRm
	zoAmiArCPoqqMUz10M82o/q9m7Z5Qj/VATd4V8ovbG2CKBwNUT8gSpTsnYPdMzGM7RFteRjsErbk7
	EMShDpJZ9+e9c85f3cyMDtByUShw0lys5mdVQxuKRMA9ePvfwUQ2a3OxOFlVqj5rkyPdjBMnEPsbn
	Bdlv36FlijwLfqL1edsgkA1yxXjw3NCS3UlTmy+gCw7JXc+Eaif9b0W8i4PZNOyfdBvkADcF4FwI0
	t4jh+l25k4iV5xseokv6JxtWU/yJEQ9UyfGK4Y/2u4MxU2N76WBsfSNF08aBYZn6Dt9Ig0mfrzL9u
	oPtRa4zxewhPHNwYZDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNSW-0000000HURQ-0wFX;
	Fri, 07 Nov 2025 14:29:00 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHNSU-0000000HULs-1Vhl;
	Fri, 07 Nov 2025 14:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=85Jbq2TMyjp//ir32iMggvHsmI3Fb24s322nxxYV6Nc=; b=endjxMR/0ZEliwKzqbqjEt/zbg
	n1x03XPjy4JiRDb/3oFVXZn7qbqJsjLYAsgtCbOE/Ly+x2lrSsqtdodqtsgfoJvku3A7iInxUwNoF
	y5YqbAy0jyIKL0MRkRKTK8cOhi8iJzrXks3ixAbkyWRWO1gV4WaoZsoWVjdEhEN6s+D3rMSxxeR7K
	k7uPbW8bg5ZIw9zj7uKBjzS7nwB+pn55TTQb8tuRSt88tJLjM8tOgxxcpghSX9I7/ZCPY6XR7bKjx
	bH57FhuEmzlM3th40BKeZMjkTiBPl3jf9wd472H1/L2ewVE1cWN7PCa1bOXS8nElQkBZg3MumyTOq
	66OLnRtA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56072 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSE-000000006hF-3DEv;
	Fri, 07 Nov 2025 14:28:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSB-0000000DkSb-3fWL;
	Fri, 07 Nov 2025 14:28:39 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 08/16] net: stmmac: meson8b: use phy_intf_sel
 directly
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_062858_417053_89BAB430 
X-CRM114-Status: GOOD (  10.36  )
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

Rearrange meson_axg_set_phy_mode() to use phy_intf_sel directly,
converting it to the register field for meson8b_dwmac_mask_bits().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index f485b9b858bf..865cd6166134 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -26,8 +26,6 @@
 #define PRG_ETH0_RGMII_MODE		BIT(0)
 
 #define PRG_ETH0_EXT_PHY_MODE_MASK	GENMASK(2, 0)
-#define PRG_ETH0_EXT_RGMII_MODE		PHY_INTF_SEL_RGMII
-#define PRG_ETH0_EXT_RMII_MODE		PHY_INTF_SEL_RMII
 
 /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
@@ -238,21 +236,19 @@ static int meson8b_set_phy_mode(struct meson8b_dwmac *dwmac)
 
 static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 {
+	int phy_intf_sel;
+
 	switch (dwmac->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 		/* enable RGMII mode */
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
-					PRG_ETH0_EXT_PHY_MODE_MASK,
-					PRG_ETH0_EXT_RGMII_MODE);
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
 		/* disable RGMII mode -> enables RMII mode */
-		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0,
-					PRG_ETH0_EXT_PHY_MODE_MASK,
-					PRG_ETH0_EXT_RMII_MODE);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	default:
 		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
@@ -260,6 +256,10 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 		return -EINVAL;
 	}
 
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_EXT_PHY_MODE_MASK,
+				FIELD_PREP(PRG_ETH0_EXT_PHY_MODE_MASK,
+					   phy_intf_sel));
+
 	return 0;
 }
 
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
