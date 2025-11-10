Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B9BCCFA1A
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 14:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Csb0fH/lE9MoR87AuT9c+hgmnIkDJ/Ni8Wejp38LZvo=; b=WpSAF0LmL6hu/6
	wglOthWePVyzzTOF8YGHx9CSPqC0ntjd1qlK41vR43hOpO7sKnt20spqU53O1ygOiQGCyEACee7qg
	o5gSU/kxeexAbA1Vu8csN7k4ALZiL6dYgnWc7WpPq3OlsQ0cp8ANp/WE2wLVFXapyFYvl4u/1Q879
	fQRdzTBm8Kc42fA2Pj0eJXVTCPGifoeRf802mPwTtK7XOekxVal+f9N6NRkNgaDMJVv4mAEeNr2TT
	UXQV1NFTjGxDlEXj4E2i1ycZCcJLES6/0K4zCxEsngX65/oGNc3Ht06oAc5Avu1/ZrIuMt2roy3JD
	NUl5J3r3mapQuH/ciJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6g-00000005c8Q-3ZYZ;
	Mon, 10 Nov 2025 14:42:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6e-00000005c5Z-1aW7;
	Mon, 10 Nov 2025 14:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6E9WIaw66PDGRp95eNuxISWu6H2IBhekM5l5DjplXBU=; b=Ha0ghIHWCt1tD7IXbozdnTAqlB
	jcS7tuK6+jqM/x/oO8Xo5dbnVTq1k2VG5RttnZLIdrLKDYhC8xCTLNHINFXzUF0Dsd4Cv9qNAbVN2
	Xxnh469CV7C6tVXD7U1uh1pmKdZ1f8z0XIDG6QDp2dmqn55wYHcpzvPvvEpe/bd0JwHIyaMTqwK/D
	qiXoQ5KinIu6KRSnaqlMLiwQPyIgsPBjJuRnJHMKUrIsSNEvSkG6nnUjuqIGS1P+ZJqeBMoLTV7nK
	CrXAnVUJiwizZR9NgWWbNfrcjeKC3kE960jDGJ77zRB5KTvTMvS2AAE16qsD84Xf+jUX7e5k7Xy6J
	dxOEjfbQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41020 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIT6X-000000001EF-0DHb;
	Mon, 10 Nov 2025 14:42:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIT6W-0000000DpPR-0tby;
	Mon, 10 Nov 2025 14:42:48 +0000
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
Subject: [PATCH net-next v2 2/3] net: stmmac: meson8b: use phy_intf_sel
 directly
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vIT6W-0000000DpPR-0tby@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Nov 2025 14:42:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064256_426950_86EEF73E 
X-CRM114-Status: GOOD (  10.56  )
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

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
