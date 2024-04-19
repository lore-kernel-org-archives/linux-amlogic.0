Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D8AC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Apr 2024 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaiattKwesXfeOSFMYgqpFhfk6MF9yE2MU74QneVkFs=; b=V2knxiQTuxOING
	oYAeiDIDIm2RjP47gM0Kn28URxcJp+94Z9h8axee2/XLwy2jsc8YPOj7CoWgjoZE21+G1VReCdi5y
	Uh5oVssfL9cznc9XgZ37Uerv2vCIw/5sO8mr1yIrivIsPsChQN/jd7xEkYZfG2ZoBo6fiHDxvcyXV
	q4poTPWHpFjZVQg9/cqMaV0PfcR8DsWKBeDgxg5qyr3G1vglTVGz5Q8J7yWlKMcIo1d31+hPNQ7Rc
	mWkPBGL4PDFtBtMwRJFAOLMspr6lMxXLATPwubzAs7WYJzYNXd0to4dPnXzSc2Fi3eEffm5dBad7M
	j4JNOPtznVpfe2Gc/IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnrN-00000005gIl-36qZ;
	Fri, 19 Apr 2024 13:00:57 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnr6-00000005g6M-3570;
	Fri, 19 Apr 2024 13:00:45 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5E26512000D;
	Fri, 19 Apr 2024 16:00:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5E26512000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713531628;
	bh=u3hvFnBjvbksoGTEXVB8Gn4bwtvS33sDVhv0PhhswPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=mPZPZuqC2Pu0CELEbAIPLSZdU9SUEcVLaJLJuyFLBcp+NCZc8V6bGs+iM3Hq/pxAC
	 1RZYZXsLMmr5TsUjgtzCOtoDFvt44XEw5jJrM/VwXZhmDOo/obDh4z4N4ROowUwlig
	 aQktFJd1KN4R1Eog5+vKkBo0SFlPff7759AbfhhF4qTZcqDzB4YIgJjnJLX/60fF1y
	 Xl3jsWVYC94VKmb4s2sHlaVkBXn/67gQMYiVP+8zvdrJRz6Ov8X0tb1EmzCjA7ogXA
	 lAVRSH6Encl7ZMToRmhBztmfjZ5idTpJMVKW32KJKV27oECuw3x9Y3143PqJp/SiTg
	 XcLfsLKIV2CAw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 19 Apr 2024 16:00:28 +0300 (MSK)
Received: from CAB-WSD-0003115.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Apr 2024 16:00:27 +0300
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC audio clock controller driver
Date: Fri, 19 Apr 2024 15:58:10 +0300
Message-ID: <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184806 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, 100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;sberdevices.ru:5.0.1,7.1.1;devicetree.org:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_sender_alignment_int}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/04/19 12:19:00
X-KSMG-LinksScanning: Clean, bases: 2024/04/19 12:19:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/18 23:49:00 #24865988
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_060041_484903_4C639A31 
X-CRM114-Status: GOOD (  17.99  )
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

Add device tree bindings for A1 SoC audio clock and reset controllers.

Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
---

This controller has 6 mandatory and up to 20 optional clocks. To describe
this, I use 'additionalItems'. It produces correct processed-schema.json:

  "clock-names": {
      "maxItems": 26,
      "items": [
          {
              "const": "pclk"
          },
          {
              "const": "dds_in"
          },
          {
              "const": "fclk_div2"
          },
          {
              "const": "fclk_div3"
          },
          {
              "const": "hifi_pll"
          },
          {
              "const": "xtal"
          }
      ],
      "additionalItems": {
          "oneOf": [
              {
                  "pattern": "^slv_sclk[0-9]$"
              },
              {
                  "pattern": "^slv_lrclk[0-9]$"
              }
          ]
      },
      "type": "array",
      "minItems": 6
  },

and it behaves as expected. However, the checking is followed by
complaints like this:

  Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'

And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
do it right?
---
 .../bindings/clock/amlogic,a1-audio-clkc.yaml | 124 ++++++++++++++++++
 .../dt-bindings/clock/amlogic,a1-audio-clkc.h | 122 +++++++++++++++++
 .../reset/amlogic,meson-a1-audio-reset.h      |  29 ++++
 3 files changed, 275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,a1-audio-clkc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
new file mode 100644
index 000000000000..40a0af3635f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml
@@ -0,0 +1,124 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a1-audio-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A1 Audio Clock Control Unit and Reset Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Jan Dakinevich <jan.dakinevich@salutedevices.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a1-audio-clkc
+      - amlogic,a1-audio-vad-clkc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 26
+    items:
+      - description: input main peripheral bus clock
+      - description: input dds_in
+      - description: input fixed pll div2
+      - description: input fixed pll div3
+      - description: input hifi_pll
+      - description: input oscillator (usually at 24MHz)
+    additionalItems:
+      oneOf:
+        - description: slv_sclk[0-9] - slave bit clocks provided by external components
+        - description: slv_lrclk[0-9]- slave sample clocks provided by external components
+
+  clock-names:
+    maxItems: 26
+    items:
+      - const: pclk
+      - const: dds_in
+      - const: fclk_div2
+      - const: fclk_div3
+      - const: hifi_pll
+      - const: xtal
+    additionalItems:
+      oneOf:
+        - pattern: "^slv_sclk[0-9]$"
+        - pattern: "^slv_lrclk[0-9]$"
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,a1-audio-clkc
+    then:
+      required:
+        - '#reset-cells'
+    else:
+      properties:
+        '#reset-cells': false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
+    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
+    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
+    audio {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_audio: clock-controller@fe050000 {
+                compatible = "amlogic,a1-audio-clkc";
+                reg = <0x0 0xfe050000 0x0 0xb0>;
+                #clock-cells = <1>;
+                #reset-cells = <1>;
+                clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
+                         <&clkc_periphs CLKID_DDS_IN>,
+                         <&clkc_pll CLKID_FCLK_DIV2>,
+                         <&clkc_pll CLKID_FCLK_DIV3>,
+                         <&clkc_pll CLKID_HIFI_PLL>,
+                         <&xtal>;
+                clock-names = "pclk",
+                              "dds_in",
+                              "fclk_div2",
+                              "fclk_div3",
+                              "hifi_pll",
+                              "xtal";
+        };
+
+        clkc_audio_vad: clock-controller@fe054800 {
+                compatible = "amlogic,a1-audio2-clkc";
+                reg = <0x0 0xfe054800 0x0 0x20>;
+                #clock-cells = <1>;
+                clocks = <&clkc_periphs CLKID_AUDIO>,
+                         <&clkc_periphs CLKID_DDS_IN>,
+                         <&clkc_pll CLKID_FCLK_DIV2>,
+                         <&clkc_pll CLKID_FCLK_DIV3>,
+                         <&clkc_pll CLKID_HIFI_PLL>,
+                         <&xtal>;
+                clock-names = "pclk",
+                              "dds_in",
+                              "fclk_div2",
+                              "fclk_div3",
+                              "hifi_pll",
+                              "xtal";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,a1-audio-clkc.h b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
new file mode 100644
index 000000000000..6534d1878816
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef __A1_AUDIO_CLKC_BINDINGS_H
+#define __A1_AUDIO_CLKC_BINDINGS_H
+
+#define AUD_CLKID_DDR_ARB		1
+#define AUD_CLKID_TDMIN_A		2
+#define AUD_CLKID_TDMIN_B		3
+#define AUD_CLKID_TDMIN_LB		4
+#define AUD_CLKID_LOOPBACK		5
+#define AUD_CLKID_TDMOUT_A		6
+#define AUD_CLKID_TDMOUT_B		7
+#define AUD_CLKID_FRDDR_A		8
+#define AUD_CLKID_FRDDR_B		9
+#define AUD_CLKID_TODDR_A		10
+#define AUD_CLKID_TODDR_B		11
+#define AUD_CLKID_SPDIFIN		12
+#define AUD_CLKID_RESAMPLE		13
+#define AUD_CLKID_EQDRC			14
+#define AUD_CLKID_LOCKER		15
+#define AUD_CLKID_MST_A_MCLK_SEL	16
+#define AUD_CLKID_MST_A_MCLK_DIV	17
+#define AUD_CLKID_MST_A_MCLK		18
+#define AUD_CLKID_MST_B_MCLK_SEL	19
+#define AUD_CLKID_MST_B_MCLK_DIV	20
+#define AUD_CLKID_MST_B_MCLK		21
+#define AUD_CLKID_MST_C_MCLK_SEL	22
+#define AUD_CLKID_MST_C_MCLK_DIV	23
+#define AUD_CLKID_MST_C_MCLK		24
+#define AUD_CLKID_MST_D_MCLK_SEL	25
+#define AUD_CLKID_MST_D_MCLK_DIV	26
+#define AUD_CLKID_MST_D_MCLK		27
+#define AUD_CLKID_SPDIFIN_CLK_SEL	28
+#define AUD_CLKID_SPDIFIN_CLK_DIV	29
+#define AUD_CLKID_SPDIFIN_CLK		30
+#define AUD_CLKID_RESAMPLE_CLK_SEL	31
+#define AUD_CLKID_RESAMPLE_CLK_DIV	32
+#define AUD_CLKID_RESAMPLE_CLK		33
+#define AUD_CLKID_LOCKER_IN_CLK_SEL	34
+#define AUD_CLKID_LOCKER_IN_CLK_DIV	35
+#define AUD_CLKID_LOCKER_IN_CLK		36
+#define AUD_CLKID_LOCKER_OUT_CLK_SEL	37
+#define AUD_CLKID_LOCKER_OUT_CLK_DIV	38
+#define AUD_CLKID_LOCKER_OUT_CLK	39
+#define AUD_CLKID_EQDRC_CLK_SEL		40
+#define AUD_CLKID_EQDRC_CLK_DIV		41
+#define AUD_CLKID_EQDRC_CLK		42
+#define AUD_CLKID_MST_A_SCLK_PRE_EN	43
+#define AUD_CLKID_MST_A_SCLK_DIV	44
+#define AUD_CLKID_MST_A_SCLK_POST_EN	45
+#define AUD_CLKID_MST_A_SCLK		46
+#define AUD_CLKID_MST_B_SCLK_PRE_EN	47
+#define AUD_CLKID_MST_B_SCLK_DIV	48
+#define AUD_CLKID_MST_B_SCLK_POST_EN	49
+#define AUD_CLKID_MST_B_SCLK		50
+#define AUD_CLKID_MST_C_SCLK_PRE_EN	51
+#define AUD_CLKID_MST_C_SCLK_DIV	52
+#define AUD_CLKID_MST_C_SCLK_POST_EN	53
+#define AUD_CLKID_MST_C_SCLK		54
+#define AUD_CLKID_MST_D_SCLK_PRE_EN	55
+#define AUD_CLKID_MST_D_SCLK_DIV	56
+#define AUD_CLKID_MST_D_SCLK_POST_EN	57
+#define AUD_CLKID_MST_D_SCLK		58
+#define AUD_CLKID_MST_A_LRCLK_DIV	59
+#define AUD_CLKID_MST_A_LRCLK		60
+#define AUD_CLKID_MST_B_LRCLK_DIV	61
+#define AUD_CLKID_MST_B_LRCLK		62
+#define AUD_CLKID_MST_C_LRCLK_DIV	63
+#define AUD_CLKID_MST_C_LRCLK		64
+#define AUD_CLKID_MST_D_LRCLK_DIV	65
+#define AUD_CLKID_MST_D_LRCLK		66
+#define AUD_CLKID_TDMIN_A_SCLK_SEL	67
+#define AUD_CLKID_TDMIN_A_SCLK_PRE_EN	68
+#define AUD_CLKID_TDMIN_A_SCLK_POST_EN	69
+#define AUD_CLKID_TDMIN_A_SCLK		70
+#define AUD_CLKID_TDMIN_A_LRCLK		71
+#define AUD_CLKID_TDMIN_B_SCLK_SEL	72
+#define AUD_CLKID_TDMIN_B_SCLK_PRE_EN	73
+#define AUD_CLKID_TDMIN_B_SCLK_POST_EN	74
+#define AUD_CLKID_TDMIN_B_SCLK		75
+#define AUD_CLKID_TDMIN_B_LRCLK		76
+#define AUD_CLKID_TDMIN_LB_SCLK_SEL	77
+#define AUD_CLKID_TDMIN_LB_SCLK_PRE_EN	78
+#define AUD_CLKID_TDMIN_LB_SCLK_POST_EN	79
+#define AUD_CLKID_TDMIN_LB_SCLK		80
+#define AUD_CLKID_TDMIN_LB_LRCLK	81
+#define AUD_CLKID_TDMOUT_A_SCLK_SEL	82
+#define AUD_CLKID_TDMOUT_A_SCLK_PRE_EN	83
+#define AUD_CLKID_TDMOUT_A_SCLK_POST_EN	84
+#define AUD_CLKID_TDMOUT_A_SCLK		85
+#define AUD_CLKID_TDMOUT_A_LRCLK	86
+#define AUD_CLKID_TDMOUT_B_SCLK_SEL	87
+#define AUD_CLKID_TDMOUT_B_SCLK_PRE_EN	88
+#define AUD_CLKID_TDMOUT_B_SCLK_POST_EN	89
+#define AUD_CLKID_TDMOUT_B_SCLK		90
+#define AUD_CLKID_TDMOUT_B_LRCLK	91
+
+#define AUD_CLKID_VAD_DDR_ARB		1
+#define AUD_CLKID_VAD_PDM		2
+#define AUD_CLKID_VAD_TDMIN		3
+#define AUD_CLKID_VAD_TODDR		4
+#define AUD_CLKID_VAD			5
+#define AUD_CLKID_VAD_AUDIOTOP		6
+#define AUD_CLKID_VAD_MCLK_SEL		7
+#define AUD_CLKID_VAD_MCLK_DIV		8
+#define AUD_CLKID_VAD_MCLK		9
+#define AUD_CLKID_VAD_CLK_SEL		10
+#define AUD_CLKID_VAD_CLK_DIV		11
+#define AUD_CLKID_VAD_CLK		12
+#define AUD_CLKID_VAD_PDM_DCLK_SEL	13
+#define AUD_CLKID_VAD_PDM_DCLK_DIV	14
+#define AUD_CLKID_VAD_PDM_DCLK		15
+#define AUD_CLKID_VAD_PDM_SYSCLK_SEL	16
+#define AUD_CLKID_VAD_PDM_SYSCLK_DIV	17
+#define AUD_CLKID_VAD_PDM_SYSCLK	18
+
+#endif /* __A1_AUDIO_CLKC_BINDINGS_H */
diff --git a/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
new file mode 100644
index 000000000000..653fddba1d8f
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-a1-audio-reset.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
+ *
+ * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H
+
+#define AUD_RESET_DDRARB	0
+#define AUD_RESET_TDMIN_A	1
+#define AUD_RESET_TDMIN_B	2
+#define AUD_RESET_TDMIN_LB	3
+#define AUD_RESET_LOOPBACK	4
+#define AUD_RESET_TDMOUT_A	5
+#define AUD_RESET_TDMOUT_B	6
+#define AUD_RESET_FRDDR_A	7
+#define AUD_RESET_FRDDR_B	8
+#define AUD_RESET_TODDR_A	9
+#define AUD_RESET_TODDR_B	10
+#define AUD_RESET_SPDIFIN	11
+#define AUD_RESET_RESAMPLE	12
+#define AUD_RESET_EQDRC		13
+#define AUD_RESET_LOCKER	14
+#define AUD_RESET_TOACODEC	30
+#define AUD_RESET_CLKTREE	31
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON_A1_AUDIO_RESET_H */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
