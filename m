Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBA9C636C9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:31:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90E5610F9
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B90E5610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kQwJZ/jWgKTFPCgU0Kk07xKN5Eh5/p2laIu7ZP7Ge5s=; b=FXc+YTaApGxNmg
	QkiACGhuZm0MY7hlIc3X0TFH1t36StEDvZtjoguu0JVFUVOfgDbFbSIJYkCJJa80Bg+pZ6KXpP4uw
	SXpcLCpT/z05n341A/8g9cEo7BTA6jF+rmMaYJcrcGQFjMdoq2Fy1sMaZofy18Cl+07oxB/2WRZ/S
	F3I6QfORNjN8Ur/vE+TwK4LXN7ajQxcOdX7BmACaIA//ynSDdIS//Kd48xA4i1roLkNbjwZyu0G4x
	aB0lbBLt0/p4iMCA4DjMI/v6ztO+nsLeoTJhBukKll5nl76iK2+16MmVbCiwk7Ph+f86h2qnqSVYa
	GmkN4C5yQETALDgmNl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tlx-00788i-3R; Sat, 17 Jul 2021 23:31:05 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tlX-00780N-J1; Sat, 17 Jul 2021 23:30:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id g16so16516872wrw.5;
 Sat, 17 Jul 2021 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJiK6ZPfj0SXkTk/BERUcE9u2Ss9uOY9yYEJynNuJRE=;
 b=sWxRlKLGfombM7n/SQKbdgHjDcsYANaqKK/V/9slxJwdEmWNMzIfZVXIhxZUztF/QQ
 bgjYQwlRzHaWIjJZWhWLKjZmSo8LrtSEOLUzbRvzAl0F4oxhKVjycAq854htHPN+mWMc
 kHnWO+hb89Hi/nQnYb7w0dTTMvlgvxu18R/yJd9pXul3B7X+zkVOiiPX48iop/9paaMg
 A+kkkAlHgwmX5ANsFL23EDu3EH6EDCoJigDqX8By2uwMRp8LsH7zRyX38By/hGbeHMR8
 h+ePVEJgXKa5go3Oy8Z4SpeSefYI94WUBJTV6zKMgl4FcMlbwafLOquB+J+ExPboqR3w
 kDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJiK6ZPfj0SXkTk/BERUcE9u2Ss9uOY9yYEJynNuJRE=;
 b=oxHH3fJVgy9Z52/EAQwuD3mV6/TyXAdZFzL8vIzNVl6ocgzyRCIzAlCILshhN6r9SI
 K2l7hopirvpwyoxC163l3hThriw2kc8hHYNM/QqJkKIZCdC4KzIMtp8X1BVOxJbvMeer
 eDOHIe3BGu21yor9FzuBH2Z41HGkhDLHwVoYNzAkHHY1PYAImujxSOrk/5wCA/845MK+
 YDP7iAUdhcWOGau5DaKHo5PIhY3T17NLkPZzeUgsa25x4A0oljCGMyOfsvC/VMg/9l3V
 VcAkHs9DGMpj80KimNqwlOiaGrw+dEJV3XujYbqox070dKbvRhRoIeMGLJsQ4fpnuZfA
 KaVg==
X-Gm-Message-State: AOAM532/C7q821Dufr/ZrfzHstCTdbKf2bLaAs3T9hgUJSB3z2utB0pm
 kJ7T3SSCkjIU/+kmcXvN/tV7hLLO9YE=
X-Google-Smtp-Source: ABdhPJwVTlimgC+HBeL7qBCgE7Kt4D4zsydJswDaUEdpNebka11e9Ob4P7IdljCl6B1/fVutj9prpg==
X-Received: by 2002:adf:facf:: with SMTP id a15mr21055072wrs.39.1626564637959; 
 Sat, 17 Jul 2021 16:30:37 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q19sm14824051wmq.38.2021.07.17.16.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:30:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/2] ARM: dts: meson8b: ec100: wire up the RT5640 audio
 codec
Date: Sun, 18 Jul 2021 01:30:30 +0200
Message-Id: <20210717233030.331273-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
References: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163039_665968_38513F48 
X-CRM114-Status: GOOD (  13.81  )
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

The Realtek RT5640 codec is connected to the SoC's I2S interface.
Describe this in the .dts together with the codec's LDO1 enable GPIO so
audio can be played on the Endless Mini.
While here, add a note about the realtek,ldo1-en-gpios for which the
EC100 uses GPIO_BSD_EN. Due to driver limitations this pin cannot be
used currently.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 8e48ccc6b634..e404bdccdab9 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -96,6 +96,32 @@ rtc32k_xtal: rtc32k-xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "M8B-EC100";
+
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-rates = <270950400>,
+				       <294912000>,
+				       <393216000>;
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
+				sound-dai = <&rt5640>;
+			};
+		};
+	};
+
 	usb_vbus: regulator-usb-vbus {
 		/*
 		 * Silergy SY6288CCAC-GP 2A Power Distribution Switch.
@@ -242,6 +268,14 @@ vddee: regulator-vddee {
 	};
 };
 
+&aiu {
+	status = "okay";
+
+	pinctrl-0 = <&i2s_am_clk_pins>, <&i2s_out_ao_clk_pins>,
+		    <&i2s_out_lr_clk_pins>, <&i2s_out_ch01_ao_pins>;
+	pinctrl-names = "default";
+};
+
 &cpu0 {
 	cpu-supply = <&vcck>;
 };
@@ -283,9 +317,19 @@ &i2c_A {
 
 	rt5640: codec@1c {
 		compatible = "realtek,rt5640";
+
 		reg = <0x1c>;
+
+		#sound-dai-cells = <0>;
+
 		interrupt-parent = <&gpio_intc>;
 		interrupts = <13 IRQ_TYPE_EDGE_BOTH>; /* GPIOAO_13 */
+
+		/*
+		 * TODO: realtek,ldo1-en-gpios is connected to GPIO_BSD_EN.
+		 * We currently cannot configure this pin correctly.
+		 * Luckily for us it's in the "right" state by default.
+		 */
 		realtek,in1-differential;
 	};
 };
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
