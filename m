Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD60C48297
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 13:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L17Oy1JQymii0PhUWOVN3AtdW9/I1eLSm+N06ye3Ggk=; b=RnFPTYyvWNDcTt
	0jJ6B8lI7TuPz3LCfceM6dVvK2rZilSBqURQjznrZTqipv0gzqIWihymMZejiXn2rSH6LP3sinO2g
	G8T3dcObwixsf9JtLYWJk74iAWFHJ7+/HAtYgTbRwngI250RrBV1c/J90CHsJ1jk3qRQrd5ceH3vR
	nSqegNofp8T/jZq/bdeI76GNYXGISkhYoa8TWdlYXpaDgIYo5y7kiC+gItPTIq07lKTDu/aGZAE1p
	rAxpyAXUx8FSEbzZmTMuLkglyZ3IGmjQaVa6ztyjctwu8zb9Yp8mJ8UR88tB4uO3z7xDvgcDCBbza
	Q4jQGEmBMx1he9ixnC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLFn-00000007fnt-230P;
	Tue, 06 Feb 2024 13:12:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXLFk-00000007flh-1FyI
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 13:12:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40ff0697271so1972955e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 05:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707225160; x=1707829960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Xmtu51CH43lv5RbIIA0xbROaSGhC1rrjUBAlY04HFw=;
        b=df0sdNd7yjnETPFIHK3uQHFu3qUWLst3dMOf2K4Rhjxfh/ImponKqre2+mboK59vTk
         u3ghI4oOo4D2fmhvhgQKICOzlQzrRarkI5HCNonSBU8X4Dye08zONl8Wdsq5k9SY+igR
         eJtsrd8IDDTq/6yl0u7IiidezDOvmdnUi3f0cKraaG2guq1aOmeMocytZ7Oy2kJKT6Ao
         MeYPF0PWNlsAF05tdAHiaDRziiHWpkoavzH67XO2wOolCdLi0Gh+LzOW86YepKoHn+hc
         7CuxNlLENzoGz6tx9V0/Xh71iSeHYftwMYhmhk+fkwNEgfZV+h3j3h3jHZ72G3MnMk5x
         cb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707225160; x=1707829960;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Xmtu51CH43lv5RbIIA0xbROaSGhC1rrjUBAlY04HFw=;
        b=ULxdxg7IWqbBO5mpOYp1qHQ7BI+LPSCLSFQEio207yttNjulnN8+UQ5ag6vXhoVXFd
         kJhqYnhMsd7cCKGih8VMYSeZmf74D0tcpmxOAjVZndnowUhCt/qQX6JdpEm+Jb3L+efk
         QGJ1e47OYuEaH0XntMyrbxVm+3By6pMaIV2lZAbs3L8qXOsJD1HYrAIg3EzryeaU2oGj
         dkZynWbn3RNIad/yX+z7owF5rW/H1Y+vLeWbX2WhJX5B8HEd/5bBSLXjHcJcESqC4uDA
         sORhq17oxiczs9bGMVc/IPx2rdW8PL3sr21vat7CO8i/qCMU6Sb7N7CEBEPZej+K8pIQ
         kvhQ==
X-Gm-Message-State: AOJu0Yzqod/BpsPLKnHnJ7fdjOHx3Q5RbTc7hsrpsb6HRj4/Xe/ugmaS
	TSM5s8PP1BwZ2i9PEuwiAFtb/b+RJpykRzPqjipzzCP5hCGXx7zX5hMtudW+SqNrDvQO0a/rsTA
	m8Ic=
X-Google-Smtp-Source: AGHT+IGuvwj26ml5Sm5ehnGX75WijMzMJnLzFlpSZENm7Nc+WFFCTEcfyH0s3fGLQcFzu8lPMZfIog==
X-Received: by 2002:a05:600c:3d08:b0:40f:e067:d685 with SMTP id bh8-20020a05600c3d0800b0040fe067d685mr1830918wmb.13.1707225160332;
        Tue, 06 Feb 2024 05:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVnI5MhjwtX6un9z6/QSVXb1n1fi21+wKMPM8mm2+RYThtr4VIVrAXqKbJ99F2eSa8wGSU7QnB7xWp6w5sq9sOwvHUNx4b3se39f6vdp7wZaN29SvrILP5N1IsmXu+rtCS1Iw5WHrV7xTh2QIYLiUjrRi851j4699ZMFSwPVHihc1JFu5E1LAQG4QrtvFxyS6HrqQpJ6FSD6bYpNfSFsoFKzz8WvfLAMkhG+4GH7rrXMB2UasryzbLirmNq6+3gvq+NvGpYMNvBkaQ9feCveBZ/1QdWN0EGPY8TfKSvuj90AJxipF4TZC8BUDHa4Lz4f8DxweV8Y7NyM7fCfDd0Xc0qh8sTRvGn3QMqp8nKIXjPqgo=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040fd3d8ce5csm1957518wmb.16.2024.02.06.05.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 05:12:39 -0800 (PST)
Message-ID: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
Date: Tue, 6 Feb 2024 14:12:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_051244_631958_7BB5CBB8 
X-CRM114-Status: GOOD (  13.44  )
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

From: Pierre-Hugues Husson <phhusson@freebox.fr>

The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
and the SEI510 board design.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
Request For Comments to spot obvious mistakes before formal submission
NB: on IRC, narmstrong mentioned:
> adding dtbos for variants seems to be the new preferred way to handle such case
> the fdtoverlay utility works well for this case
---
 Documentation/devicetree/bindings/arm/amlogic.yaml        |   8 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml    |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                      |   2 +
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts    |  30 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts |  23 ++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi        | 465 ++++++++++++++++++++++++++++++++++
 6 files changed, 530 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45a..2d9cce35d6f1d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -150,6 +150,14 @@ properties:
               - seirobotics,sei510
           - const: amlogic,g12a
 
+      - description: Freebox Boards with the Amlogic Meson G12A S905D2/X2/Y2 SoC
+        items:
+          - enum:
+              - freebox,fbx8am-brcm
+              - freebox,fbx8am-realtek
+          - const: freebox,fbx8am
+          - const: amlogic,g12a
+
       - description: Boards with the Amlogic Meson G12B A311D SoC
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db47..4f5a1f4e6689a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -500,6 +500,8 @@ patternProperties:
     description: FocalTech Systems Co.,Ltd
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^freebox,.*":
+    description: Freebox SAS
   "^freecom,.*":
     description: Freecom Gmbh
   "^frida,.*":
diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index cc8b34bd583d8..dd99ee3efec61 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts
new file mode 100644
index 0000000000000..1bf39d2d1eeb3
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/dts-v1/;
+
+#include "meson-g12a-fbx8am.dtsi"
+
+/ {
+	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
+};
+
+&uart_A {
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+		vbat-supply = <&vddao_3v3>;
+		vddio-supply = <&vddio_ao1v8>;
+	};
+};
+
+&sd_emmc_a {
+	/* NB: may be either AP6398S or AP6398SR3 wifi module */
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts
new file mode 100644
index 0000000000000..dc268b8f5d169
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/dts-v1/;
+
+#include "meson-g12a-fbx8am.dtsi"
+
+/ {
+	compatible = "freebox,fbx8am-realtek", "freebox,fbx8am", "amlogic,g12a";
+};
+
+&uart_A {
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
+		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&sd_emmc_a {
+	// No explicit compatible for rtl8822cs sdio
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi
new file mode 100644
index 0000000000000..5e98d0cd61998
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dtsi
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/*
+ * Codename for this board was SEI530FB.
+ * It is based on SEI510.
+ */
+
+#include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "freebox,fbx8am", "amlogic,g12a";
+	model = "Freebox Player Pop";
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		/* Physical user-accessible reset button near USB port */
+		power-button {
+			label = "Reset";
+			linux,code = <BTN_MISC>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	spdif_dit: audio-codec-2 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
+	aliases {
+		serial0 = &uart_AO;
+		ethernet0 = &ethmac;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
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
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	ao_5v: regulator-ao_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "AO_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	dc_in: regulator-dc_in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	emmc_1v8: regulator-emmc_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "EMMC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ao_5v>;
+		regulator-always-on;
+	};
+
+	vddao_3v3_t: regultor-vddao_3v3_t {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3_T";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+	};
+
+	vddcpu: regulator-vddcpu {
+		/*
+		 * SY8120B1ABC DC/DC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		pwm-supply = <&ao_5v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddio_ao1v8: regulator-vddio_ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <10>; /* required for 43752 */
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "SEI510";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-3 {
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* spdif hdmi or toslink interface */
+		dai-link-4 {
+			sound-dai = <&spdifout_a>;
+
+			codec-0 {
+			sound-dai = <&spdif_dit>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
+			};
+		};
+
+		/* spdif hdmi interface */
+		dai-link-5 {
+			sound-dai = <&spdifout_b>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-6 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&arb {
+	status = "okay";
+};
+
+&cec_AO {
+	pinctrl-0 = <&cec_ao_a_h_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cecb_AO {
+	pinctrl-0 = <&cec_ao_b_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu2 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu3 {
+	cpu-supply = <&vddcpu>;
+	operating-points-v2 = <&cpu_opp_table>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&spdifout_a {
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spdifout_b {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+};
+
+&pdm {
+	pinctrl-0 = <&pdm_din0_z_pins>, <&pdm_din1_z_pins>,
+		    <&pdm_din2_z_pins>, <&pdm_din3_z_pins>,
+		    <&pdm_dclk_z_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao1v8>;
+};
+
+/* SDIO */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	max-frequency = <100000000>;
+
+	non-removable;
+	disable-wp;
+
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_c_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_c_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_8b_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&emmc_1v8>;
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
