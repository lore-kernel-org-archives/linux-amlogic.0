Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED87FC77B72
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 06:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W2yBv/ACb8k2QqW2fQWf1UnS4V6cDMsce25XZmxTk4=; b=Yn4H0U+Vh4MRFh
	GeodP9RsJTCMy+T03EoScl5JVs5Pyh811VoyRM8xZ0d6FsGUjDhQcwapkV6ncIUK1j9X7qz8E4eiN
	ARvIGq64EHFAuhEJCoKgyUYUiePm3Ug0L8LtedEa6x0RkcotzeVxqtkXVOSaM60HG7NlIxIj32B/q
	AhGMPjgeQJe5lf4SCrbHTlnC9R86ubJf8nj3dlVyIvxTuTg3H9/SDgKNkt+n4wYGJU28V5wAoogaJ
	A5DR1l/R3TvhoMxJpdr6R+uAxwtbvN1wtcw1HJDUHN7PRan278FBSvVg677R2ScH4gZkeXKO2l5Qm
	ZmrJfYnTWb4drevJXdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIhh-00F5JX-23;
	Mon, 17 Apr 2023 06:51:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poIhb-00F5Ft-11;
	Mon, 17 Apr 2023 06:51:05 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 17 Apr 2023
 14:52:12 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>
Subject: [PATCH V7 2/4] dt-bindings: clock: document Amlogic S4 SoC peripherals clock controller
Date: Mon, 17 Apr 2023 14:50:03 +0800
Message-ID: <20230417065005.24967-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20230417065005.24967-1-yu.tu@amlogic.com>
References: <20230417065005.24967-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_235103_609603_56DE6517 
X-CRM114-Status: GOOD (  10.78  )
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

Add the S4 peripherals clock controller dt-bindings in the s4 SoC
family.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../clock/amlogic,s4-peripherals-clkc.yaml    |  97 +++++++++++++
 .../clock/amlogic,s4-peripherals-clkc.h       | 131 ++++++++++++++++++
 2 files changed, 228 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
new file mode 100644
index 000000000000..46b969a16a7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson S serials Peripherals Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Yu Tu <yu.tu@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,s4-peripherals-clkc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input fixed pll div2
+      - description: input fixed pll div2p5
+      - description: input fixed pll div3
+      - description: input fixed pll div4
+      - description: input fixed pll div5
+      - description: input fixed pll div7
+      - description: input hifi pll
+      - description: input gp0 pll
+      - description: input mpll0
+      - description: input mpll1
+      - description: input mpll2
+      - description: input mpll3
+      - description: input hdmi pll
+      - description: input oscillator (usually at 24MHz)
+      - description: input external 32kHz reference (optional)
+
+  clock-names:
+    items:
+      - const: fclk_div2
+      - const: fclk_div2p5
+      - const: fclk_div3
+      - const: fclk_div4
+      - const: fclk_div5
+      - const: fclk_div7
+      - const: hifi_pll
+      - const: gp0_pll
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
+      - const: mpll3
+      - const: hdmi_pll
+      - const: xtal
+      - const: ext_32k
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
+
+    clkc_periphs: clock-controller@fe000000 {
+      compatible = "amlogic,s4-peripherals-clkc";
+      reg = <0xfe000000 0x49c>;
+      clocks = <&clkc_pll 3>,
+              <&clkc_pll 13>,
+              <&clkc_pll 5>,
+              <&clkc_pll 7>,
+              <&clkc_pll 9>,
+              <&clkc_pll 11>,
+              <&clkc_pll 17>,
+              <&clkc_pll 15>,
+              <&clkc_pll 25>,
+              <&clkc_pll 27>,
+              <&clkc_pll 29>,
+              <&clkc_pll 31>,
+              <&clkc_pll 20>,
+              <&xtal>,
+              <&ext_32k>;
+      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
+                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
+                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal",
+                    "ext_32k";
+      #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
new file mode 100644
index 000000000000..073396a76957
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
+
+/*
+ * CLKID index values
+ */
+
+#define CLKID_RTC_CLK			4
+#define CLKID_SYS_CLK_B_GATE		7
+#define CLKID_SYS_CLK_A_GATE		10
+#define CLKID_SYS_CLK			11
+#define CLKID_CECA_32K_CLKOUT		16
+#define CLKID_CECB_32K_CLKOUT		21
+#define CLKID_SC_CLK_GATE		24
+#define CLKID_12_24M_CLK_SEL		27
+#define CLKID_VID_PLL			30
+#define CLKID_VCLK			37
+#define CLKID_VCLK2			38
+#define CLKID_VCLK_DIV1			39
+#define CLKID_VCLK2_DIV1		44
+#define CLKID_VCLK_DIV2			49
+#define CLKID_VCLK_DIV4			50
+#define CLKID_VCLK_DIV6			51
+#define CLKID_VCLK_DIV12		52
+#define CLKID_VCLK2_DIV2		53
+#define CLKID_VCLK2_DIV4		54
+#define CLKID_VCLK2_DIV6		55
+#define CLKID_VCLK2_DIV12		56
+#define CLKID_CTS_ENCI			61
+#define CLKID_CTS_ENCP			62
+#define CLKID_CTS_VDAC			63
+#define CLKID_HDMI			67
+#define CLKID_TS_CLK_GATE		69
+#define CLKID_MALI_0			72
+#define CLKID_MALI_1			75
+#define CLKID_MALI			76
+#define CLKID_VDEC_P0			79
+#define CLKID_VDEC_P1			82
+#define CLKID_VDEC_SEL			83
+#define CLKID_HEVCF_P0			86
+#define CLKID_HEVCF_P1			89
+#define CLKID_HEVCF_SEL			90
+#define CLKID_VPU_0			93
+#define CLKID_VPU_1			96
+#define CLKID_VPU			97
+#define CLKID_VPU_CLKB_TMP		100
+#define CLKID_VPU_CLKB			102
+#define CLKID_VPU_CLKC_P0		105
+#define CLKID_VPU_CLKC_P1		108
+#define CLKID_VPU_CLKC_SEL		109
+#define CLKID_VAPB_0			112
+#define CLKID_VAPB_1			115
+#define CLKID_VAPB			116
+#define CLKID_GE2D			117
+#define CLKID_VDIN_MEAS_GATE		120
+#define CLKID_SD_EMMC_C_CLK		123
+#define CLKID_SD_EMMC_A_CLK		126
+#define CLKID_SD_EMMC_B_CLK		129
+#define CLKID_SPICC0_GATE		132
+#define CLKID_PWM_A_GATE		135
+#define CLKID_PWM_B_GATE		138
+#define CLKID_PWM_C_GATE		141
+#define CLKID_PWM_D_GATE		144
+#define CLKID_PWM_E_GATE		147
+#define CLKID_PWM_F_GATE		150
+#define CLKID_PWM_G_GATE		153
+#define CLKID_PWM_H_GATE		156
+#define CLKID_PWM_I_GATE		159
+#define CLKID_PWM_J_GATE		162
+#define CLKID_SARADC_GATE		165
+#define CLKID_GEN_GATE			168
+#define CLKID_DDR			169
+#define CLKID_DOS			170
+#define CLKID_ETHPHY			171
+#define CLKID_MALI_GATE			172
+#define CLKID_AOCPU			173
+#define CLKID_AUCPU			174
+#define CLKID_CEC			175
+#define CLKID_SD_EMMC_A			176
+#define CLKID_SD_EMMC_B			177
+#define CLKID_NAND			178
+#define CLKID_SMARTCARD			179
+#define CLKID_ACODEC			180
+#define CLKID_SPIFC			181
+#define CLKID_MSR_CLK			182
+#define CLKID_IR_CTRL			183
+#define CLKID_AUDIO			184
+#define CLKID_ETH			185
+#define CLKID_UART_A			186
+#define CLKID_UART_B			187
+#define CLKID_UART_C			188
+#define CLKID_UART_D			189
+#define CLKID_UART_E			190
+#define CLKID_AIFIFO			191
+#define CLKID_TS_DDR			192
+#define CLKID_TS_PLL			193
+#define CLKID_G2D			194
+#define CLKID_SPICC0			195
+#define CLKID_SPICC1			196
+#define CLKID_USB			197
+#define CLKID_I2C_M_A			198
+#define CLKID_I2C_M_B			199
+#define CLKID_I2C_M_C			200
+#define CLKID_I2C_M_D			201
+#define CLKID_I2C_M_E			202
+#define CLKID_HDMITX_APB		203
+#define CLKID_I2C_S_A			204
+#define CLKID_USB1_TO_DDR		205
+#define CLKID_HDCP22			206
+#define CLKID_MMC_APB			207
+#define CLKID_RSA			208
+#define CLKID_CPU_DEBUG			209
+#define CLKID_VPU_INTR			210
+#define CLKID_DEMOD			211
+#define CLKID_SAR_ADC			212
+#define CLKID_GIC			213
+#define CLKID_PWM_AB			214
+#define CLKID_PWM_CD			215
+#define CLKID_PWM_EF			216
+#define CLKID_PWM_GH			217
+#define CLKID_PWM_IJ			218
+#define CLKID_HDCP22_ESMCLK_GATE	221
+#define CLKID_HDCP22_SKPCLK_GATE	224
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
