Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AF6C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC69C613B9
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC69C613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7QiyjJID9CCW0JalMnqIyamqA3io9XL9WtfqDLHlK0=; b=Q3/zwwSZjFg2Rx
	CoDr9sFTwArZvj2hsngDGZSTkWwb04qeDYu4I8jEs9QyN6hGnDFuVE6tde8qHhP4eY9yazy1Xig0r
	EAuhIXugreL7JkODAvTdrPOxXg1FYt6RaUl2+nENNgmKozxJMZIY9Uy06JmGei05PEEeKc43iMdnd
	sHZIF2Z3UzRDXJ0QojT1gRYCe/E1pEcEosrcyckOsBUgvQWcIZ+zh/PXbokwsEbWVLzQjnYlAWOfx
	yU3zQMD1AR6A90A258J+DuGJR7593ELJ+gwRBpXQbV7Y0wbazSJtC6agIvRYumedKO6e4Scryty2G
	unlzONa0y3lRy1GMzFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RYu-00BZsl-ON; Tue, 13 Jul 2021 23:11:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RYW-00BZmo-Tr; Tue, 13 Jul 2021 23:11:14 +0000
Received: by mail-wm1-x334.google.com with SMTP id w13so380150wmc.3;
 Tue, 13 Jul 2021 16:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SWl1Vtp4REPunQuHP81GLtdpuPygHjaGQhTUxCn58D0=;
 b=f+xHksQOVZnAOtbQbk5DNKurXzF2JLVBFVEO+Wl6FuhaNLj5ZMv06DWOrhpD1JceHA
 3bCdar4rI5CXlp89SFulcQ+VT0+oj0fC/rgY6/KGpV/bJ3sNtKqQxA9SMYSUrPOsVuVY
 Z+LCcH1hOwbSdGMv54OHWg1HzGNWgXoQPn3hwjLwjvL8tZpcrIVWGr0FfB8WQU6xBuZU
 enggdKrn/byhMOB2F/ySVGipjAwzf28ZrPYeVMOBnk6uu6UiWuf+2bGeRxWmzsZtFfF/
 1pb+soBHHq+NmofNqKHpOns6jPwlFOmj/s9FzclVG+E8Vxm+feZ832zAsXxQdNEhoTDz
 VUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SWl1Vtp4REPunQuHP81GLtdpuPygHjaGQhTUxCn58D0=;
 b=gVTiu9CxxzK6SGDtnih7DevKa7oATX8WsEV0LCXzV9jhTiWBQdg5euXSJyw0wYyuAd
 j/5qOkU7TSnUstlExGFbXBQGkXCzDXmhupRvRfYNClOmeJ28PJGG4NOG/de93b2WtvR/
 qh/Ci4De77ksne8cjj3uhkNqvtThRFcrs07V7YLCqmB5xGA4j+RgF4ynfbyjA8SzbPGP
 +Prpq/Q5hREIlBH+sT2kwWUORvEylmWD/MBvkQttbL78jOj+/5se2f2zUq2zTqOI8mXy
 +fVzya8BWoJXquSnuuwf1QUCFt3GXt5EgNH7dBQQhPHLlyf06vbyw+mKJncmLmsokVGB
 s4jw==
X-Gm-Message-State: AOAM5337xo5/YNdY7QQOXfK3lVtuMjIeg4k57Yqp9sAVqanSt/cPulF2
 nF3+3HzvSXCQHlIQDtXi3P+EzdebRME=
X-Google-Smtp-Source: ABdhPJxT0/VK6AQnrwEjVZgSRZKbRAjsJ/9U141iVpixe9DWQ5/xe2EfLg/RUDX5xPIRUkBMyOqeKg==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr620798wmj.56.1626217871429;
 Tue, 13 Jul 2021 16:11:11 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id y16sm3551608wmq.1.2021.07.13.16.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:11:11 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] ARM: dts: meson8b: ec100: wire up the RT5640 audio codec
Date: Wed, 14 Jul 2021 01:11:03 +0200
Message-Id: <20210713231103.2994354-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713231103.2994354-1-martin.blumenstingl@googlemail.com>
References: <20210713231103.2994354-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_161113_001688_4FC7D996 
X-CRM114-Status: GOOD (  14.23  )
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
 arch/arm/boot/dts/meson8b-ec100.dts | 45 +++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 8e48ccc6b634..177feb09a66d 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -96,6 +96,33 @@ rtc32k_xtal: rtc32k-xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "M8B-EC100";
+		audio-routing = "I2S Encoder Playback", "I2S FIFO Playback";
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
@@ -242,6 +269,14 @@ vddee: regulator-vddee {
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
@@ -283,9 +318,19 @@ &i2c_A {
 
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
