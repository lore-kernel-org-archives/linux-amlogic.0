Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15997C61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 08:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ab/FpF+AYcRkiDMCeC45PmmmtosJdPg/5ctma0LXTqI=; b=fPmTFJzVGpvMtg
	vuHdyJdd/YRuKHrTnmWt0tezelOWxScZAZ99R9yknApyxIBnIE8GiINCztpobX8Q+mPJAva7+F+vM
	xgIiYiqmVuv1nxTD2WlgnsdW3TkaIFy2SRupBtK4FyZliyGf3fqSNEdWetWLS5vVJSy09R+08XdYf
	iTlHcNIHfUjqey2N9lddwLnL7knKy0saUJbobcO1KFismBJtsl1KXugZ52e/hd4DMcTe3cHO9QdYo
	O2cUQP16ZHBtyo6YPTlIf+OfMztH1Iw6/3Xt2Iebkh8zG+tXTTQk7FXj9ytX7FiIeInjrusmDIWTa
	4+1QSPd/pPmbIKkhG54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6RnP-006ZN2-38;
	Fri, 24 Nov 2023 08:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6RnO-006ZMd-1v
	for linux-amlogic@bombadil.infradead.org;
	Fri, 24 Nov 2023 08:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=; b=WyQvQ2NQMdfFoYQMvn0pVmRSYJ
	9GBOo4k0Wny2XaxtwxAmQM1dalXqn5dAnKbiiIklow87i2MC+RnsW1eqKVVfFcoGT23M4XvwRK6cM
	G/HDMx1WxK90DBD3trU6/QF/vb1jTfnzQ78+xVIoJ1ONAW0M6VPUKS13izBOXMBI/wFqImzpdLu5+
	9q7tKuhHGWfdQvRsTMqk63HOXML4zqs4aRWhvLRNzmEmJjC+WqnDNOsEcIconjR7txl4zQG5lh7y2
	KTJFxq2h/TBN/J7fEVcFxRE1kxpwqXO/MGBBSRZ2LIXhH3arNmWt4fEBGGRboiEoH61shaRZUkDKL
	6CrlFl6g==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rla-00DoTU-1Q
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 08:44:15 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso926984f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815299; x=1701420099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
        b=G22HcYIIfzmdaeMB602h8FAS5rnex64f7wSSkkW5wxR6dFhmYYw3ykw6Ku8MGnMsF5
         PDvnSJ2I6uxtzSVS6WC0VSLhYmEOftgj0rPylG8W+uPqbkMI/1gbXAZReT8zJTcing47
         esAvwu1w2Nn+w42Egn0FIZ37WX4Af+qeXN5WBMIbO5MFrkBzaE8AXML2V35R07rIYI6Z
         pjcheAdS4OmrNF7zPpqdnUdTi0E1YKlbW3VR4FlfzHVTckRWXEj0BsSCPvSvcOC3Lc2q
         yCx9ldAWtB3OwCdLCFvk3zavA6AGpbvaudJAg99Rv45oPjHAb+Fex0ssxGIzoHx0IUbG
         PrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815299; x=1701420099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oTd5W7j5AQVAM1KswlxlUS9UNv/MwhkvP27dPDkrG0=;
        b=KWBn/w4x+H79RaIz6lNgJNTzvwQZ+fwKPj05+hXO3FWeBKCitRT0z8d2Hp18rDVz88
         i71XtaUP4cVoxCAVfgSC5nOqUgwwU03cYbNLhaengBzi2Js5Bn+pgEJfXN8p+Xr11Q8b
         /L0DDhMwxCPgUK5NX88Xt8KZccKkJhAjAziULkAHWIO/mLJiImB7dTFUxIepca17XeoS
         mFMWK/ovxUXHajxOm8KgYp5GHeG73PztzLNLg0iibj06kAvOyyMj57LVPmySxTlo+79W
         ekCPW3yHIClJBRRFfh946AFT52ZvaDvstMgHOGofoFbhEgw+qSTMg6gl/tceSuHcr6Wm
         xGQQ==
X-Gm-Message-State: AOJu0Yx075nRAMGURUIDc+4L7GLkdCDO0CtYd5/7Q6QrAqTCZ8vp6g55
	oowBQHEGsmyy51XaPSnvrK3ulQ==
X-Google-Smtp-Source: AGHT+IFGqKrpRXgPFNo8Nkj0CWSwWM0Jqha5XIccXvobCjVcVPFXEmRnh1JCVbV1DXZZuPNvfqYsVg==
X-Received: by 2002:adf:ea8e:0:b0:332:e697:3a71 with SMTP id s14-20020adfea8e000000b00332e6973a71mr1425565wrm.6.1700815298893;
        Fri, 24 Nov 2023 00:41:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:22 +0100
Subject: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
MIME-Version: 1.0
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vVnkVglKsbgZynNLE29purYGyqaY5Zp+VaoRvt80IUM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGyfllM1YRje8HUcgrMolQ8GmfhPjEmFfKjkobM
 v1z+k2eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsgAKCRB33NvayMhJ0e6nEA
 CuiWO/LKQiz4QcUUBOWcKn2vcKoGaXbd5lgmuGG5W9x6QWdtqriO/sRYcMO6ayXATzZqtJiRrJ3lp1
 J0grDt38OP49YRZmYRmtThzUcW5CUIMzx4g6tVbVlZqS0MBP0WuGjk1RHZCACfubMDJNNxzDtl/Clq
 YIQMNIytm3iQkSd4TzVEG3S8JcisprJ8z839AfEaABbx7CmywmXrsv73LarMB7Keqx/jfYD6GjSKoZ
 hNvIePUgTGDspHspJTTUOX/mGRg7qip5ChOGcklAkHPWR9rnEVG6UMhX8uCQcLPaWdaFv0qOeoIGwR
 xuAvobmfe1vZBRCYf1jVFGRPMQ9qrLRYJLhuSyhgsEyC4k8Ml0ie9/hsqj1skwDjlseftk4MFKL1oS
 +frlZ5e0rEllrMSSMzZhx+uYNLlSzvD8b9dKfZipNXDMGAyd11BjTnU94l6ZLwolrqCLD45vXz72OI
 5aZvoE4Ac0l3Tf81K+wwtFRiUC4LlEf7xozrhbbx5GCZyt2h5CeeFx6KIE3bP+sgmSOMbil1E17fxH
 U7qsAyLvAXhyhLW2X8Obi0C0uA5AW5LsXQMl8EmJjGLJyomUa6t3yg+N1wmw/13o4YHI4atFZkeEVJ
 dMoLfwx/8UEWlRW+o1BjZ7ypcqv/xxXHTSeSthG4zknnIYHEcgqYHlFTOkTA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_084326_690943_8B4A8B04 
X-CRM114-Status: GOOD (  10.96  )
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

This add nodes to support the Khadas TS050 panel on the
Khadas VIM3 & VIM3L boards.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
 3 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 16dd409051b4..81c3057143b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -98,7 +98,7 @@ &pwm_ab {
 };
 
 &pwm_AO_cd {
-	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
 	clock-names = "clkin1";
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 514a6dd4b124..aafc37863f2e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -40,6 +40,14 @@ button-function {
 		};
 	};
 
+	panel_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm_AO_cd 0 25000 0>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <200>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -358,6 +366,23 @@ rtc: rtc@51 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	touch-controller@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <66 IRQ_TYPE_EDGE_FALLING>; /* GPIOA_5 */
+		reset-gpios = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -365,6 +390,55 @@ &ir {
 	linux,rc-map-name = "rc-khadas";
 };
 
+&mipi_dsi {
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
+&mipi_dsi_panel_port {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+};
+
 &pcie {
 	reset-gpios = <&gpio GPIOA_8 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 9c0b544e2209..cb52a55ab70a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -76,7 +76,7 @@ &cpu3 {
 };
 
 &pwm_AO_cd {
-	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-0 = <&pwm_ao_c_6_pins>, <&pwm_ao_d_e_pins>;
 	pinctrl-names = "default";
 	clocks = <&xtal>;
 	clock-names = "clkin1";

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
