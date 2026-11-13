Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57522606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKOIUjzu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HSXWYiHf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XhfiRnluDfw8Zh3TOmNB+HPO71b3F5Pz+tijWSwB5ug=; b=xKOIUjzuz2tUzPCdV0wOh/gosQ
	vtkq6W2uw09gJh2mXJHPXVJI9zbmVjGe0Kc4stx2E+T4zURmfXtFtOMXxYEMdDE+79LVHiOSG8jh7
	Gyki2eoH4NEuEekpYmnRuYlIAAh/wvHXkKRaOz3lVorlrBomnjGniKGNNrhDlBJ7mj3FHC2L1ps3/
	XxHBThr9XRfWsrmtX0X860sUoGw7GOZZpmVRFZ8a3/UUsUME3ombr5s0myQ/7EXetAaG8MrpfYY5m
	dPNbgluz5q+8O2RlaVcWesqN9ZRiB8fSi5XzYS1rf8RJWfVy4BjB9TBjIvuaJAr93Nfnop9uehbg1
	W7hC+l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFc-0000000ChPQ-3DzR;
	Fri, 13 Nov 2026 12:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFH-0000000ChCY-18ub
	for linux-amlogic@bombadil.infradead.org;
	Fri, 13 Nov 2026 12:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=; b=HSXWYiHfsB6/jxftK3iMd3uOPZ
	EGDU6b48N6CcAhtnEQ4T1Ic6gG+I3/onky7WiSlAqnC5dcHr92zhq9NZ5U+NNLy87pp+m1dq4eyas
	+T/PxED7Jib52O0nNTwIBTcCxLfP6kbyijf9bKPCp5EKTg52ZxAx+azt0KtaCxQBZFH/1q8MIEehC
	XXG2wUlthk7hW6a4kVdDJyPihmiJ8/bISsTvbec3lfbG5ntcvW5g61XtYvD6in5MEc9No8Ldtj2/2
	BHu7WB3/BCsEGo+dMJp9jZVxXAg5TRBwU37GBBCn307gWndiqgzFhchG9lbNxhcgL7E9Diw8JLdFn
	Dz+MbaFw==;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFA-0000000BEKK-3FBQ
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:06 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e09aa5264so372981f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572339; x=1795177139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8LUINT1uPJGcPtj79NOLQhhl8W2gjYoDk+VmjrsPuU=;
        b=UNwsl+gfLYFViwjDFBwgXC8udmTw1dfANtGV8MwfHmA1NU1MNaNXYH0mNRDg9wD2iV
         zDLhyLojPo723I9IH5M5JhMVFPYSlXnkAIY99ECNdUxD7NEh5YT6rY4bLN2sI7msGqr+
         SQVzLek53YIE/wiM1ikxJOlUIgTkJSkP1F81URtEqKvmgRmSfZxlTNj8JA3xuZ1W9j3c
         0pdPvJLJUWgXD7x64GAvs+EPSeNZDeCDCNLeUDIHko5euk6Gailf5O5upd8xNvCZ77X7
         2PdG7fcTX7Xufcc+ANyPp5KFjVcYeFIMQG8g43hqcI1PJw+43YqUN3BvxVfzIw+rOl/V
         4ZcA==
X-Forwarded-Encrypted: i=1; AL+hErHpZaNVrCgbxpI/FDZPJ9F44wuRD4PQ+I43ZevItn1rQSzlKR/7LfPrmRWU8PPniCItT3tfgUFSXGkonb6z@lists.infradead.org
X-Gm-Message-State: APuU4Z/1fpyZXX7EA1eF0iQJkcfhgS4JWCp8BB7lYuTHHLruIcBXmEc6
	if8w21YPRdFVMWXbL57xqfXW/Xu4kQYRlsIGOJQLIbyifdY5VVQtVZrW
X-Gm-Gg: AYBFou0B5zJV8Bsy+jQz2Brgpx+7DhvMRk8WMxDxYXWERAgrIkzDxgw6EsQKQ5nDGOE
	fr4RzsW2HO36yRHdu7Gk0a0OigutK4GVkMUhfZ3xc4gQqAAAUqCeEfcK4H7cD81sy1N+8a8rNU2
	/RKoLIGEAj5EgOY2UfSwoxpSqXUSxyH7DJ3d4PiFFq08DJrgAQsXouoLeo481Lz7bke9r1jW4Lz
	XZBPH490l6EOVvU9uhRhRDaa4Czs9rIN+WXW1EFJnI7f8Gys7ha81DM53TGtA/iCNix+5JVfpbc
	lBeVVahXb/butClukQ6WFc+6tSFHFktwHJtzRALPrf6BsYJc/QzHfmmOR/kZM4+GiK91XKQGbxG
	fOfvIBKD4Wi5iM2GsZ4ebNjpMzhFsG6Ihvc/TxKJbSNDdUU4ksGqJalj4MZo+9QFpLOxY/FORVu
	+X32qsx0zSZzQrtk1R8ehBBl7eX888rusPEctm2M+YNf2SLOqHXfvgOM4ixw1HuAybRYrLESd2c
	8owzrZ1Z8L1SC0WND+OnOCrG9WN1+Fed0K6to4rGaCwL/MpOmAz6qZAM6pk/XB83gEzOpX/aQgx
	NT0a47IwOrhsQa26ajilXeSsLrgOFw0AOojJFBGs17JDAucMnc4VfI4Qj6P/dW0BwETHEV6VSVP
	V9sqUjTLSpyu5J71QVmBN6KLH
X-Received: by 2002:a05:6000:18a9:b0:498:88f:14c8 with SMTP id ffacd0b85a97d-49c73259e2bmr5745745f8f.9.1794572339177;
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
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
Subject: [PATCH v7 6/7] arm64: dts: amlogic: t7: add the ethernet controller
Date: Fri, 13 Nov 2026 12:18:51 +0000
Message-ID: <20261113121852.334604-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_121900_727033_DBDD0E50 
X-CRM114-Status: GOOD (  11.02  )
X-Spam-Score: 1.1 (+)
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
index 7bd53ec16607..c6797688805b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -250,6 +250,31 @@ gic: interrupt-controller@fff01000 {
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
@@ -645,6 +670,39 @@ gpio_intc: interrupt-controller@4080 {
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
