Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6EBC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B6E2070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yk0cehUU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KDA6I3JJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B6E2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ILCDlYSI30eCzVBhhynoklEmC5jt3Hxy3+M3Ck8Gvw=; b=Yk0cehUUsXaQ0T
	c4tSf8I6kjwp2YSY8PHPuUfRKsXebU0uD/IaV5IzPV7Jn8/4vVtmrwKwU5XHl8IETI2VMvmcCc3K3
	d+VIxcXYMLdIbOtbVbWme9Z4u+94QQM96iIb8E5XpQuyTPzVSzocX5g6TE4dXlsMDin5sx2WWUvpK
	1WEyrekwHRj1fLun/h9Jm1/JIyK8Nc1tcHfIbcAlviNCvEen1jvlDM8GNP0UV6gBOVgLur3c8P5v+
	2WHG2qn++z7JbdZGK5ZuzF0nJRog1tbQM9ngvWE+WUNg3V3nMJNEiZSpR6XspJZ7O6A7u/HO7yDmr
	uCNNYF+v2q9t2FTrXsEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p4e-0006xS-QY; Mon, 18 Mar 2019 10:00:52 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2t-0003eh-83
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id z11so3779351wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J4oym53pblyH4Djmv5JFN5gdbf5/Syr9K8b694MhuuQ=;
 b=KDA6I3JJ0yggd8VeyhJeVkFB6JTH4Fj5XQOxFBIP9G01WbWaT9IAGA29p1kvpkEuK6
 ZZ2xaTyaNAL20TqVqFwq1wJowqH2CajW6T6+xkE8EWjMZkG+eOWdL36Rlh+GKwwsDyxl
 IBS/wbV/ejN4NZJFcNvEnl5WGcynvE7gwBJ2S0rOOEU1k9KCrCufA2CKrsa0TbLtH20i
 z+fbFygMtkjkzEKyMdLRAK3YjbUJ3/PPFkc5o1fLb7yKX/N4dLe6PA8Lkh88FHB7SQJP
 pf1/EsjuOljAGxQJoyajg8HShosDjlGF4lYVrIFVGkF1ahQXlqgoFt+uEBvgJdRRLtJN
 FySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J4oym53pblyH4Djmv5JFN5gdbf5/Syr9K8b694MhuuQ=;
 b=oVww8SvjQrrb4aE8I4sx0iuYHtVz37wQXD/bkYUCZArWMO7OY6Fthmt3FwlWe7C1Z1
 KTJOTurp6I+s/nMhMGPtbY/jE9ylqJLDUR6/tTe8bcIkf0HDKeg2o9cgtIucT5JxMzAI
 wVjEFrCr/tMhmGN+0aDhlmsalhCkiDulS30UlrTiwBqRu8Rh0mBdE+SNwJgH6Q9c9M5T
 MGynC5f+OW8QJtIuXq5BpTcd/8piAhTH6lLi3UJnoQ3xziYXgvZsaUMLqccT9rCTbiUa
 T9uLOarT5zUj7cLcRwcnoa8QryImPNvHAHf42ej/t4DIJdYlsQM9X3UDOtibVo38xdpZ
 sDzA==
X-Gm-Message-State: APjAAAWetmquFEM1sV3w4UYJD3QTwyMXFfoCOBBbqv/BhaoPufasd1jt
 7Eev2Zsyk4vh9LnDYIf3pm/4Zw==
X-Google-Smtp-Source: APXvYqxaWk0/0w17XD/AhJmmutHpp4wR7SWU4kIs3KdaNwnpOFXQx289H2hcogU5/TLtRHcJvIq1wA==
X-Received: by 2002:a1c:7c0c:: with SMTP id x12mr10424150wmc.38.1552903141803; 
 Mon, 18 Mar 2019 02:59:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.59.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:59:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 7/8] arm64: dts: meson: g12a: Add G12A USB nodes
Date: Mon, 18 Mar 2019 10:58:50 +0100
Message-Id: <20190318095851.4062-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025903_687640_5D7CE745 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the nodes for the USB Complex found in the Amlogic
G12A SoC.

It includes the :
- 2 USB2 PHYs
- 1 USB3 + PCIE Combo PHY
- the USB Glue with it's DWC2 and DWC3 sub-nodes

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index a99c13ee724a..ce681aef8d5b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -3,11 +3,13 @@
  * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/g12a-clkc.h>
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 
 / {
 	compatible = "amlogic,g12a";
@@ -163,6 +165,26 @@
 				};
 			};
 
+			usb2_phy0: phy@36000 {
+				compatible = "amlogic,g12a-usb2-phy";
+				reg = <0x0 0x36000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USB_PHY20>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
+			usb2_phy1: phy@3a000 {
+				compatible = "amlogic,g12a-usb2-phy";
+				reg = <0x0 0x3a000 0x0 0x2000>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+				resets = <&reset RESET_USB_PHY21>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+			};
+
 			hiu: bus@3c000 {
 				compatible = "simple-bus";
 				reg = <0x0 0x3c000 0x0 0x1400>;
@@ -183,6 +205,18 @@
 					};
 				};
 			};
+
+			usb3_pcie_phy: phy@46000 {
+				compatible = "amlogic,g12a-usb3-pcie-phy";
+				reg = <0x0 0x46000 0x0 0x2000>;
+				clocks = <&clkc CLKID_PCIE_PLL>;
+				clock-names = "ref_clk";
+				resets = <&reset RESET_PCIE_PHY>;
+				reset-names = "phy";
+				assigned-clocks = <&clkc CLKID_PCIE_PLL>;
+				assigned-clock-rates = <100000000>;
+				#phy-cells = <1>;
+			};
 		};
 
 		aobus: bus@ff800000 {
@@ -346,6 +380,47 @@
 				status = "disabled";
 			};
 		};
+
+		usb: usb@ffe09000 {
+			status = "disabled";
+			compatible = "amlogic,meson-g12a-usb-ctrl";
+			reg = <0x0 0xffe09000 0x0 0xa0>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB>;
+			resets = <&reset RESET_USB>;
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy0>, <&usb2_phy1>,
+			       <&usb3_pcie_phy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy0", "usb2-phy1", "usb3-phy0";
+
+			dwc2: usb@ff400000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xff400000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
+				clock-names = "ddr";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff500000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff500000 0x0 0x100000>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment;
+			};
+		};
 	};
 
 	timer {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
