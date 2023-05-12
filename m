Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B43FC77B75
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 May 2023 13:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmZ2ydP2HO6Lq1zGAbsrQ1eDtMbDG5xr4DiBfC+AQHU=; b=WFhy9RY2dbuTDX
	v9grNf7SRSg7GYpHJIqdawCq2qhPvhcEj9O+q563Lc19K2FWo6XhCYN5mNvZlJ7NYFlx8cclJLJV0
	+jPRF5pZjv4n82lSpFOPwDrWIUiOZQn9aaWpuS0Bb9o9MOHvFVXKZZA997KLjIYmO4qs9xsG3QPUo
	bBM0diZ4+Clr+iZWxnyuREwRMRdsa7uvfoLErFLbDRookl/zhpd/iQwh3pLMnfdNsYqyxWALstkWX
	lJ52f/Zl7DcWjil/XVeDIe/JphGjKRW78Tvgy9To5uCxZuF7AmEhDg7Rhe+//fQR4zbaJZkXJP8a4
	dxkVY+/TLy+WlZOMImCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSny-00C1eT-01;
	Fri, 12 May 2023 13:27:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxSnw-00C1d4-1J
	for linux-amlogic@bombadil.infradead.org;
	Fri, 12 May 2023 13:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=; b=XtGsHWm7IQUdofiUK78KGwhWn6
	HCu66PIAuCQrnyYKhT32vzv3Ln+TBsM7g/gFLyIR2p04SIQ2CZmO5LMPlxHslLrVQlMb0iuB0eLGu
	JaLh49KA3U8N6QebWljUHOl8x1VD53FaemqGyDeo+vpgbX4wD3KHfw3KX7llacTHHbZFeq/wzLapa
	PlG+jEyRP40PIRy4Ze00NSQ2GOueH/rkRNLCS2WMZ50gfeDDV0/OoWmjj2tOFrGlSPasR6exsf+3p
	7SxzpvWOsn0KwS+Rj9juKzu9Ac1ggmRDmGFEA8u9lhZTBLldu3fspUBa01IqbVB5hRbBeWczPTUHy
	S0heshSw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pxSZ7-000idG-SC
	for linux-amlogic@lists.infradead.org; Fri, 12 May 2023 13:12:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f427118644so57716925e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 12 May 2023 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683897128; x=1686489128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
        b=lpgmCeuxFHaO5PM3wj0Vdck9igzRlYYXCBFUAK6dpnF1ra4nWOu4PoWirWsS+ju1Ij
         SOx0ldklf7uvM59kgruFdBv+mTz65a5+lXHl3mPzydEOkxyamOvRO2dL5S3xyfBytHQ+
         NJqywVIz0Pd7nATqSDTH0XJa/IP1h+Obvr48anolsJJwIcNjmwyNWv0O6TeojB+CbUi9
         MvNlp5wMXSt3q1UQrps2ymAsvju5hvWHPE/2yDGH70slOxiCDJlnZoqXZPM88rZoiyxW
         2pynMiCG4XHmNUDEsN2CaPco9yFFoWCUFesQMHmrAxlLKJpxQKEzkPT3amuYh35iP2e/
         pgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683897128; x=1686489128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
        b=cy6D8m0NjlPI3tcgkFinTTxT82uKS1X7hSaYYQ+GAwhMoWYmi8egbJTg4Xmo6nR0A3
         MJ86XY735+6u2mFsRxOJ7CTQN7ME3EFLhtFjnKIe2iAgVE5vC4eXO137ELvI0Ov8VExN
         q5ODSaDV/8HMC0xeyFKpRSf4IN2R1pzSzsRbaODe8SKAc/n05g46nCCRHdAzaxqDfUuO
         lvEIxMtFgSyc+82R7EwbMfXW9YBHp6/A3ngYJBFIWyGJxukwU0dU9LFxFXNQrvksN9w2
         gYUahIusCL0quC6hNd1cJr1G+shCclzbaLfqGdC7XipjIxLHZQGfHBNPsR8dIdxyU0sA
         Zmww==
X-Gm-Message-State: AC+VfDzvanfnjwUsqmHQegBr0bPdvsQvUXoV4xamm9VT5rfEhlle3VoG
	9GVQVMaXvFNiFSH2OKaOL9MiNg==
X-Google-Smtp-Source: ACHHUZ5ajeuEcq+pQ1v8YtLzwGin+V2lQSPMVsxtvoFAJyNZeACF5t6k0d5SbrpG7IMTgOoIBSr2JQ==
X-Received: by 2002:adf:f407:0:b0:307:c1cb:425b with SMTP id g7-20020adff407000000b00307c1cb425bmr5975290wro.70.1683897128184;
        Fri, 12 May 2023 06:12:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d610a000000b0030647449730sm23461965wrt.74.2023.05.12.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 06:12:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 12 May 2023 15:11:44 +0200
Subject: [PATCH v4 13/13] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-13-2592c29ea263@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v4-0-2592c29ea263@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V+HaYnTuv4vcDBK+f0uefqR8qZNKRB03xg8yBzcvNP8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkXjsXmuJpoMQSk6iQu6xcYzS3kriWFA8zPdKbBAGo
 rl3t3SSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZF47FwAKCRB33NvayMhJ0aKkD/
 9nwkxyX9MQuKNxXmRxjri0mU8pGPrq60X7YBogp3HeA+SV89835c0iK24tOarj/I3GwbTrcA4FAeVa
 FL5M2Oeuo7Od3a02XEV/QfCS75MhXxqYmaaKQQr3+dLmpkWcBAMvhcRREmM8DtJj1rYOia/GXc/iOk
 lZMuL6YtZR8bvvT7Ogvy4Jgy3pvBcC9PpNK+v+JXC9cVO0JOP9GO86k8V/lC390k3K/FOQsI4tk2v6
 zGztDZCgy76+pJrNMOONtLY5H21JumPai4+IDN4u5pZ6TRaTKU9JQ+tUE5r/8T1mdwZ2omWBisMCMQ
 gBTlDPpWaIMjTF97alK5V1AlmrPAB97XhVFWZTZMhgHgpK+YAz0nSii644kfbboUhXm3LuFwY9a2z4
 arLG5eOAGpIz9urzHuk8eEbGMGGXhHC4/B8n2Ogs4kSvOxZYi6k+i4taxvGEq2K8fpcjsJwVoxS8oU
 YQp8eQf3O5N0gF0/pwdKLOrM6c3CfX3OKkZ63U31/nv1H9KWBBODcGgnaxSGGc9pWvEsoXdc1yTG5v
 +0Z399AChZ+otrtUkn2TPK2h54xQDjF/iTJUbm46wlL4erIOZm4CGBuINakMFXQQ+j01ygWx7xA9hg
 GUcUgxDUdawB4651R9Atu0Mca+k2IFoYBv9XhVI7r6AW8ribgLMVUMFyrCWg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_141210_294674_217E631C 
X-CRM114-Status: GOOD (  11.37  )
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
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 76 ++++++++++++++++++++++
 .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
 3 files changed, 78 insertions(+), 2 deletions(-)

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
index c9705941e4ab..0c50a32bb0c0 100644
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
 
@@ -359,6 +367,23 @@ rtc: rtc@51 {
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
+		reset-gpio = <&gpio_expander 6 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <1920>;
+		status = "okay";
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -366,6 +391,57 @@ &ir {
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
+		width-mm = <64>;
+		height-mm = <118>;
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
