Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765EBCD1296
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmiAQcSNGxPL0zt1jEejWGzBiOjmHipdffWsQogqOFU=; b=TJyUwzE6wX1CFD
	H3TAN+I8aRTraoBtTaatr6x0lH8Yqch4bR4lJfEP5VPwV1nWC2983CaauHWIJqfxiOv2w4xG3OUS1
	49ZOM7FHtjjZGp6FS+wfWT2hIdoyxp4d0uEATjkXaHlFh6omtSZl/bEIUiPNLMVEqHsBHfC8wJjEo
	9eOj8o9kehGdwpNxw7WzW/ip34H9myBqlYTfkfAt3IdjdGkOrhYYqazW1cchak4wh4Xbj1bIhRgS0
	PbiRdlGG1/Zcsot0srXDKWHOCEuUyTVAgtQldtyKz7pt+spHVUryNP9R4Vzs4fF5T/y1yvpSNuTyZ
	MfBVS9Garl6pVrXPmteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvL9-0000000EdOk-2YGe;
	Wed, 03 Apr 2024 07:47:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKb-0000000Ecs7-3kS1
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Apr 2024 07:46:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4162514dc22so343365e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130408; x=1712735208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlefNTpcno+kopU3CV8j4XCd6YHAdWq47c6Zt6fbGpA=;
        b=urbD5/eFpcbGj0l1buwcZhJ/WeiDp3Suu02FUB4SO0nugKbetP3uQZRZfuhv8ujeCQ
         eYIOfmK36oPwZJhaJa0ksSrFckfEDN0tm7SPWSike8BlBBnHPlV/nDypyUW0dKJKtcbe
         HEw3vhpRD45SQkftjNn+68opEKA6GoZ3PE6KY6mkkp8mvzGBP5EnnQAhGRGoNx+XzNY5
         OLbiPZBbx77Yhb+qiwSNH/hHWKh4kOvTlnU6AwEqten/g6T+Vc9nThPiD9DtPchRp1HZ
         FI5UyYv0+yXqNPJ9fWOmV9070ci8euyreV32U+/W4SwYjJHywQ4dIFzaxGXNiiG8Vi22
         Gq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130408; x=1712735208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlefNTpcno+kopU3CV8j4XCd6YHAdWq47c6Zt6fbGpA=;
        b=QUqjkDvxq5UjpMmVs60DaTe12UC1BsOSagi9GAk7IgXCxE/L0thmfCvwTKVFSMrvuP
         U2SPBAfQTk/G62E0hrBJqI5siSCaDS2xZVMsWunRYVDWaaqqa+pl0bQn6nXEr72X0rlM
         bA9EXrY93Hc+vFhu+xeArrCO4G3hbcC9CqC/VFQwTJC5TuivQAFUTFb9dGuV89703ln4
         W1Zsk2Ji2VL/V/86Ltwc/uHegn/m36ywVtwTTd8NSnR3pArc5CzivR2RtX+FasApjQA1
         DYWpov26v+BNVDqpWjbvHM95+X0CmLYsZHogM9WnC6T9KL7cosSShLKvqB/6O3wh+rOD
         K7Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUfh6j47w6fFUM0/YdXYBNb0aDAPsEy8XkzK2QrRIrO0RqoUWnqzrbKovUEz713Ipq8R6bhujQZN7A3sEw+S91W2csLgULKf1Oj93B1ulJsqbo=
X-Gm-Message-State: AOJu0YzAF8lAvgjOIhfLGbA/tAo7EYAUGR91+Q+7wogKu80d5QgdFvPP
	bOP9M6uoOVWEl6fqde8z8HMWhmB2XnqMj/xAk6Mzs+F9v+oJ//2DCn1oWu8L1XI=
X-Google-Smtp-Source: AGHT+IFQv382VmYPD5j91Mya5r4hsTGsyVc8h9rvI/IMpsbaGRq3DXOZt0hCyHTKcQk4M9Gorgnetg==
X-Received: by 2002:adf:e2cb:0:b0:33d:277b:8bf6 with SMTP id d11-20020adfe2cb000000b0033d277b8bf6mr3248660wrj.26.1712130408189;
        Wed, 03 Apr 2024 00:46:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:37 +0200
Subject: [PATCH v12 6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel
 overlay
MIME-Version: 1.0
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-6-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4794;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YrJTPnUe9FPoU2LtM/HkzNX7hKrbNF/TaoEsO6yWogM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQlfa2VZ14f0jFHdpB7He77oInOEMhgaYnEUmXYJ
 51U/CjOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXwAKCRB33NvayMhJ0SH2D/
 0ZpDRTw78r/0Rr8fNdV5YWHxMsOgegpQt0H6vhrGq6o6go3kSJROSrM4dROt6xiYN6QhQsC2mdas4C
 yDM5LfQBhMykFQNmMml2799R/ZkB6QApSAamDR2eovuXV0DZVdW3wTMR7QkWA7sojddvh0JAeB/qQe
 n7+4c0fEz3556oL8WAJ/+R4zA63yfMVslnFt8fg3oEiG8oEiTWfpFSwQDZaEgXqGc1iay6Jp/3cvMM
 kKZW/O5uN8/kvTohrcK3pkuY3KNGe5o2Oh70qCRmYF7c2NJGkZH1DuH3/g56yBUCGks131eEjFkFmO
 mwBDQ890W4ZmoFcwGgYcsxYgQWHPZtW05MJtyNSfZKPiRRoBAlgFo2sgNId6AO1BxRB/tdDcWG9vDA
 VjM1+m+xQU4ATmuS9WrBLmlaWqHBVdslgBrQibvRmIr7YQzI82ntazynuDDTKYAjLupW9QSkuetqoD
 KMdJox34YjLgY+/k1EGQU+ZTxX86KAHRNa3QhiwvmIsQpgrOtoLNfCZOS1KkLvZwgcW2qZ5NCNZShc
 aK6uldqttviVZVTQZOI+4cy+xkO+hqlx+cJu++ddKFeoJj1HCuJvDNCG5/uGYobyEaoDsV6/5NkZDK
 g2TNi7CaEynNdKJKsTtZKTHkTwZF3kHIA9QGtzh2L69wKygoy2s9ZGbDHaxQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_004650_122821_F2E7CDAC 
X-CRM114-Status: GOOD (  12.05  )
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

This add dtbo overlay to support the Khadas TS050 panel on the
Khadas VIM3 & VIM3L boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   4 +
 .../boot/dts/amlogic/meson-khadas-vim3-ts050.dtso  | 108 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 1ab160bf928a..0b7961de3db7 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
@@ -76,6 +77,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-s905d3-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
@@ -86,3 +88,5 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
+meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso
new file mode 100644
index 000000000000..a41b4e619580
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-ts050.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/g12a-clkc.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
+
+/dts-v1/;
+/plugin/;
+
+/*
+ * Enable Khadas TS050 DSI Panel + Touch Controller
+ * on Khadas VIM3 (A311D) and VIM3L (S905D3)
+ */
+
+&{/} {
+	panel_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_AO_cd 0 25000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <200>;
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touch-controller@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <IRQID_GPIOA_5 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
+&mipi_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	assigned-clocks = <&clkc CLKID_GP0_PLL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+			  <&clkc CLKID_MIPI_DSI_PXCLK>,
+			  <&clkc CLKID_CTS_ENCL_SEL>,
+			  <&clkc CLKID_VCLK2_SEL>;
+	assigned-clock-parents = <0>,
+				 <&clkc CLKID_GP0_PLL>,
+				 <0>,
+				 <&clkc CLKID_VCLK2_DIV1>,
+				 <&clkc CLKID_GP0_PLL>;
+	assigned-clock-rates = <960000000>,
+			       <0>,
+			       <960000000>,
+			       <0>,
+			       <0>;
+
+	panel@0 {
+		compatible = "khadas,ts050";
+		reset-gpios = <&gpio_expander 0 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vcc_3v3>;
+		backlight = <&panel_backlight>;
+		reg = <0>;
+
+		port {
+			mipi_in_panel: endpoint {
+				remote-endpoint = <&mipi_out_panel>;
+			};
+		};
+	};
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			mipi_out_panel: endpoint {
+				remote-endpoint = <&mipi_in_panel>;
+			};
+		};
+	};
+};
+
+&mipi_analog_dphy {
+	status = "okay";
+};
+
+&mipi_dphy {
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
+};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
