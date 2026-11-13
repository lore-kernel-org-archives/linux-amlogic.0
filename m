Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543A606A332
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dDtv10IJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=TYoBNdcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YBnpLuVTqxDAh8ZdjWl5CO9rx5mOVS0SVjTYmC+rZoY=; b=dDtv10IJcDmetizES16z4BIDJE
	EyoBumd0d+ptqnwzJ4/CYllMfYVxDBT0FHhCqUInogHfdxtLZ04NvVjhvkbYMyxn00iGQy6iQ/vv4
	BCvAV8yzV0xpEmgrCi3NVBqHuxc+GTaOH6ahySx1ZZjLgFm6Gy3acX8VuHE+ViG1bgLIDFbTpYtms
	C9DMbXvPY3HxKMmj7GdElANasMuSu8JTcO5jMxo6YTTkpeQrYgOERuQf0BUQqK4T+Cz9nsLUmuDh8
	OGaT+5JQnWkl8cv3/vUukC5ZckDzCtCqSHcdXQSan5IDJMIxaiUZmnMqaX/yN90Z9lOsrR2l2YBGl
	iSOqm7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFd-0000000ChQr-2Rfp;
	Fri, 13 Nov 2026 12:19:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFJ-0000000ChDX-3sq3
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=; b=TYoBNdcvwVm/hj9NwacunSxgfl
	2pNBXAh99fioO18tIYe5EnRm9aveiE7q2C6+JORL24ScZzftCWuuf4IqbAq17TDYTUoYEjz7CGRWq
	hDagoNwUGAusvxQfdlkRRC49dUOVupeMxhc1JeMhvy+JBAOH80dNy0afIxshCrSRe8ebeekJ8gDxj
	9Fax3l45UCNL8TJoVA1SAyTn4k2lweNJOjwRoD/C0aD+C4844YiZe6OmKOFOEz3zc6MicdbBiWxEO
	iKQsMO13hHKPwFgtZSZZ+jEFM22N+iyV78Aih9s6rqK2iB4aIE1RTpWtPnpJ5WiKHJdpWf9kwE0DR
	VaySnRSQ==;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF8-00000000mHt-3oVM
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:08 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1304574f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572337; x=1795177137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
        b=aiJbPHUNrGlAdIH9zazDWSE4EdBVcj+xcuzD5BR6s11SoRTwI/CWFQG3ZoPvB0suVS
         fnukILzuA+ESp4bgbQV2aiFQNueVfoc/Si4ktagUbfw2muMB2MXR3aCPuIyhTIYh47St
         vDf7bpZ3VeduxTXTxwhnBnAZ6dR6+RLmqIgYfXK2nHifC+XLNK3DXGampQyZSUcD2g4P
         pbxy0PRcHr3i8ax38rk0IPYMswWnLv/SoaQNRoMFzCOZxY/UH1aXRWbe3L1VxO6obfrV
         AJiQRqxHV9h4oie3ECRsPNZKxEbnZh87qyuv3bwv89DI7WK0I+/KxSxMPzRoE8tEKSEn
         4dmw==
X-Forwarded-Encrypted: i=1; AL+hErFkajId2Tmq7ilYHWUV5+9Qv9BavkUB5fB9CTdEa9rhcPE4//NIA2EykyX3o8pQI1h3rUD+oZzeoxD3zEin@lists.infradead.org
X-Gm-Message-State: APuU4Z9spuokQJngsSOm8ziW8xF1agIYALjY6/Dem7OIz8zTXMoHEH4b
	tYAGnkqIroIIxDNwRe1N6JrydmO3BPe9wTSGE/Q2jwMYwOUfe7uY5Khj
X-Gm-Gg: AYBFou0BNNdwYr/pt3O276pTzqAtlMUXAjV0fJcriX+e1R9HarEX86M0mctTE2ADocd
	Leew0rK2H8j0kepffUwopL2a8+cmcmBDdu8wud1mo0JG4ZbiPQIK9HqbljjfKmiLlUETGFBwN6Z
	+pWCtAA3m0AGv+e5v6oF1dpSuwV8IkRNOWw39tKSJlAhheMRbcr4yTKv+tKJrJVOVYd1SUrM93e
	4kRmFZfY2akwOTm9Iw1oXRO8cnieEH6YUWWs+6FWfX0MOvtH1HNAvXDnGf1GCTtjBQIN6yk2DrG
	0SNFFp50pR03RiVk5KACIW+0udXNmdXFHlBuP/wzFpjVTj55E8S55J0AQP3oiq6hu7iHPEXp9VE
	Zemo1UQXjIeVco1I/gqzB+YhVXtalUlbA/Dn6ZbyDRwvLeD3WD6bC6gqR4SjlNtzVBZv0oICbUk
	LqJWOXe6XG7kJpZEmjAz/dEmkNlhzHpaKlYIfv516kN4RTB+aUT0ELklrjFKvQrz341pl4DXsKT
	Pdkn+TIRgX+GVpA1hFtJ3KLUGZeOkvJsn5MfSlUBTZQkJsY/JE2Z47uJPy34GWi7byqP8Q+/Bjz
	GrKEkqu2dCIUpKqE02ySLlwtmqkMu8SoSs8U0ZEKzRBMGsB1Z725jONHO1Z1RjUs32skOKNSFjC
	qCm3XOc9q3Flf3r7wiwKdtSxB
X-Received: by 2002:a05:6000:29ce:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-49c70ed9029mr3869206f8f.9.1794572337361;
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Fri, 13 Nov 2026 12:18:49 +0000
Message-ID: <20261113121852.334604-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121859_050422_F68360BE 
X-CRM114-Status: GOOD (  16.13  )
X-Spam-Score: -0.8 (/)
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
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index ad30730db57f..d8c23b280b59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
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
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
