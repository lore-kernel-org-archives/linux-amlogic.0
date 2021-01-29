Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C5CC433DB
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AC064DFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 06:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AC064DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNiq+E1TKxt9c1qpUNm1rKl/muNChuEdihKLbf7zmc8=; b=jtIyF9ouXLdIgegXjEu4lRW6GV
	PhMBu6VxWWQrrOT9EbzjpHHZ9PFf4WJvpmfGpWRGmrFy+/+CKZwlIMqxgbwbbqo6lFtSixx2tMLpZ
	5Xbd1sIOLJ1kCKtNujDdENZgRCn5XQ5SaBv/r+bO/UoJPN+aPM3/sL8HUEhA0GiLalfid31py0quW
	VAyVGVeJVpnDTebRl0uJ5qZwLRPAQ0wsc3fYlc4E/nOnaacww5AfwpbXoFQ7MOQ0DL4Fep7kMGobv
	1OOU+M3EXGLB6PWVUBCs8+dV96d3oXGwS/769J0zd691cAY6jRUKwELuPKdJeHJlG0TM4idtB7H3A
	8CpFi1EA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Ne7-0005yM-Dk; Fri, 29 Jan 2021 06:52:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5NdL-0005fj-7c; Fri, 29 Jan 2021 06:51:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id s24so6415680wmj.0;
 Thu, 28 Jan 2021 22:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VP2CCHQBNXtKJCFkUJhVL9cJo4wDQJQBLx9guRyCYbE=;
 b=lAFERyn16t6IKH/B04xnGPDSjZabYoJgG5eo0coz6k9LcA6YQuuwyLlv44vRC5dC4Y
 gnAKe/btYtvAxPXbxbEy5J/xiknphQ+9cUmw0NFtRLg/mVMOX/sMqoI99ybA7lzPavbI
 iwN5TgWc94kMh/g2x/PthN/bbRtc+59JvaWRVbsyhRNooH8eACo+KzueUt+6r0zJqzbB
 AeZq1/kqPf2nbRniehVZMAfH6/W6vPA6xrsiLeVI2uNNCkzkKB3eJJX++DmDdtX5k1Xw
 HqcdNDhSr1+4hp9rlwtdkTrRsADxh0Zz45wqfLd6prnb+N8/Fmf1WuesakekYNSzRXgs
 oN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VP2CCHQBNXtKJCFkUJhVL9cJo4wDQJQBLx9guRyCYbE=;
 b=fkX/oz/NCt5viHzCBdq5T4JoEPWxNkp02oeFgGdPaEJzGBMj0Wn4WDdp/+aLulreLs
 U2YSyIechSgp6NateTmu/gesoAbE1eMo5AyvSTSa55DwcgRjj5K+g21b2Elg11WWZ1GI
 hrA9ZwxW4Dq03/Lx4X7rHvelvDglTxkEEb0+Jn3wwYw8hFiux6yjTjq+zisOWNzyUPUh
 RJDKkFXmK9Ju7cHPekGtJA7o0ZBZsfSYpaOo5OceEjwHdLEZl/JA+pFJbgONiH6nxMUt
 v+U9MrLNgKIvYf0NQjKvXDAj79V1ufsT1RGsALl6ji/fLywOffwk+obYqjMx18BEdQD6
 RBgg==
X-Gm-Message-State: AOAM53182UQRJRjVMgQwFiprc1/B1yudh8fD7BHM5mtNdo8BvMuNvbgd
 D4MJXvW1saVWOEhogRH/JSE=
X-Google-Smtp-Source: ABdhPJzewy07pHgft5spDvtWcpL0Z0Jzf7htu4T7gYqWUbTeHW/zs2BxZAinDBd9hp04xwerCswt+g==
X-Received: by 2002:a7b:c94e:: with SMTP id i14mr2382899wml.26.1611903114076; 
 Thu, 28 Jan 2021 22:51:54 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b7sm11501236wrs.50.2021.01.28.22.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 22:51:53 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: meson: add initial device-tree for ODROID-HC4
Date: Fri, 29 Jan 2021 06:51:37 +0000
Message-Id: <20210129065137.5473-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129065137.5473-1-christianshewitt@gmail.com>
References: <20210129065137.5473-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_015155_346750_F715FFC9 
X-CRM114-Status: GOOD (  16.89  )
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

- 128MB SPI-NOR flash
- 2x SATA ports via ASM1061 PCIe to SATA controller
- 7-pin header with SPI and I2C for 1-inch OLED display and RTC
- 1x USB 2.0 host port

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
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
