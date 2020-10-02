Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58679C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED681206B2
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 14:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYbS9J50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBzt1wXL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED681206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i54K2S3tlbFoVJUQdVSuVkFBvnG+TtHSHamLti3iuB4=; b=aYbS9J50tYyWjbKwy+vD5/aWKg
	+wKLlflF4BBfBO1EsVSAQ+3SbnYYKx46eILeQq67gnh4QEZ/fV6T9m6+mY1o4plq4jRphpOm2iYzN
	hIElrfP71Z0uUWFWx2c9hWKJWArmpjp4mkU6V+Q3SY6ko7kQgi1iFEhEey5bxNTQAhcWz4u00N9py
	xxcj9khesTc0J+k+/8pMsgz2rXYOnBQzKnMlROlFGxz1TgLvSHU/8OfiARUKyk+iuPRWR285s/unT
	Kc9lSFY+aBWEe4LfMsD3CV4zLd6/omqly9npEA/unp34txq8kLAjdBPwJykIWTtHzUDc480YBZKKv
	ODiVHOyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOM7N-00021P-4h; Fri, 02 Oct 2020 14:33:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOM6P-0001QW-F6; Fri, 02 Oct 2020 14:32:07 +0000
Received: by mail-wm1-x344.google.com with SMTP id 13so1917852wmf.0;
 Fri, 02 Oct 2020 07:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lDvI8JDwLjhA5jkV3AvGA6unyQL/mwAeBeK74iYRYOY=;
 b=IBzt1wXLRAP5OXl1AVCho6pGVibOE4hdXKs+io0/xIaGLM8ouAJxX2HfBFPzyOnALI
 uV71BLTVIZkhGOCDej5kv8RFqvhMCjXmuyxCRo2EQDytxPPlnXThty9dMjXTgzkx6ZJm
 grYbvcssaH883w0f3h23V2nqI9Omzm1xEA8OmIJCdg5CvfJhllKSwha+5rnraJq7kk+5
 SXZQjRHm/tAd6szw4fV45KCwmJ1yVxYx5m6dYIu3HBXmSRoAGrobzpKyBhU4e9oSEQ4m
 A7N/T9HVHIm6i77XzBgPaEYr1LrKRhRJLX8mc+RCnhjIOa5TusI95bOOzC1vTRib9LkO
 Ye2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lDvI8JDwLjhA5jkV3AvGA6unyQL/mwAeBeK74iYRYOY=;
 b=ih/0HKxLFNRHAi+po078yte/jD+sabuP4vlJcrY/KRcZAUiuPZPI6mTlmr0mWGO1KX
 xRug8faQakRiu7Y+42AwZF9VL8C+ME5iWKYKEP8ICK2MLbqjdCUGxIfUzubHOZNvsi2l
 b6Chkc4Ln5fZzyIoYsbwVmfn53D8yQrSDy+OXXoZXgZr+P92iBVsZpE2TztUcvb+w2Ua
 tb0Qor2xBrLdgOsTwUNAWA1eo5Sl+ZPfnlDyDcdxy7NCVWTmwsLH25N/6OGFyNAthdMi
 q/ib3X2I6B/pw7Fn8ILcQ+W2St0zz+npxHhqEYne9hdPZ2BI0rS0r8zhh0LUH5GazfkC
 S8SA==
X-Gm-Message-State: AOAM533Dhxkip81liz3QZSCqFeuTvrS+eE3653FOG1YrEme4Yn+yK0IW
 12ujKNaRdkcCHl9yCyxwXSA=
X-Google-Smtp-Source: ABdhPJzY7XCXqlnxJ+uSLghfT7uu4+brizDVTK/yBPMA7+xAj8nlahY1gcv4AuHhISIxlo1gDyoRaA==
X-Received: by 2002:a05:600c:21d4:: with SMTP id
 x20mr3182114wmj.26.1601649124151; 
 Fri, 02 Oct 2020 07:32:04 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id w7sm1907392wrm.92.2020.10.02.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 07:32:03 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] arm64: dts: meson: add audio playback to vega-s95
 dtsi
Date: Fri,  2 Oct 2020 14:31:39 +0000
Message-Id: <20201002143141.14870-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002143141.14870-1-christianshewitt@gmail.com>
References: <20201002143141.14870-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_103205_697481_B475723A 
X-CRM114-Status: GOOD (  13.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial support limited to HDMI i2s and SPDIF (LPCM).

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 222ee8069cfa..1300585a1ec7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include "meson-gxbb.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "tronsmart,vega-s95", "amlogic,meson-gxbb";
@@ -17,6 +18,13 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -97,6 +105,59 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-VEGA-S95";
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
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
