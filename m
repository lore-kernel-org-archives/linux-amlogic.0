Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F01C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 06:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ctKDk4VBz5Lt8n6yl7S9PvZcw3JKA9EFQ9wsn7kdhMA=; b=yeszD7aNRqQYmb
	A9CztOSRJ1d1b8+SbgfaB0b9Yzb5xMJp7R804Btqfd7fIiFxcbirb7cGqd4xOrQzCfX/K6b+9eJCw
	0h4pkAt2wTsjFJAkMAiYk4GQnCHv0om2g7biBTmkKef2U7eg3bFJUGovJSOF/xf/f2OBaL1HYSJ8l
	z/NeYYV1A5bP5Z41Xf11lahq6KYBMuJkQVHdJL8Eem5MtgjqsgUE4gE/418vNZMtSBms1N7+9ApOM
	DvRCUWts0ND3sS1HPHIcNu13txpiDMn/o60s4YsQp+tMMNNw2S0Q7QYdprwhAUvP5gHdC7jcdG9Xt
	K7wKCBXpjhYR2G2PLKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqn8-00G8rS-3g; Mon, 23 Jan 2023 06:58:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqmv-00G8o2-GF; Mon, 23 Jan 2023 06:58:42 +0000
Received: by mail-wm1-x32c.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so9890306wmb.0;
        Sun, 22 Jan 2023 22:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jozt3nQctk8Eo5do1n4x1ginSjY5JtMF4xErYTakExE=;
        b=aW2LoBd/6dqWV6Ju41BCj8IXkH30jX61wgv6knKyFecFONSzz6ZsA+irtg4Jf1lMg+
         xXAWr4BxOkSZ/gtX1sEYckJsuZ460KcFp7uvVAH8V/XYxa7q1bNhs36hO81/ym7xvm3g
         OEbwvnuNJy9+m4/2MmhDihlAeZYN/sxfeIPTLcqcqcXf7OTNo22ekQNybY1uytHm/H0k
         kU5P3TRIGJv60LiIzPivj8JWJyBFyMSngmnymllNkYQaqpWrweQdsyYhummuclai1ntp
         ri6O/buuRfcperivsxICXjkiSq+qumXLflQY0meRljysgTSjlPaamsSfZNYYx2erLEi/
         VgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jozt3nQctk8Eo5do1n4x1ginSjY5JtMF4xErYTakExE=;
        b=g8ts2Jf2afBlIyaSTG4/8o6oWraAdI+9mROxYeU8g6wg5T7unt6Nd9LnIc8jqGD4cw
         j4DzRMjsw7Y7HKtq2YjyXSW5Q34+dXHCOSNxXp3rCa3XGJAbXvvti6G5VSwrOImezSMz
         XdCZaU+/Zxts56wHk9RTmzsc9fU9aLm0dMJCnhz54jbWm9+V7Z7VzEl2kyPQfQBYrGkm
         dqKzwzwezS8pWDVD+ooAi3o5Se8BfYX5lV1fDXdMm4IGS+kmBv2k27YnRUUMInaKpjsu
         f6Xj6DiRV0lM/88fVbxnfFO4ctISpQu+gAVujIA6LQZv52rGwyb6qnLNIWXhhIffEg9T
         CrAA==
X-Gm-Message-State: AFqh2kqd461JfX1xYHAf/3B2wwPcoX8YHFcEho3f/QfiyAmiVel2XQyA
	BxQ40mjRye+4wn4ibFtbzzE=
X-Google-Smtp-Source: AMrXdXvZ0o4+Uavz11cmkN1mn0HBaFEV/CsnWMmmt45ArHZ+GJ1XMu5eTnT79iN6DN64MsXPnT4Ivg==
X-Received: by 2002:a7b:cc14:0:b0:3da:50b0:e96a with SMTP id f20-20020a7bcc14000000b003da50b0e96amr22923957wmh.29.1674457119128;
        Sun, 22 Jan 2023 22:58:39 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id hg8-20020a05600c538800b003d974076f13sm9710625wmb.3.2023.01.22.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:58:38 -0800 (PST)
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
Subject: [PATCH] arm64: dts: meson: add audio playback to S905X-P212 dts
Date: Mon, 23 Jan 2023 06:58:34 +0000
Message-Id: <20230123065834.2670125-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_225841_580070_004DAD5C 
X-CRM114-Status: UNSURE (   8.62  )
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

Add initial support for the HDMI and Analogue i2s audio outputs.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dts | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
index 2602940c2077..c2bc7cec476d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
@@ -7,11 +7,19 @@
 /dts-v1/;
 
 #include "meson-gxl-s905x-p212.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "amlogic,p212", "amlogic,s905x", "amlogic,meson-gxl";
 	model = "Amlogic Meson GXL (S905X) P212 Development Board";
 
+	dio2133: analog-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "AU2";
+		VCC-supply = <&hdmi_5v>;
+		enable-gpios = <&gpio GPIOH_5 GPIO_ACTIVE_HIGH>;
+	};
+
 	cvbs-connector {
 		compatible = "composite-video-connector";
 
@@ -32,6 +40,68 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "S905X-P212";
+		audio-aux-devs = <&dio2133>;
+		audio-widgets = "Line", "Lineout";
+		audio-routing = "AU2 INL", "ACODEC LOLN",
+				"AU2 INR", "ACODEC LORN",
+				"Lineout", "AU2 OUTL",
+				"Lineout", "AU2 OUTR";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+
+			codec-1 {
+				sound-dai = <&aiu AIU_ACODEC CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_ACODEC CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&acodec>;
+			};
+		};
+	};
+};
+
+&acodec {
+	AVDD-supply = <&vddio_ao18>;
+	status = "okay";
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
