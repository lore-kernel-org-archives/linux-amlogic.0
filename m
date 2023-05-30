Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E488C7EE31
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 08:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxslTBS7ZRQCNZKeAAJJWt4EfY5pgU8MLxwtWaWg1Lw=; b=IOEo7eMONzljXk
	E7G42eDsCmRH6ATxkAgq24yArpq/saoAg7Wryzpf8LVpVLMVuJ4jSR3e+WtoghLpka5BHJ2NrfsMt
	/Z2J21XBERlwmkiONETeDa0fPfjt7wKGeAyTacl1FT3J1c3IIX+J+RydlZBWNZpq1H5FhV4nvBnhO
	fTOKU2opkBAXUX02K1Ze+ML1DJ7jf0Zd0GS0maReoRJOJKsjkgCi4JxwwOl4/j5LIWxho3TKMDIqd
	BsY9jMqpN/FJYWAJH53YKNM8BDP5mJGnrU65dvXFCTAv4eNSnhztBTJLy+5Q+w/DLTLmHmtekrP0J
	x8URDWhzAGj6Gigtu1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3uyu-00D0TN-0p;
	Tue, 30 May 2023 08:45:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tw6-00Cl22-1i
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 07:38:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30af56f5f52so134731f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 00:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685432310; x=1688024310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=cpT8kqGq/1CXoyY8S/D93smDoMCY7pfI5803gHEomPNLv1JW2Ymvl0BI5FFqWdx1QO
         JB+3UUVOJsBeSTvppDUijNszyNs3lCsGJZF+qSGoJobJ7WKM3DOTE7YPvXYlXZguPlTr
         OF/VyYpiUdinJEX65ZOz9I7YbtNcCG7HXraLvI0YsQiFJVLkQThIg4TW/cAqv50eLDIK
         15iWI4Lpfu0EcVDgPIFg4CNA3bZLdAp3Rn7EFdkX0vDP1fM6WZsOFEAw1T453F6ZZV4y
         Av+STk3U7c3TzGeOVji4AKLKpNHPEqjbkXVsgK5hYq6dkYsPlxtUXR5hTFjLLmT5S6y+
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432310; x=1688024310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FE2GzTAQAamADs2IkId4bbtx4jEKIzlUpXDBW+Z7PSk=;
        b=T581AWhSrp8qwnHM6EShmrzE26GbnQZIVC1QrL4zpnT1csfCsPRIeBXYn4Ln9CNAfQ
         7EON1Wdtf2BrKY33nFp73a6C4yTEqrhVoP6izInZlb56Z5g8CmIEwC9zCQnHucwCPJKU
         P4Oc8zovCg11EGnDt2yN0s573gTDHrqjyyUV1q97+Sg+7r3lg4wL2qP03tSpL7jp6awg
         2l4+FhSd4vrOmy1X3VZ2W6zubtNKG9XsaosNn8WPyMKL/D0DrZ5LrlUA27D4KN4VbZ6c
         8FOSgqScCEWuCOjT88XVrlFaol0lF3wV/AQP8f2kfhyscmyy2AGtiOTQhcA0La/VUZwn
         UL+w==
X-Gm-Message-State: AC+VfDyTYaSvD/VLI77IQ58mNvkQ5OtBiB3wcZWoCC7kFQ9PKeC539k4
	3AADM65OEswoxTHadBCql6JOug==
X-Google-Smtp-Source: ACHHUZ5twmldHpBlAi32g5KLdl0EhTqocg7KERT++T1cs5k8vLrKMExWYTOkQxBURLYBPI0dLoxsoQ==
X-Received: by 2002:a5d:4acb:0:b0:309:3b8d:16a8 with SMTP id y11-20020a5d4acb000000b003093b8d16a8mr920169wrs.50.1685432310077;
        Tue, 30 May 2023 00:38:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d4a04000000b003079c402762sm2312013wrq.19.2023.05.30.00.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 00:38:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 May 2023 09:38:15 +0200
Subject: [PATCH v5 14/17] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-14-56eb7a4d5b8e@linaro.org>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, 
 Nicolas Belin <nbelin@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3033;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=/UfTcMxSgIsvwzBMxXSJJlgFXjkzr+CK8wUoWlj1xNI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkdafiT0we+6CO6c5N6Xq5y8TagHAvuLqF8e9bm7tN
 VnQONMWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHWn4gAKCRB33NvayMhJ0eqLEA
 CEhldpVtcYRcSTem9eNv+vOccezhv5jI/pVsuhGNLCY7YLCBhJFOtTHhJwa+d5lk9fbChK2KFX9QdR
 AOhbwa+ns+l1xn9eO7lcLQnepjWJX+yfOTqic4o/Mbxa3Zz+nD1Iijx65UXlk1XiCkCQ1fR7xNZrqs
 WA1bKaQfSrHtGjJChg7cDnTfrgKv/cSwvTG1SHw7Z9F3V5uzxEEuIi9mIlxuZhpqksBxlFm0PlML4j
 8ASQtdVxQXYveD9H/r5B8EPcuQgOJteUqLgiHNCMp1pB418cp5YYxHcB/G9WWvoBVYCl6rLD9OZ9Wr
 FjCJ2bKqeOZEX3ioAGa3Qvz5TXpSi2JsDwTvovO8xPJBmSXPYJmax5KiLjHlZGWZsqW/AwzvNreR7S
 HpUzLXSRCSwqOOyrwcvvGgbKi/5PLZQXuM4JYQ2+9aPuXtm43lQq8fq4swjKBjTjEzukO2zG1DVjva
 8T0ZQKqINz0LZXfnpL74b9UDvh68nZumkWC3x9JQoKU/69Qaywlt+Hm3RaFIYVJLpe/3ll83tcln7O
 OgZ7qqchqw91xhUYVPmZ/vfUYmjd/wqFSfeshPn0zusexxL1ntdfFce1bgPMU6l70ENs2iOLauOO+G
 Jslbls3Kwq9GEVcnbVRq15oKM9Vq1AhOB3PuSTfCrwU63uvgiIWuyMeaYZxQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_003830_579060_F2E501B1 
X-CRM114-Status: UNSURE (   9.08  )
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
