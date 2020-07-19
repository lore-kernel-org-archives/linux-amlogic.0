Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9ACC433E7
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:15:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6330B21741
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 02:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmcISEhU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkQRdQwv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6330B21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCvg2s4bGso4ZtqHRiYO4vlIxRdQXTclqPX3wW3Bhh4=; b=fmcISEhUwcZUhBoiqVglvYnxe+
	UYrYTzr8J9N4gFs8xFbFjm0EH7J3WRvCb3Jw2TmQo5JbRJ6o94MlU/5BGdITpCLpjTFLcFuIsl0RW
	rAraYbOIkF++mM9xhlVDSSI5LnU4Z/cy0ch5sDg+JZlhnmUDIqyR9I7rwXIEeeWbp8w0OXkFXmRA0
	XdTIk1vEhinF16BB0r8UOD93POuPC+RDPIkQ3Eu5KlThC3mRX+1MWvopyeTfSkU3TPRXZjfGoltvA
	mnWCQIY8zdG6MkbjcYiXDRCkNPsIvvdOH0yR/XqSoKM+/iheztTlVnEDxIB7N0eTAiQrCrKzCaqyS
	YS6xcUkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwyqo-0000yC-Uc; Sun, 19 Jul 2020 02:14:50 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwyqa-0000v9-GV; Sun, 19 Jul 2020 02:14:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id l2so21950870wmf.0;
 Sat, 18 Jul 2020 19:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=f/k6s/5qmewnWjxFcMIM0b99O8FqXfAS6+WbVBOfeCk=;
 b=LkQRdQwv3EJoi5ixLnVE/NdpEUpdtSbCxrPSt5daGoTngAYR2Wa5889gudZ35stMMs
 18HXMRAEIzEZ5mo+Ig81Ic4dS1TpdG5vYn9XML676JM7AbKWBAUWq8i5BR/UXCBp9ajA
 MUsDj/5zUlJNEzm+vwB8mEfHV+yuxN3nJVXJt5XZyKH+GaRffmsBBcxHOJNkDJgBB3Ui
 Ds4fijRUN8PcYkbKxZWBCjDy6ZV+1Gn1TdsMFYErwfZvdyy/tQaLOP97GXMb4B+fZ6Hy
 UillKr8pTSnsn0YLeHmnyc1D0QuGArQLaooOdFDvLWC+VgYi1xMM+v2pBbcfITUdAynV
 8oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=f/k6s/5qmewnWjxFcMIM0b99O8FqXfAS6+WbVBOfeCk=;
 b=eElJ3/KRx8P4wTG64do/W+CMdG/S2aEYaNjO00g+Y48TQPeuLE2dv/4+0Pr6omEUCN
 AI3F9jIOopngoN/wQzzTPl5k4RLw1D5A5PIrP9XoIBoRCWA+VTxeQWGMt09N8mXlM/qF
 Z4wMuH2kArx79ZoXzZCGjGuf9AAyRdZkcpSwOUhVIXNYU+M08G4VjE2DYBsSmLpnpsKP
 nnGlpnO52T98v4oeIAddrTFTksovSTzj8hPH94svOxP0za3DjGJmXvnwN3J444tmhDrp
 ETgmMfl5Y9bHjQXabhQ1i0sFYu3fmIcieWooq0BkUrAJVvbTnlQAo5jJOwq2dBmJ8/qo
 ntUw==
X-Gm-Message-State: AOAM533ssAp5zfJW4xlSceZ/Ygtw5t02v3NuJvR6eKVccT5gU+OgzhWn
 uIiFN//PPtuQjpWG7LQStgU=
X-Google-Smtp-Source: ABdhPJwpWTTE/GDunOOTw7qO8XBqUvSyS3YM95KTtdlvFevKHYpHoSsOuw6N4/Om4DkAOb0gekKS2A==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr15199988wmf.140.1595124871096; 
 Sat, 18 Jul 2020 19:14:31 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id v15sm22078103wmh.24.2020.07.18.19.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 19:14:30 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: meson: add support for the WeTek Core 2
Date: Sun, 19 Jul 2020 02:14:21 +0000
Message-Id: <20200719021421.7959-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200719021421.7959-1-christianshewitt@gmail.com>
References: <20200719021421.7959-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_221438_398059_8365198C 
X-CRM114-Status: GOOD (  17.82  )
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

The WeTek Core2 is a commercial device based on the Amlogic Q200 reference
design but with the following differences:

- 3GB RAM, 32GB eMMC
- Blue and Red LEDs used to signal on/off status
- uart_AO can be accessed after opening the case; soldering required
- USB OTG is not accessible (inside the case)
- Realtek RTL8152 Ethernet (internal USB connection)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-wetek-core2.dts     | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 5cac4d1d487d..4e2239ffcaa5 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-q201.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
new file mode 100644
index 000000000000..ec794c134c15
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxm.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "wetek,core2", "amlogic,s912", "amlogic,meson-gxm";
+	model = "WeTek Core 2";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>; /* 2 GiB or 3 GiB */
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+		};
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-update {
+			label = "update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		button-power {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+/* Disabled as Realtek RTL8152 USB provides Ethernet */
+&ethmac {
+	status = "disabled";
+};
+
+&internal_phy {
+	status = "disabled";
+};
+
+&ir {
+	linux,rc-map-name = "rc-wetek-play2";
+};
+
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
