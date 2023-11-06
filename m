Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C964DC4167D
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Nov 2023 10:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uNyE0PHEz/j8tjA82p+GylpFtqirKZcU8pFytawYvnE=; b=kWZI0jrGjxEPeb
	lb8m65JYdJy6SkBa56vZyPFjPXlIGQftlkxBScR9mkFIMKLDNoStBoCxf5x8AOlk+XNXoEE+1Gag3
	CsHVaBxyUB6ppjagWAWtIW2yq93/trm7z3qO2AtySC3TOANcsUS5ftZwh6vnJdbT2nqsZcfKjvgGE
	DEKbsb3+Ghfks8muaJ2hSRpy8D975K6KMXEe5SfFZ7hQ5JXrAyjkk51oJbMquIwlaJjcOmrHxcu6J
	YvY7PqjQvFofx3A1TLHVSByep0yqkV/DQd1UDqVBr79JxFIkft2+IUiij6ww9Y7ioacE/B0CeEIs9
	BEWM+s5NrTcVsN2MFcAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwvB-00GFNx-0l;
	Mon, 06 Nov 2023 10:33:29 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzwv7-00GFLD-1V
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Nov 2023 10:33:27 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32ded3eb835so3041467f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Nov 2023 02:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699266804; x=1699871604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92KaagYK4Q6I8Q+kS3VXik470FxeSDcwqV61XGzdHMc=;
        b=BWD4DmNO/eVyA+ulURlFohdXSefoVJS7VN5I/Ufi6jEST3alEheEfAkFWrmQqJYD5r
         8KNZFvSyDP23u2dvdmw7Rma1H6If8JrIVKRvg41pGAAbv47bufFRMfvN9q6+exDGW4rG
         CVl0x2zXSvJO18A3zrUmqI+0IWlVObN67Vqt0W08Lmcl3f/qTE8ixu7V3J/z7G2ZeHiz
         C5xwBpZH2dfF/xqEphlK+YGeIPZgO6kRBhfkmbCnlYVPn1SMCA6+N+Ldz6ILyEx0aaCa
         tbHSdjrNYqA5AqED/6DBw8hggGU1Krp6HkQXf+Fp5Q/aTowT0GCjrmx2ISVIT69ujky2
         unZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266804; x=1699871604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92KaagYK4Q6I8Q+kS3VXik470FxeSDcwqV61XGzdHMc=;
        b=ECfZpYzEh6NHID3/fWOTYLwujxLg4JkAuEKeClD5X5LQyRxdicgxyfL9G7BrinQ5m1
         /P0PK2l+0cId0nS++VXOi+H+UWaqijEh5VLwjqSoG4He56jxJ1rCIb0AJxQA4vnnAyTb
         EZCz/IiLe8fYp/A09+DQyxCjeFTlm6QDB7hWShyiTmdf09TDoNVYSsFWfQ85m6zt4f34
         /jPFJkwmERAuAx3GGcj3XBfAa3ipkGia8wykaU4H78t0PBaILKdvSQhGyQP7tjD58fxC
         7WhsmN8437cG3dIsHoaYaTTJW4uhjRBJWdBUn0b+mCRhJie8dD9DpT2gUsIuwd4gWDWY
         M4Ig==
X-Gm-Message-State: AOJu0YwKCA5k5cDoOtQGv76jVryA6fsdiC47ar6eFeeo9qgL57QuVev+
	Q4J61nCZi6V5xZQMeAx9GBtMbQ==
X-Google-Smtp-Source: AGHT+IGpgXgs9p/haq5uFAdeKOCNvuVctlHcdsKy+IZR9rejMAGaON1iexlBhPyBttWrugvf4qR/Cg==
X-Received: by 2002:a5d:59ab:0:b0:32f:8a7f:f00f with SMTP id p11-20020a5d59ab000000b0032f8a7ff00fmr17945772wrr.60.1699266804234;
        Mon, 06 Nov 2023 02:33:24 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id d1-20020a056000114100b0032415213a6fsm9033602wrx.87.2023.11.06.02.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:33:23 -0800 (PST)
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
Subject: [PATCH 5/6] arm: dts: amlogic: migrate pwms to new meson8 v2 binding
Date: Mon,  6 Nov 2023 11:32:52 +0100
Message-ID: <20231106103259.703417-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231106103259.703417-1-jbrunet@baylibre.com>
References: <20231106103259.703417-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_023325_514535_7FD6D241 
X-CRM114-Status: GOOD (  10.62  )
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
