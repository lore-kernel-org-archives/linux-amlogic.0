Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1459606A31F
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2026 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wOU2OIod
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6UxSS6RPkbSXY4BPRMQAABzXZhfIOdUAL0mQy+vlvA=; b=wOU2OIodTsosolhqpMqPUUcSQQ
	+fSJ9FKHQt7sqtRP0aAjKvYC+iCETzXXNl/iB0q6q/52w3ZXFhYp77Pa2b9FHInYjQpBv6qSJW8fm
	nwKYTJ5+0QMvbiLfQrTgTcktMfIKjMt1MEnqvoBmFyorFQSWOwWpRnKutAJ74SSaZ5O4tZCzVrPFG
	HZLQhm4st+SOOm/bQeeZqTOy9BQ8ao6mPkxlb9q0UM9HIG/9dsqnD8TE9iKS+jvcJDGFaSSR79/6Z
	IGCm4a2Im+IeEX0C2WqtQDc3Ogeif/eXBYGO3QSi+7so4dj8PCkbVIAMOGEbYOE41t8P0nGC18bu2
	76JgImOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCh0-00000000RgK-1EJm;
	Sat, 28 Nov 2026 07:17:54 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXCfR-00000000RKy-0GaG
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Nov 2026 07:16:20 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so85026975e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 23:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850175; x=1796454975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=lLFRrkWjCZmRaDDaq/60QKqogScX0mORWMKxjeEXp1RiUblw4Dpb01Q9oavlkkALgc
         mtPt/cZLDVrdqok9xL89tnG4RtTxKFzwm6Rs9DHlj8eGnjpy7wx3r+u3L49LOnDKmh0w
         ttLZTLbHLAaXvYtgYqjjXppc0Jq3NR9DbhDBaxQKtj0zSsYAvH4r6gscop/eui+Z3dM+
         brntGfT05jhAJQ9xuEoattiNRsCQIUs9IRIr9yB3bWlL15sk9vEXotePVUkI9GYKzjWp
         3j8I2IQZeavmUnK2xCq+pLd9sgO0LZIMRpXjzfcFsWu0PT8bfRv3ENfMeTSy6I0/RSfM
         imcw==
X-Forwarded-Encrypted: i=1; AL+hErGCe19aTXykA/u1Y9fdLZHHgmT7M/SDxPZJ2hVznINkpYjeDqAZvdNR/WR+FoylzPAhYWPfQXy3rnGnK2JF@lists.infradead.org
X-Gm-Message-State: APuU4Z92XHSOjjXR12X68H+9JQ094fOIJnbMUH+kpknbZo8Bbe2qKsyk
	2VWNPWJ2R1ctmYnsiF+rWL2nH71Sq3oLxegzg4CO6oUGZCMUzyumrste
X-Gm-Gg: AZFdTZdKVmm89cCsiCDtqUn7bb71eoYxaanLl93ArM8VnjGcFqHY7D/HwvODB/i8Bm6
	0id5hwP++G4rmFmyZf6cSeOliRxz1iQJAKzmtJZWaPTme2kfK63c8v2Ft1IzJ+ALRBAO1+TYiaK
	yftWPjtieQtx4L4fwdQkVH46qMlsqIlstFuga9mh3an5bOuilUkLH3IQuPnH0/zZmHEBM7zk+jH
	4ECSnlofNSCUhAQXl7SOe3tBQSRlaNx9gik/ybb6mp0MAFhVIYpaUPftee6Nq9r7FhHYDlstb2k
	VyMzRLFj5kRjmd1evH4SEEI54LOElAYG8/ndzj6J5xxlrTX9sIvmQg9CTGOcxvVRMQKNPGeMUOE
	hKkvsVdxEJ/krQ5bZxCOKuWHjInZZAbC9jLnBT9h3iIlpBhcw4M4Tiprydqkkl3oUGns48YLU9Q
	WErXUD8G6RmhvdskBRCI7B5zM+xWHgZDYFG5mGA/5sFOOftUWCadHLEeGHwLPzbaOjkk3Pjqq+3
	XsX+itQTQa/UzeGPcwXTOA4k5JilftcFNqOuo6o21APC04kcEj/itA4Sa31jhpT/thBkO9kmT1S
	s/H43G+TfR3xxpqGbNWhy5PUNwIoSDTCMUNq8w5qXzAWWo+EwGT8ZmGTQTG1eZ+hJd9rcZWiSGe
	Rp7pIR3ECnvglvAdISw+eL8C/
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr278936495e9.9.1795850175157;
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:14 -0800 (PST)
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
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 28 Nov 2026 07:16:09 +0000
Message-ID: <20261128071610.27855-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_231619_206207_ABDE0283 
X-CRM114-Status: UNSURE (   9.79  )
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

The SoC has a Synopsys gigabit MAC, glue registers for the interface
type and clock timing, and a multiplexer that points the management bus
at the on-chip 100M PHY or the external pins. None of it was described.

The controller reaches memory through a pipeline stage with a gate
nothing else claims, so it is switched off as unused. The
glue registers share a clock with the multiplexer, which probes after
the controller has programmed them: unless the controller holds that
clock, the writes are lost and the port keeps the
bootloader's delays.

The multiplexer and the on-chip PHY bus start disabled: a board enables
the multiplexer with the controller, and the on-chip bus only when it
uses that PHY.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 58 +++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 7bd53ec16607..eb7f46c98b0b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		ethmac: ethernet@fdc00000 {
+			compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+			reg = <0x0 0xfdc00000 0x0 0x10000>,
+			      <0x0 0xfe024000 0x0 0x8>;
+			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clkc_periphs CLKID_SYS_ETH>,
+				 <&scmi_clk CLKID_FCLK_DIV2>,
+				 <&mpll CLKID_MPLL2>,
+				 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+				 <&clkc_periphs CLKID_SYS_ETHPHY>;
+			clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline",
+				      "pclk";
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
@@ -645,6 +670,39 @@
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			eth_phy: mdio-multiplexer@28000 {
+				compatible = "amlogic,t7-mdio-mux", "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x28000 0x0 0xa4>;
+				clocks = <&clkc_periphs CLKID_SYS_ETHPHY>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
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
+					status = "disabled";
+
+					internal_ephy: ethernet-phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+					};
+				};
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
