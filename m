Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A11C001B0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Aug 2023 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRL18T4fxQpo0eNZnBl/xIBQf40JGzgcTx55MRo7UVc=; b=hU8cjvyvxrZf6X
	6FBZgBbARQw4Y+aXuMu+Qw/IlY4aMhBiq3nDW3oZ0sYayFRMvx3r0/UIDCzfkRQlOWcrc6szXDIPO
	8suNPtR1J1jSlXrt3vHth+C4BkePmteWCmie7kN7CNIvQGXveiPY9jo5HUBWZMnkvMQFem4VH/65m
	BuN4bt+25ThjeJankJ2ptYUJxsOfB7NNC06o6+sRlDDSJP9SHs/VDtwSvMqdI8oKx9vLGzTJubJLo
	ofoFDwnDo0ZnL7Q1ttEWjVXVNs5Q/g+bPGuA/0dkFNZxzYGjMLj+x1BgCR1Bwj99uYFCPUxoVczvp
	Fln3kUEH59fntkdkVn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLR-001Cvi-27;
	Tue, 15 Aug 2023 09:28:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVqLL-001Ct8-0S;
	Tue, 15 Aug 2023 09:28:04 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-317798b359aso4514572f8f.1;
        Tue, 15 Aug 2023 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692091679; x=1692696479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxLmACEq8DwvR1DlwOAwmK1lXNm1dEuNHjSmvA+D3D4=;
        b=FX/o1rqpRFL5xfRi+6HUlHxU7IDdu2pvJrfL9KhKIugOtkau9zCJWta7/bgjIjy5gr
         NJ6YmwtZoqg/38MW+rvT6YScskVPl9bXtRpQ2+aXIESLHWXzl1SXm9obfSGegZdp6BMV
         ptGrowxXbEmPRW1lto1CEbCLkbkEFqeanwWjKuslJdJ00p2s9Pz/IcXqI7MCtN0PT428
         L00qB8LpjOeYbBpG112XMcB42ZipYVB0PURgihWjmnqrd1WPUWzDk5y9RRTbmHpqFcuS
         /8jKBvVkxCF4dkahYzeQKyJ5zxEXmbuxnoj77LDwdTiywJounhqHlbohX3VSOK+k3hc+
         esTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692091679; x=1692696479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxLmACEq8DwvR1DlwOAwmK1lXNm1dEuNHjSmvA+D3D4=;
        b=XxpAn9UcQm+ql608uNASHHGoGOAi4/lqDGe9EX7tHCzE61zmx8zEqt2vfgrSNM6Ydg
         b87nLtdkEF9F9g+mv3EmAk3F+wCG5KpSF1jFiDGlJsl5fZpf7EBRtDWVvlL06evmMyXi
         s4lStbqoiJzpU4s2JFKytI3gEf8+XzoGUy2xfDYx80hgpShxuamN7x/5DfNGEj5nRZO/
         FW9dWQ0anRJR+Y0zrHqLuHK1qFFJDoBbxWxyEMx2/050FVWuSwEr52wCPPcqaAWifwV0
         4XG2NBNLKQri4RyPgqUYDD7XrPmNZjNUFYnwTQONh3zVL0A96OtetXPd2ftyFd5QONrB
         Q4gg==
X-Gm-Message-State: AOJu0YxGmco1a/pXozWyWinVV1w+LTJHj5t79cEmQtqWEbVCdjdX7e1k
	s+Ivv8jW/oB/MdDIGgObU/8=
X-Google-Smtp-Source: AGHT+IF3cQZNWTyrBIiA0J/8Z5kQ+jSt3gu7hM9b3t2zxfiduxi/iEYIwMYG2mEkwrEV480a99XxAA==
X-Received: by 2002:a05:6000:110f:b0:317:6fff:c32b with SMTP id z15-20020a056000110f00b003176fffc32bmr8660548wrw.53.1692091679216;
        Tue, 15 Aug 2023 02:27:59 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id p1-20020adfcc81000000b003179b3fd837sm17230853wrj.33.2023.08.15.02.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 02:27:58 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: meson: add audio playback to p200
Date: Tue, 15 Aug 2023 09:27:49 +0000
Message-Id: <20230815092751.1791195-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815092751.1791195-1-christianshewitt@gmail.com>
References: <20230815092751.1791195-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_022803_186213_DAE8457D 
X-CRM114-Status: GOOD (  10.67  )
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

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-p200.dts      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 3c93d1898b40..292c718ee19c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -9,11 +9,19 @@
 
 #include "meson-gxbb-p20x.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p200", "amlogic,meson-gxbb";
 	model = "Amlogic Meson GXBB P200 Development Board";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	avdd18_usb_adc: regulator-avdd18_usb_adc {
 		compatible = "regulator-fixed";
 		regulator-name = "AVDD18_USB_ADC";
@@ -57,6 +65,58 @@ button-menu {
 			press-threshold-microvolt = <0>; /* 0% */
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "P200";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
+	pinctrl-0 = <&spdif_out_y_pins>;
+	pinctrl-names = "default";
 };
 
 &ethmac {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
