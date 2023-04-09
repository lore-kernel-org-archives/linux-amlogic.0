Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F20C77B70
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:From:Date:Message-ID:Reply-To
	:Subject:To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V9hFECwaZNzAG4vF6Q7WEbgtFXG4qR78ur119/p7I4M=; b=3Mw3PKfMk/mtwE
	InO8290DItF6Kf59rPGBgj+8nyWMlmlqaXynhV6nHI6RpSQjDvPhfNkTUAhVb+12O0Tj48lbg6Upb
	lP+3cDpVPd8g/CtnFgS4kM3IWVk8rZMMTeO3L9xu47h/xnc3z+ythsyV5vc4irTT+DlRgRdtORVGp
	xlKlGRAAXh8thNYqq3AHdq8WDwZkusvBeTzFvkPbFZOxLzyxKiNU6FOMhD+CvnlzeIyoi2oYGHCo+
	2nvSyvuXUV4c2VW0xbCkv6RDkP5IrzLmaOFE8/jv295JFtnK8LcwcdWhHGAVOiITFUy35KL2tCLYG
	24JCQanHN5+M49Y/eQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poJUD-00FEMt-2U;
	Mon, 17 Apr 2023 07:41:17 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4iE-00GKP7-0I;
	Tue, 11 Apr 2023 03:30:31 +0000
Received: from shark1.inbox.lv (shark1 [10.0.1.81])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 91845480ABE;
	Tue, 11 Apr 2023 06:23:29 +0300 (EEST)
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 8137511180A1;
	Tue, 11 Apr 2023 06:23:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681183409; x=1681185209;
	bh=7IX2qsbRI4gE5LYuK82dJ+5Zag/ABMQEja+9Q6fn+vs=;
	h=Message-ID:Date:From:X-ESPOL:From:Date:To:Cc:Message-ID:Subject:
	 Reply-To;
	b=mgCSR+w1aBsBXweAhMMXZHT+dIsAFOnaufmP6zwVgMCo5CIfHvjG8SKva7A49Znma
	 6rnXlWRdzKXT1MrLMJ2lMO3P5MCkOgcUsOqQlgtX0qXZXh3XrEsNgkkXLYKpyyv5xD
	 C7DRG9JQyXSQmfewPtUdWQViXtA0djYeUxyJIlT8=
Received: from localhost (localhost [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 79D231118062;
	Tue, 11 Apr 2023 06:23:29 +0300 (EEST)
Received: from shark1.inbox.lv ([127.0.0.1])
	by localhost (shark1.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id 4n2XDIq9k83b; Tue, 11 Apr 2023 06:23:29 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 29DAC11180CB;
	Sun,  9 Apr 2023 20:41:57 +0300 (EEST)
Message-ID: <cbe0eff176121c97a4526e63e455ac6f.exkcmailist@inbox.lv>
Date: Sun,  9 Apr 2023 20:41:53 +0300 (EEST)
From: exkcmailist@inbox.lv
X-Virus-Scanned: OK
X-ESPOL: G4mEQ3gUh3tFv963KJpk5v+XtdvLLUZBySr7yLUw4HdbtbTAr60LfS/KW4Xze3G0c2PD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_203030_290365_1A0012A8 
X-CRM114-Status: GOOD (  10.67  )
X-Mailman-Approved-At: Mon, 17 Apr 2023 00:41:16 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From 767d273664e434a6e6975f40d63d3489efd98abe Mon Sep 17 00:00:00 2001
From: "@exkc" <exkc@exkc.moe>
Date: Sun, 9 Apr 2023 21:04:36 +0800
Subject: [PATCH v3 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3

The Xiaomi Mibox 3 is a TV box based on the Amlogic S905X chipset.
There are two variants:
- 2 GiB/8GIB
- 1 GiB/4GIB

Both variants come with:
- 802.11a/b/g/n/ac wifi (BCM4345)
- HDMI , AV (CVBS) and S/PDIF optical output
- 1x USB (utilizing both USB ports provided by the SoC)

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-gxl-s905x-xiaomi-mibox3.dts | 142 ++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index ccf1ba57fa87..774e7c3638bb 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-xiaomi-mibox3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts
new file mode 100644
index 000000000000..2674c3a38502
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-xiaomi-mibox3.dts
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ * Copyright (c) 2023 Karl Chan <exxxxkc@getgoogleoff.me>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
+
+/ {
+	compatible = "xiaomi,mibox3", "amlogic,s905x", "amlogic,meson-gxl";
+	model = "Xiaomi Mi Box 3";
+
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&hdmi_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
+	cvbs-connector {
+		compatible = "composite-video-connector";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "XIAOMI-MIBOX3";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
+&ethmac {
+	status = "disabled";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+	hdmi-supply = <&hdmi_5v>;
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+/* This UART is brought out to the uart pad on the pcb*/
+&uart_AO {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
