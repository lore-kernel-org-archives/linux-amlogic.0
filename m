Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0BCD31A09
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OacgDMQ9pxJe19yz0g7Z85+IpjxhAyWLp6Zy/mk2CAE=; b=vI81FRd6UY8MDQCMcGtCLE4+Ai
	pOgxqBlhUeuGsRCc8QonO12iB3bzn3ssum6GmWrlM6bI5lT2RJeWRsiXhd101bnqRUscTXIcjgSgt
	LF7Oo4nOBp2ux12JK7q+jX5+m4AQklqHhgFnvK1RV8MEYzf7Bo9qqLfg0eyi1DsWJX3tQ8twZYmei
	bxq3119DR6/hvCxRbybjg16fCeIT4CGTp8pd/hmk8Jpjr1YUy10dtEN9lmGzpUi4jU7AypFk6rIyE
	c73LO4C0+ETEwuZSchYn2q/wlpJ1fVLz+6IYohIFJTeptvvVzUdzBK51Abet7JVlSHMl3tuz/nAkl
	GNI5l3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKe-000000087PB-2qjd;
	Wed, 14 Jan 2026 06:26:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKc-000000087Nq-2HoA
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so4634245a91.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 22:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371973; x=1768976773; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GqboQ4ROVgM/dfJzro4IzHUtcI9B21cZXNDgBmCYmWI=;
        b=MJ8FHuGurZ8qoFOXlDq1jsQe4ieeSUhwHwtKvn5QlpzIX52iEiG1n+gY50IIBMcHAN
         +KdGErt//HOyY+4lH2bTZX5xDo6L3eBpRrnhw6ZBV3YGl+t0q0GQCxqxjTKQ/de+p9CK
         T+1geM5w0YvbNJOEV/IhltKrQu5cnHJ8zpVMmNx+Mjd+aFvED10IHvAO6jFhiSigX9x+
         14xw/qccINsK2cb5l5Th46n6XghrOXXiwnhSbdCMc89F6YHRmdGF5zv79Nozaw6lhiUA
         EKq+qR5XuVhRLpmd+x+jfZwzE4OBQ3rvsTa8kPdoc/5TmTsCkcpsPxDN1vDr9GS3wASq
         QFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371973; x=1768976773;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqboQ4ROVgM/dfJzro4IzHUtcI9B21cZXNDgBmCYmWI=;
        b=K6NSm/+PKJjxWPyzSgktZECR/zz20qOwMieL4wr5JpmZDnD2zGC7cAtHYi6pKIzbYr
         heMyedpwb9fNpbMtJtMSrQmZTTHqAVwWr+hVxtelC9gOx05boq23W/CHRmTAbIf4AYiD
         Fx5YIvssJ5bTnoo1OTKeveR81UxwsmlBPSjI7M3igpEiK0Ih3x8+7GTO89zuLFw98QYW
         1y/to+3+w/LDIQTrT8wPIx4UHRtXGN6qZCnswADBfonMwdl3iOUpgFacVjeSrHgNpOWx
         +akClnNi1ZMu56/rchel6H3C0yhL+KSAWjdzi7aA0vGz/HlzCtdcsW+btoLnZnWCrSMw
         1bhg==
X-Forwarded-Encrypted: i=1; AJvYcCUZnSGfpe2wX4VCjJpIB2aGzv3PqljYwmpsvQPTFTSWhdlvNDBxdQcbaHFr9c1TORLne8xEJK02kHV7jWsq@lists.infradead.org
X-Gm-Message-State: AOJu0YzhHUDrQg4m6XQ1EFgt6jTfW8vbEr1JAz901jqlh8OISy6c1vCM
	FhdvU3FWFwtmv5kO96pzfeb4s96Dzk2ViIpH+mFALyn15NWvIQFXZ3Dr
X-Gm-Gg: AY/fxX4vRW3y0F+Zy4O41kBxynWF4NxsY+p0g8wiqwMFuVi4qCOT0AutvaIkt1yUmtB
	YlXPLehXX6/+aOVVDONm4nCHg/AZxolRONEdfx2PQEubp43y8xZSqRCOZ4MdS4dlmDLQxrV2PGp
	Ij0ahimdJ3szJ+PVLanpQx0Jlu3mrRxHyHzyze/bmduinKhimLN+uFTMdWZpRs85kalTySIT3Sf
	fUiBQ78hkUXlyhLbD0TPKRgI0igjjZ5f+NbVmJPq1sGbmWMBDurGrhc5W89XPMYm97fdqTKssqD
	wwIoD9zSSKrySAE54bLpsNpOCgsBoV1VSj43NRIe/gem5dZd819uz8iCDBpq3eFxYnzTX7tJBB+
	RKo7SXcImvP8ZeDA5IEz9sNnSGt1CTeu9FFkCn5xjK9LsJ8jvAk9vkbv+8YO1146tE8l6dkyMeZ
	Fs++B1hyc=
X-Received: by 2002:a17:90a:e7cc:b0:340:bb56:79de with SMTP id 98e67ed59e1d1-351091780eemr1590209a91.30.1768371973579;
        Tue, 13 Jan 2026 22:26:13 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:13 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: add initial device-tree for Khadas VIM1S
Date: Wed, 14 Jan 2026 14:25:49 +0800
Message-Id: <20260114062549.68954-3-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260114062549.68954-1-nick@khadas.com>
References: <20260114062549.68954-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222614_590676_CF17943C 
X-CRM114-Status: GOOD (  13.55  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, krzk+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Khadas VIM1S uses the Amlogic S905Y4 SoC, based on the
Amlogic S4 SoC family, on a board with the same form factor as the
VIM/VIM2/VIM3/VIM4 models. Serial debug console, ethernet, SD card
work with this initial device-tree.

It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 219fb088c704d..15f9c817e5023 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
new file mode 100644
index 0000000000000..a371ddcdb5e99
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Khadas VIM1S";
+	compatible = "khadas,vim1s", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &emmc; /* eMMC */
+		mmc1 = &sd; /* SD card */
+		mmc2 = &sdio; /* SDIO */
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 52 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			reg = <0x0 0x05000000 0x0 0x3400000>;
+			no-map;
+		};
+	};
+
+	sdio_32k: sdio-32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&sdio_32k>;
+		clock-names = "ext_clock";
+	};
+
+	main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	vddio_sd: regulator-vddio-sd {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_SD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <1800000 1
+				3300000 0>;
+	};
+
+	/* SY8120B1ABC DC/DC Regulator. */
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+
+		vin-supply = <&main_5v>;
+
+		pwms = <&pwm_ij 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+		/* Voltage Duty-Cycle */
+		voltage-table = <1049000 0>,
+				<1039000 3>,
+				<1029000 6>,
+				<1019000 9>,
+				<1009000 12>,
+				<999000 14>,
+				<989000 17>,
+				<979000 20>,
+				<969000 23>,
+				<959000 26>,
+				<949000 29>,
+				<939000 31>,
+				<929000 34>,
+				<919000 37>,
+				<909000 40>,
+				<899000 43>,
+				<889000 45>,
+				<879000 48>,
+				<869000 51>,
+				<859000 54>,
+				<849000 56>,
+				<839000 59>,
+				<829000 62>,
+				<819000 65>,
+				<809000 68>,
+				<799000 70>,
+				<789000 73>,
+				<779000 76>,
+				<769000 79>,
+				<759000 81>,
+				<749000 84>,
+				<739000 87>,
+				<729000 89>,
+				<719000 92>,
+				<709000 95>,
+				<699000 98>,
+				<689000 100>;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins1>;
+	pinctrl-names = "default";
+};
+
+&pwm_ij {
+	status = "okay";
+};
+
+&sd {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&sd_3v3>;
+	vqmmc-supply = <&vddio_sd>;
+};
+
+&spicc0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spicc0_pins_x>;
+	cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
+};
+
+&uart_b {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
