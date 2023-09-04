Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB9FC83F2C
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Sep 2023 07:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7fmsVp5eRbocMEMlJBsoGglxmEp02sSsY4nG1MR8Tw=; b=eBQR+ki/x/VZcv
	nehE1QOGB6krqoCA2nrOJu0wMXE29uRtbXe9HffkriSbCEnOyM0vAPiz2zcv8lhXm44RQ7I12xxmM
	imC2KN4O4hcUUUlQ+rTH+b/Lgc5AYlJ/0q0ZsmBrvEmWG4e/t17mWd+c1oNqiVoliOySehbtGk0kZ
	yuOoWvoFw3vnlO2xHwOpIH8GLGhnJnKa7MzxszKGcoD3KUFtFuYuE3ueJvYWYEbm5GUNPmzaOLNz9
	81Hrsi8sN7Ewljo2OJcKrxI5bHn9Ei3bhZhzIUxt3dLSF+gNSzdTHmRMV9gAfVlLd07HIssPESi1Q
	+/paSy8eB26XIA+nRfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qd4Rc-003WQ0-2R;
	Mon, 04 Sep 2023 07:56:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qd4RY-003WLk-2l;
	Mon, 04 Sep 2023 07:56:22 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 4 Sep 2023
 15:56:16 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <kelvin.zhang@amlogic.com>, <qi.duan@amlogic.com>, Yu Tu
	<yu.tu@amlogic.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH V11 2/4] dt-bindings: clock: document Amlogic S4 SoC peripherals clock controller
Date: Mon, 4 Sep 2023 15:55:02 +0800
Message-ID: <20230904075504.23263-3-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20230904075504.23263-1-yu.tu@amlogic.com>
References: <20230904075504.23263-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_005620_895096_5F6F2D86 
X-CRM114-Status: GOOD (  11.31  )
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

Add the S4 peripherals clock controller dt-bindings in the S4 SoC
family.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../clock/amlogic,s4-peripherals-clkc.yaml    |  96 +++++++
 .../clock/amlogic,s4-peripherals-clkc.h       | 236 ++++++++++++++++++
 2 files changed, 332 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
new file mode 100644
index 000000000000..c229e4f0c1d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2022-2023 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s4-peripherals-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic S4 Peripherals Clock Controller
+
+maintainers:
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
+    minItems: 14
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
+    minItems: 14
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
+              <&xtal>;
+      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
+                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
+                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal";
+      #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
new file mode 100644
index 000000000000..861a331963ac
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
@@ -0,0 +1,236 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2022-2023 Amlogic, Inc. All rights reserved.
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H
+
+#define CLKID_RTC_32K_CLKIN		0
+#define CLKID_RTC_32K_DIV		1
+#define CLKID_RTC_32K_SEL		2
+#define CLKID_RTC_32K_XATL		3
+#define CLKID_RTC			4
+#define CLKID_SYS_CLK_B_SEL		5
+#define CLKID_SYS_CLK_B_DIV		6
+#define CLKID_SYS_CLK_B			7
+#define CLKID_SYS_CLK_A_SEL		8
+#define CLKID_SYS_CLK_A_DIV		9
+#define CLKID_SYS_CLK_A			10
+#define CLKID_SYS			11
+#define CLKID_CECA_32K_CLKIN		12
+#define CLKID_CECA_32K_DIV		13
+#define CLKID_CECA_32K_SEL_PRE		14
+#define CLKID_CECA_32K_SEL		15
+#define CLKID_CECA_32K_CLKOUT		16
+#define CLKID_CECB_32K_CLKIN		17
+#define CLKID_CECB_32K_DIV		18
+#define CLKID_CECB_32K_SEL_PRE		19
+#define CLKID_CECB_32K_SEL		20
+#define CLKID_CECB_32K_CLKOUT		21
+#define CLKID_SC_CLK_SEL		22
+#define CLKID_SC_CLK_DIV		23
+#define CLKID_SC			24
+#define CLKID_12_24M			25
+#define CLKID_12M_CLK_DIV		26
+#define CLKID_12_24M_CLK_SEL		27
+#define CLKID_VID_PLL_DIV		28
+#define CLKID_VID_PLL_SEL		29
+#define CLKID_VID_PLL			30
+#define CLKID_VCLK_SEL			31
+#define CLKID_VCLK2_SEL			32
+#define CLKID_VCLK_INPUT		33
+#define CLKID_VCLK2_INPUT		34
+#define CLKID_VCLK_DIV			35
+#define CLKID_VCLK2_DIV			36
+#define CLKID_VCLK			37
+#define CLKID_VCLK2			38
+#define CLKID_VCLK_DIV1			39
+#define CLKID_VCLK_DIV2_EN		40
+#define CLKID_VCLK_DIV4_EN		41
+#define CLKID_VCLK_DIV6_EN		42
+#define CLKID_VCLK_DIV12_EN		43
+#define CLKID_VCLK2_DIV1		44
+#define CLKID_VCLK2_DIV2_EN		45
+#define CLKID_VCLK2_DIV4_EN		46
+#define CLKID_VCLK2_DIV6_EN		47
+#define CLKID_VCLK2_DIV12_EN		48
+#define CLKID_VCLK_DIV2			49
+#define CLKID_VCLK_DIV4			50
+#define CLKID_VCLK_DIV6			51
+#define CLKID_VCLK_DIV12		52
+#define CLKID_VCLK2_DIV2		53
+#define CLKID_VCLK2_DIV4		54
+#define CLKID_VCLK2_DIV6		55
+#define CLKID_VCLK2_DIV12		56
+#define CLKID_CTS_ENCI_SEL		57
+#define CLKID_CTS_ENCP_SEL		58
+#define CLKID_CTS_VDAC_SEL		59
+#define CLKID_HDMI_TX_SEL		60
+#define CLKID_CTS_ENCI			61
+#define CLKID_CTS_ENCP			62
+#define CLKID_CTS_VDAC			63
+#define CLKID_HDMI_TX			64
+#define CLKID_HDMI_SEL			65
+#define CLKID_HDMI_DIV			66
+#define CLKID_HDMI			67
+#define CLKID_TS_CLK_DIV		68
+#define CLKID_TS			69
+#define CLKID_MALI_0_SEL		70
+#define CLKID_MALI_0_DIV		71
+#define CLKID_MALI_0			72
+#define CLKID_MALI_1_SEL		73
+#define CLKID_MALI_1_DIV		74
+#define CLKID_MALI_1			75
+#define CLKID_MALI_SEL			76
+#define CLKID_VDEC_P0_SEL		77
+#define CLKID_VDEC_P0_DIV		78
+#define CLKID_VDEC_P0			79
+#define CLKID_VDEC_P1_SEL		80
+#define CLKID_VDEC_P1_DIV		81
+#define CLKID_VDEC_P1			82
+#define CLKID_VDEC_SEL			83
+#define CLKID_HEVCF_P0_SEL		84
+#define CLKID_HEVCF_P0_DIV		85
+#define CLKID_HEVCF_P0			86
+#define CLKID_HEVCF_P1_SEL		87
+#define CLKID_HEVCF_P1_DIV		88
+#define CLKID_HEVCF_P1			89
+#define CLKID_HEVCF_SEL			90
+#define CLKID_VPU_0_SEL			91
+#define CLKID_VPU_0_DIV			92
+#define CLKID_VPU_0			93
+#define CLKID_VPU_1_SEL			94
+#define CLKID_VPU_1_DIV			95
+#define CLKID_VPU_1			96
+#define CLKID_VPU			97
+#define CLKID_VPU_CLKB_TMP_SEL		98
+#define CLKID_VPU_CLKB_TMP_DIV		99
+#define CLKID_VPU_CLKB_TMP		100
+#define CLKID_VPU_CLKB_DIV		101
+#define CLKID_VPU_CLKB			102
+#define CLKID_VPU_CLKC_P0_SEL		103
+#define CLKID_VPU_CLKC_P0_DIV		104
+#define CLKID_VPU_CLKC_P0		105
+#define CLKID_VPU_CLKC_P1_SEL		106
+#define CLKID_VPU_CLKC_P1_DIV		107
+#define CLKID_VPU_CLKC_P1		108
+#define CLKID_VPU_CLKC_SEL		109
+#define CLKID_VAPB_0_SEL		110
+#define CLKID_VAPB_0_DIV		111
+#define CLKID_VAPB_0			112
+#define CLKID_VAPB_1_SEL		113
+#define CLKID_VAPB_1_DIV		114
+#define CLKID_VAPB_1			115
+#define CLKID_VAPB			116
+#define CLKID_GE2D			117
+#define CLKID_VDIN_MEAS_SEL		118
+#define CLKID_VDIN_MEAS_DIV		119
+#define CLKID_VDIN_MEAS			120
+#define CLKID_SD_EMMC_C_CLK_SEL		121
+#define CLKID_SD_EMMC_C_CLK_DIV		122
+#define CLKID_SD_EMMC_C			123
+#define CLKID_SD_EMMC_A_CLK_SEL		124
+#define CLKID_SD_EMMC_A_CLK_DIV		125
+#define CLKID_SD_EMMC_A			126
+#define CLKID_SD_EMMC_B_CLK_SEL		127
+#define CLKID_SD_EMMC_B_CLK_DIV		128
+#define CLKID_SD_EMMC_B			129
+#define CLKID_SPICC0_SEL		130
+#define CLKID_SPICC0_DIV		131
+#define CLKID_SPICC0_EN			132
+#define CLKID_PWM_A_SEL			133
+#define CLKID_PWM_A_DIV			134
+#define CLKID_PWM_A			135
+#define CLKID_PWM_B_SEL			136
+#define CLKID_PWM_B_DIV			137
+#define CLKID_PWM_B			138
+#define CLKID_PWM_C_SEL			139
+#define CLKID_PWM_C_DIV			140
+#define CLKID_PWM_C			141
+#define CLKID_PWM_D_SEL			142
+#define CLKID_PWM_D_DIV			143
+#define CLKID_PWM_D			144
+#define CLKID_PWM_E_SEL			145
+#define CLKID_PWM_E_DIV			146
+#define CLKID_PWM_E			147
+#define CLKID_PWM_F_SEL			148
+#define CLKID_PWM_F_DIV			149
+#define CLKID_PWM_F			150
+#define CLKID_PWM_G_SEL			151
+#define CLKID_PWM_G_DIV			152
+#define CLKID_PWM_G			153
+#define CLKID_PWM_H_SEL			154
+#define CLKID_PWM_H_DIV			155
+#define CLKID_PWM_H			156
+#define CLKID_PWM_I_SEL			157
+#define CLKID_PWM_I_DIV			158
+#define CLKID_PWM_I			159
+#define CLKID_PWM_J_SEL			160
+#define CLKID_PWM_J_DIV			161
+#define CLKID_PWM_J			162
+#define CLKID_SARADC_SEL		163
+#define CLKID_SARADC_DIV		164
+#define CLKID_SARADC			165
+#define CLKID_GEN_SEL			166
+#define CLKID_GEN_DIV			167
+#define CLKID_GEN			168
+#define CLKID_DDR			169
+#define CLKID_DOS			170
+#define CLKID_ETHPHY			171
+#define CLKID_MALI			172
+#define CLKID_AOCPU			173
+#define CLKID_AUCPU			174
+#define CLKID_CEC			175
+#define CLKID_SDEMMC_A			176
+#define CLKID_SDEMMC_B			177
+#define CLKID_NAND			178
+#define CLKID_SMARTCARD			179
+#define CLKID_ACODEC			180
+#define CLKID_SPIFC			181
+#define CLKID_MSR			182
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
+#define CLKID_HDCP22_ESMCLK_SEL		219
+#define CLKID_HDCP22_ESMCLK_DIV		220
+#define CLKID_HDCP22_ESMCLK		221
+#define CLKID_HDCP22_SKPCLK_SEL		222
+#define CLKID_HDCP22_SKPCLK_DIV		223
+#define CLKID_HDCP22_SKPCLK		224
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_PERIPHERALS_CLKC_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
