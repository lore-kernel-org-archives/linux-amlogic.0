Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CCDC25B08
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWQCn/hBc9wKMnz9y1ri7YVhIoX9y+gyZmjq51zk5IY=; b=U0Iulh/YJVVmxK
	IpMIDtSxw3+e027yGFvu2YhyvuUMfeXSWRt2aW4WXxTM2YmW7Qj43BAZSWnj3t/m9ZQISKfVySiy8
	BkhUfVPjbtmw79+RIEh8kF+DJlGrnRvkDYoWpbLnEd4ZnY/Fsx6bUgksS+9v9JwZFD4z2raUF3zfK
	4Br4nIXcH+zykDndsH/CxV+fBbnaEd1We1im8V3lEaQZCtrBLh3O4oQ7a53EdLdifil8jaW9ntDzv
	Fj6PvpeDd7JEwXez1E9NRgQZihFjd9GYPE3aKrUnZUT2DZJ0tSAISfzEVjNCOJy4tf6bezPmSTFJ8
	xLOVX9XHLqhd3iCfwFBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtBg-00DN5B-78; Fri, 05 Aug 2022 09:00:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtAl-00DMNr-Ed; Fri, 05 Aug 2022 08:59:13 +0000
Received: from droid06.amlogic.com (10.18.11.248) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.9; Fri, 5 Aug 2022
 16:59:07 +0800
From: Yu Tu <yu.tu@amlogic.com>
To: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: Yu Tu <yu.tu@amlogic.com>
Subject: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral clock controller bindings
Date: Fri, 5 Aug 2022 16:57:14 +0800
Message-ID: <20220805085716.5635-5-yu.tu@amlogic.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220805085716.5635-1-yu.tu@amlogic.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.18.11.248]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_015911_510629_9B8486C0 
X-CRM114-Status: GOOD (  11.02  )
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

Add peripheral clock controller compatible and dt-bindings header for
the of the S4 SoC.

Signed-off-by: Yu Tu <yu.tu@amlogic.com>
---
 .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
 include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
new file mode 100644
index 000000000000..2471276afda9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Yu Tu <yu.hu@amlogic.com>
+
+
+properties:
+  compatible:
+    const: amlogic,s4-periphs-clkc
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
+    clkc_periphs: periphs-clock-controller@fe000000 {
+      compatible = "amlogic,s4-periphs-clkc";
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
diff --git a/include/dt-bindings/clock/amlogic,s4-clkc.h b/include/dt-bindings/clock/amlogic,s4-clkc.h
new file mode 100644
index 000000000000..d203b9bbf29e
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,s4-clkc.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
+ * Author: Yu Tu <yu.tu@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H
+#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H
+
+/*
+ * CLKID index values
+ */
+
+#define CLKID_RTC_CLK			1
+#define CLKID_SYS_CLK_B_GATE		2
+#define CLKID_SYS_CLK_A_GATE		3
+#define CLKID_SYS_CLK			4
+#define CLKID_CECA_32K_CLKOUT		5
+#define CLKID_CECB_32K_CLKOUT		6
+#define CLKID_SC_CLK_GATE		7
+#define CLKID_12_24M_CLK_SEL		8
+#define CLKID_VID_PLL			9
+#define CLKID_VCLK			10
+#define CLKID_VCLK2			11
+#define CLKID_VCLK_DIV1			12
+#define CLKID_VCLK2_DIV1		13
+#define CLKID_VCLK_DIV2			14
+#define CLKID_VCLK_DIV4			15
+#define CLKID_VCLK_DIV6			16
+#define CLKID_VCLK_DIV12		17
+#define CLKID_VCLK2_DIV2		18
+#define CLKID_VCLK2_DIV4		19
+#define CLKID_VCLK2_DIV6		20
+#define CLKID_VCLK2_DIV12		21
+#define CLKID_CTS_ENCI			22
+#define CLKID_CTS_ENCP			23
+#define CLKID_CTS_VDAC			24
+#define CLKID_HDMI			25
+#define CLKID_TS_CLK_GATE		26
+#define CLKID_MALI_0			27
+#define CLKID_MALI_1			28
+#define CLKID_MALI			29
+#define CLKID_VDEC_P0			30
+#define CLKID_VDEC_P1			31
+#define CLKID_VDEC_SEL			32
+#define CLKID_HEVCF_P0			33
+#define CLKID_HEVCF_P1			34
+#define CLKID_HEVCF_SEL			35
+#define CLKID_VPU_0			36
+#define CLKID_VPU_1			37
+#define CLKID_VPU			38
+#define CLKID_VPU_CLKB_TMP		39
+#define CLKID_VPU_CLKB			40
+#define CLKID_VPU_CLKC_P0		41
+#define CLKID_VPU_CLKC_P1		42
+#define CLKID_VPU_CLKC_SEL		43
+#define CLKID_VAPB_0			44
+#define CLKID_VAPB_1			45
+#define CLKID_VAPB			46
+#define CLKID_GE2D			47
+#define CLKID_VDIN_MEAS_GATE		48
+#define CLKID_SD_EMMC_C_CLK		49
+#define CLKID_SD_EMMC_A_CLK		50
+#define CLKID_SD_EMMC_B_CLK		51
+#define CLKID_SPICC0_GATE		52
+#define CLKID_PWM_A_GATE		53
+#define CLKID_PWM_B_GATE		54
+#define CLKID_PWM_C_GATE		55
+#define CLKID_PWM_D_GATE		56
+#define CLKID_PWM_E_GATE		57
+#define CLKID_PWM_F_GATE		58
+#define CLKID_PWM_G_GATE		59
+#define CLKID_PWM_H_GATE		60
+#define CLKID_PWM_I_GATE		61
+#define CLKID_PWM_J_GATE		62
+#define CLKID_SARADC_GATE		63
+#define CLKID_GEN_GATE			64
+#define CLKID_DDR			65
+#define CLKID_DOS			66
+#define CLKID_ETHPHY			67
+#define CLKID_MALI_GATE			68
+#define CLKID_AOCPU			69
+#define CLKID_AUCPU			70
+#define CLKID_CEC			71
+#define CLKID_SD_EMMC_A			72
+#define CLKID_SD_EMMC_B			73
+#define CLKID_NAND			74
+#define CLKID_SMARTCARD			75
+#define CLKID_ACODEC			76
+#define CLKID_SPIFC			77
+#define CLKID_MSR_CLK			78
+#define CLKID_IR_CTRL			79
+#define CLKID_AUDIO			80
+#define CLKID_ETH			81
+#define CLKID_UART_A			82
+#define CLKID_UART_B			83
+#define CLKID_UART_C			84
+#define CLKID_UART_D			85
+#define CLKID_UART_E			86
+#define CLKID_AIFIFO			87
+#define CLKID_TS_DDR			88
+#define CLKID_TS_PLL			89
+#define CLKID_G2D			90
+#define CLKID_SPICC0			91
+#define CLKID_SPICC1			92
+#define CLKID_USB			93
+#define CLKID_I2C_M_A			94
+#define CLKID_I2C_M_B			95
+#define CLKID_I2C_M_C			96
+#define CLKID_I2C_M_D			97
+#define CLKID_I2C_M_E			98
+#define CLKID_HDMITX_APB		99
+#define CLKID_I2C_S_A			100
+#define CLKID_USB1_TO_DDR		101
+#define CLKID_HDCP22			102
+#define CLKID_MMC_APB			103
+#define CLKID_RSA			104
+#define CLKID_CPU_DEBUG			105
+#define CLKID_VPU_INTR			106
+#define CLKID_DEMOD			107
+#define CLKID_SAR_ADC			108
+#define CLKID_GIC			109
+#define CLKID_PWM_AB			110
+#define CLKID_PWM_CD			111
+#define CLKID_PWM_EF			112
+#define CLKID_PWM_GH			113
+#define CLKID_PWM_IJ			114
+#define CLKID_HDCP22_ESMCLK_GATE	115
+#define CLKID_HDCP22_SKPCLK_GATE	116
+
+#endif /* _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H */
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
