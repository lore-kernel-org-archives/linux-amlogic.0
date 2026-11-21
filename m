Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA8C606A682
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F7Pu5/kr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tcFfaOOKBICygOg8vAIMVWAI2aznCw7J8CPfTtzhOfQ=; b=F7Pu5/kr5xwHruwyjlFkpJyRlc
	oj95siBZTbROWHDQfiW4M/tkSQfK1PDxRC8AvHQL5gz3JclATlAfGUpCxzE54x/i4uUo9qC9zcgFd
	VLbZOYM6C1ztWezJHSmRxxyVLyqyxezNscX+oWV1HP3rmtYWUWRg7vf9tJ74YL3aFTxITJkO/Uoxw
	zItuYLyzcuPFGA1CgoCDNe+B+vRSkOLOevzi9vvZhFaJDZSjIXqSg77OadtwQpd89OVdg5on9t9Ei
	BAdaBqZeAhYaCw0nIs78saSLnnYffNzjjjM5HQQTCl7WAGmtaZof95u2YfANzHWFZwfnMoY6c5Wya
	/EqFueCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsg0-00000000Las-2l05;
	Sat, 21 Nov 2026 21:31:16 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfu-00000000LUP-1uKX
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:11 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490f38e9688so1461452f8f.0
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:31:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296668; x=1795901468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=SoD+vjVEZ1gdn2rwDOkqrLb2oGLqCKl26fqNitxAJxV8rMlvlxS0muB+WJYqgex9av
         Yb0z1QpA9rJhMUBKimGWL4RHRdtxbPclwdgqEXbS6aOuyYu6s/IW1TrSQn8EFJG9iybD
         orlq2Mcn9l8VnMxfgDkoN4C901qZS5eNoAGknlgogGFb6e72utobwwdmecDy8eBh4Gcf
         uwLvpT1eIXRSfOMVLYiApzLAGPkL3qTbw04ESf0Zz9m3Px8z6ArCZ9K+wrylo/YdFm27
         CD56CaaMNnA/BkzcA6IdWfKAxO+vZK1Im7bT6EZOqR5dLZzQiQToS00S61FmQNQKt5vQ
         Areg==
X-Forwarded-Encrypted: i=1; AL+hErH6PaMEerWd2eIPFidfEV027TrBtL0I+/AIS8/1ujldgvMy2RQv+IaHS83beZnAUVm4Sq2PtyYbc14QX2Ip@lists.infradead.org
X-Gm-Message-State: APuU4Z96yLfWcsr6KjgHWQyuBHl5mDPEUXxZPg/4Zl8tFMVna71ANK3B
	9bEOXhrWB2FFxQvMb6BU7NxAmBLoKlHd0jFpN4/RXscctMtwMGLCmMwL
X-Gm-Gg: AZFdTZcp5DmEAQPlh5vayGR6/MxfJZIysNhB8WZjyw0bxteOaoltZdiRsaScAA6g34T
	LfQH8fZvbAowpLJTWh88Uul6HoPQ3nPpLfqOfdsWG17SbHNnAa/u5jofoTHSK/Syt+8pmgVHpjd
	i+/6f8gEHHo0ta+qRfIARrvPHptqcafUfxo6FAN62mR1HsEGmWYpQkdY+qL6IzKQVkF9qgv6QwH
	t1ivPWxaq8CEUSPZdiPuB+q+4RBmVDHmR3J/w0t1rpPUec1WH6xLiiC/FqzlN5AkJc8BxQON5WC
	WKbESAeUWly3HQsMPIGYv2GAPn4hps34D7BykMnvPQ+iPHpjI94m0MO036zO1745vm3SDheEgHM
	vIHANspRcx55Z1pwSWfu4FIgZCArUwJmO97TsnVuHeWUpwcsVVFtVarVfuexKWY9bddns+eAuAy
	4EETxEQTBlwtvOlce14hlkJlzQhASO0Rx3k40nzkDkwYrBVVIIXOUpM7rG/oh77aNLr+vPpoxLb
	mykMsx/6Z61uWNUkgF5N7yaBYp5dL0YQC+dDNjPB8B9Ha83PGJMsYSfAs+KlNQku/CoqbgClkZS
	hLkAK6Y2ZuTDz4gcfFdXpvFhEutK4vy1I7EopR0Y4/Ww+uT4d7lFUVlST1wXUB4ha7kUj5iwJdp
	oNtx7J4ApbU67Furn13yhNpM=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr22665106f8f.26.1795296668557;
        Sat, 21 Nov 2026 13:31:08 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:07 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 21 Nov 2026 21:31:00 +0000
Message-ID: <20261121213102.143130-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133110_519746_604FF331 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
