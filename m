Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B196C7EE2C
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KeajrIVWZkrRH4tbe+J5DutwBhDui1H1svIENHNMZ5w=; b=PWTVAVJNfrm3SU
	8mxRhf0a4pCjSH0K3cbg+PYiLS2knKcXRGn0dfdTtEtyQPX/RG7wfzmSj8QW/PKLA+4uv46bDMS7H
	vFsTW3PzLVOiuQJ1Ppj20ecpH5rf1iPzjWT4gac8vjfmYIa9xl+dKfpQbhxEuqo/r+UFiLSZLgxGh
	kP/pRU9uueX5SofL6JVaqr+p8Zc4ONZO6zvDGS0JN3e4Df6d2AvGeQ99Jg+hHSOxxVlyC+8vpZPZk
	fa7PNH5cLsgNSsb9OtrCMxZqUlXNggdoenOXIrSPo5KY+CLHbgdnUkmS20o/KSdOq9A4RT+vIKweP
	LGLc5a+A8kcRpk9wWKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNu-005JkM-1W;
	Fri, 25 Aug 2023 11:53:50 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNf-005Jbx-2I;
	Fri, 25 Aug 2023 11:53:36 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 25 Aug 2023
 19:53:20 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Date: Fri, 25 Aug 2023 19:53:10 +0800
Message-ID: <20230825115310.39993-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230825115310.39993-1-zelong.dong@amlogic.com>
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_045335_769189_D203E528 
X-CRM114-Status: UNSURE (   8.07  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add the IR controller device of Meson-S4 SoC family.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 8ffbcb2b1ac5..c1f322c73982 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -28,3 +28,9 @@ memory@0 {
 &uart_B {
 	status = "okay";
 };
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f24460186d3d..5a3abcc08ee5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -106,6 +106,14 @@ gpio: bank@4000 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&periphs_pinctrl 0 0 82>;
 				};
+
+				remote_pins: remote-pin {
+					mux {
+						groups = "remote_in";
+						function = "remote_in";
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -133,6 +141,13 @@ reset: reset-controller@2000 {
 				reg = <0x0 0x2000 0x0 0x98>;
 				#reset-cells = <1>;
 			};
+
+			ir: ir@84040 {
+				compatible = "amlogic,meson-s4-ir";
+				reg = <0x0 0x84040 0x0 0x30>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
