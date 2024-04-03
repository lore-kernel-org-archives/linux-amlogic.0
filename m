Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68775CD1294
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 07:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axcNEjfkIKG2wfNKC3LUrcv2DkHDYyJaqMV32/bGpgA=; b=Zwtlt5XZcty/4n
	euWBWoXayG8zMT00/AWfuRpsZL6jhOuJNhhDqr1a0ohw7SaYiS567LV1fC4gI5Zu7mIWHQ+aHQGhq
	m77DOJTQjIEdCQfa3baHZJ6P2tiIyiNTZWqmm/Hamw7AaGC0IgNpVmry3cxv1fZHfN+P39xyCEhCS
	YpPwgPqcp8HW71Krn9h6nSL1dd1K9drkMrw/U1VF5BhSN//gmMtiV5fs13z/cRW+yhfAFnikdQ+Uq
	C6oGNOPFFrqY6dO1qLCCRAIxOytYfVtEaEHFPECQvqTM0HNi1h4wXMR7bgQrsiRNfW+mtm321phAc
	i1xOKryZjrRF8MeDYTsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKi-0000000Ecwm-007z;
	Wed, 03 Apr 2024 07:46:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKa-0000000Ecqu-21CP
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Apr 2024 07:46:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3437efea11eso648008f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130407; x=1712735207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=g8pEQzMC2Vko89ptLYwhvjKZCME1rdRfyg+qv2CFfzfrpe4m+4WAmc5UbaOuLV6Qua
         wIeNM5SMIp2V4aT5O4x7L8C6d942YxVoUIS0POaCHm9f6TSFQKEJ+ex0uGSBrTPpp/S6
         uWvWg1T4WuT+YpVLtwe+t2Sk6wFB9wRw6dA8vbu4H4zK/w4qN5c7l7ZLujDltuLJdo0X
         dUiBh8qa1HRLSjjb2fcE4B7Qg7jxeaQfiUy981TByqmjOW/vmMl1fK16D+yn7ibBniTE
         rwhrvTD5cwrT/3kJDvfLwwQ91O/q2uIb5cegqIRv3Q7x/08D2U4smAyojA15IdlT/65O
         m17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130407; x=1712735207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=wg7p87rz4dXd8JGneszaukIw9gETI1GHDawKfT5whT+hCfBt/CqjmiMRPonpoOa6N3
         zWu4ls0iER5eQoWTfbvvuaw0JNS2Ak2O8AklZ+SrbNaJN3q3h0165o1H+cLdKmzPJRcN
         w9DIyc9DXZSHaL7IrVkM1Jo7TtS7JtEPceh2qbJaMn5g887RsQfo2ITq/7G2gukLsB8N
         wVeic7LvTPF9UJLO34smPrr6vdKeg0Z1MEKLUc0DET3FDjcQuw3xyFDU1AZdNNS0nbPM
         /Hrl+2dqDVk+Am4a4mHWr8sD3eo871N+Cx4FmP6L3eUpjj3di87IfKtiQMb6cposyZRo
         qdyA==
X-Forwarded-Encrypted: i=1; AJvYcCX4IdFR3mBW+mpH8ZcipGjdbsBQ+/ht8Xgm7B/aDK4sVR/Gvaw7kxSSoZYo1XFNPj6wSwkXFs5N50puNK0d4HDgZeXfSJemBVQJ0UtG58hEfIQ=
X-Gm-Message-State: AOJu0YyfuJ8b3rdIzMJasJW2zcfv9PPbAVM4cYwNk3/KHFE4rCry7KXC
	Yex5jTCppY9L6TjXeFuCGDdjGOI3c3ELSt27IweGDyoIWpgenAo4S1Ha9eqYp5Y=
X-Google-Smtp-Source: AGHT+IGjU+lZi926IGYs70wrtPeJ0AhqDJygL7VcXx4pKvMiavGn02G8DNEATWdaZ39B2zUBl42zVw==
X-Received: by 2002:a5d:4ac6:0:b0:343:9884:2fe1 with SMTP id y6-20020a5d4ac6000000b0034398842fe1mr531968wrs.68.1712130407112;
        Wed, 03 Apr 2024 00:46:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:36 +0200
Subject: [PATCH v12 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-5-99ecdfdc87fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQleCJepZTdvsH5P04FFdj5scoQuo3RrkBu/7LtR
 ovFVFJKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXgAKCRB33NvayMhJ0awCD/
 4lGsqK7ZBrrsYwndwe68AzeslZJrfHIBwgArd/EZLEm4uE0Mimp8KnfGmCjHpv2dh53lDPDO4OyUXW
 TyjZKDngAKfl3cik04pPAisgFPXN1rt4snRJjOwmP6Qdrw00FM3DMJF56wcmsSarNKGCJuP5zEaxrx
 WTxsLsw39sem9jlgmn9lQP3NBr894+saWYaNnihjRjbD28uTZV63ixGtqRZAX0Uv+dr0G60tvufHXx
 aM+lm6S6v/T89y5euV7BUzGniPrwT3gbjnKvtTIZqJDC/V/wdJ2mb+SfXY0M4w5qgjduBycvJGoGVH
 DVEhJrncCQ1+d8MWAg41VRTzaLGhgfAu1bzWlrOTnP6LWtGAOUVGAWv/da/PYg1HvgvFWQBUPfCHsz
 5aGscOZ8fAPd9DbkEdpW/Hzh2o1TZ3lBJtD/8q0I1TWwEar+co7t25cHPCrcwK1+UoKTaKGwXzbZ7L
 a87Eosy6L3qVChDGjEc5phAj+kTuVae4lVMjJIQiqAZvZsu+6uTZWY49N6g+jYg5n/Z/OsYnNHH5Qy
 oIM/jTwrHykmI9Ay1BR4RRMyk8yciDWmwpwiQxhuaEyRgBXlLkB3C218gFvjV+38kwRb0e81xonfox
 Vl/6+llHRMSy5eR48w4NWI9EDM96hxPfPJyDqbo17HxPpInbEPQUiLqFfLXQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_004648_935193_20554382 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Add the MIPI DSI Analog & Digital PHY nodes and the DSI control
nodes with proper port endpoint to the VPU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 70 +++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 9d5eab6595d0..b058ed78faf0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1663,9 +1663,28 @@ pwrc: power-controller {
 								       <250000000>,
 								       <0>; /* Do Nothing */
 					};
+
+					mipi_analog_dphy: phy {
+						compatible = "amlogic,g12a-mipi-dphy-analog";
+						#phy-cells = <0>;
+						status = "disabled";
+					};
 				};
 			};
 
+			mipi_dphy: phy@44000 {
+				compatible = "amlogic,axg-mipi-dphy";
+				reg = <0x0 0x44000 0x0 0x2000>;
+				clocks = <&clkc CLKID_MIPI_DSI_PHY>;
+				clock-names = "pclk";
+				resets = <&reset RESET_MIPI_DSI_PHY>;
+				reset-names = "phy";
+				phys = <&mipi_analog_dphy>;
+				phy-names = "analog";
+				#phy-cells = <0>;
+				status = "disabled";
+			};
+
 			usb3_pcie_phy: phy@46000 {
 				compatible = "amlogic,g12a-usb3-pcie-phy";
 				reg = <0x0 0x46000 0x0 0x2000>;
@@ -2152,6 +2171,15 @@ hdmi_tx_out: endpoint {
 					remote-endpoint = <&hdmi_tx_in>;
 				};
 			};
+
+			/* DPI output port */
+			dpi_port: port@2 {
+				reg = <2>;
+
+				dpi_out: endpoint {
+					remote-endpoint = <&mipi_dsi_in>;
+				};
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -2189,6 +2217,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: dsi@7000 {
+				compatible = "amlogic,meson-g12a-dw-mipi-dsi";
+				reg = <0x0 0x7000 0x0 0x1000>;
+				resets = <&reset RESET_MIPI_DSI_HOST>;
+				reset-names = "top";
+				clocks = <&clkc CLKID_MIPI_DSI_HOST>,
+					 <&clkc CLKID_MIPI_DSI_PXCLK>,
+					 <&clkc CLKID_CTS_ENCL>;
+				clock-names = "pclk", "bit", "px";
+				phys = <&mipi_dphy>;
+				phy-names = "dphy";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+
+				assigned-clocks = <&clkc CLKID_MIPI_DSI_PXCLK_SEL>,
+					 <&clkc CLKID_CTS_ENCL_SEL>,
+					 <&clkc CLKID_VCLK2_SEL>;
+				assigned-clock-parents = <&clkc CLKID_GP0_PLL>,
+					 <&clkc CLKID_VCLK2_DIV1>,
+					 <&clkc CLKID_GP0_PLL>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					/* VPU VENC Input */
+					mipi_dsi_venc_port: port@0 {
+						reg = <0>;
+
+						mipi_dsi_in: endpoint {
+							remote-endpoint = <&dpi_out>;
+						};
+					};
+
+					/* DSI Output */
+					mipi_dsi_panel_port: port@1 {
+						reg = <1>;
+					};
+				};
+			};
+
 			watchdog: watchdog@f0d0 {
 				compatible = "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0xf0d0 0x0 0x10>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
