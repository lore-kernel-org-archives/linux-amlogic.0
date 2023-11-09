Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DE0C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TC3o9hevuYH6eMZZZs/4ZqRijW4LhjHPhBpY5FTOZE=; b=VjxXFlIim1lK9j
	pAYqRMu/6Rd88+WeLbJ2iMU14wv5+2mpaLJRnprnXffKP2PSJC+LgmoaDhgxWyFvZbg8L2pUsbClF
	5MCJtas5XYRv5yFh5vkBqR8L0cuv8Y7WyOpcbRWmz/6Gn2bD5r19aHHwMn9IvkGdG+egBSyDsH1vt
	cGZCKDd5HnJTr5eQtk6YRmsWe4MDWE95ZaDKKkXP07fkziHMioMwT1h5dCUtiNakrssm7V/rpq+wH
	tUrzjcBPjKbYasGb6vZpbVZNlnnYEVN2mZV8aH2vt6wy0mCwedI6TqBr8Fqulw7RYhb629ieBBYfk
	uAVdoi32Se2BVu77QmjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10u7-005h7O-25;
	Thu, 09 Nov 2023 09:00:47 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tq-005glF-0K
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:33 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5079f9675c6so767832e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520426; x=1700125226; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=Pfrw6rYhdNYXNoh63QB3eU3It8EK1jvFd1361FULM/iNBozSt5Wrg/jNraSp9jiSkf
         nXyVqqPZhU1RfRUJqmv7QD3mfZFfGna1hCaUT7YzxRjj9l+Ub9C3ZoqNSbXb8sZ9asVU
         7TSFQfO9EiFexccQQx7FYLPwkQ+mtrxFOLS90yj5H4OzAkEA4iJIC/4MSr2lu1jUWuYS
         oGpkiCmqEGGD6UesyYBS4g1JflamsRrknDO7hpLy6P++xAyh007bUjsL112+SZvwwq5+
         gKtTtpCotIjDPZhxl04LwqJjY3y4LVzKtk2jMnWGGyGK9CV0HqYpnql0X8Z1TbzeYzEb
         +riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520426; x=1700125226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuSB6hXQgNnhjhBZYMiuriEMaNCWnOiIqJ/w1UyCkVs=;
        b=v8qrPO1KnTo5zk6wh7ZJXoBg5dCHFo+oRvPx4UmAcrhTofd/wjhCMW9ApXEdqozKK7
         eOcNX+oZbUk6IF35gGfMgzoYAT3KBDAKVligD1ePL/fhiywG+r8xa+sYsWdr4mt01XyN
         SKKt1gGuKFjzlQDijHlHwV0x6ep4kI4Zh4gBZb1zeHbYFCOL3hjU1Hx3cotypmvf9Tdi
         7F77kuFmYIHEStyNb4DiqxJrCxhCtlUggpBhMCZdwmFMkCobRhUz4jDt6h7f7qfKPO+g
         +Q41g7aPBMtLCQBNMrEulvuW2CEOnmAfSIKN/cuwIIcqqfd4QUGK5uy2bFAO+AIK1cXG
         7wQg==
X-Gm-Message-State: AOJu0YwunCWEq3aur8urMnXyA8yBv1kgQ/+lrbXDVJr65Eq5xd1VDlym
	nWYldSMwXOLM+Ie8c5dHCAHB6+0+o5ndxiSjVxhHikcP
X-Google-Smtp-Source: AGHT+IFp6a7B+08Qs7kzVjwz5xE/v2ASX3jMKbrYx5nFLBXZBjgW+CvtIZunwhDWGP4a8erXu/q34g==
X-Received: by 2002:a05:6512:911:b0:507:f0f2:57bd with SMTP id e17-20020a056512091100b00507f0f257bdmr755918lft.66.1699520426132;
        Thu, 09 Nov 2023 01:00:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:11 +0100
Subject: [PATCH v8 10/12] arm64: meson: g12-common: add the MIPI DSI nodes
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-10-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xeZV8gmIC9/2/oObVVqqYZ0sOhta5dqkacXris9lM8k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+ZCu6htgUtFxFaXFAKQp1sZxpR7+IzNQz6TU6c
 bVMpqCaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyfmQAKCRB33NvayMhJ0dbQD/
 9jQPYUo+YgcSZCmVFq6YmWrr0+Kkyas8OumKOcdeD3c0ym2NBiqCdKuAzkZ2V4+n2xhsTtSetTgXVs
 N67M8YGG8ZLEeTFicfNF1EcFgZeleWg8hoDnLQkSt4XUkTwREnBcFFy3QhCFhJDDU//OvvrA3CK9hC
 UHlbtR3s3qrRhPfgSpiLgvOLt/bnZIXlbe8OEfnjt4/FjgFIcZFjf+Li5y7Js2GG4GP0Y48uivqyKY
 V7vMXV+wFLbXkzHbn2lhoAhc2Xc23wIDPa3fL+VEp9fIFMwOt3dXeiFx+gmWmPB49Q7NCHxSUopXVo
 1+qpWPC3AfaWIEorcrnTiTu4fn32pxFQQNDozadRAb90jELPM7bwMKdJAc6WWKHt6fmR6j2cQAE351
 43dhzroLc9BQGz8wWt1kiKy8tKnmP3/zbTHFBdOi0gftwtDiqNKCYcSrbHupbSLDXttpUqHUd97LwS
 oE0nugHWLLZmqLAIhJJmce+XXrdupLYJrxduf/d/BPFYYoN85gPc7hB3ZDvXCWT9nYpIXzrQQ3G6Lf
 Tk+w5oteJ9HgbzOBX0eIGC1J9UpqjsDo/YVBgSqS99JYkRpTVp0htzv65jnKRB0Guy/Npmtxq6PGxV
 hUnf45HtzEj9BKucV52ykAekSH5w3RPphPUDNEsHfhyz8/dzMTzj4KRaykUA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010030_169220_CCDB9DD7 
X-CRM114-Status: UNSURE (   8.99  )
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
