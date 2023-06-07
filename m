Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CB7C7EE25
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKKr1eK3k5zW6oiG1KXmKSpRxnmXC19eHD0sRtDdk2Q=; b=CAUfRjB+jofHG8
	Ct/g12Lfd2JocGPOyGyWUFOlhvKGLssqgChQad0LSdlLX3mWdlNvZqw1RmLLghrsaVXBoZO1pHCxJ
	Y4uG89YqtvqM0tmmDB1XkSeN//vm21fQR90AZaEKmMEz3YJmR83nKOohSL3ltwZnhfTY0JGZcalUp
	C2Fi2DWzX969THMaZQdX8MpdTv6wuubyMjrCU17ASzwgXUMVUQvZBltmK4B5/8HDqTBFPHq00B6U/
	FybTTGIGfxHqeqKxN4dD+5rQClRLodA8WxGq/9hYDQw18xRDfgViEGzW4BiBJYRrmO+gh86LMuhpK
	TxcNn/P2G/zBYuQN63Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zae-00751k-2q;
	Wed, 07 Jun 2023 20:17:08 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zaW-0074vE-32;
	Wed, 07 Jun 2023 20:17:05 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id EC9B25FD6F;
	Wed,  7 Jun 2023 23:16:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169013;
	bh=aVULGDkbH3q0MRhaTtQwMhlUPZrJDyZJyqx6P3oqF4c=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K0HyCAg1ljPjyCCkwKOim+M6qI+ukGQvOo3jt3LzODIoNSUcqpyC8jyJNHROFylbn
	 D59AyFYfmOtKUroE+WKnf4S9qvbOpvFiHDsZV6CHWiriHnIbRhlsC6ZQyk2AZElwKu
	 ZQzAQv9gtsoAymBoKph0cr3rrr8Qvr2mpdTqFjf1xOgj8VstbmXxP9m9Dw2jMjEe8U
	 CifSz68Prgp+eZUgRtt+KgQkmO+lkLq9NeKMGdFPoHx82BSog4bWeD2MshDD2z8CKi
	 xklUqwfJid3g50sZZUX8UJyIv6FjFC6X512n5LtV/tXns3gOoC+AG5vmBKSei78TFZ
	 KtcXjb3i5kpYA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:52 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Yue Wang <yue.wang@amlogic.com>,
	Hanjie Lin <hanjie.lin@amlogic.com>
Subject: [PATCH v1 2/6] arm64: dts: meson: a1: support USB controller in OTG mode
Date: Wed, 7 Jun 2023 23:16:37 +0300
Message-ID: <20230607201641.20982-3-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131701_334650_B44C63A0 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

Amlogic A1 SoC family has USB2.0 controller based on dwc2 and dwc3
heads. It supports otg/host/peripheral modes.

Signed-off-by: Yue Wang <yue.wang@amlogic.com>
Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 59 +++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index a24228808c9c..b2563c7d3842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -8,6 +8,8 @@
 #include <dt-bindings/gpio/meson-a1-gpio.h>
 #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
 #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+#include <dt-bindings/power/meson-a1-power.h>
+#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -161,6 +163,17 @@ gpio_intc: interrupt-controller@0440 {
 				amlogic,channel-interrupts =
 					<49 50 51 52 53 54 55 56>;
 			};
+
+			usb2_phy1: phy@4000 {
+				compatible = "amlogic,a1-usb2-phy";
+				clocks = <&clkc_periphs CLKID_USB_PHY_IN>;
+				clock-names = "xtal";
+				reg = <0x0 0x4000 0x0 0x60>;
+				resets = <&reset RESET_USBPHY>;
+				reset-names = "phy";
+				#phy-cells = <0>;
+				power-domains = <&pwrc PWRC_USB_ID>;
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
@@ -175,6 +188,52 @@ gic: interrupt-controller@ff901000 {
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
+
+		usb: usb@fe004400 {
+			status = "disabled";
+			compatible = "amlogic,meson-a1-usb-ctrl";
+			reg = <0x0 0xfe004400 0x0 0xa0>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc_periphs CLKID_USB_CTRL>,
+				 <&clkc_periphs CLKID_USB_BUS>,
+				 <&clkc_periphs CLKID_USB_CTRL_IN>;
+			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
+			resets = <&reset RESET_USBCTRL>;
+			reset-name = "usb_ctrl";
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc2: usb@ff500000 {
+				compatible = "amlogic,meson-a1-usb", "snps,dwc2";
+				reg = <0x0 0xff500000 0x0 0x40000>;
+				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb2_phy1>;
+				phy-names = "usb2-phy";
+				clocks = <&clkc_periphs CLKID_USB_PHY>;
+				clock-names = "otg";
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff400000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff400000 0x0 0x100000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				snps,dis_u2_susphy_quirk;
+				snps,quirk-frame-length-adjustment = <0x20>;
+				snps,parkmode-disable-ss-quirk;
+			};
+		};
 	};
 
 	timer {
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
