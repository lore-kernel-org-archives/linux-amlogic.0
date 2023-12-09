Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D9DC4167B
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Dec 2023 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xqr5759vmWyfm7bXLoK54IdjHRz220srjs2bNdbrqSY=; b=2Jcay0RsQvTjFn
	Lt8YLvkzIPbFGPTyRIK/qQ1cFINSdHZ/LA2v9IcVY9mC8QRz45Hwirlq49/ueDsIjTk3L/e9Mivnq
	zZMoQNZ5DvvimKA/HGUHTXrw+ZocOyenXBjMIp+0Uvy1L+DjaoSKGpcoPy7HH32c1YwdfQHl2QnKo
	3jf0gXAdlkia0YRr5ziRPECKkuMi12qYSKYu0Uuf1xqu/rta2gPYHY4TDU1WgrN8X9dBJyCa9B3DU
	X45wev9K/QReoxHio5J3ErM13bxUlhWub6T/Nsv2q+x+Z6tdwjBoCUpaKwP38d7rzsuBcYdOmgyWa
	3rl69g7fhcGB9gO8EyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBwgm-000617-32;
	Sat, 09 Dec 2023 12:44:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBwgj-0005zh-0q
	for linux-amlogic@lists.infradead.org;
	Sat, 09 Dec 2023 12:44:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a1e2f34467aso288170966b.2
        for <linux-amlogic@lists.infradead.org>; Sat, 09 Dec 2023 04:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702125846; x=1702730646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QlW1QeOythGiXV9v0OHR4FjhcGgbYTUzhlL3KytwSuw=;
        b=VI4wn64Ugmxr3+syajF80logOYwyjPuyOxun79QGHOBRFPLTTN827rGPIl2LUc7Wrs
         ssSpvv7Vpcut+MbIFVCoQiFI2hhs8AvgHdiIJLNQdXxBI0laBJPWonJUk+hx7lvc6uZr
         zo3TA7enOcMpmPMNIgaTJlalo9UdyXZTTKpfFlfAXGqCjlW/T/EeKPx8F0GvCbV6g6us
         wkGAqA4vbIYzxA/W/Bc6NiUzDrzKjDhLE9MBZgTHGNBHDNUaj0H0tJNHgwnrif8R0UA1
         g0pdkc9FZ7rweCWy1vl2puuornortC4k9OT/uN9hcmCh5rL0xt0SvnJNFq4XM+l0BRtI
         mvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702125846; x=1702730646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlW1QeOythGiXV9v0OHR4FjhcGgbYTUzhlL3KytwSuw=;
        b=eKpSJZWsF2q7XixdsYvSb6U2gUb1NRk1rkhnx66peviOckVPU6436Nsq3M30Z0nFi6
         i9mfvb6In0AilqLPOjvon/XxUI6Z8KZKwALP7w0D5awIQ2KfyuNLIP86uba/RRRxR+ph
         Xa5T9apCxwtVSjem8IOmaOJ8SnrcPZWEPjpsonoEbVsmAPxTLHhwLj5WiXMabgZyYsW6
         zcCwodtMwkNkNQOqJuQ+S+MIr6IOSjHxD4ghQfXtCx398w97hvmJNm6A2h2AiU0/fFQE
         LuN7GavbhBpXbrpxQkjxnnKC1i7WRF1CBKR4+R+yhggpF9cuIT5y2oq8C2CK4st0c3ZO
         CYFw==
X-Gm-Message-State: AOJu0Yxpncyew7EafUxOLFWNEBTqYoX49kR2wt1fX4Yj78LR8GG/NnhV
	fsweLQeth88WfdMzA7Cc9y94gA==
X-Google-Smtp-Source: AGHT+IFPrs4abrIuCx7HGhbyV988M7akIWQqbGoMdmPgPd+qDRTQsV0FuJWdwJ7Orr4nunEpO15dnA==
X-Received: by 2002:a17:906:1812:b0:a0c:46b4:a705 with SMTP id v18-20020a170906181200b00a0c46b4a705mr814349eje.56.1702125845885;
        Sat, 09 Dec 2023 04:44:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1b65cd1957sm2191829ejc.107.2023.12.09.04.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 04:44:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: drop redundant status=okay
Date: Sat,  9 Dec 2023 13:44:01 +0100
Message-Id: <20231209124401.93814-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_044409_369718_9669DD53 
X-CRM114-Status: UNSURE (   7.65  )
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

New device nodes are enabled by default, so no need for status=okay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Tested by comparing decompiled DTBs.
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts         | 5 -----
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts     | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts      | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts   | 1 -
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi    | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts        | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts    | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     | 1 -
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts       | 1 -
 13 files changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index df16eead2c80..c8905663bc75 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -66,7 +66,6 @@ linein: audio-codec-0 {
 		VDDA-supply = <&vcc_3v3>;
 		VDDP-supply = <&vcc_3v3>;
 		VDDD-supply = <&vcc_3v3>;
-		status = "okay";
 		sound-name-prefix = "Linein";
 	};
 
@@ -75,14 +74,12 @@ lineout: audio-codec-1 {
 		compatible = "everest,es7154";
 		VDD-supply = <&vcc_3v3>;
 		PVDD-supply = <&vcc_5v>;
-		status = "okay";
 		sound-name-prefix = "Lineout";
 	};
 
 	spdif_dit: audio-codec-2 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
@@ -91,14 +88,12 @@ dmics: audio-codec-3 {
 		compatible = "dmic-codec";
 		num-channels = <7>;
 		wakeup-delay-ms = <50>;
-		status = "okay";
 		sound-name-prefix = "MIC";
 	};
 
 	spdif_dir: audio-codec-4 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dir";
-		status = "okay";
 		sound-name-prefix = "DIR";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 0ad0c2b7dfef..4c4550dd4711 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -45,7 +45,6 @@ dmics: audio-codec-1 {
 		compatible = "dmic-codec";
 		num-channels = <2>;
 		wakeup-delay-ms = <50>;
-		status = "okay";
 		sound-name-prefix = "MIC";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 4969a76460fa..9b55982b6a6b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -22,7 +22,6 @@ aliases {
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
index 8fc2e143cb54..0da386cabe1a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
@@ -22,7 +22,6 @@ aliases {
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
index ce548b373296..6396f190d703 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
@@ -17,7 +17,6 @@ / {
 	spdif_dit: audio-codec-1 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 18f7b730289e..e59c3c92b1e7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -26,7 +26,6 @@ dio2133: analog-amplifier {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index e238f1f10124..f28452b9f00f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -18,7 +18,6 @@ / {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 292c718ee19c..591455c50e88 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -18,7 +18,6 @@ / {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index e8303089bff6..74df32534231 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -21,7 +21,6 @@ chosen {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
index e1b74b174915..376760d86766 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
@@ -17,7 +17,6 @@ / {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
index 7d525bdb0e06..ad2dd4ad0a31 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
@@ -28,7 +28,6 @@ chosen {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index 50d49aec41bd..d05dde8da5c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -37,7 +37,6 @@ memory@0 {
 	spdif_dit: audio-codec-0 {
 		#sound-dai-cells = <0>;
 		compatible = "linux,spdif-dit";
-		status = "okay";
 		sound-name-prefix = "DIT";
 	};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 095579c55f18..109932068dbe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -32,7 +32,6 @@ dmics: audio-codec-1 {
 		compatible = "dmic-codec";
 		num-channels = <2>;
 		wakeup-delay-ms = <50>;
-		status = "okay";
 		sound-name-prefix = "MIC";
 	};
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
