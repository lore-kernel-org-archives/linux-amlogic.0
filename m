Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3EECA6009
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkcjWstrMklPkq/vooQQRMPlVXIKrwPk+mUp+MyxR4o=; b=z1AKWFt/nlsLtG
	YYhH8gHrWti0P6Jrqryg4j2Bc8r+38ezWoWebXGwVz5Yx8dobenul6dRdV9av+Fz1zrw5ZIk7nEx7
	YFVDtbrW/DAVpKcukL8MXMcjsSozxE6d6g2G31ZemPalASWPJSPhdkosnfUTwpj1AEy+ebz5uQC3b
	4qzA4so59Y5Nui4cfBI7Hkb5F2HExPSPiGZ29/zysrANBltCbINQI7+4mrD2A31cLnGjLxkTIrbWr
	VS7QaXwVOcVfH4RcqlmqGvXYTWp00jKicuFscDoBZKDa3zKWAP+j5MOLwrWtVs8iHp0rT0gvmn49K
	Aw1W8fyNkmlJlC2H/lFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wTN-40j5;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyu-00000001wOp-0Ckg
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso890256f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361590; x=1791966390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQePSOktcZsNwbFN9JzDoxNSE7kDsX9flymDNSHZKFQ=;
        b=O0so5qN2oBGbYyQRcvkfKPZSZNVHPVNvzv2db6n/GmgIU0sXvtmcUjmE9Z/aKSVc53
         TEVrmiQWYNshx6gdBHC2l9t1h1tnlo8flkM7dMsaPliM7kWFr4Re1ZjP5QP4VYORDffO
         klSceHEAsWQbpSrW7wgdSXDx0MK6ZcNZwvUIeZ4EW7dWVA9u9NsOIkgRcORBnIc39fV/
         oZT9SZvrQAF+XkpTudh/qwEat6tLdwS9dcX94z4HTAzv3Hzi6e/BM6QYJIeszmDpq7dL
         AP2BKK0Xa42EYZuCUvnBnUix0YtJdwzhJwuV5qMpopk8cwnAnulHiZSpK/6pXqoHkXF/
         pmQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwL500/uh3KJUrPDoApNe2rxze7ky7jCrnkHKYj8FhM1nE1XVD/GvZfmTEwFBmaMjhpswIC+/8aSOvLeRCX@lists.infradead.org
X-Gm-Message-State: AFq9FYIhk0QOzcbyxjk7l8dYOlFFNAa7fwkb1EJ87fe9oKrJas/vHU6S
	ZWv92vsnqiOIVK6ECtYC0UUK3g2FVeoCsg4PAIASt03LC+2y7rsY/rNF
X-Gm-Gg: AYBFou1RT/saDQOBbSjdyOse/+H3lH4qP5dHFTh7EBjE/tO99NkSMr7pF+upyGkLKjG
	tPWoyThXiGWBJEP/pkntM4tAs8mGwyg50YUbIsTJpN8MthZ0uqvtN567uqKPstWIzWRrxpF+lkT
	a19TcrxUpZ8/kmOW1cZu/KxllgC+2eY9PO1ykPPWbT8iPm3lm3rq1gFWkJY4x5n3zpRwBGZZfgq
	kSB4nzEKbGMP+lhrGkznrJk1e1I3VL/E8Dp6y4VysjhgB4D1qr5mkJ8iNtomVaz8tUbkxxiydF9
	5TUKckNowkwNLxgQ+DwdRsvOm3oteH/n0FbZQmVptS2Oq01fXGPnP+kRWShaNXR4iSU2vX9lz2+
	N2p6eQQ2MryYHmxrt3l/bpRf4nzucTcCPsoD6Rd37w0Q9UwsthEAFnvuqPZ3Oir+e2FgWsEhpGa
	q/Mdr+CcupWoYVVMNN/t2+IE373pL0opXE+VYO18EptGq+2At2wIohGm/t7gqUZzFzob27M7QcT
	PYBodXxcyKFGSR2J/AJA1g+erYdyPkOOpr5
X-Received: by 2002:a5d:5f92:0:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48c7289c820mr3137268f8f.47.1791361589960;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
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
Subject: [RFC PATCH v2 1/7] net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
Date: Wed,  7 Oct 2026 09:26:21 +0100
Message-ID: <20261007082627.63807-2-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012632_284435_BB04F4FB 
X-CRM114-Status: GOOD (  21.69  )
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

RGMII needs a delay on each of its two clocks. A board can get it from
the length of its tracks, from the PHY, or from the controller.
"rgmii-id" in the device tree says the delay is added inside the chips
but not which chip adds it, and the generic tx-internal-delay-ps and
rx-internal-delay-ps properties name the controller.

This driver ignored those properties. In the "-id" modes it switched
its own delays off and left the whole job to the PHY, so a board that
asks the controller for one of them does not get it, and a board whose
PHY cannot supply that delay has no usable link at all.

Boards not using those properties behave as before.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..d73dfd0ac167 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -92,6 +92,8 @@ struct meson8b_dwmac {
 	struct clk			*rgmii_tx_clk;
 	u32				tx_delay_ns;
 	u32				rx_delay_ps;
+	bool				mac_tx_delay;
+	bool				mac_rx_delay;
 	struct clk			*timing_adj_clk;
 };
 
@@ -299,6 +301,22 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 		delay_config = rx_adj_config;
 		break;
 	case PHY_INTERFACE_MODE_RGMII_ID:
+		/*
+		 * "rgmii-id" only says the delays are internal, not which
+		 * side applies them. The *-internal-delay-ps properties say
+		 * it is this controller, so leave ours switched on.
+		 */
+		if (dwmac->mac_tx_delay || dwmac->mac_rx_delay) {
+			delay_config = 0;
+			if (dwmac->mac_tx_delay)
+				delay_config |= tx_dly_config;
+			if (dwmac->mac_rx_delay)
+				delay_config |= rx_adj_config;
+			else
+				cfg_rxclk_dly = 0;
+			break;
+		}
+		fallthrough;
 	case PHY_INTERFACE_MODE_RMII:
 		delay_config = 0;
 		cfg_rxclk_dly = 0;
@@ -384,6 +402,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	u32 tx_delay_ps;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -409,9 +428,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = plat_dat->phy_interface;
 
+	/* the generic property is preferred over the vendor one */
+	if (!of_property_read_u32(pdev->dev.of_node, "tx-internal-delay-ps",
+				  &tx_delay_ps))
+		dwmac->tx_delay_ns = tx_delay_ps / 1000;
 	/* use 2ns as fallback since this value was previously hardcoded */
-	if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
-				 &dwmac->tx_delay_ns))
+	else if (of_property_read_u32(pdev->dev.of_node, "amlogic,tx-delay-ns",
+				      &dwmac->tx_delay_ns))
 		dwmac->tx_delay_ns = 2;
 
 	/* RX delay defaults to 0ps since this is what many boards use */
@@ -424,6 +447,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 			dwmac->rx_delay_ps *= 1000;
 	}
 
+	/*
+	 * Each property names one clock this controller delays itself. The
+	 * PHY must be asked for whatever is left, or the two would delay the
+	 * same clock and push it past the window.
+	 */
+	dwmac->mac_tx_delay = of_property_present(pdev->dev.of_node,
+						  "tx-internal-delay-ps");
+	dwmac->mac_rx_delay = of_property_present(pdev->dev.of_node,
+						  "rx-internal-delay-ps");
+
+	if (dwmac->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		if (dwmac->mac_tx_delay && dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
+		else if (dwmac->mac_tx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_RXID;
+		else if (dwmac->mac_rx_delay)
+			plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
+	}
+
 	if (dwmac->data->has_prg_eth1_rgmii_rx_delay) {
 		if (dwmac->rx_delay_ps > 3000 || dwmac->rx_delay_ps % 200) {
 			dev_err(dwmac->dev,
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
