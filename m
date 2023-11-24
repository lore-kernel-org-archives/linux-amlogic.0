Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC3AC61DF4
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TC3o9hevuYH6eMZZZs/4ZqRijW4LhjHPhBpY5FTOZE=; b=kMkEo6nDWDnG+3
	uHwwNDF1O8OGYFbuUvgP/8Y5azdGFUM7Jl810AsYvxohdMFNRJfoSZZBJ3urGMdeU8es2Vvp1V8EO
	MNkFVivjcc1RUEjuTN4PJxDNEhFS1CrazE/DV4VGRT8UPaguvKF8Z9Jm6P5SNEb508Qn7TeKxHl5J
	ZcyDgStNdflMwfb9dTI3eimqydw6oww9zew78W7tN1mXuE6yWWVylpS8QSP1JltHh5HBo2IelfqmC
	1ZEdBf3F8mlRyjaRDlQWMWKilXg3p1ffluVKNx85jVKn/W7F2BiLBGBy37vQ1h4KiKAtSKNrF0wB+
	CCRQAgwCca2ojiDnTr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rmf-006Z9u-0F;
	Fri, 24 Nov 2023 08:43:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rmd-006Z97-17
	for linux-amlogic@bombadil.infradead.org;
	Fri, 24 Nov 2023 08:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=; b=QLgMkah9K/sToSzFlQg7etItA0
	iYikwgviyLV5yW+rsMjjN9DljY/kRVxez+8mrnoteGZrU7uwb3Q75EuQjPWutQys/eBBVdbvOMoti
	WFj3CZkaU5FWyGrNV1mlR9VuD9H1S3NP6qKjg6jeAV7qlFU6LnHK2/kyZPA3aj1ubWi/zd+7ZAmJ0
	Bbntf6Nh7ywPLZvtV5tH8TB3xjXD5RtRyoDgH3SNt3PGG7bwLXogRuzEh+NB09OBWIRcwOtEdtLPN
	PRI9/g5LXeS4M/EQVoORkqN/znY1IELJ0TvlH8E2nUyFqXCo4REBSJHe2Y+2yFcyJ0YCp7SlgD/cN
	/5Xf2H+w==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6RlI-00DoTP-2r
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 08:43:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so1012512f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 00:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815297; x=1701420097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=sh2MRu6tIPrWjlvqjRpEl7FKvZeSrG5dhKd1hbpuHIak2zOQxgPWbvd5C/xduRLqpZ
         aamWKaIIrWFnBF9DtU/fK7OwD2vB4sAlpmCxwc103fVME0XgkEcAi1GwhZZVzSNG/h00
         /eUYeHmxgDQv6Gz/81C7YEAxRKIcIK0In/PJ0w1u1oceefePI4k0VfXxxioWV7jesy3a
         AM9oRi/Fv/g3JQbG0MSib3rRZJJx8vgCgi+HPxtev9W42WenMVVwT4wEyOHYFNpcrQ/h
         F05AD4iLuoBXKRSJ0PwtcM2vMdY8OHc3JTsm2y3avuJYUPYv/cDzCVDYtVCXT/jchqE/
         9Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815297; x=1701420097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=LZ7LueL4JnPgmnXMDp/C1342dD7Up1FQfhN5B7AH919JV9D2HM+HIyTe3yY3A1XMpa
         bLaYwk3Pa7vVwuilxIkd+VuKpWE2sBgJ6z2hW02X7k7hCVrNX/A4wHE+i3l5IHikjUGW
         H41Zn3GuouucWZp6KM1ory7vIZAZjVqot+kA+JIRaP0HprTBwbLU9MFy34OX+441+sii
         nRD2PW67hUKrOMdZ0KKEYzmKRhuugzclSMC7TywmEOxnOt3/dpHGDCleIvrPcXIQpZTy
         +0VXPmYAN8eO1Gn+mhe5W4LPYAKLbjGDBsHnnHTF+Gkc85xbLk5QMHTaOo6kss7g59Ag
         miFQ==
X-Gm-Message-State: AOJu0YzuWmWXt3NvrY/QNIe5h5dzBcCyQMh4enNGSwupx3cjkujSkv9f
	JuCRiCPxix94xO1cTYGoAJz/yg==
X-Google-Smtp-Source: AGHT+IE2UZwrK/cWwh2rBEoUeFF98uKEtaA7VGpaEvV3hUAbSjxLyp4wCEN5Kmi6LYzxAyXCY0lmQg==
X-Received: by 2002:adf:fa85:0:b0:332:e650:dad8 with SMTP id h5-20020adffa85000000b00332e650dad8mr1476988wrr.17.1700815297315;
        Fri, 24 Nov 2023 00:41:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:21 +0100
Subject: [PATCH v9 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-10-95256ed139e6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGxXEnizWSf7+B7ZodjJhE2lCrlnGpyxQU6g8T2
 sVrEwh2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhsQAKCRB33NvayMhJ0bhED/
 95+sFAipBUxjMeFLlGpWzaX+aaME314YyQy85iWqpiZSfTzIyk921PAf5/nQNjVMjWaMT9bcFyVmnC
 FYUT74aRBf8tx27OxN3+m40y2pVnIpPWDTcF0ekBk2Ii6SREBBVj0MXbgnlstPlamiGjK3CIUu0OU1
 FbuFRZazTjVe5x5FSc4h7zk6FwjemlqYl65SqHSCtdbCfOS1+vPHsb1pcSsKrWU59gbAw/5LivKxJ+
 NBv2BGqC3Em8uWoN6/XTIh+z3ToLktXvqE++ydJMjDTrdkxu1arhSfw32ZjafCMpCtCSwIl7WihPcX
 UxZj3JVxYfyrkgbVsYqnABrWZ/ixlYXKD6hCdBKZJFBs+GhGRnFZ/x3hMih6VUoovnrJTXZDzgCA+n
 /ru3vSAjKq2HXFlNWPAKZzGzBtkNUX5zwnBrO61/4s8Sy4lKNSX9rueZnAvNPRjL8BwhBtnvcG6Tvf
 2z2zzTC1oAFh1O4ZCe1Eut/J+I8JWsKg7UWdpavDsIz1tM4sTf76AQ/WLFze1cXHTr0lqhm8loXERC
 tdYnAsXCiHj5km2w7X+fj7Gg70xdzOe6zjiwdeBaSXvycF22X3dZvbD2l0HU+8fj3tTpORggJCNps4
 S4ASkJk+fCkHLMPIvP+zfyVCVk4d+lIdiJq21ZrA4X7InDu6EXUEvM+am9zQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_084211_542646_5379A9CF 
X-CRM114-Status: UNSURE (   8.62  )
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
index ff68b911b729..7300408262d5 100644
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
