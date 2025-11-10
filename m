Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569DDCCFA13
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Nov 2025 14:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tYcAvWS1zd3gfy8gauG1tyoER77qEpZB1HvswduJnU=; b=ZRnzrQvbK6MTlU
	giYpLttDoUdcl8tIus6cXqnH8dZhj486/fiTb8bqWsCyprBpE7adp+8ViFE0QWgFQix0/rjYMbee7
	GQVXM9FGAepnlCl4NQQV+ZgBLFAhY53vPT4Mz6pC/+MeQI4ELJONX06XbRTSEQ/cMeequ48jaC4od
	5lkZ6TwdV494jhyBgyZTue6p87+zb2LxEXZixydIIsoXYEAGQx8odtsjI8Uc1dZjgBQVxm59tvhpt
	/OtwVwqgn/STJHrW/XA81B8SHDNbObAIGcG2KJRNrBhKCFkZh2eftGYwLEib9jowcVms54m3PUivw
	GAzsScm3bNpbe5MU07Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6d-00000005c5s-168p;
	Mon, 10 Nov 2025 14:42:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT6a-00000005c2g-2Ndy;
	Mon, 10 Nov 2025 14:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XxTA5lj/34tgs14xIyPSsw7Yd+/MJCOvnB8dJChQ8hs=; b=rMcU8eVqSFWnuPLOZW7rNlSDb1
	WxdZwRhu+wh6BVV3d7UCtA19xtRypVXxqm93eATa3CYDnrZA/79YYjPS1wUtiFTNTusRHR9XCtafN
	wQlLbJtrvaBNcJfT4MUqNosNMt33OalgMX7w3h2qPJv5I64l05xSzUO0PBjG3Vs+vTJAQ5UUNgWvc
	HaxP9JXftc5EUT6godrV0sID134dj3eSGQMzYIBMSwvbYZAexvNFB19jtAQKBA6z7+KGdl9cIufrm
	DZ5+N+4G8SdfYR/foRZznlwUQjbQUevhwqgy2rLMyma5Su3cDth2Mtg9FDrjVB4cfRQ/bWKKZlJAZ
	zkZl2y0w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41336 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIT6R-000000001E0-3yi8;
	Mon, 10 Nov 2025 14:42:43 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIT6R-0000000DpPL-0Nli;
	Mon, 10 Nov 2025 14:42:43 +0000
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
Subject: [PATCH net-next v2 1/3] net: stmmac: meson8b: use PHY_INTF_SEL_x
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vIT6R-0000000DpPL-0Nli@rmk-PC.armlinux.org.uk>
Date: Mon, 10 Nov 2025 14:42:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064252_611005_8DC16B02 
X-CRM114-Status: UNSURE (   8.31  )
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

Use PHY_INTF_SEL_x definitions for phy_intf_sel bitfield.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index a50782994b97..f485b9b858bf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -26,8 +26,8 @@
 #define PRG_ETH0_RGMII_MODE		BIT(0)
 
 #define PRG_ETH0_EXT_PHY_MODE_MASK	GENMASK(2, 0)
-#define PRG_ETH0_EXT_RGMII_MODE		1
-#define PRG_ETH0_EXT_RMII_MODE		4
+#define PRG_ETH0_EXT_RGMII_MODE		PHY_INTF_SEL_RGMII
+#define PRG_ETH0_EXT_RMII_MODE		PHY_INTF_SEL_RMII
 
 /* mux to choose between fclk_div2 (bit unset) and mpll2 (bit set) */
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
