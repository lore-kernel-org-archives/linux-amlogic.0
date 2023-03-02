Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7D7C678D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 06:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoEW81mEaXFYJLuqV4PiDFEx3WVjuhc/GZTSdOYWs50=; b=avb5fhyCiax9Fm
	gWsd3Wo6CVC2XHUOEwuwHm5KbckOWCfvylrdV3goJnqH0K7p67kKM5txiVuoYdM2fxTKAVcboeSwZ
	2kqZuQqEjgqikjwnUqUhEBUbuWXPuSL7IgJuU9NxvwC0DeO48/tUubV3r5yE4D7z+pSzXyoJVrpjW
	cj6NqpHVFlCcPkd7+QbMCyRWO7VsSm/NbO0ZN4TjItiPoyVBix63rjy2weVWkjUYZgjOFsOYQoYvB
	CBemtcegnmZa8ghIMazKrA7C+oH6Tp75hu3VVCL/RZuuSjm1McD+ybTdtVVB1apyI3+pTyD40OQ7b
	8tCTyq0TsJe7ONH/xIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWn-0011mD-AB; Thu, 02 Mar 2023 06:34:57 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWk-0011iz-Q8
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 06:34:56 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:53 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Date: Thu, 2 Mar 2023 14:34:02 +0800
Message-ID: <20230302063402.42708-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230302063402.42708-1-zelong.dong@amlogic.com>
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_223454_867743_593FD163 
X-CRM114-Status: UNSURE (   7.45  )
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

Add the IR controller device of Meson-S4 SoC family, and enable
hardware IR decoder.

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 8ffbcb2b1ac5..4d3a81b3b762 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -28,3 +28,9 @@ memory@0 {
 &uart_B {
 	status = "okay";
 };
+
+&ir {
+	status = "disabled";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index ad50cba42d19..309352a83eda 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -106,6 +106,14 @@ gpio: bank@4000 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&periphs_pinctrl 0 0 82>;
 				};
+
+				remote_pins: remote_pin {
+					mux {
+						groups = "remote_in";
+						function = "remote_in";
+						bias-disable;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -133,6 +141,14 @@ reset: reset-controller@2000 {
 				reg = <0x0 0x2000 0x0 0x98>;
 				#reset-cells = <1>;
 			};
+
+			ir: ir@84000 {
+				compatible = "amlogic,meson-s4-ir";
+				reg = <0x0 0x84040 0x0 0x54>;
+				interrupts = <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
+				amlogic,ir-support-hw-decode;
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
