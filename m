Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3B1C77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVb3P6K5uchkQ9/eH5tGck7GRT+R0yvMLZp6h2lyL2U=; b=2NwN+H3ItwuxUK
	i1PZ2VOxiCfHuvRKd5kT0exy+RsvzrBMWv+fRTvEAoVQVXY0pHPmaOqRxw41I5SUtDst3KAjLohcQ
	b35xPwASd1eLlUGRG8AU/Kvm7AuBpcjHQyMZV7dsqnGdPZ0jAcVQSDzut5pcflqvyu4eCd4b6hlTg
	ESIbZR7KMJ9sM+TO2BuPuXel0DqBQrWuIcCflRNpPcY/zorz8Cpg1FieawI+SvoI3LKsL59yF9Igd
	Lhvnu4S21aQpVFjhjIzPkHgxBLUk66C0MHNtSba8k7d3EsY1cTguP+EBJTgH9XRUNiov7K2126B8v
	ZOb3/xsFLN4uNTYYvoxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plxEa-00Fq53-2F;
	Mon, 10 Apr 2023 19:31:24 +0000
Received: from new-shark9.inbox.lv ([194.152.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plxEY-00Fq3q-24;
	Mon, 10 Apr 2023 19:31:24 +0000
Received: from shark4.inbox.lv (shark4 [10.0.1.84])
	by new-shark9.inbox.lv (Postfix) with ESMTP id 837E7480813;
	Mon, 10 Apr 2023 22:31:19 +0300 (EEST)
Received: from shark4.inbox.lv (localhost [127.0.0.1])
	by shark4-out.inbox.lv (Postfix) with ESMTP id 6D443C012A;
	Mon, 10 Apr 2023 22:31:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1681155079; x=1681156879;
	bh=miNEljtw4Ih5EnxwsyKCLBaniG+8hCUyr0BGdybkaFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=Xun2+Vc3HphONYdVd2obOjGekwLSEw5rIeQM+whKRfo22dNJQ3w3JMfhnjhQKdnjB
	 SgURNEtvG33NgXY5sSvRKtt1nUE7+vvgihemtLdgDMai88vDJAyTFjkdOiyKMhbfU1
	 7z0Jvca4Gnp0CdfadcMysiAHSDKvqh1D3mEXxgWA=
Received: from localhost (localhost [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id 61576C00D5;
	Mon, 10 Apr 2023 22:31:19 +0300 (EEST)
Received: from shark4.inbox.lv ([127.0.0.1])
	by localhost (shark4.inbox.lv [127.0.0.1]) (spamfilter, port 35)
	with ESMTP id Z1xo4hzM9xN9; Mon, 10 Apr 2023 22:31:19 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark4-in.inbox.lv (Postfix) with ESMTP id D80A5C009C;
	Mon, 10 Apr 2023 22:31:18 +0300 (EEST)
From: Karl Chan <exkcmailist@inbox.lv>
To: linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Karl Chan" <exkcmailist@inbox.lv>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v3 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mibox 3
Date: Tue, 11 Apr 2023 03:30:48 +0800
Message-Id: <20230410193048.31084-3-exkcmailist@inbox.lv>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410193048.31084-1-exkcmailist@inbox.lv>
References: <20230410193048.31084-1-exkcmailist@inbox.lv>
MIME-Version: 1.0
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGU1y83GUJgVh+7lx9+tVFkkoy750LUx9RAqu7LDr7wBfW6TE4TmHAC6dWLD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_123122_837476_A554254F 
X-CRM114-Status: GOOD (  12.24  )
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

From: "Karl Chan"  <exkcmailist@inbox.lv>

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
