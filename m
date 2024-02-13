Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA5C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 14:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=78qellq1UxRhGI5e1aO3aatTA2v9GUvk5MhEa3FizHE=; b=Qf29hSsiAjDjrR
	0KTGP0WWWjTUSgnSIUig34ZbKxIWUkxRhdB1E9dGaMc53G1mR2gMfFlQtuJtqodA+UbNs2raNDQOM
	8ZQ2aECqil9ap/FeCNFWmTk+/ueu0eDBIH/V2N6wcbw5xdSDJLjqn1ulRLebeD7jEDAMiOD/eq2Up
	p9QeJXIJ0ym5M2GQ6aXcJehTB5u+z27TG+GhUDN1vr31ilGTMLt571rDoMKu3FGFa/AEU65CoAyrE
	LMwN2r9gDpi3N0qDN7/LDawl4EfomGCkkaQ1+yRc4WBosbA/BUXVgMFjZluRGg1cOOEwTDG5WyYpM
	/lnl0vLXKimPclDQeQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtq2-00000009X2T-1Qrv;
	Tue, 13 Feb 2024 14:32:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZtpg-00000009Wvp-2WBQ
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 14:32:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-410ed9f8621so14467865e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 06:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707834742; x=1708439542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9+8mHmUHfkq8ZRxRvmq4bFoGYF6kk7h+QtVEDMbUuQ=;
        b=K6AYOTK63aq3noakqHHYENGTAWXTElRMkMg4oyjivWOsrHtK9dDpDMN4Zao12DYkVo
         B1Ah67ahZ/5inqXdK0kEgnaE8mmCC340v1sGNGa/rVJWGIqRQ4Ra41BQz4qeePkMx6ey
         QpzOQef0MNVvgyCT/qJi4x+4wrGWwfH/ZHwUqw/+lWD/IqUnJIn6R07z6HHX1lx9vp7k
         dRjeV1kZX5yrhj8BwNWqvnmj9uWx0dR2I3QdEuZqQAHqDXS8I/YdQg178Q7GenqP9XLe
         Ak3fr0JO4Y6MWVAhYexvonPIsBf7ihsGPglL9kLfTOohY4CaMaxifM77lGnQRbWpe0uv
         OEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834742; x=1708439542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9+8mHmUHfkq8ZRxRvmq4bFoGYF6kk7h+QtVEDMbUuQ=;
        b=qkzUNN2XlFL4U9ZFDZabvQFhHREnmJyzO45IK1ahKSUACJupYtlddw9ceHFteRpF7Y
         z+XNJPXhifqifMc9TuOCwvtUHmO1M13mX44bBdF1ycKZrfbh2Ri0gRcPP/1wQNTkFgZq
         Gvhl9IdysUZne8dpAoIIYsLDMwQpY7nPEoFPaCDt3pMJgugDEYhju7ICA6wB1Ai8zCsC
         tfgy2gLPHbmAmbZRe92FmKfX47qEbYJsErbJgsvpFAQ4+aQ6U4NUtLIkt+TrZoM0ay1Z
         E2R8DD8NLkCdcsBye57huO7My1COJ8HtjByLn8E4YPmzyGDjGmP166hLUDZomdgHYsBt
         hWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhz4tKnEPKoSyhNU0r0jJ/pQJV4YQD905X4z6Sf5d0kX7Yl2UogI3WTh8lfx1RGLvBCxzflLk6RKSMzhwbYANuzETLQ2ZeWtsQe0RRyPk2lq4=
X-Gm-Message-State: AOJu0YycMGa2UhyHgPE+rAQL5KZapTh+r1sijsvm27XQRWVJgbtPk0EM
	QsVUesAA0AMlSnrldNXq4SvEV0QFBbR5Fc3BEowLoUQiXA1mU/dR/jd0hIvjwy8=
X-Google-Smtp-Source: AGHT+IGMY2IVN6GNMM96apQg4nNaUfGTKrONS3okJAnnqvGpOmBLOUmhO1OrWcEFguN/LpLBuFcyKQ==
X-Received: by 2002:a5d:4a82:0:b0:33b:2c2a:9355 with SMTP id o2-20020a5d4a82000000b0033b2c2a9355mr7131647wrq.56.1707834742325;
        Tue, 13 Feb 2024 06:32:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYMg5sDhM9MlnT+wa35NyRtW2cRIfno7YEW8mJ7I3ti46TcwrBU1h+LyoU/b08c2t2Na52hGBJ0wwWnC2lu8hxo6pcHMLi7DI5Y6Fszx8I1Uh22kR7eo5TNGnmtOP1LQPFetdElW/1uzU9dTIEI2rojTW7y0IVGaQBoNqcArv4WtwJ2e6QDA6T4MIVT7qnAKGHo602+eWvSgBvOBwTxxkdbsMpOGCnM/IQaNuuH281NVhr7oigRmh5HBii5jBilBVHQiEdhb4lw7XK7bjkJ43qpsr+pmW3t26FRzrc3LuqpIeRa29NnV0HWFSq0U23ua/3MveOX2AJBOqOs0eqU/RU59mVhg4S+sKBiY5q/+bN5tRwfkujzPEZ4qQ1x0KFzKhfMwwO60q21pDz1oj7cxOyo802fSZV/KK9Rk2VXQfI9yjhW9nw7Kw=
Received: from krzk-bin.. ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id b2-20020a5d5502000000b0033b278cf5fesm9638311wrv.102.2024.02.13.06.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:32:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH] arm64: dts: amlogic: replace underscores in node names
Date: Tue, 13 Feb 2024 15:32:17 +0100
Message-Id: <20240213143217.336341-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_063224_747904_EBBE33B1 
X-CRM114-Status: GOOD (  11.46  )
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

Underscores should not be used in node names (dtc with W=2 warns about
them), so replace them with hyphens.

Cc: Marc Gonzalez <mgonzalez@freebox.fr>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts |  2 +-
 .../meson-axg-jethome-jethub-j1xx.dtsi        | 14 ++++++-------
 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 16 +++++++--------
 .../dts/amlogic/meson-g12a-radxa-zero.dts     | 12 +++++------
 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 14 ++++++-------
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 16 +++++++--------
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 14 ++++++-------
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     |  2 +-
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   | 20 +++++++++----------
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 10 +++++-----
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    | 12 +++++------
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  8 ++++----
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  6 +++---
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |  8 ++++----
 .../boot/dts/amlogic/meson-gxbb-p200.dts      |  4 ++--
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  6 +++---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  8 ++++----
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  8 ++++----
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |  8 ++++----
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  8 ++++----
 .../meson-gxl-s905w-jethome-jethub-j80.dts    |  8 ++++----
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  6 +++---
 .../meson-gxl-s905x-libretech-cc-v2.dts       | 12 +++++------
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |  6 +++---
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  6 +++---
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  8 ++++----
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  8 ++++----
 .../amlogic/meson-gxm-s912-libretech-pc.dts   |  2 +-
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   | 16 +++++++--------
 .../amlogic/meson-libretech-cottonwood.dtsi   |  6 +++---
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     | 10 +++++-----
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  | 14 ++++++-------
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts |  4 ++--
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    | 20 +++++++++----------
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 12 +++++------
 35 files changed, 167 insertions(+), 167 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index 1c20516fa653..4bc30af05848 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -106,7 +106,7 @@ &spifc {
 	pinctrl-0 = <&spifc_pins>;
 	pinctrl-names = "default";
 
-	spi_nand@0 {
+	flash@0 {
 		compatible = "spi-nand";
 		status = "okay";
 		reg = <0>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
index db605f3a22b4..a53e1fe9ac1e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
@@ -35,7 +35,7 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -44,7 +44,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-always-on;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC5V";
 		regulator-min-microvolt = <5000000>;
@@ -52,7 +52,7 @@ vcc_5v: regulator-vcc_5v {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -61,7 +61,7 @@ vddao_3v3: regulator-vddao_3v3 {
 		regulator-always-on;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -70,7 +70,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <3300000>;
@@ -79,7 +79,7 @@ vddio_boot: regulator-vddio_boot {
 		regulator-always-on;
 	};
 
-	vccq_1v8: regulator-vccq_1v8 {
+	vccq_1v8: regulator-vccq-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCCQ_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -88,7 +88,7 @@ vccq_1v8: regulator-vccq_1v8 {
 		regulator-always-on;
 	};
 
-	usb_pwr: regulator-usb_pwr {
+	usb_pwr: regulator-usb-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index c8905663bc75..7ed526f45175 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -12,7 +12,7 @@ / {
 	compatible = "amlogic,s400", "amlogic,a113d", "amlogic,meson-axg";
 	model = "Amlogic Meson AXG S400 Development Board";
 
-	adc_keys {
+	keys {
 		compatible = "adc-keys";
 		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
@@ -111,7 +111,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	main_12v: regulator-main_12v {
+	main_12v: regulator-main-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
 		regulator-min-microvolt = <12000000>;
@@ -119,7 +119,7 @@ main_12v: regulator-main_12v {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -128,7 +128,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-always-on;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC5V";
 		regulator-min-microvolt = <5000000>;
@@ -139,7 +139,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -148,7 +148,7 @@ vddao_3v3: regulator-vddao_3v3 {
 		regulator-always-on;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -157,7 +157,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
@@ -166,7 +166,7 @@ vddio_boot: regulator-vddio_boot {
 		regulator-always-on;
 	};
 
-	usb_pwr: regulator-usb_pwr {
+	usb_pwr: regulator-usb-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
index fcd7e1d8e16f..15b9bc280706 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
@@ -60,7 +60,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -68,7 +68,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -77,7 +77,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -86,7 +86,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-always-on;
 	};
 
-	hdmi_pw: regulator-hdmi_pw {
+	hdmi_pw: regulator-hdmi-pw {
 		compatible = "regulator-fixed";
 		regulator-name = "HDMI_PW";
 		regulator-min-microvolt = <5000000>;
@@ -95,7 +95,7 @@ hdmi_pw: regulator-hdmi_pw {
 		regulator-always-on;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -104,7 +104,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 4c4550dd4711..61cb8135a392 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -15,7 +15,7 @@ / {
 	compatible = "seirobotics,sei510", "amlogic,g12a";
 	model = "SEI Robotics SEI510";
 
-	adc_keys {
+	keys {
 		compatible = "adc-keys";
 		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
@@ -83,7 +83,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -92,7 +92,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -100,7 +100,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	emmc_1v8: regulator-emmc_1v8 {
+	emmc_1v8: regulator-emmc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "EMMC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -109,7 +109,7 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -118,7 +118,7 @@ vddao_3v3: regulator-vddao_3v3 {
 		regulator-always-on;
 	};
 
-	vddao_3v3_t: regultor-vddao_3v3_t {
+	vddao_3v3_t: regulator-vddao-3v3-t {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3_T";
 		regulator-min-microvolt = <3300000>;
@@ -147,7 +147,7 @@ vddcpu: regulator-vddcpu {
 		regulator-always-on;
 	};
 
-	vddio_ao1v8: regulator-vddio_ao1v8 {
+	vddio_ao1v8: regulator-vddio-ao1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 8355ddd7e9ae..3da7922d83f1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -75,7 +75,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	flash_1v8: regulator-flash_1v8 {
+	flash_1v8: regulator-flash-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -84,7 +84,7 @@ flash_1v8: regulator-flash_1v8 {
 		regulator-always-on;
 	};
 
-	main_12v: regulator-main_12v {
+	main_12v: regulator-main-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
 		regulator-min-microvolt = <12000000>;
@@ -92,7 +92,7 @@ main_12v: regulator-main_12v {
 		regulator-always-on;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
+	usb_pwr_en: regulator-usb-pwr-en {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR_EN";
 		regulator-min-microvolt = <5000000>;
@@ -103,7 +103,7 @@ usb_pwr_en: regulator-usb_pwr_en {
 		enable-active-high;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -112,7 +112,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -122,7 +122,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_5V";
 		regulator-min-microvolt = <5000000>;
@@ -133,7 +133,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -142,7 +142,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 9b55982b6a6b..05c7a1e3f1b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -66,7 +66,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	flash_1v8: regulator-flash_1v8 {
+	flash_1v8: regulator-flash-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -75,7 +75,7 @@ flash_1v8: regulator-flash_1v8 {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -83,7 +83,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -92,7 +92,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -102,7 +102,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_5V";
 		regulator-min-microvolt = <5000000>;
@@ -112,7 +112,7 @@ vcc_5v: regulator-vcc_5v {
 		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -121,7 +121,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 91c9769fda20..d80dd9a3da31 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -19,7 +19,7 @@ dio2133: audio-amplifier-0 {
 		status = "okay";
 	};
 
-	hub_5v: regulator-hub_5v {
+	hub_5v: regulator-hub-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HUB_5V";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
index 9e12a34b2840..09d959aefb18 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi
@@ -48,7 +48,7 @@ led-blue {
 		};
 	};
 
-	tflash_vdd: regulator-tflash_vdd {
+	tflash_vdd: regulator-tflash-vdd {
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
@@ -60,7 +60,7 @@ tflash_vdd: regulator-tflash_vdd {
 		regulator-always-on;
 	};
 
-	tf_io: gpio-regulator-tf_io {
+	tf_io: gpio-regulator-tf-io {
 		compatible = "regulator-gpio";
 
 		regulator-name = "TF_IO";
@@ -74,7 +74,7 @@ tf_io: gpio-regulator-tf_io {
 			 <1800000 1>;
 	};
 
-	flash_1v8: regulator-flash_1v8 {
+	flash_1v8: regulator-flash-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -83,7 +83,7 @@ flash_1v8: regulator-flash_1v8 {
 		regulator-always-on;
 	};
 
-	main_12v: regulator-main_12v {
+	main_12v: regulator-main-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
 		regulator-min-microvolt = <12000000>;
@@ -91,7 +91,7 @@ main_12v: regulator-main_12v {
 		regulator-always-on;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
+	usb_pwr_en: regulator-usb-pwr-en {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR_EN";
 		regulator-min-microvolt = <5000000>;
@@ -103,7 +103,7 @@ usb_pwr_en: regulator-usb_pwr_en {
 		enable-active-high;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "5V";
 		regulator-min-microvolt = <5000000>;
@@ -114,7 +114,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -123,7 +123,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -171,7 +171,7 @@ vddcpu_b: regulator-vddcpu-b {
 		regulator-always-on;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -180,7 +180,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index ac8b7178257e..4cb6930ffb19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -39,7 +39,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	flash_1v8: regulator-flash_1v8 {
+	flash_1v8: regulator-flash-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -48,7 +48,7 @@ flash_1v8: regulator-flash_1v8 {
 		regulator-always-on;
 	};
 
-	main_12v: regulator-main_12v {
+	main_12v: regulator-main-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
 		regulator-min-microvolt = <12000000>;
@@ -56,7 +56,7 @@ main_12v: regulator-main_12v {
 		regulator-always-on;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_5V";
 		regulator-min-microvolt = <5000000>;
@@ -67,7 +67,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -76,7 +76,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
index 5e7b9273b062..efd662a452e8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
@@ -84,7 +84,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -93,7 +93,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -120,7 +120,7 @@ led-blue {
 		};
 	};
 
-	vcc_card: regulator-vcc_card {
+	vcc_card: regulator-vcc-card {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_CARD";
 		regulator-min-microvolt = <3300000>;
@@ -141,7 +141,7 @@ vcc5v: regulator-vcc5v {
 		gpio = <&gpio GPIOH_3 GPIO_OPEN_DRAIN>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -150,7 +150,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vddio_ao3v3: regulator-vddio_ao3v3 {
+	vddio_ao3v3: regulator-vddio-ao3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO3V3";
 		regulator-min-microvolt = <3300000>;
@@ -159,7 +159,7 @@ vddio_ao3v3: regulator-vddio_ao3v3 {
 		regulator-always-on;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index e59c3c92b1e7..08d6b69ba469 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -50,28 +50,28 @@ hdmi_5v: regulator-hdmi-5v {
 		regulator-always-on;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index 4aab1ab705b4..cca129ce2c58 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -78,21 +78,21 @@ vddio_card: gpio-regulator {
 			 <3300000 1>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index e6d2de7c45a9..c431986e6a33 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -67,7 +67,7 @@ p5v0: regulator-p5v0 {
 		regulator-always-on;
 	};
 
-	hdmi_p5v0: regulator-hdmi_p5v0 {
+	hdmi_p5v0: regulator-hdmi-p5v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "HDMI_P5V0";
 		regulator-min-microvolt = <5000000>;
@@ -76,7 +76,7 @@ hdmi_p5v0: regulator-hdmi_p5v0 {
 		vin-supply = <&p5v0>;
 	};
 
-	tflash_vdd: regulator-tflash_vdd {
+	tflash_vdd: regulator-tflash-vdd {
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
@@ -92,7 +92,7 @@ tflash_vdd: regulator-tflash_vdd {
 		vin-supply = <&vddio_ao3v3>;
 	};
 
-	tf_io: gpio-regulator-tf_io {
+	tf_io: gpio-regulator-tf-io {
 		compatible = "regulator-gpio";
 
 		regulator-name = "TF_IO";
@@ -148,7 +148,7 @@ vddio_ao3v3: regulator-vddio-ao3v3 {
 		vin-supply = <&p5v0>;
 	};
 
-	ddr3_1v5: regulator-ddr3_1v5 {
+	ddr3_1v5: regulator-ddr3-1v5 {
 		compatible = "regulator-fixed";
 		regulator-name = "DDR3_1V5";
 		regulator-min-microvolt = <1500000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 591455c50e88..7f94716876d3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -21,14 +21,14 @@ spdif_dit: audio-codec-0 {
 		sound-name-prefix = "DIT";
 	};
 
-	avdd18_usb_adc: regulator-avdd18_usb_adc {
+	avdd18_usb_adc: regulator-avdd18-usb-adc {
 		compatible = "regulator-fixed";
 		regulator-name = "AVDD18_USB_ADC";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	adc_keys {
+	keys {
 		compatible = "adc-keys";
 		io-channels = <&saradc 0>;
 		io-channel-names = "buttons";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index e803a466fe4e..52d57773a77f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -53,21 +53,21 @@ vddio_card: gpio-regulator {
 		regulator-settling-time-down-us = <150000>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 74df32534231..255e93a0b36d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -47,28 +47,28 @@ usb_pwr: regulator-usb-pwrs {
 		enable-active-high;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 94dafb955301..deb295227189 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -49,21 +49,21 @@ usb_pwr: regulator-usb-pwrs {
 		enable-active-high;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -71,7 +71,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index a29b49f051ae..90ef9c17d80b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -42,7 +42,7 @@ cvbs_connector_in: endpoint {
 		};
 	};
 
-	dc_5v: regulator-dc_5v {
+	dc_5v: regulator-dc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_5V";
 		regulator-min-microvolt = <5000000>;
@@ -89,7 +89,7 @@ vcck: regulator-vcck {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -98,7 +98,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		regulator-always-on;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -107,7 +107,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
index c0d6eb55100a..08a4718219b1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
@@ -64,28 +64,28 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x20000000>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
index a18d6d241a5a..2b94b6e5285e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -37,28 +37,28 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
index c8d74e61dec1..89fe5110f7a2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-hwacom-amazetv.dts
@@ -42,21 +42,21 @@ vddio_card: gpio-regulator {
 			 <3300000 1>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
index 2825db91e462..63b20860067c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
@@ -67,7 +67,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -76,7 +76,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -93,7 +93,7 @@ vcck: regulator-vcck {
 		regulator-always-on;
 	};
 
-	vcc_card: regulator-vcc_card {
+	vcc_card: regulator-vcc-card {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_CARD";
 		regulator-min-microvolt = <3300000>;
@@ -114,7 +114,7 @@ vcc5v: regulator-vcc5v {
 		gpio = <&gpio GPIOH_3 GPIO_OPEN_DRAIN>;
 	};
 
-	vddio_ao3v3: regulator-vddio_ao3v3 {
+	vddio_ao3v3: regulator-vddio-ao3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO3V3";
 		regulator-min-microvolt = <3300000>;
@@ -139,7 +139,7 @@ vddio_card: regulator-vddio-card {
 		regulator-settling-time-down-us = <50000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -148,7 +148,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		regulator-always-on;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC 1V8";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 27093e6ac9e2..8b26c9661be1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -93,7 +93,7 @@ hdmi_5v: regulator-hdmi-5v {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -117,7 +117,7 @@ vcc_card: regulator-vcc-card {
 		regulator-settling-time-down-us = <50000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -125,7 +125,7 @@ vddio_ao18: regulator-vddio_ao18 {
 	};
 
 	/* This is provided by LDOs on the eMMC daugther card */
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index f1acca5c4434..c79f9f2099bf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -42,21 +42,21 @@ vddio_card: gpio-regulator {
 			 <3300000 1>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index a150cc0e18ff..7e7dc87ede2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -39,28 +39,28 @@ hdmi_5v: regulator-hdmi-5v {
 		regulator-always-on;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 860f307494c5..07e7c3bedea0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -112,28 +112,28 @@ hdmi_5v: regulator-hdmi-5v {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddio_boot: regulator-vddio_boot {
+	vddio_boot: regulator-vddio-boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
index 4eda9f634c42..a66f19851ac9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts
@@ -14,7 +14,7 @@ / {
 		     "amlogic,meson-gxm";
 	model = "Libre Computer AML-S912-PC";
 
-	typec2_vbus: regulator-typec2_vbus {
+	typec2_vbus: regulator-typec2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "TYPEC2_VBUS";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 514a6dd4b124..e78cc9b577a0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -80,7 +80,7 @@ sdio_pwrseq: sdio-pwrseq {
 		clock-names = "ext_clock";
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -88,7 +88,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_5V";
 		regulator-min-microvolt = <5000000>;
@@ -99,7 +99,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -108,7 +108,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -118,7 +118,7 @@ vcc_3v3: regulator-vcc_3v3 {
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
 		regulator-min-microvolt = <1800000>;
@@ -127,7 +127,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	emmc_1v8: regulator-emmc_1v8 {
+	emmc_1v8: regulator-emmc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "EMMC_AO1V8";
 		regulator-min-microvolt = <1800000>;
@@ -136,7 +136,7 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
-	vsys_3v3: regulator-vsys_3v3 {
+	vsys_3v3: regulator-vsys-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VSYS_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -145,7 +145,7 @@ vsys_3v3: regulator-vsys_3v3 {
 		regulator-always-on;
 	};
 
-	usb_pwr: regulator-usb_pwr {
+	usb_pwr: regulator-usb-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
index 35e8f5bae990..082b72703cdf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
@@ -150,7 +150,7 @@ vcc_5v: regulator-vcc-5v {
 		gpio-open-drain;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -171,7 +171,7 @@ vddcpu_b: regulator-vddcpu-b {
 		pwm-dutycycle-range = <100 0>;
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
+	vddio_ao18: regulator-vddio-ao18 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO18";
 		regulator-min-microvolt = <1800000>;
@@ -180,7 +180,7 @@ vddio_ao18: regulator-vddio_ao18 {
 		vin-supply = <&vddao_3v3>;
 	};
 
-	vddio_c: regulator-vddio_c {
+	vddio_c: regulator-vddio-c {
 		compatible = "regulator-gpio";
 		regulator-name = "VDDIO_C";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
index 46a34731f7e2..d1fa8b8bf795 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-ac2xx.dtsi
@@ -54,7 +54,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -63,7 +63,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -71,7 +71,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	emmc_1v8: regulator-emmc_1v8 {
+	emmc_1v8: regulator-emmc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "EMMC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -80,7 +80,7 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -105,7 +105,7 @@ vddcpu: regulator-vddcpu {
 		regulator-always-on;
 	};
 
-	vddio_ao1v8: regulator-vddio_ao1v8 {
+	vddio_ao1v8: regulator-vddio-ao1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
 		regulator-min-microvolt = <1800000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 62404743e62d..81dce862902a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -82,7 +82,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	emmc_1v8: regulator-emmc_1v8 {
+	emmc_1v8: regulator-emmc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "EMMC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -91,7 +91,7 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -99,7 +99,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	vddio_c: regulator-vddio_c {
+	vddio_c: regulator-vddio-c {
 		compatible = "regulator-gpio";
 		regulator-name = "VDDIO_C";
 		regulator-min-microvolt = <1800000>;
@@ -116,7 +116,7 @@ vddio_c: regulator-vddio_c {
 			 <3300000 1>;
 	};
 
-	tflash_vdd: regulator-tflash_vdd {
+	tflash_vdd: regulator-tflash-vdd {
 		compatible = "regulator-fixed";
 		regulator-name = "TFLASH_VDD";
 		regulator-min-microvolt = <3300000>;
@@ -127,7 +127,7 @@ tflash_vdd: regulator-tflash_vdd {
 		regulator-always-on;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -136,7 +136,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -165,7 +165,7 @@ vddcpu: regulator-vddcpu {
 	};
 
 	/* USB Hub Power Enable */
-	vl_pwr_en: regulator-vl_pwr_en {
+	vl_pwr_en: regulator-vl-pwr-en {
 		compatible = "regulator-fixed";
 		regulator-name = "VL_PWR_EN";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 846a2d6c20e5..0170139b8d32 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -43,7 +43,7 @@ led-red {
 	};
 
 	/* Powers the SATA Disk 0 regulator, which is enabled when a disk load is detected */
-	p12v_0: regulator-p12v_0 {
+	p12v_0: regulator-p12v-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "P12V_0";
 		regulator-min-microvolt = <12000000>;
@@ -56,7 +56,7 @@ p12v_0: regulator-p12v_0 {
 	};
 
 	/* Powers the SATA Disk 1 regulator, which is enabled when a disk load is detected */
-	p12v_1: regulator-p12v_1 {
+	p12v_1: regulator-p12v-1 {
 		compatible = "regulator-fixed";
 		regulator-name = "P12V_1";
 		regulator-min-microvolt = <12000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 1db2327bbd13..951eb8e3f0c0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -28,7 +28,7 @@ emmc_pwrseq: emmc-pwrseq {
 		reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
 	};
 
-	tflash_vdd: regulator-tflash_vdd {
+	tflash_vdd: regulator-tflash-vdd {
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
@@ -40,7 +40,7 @@ tflash_vdd: regulator-tflash_vdd {
 		regulator-always-on;
 	};
 
-	tf_io: gpio-regulator-tf_io {
+	tf_io: gpio-regulator-tf-io {
 		compatible = "regulator-gpio";
 
 		regulator-name = "TF_IO";
@@ -59,7 +59,7 @@ tf_io: gpio-regulator-tf_io {
 			 <1800000 1>;
 	};
 
-	flash_1v8: regulator-flash_1v8 {
+	flash_1v8: regulator-flash-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "FLASH_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -68,7 +68,7 @@ flash_1v8: regulator-flash_1v8 {
 		regulator-always-on;
 	};
 
-	main_12v: regulator-main_12v {
+	main_12v: regulator-main-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "12V";
 		regulator-min-microvolt = <12000000>;
@@ -76,7 +76,7 @@ main_12v: regulator-main_12v {
 		regulator-always-on;
 	};
 
-	vcc_5v: regulator-vcc_5v {
+	vcc_5v: regulator-vcc-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "5V";
 		regulator-min-microvolt = <5000000>;
@@ -87,7 +87,7 @@ vcc_5v: regulator-vcc_5v {
 		enable-active-high;
 	};
 
-	vcc_1v8: regulator-vcc_1v8 {
+	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -96,7 +96,7 @@ vcc_1v8: regulator-vcc_1v8 {
 		regulator-always-on;
 	};
 
-	vcc_3v3: regulator-vcc_3v3 {
+	vcc_3v3: regulator-vcc-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -125,7 +125,7 @@ vddcpu: regulator-vddcpu {
 		regulator-always-on;
 	};
 
-	usb_pwr_en: regulator-usb_pwr_en {
+	usb_pwr_en: regulator-usb-pwr-en {
 		compatible = "regulator-fixed";
 		regulator-name = "USB_PWR_EN";
 		regulator-min-microvolt = <5000000>;
@@ -137,7 +137,7 @@ usb_pwr_en: regulator-usb_pwr_en {
 		enable-active-high;
 	};
 
-	vddao_1v8: regulator-vddao_1v8 {
+	vddao_1v8: regulator-vddao-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -146,7 +146,7 @@ vddao_1v8: regulator-vddao_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 109932068dbe..3581e14cbf18 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -127,7 +127,7 @@ memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
 
-	ao_5v: regulator-ao_5v {
+	ao_5v: regulator-ao-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AO_5V";
 		regulator-min-microvolt = <5000000>;
@@ -136,7 +136,7 @@ ao_5v: regulator-ao_5v {
 		regulator-always-on;
 	};
 
-	dc_in: regulator-dc_in {
+	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
 		regulator-min-microvolt = <5000000>;
@@ -144,7 +144,7 @@ dc_in: regulator-dc_in {
 		regulator-always-on;
 	};
 
-	emmc_1v8: regulator-emmc_1v8 {
+	emmc_1v8: regulator-emmc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "EMMC_1V8";
 		regulator-min-microvolt = <1800000>;
@@ -153,7 +153,7 @@ emmc_1v8: regulator-emmc_1v8 {
 		regulator-always-on;
 	};
 
-	vddao_3v3: regulator-vddao_3v3 {
+	vddao_3v3: regulator-vddao-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3";
 		regulator-min-microvolt = <3300000>;
@@ -163,7 +163,7 @@ vddao_3v3: regulator-vddao_3v3 {
 	};
 
 	/* Used by Tuner, RGB Led & IR Emitter LED array */
-	vddao_3v3_t: regulator-vddao_3v3_t {
+	vddao_3v3_t: regulator-vddao-3v3-t {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDAO_3V3_T";
 		regulator-min-microvolt = <3300000>;
@@ -192,7 +192,7 @@ vddcpu: regulator-vddcpu {
 		regulator-always-on;
 	};
 
-	vddio_ao1v8: regulator-vddio_ao1v8 {
+	vddio_ao1v8: regulator-vddio-ao1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_AO1V8";
 		regulator-min-microvolt = <1800000>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
