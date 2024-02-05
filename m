Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A88C4829A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TC3o9hevuYH6eMZZZs/4ZqRijW4LhjHPhBpY5FTOZE=; b=S4Jp5PdxxNzfFv
	nMIi9aBCZrkFhPO67nxxwrqmFdGPacNG9FhXRvKGl2Zl4b6EOyktGvX/rOZ9PaPEfXcBOAUEwiyzw
	A7McuhA76Rz5TvUQI0lpfr+iASmGpSPCHoNWcnYXL2rRAzpc+bXUNBw01S7HnXoUhh5Q38ar+pLWn
	7TSbaiwcr7BGH4n8b0GRJMEe/A9kbnJC2fQKalDYw8Nx53FeJQGxhTSCiohLTYBej4awqDzbV11H9
	0uraZwJfMvcUMrGIgYwEEsRRoi3RNhkpOHNoZrKYTj1qgoPDSncMDKbG6Da0F15QchtdxpJjDNOLL
	Ab0xGU/8cU3Cl+xAxh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3CN-00000004GWc-1x8d;
	Mon, 05 Feb 2024 17:56:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX3C3-00000004GDr-3i62
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Feb 2024 17:55:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40fdc500db5so7918775e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Feb 2024 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707155742; x=1707760542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=HLavczbFtCY6g5L4GhCF07cvyGZn5svwP5GH8kPn882l/tH0KG9KNolo7xptHWp7Dg
         mtZNcmd6b/yiIGajVFwpqUDrARo1aETqtgHLU1JqtsYIUKuHGvis8Kqm4YkpJCz7JNYa
         QSMiZlRrAFV2j3K8mB79+qTOiObnn2xhHQc4avdqREzWmQVs17IfIyAT7oDKR84BzJGn
         69GbGq45rwESEAl5JjxCso2IwkC6a2YOkWI84gpCFlR7plPHw36wx1ysfrad4vXqgGSp
         pdoUMMS40in2X4RTkvznwl15sSqGT4rr9nQClmRWFcQ5k6/bgPQiI/btle2w02fNasiR
         jO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155742; x=1707760542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=OKY/sZnqpBkbZ5Kcgyo6babrnI2NoyZyotQsYHBU5uG2FzChwuOiUxB1xtOAz++ZXU
         4SGlGIcy+ppzvBxLv//ynKCxxtvq+CJ6IJyExfOqybAO2Z6hGsTHMfE8wrDZzbDGZbqx
         kIFA+tDbOIaQrWHu2Vni5o6BUzC+HuCeMW56ktli8UaUy4yARfchvFKbZ38iEkGU985Y
         zTeJB8C2wtACoGbgJJ6DlmwaruRmRkyNqDp7F//ATEhRFJ7tx8jC/KsH92npHSD23NaV
         KlYC+mrDwkhlm4kJCzaVj8GroDXDjADAn9rRxlMaKW0oI9S+FBJkIH1YQgg+QJmLCBBO
         TbcA==
X-Gm-Message-State: AOJu0Yz7nx/vb1nkHh2UqjcylKC/Npqoz6d4r3JdsOyThFWwnHEC0H8t
	PYkybVTMH8HS097tGHSSNTWSYytjXufq1q7rP3w77FyTfX+CV/x3hmMaQz8tehU=
X-Google-Smtp-Source: AGHT+IFQBoZVwEzaKSHH6GSHnwF+OsB+LadCOAluYT1wt3+X1dAsrpBvWeyGAz3FdiU/rHpHIDmccg==
X-Received: by 2002:a05:600c:5612:b0:40f:d3b3:b6d2 with SMTP id jr18-20020a05600c561200b0040fd3b3b6d2mr386193wmb.14.1707155742633;
        Mon, 05 Feb 2024 09:55:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVCoTPb98vKy8EX56dDFMSTkbZ4dn33RHsT29UyQh81X0ZnajudOIax7Wv1spxLx4brCiYzTK1zQRGxJGeQ7GAYyy1SQzMG6KVmHAhAV0EIw58NtxOz48nJ6RiXBIt5pyU4kz8IXas7fu30K5YVJOOehG6CzKmeMRjKSb1KwHOA60P3jogmgB9Q+HVgCBwoeg+4HB1K2OysMOVSJF5uG5UGADD0oQ0RFdUtwVaXpms3wDpNvAHDEop4yrtppGP54r01UmZYo2hZnKBGggUPiwiVUS8EIBUAu3O94O1m/0Yq1xqsTh61ZUbYchP8gyTjwrulBosbqAGlO9jYzAk+2B6huKi46Mdf0NoHutLb29EVzIQBL5BirHlLoo4CJGOmwFZl/C057TzxAm/sjwUMbWEVSq8JDBKVuNewezn64ko/F5dVO/k0vpBN6caqbOwPfn/W9c6/JjVlWv/0ourL69xeKGjRUbvuBfGO+rXSrTdDtGkZdFnFxj7mlT2gFziwHDfyDf3LiIyTEP37En0pJ+glHrXHX1cDhkrAb79UJhPOsRRXl93SCqh0bih2rjRy2c1dfZ46778K5/ca93e4DwHWN+GUXAcXbGvuHFnU7wiIDlVoI/RNVN/Qdx792+lAZ9q4O8BMcLSyGFge8N5lQH9IAO+SmCGW751m3S890UQzSUsMOgChfoX+UP6fKfOhBnA+R5J2gc5w7XE+3H8sVVJiLe3rUhnCLjoCAWZysMwo/oqjSUIKc/PimMY1NQH+hl0=
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id je16-20020a05600c1f9000b0040ee8765901sm517556wmb.43.2024.02.05.09.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:55:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 05 Feb 2024 18:55:32 +0100
Subject: [PATCH v10 5/7] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-5-dc06073d5330@linaro.org>
References: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
In-Reply-To: <20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-0-dc06073d5330@linaro.org>
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
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlwSEVWuoZmhF/j2rik1x2MG72GYw9Kha028viMega
 ujV9kvOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZcEhFQAKCRB33NvayMhJ0cS6EA
 CqhLE5qwspTDUuycmAMyzXEEr/Go7L95TsFMEWIs0O/+j+GlxMrfBP532OgRvBzsRyPlwyHZ38xYpI
 SpLpmvOyL+VdJfZBlSGESjEDF7VR6QXZaMs0muBRoWAj2/qwv2VxET/TDfLdT/tlDZfwyBFwNpUtep
 o308DxP7aREzgPjCPBkvgi6xuXp32mpY5usnVc/C4SXuO9JSJNX1xPPXUVnDm+J6bDh9lhAY0s0OaK
 SqN3XktjiEcQoNcADYZCMYLB/gX3YrvIK26lK8jGjWJCjrbKHAQYc3NQFcGBpI/jlS1zbfuROjMlWy
 TmJC4AKfRevlCScpEdChqcpe3DN9uNPcGBywX7ht8yABd24M5OSczw65UUVaKddTe/saxppXBsX0Bc
 p0CK7JGX6UtJP6BwxtPpoBoVPWRCd96UaD5BIUSQd3HaCW/vOdJl9e7/9Qf1qF5y5WXOyWN/YnBiCG
 sJv0aUVVu0Lt3ypCPuCXJ/ZUbZFhiu0ty2Y7T9hyJCYlq4NP/ynL9XcrF259EtAA5dZPcw6HMHfhYO
 386WN81iKkYoSOlxoPGzzNsUpV7Lh9FD4zE8ViajjaK5CgCTN/AOdqp55oGC2TpIl6bnpEMO6sSFBK
 aGwmO95ejsdCV1LDyKyP7FHQahCy+B+w9ZiTkKChwEnmhKve8ZbpzV2tDamw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_095544_051027_5BD2CDE5 
X-CRM114-Status: UNSURE (   9.20  )
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
