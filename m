Return-Path: <SRS0=S7dH=GC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A455FC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF4720781
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Dec 2020 10:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF4720781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4LBUt6x7ZKOiKZ01AYTyHhETTgwnu2tTebzAQ/zLSk=; b=KtA7B3by1lk+Nf7ewFc2+vQwQv
	fGST1hqwHxjPnXjk78Sg0WE0hJm5LhZHiJEKsyvksxRq/xuBU7cGylc+wFyPOhrboVyrrfFVHGFXn
	LfkpPIh9P5R35W8qti/HyTNkkiJN/uv839X7nWcnT8BDp8N5MgJGCdkkBaHFkjp4BTJy+XhdGMtdR
	JnY97vK9ReDCRwTw5p3xX6M9HNIA3qpYstzhb5fc7O3MgPSut6t2NbcRJkWykdc8hiC58cZwOuYed
	yhd8SKFv+7r37EhxoucO1RD4FLLx0UmVHmf2IhDPx8tYuZoXIwmdHHv9uvADjm2/91WjjUEkCHu6f
	XyI5J34g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuYrb-000810-4x; Wed, 30 Dec 2020 10:37:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuYrL-0007xt-FC; Wed, 30 Dec 2020 10:37:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 190so4647853wmz.0;
 Wed, 30 Dec 2020 02:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6t28SHKcchxFFDmVg/DTxzcIcnwyXJGZEre60W6J1QA=;
 b=pILmpAubTM/HAKupW6uGgH59+masSEE8xchp+TYZtQgIgr3owYgMk+45/fdLviQ37l
 UwkjdGj9HJnS5ZDL80c6gpa5l4JxwcBiw9a9KtrVdLcDHyi0F/bhOeJQwtCImqwrc52h
 NwA5QCR4BMGFdHYxDM+kAd8kmLf9nKSkxJNjL5fATu+DYMEf8NUjKrCnVLENNBdAbH9I
 W5RLeb9w4a+NxqzU1PT5YJtHfNOdQHDrzvpg5SwmhEB9IzUSzrBiodKfaVBm2nWhz3tG
 dGwDJHNeTyQ+uZe360/yZvv/WHww0oYkcPX7TSNMmhhHdK9F4D7n+zLSNSK8pLH0qDvs
 LIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6t28SHKcchxFFDmVg/DTxzcIcnwyXJGZEre60W6J1QA=;
 b=t0IjbQfdDs9mq3Yt1TXbi52M4AQKZKugGEcgFT62Ww8+m4s6TkR9vAKfiZ+FqZaIP1
 o6ooVAfHyA4Kc4s47zyQqTzvZzwr5KZD/V90prozmmrhL194KD9jhICyQEKoYQp+EpY/
 CvlGgr1Bj4wYU1VNGnwqMAvsaq/9WqiiThLP32Oj3fRMXmCf3bVv5GzOFUwTSmI77Y+c
 w/sNpyezppVGQuhsHkPEI+34TiN+vMu1sFjNknQHH7DLsuNH/guu8Dtpau0pfwelB99Y
 pzIEya0vVYpgVlajfle/G7V12LqJ/WS+hCAeh+GGU7VT/NPuPZRAY+V8X0uMLZ3Ga6jO
 I3dg==
X-Gm-Message-State: AOAM530MJkF4Mrtt5748HuPvyu1hrnSnoh/8yEYpn1o/OnS8+PMFHA0c
 t7CRqDzADxH0jJxYuMc4D40=
X-Google-Smtp-Source: ABdhPJyw0o+67rpXjqph6wMQ/Vk2mxdEEMm6eA011bsDDZ65OGooFqn5qoTn6wRgjbnxMQmIuHdqrA==
X-Received: by 2002:a1c:e084:: with SMTP id x126mr7003022wmg.109.1609324658172; 
 Wed, 30 Dec 2020 02:37:38 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j15sm66672156wrr.85.2020.12.30.02.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 02:37:37 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: meson: add initial Beelink GS-King-X
 device-tree
Date: Wed, 30 Dec 2020 10:37:29 +0000
Message-Id: <20201230103729.2272-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201230103729.2272-1-christianshewitt@gmail.com>
References: <20201230103729.2272-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_053739_567144_D9F062BE 
X-CRM114-Status: GOOD (  17.68  )
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

The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
board with an S922X-H chip.

- 4GB LPDDR4 RAM
- 64GB eMMC storage
- 10/100/1000 Base-T Ethernet
- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
- HDMI 2.1 video
- S/PDIF optical output
- 2x ESS9018 audio DACs
- 4x Ricor RT6862 audio amps
- Analogue headphone output
- 1x USB 2.0 OTG port
- 3x USB 3.0 ports
- IR receiver
- 1x micro SD card slot (internal)
- USB SATA controller with 2x 3.5" drive bays
- 1x Power on/off button

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 133 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index ced03946314f..dce41cd3f347 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
new file mode 100644
index 000000000000..c9d9dcb0cd65
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-w400.dtsi"
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "azw,gsking-x", "amlogic,g12b";
+	model = "Beelink GS-King X";
+
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		power-button {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "G12B-GSKING-X";
+		audio-aux-devs = <&tdmout_a>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 1",
+				"TDM_A Playback", "TDMOUT_A OUT";
+
+		assigned-clocks = <&clkc CLKID_MPLL2>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link-2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		/* 8ch hdmi interface */
+		dai-link-3 {
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+			};
+		};
+
+		dai-link-4 {
+			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
+
+			codec {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&arb {
+	status = "okay";
+};
+
+&clkc_audio {
+	status = "okay";
+};
+
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
+&tdmif_a {
+	status = "okay";
+};
+
+&tdmout_a {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
