Return-Path: <SRS0=NBQ5=HC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B258C433DB
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE46064E24
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE46064E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGudNE34qQQEFgupiwdOZ8RJJkd/kFAkK7GVa2vgwRU=; b=lLRm2nfHvVXx01J69+fWF6Nk/F
	SjOtrWz/maGCRtNTpn0VkTPMQSkeMTL53CdXfVBGpy2kLfxKaWglzZA/O0we+Sjuf7rSLdiwuV+ad
	gwtGuy3EWik++GosEeuMj/Cor7IBSEgsf3E2GvqTcybSLJ8ZaEvFyt5kD+/WZ4Dlq0/HXVTuXeDmp
	ilCIgNXGE2BF31aZMZSqvQYR7OrhqJHKwxowShTWT0piXN4SkZyoiudn0xkWvbakPmsS5MKCK5yOt
	y4VLljjXiUZPknfTDlM2yaGoH7hkpa0caGfhlZ3dRj3cwwLBu+S/JEIRhndz/XK7s5q/BhRHpNd+Y
	3x998msg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l65h5-0006JK-LM; Sun, 31 Jan 2021 05:54:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l65ge-0006Bb-5Y; Sun, 31 Jan 2021 05:54:17 +0000
Received: by mail-wm1-x331.google.com with SMTP id y187so10382373wmd.3;
 Sat, 30 Jan 2021 21:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8+AW/kKV57MV1Hg+Mxh63gGp9E1qwTrjnLtYXQZusbg=;
 b=MGCDMbs4pGnpYYCve9uEvfF4M93qP/pW/Oz5YXgn1PEe3yoKnRW5DwvlKTdX04VboD
 QPivn5mY+BXDcBRUdCkSVOW96bHeDnEIFj6EhE5hlvIALblnedVqpXN+zYS4MxxrmVh6
 L7+n/KODPVtyl/af/voeznsvtRMYELIvkhO2pptSg6LIoqA/p875S6cRgfsEcP2UZUsY
 mv1jlYHrftUKiefxMh97/euXVnX3gS7GBWuAkXCw2sm5zbeNZGT8XznP+IbrJDrbiqRj
 uYV3pedWRaXYBx8DRlYejDzJ+5vqV8q/J6xG/TFsB8s9wsTyehLe3yeAZcziUcerm3sm
 Cyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8+AW/kKV57MV1Hg+Mxh63gGp9E1qwTrjnLtYXQZusbg=;
 b=BrbsCzcb2kW8Gfz6SNriCExH7Wc05BBjoTtjIH0pfN+dJp8Mzl2KL+BDSYSbvtLfFm
 BGRwlw4v6FvSLuAOq6N9SQ/lcPGCgPaMbDnxebhlJRktXFEf2rC+4w/gtXf/xZu4dohK
 rA4yHVpzEVWyZ4sycKrdaDEblfwCkRlNAoV7YwQ8lO6thqjNGlEwhBUixIbvSQRlHJTa
 gMNc1pc0f4n77AWTb9ds2yArprnMM+RNpf5r4fnG3DfW5MFyk23RlijCjFDPzTDP+fUM
 cF2Rwx9pQ3tvNruQdkMFY0kUdN7dsXWQkrTHYJeSTIBCx5/zha69dBTg6NURjTgp7/Oz
 K/jg==
X-Gm-Message-State: AOAM530ArTivSMZryJXrkAI1ejbelC7o2Rz9WGoasoSMst0CoHRA7F7L
 uNnlwGGbdYPJlmTxx6P1bKo=
X-Google-Smtp-Source: ABdhPJxWRA8y/2Vty7z1wN5H0YKyPzpEX6KiEi97oYHtSefO+dWzS8tMs9vdQVCIrwEEaiLWsbTO/A==
X-Received: by 2002:a05:600c:35c4:: with SMTP id
 r4mr9757373wmq.174.1612072454843; 
 Sat, 30 Jan 2021 21:54:14 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c9sm20056589wrw.76.2021.01.30.21.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:54:14 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: meson: add initial device-tree for
 ODROID-HC4
Date: Sun, 31 Jan 2021 05:53:58 +0000
Message-Id: <20210131055358.21293-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210131055358.21293-1-christianshewitt@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_005416_268233_EFD491A3 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ODROID-HC4 is a derivative of the C4 with minor differences:

- 16MB XT25F128B SPI-NOR flash
- 2x SATA ports via ASM1061 PCIe to SATA controller
- 7-pin header with SPI and I2C for 1-inch OLED display and RTC
- 1x USB 2.0 host port

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index f3c8a85fe987..78a569d7fa20 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -47,5 +47,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
new file mode 100644
index 000000000000..bf15700c4b15
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Dongjin Kim <tobetter@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1-odroid.dtsi"
+
+/ {
+	compatible = "hardkernel,odroid-hc4", "amlogic,sm1";
+	model = "Hardkernel ODROID-HC4";
+
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
+	};
+
+	fan0: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		cooling-min-state = <0>;
+		cooling-max-state = <3>;
+		cooling-levels = <0 120 170 220>;
+		pwms = <&pwm_cd 1 40000 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			panic-indicator;
+		};
+
+		led-red {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio_ao GPIOAO_7 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	sound {
+		model = "ODROID-HC4";
+	};
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map {
+			trip = <&cpu_passive>;
+			cooling-device = <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
+&ir {
+	linux,rc-map-name = "rc-odroid";
+};
+
+&i2c2 {
+	status = "okay";
+	pinctrl-0 = <&i2c2_sda_x_pins>, <&i2c2_sck_x_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		status = "okay";
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
+&pcie {
+	status = "okay";
+	reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+};
+
+&pwm_cd {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_d_x6_pins>;
+};
+
+&sd_emmc_c {
+	status = "disabled";
+};
+
+&usb {
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
