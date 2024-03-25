Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E9CC54E58
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2024 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axcNEjfkIKG2wfNKC3LUrcv2DkHDYyJaqMV32/bGpgA=; b=UMNMGYiwE8FKWk
	y5Ppv7NcfxCoJ7SMSa0+7HB28MO6M+v7VP7O3UcY4kRR7DqW5ZB2+pfE/8XpF9NpYEC8KpOkxE9+D
	KPPg9z4dI7DJ17Zu9pURkbSNXT+yZ8jCDa+XaQXUYcyGfOJw5C/HvNO0ee8nJ8MyFiRpNWQQGRVCj
	vsZ1GrInnbIx4HTvw1qCQcp0E/XDowZVWAk/LYzm1V8swFI/6eWv2a9+5zRnp2mH1WlsUZKzMeB3f
	LY8qSN5ONYwW6+C+74v8lwPezYWuFkrEMgeum9Mct101u/5puk8zWv3VIHIfHIyLnt+W9sg6GTLmI
	o6Ka8LNAXFsnbrK/Xm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDi-0000000GxPX-1qVw;
	Mon, 25 Mar 2024 11:10:26 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiDJ-0000000Gx54-1j7K
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Mar 2024 11:10:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so5365515a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2024 04:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711365000; x=1711969800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=bMoBfNSbod92gdyfcUFMgQJtAdPsYhwuetPcRogbo0uQxtBmynBv4e2Xkz8tVD/bQl
         0bkk//sXM9s0OcsBVWTPg2hBN4BhInuhIErXeypQ0Q6byUdIJceSX7AlXMswHPWRjku+
         Ba3X+l5uRhbtEwe8VEBm55riSdQ1rRTf504mYfNtLvU4X63+MTCos5wlho7+ICu9TEk0
         Yl7+VQ6Bbn8xj5O6Xi4KkQO/RPT1cSkEEcZ7jjwk3xf9ObyFr7X9Di4oXV6fMN6VaH/u
         SIkA1kSGcni1+5ETxNsAhQWN97r4CydGTTVq0nv5X/qXBi5Lndz0N7AU1fQvWdrIcb0M
         u4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365000; x=1711969800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50DZO+Qx5CrKtjcEqrQpx6F5muY2d18uAtSUCAhezE=;
        b=d97Yu8YEGpu+NoMgI7iQ+EtWL314aPu3+INgAQqz/qQ0G27msXP3DBsYLSrPGDBGfL
         G9Tf2vg93jO6c4vgbvBCt3bybPQmsiCvW8BTxRLfu2+bn7GpZRidahWYIlEit+FUJYhm
         OGpOGL7XG19+5hR6wm+ppre7Fh0FzzXZSPGVMfZWDohm1xdVucKb0db87RgLFbY+9Te/
         4Mw83XcKHWWrLF5MBMgFdPk7ntiqXTGW0GBGBSlKLWLWUj6zVwl7WZtf7gD6owDyeORn
         xRyXQBGu9lZkpComgZsSKZiPqpAPopwTF2qY56KHG/jseEFWVX6QCY9zLLF5+xXMpexl
         OzRg==
X-Forwarded-Encrypted: i=1; AJvYcCV2EQKklhQITOGIwyh5ouCOnSZyekOq8lbSNKQuEMXjbqRXHxdSdT+XFsdqxoh/CLmTmQncXfMVicNCPb4oBj7iTWYsTWBbLaRKg3A7x7KWRSg=
X-Gm-Message-State: AOJu0YwLsIYanjAPHtWIDYmrcmg0R1LmQkBknqH2QYUNtrdamHVL8hpG
	nbmATmyK3Vj7jnpjbaiIs9QvHdgOTRIhQLKP8DmLvPHTrqC+jvw83XdG53u8X+0=
X-Google-Smtp-Source: AGHT+IGJCn/q3TzZQ/sfcU2QtBH0NrHSyetkQMtYJg1jSoVYaJ2sk3brXJ7gWcgR4ptjTbLqURKNtA==
X-Received: by 2002:a17:906:f90e:b0:a46:ed93:b37d with SMTP id lc14-20020a170906f90e00b00a46ed93b37dmr5205109ejb.9.1711364999833;
        Mon, 25 Mar 2024 04:09:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bw26-20020a170906c1da00b00a4650ec48d0sm2972367ejb.140.2024.03.25.04.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 04:09:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 25 Mar 2024 12:09:51 +0100
Subject: [PATCH v11 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-5-04f55de44604@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hinQajAEakYqxJaAvUFt65KdqGEthzlwyiYxmTWLSwo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmAVt+AlXm33R5US/QFy5tRjSgAFV3tRQPAr8s2ioG
 3r1mCYKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZgFbfgAKCRB33NvayMhJ0fqVEA
 DH4KjqxSXHBDe7fYDf4/7JFLNdGDuPCsrGV30L6WP29u1xPXx8RA16knTkwN4NjPDRJ7/hg9qx3gHj
 rAHFrPJZuJcJZP6ZFbQAVCyzxNDYxuoe9+2mp2kngm0mDdnzQiXGP2ND86E/EZoF48VaCTt1/GwENF
 V2/7WLfRENSQ5o+Fp/q6089QO2AqoS7OGeU8SqcrobaXx9f7uu+VbnI/nIS6NyRm6pCrVxSNUaDPTY
 DJXZyAnlpu3Kb44ko4Fd4ZxsGbBB5T1TlyzPU4hFTQwa9NDLOdHd0aHb278cZwd0m5myV123oslk9C
 0J2psO2GAxjDPRskOMVwc3mipCd6ccF4yPcavOOcnvaaxMl+K6gBEq5eGxhsC0CZYlefg36wCdgV04
 GYwMz94q7tZd+RPZsCQK7fYf301VwJwD5lR9bADXDDPARtsMfpH/BLbzw6Ti0sacRM0wxDCKKD5Yyc
 oAEXYjwKXFngzmbzRuMa5fILyfs8WfInzlIc5M1JqTP0kw+9bswadgDwAhho1aKfiqiyD4i3NoZCe4
 571PHO31eYCO3vnMj0j91ulFccBgMnF7KpoqgWcWv2eXuI/A7k5S8fw8KlLEjdsvRQxmQfEDKRMTc9
 00zlIr0LGVr+p7/lMJdNonubsZKEl3aTO3xCSlN/9AVGB+T4YJfXrWsy04Pg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_041001_603569_A9F0A3B0 
X-CRM114-Status: UNSURE (   9.59  )
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
