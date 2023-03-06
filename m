Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA6CAC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wPA3d4oL51PlEb2NwzzwfC/R8srEoRWQUmdd8OFTOo=; b=025QyOHwKZHCvp
	r7twSHuo8nFs9AgMrFgcvPWnBMR4Fz3WfI5HdTl6k0bv5rFKtOb7HEIqznp9icPGL4cKqi7+6j4dI
	BbDvaX2jM0nYXQJulcb3UeOwdbu1HXOO2yUaeTOOV+5rkPoTW/MxvNYEMiv4iI/c4E+VubKIdaeFN
	eq6LUZXiVSg916fOYhMavoaUVOcI8mIASkRU67OpyjtfeWtbsUjZnnf46nJSwLe+lTEChWtQ8P0oo
	SU9UkpYy7MT7RHpP3WSvOE98aH+vRS4JAhCcWkTreOP07T+r/2NSlRCpwj321c5zsN+pXF7l1rm71
	LCNHds4YJV9op9tuZxMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9jg-00Cdh6-AV; Mon, 06 Mar 2023 12:14:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9jB-00CdTG-4G; Mon, 06 Mar 2023 12:14:06 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l25so8585880wrb.3;
        Mon, 06 Mar 2023 04:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqVGLCz75in4ibx0Afcg4VSjNSP/OXCd6v9qu5TVZNQ=;
        b=UoFXneCVw3bGVin62ZuU3ZlNMIfvK9/I1ysAfVmo5C5Z0o9FbzP1TAdGV4uIUCzyui
         4AbPrA4kaIM1zPtbVtr1/FT/KE72xpST8yjXeLkZgnHG6r0oODNFs/K9RUW5wBIGx+Wn
         RkGJ97cTiT05VzMHN4cc/AqBhp05HB26Omzaw9ylxll2a/eEI1xFhyrvkHzyv1HFB81m
         tdQ79aFm8jVINdnzhks31IJE1Q+iyiFsWlOx/MXEhamJvuJLoLTdjtUYZrCYXrORLBco
         c7cdoOdne0cJV3xbLIX59zFZrzncvRZkD3F5i6Oheop7wQ0WvYfvjIgEw89YdVeaFpsl
         y1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqVGLCz75in4ibx0Afcg4VSjNSP/OXCd6v9qu5TVZNQ=;
        b=aMU8b52BlOGGtGQD0e5I4l68DUXun8ZTF9c3xPOhRflixu732Ta5cvyiIycqVd3lyw
         oKHlnQkCow8i+po+WS3E47VskPZEKA94H8jAily3w7QRw+JwO5UT7/6h71lwDUDIXfQR
         h3ZxpmDM5ACcHKj+5N1l1F7lFrfqcEwDCVzzEn9M9dKKAbLTXlw8grE/MdweerpwKLz8
         UWCP/ZE1ITUf9EFyMa8dNkM9CITOocCEaO2MQacX+a+1AI746xZUEF3KYEI0YXtG7n7Q
         2gzMnixt5VG8xb80XS8tXg4CSfkRC59+RWl83Mnt2f5ClpG1OyXtBfSJBFYyQnKKmjXF
         u+vA==
X-Gm-Message-State: AO0yUKVgUG3FYNOl1z/dN/Q7AnlmzCXCLIXsb0FiOuKrjzqIHYmZXmkN
	7vy1p6VSFr1w2yz+QRFv2ng=
X-Google-Smtp-Source: AK7set/7CcyTILdEdpKMbdTF3pQOgOw0GbK+81e8lswCbjaUwLB8ONJL33rb0+oGH81XDMY8c+TzgQ==
X-Received: by 2002:adf:f408:0:b0:2bf:d285:b787 with SMTP id g8-20020adff408000000b002bfd285b787mr7146208wro.56.1678104843493;
        Mon, 06 Mar 2023 04:14:03 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d660a000000b002c70ce264bfsm9814798wru.76.2023.03.06.04.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:14:03 -0800 (PST)
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
Subject: [PATCH v3 3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio support
Date: Mon,  6 Mar 2023 12:13:51 +0000
Message-Id: <20230306121351.1606360-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306121351.1606360-1-christianshewitt@gmail.com>
References: <20230306121351.1606360-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041405_193017_F672E902 
X-CRM114-Status: UNSURE (   9.97  )
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
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support for HDMI and S/PDIF audio output.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index a800e8955c4a..e238f1f10124 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -9,11 +9,19 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
 	model = "Videostrong KII Pro";
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		led {
@@ -34,6 +42,58 @@ button-reset {
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "KII-PRO";
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
