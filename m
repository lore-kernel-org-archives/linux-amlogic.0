Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ECB606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YvuuepU4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6UxSS6RPkbSXY4BPRMQAABzXZhfIOdUAL0mQy+vlvA=; b=YvuuepU4UQy8bBjo+L0GMPd0ND
	tgt3uMciWF3y9i9iTnuf1MlqesCUWO+owVw3SywhfbsG57PRroJ0O9hDqhhaVZzNjopaA75/41xdX
	5CN//gg5ueeWxB/j+DkiUEyEG0m7qiGk7F1xcJU/A/cZMzcVJD3I+hXTeddbtETFyqWwGIWL32q/e
	k08cP+igt4ncFq06JwYCAkNBjV0TQc27EkbJsvR1wITGmvZLzw4KDbRBZO0Fmi/ISMgqU+7HkysK1
	JSZv1UxG07uxpSJ1K7oU1qnBkmNm8BW6Uox/8+JtBY3acWDTmqqhZHg3Z07g1mMI5732S1xXB1EUy
	IsnmGmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsgB-00000000LhW-3fIj;
	Sat, 21 Nov 2026 21:31:27 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsfv-00000000LV3-12S3
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 21:31:12 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so1908679f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 13:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296670; x=1795901470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkqPjgBZvW1pC8TxlESj4YMTVjlgjKCqkchJPtVa1yk=;
        b=u1IpBKolSNnr+DKGdX5zR7UWLc3paLIgR2gqpcL1vkpvMpoJOukK7d+XTLcJQt9avz
         5+RjvihvQVHGFBt6fir2v0VOmaUXFPYuZSGXHdzOoLQ4CGT64gN4EiRc6Awidac14XRd
         cTcZ4WXDwFreesVn58LzL95CwTIi4lyxOS2Q7mD3gu2oUkJ4MsEunZ/sYOON23+c3Eg0
         glB7szcVE4LB982U2pfc4Ud0E3+dBsSLEo7vxlIj6Hrd6xs3fsJEUsHdzldY9t961lMj
         mLRZQZYpS2U1QecVooUYxoJJh3CaHgi0EwQqcHQm2IpC6sJsBwTiSwvcrxf9OL/aj/Wa
         GtmA==
X-Forwarded-Encrypted: i=1; AL+hErFo8eAWeDlXHauIgxe+yzdH+3Q1qX/TYbYca/v8qC/6Bh0PfRQNgAic5r4oWF7VDFXcM1CmIht2+9nvECur@lists.infradead.org
X-Gm-Message-State: APuU4Z/xvsWWsbkeiD6NR4eQOX6sNS4nLjLKWVoTJLnaHxIHkO9ITFk/
	xCd10UjP6zVilEnRHinAAkVJ560gGgpfipuo3HYchOHZ7ts2HwGu119gWDvXdCoG
X-Gm-Gg: AZFdTZeI/Ks+p/ge/q6G7iFSQAKK8ikRxMyer1/DrWjyf/MZt86d9Gj+91G7SJd8Nx8
	QSuQXAV2AKB5yh41Kk24ub9cMqBlPl5l9Ut08fz+loj/EvLs1hWtgxEo36F1euSB8GaVot8ssbX
	T1dmpMHPoRFN3/HnWWq42O+t6L70XMPJSl15eU+kyXZA6sjQ5UQAkE0SJOikCPeD2z/D0zvn2N+
	L0xYzen2kBs/yF89YzS4jLdt0e9K8WslbdSrB8dTpBg/K2UcSI0fAZbo1GWmEy2jLoj9ivoqYKe
	mphH2L1cUKXcuLIwm5AL2iAD+827v42ab9fGuzJ7CHR/v4g58gsHw/y53DbqQDemKwIAO5C+j2X
	4o/w9GRdWdSN8Z75lohg5wipjrwzBdY2itKjeQre3mlO2LQ5W/G/wpHF3D9P9Kup9Yz13KEwyxA
	jj0gU7C9LE1A/mNyhJbk6ayT13p32d4ecnlf8MwCJ1ASKnlB6Yi8PmSZYrc3mhJAFPQ4nmLkGGo
	lsmnb0xWwgBXVF6AH8pt3JeCPnhJRRaiXpGo0TyZYMHLs2x0c/GbgYhnOY56D5QL1IFrgpO1ImU
	ghoSLmWyDhZIeECVd48csMGFrM9ZJbm5/kgvqKnglkuVMhJgDuVEottC2L0Bas0xD0XpBpyBpnQ
	MR+lkMl3G9aP48Sc/KvyH2Ws=
X-Received: by 2002:a05:6000:4a15:b0:49f:eb4b:faa3 with SMTP id ffacd0b85a97d-4abb2168f46mr13243799f8f.9.1795296669533;
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:09 -0800 (PST)
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
Subject: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
Date: Sat, 21 Nov 2026 21:31:01 +0000
Message-ID: <20261121213102.143130-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_133111_300122_99DAC294 
X-CRM114-Status: GOOD (  10.14  )
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
