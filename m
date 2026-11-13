Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58877606A88F
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 12:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S0qxoZow
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jMMTXb+U7t62aZn2TBHL8omhBzSynxFIOo5bR0Va+j8=; b=S0qxoZow5XTmZ6vatHKkRygOID
	f8AhgSVwIAlEsk7+BxRmfT9AJFXElV25cQZMoOvPvMNSyJ+HZIDnBukyc0VMWIxmnSCDmokWYy+Qe
	trNLpu2RFbkb9b0XtGoDlPmvD84QO6lVP4tySUMhKsBUeLdo2njmbKZmhBo2kojHQHftHWA1b8GGy
	dsff9IFGx1JNZWbDQIsfs5VWwbZz3QZQuo0k7vjq0FAGFHrBQUyfAvasElm/ETnAU14VP2s1IeFqi
	XhZskpcOaprv44gh+cplKUNYKn6Sn+FmNWdRyP39gCSxnWqJy6Wrt9NXUY7ukvbtIM/TGSXKUddjO
	04D4FSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqFF-0000000ChC2-2uy8;
	Fri, 13 Nov 2026 12:19:10 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqF7-0000000Ch72-1b8A
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 12:19:03 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4922dbcee23so393716f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 04:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572335; x=1795177135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzwdGume78d+Ss8/RtaDjaZog/9tADCa21G3bSQ/eAo=;
        b=nSUj6VptvElEKMkzJ9O6bl6OhWv0B/P9s6TIvLle8aiqBJflxNfiw94koESo/BK2qF
         uak59DzFacjE41HCKwI9Q/ydE3S1LTe3yPzLx9pwajShiKaWRCXbYQ5C+Z6eKkOgrHMT
         VGxklClmIWsns/yvjeADc5trnqx+WRj4H0OG97zwxrNDED3V89MlgD2zGthKXJaW6MQs
         hhlRkj0NvsnGHd9AwJAJjoqWBMD+ZAV5BUnHAgIG1gY4pwmW+tIURG1YhrM9FhyrJXIO
         ZA43FjedGSODAbbGj/Rh17Gk4eN4TL9ACOy/XHG2TIHd1SfEgDH7oh19vsXGvckRWTxF
         HstQ==
X-Forwarded-Encrypted: i=1; AL+hErFfB7PCbrfCOj0clzDqIRhNbLfccjiM6y4v/0MPX0b/UrjRMcWPpwgcgRxL27634lUoPhYTkF1lJTLP0U/O@lists.infradead.org
X-Gm-Message-State: APuU4Z8fDPpHdUyk+Ub2Vny5Xzwc2774C6ioXAvIGUFceGdlAtw/NudD
	Cut9jPk+z6DtjhYCmJQyiEzXxPOf424iHL1+GpNm1FHKUl8KlbEpnRla
X-Gm-Gg: AYBFou2d1LKZUDgk5F3ITNadpY3tyzxooxMo/xNlmUTn0RIDNiDyXu6Jc9Ozbv76Hs6
	QFFZ/oy13UWuBVlHsqxAKVvIBSmZcSzrKu0gWet9zUNmTnDSEwbseCzEnNaAPjFqOZTDbR26lTW
	HZK+ZEugMZqYxiwQ/ze00E7DhNOM3twcAPL5GXfZNiwXYJ5kMUiuTvcDYOzslCcr9UbGqzXprFP
	Pvihmq0XCPxgyX5cpNqkyB5d6VJAcMSSBN8tv7PUbvtmy4hW47N9AyQbLfrJ2arQnMTUl5M+6ss
	TBx94ybdp2P86bYNGCB71wY8mOC+eEvnD2it9RoSZ4jzNeaxMB0PfgZ5KXAd58OYUDFppXRCtsz
	Amngocjyr5wQqujVR1ySub++YRuagSMmqws3Dv0Mdd89o8uJuvOFXDsG24u2icbGRvsuI3vSvS/
	Il6u0ysBN9y7zXQA/K5jzjelTxKxOun1PE75v7Iwj1i5c4APmNA286y9XOSEiJTp1UBYi0dmnoa
	2CNVkZ7701TRnDtMDUCLxht4Or12a+YKK+iQiMhoUq4vSGBWS5+bgaNAbOo2VHzKbPiaZ/kFPFP
	xQFaWyVyQS4eU6ODUl7AbeIo/34Rxg0GNfXU9u+UodrjkEjRF5h8tG9DjAnGnM0c97Zz66Lj7rf
	+e7xfmNzuuoFHt8uWxkVFaY9h
X-Received: by 2002:a05:6000:2003:b0:490:411a:1eed with SMTP id ffacd0b85a97d-49c72f7a66cmr5198418f8f.39.1794572335385;
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:54 -0800 (PST)
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
Subject: [PATCH v7 2/7] dt-bindings: net: add amlogic,t7-dwmac
Date: Fri, 13 Nov 2026 12:18:47 +0000
Message-ID: <20261113121852.334604-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_041857_458597_166F5B23 
X-CRM114-Status: GOOD (  15.02  )
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

The T7 has the same ethernet glue as the G12A but needs two clocks of
its own. The controller reaches memory through a pipeline stage with
its own gate; nothing else claims it, so it is switched off as unused
and transfers never finish. The glue registers share a gate with the
MDIO multiplexer, which probes after the controller has programmed
them: the writes are lost and the port keeps the bootloader's delays.

With a newer core, a clock list of its own and delays that follow
ethernet-controller.yaml, the T7 gets a binding of its own: the PHY
adds the 2ns, and only the receive delay line offers fine tuning, so
only rx-internal-delay-ps is valid here.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,t7-dwmac.yaml        | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml

diff --git a/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
new file mode 100644
index 000000000000..9b7c3864cd29
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/amlogic,t7-dwmac.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/amlogic,t7-dwmac.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 DWMAC Ethernet controller
+
+maintainers:
+  - Lucas Tanure <tanure@linux.com>
+
+# The select keeps this schema from matching every "snps,dwmac-5.10a" node.
+select:
+  properties:
+    compatible:
+      contains:
+        const: amlogic,t7-dwmac
+  required:
+    - compatible
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: amlogic,t7-dwmac
+      - const: snps,dwmac-5.10a
+
+  reg:
+    items:
+      - description: registers of the DWMAC controller
+      - description: the glue registers PRG_ETH0 and PRG_ETH1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    const: macirq
+
+  clocks:
+    items:
+      - description: GMAC main clock
+      - description: First parent clock of the internal mux
+      - description: Second parent clock of the internal mux
+      - description:
+          clock of the pipeline stage inserted in the bus path between
+          the controller and the DRAM. Without it, the controller cannot
+          complete DMA transfers.
+      - description:
+          APB clock of the glue registers PRG_ETH0 and PRG_ETH1.
+          Without it, they read as zero and ignore writes.
+
+  clock-names:
+    items:
+      - const: stmmaceth
+      - const: clkin0
+      - const: clkin1
+      - const: pipeline
+      - const: pclk
+
+  power-domains:
+    maxItems: 1
+
+  rx-internal-delay-ps:
+    description:
+      Fine tuning of the RX clock, added on top of the delays that
+      phy-mode describes. The PHY adds the 2ns RGMII delays, see
+      ethernet-controller.yaml.
+    default: 0
+    maximum: 3000
+    multipleOf: 200
+
+  # The TX clock has no fine tuning, its only step is a quarter of the
+  # clock period, the full 2ns at 1Gbit/s. The PHY adds the TX delay, so
+  # the property is not accepted.
+  tx-internal-delay-ps: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - phy-mode
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,t7-scmi.h>
+    #include <dt-bindings/power/amlogic,t7-pwrc.h>
+
+    ethernet@fdc00000 {
+        compatible = "amlogic,t7-dwmac", "snps,dwmac-5.10a";
+        reg = <0xfdc00000 0x10000>, <0xfe024000 0x8>;
+        interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq";
+        clocks = <&clkc_periphs CLKID_SYS_ETH>,
+                 <&scmi_clk CLKID_FCLK_DIV2>,
+                 <&mpll CLKID_MPLL2>,
+                 <&clkc_periphs CLKID_SYS_AMPIPE_ETH>,
+                 <&clkc_periphs CLKID_SYS_ETHPHY>;
+        clock-names = "stmmaceth", "clkin0", "clkin1", "pipeline", "pclk";
+        power-domains = <&pwrc PWRC_T7_ETH_ID>;
+        phy-mode = "rgmii-id";
+    };
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
