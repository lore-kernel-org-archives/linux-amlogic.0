Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C25C001DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Aug 2023 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmZ2ydP2HO6Lq1zGAbsrQ1eDtMbDG5xr4DiBfC+AQHU=; b=dG574DiiF4A/od
	sNvBabDvFqDJGRPV+EQsOTgWfm0aV4Osjxw4JWGcntmcoyxw44b+ZqwTXsxO90IFtixXQZscJA66b
	7BcRtlP04xqyQ0OjNoWsGovsi8iiwqozhNfFTGVNk2A0mldeBBMoI1W9p27I81OQlKIviCCJKohlG
	K5Pm2sMBTuMVtxBS/0SzsDFe59vvRDnJ9pSqBi4VlIB55Q1+RCtc76L9vnMy1ZmsmZjoXRGd2DubH
	OA7VsLqdauv+P/LNcDQKcYyUbpFCRk29Yh5W+65KOnO17k4HKf+uItixwgdiMFT+xltNNkmYNY17S
	1i3/2vso/wOGVhR/Ctiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX4D-008BZJ-0o;
	Thu, 03 Aug 2023 12:04:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRX3u-008BBV-2a
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Aug 2023 12:04:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fba8e2aa52so8859975e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 03 Aug 2023 05:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691064253; x=1691669053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
        b=BlJxsCICzE2dZkbywMr4FudgRcFUwjd7eCm71sowAJTG9G1YRtszdbgeULBf8dYZBs
         Mr7gemr2DsEcdSvsY76kFm00+LJyJsnXDnA7Ga0UBvJarCzKbTef8d2UqvNPnF5S7RB1
         zKVz3oM6gQvkl7GXKDCNAQPjJ4KxNYE6bmhiToSlHjDiTI+Pe/sL7oHFbqf6SyGx1USl
         akIJ6zwwP2RJ2qJZPleeYmgXmSogMFGpzPw324W89D22tefn3YNUWTbRNwz6PikR0ZyD
         3lqa0bp1ERB9TZHjl/S50PJkQphaHxGvAWRHwPQzwgUx8JCtYIrLJLFVK0trucJA7q1b
         CHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064253; x=1691669053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1EX8zFqVSXgr77NNt22wgtrby3wVjCcq3AV7vqu9KU=;
        b=dkirpEUGAcsTC6YMq6se2auWzeOGwvQoTnLvNEAaQayuc8dK00zHdwkfUkYdAbkJex
         oB0sAMW3H7Zcq3BLmsS6yVvgfGEyhKVl/6NwPfKHbz1yUdqmnvWtOM+WCtgcgqvkrT63
         aF+z47BvnyBjbLRHCIArj9S3goK++1FRJ76bkugBfHfS/M6fSTTJxz1wUw5n+De/qrLR
         pQsTPTxp677QaPCYu3ziSAVx3JLqIPMjStl0bgZGRIRK4EelB+MVjS5gyrxYQpoyoytk
         Nysi/GUSXjRIHtEHpvwpgsqY8QahRQeeYhDNuKUW4q8zNiJLgCKU+KTcdBGVQ03w+T04
         BEBw==
X-Gm-Message-State: ABy/qLZOapILSTxPwIC0pxc5IDzWtJzbxIRYawxOX3Gqevxiz7/dJt+7
	DXFh297KCdEqNj9dYh1RoOAO9A==
X-Google-Smtp-Source: APBJJlGa+okCrUq1qnlV4w7LNF9en8KNIyz3NEyFIqpcMvjF/X7vSC4+lMBIaIe1G+T53MU165jdxA==
X-Received: by 2002:a05:600c:2194:b0:3f7:cb42:fa28 with SMTP id e20-20020a05600c219400b003f7cb42fa28mr7540008wme.28.1691064253580;
        Thu, 03 Aug 2023 05:04:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b00317046f21f9sm21487465wrx.114.2023.08.03.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 05:04:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 03 Aug 2023 14:04:01 +0200
Subject: [PATCH v7 7/9] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
MIME-Version: 1.0
Message-Id: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-7-762219fc5b28@linaro.org>
References: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
In-Reply-To: <20230803-amlogic-v6-4-upstream-dsi-ccf-vim3-v7-0-762219fc5b28@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V+HaYnTuv4vcDBK+f0uefqR8qZNKRB03xg8yBzcvNP8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky5eyDWVasX87JKDl9Q3Zwin7OqsrHI0fGH0utHFc
 TOgOcr2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMuXsgAKCRB33NvayMhJ0Rn2D/
 wLVh+g/1kECG1mVL+f162NL4lVQLF5IWrK501lv07SxZ2avsUvW4q9EAHiEkoh4W9DVtIifjIiFOzy
 fN1gdtNOZm/O5DCGUUwhMRxW7STrS+/AQDdmDdNlvSXLTAhIVy33cTFN5qMopGnMTjFzFoXvIOecth
 /E9yIFc6f4Tzr0ixb/Dajv0Xko74SeJNZafYtEuTw6yxWB0FQnGsXGneFPCGBVngTRO3Ii9PxY2y3X
 0TwKYTS+ECqS1c0kIqSWgyCMOxYrKvQsgsXi8DnQ22Lxh208g4Yj1n3dYCtcuyhOwofwsR6hR1LoYX
 EE4SxBuOS1pIrWwJaaFJt8DMXHbmoDOytZhVqkyg3OHJG1oEQF2NGgRm1boXkSfq1o7NodBUd0Wais
 C4Qw8iOzcjjAW/RYsgu1xSVrijbobZg4NtirtuuIp0HZYrMl/saBH2buBzJfLLTBQGxGha3C3QuiD9
 UKj9WHfXJt8b2MCqImcCE8p5+kqCJX9NqDTrkImd9BaBmHHOmGXcqrmiOcpwwjD6GYy2CVnrAREXC3
 ITjbHNZhPCrtfoK0THB8pR6Z05jbXXf35ekyqmpZDqQnf/ryl3QDNy7vw65qJVKMrNCEiItAKC4XQx
 7W89jFfIfnfJLUMXY560CM93STek0ZsbgPgjR/x5j+dhYGlpw8Cbmb83OdVQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_050414_864915_5D3BFCF9 
X-CRM114-Status: GOOD (  11.87  )
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
