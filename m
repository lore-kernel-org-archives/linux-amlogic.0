Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2144C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7390320811
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:04:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/terwWW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="geI4nahi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7390320811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xm0Dbw3xD6gLy97VjVBFjc/TQNrGpqjlRQ6oerlDu1o=; b=g/terwWWDime81
	9zbV6F47pV2D48Q4SfDXVHrSkhbdA+5tKcHZ9EaBXpODMxqbn+pebvEfGm7eKRecD3TjyZt355Ylu
	amT0mgHWv35FfxfpmeMoYwddcuSb75DhPKQnebSJLseqMXBa/t/rYpiixYnFvt6LW0ha6QHNG2zXT
	/RQyKe/EcoZzZQzSwwttjDu75kRceLqNi92sMUdM7Sjok9QIglHdgINA03lXopkSE1VecP4fHBDAh
	CKh5zKcU34doSkmCQtEXT6bMYhYQ7OYf/V7qdvomcDeruLan4fa8WbXG0Mjr1wl5oSiH8y2ziFipX
	NP0MgRiI1Y5jA/ddGaVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MSj-0000iZ-Kv; Mon, 25 Mar 2019 10:04:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MSJ-0000B8-Ls
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:03:55 +0000
Received: by mail-wr1-x442.google.com with SMTP id k17so1387970wrx.10
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiYphHszT1boPmgsGMzckEzxrSJiGDBV9O9U53D5dZ0=;
 b=geI4nahiemLBvlYgY6ecMbNBRWOJ//sJ600WY8df4KI+6Qx3CxptZzTJRYUcl8z3qN
 YsegQc0vLr62CEwDK+0bWZNFPWJFuHBqbcmNZranYf9lvlRM+ApujvAxYjbI3RX4SBnQ
 aDsPfNXg/N2qldzMTNXZpLJF2BdtjUHQ6FVBoOnNHTqe4ncMAaOPJ9Vqae9tZAzViS2a
 K+WQoOF2sKMZTUtGWYVQ9pHHL8YrBrVYW0qBy4wfcktbwb18zkLJHggGnnn2CQytzkDs
 uNLn/QpgvA4e2Nn4WKQWLddFnvHVOGldpALsznmnrJYzXnzbxqlyqOwucmRA8zfGDHu0
 0jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiYphHszT1boPmgsGMzckEzxrSJiGDBV9O9U53D5dZ0=;
 b=lBlznm0rXqcKJBRq153KO7a1LM1xLcNS8TLPkGwQC+fOcsDnaSsghBE5tiqkjZDSdJ
 wOdqxmiiA+crAIT8qgNtxlwSFUmbItOuXuI6QCv0rlzCJrq30a0/fL56jKeetHSkZzXl
 2b8fab4ht9OKEiyE1r9fwNApaNOvNk6MKWCqWxh4SWRloujvrQwxwRc1Hwj1BYbebFoT
 0rRZxp23ioLoTuZhZyalltlF10Q3q+4/GzUsQadzMuYOT9hAPFs4YLyQu0maWokeKgU6
 jpee/c+UYagvuGrSR+TcmhlYTgtOdKzeeXp8m//S9PRMyhOUJFnP3+M2LjTWNmLMGLop
 5SjA==
X-Gm-Message-State: APjAAAVxBgWjWVKLXEYDJCuTxtKQoUG3ZxF+rmNO9dQO9TP6bazZIsNe
 SvTynijbgTE0VnvUBYR1lbZIxw==
X-Google-Smtp-Source: APXvYqy7CSyp6ENjlTRU7AfpXx927Bz4QGMg9seXy80C6ZW+rZthEBOe+nqe+Ue913Cf1TtSNDiHsg==
X-Received: by 2002:a5d:6246:: with SMTP id m6mr15820702wrv.184.1553508224451; 
 Mon, 25 Mar 2019 03:03:44 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm11581215wrw.40.2019.03.25.03.03.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:03:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 2/3] arm64: dts: meson: g12a: Add G12A USB nodes
Date: Mon, 25 Mar 2019 11:03:38 +0100
Message-Id: <20190325100339.749-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325100339.749-1-narmstrong@baylibre.com>
References: <20190325100339.749-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030348_042538_5C8B361C 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 75 +++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 4b3be7e60b4d..a9cd91f033f2 100644
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
@@ -175,6 +177,26 @@
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
@@ -195,6 +217,18 @@
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
@@ -358,6 +392,47 @@
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
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
