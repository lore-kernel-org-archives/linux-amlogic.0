Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D8BC072A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Nov 2023 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNyE0PHEz/j8tjA82p+GylpFtqirKZcU8pFytawYvnE=; b=LP2TtDBE1BsSso
	PPS/A2Hp1eKqegQoBrcUU2NodCTI6GT0utlZfTbhPP8NgPAbJxXS+kHqOvIztTZST0Bjd+sg4G0Ex
	ULcoAYzfeIPs1cWSzUtGGcJBWRnlTkjvLBEjzruu+uKBcr8ZXHk6bxFY/WJj7lYh0U4z1SyrCOktc
	+9hbJW2xj774dUdX3FrKP1pV9pPMDEnuaEfHjbV4YHyj5sOGnypE4qi24H6HE403svLBU5Tc9UO1Y
	nM+u30jjJO/VJNrBzeJ10G/0L8GzwIiFpYxr8yCoNmK+lo6y7vp+osVo/ujRQpoxfsFBMjfPBP2Dh
	mZJzIugxAZOx8QGjlUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRj-006asX-09;
	Fri, 17 Nov 2023 12:59:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yRd-006apX-34
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Nov 2023 12:59:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-408382da7f0so16079475e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Nov 2023 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700225976; x=1700830776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92KaagYK4Q6I8Q+kS3VXik470FxeSDcwqV61XGzdHMc=;
        b=cFWUrdkvwr+Qs2IZiU1PkE5YGrPxaWEfl306keP3bTv+KwIqh/HccpMysMad2sUCvp
         1uqceCfkHju8RsGdDgO/kSe/dM1q89ibrGZFz+pfHGxvs2ekBiRoDg2RdikRsPEHGYAA
         KZxzJhCdGxi8quOiNHLZoiTpBWt9TjYyuQ0IYpj20OJiHmSzT65YSFw/1Gjs6B90d/v7
         H4R3kLy1em8qZtVm3UqFNbZqJIhi+K0GE9XeCfCz5jWsykSxvsSloT3tvIA9lbH/DIZ6
         R2LXkjlGqkDKEAv3x7E6lBNRSZRCiwVPQBhOe9erlnVduGCzBA1Ihz2gVsfb+cLbS0L2
         B9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700225976; x=1700830776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92KaagYK4Q6I8Q+kS3VXik470FxeSDcwqV61XGzdHMc=;
        b=nJyimDQATLvbjr8WW48BBpS6ye9l443EVUjMZCOeWFu6JZc/fPox1Wt1ifUnMKOeMD
         fcgLEAljJs9WmzAXM2Tt1J4RlVNslTdPJDjLaXXwJ4Uj3PsTi0LDpSBouGlF8Gpmjwok
         SIQc25V5OHpoqf+Gub9dY20zNc6GVZX26kIGJDBkM21c96F0oTR32v7wiKa0IymsL+Ts
         WobW9Trv6BGp1IXtFbiUjCYqFou1ser5Sb9wS8wVB6Ge62IMEvlo6Xa1ddxEUI48J1TW
         XkuVqokYTbUPTZLAL5mA27QqF8rnlaw8eTS4x/Ibb5whqz8+QOk9eIazr3yygT7KHhDT
         HQWQ==
X-Gm-Message-State: AOJu0YyzJQFaoP6Qpa9AW/bhCNsJm35D4DdAXh2PhU3tSc4ffiKGXnHF
	Ce+gIMB7UlEStwWJExE1pTnmrA==
X-Google-Smtp-Source: AGHT+IHJarfDKVM02/KEz4vsEFlQsu9jRbie2N/lyjCIFyQbFZsbgK7Bpgp8NaxTDgyBN/qVE/f4NQ==
X-Received: by 2002:a05:600c:3c9b:b0:401:2ee0:7558 with SMTP id bg27-20020a05600c3c9b00b004012ee07558mr4340885wmb.32.1700225976737;
        Fri, 17 Nov 2023 04:59:36 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8196:e423:38cb:9a09])
        by smtp.googlemail.com with ESMTPSA id k21-20020a05600c1c9500b0040a487758dcsm2671343wms.6.2023.11.17.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 04:59:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH v2 5/6] arm: dts: amlogic: migrate pwms to new meson8 v2 binding
Date: Fri, 17 Nov 2023 13:59:15 +0100
Message-ID: <20231117125919.1696980-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117125919.1696980-1-jbrunet@baylibre.com>
References: <20231117125919.1696980-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045937_998435_AF6FAEFC 
X-CRM114-Status: GOOD (  10.13  )
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

Update Amlogic based SoC PWMs to meson8-pwm-v2 compatible

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/amlogic/meson.dtsi           |  4 ++--
 arch/arm/boot/dts/amlogic/meson8.dtsi          | 16 +++++++++++++---
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts    |  2 --
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts      |  2 --
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
 arch/arm/boot/dts/amlogic/meson8b.dtsi         | 16 +++++++++++++---
 6 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
index 8e3860d5d916..80cc004ad5fe 100644
--- a/arch/arm/boot/dts/amlogic/meson.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson.dtsi
@@ -83,14 +83,14 @@ i2c_A: i2c@8500 {
 			};
 
 			pwm_ab: pwm@8550 {
-				compatible = "amlogic,meson-pwm";
+				compatible = "amlogic,meson8-pwm-v2";
 				reg = <0x8550 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_cd: pwm@8650 {
-				compatible = "amlogic,meson-pwm";
+				compatible = "amlogic,meson8-pwm-v2";
 				reg = <0x8650 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 59932fbfd5d5..153b8fe9c506 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -450,10 +450,14 @@ analog_top: analog-top@81a8 {
 	};
 
 	pwm_ef: pwm@86c0 {
-		compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+		compatible = "amlogic,meson8-pwm-v2";
 		reg = <0x86c0 0x10>;
 		#pwm-cells = <3>;
 		status = "disabled";
+		clocks = <&xtal>,
+			 <0>,
+			 <&clkc CLKID_FCLK_DIV4>,
+			 <&clkc CLKID_FCLK_DIV3>;
 	};
 
 	clock-measure@8758 {
@@ -702,11 +706,17 @@ timer@600 {
 };
 
 &pwm_ab {
-	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+	clocks = <&xtal>,
+		 <0>,
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_cd {
-	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+	clocks = <&xtal>,
+		 <0>,
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 3da47349eaaf..cdd7d04db256 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -441,8 +441,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
index 7adedd3258c3..68f4f70f4f03 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
@@ -162,8 +162,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &uart_AO {
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 941682844faf..ff955b960688 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -347,8 +347,6 @@ &pwm_cd {
 	status = "okay";
 	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&xtal>, <&xtal>;
-	clock-names = "clkin0", "clkin1";
 };
 
 &rtc {
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 5198f5177c2c..6c91eda92e8b 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -404,10 +404,14 @@ analog_top: analog-top@81a8 {
 	};
 
 	pwm_ef: pwm@86c0 {
-		compatible = "amlogic,meson8b-pwm";
+		compatible = "amlogic,meson8-pwm-v2";
 		reg = <0x86c0 0x10>;
 		#pwm-cells = <3>;
 		status = "disabled";
+		clocks = <&xtal>,
+			 <0>,
+			 <&clkc CLKID_FCLK_DIV4>,
+			 <&clkc CLKID_FCLK_DIV3>;
 	};
 
 	clock-measure@8758 {
@@ -677,11 +681,17 @@ timer@600 {
 };
 
 &pwm_ab {
-	compatible = "amlogic,meson8b-pwm";
+	clocks = <&xtal>,
+		 <0>,
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &pwm_cd {
-	compatible = "amlogic,meson8b-pwm";
+	clocks = <&xtal>,
+		 <0>,
+		 <&clkc CLKID_FCLK_DIV4>,
+		 <&clkc CLKID_FCLK_DIV3>;
 };
 
 &rtc {
-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
