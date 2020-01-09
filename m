Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F53FC33CA2
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 03:18:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 181EA2067D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 03:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UyVfJ0uO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 181EA2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wo2thk/32+5lxeDJC+MxWhYTNDDjkGxh7MCk6lGimcs=; b=UyVfJ0uOEYOrhi
	sjFkrHSnx/w0ex0bG/dVZc1S7stwdpsgnCDk+7a9rNxFkWcL46rSYsQWV8h85PqFbwvW0CaXkv35i
	DwkYYXMgpS25/wE/o28qb5oJRukaxWOudwHuBpqkagVtcIH/7MLLWDnCEnjIaKr95+znPnAUnKSVU
	2ee1B1g+0KK9AUbOYV31AnswMgsu9KWVNY9YbBc8QZ6Ev8cXj3Ro2DCq2pZwTdZmME4Ima1/8OTrT
	Sl3X/Eq/wEE2v8kl7gO+8fsIG1Eh1eM9TGtGWOjoOLtxoxb2nBga+9GVvZCccJuf2TtvsYLoTXwyf
	LMmPvjv4Rv7I4Oabb7Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipOKo-000479-T4; Thu, 09 Jan 2020 03:18:10 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipOKf-0003mO-73; Thu, 09 Jan 2020 03:18:09 +0000
Received: from droid15-sz.amlogic.com (10.28.8.25) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 9 Jan 2020
 11:18:24 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH v4] arm64: dts: meson-a1: add I2C nodes
Date: Thu, 9 Jan 2020 11:17:56 +0800
Message-ID: <20200109031756.176547-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [10.28.8.25]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_191801_275910_2132B06F 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There are four I2C controllers in A1 series,
Share the same comptible with AXG. Compared to AXG,
Drive strength feature is newly added in A1.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>

---
This patch depends on A1 clock patchset at [0][3]

Changes since v3 at [4]:
-put the i2c pins under periphs_pinctrl
-replace bias-pull-up as bias-disable
-add missing space in i2c pins node

Changes since v2 at [2]:
-remove the dependence the commit description
-remove i2c alias in dtsi
-reorder the i2c nodes
-reorder the i2c pins

Changes since v1 at [1]:
-change reg length to 0x20
-assign i2c bus alias in dts file
-add new feature note compared to AXG in changelog

[0] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[1] https://lkml.kernel.org/r/20191202111253.94872-1-jian.hu@amlogic.com
[2] https://lkml.kernel.org/r/20191211032802.83309-1-jian.hu@amlogic.com
[3] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
[4] https://lkml.kernel.org/r/20191220091611.36319-1-jian.hu@amlogic.com
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 140 ++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index eab2ecd36aa8..009c8c496b58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -115,6 +115,116 @@
 				       #gpio-cells = <2>;
 				       gpio-ranges = <&periphs_pinctrl 0 0 62>;
 				};
+
+				i2c0_f9_pins: i2c0-f9 {
+					mux {
+						groups = "i2c0_sck_f9",
+							"i2c0_sda_f10";
+						function = "i2c0";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c0_f11_pins: i2c0-f11 {
+					mux {
+						groups = "i2c0_sck_f11",
+							"i2c0_sda_f12";
+						function = "i2c0";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c1_a_pins: i2c1-a {
+					mux {
+						groups = "i2c1_sck_a",
+							"i2c1_sda_a";
+						function = "i2c1";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c1_x_pins: i2c1-x {
+					mux {
+						groups = "i2c1_sck_x",
+							"i2c1_sda_x";
+						function = "i2c1";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_a4_pins: i2c2-a4 {
+					mux {
+						groups = "i2c2_sck_a4",
+							"i2c2_sda_a5";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_a8_pins: i2c2-a8 {
+					mux {
+						groups = "i2c2_sck_a8",
+							"i2c2_sda_a9";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_x0_pins: i2c2-x0 {
+					mux {
+						groups = "i2c2_sck_x0",
+							"i2c2_sda_x1";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c2_x15_pins: i2c2-x15 {
+					mux {
+						groups = "i2c2_sck_x15",
+							"i2c2_sda_x16";
+						function = "i2c2";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c3_f_pins: i2c3-f {
+					mux {
+						groups = "i2c3_sck_f",
+							"i2c3_sda_f";
+						function = "i2c3";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+
+				i2c3_x_pins: i2c3-x {
+					mux {
+						groups = "i2c3_sck_x",
+							"i2c3_sda_x";
+						function = "i2c3";
+						bias-disable;
+						drive-strength-microamp = <3000>;
+					};
+				};
+			};
+
+			i2c0: i2c@1400 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1400 0x0 0x20>;
+				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_A>;
+				status = "disabled";
 			};
 
 			uart_AO: serial@1c00 {
@@ -136,6 +246,36 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			i2c1: i2c@5c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x5c00 0x0 0x20>;
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_B>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@6800 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6800 0x0 0x20>;
+				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_C>;
+				status = "disabled";
+			};
+
+			i2c3: i2c@6c00 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x6c00 0x0 0x20>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&clkc_periphs CLKID_I2C_M_D>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@ff901000 {
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
