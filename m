Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A76C761AF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejRXllRgLtqNskHIrnYegYNhmjRZwsm3gFuyEEi0VPo=; b=slpznHKZEsN/JW
	QlEjsS4+IBbQ8A5TKUfmPtxsl6TyoQ5ZtMkoLI3tftRjBwg9kw7Auq9iKe3HYtVnV5NjbHQkiGBcp
	N+GmOok/H85qcbgp8vWRo7K73IHPxOjnpHUqTJ399GaeW8Epdd3jbSB2FQXPMXDM5v4In2Lq22fEV
	q5kDArVF9+Lz/x6Nj3n30CwFtKvFhqWXNISQmVS+/Iz2dYD6OZ6JpRq//SXhvdwYr87LhJPYjkce3
	1aWUxOT9ocRWgLpekws/2QsCCOWN3n6u6+eTCbYMoG3dTLdtrR1QQIok5L30u43EogHZ5P1ebkkzr
	WTzHxN0qXB14Ckc1zNgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXW-00DBW9-2A;
	Tue, 21 Mar 2023 17:12:50 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pefXT-00DBTu-1o;
	Tue, 21 Mar 2023 17:12:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id ek18so62535591edb.6;
        Tue, 21 Mar 2023 10:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679418762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8YeJ+TdrXR6GASdOVRx8PnOQuXI3Ew9qQcS8RKH/78=;
        b=DnxpTmFgZBR0Rcv2oWHKp2RY4srhlT6dq6CWxiP1Rut/B5GjYwOAJugOuG+8zWjwv2
         WQM3YFL9e0p+Pkeyti2ijROfu4NlN9OoWhPYm9nLzbCO0pz7hghwNyNVu5Vl3sQ6IVh2
         mC0hoUHlAYJdYm53LUYrT6cjlzI7MEpNIuT1KKs6+KW95Te9h3M7+OWgnFqEK3hwlVWI
         MOtMaDVbOaeyg8AkegJgz0oFSqOzM+q0DW/3+eBb3wAn/2uofZPuJLDNGMbo0iKcqYzs
         hcwILSYgCWEGn3rSJH5JIGWoOqe/2svOQNC8/nIYCxr5uDLij3LN/eDE5mT56/7lquK2
         ws6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679418762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8YeJ+TdrXR6GASdOVRx8PnOQuXI3Ew9qQcS8RKH/78=;
        b=6sP6pDSdUOZAUeZkRebsZkTVPKy5EcQI/UC7LofvdMtYs2DJYTKayUnuIpwf7dWFph
         c96Lm2GqBl5CM3f/Q/ajRlSZiH91j+2oIE6Ph7cxmjNtgcDxLT3yO2FtH/+/aj2Uqv2T
         Ed/UKmB9fyrbwREt0KmSKMa+BysqKJTrcqsfJk+2/DXJLC5m7RMauIi++Kri874mg1GX
         AtiWxJ43vtjMmLTt3PEVqxYFhg8C0/TZQ0oUL7tDkEWwMJvUFpvw0ilj74FcCgoNQSoi
         fgbfNeb+mQ8Z1CkwbZgZg60LbqY+nzEtxvhyg63iWfypS3qDw5khtI5BVi7domfLFuVj
         k3cg==
X-Gm-Message-State: AO0yUKU3x0f95rhfPOAaD0gEI+wOVr+s+OVsU5BNQX0kWiVjIViL0yCk
	1JweVOGalazCjlOehfdT9K4+IXGz5zE=
X-Google-Smtp-Source: AK7set/7cZpQR+LBs78M97gFWMBE6qyE8WRAHy1AkmsN4TheLHOLdLP7X2RpIzKmkUUIsVIPbW7lcA==
X-Received: by 2002:a05:6402:114d:b0:4fe:9374:30d0 with SMTP id g13-20020a056402114d00b004fe937430d0mr3471011edw.39.1679418761776;
        Tue, 21 Mar 2023 10:12:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-bc57-1c00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:bc57:1c00::e63])
        by smtp.googlemail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm6474959edf.63.2023.03.21.10.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:12:41 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 3/3] ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support
Date: Tue, 21 Mar 2023 18:12:13 +0100
Message-Id: <20230321171213.2808460-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_101247_751151_2BA2793A 
X-CRM114-Status: GOOD (  13.18  )
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

The MXIII Plus uses an Ampak AP6330 Bluetooth and WiFi combo chip.
Bluetooth is connected to &uart_A and requires toggling GPIOX_20.
WiFi can be routed to either &sdhc or &sdio. Route WiFi to &sdhc
since  &sdio is already connected to the SD card. Additionally WiFi
requires toggling GPIOX_11 and GPIOAO_6 as well as enabling the 32kHz
clock signal.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 48 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index fa6d55f1cfb9..aa4d4bf70629 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -19,7 +19,6 @@ aliases {
 		ethernet0 = &ethmac;
 		i2c0 = &i2c_AO;
 		serial0 = &uart_AO;
-		serial1 = &uart_A;
 		mmc0 = &sd_card_slot;
 	};
 
@@ -45,12 +44,32 @@ button-function {
 		};
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+
+		pinctrl-0 = <&xtal_32k_out_pins>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&gpio GPIOX_11 GPIO_ACTIVE_LOW>,
+			      <&gpio_ao GPIOAO_6 GPIO_ACTIVE_LOW>;
+
+		clocks = <&xtal_32k_out>;
+		clock-names = "ext_clock";
+	};
+
 	vcc_3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
+
+	xtal_32k_out: xtal-32k-out-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "xtal_32k_out";
+	};
 };
 
 &cpu0 {
@@ -192,6 +211,27 @@ &saradc {
 	vref-supply = <&vddio_ao1v8>;
 };
 
+/* SDIO wifi */
+&sdhc {
+	status = "okay";
+
+	pinctrl-0 = <&sdxc_a_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	max-frequency = <50000000>;
+
+	disable-wp;
+	non-removable;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_3v3>;
+};
+
 &sdio {
 	status = "okay";
 
@@ -222,6 +262,12 @@ &uart_A {
 	pinctrl-0 = <&uart_a1_pins>, <&uart_a1_cts_rts_pins>;
 	pinctrl-names = "default";
 	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm20702a1";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+	};
 };
 
 &uart_AO {
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
