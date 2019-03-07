Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A712DC10F03
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F7920840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KWSMTVyp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="drGqb91M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F7920840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKkOt4qJP/z8Ez7auIqnsEfg7vs5N7gV3+aENuZZM5g=; b=KWSMTVypxk5mw2
	jAiZgxA7tVaNzfZmcCOytZQO2uF3TtbOEzkWh+I6jaIXU9eABNGUOnqBgeKiZ5wluNXJb8xm90kFS
	mt51pQA3HiXqq0dRJoXfoTxKw2QzK45o61npCD5P3E2P6mUGbM+ycfugucKaYnzg4QuCUq4h9hZ3V
	ZIF929zJb52VxmFggBjrJisHAqMkOBP8tn9FA3ekgz3FDQO5K/+bId6cipnoz/PfCw9cpxdPx3oem
	PuhlMx8r/3XIHYwqxzXfIjkNc1xU1PiO3riKdXqzbKj4XXWrMgTpSGwVUNcl9PCHYUQPwWfoyEv6f
	RoAmI1nvXb29eTsskJDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1ukH-000758-Lv; Thu, 07 Mar 2019 15:15:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiV-0003U5-H1
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:14:00 +0000
Received: by mail-wm1-x341.google.com with SMTP id e74so9614993wmg.3
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WGl0+t6qc0DE+q8X5n35oktYj1wBnQw0GSdQfqfiPJ8=;
 b=drGqb91M6prHbc31ZNqryIhYO+lEpu3P6PVOQ7rx6c33cKiItjGaWL8jKkg37dEPlO
 hGk3FYXR0A/5BQwUKWxHg/D5bglImGYxhdgpmh/IGVMaVHCX7iH7o78vdd3KfAuKVjFg
 ewjRUTB9E8sGbKGJcQKvhJP3YavuOJ4iluM9NPe7YvAvZvtfKTTjer2TPBHdYOob2cRX
 YsJG3zZ6XMT2bASgExY0/UOxvunx7MVvw6Srd3e3YrmufepLdN5/zdMAzrcgVo7k4UIq
 0rYOGmbqTDkh36ILevPpw+iPRW2d0SlVUyoch3yQ73gkq2LC56uLhj6F8OxkO+WO7hxC
 W6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WGl0+t6qc0DE+q8X5n35oktYj1wBnQw0GSdQfqfiPJ8=;
 b=L9ZCyhU5ASlqjOjKGTBwJ+x2NQxnuSd3EjECBFGzyCMjWj++U/EoMzDnyTqZ0vWR9l
 2affs8QQxthb5qakOikOFhpvNSyfbNx3PRlf/QfgH4fCtcFGUh19dGBrpAV4/9cbPZ/O
 xNPXz+UWT8DD3DG3HScML1jHFlR+pzganEwPlouu71PFb4cKmmCSZKjg4geVQYcgnVLf
 Tixq4ieEjYbXjNbrutk5ZKMSjq14zwWnsJ6BRv/ZxBAJC2b3D7FUo7cPGbI62bkJL8Pn
 dctsnMy/xwUlaoOVai29fMcDhZO0B0ngnbVsMoK+uupQS+mxuF9/qVHLS5sfan6UELlN
 KUZw==
X-Gm-Message-State: APjAAAVzBhBHAD5NaUA7OJbYRNEX61MpxfQGBeUesznaE35kxE/5eHty
 6CMnu8aJZ+l2nXGwUebgLjEQ4jhD/UbRaw==
X-Google-Smtp-Source: APXvYqy/T9v8I2sGM64jbUlJ2r4vGKb02JpwRzKX1BZDhCug/VA6xzbzq89DkWmJ05q8gysfyGZEQA==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr6124150wmc.10.1551971630000; 
 Thu, 07 Mar 2019 07:13:50 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 8/9] arm64: dts: meson: g12a: Add G12A USB nodes
Date: Thu,  7 Mar 2019 16:13:40 +0100
Message-Id: <20190307151342.7381-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071351_886021_FB00A941 
X-CRM114-Status: GOOD (  12.24  )
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
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 78 +++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3bcddd412aa1..991883ea023c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -3,9 +3,13 @@
  * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
  */
 
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/g12a-clkc.h>
+#include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 
 / {
 	compatible = "amlogic,g12a";
@@ -170,6 +174,26 @@
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
@@ -190,6 +214,18 @@
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
@@ -353,6 +389,48 @@
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
+				status = "disabled";
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
