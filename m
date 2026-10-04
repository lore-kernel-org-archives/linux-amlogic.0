Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2107CA5FFA
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cyr/Ki1kJwFji/BHjHZJHdVTeBFL7ZJ1QJHpwetsHSc=; b=Js1kMlxIwbm4Cq
	p1cfKBwIwhaS4t3Id7ORFrvKHhRGy9empjoEXSkiiwS5t+xcCCZ53mTedTm7/iKUwomToJ5GmwNKa
	IPmz9j1q5JtQ1lVWIpnpFxuVoekIHtzXfhIzXv9Vjr/SOuQnna24EuJeUmGwvt2kn3ElrXtQxMGGX
	brtfa54TTeNICnAaz6zdOHsAR18M7DJ0wF7Jf3gRzAb+rrUQ+hcTtL/h7cktDOENmWsYIpX8+H92m
	ZVpTa6c9My/2ktM7oEhyRPnZjMft3pykXezFTR6a8dg+9Bxox66YfnFc1zrPr60PX0thtpTgooXtz
	kO4D97D/wthRYBfPw/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOd-0000000EvN3-1FlE;
	Sun, 04 Oct 2026 14:40:59 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOa-0000000EvFx-16Wh
	for linux-amlogic@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:57 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso6970525e9.3
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Oct 2026 07:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124854; x=1791729654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZRgdojaRbZiMOWyCy78Vo+uAB8tMtaxuR0FMlqF6Sc=;
        b=GPTdPZsMHlprBNut12+lJ62myTZMBoNf6qFI6avIhaeCKxO/orSc92TMD+iJ1vYP9+
         AbglIpVPYdW00eEHznbNztBuPn5eaW5+NX0eSlINNb7x5v7ZzmqsbQ/DSuuXR5YTnqAs
         fqJ6cU9sSeARjuPqec7fbCG9/pJEqjyb00YbFEk/70xTKmLNlccV2SFT3SNhVmEObJ6o
         6gYhnmRAkRRd0PPmfWGNeGoclMInk8W8WKyx9HOVeYag8/RvKwKUqb1ETvYNsTuQQii2
         EW7EprsvW2dHYuh2raVy5SsgjN03S1CJrnxv5u6nEI+nE9I5U7IExpesbhrBhSAzHdjY
         EEDA==
X-Forwarded-Encrypted: i=1; AKwUvBxS3tVtH2BAGHP+hqkMcRoR/3tYgmXLY5hwW6NqpHx4NIZPbTpYxbLudmR6xETumOGprwAb1FM702evyPud@lists.infradead.org
X-Gm-Message-State: AFuF++kVUS5elWcLwyM90N7t0Fs5dSVaFyyNSj8P1Q/Vzxo6UwzzkBbT
	+gYetbpvV4V3os4wAtWh5ieAT/cYopojEvMOI2hs6thgBm+zqzCBD3yF
X-Gm-Gg: AYBFou0ULi13C7iuPVNGkJrcEm83q7KIVzdmSK7zsQbDlMfxllhtlyxGu7YpV7qes/N
	OHHW27Hhx8sjMF2Vdh65zRWmPDfJOpOMtsCcEl8esC0FwJDQ5m6jMJwqKziZDtbPeTRG7F2iizU
	YoSL5UkdOx0ADTlMVJqYJ0+z/6xop9ofcvJmuAVXmL3NnrtzEUIHaSLbxNijmD5k8+FA8iXAbr3
	Yn0FlsU9achvCgwXgj8Bc/8u95+GCIaBqn/mIrFSiDd3BvH3gH6r3jd2HHqXJft446qwgJQRFdt
	6TUiNRRPOhPMqWb+IFv50Bqj3za9lXkeM1gU3LYN3I6aEb2CImOQyNI/tg9YJwydD0yibQgZc/C
	2BFZfiO/njvRp8XlHUQ852dVlK6kYh+VO507UeW24dFo6vMp9gfPIRxFsp9QxrpDWojOHs9j+iZ
	7GH/9tnJbeHoxZ2YwbtkA+QdiShgOdt+D/EPS8kp83B0h0q1LpFZnewx0dI6+0EyGzwOTTrrtUo
	e+R/6dXtsttq2JvaRGRY9+JoUFhRWyCQQ==
X-Received: by 2002:a05:600c:8b30:b0:4a0:2644:80db with SMTP id 5b1f17b1804b1-4a0276c0b12mr117321955e9.35.1791124854357;
        Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 5/6] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sun,  4 Oct 2026 15:40:45 +0100
Message-ID: <20261004144046.391444-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074056_357041_FB6F1D72 
X-CRM114-Status: GOOD (  13.98  )
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

The SoC pairs a Synopsys gigabit MAC with a small block of glue
registers that selects the interface type and trims the clock timing,
and with a multiplexer that points the management bus at either the
on-chip 100M PHY or the external pins. None of it was described, so the
port could not be used at all.

Add the controller and the multiplexer. The MAC reports a 5.10a core.
The path the controller reaches memory over runs through a pipeline
stage with a gate of its own, so hand that to the controller as well;
nothing else claims it and it would otherwise be switched off as unused,
leaving the port unable to complete a transfer.

The on-chip PHY behind the second port of the multiplexer is described
the way the G12A does it. No board in tree uses it and that path is
untested.

The controller is left disabled for boards to enable.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 57 +++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..140f1836f3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac",
+				     "snps,dwmac-5.10a",
+				     "snps,dwmac";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline";
+			power-domains = <&pwrc PWRC_T7_ETH_ID>;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <2048>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		apb4: bus@fe000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xfe000000 0x0 0x480000>;
@@ -645,6 +670,38 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+						max-speed = <100>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
