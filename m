Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE19C54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFzgdhq3Zo54C69MkvTQPPSKXhFRcGYM6MbdEsUTdgo=; b=0orgcP9HGi+Ke2
	LoxXHmPtXgEIa9fREIUAGSKTWyVCIQ/vOrHHRO85FRcURVRgIhgJ6EYFN/fhPUjWmCT2MSeLpVx8S
	CQum/xA7nCwqYumbNZUTQj1rVCj/7vGBmaMwUi8CZANSoob4aENBiCR/4vX/hYZiIY6UPDw7dFdW5
	Qb8UQLCKUEiYo0G+V8r9o5+To9nQF/Miv02ScLt7c+rsfT0Ce7kztk2uEX2qq3GbBF1foOKuPrrq+
	P7H4N9tk96geznBNvOfKkaVOuTH7djdlgHSsqEbuFUZXrSxrNA4I9BAod3ERwHkXLwwGB7DbViyeH
	mv+mbr1NKnttTih0V5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiE1-0000000Gxc0-179q;
	Mon, 25 Mar 2024 11:10:45 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDM-0000000Gx63-1a7V
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:10:09 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56c01c2e124so1714518a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711365001; x=1711969801; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7W38VmP7/e4MBZ92EJA4Zfd+sy54HWNOPkuchga6kY=;
        b=gWY2ELTPDHU0MtPgE9oqIqHTgQUaSz2SIfAo3WUbmzLmpwhP4xtUMtqPMBapv7mQrk
         ISuppS6BeFF2Bz4mrC7fBSaDERrNWGDmijazqjjYbiv3i2e83wCZ54H88iZfXN7M8FG9
         cnl6OnqtUxT/YuyKTgtt24XzyqBVJG2Hpq6J/1OGyRmOVJ6jzEWI+0ZTWUtU71UaCJ4a
         qKg+2BWgp0g0cpWX9VrnrLKQWjHyszKzLMjE+OxO4vESepQ8NP3g5S9BMoW/FMvdEpzj
         MdqnbmAhdBYaE3ydoF8B4VVXxFJovk1C+W952gjCtZmxC4f+r5kWvsA0/zXRpZQAxspx
         hV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365001; x=1711969801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7W38VmP7/e4MBZ92EJA4Zfd+sy54HWNOPkuchga6kY=;
        b=aaKXJ8JmChmsPG0l3F606MJFLZyhdc2NLduLgp9RdOZfwH9T2RaQT3r442MSSPsCzP
         vTMAWVG7zFpweCMW9U77VzlTZ3l2AbL6Z+K7GDPvCvTXfdlE2RbrjZUiUfE6o6tTDGML
         kwZiD315d4w1Kcv1bl3aiWaOeGmvWD4obb/b4pfNvGjOBVC9nBdJYoJqOMpqB7SgwXZc
         AR4nHOA45HAfkUM1AUU7GWSzwTrWtNugdX/pW+J8kLvuJlYGtZcLc2pK/t6ESV/W4eIt
         r0oNUEAKdS5aiDeqrlvfhL5/FYRu4xVZp8iYG7U2tbVVmNv87BK85urUK1EHCy2MbbKm
         UE0g==
X-Forwarded-Encrypted: i=1; AJvYcCU7hrgjWPuFAR2tZBjlH5bw+YQqIfvJyyM5uitDscp2/bZWxR/JWN+l7e++qMkcrRxH/GLBOjNvZdUK/qj/ALai/l4Q+tmlFc13SKleiboacuU=
X-Gm-Message-State: AOJu0YxQ29nb+loXG1zggPoaqxGvKuoBx2e96ieYCItbYzad3RTcPwVR
	KelXtTXAaDap1dnfEIDjhCkA65Q0yq5y40lG+VzpeqaEYNq+sKvJlytbSqS6IqY=
X-Google-Smtp-Source: AGHT+IEPlE5wlEOBrrfeLeRdqlriwGeJRzwRxhp3y28W76Dldron5v6PO+aomL64zP6PI8UYC+onkg==
X-Received: by 2002:a17:906:5d2:b0:a47:3664:1b98 with SMTP id t18-20020a17090605d200b00a4736641b98mr4522356ejt.7.1711365001216;
        Mon, 25 Mar 2024 04:10:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:10:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:52 +0100
Subject: [PATCH v11 6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel
 overlay
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-6-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4784;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6uoQ7q0WSGnRt1wBGi5MUg52iZBFGMzXkF4qZ3FVLw4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt+KC97SPDDu3RkrChahtz+MaFhLx+y6cpmnP/r
 yEoIl76JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfgAKCRB33NvayMhJ0QgWD/
 99QIn15ghruMDJrG1lUSpBBX6QaOn22B13J7xaUA8rqEKGJDCltIR8b7h8KazDtQ0RmwikwQ8VU2CZ
 onmWOX6O/AU9aSjLIcCk8rWuBsVGWcrqzxqQC1M5k+Rp/jTJslo12EXW6boqch2bqIhCThpMbGchK1
 hGctvw+38gioc9lEkAXfGfXdgLC9kFBOOJ6k3K3jPCp5tzQDZxeE4CEpvFRaik6xsQP0a2KGyAxmA7
 50KowkJenrqE+TusyIycuSdsxTrPcSU6C9VCjZyc76S7mr4Z8zaKQZjul20YV7UjxdIrJqpPZ+zYvB
 gaKdMvg+7EDa7o95nzeKgcmBgn6UlxHSXSHtdFkjS15ZYaPsk/RCgxBBfOPn1XPx7/9WleZ/baUCmu
 4O3H/7J1qidmIRl1XvEfmv2JvGsds3vMT/jnaE2j6EUHuIVp0xsJREsqN/Usve/2jImMcXSntVhZv4
 7oPSGdsmSW1z3kA40G37Mtqo6aXlMpcijXTb78FGLd17IB+cNoS2Q0fiOSkiSs2AxctT2GEj8frfsg
 HGCvm+m3maVIeHRGWhcorzZEoBVE9LVgXxpMM+dYzkBV5jSugiWmYDSBwXOMVrrfk4513BxI5rBVe5
 kLsfpiXpkwVOqXTklmnRxUtLfhG+ouT+nODIa1Enlird2/+lYDRABqMb3vOQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041004_753009_8312443B 
X-CRM114-Status: GOOD (  11.95  )
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
index 1ab160bf928a..bf723bec3e15 100644
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
+meson-g12b-a311d-khadas-vim3-ts050 := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
+meson-sm1-khadas-vim3l-ts050	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
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
