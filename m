Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89710C001DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxslTBS7ZRQCNZKeAAJJWt4EfY5pgU8MLxwtWaWg1Lw=; b=q6PTjrzQJm/iuf
	F7AF2z+1neGDvTKg63JebqNh5dxLpR4ftd1uSR7k38ctk9uQs+9+39JTMu924br0JVty+FeF54NZh
	vRev428xIFmRJcf+p8q0wB/tUnYwK6k4kSVkhaZ7RRsjcoKIYMZZX/W5XJiHbNqjgy3t8j3DUMAhj
	26i9YPsYBYPQ3ZRuNphooZr/Eih9kzIUc1qZVuVRpOuX5oFoC6AS3oupZPtZytOgs0ZLHmHWsXe0Q
	g7uIO2xGJ25liHsixGL0D0ozerDzFH2XYmoSYBWLkf2MO1RftAhbEweUHJMkuCOgwqSi3C+bz3FAD
	YmkcDmtuty/FHasdQcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH0D-0043Qe-2B;
	Fri, 30 Jun 2023 16:29:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGzy-0043Ar-0L
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 16:29:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fb4146e8ceso23400265e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142566; x=1690734566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=FMMaaVIczRbZN8SKA6J+30ZFKoazIu5NC0oiq3Q0ClUKAvEoWt9mMIZiOdmwBajbOu
         307ahCyBT5fn3fYQ07vMbq0vz2qyRKHYnzzmRhoM06KNXLx9FzgEmOAOfd8ApeGNLkeG
         8gHgMyhYf+28qDgn4ekUQNSHFZOlPUismy15ZpvHNTiMHSKeqXtHPuVi4cpwFk6dVWcg
         zFsGZhuQ/gb0mHxFx40KSN5OGO9WemmZXGHPIRoQKVpA6sjLSYLBddN61I3dKDIaGsbz
         2xp85rygEzhhcpHeIxJKEHTzfs+cgcRT0ayifZZ3D28A7X9NuFxoxhar5GLyRrt4Trst
         rjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142566; x=1690734566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=FVha1uR22/A/gQTk38ZQmxMsGg8QuSd17jZlq53jRSr9DWqPX9sXRnTmmRvzUHbyjg
         5sPuY8geyooGiHfOy9HlhP478n9gixCijy0opz5vO3mptD2160Q71AafIrr/GNADvn3I
         yz8/et1HvmSZiSiv5lhZKhl9bidFQqyqgLcrfL5QRAvAUuXHyIbPzJWPY2bepM0kdmqI
         oM/N1H1FzMTOOESo0nXsGjgtoQF3nx6Swwx29P0IaKIVuwYCkmksNwVVvMnzenyslIJF
         CtrlUGIAFx7WtiomXHdRyIZ23UixTodKPpsRM5uCPAzr/DQ+TkEtrIO4kZtsdQDeZCvE
         xr6Q==
X-Gm-Message-State: ABy/qLbE3LmOyfaVqlYlFPvmd9ZRVm3YVkzN5PgIyhBTD+vjKlNyce0J
	YLXk3iraLlyZb5gdXzBhC9/7DA==
X-Google-Smtp-Source: APBJJlG3GF1tCE6KG+x4wKIY6bVSokF/lpnQ2jIzxeOEbArYnqL4o525ZbGRuw0e0jhFRVd2PQVTUA==
X-Received: by 2002:a5d:6305:0:b0:314:1e86:e75d with SMTP id i5-20020a5d6305000000b003141e86e75dmr2395645wru.34.1688142566368;
        Fri, 30 Jun 2023 09:29:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cx16-20020a056000093000b00301a351a8d6sm18835836wrb.84.2023.06.30.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:29:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:29:13 +0200
Subject: [PATCH v6 6/9] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-6-fd2ac9845472@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
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
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwLcsgk052mDMf07RozlmP66QINWAsClClpnlhPk
 T2Rz2FeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8C3AAKCRB33NvayMhJ0U3yEA
 CXIKNEzyskErTqAdrVua2iL6TY2Dk7FV7/gCiPutuOzDx74zBLEYlYDBuYYv3fK/7nCb9F8+p2JlKt
 0Hecw1k/oaijFIwkYhjvjzcLlqFeGNFL/19V+bX0K5O6QBz4Gcqprb98BhFO8gXpZ0FitFjBvSCSVT
 dFezRKQcdHQBMOG7/UuIhi9tBG1YA7ao1JjcMBhjBwVF7gO7csys6t3nqR3DtkFivDvaEFr5JFuRjF
 dG7SduVaEWSftMqI3vspv4MATtRdGOmOOQ1H5eBlg9b04KROtt4DRgbq/ktLzWLvQLZN/bPhb6TxBH
 DtaiCl1kpqyboH2h/KEwyzqfyi6dwdBdk8VW5YLqVfXRG3ECYuxCm5SxitXFdc17uKIU2m5A7zQgKM
 Ag9nAR8Rd6Zh2MOvsgIb5K9BwONDuDtFx0sWp9uLOps7j9WqVCPXcR6lPHiKSIZxVlYh4ezpQPmsNU
 u8A8h34UAHGpTtl+Mzj4AM1lX4l96BNcmBLpgedZULLOwuFWG/VJYJIR4eciOunxbY2gM+0apP5Ku1
 nErGm0MiQ0k43/cdtiq3QItMsqlhyILnaraJrhm8OViStzEHV5l2PYGCuPU3+CVWFhJvzZ6uWyZnOg
 ECi8OLjsnWZmZQnwjxnNfPN/7BZGOoure0hEIzDoDFKKhUDG6aTgZbNNQXXA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_092930_172618_BF924FB8 
X-CRM114-Status: UNSURE (   8.88  )
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
index 0c49655cc90c..e2d890e72940 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1662,9 +1662,28 @@ pwrc: power-controller {
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
@@ -2151,6 +2170,15 @@ hdmi_tx_out: endpoint {
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
@@ -2188,6 +2216,48 @@ gpio_intc: interrupt-controller@f080 {
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			mipi_dsi: mipi-dsi@7000 {
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
