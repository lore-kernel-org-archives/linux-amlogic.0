Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404FEC432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BC720732
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:53:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AR3H5eOW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2HcumSg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12BC720732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2taUV4jmkS3sFJiG2ts/fahAPwAppIyH2umAeS229o=; b=AR3H5eOWIshzUA
	a5RkW2ETnHyWqU/wTlRVv6qiUWMZp/HwcXDT03lhbJ7quFIfvMvRyoyghj0lGgSa8Pxwlkq6OLe/1
	f02Hdb/0jd3bD2YiMgZ6VK9JcVtbipESUir42hEzd0ZMpMh4S4dHcZEPKbuzm5apKlnrixZdI2AKC
	aWR5GqHcpDMKXhJ9PM0PIEibet3wNYDNv7IR+9Z72BRSfKrvyjGHp3V4yuNzwOSky6OoVPr48DMGR
	A9msv6WOlL9olsbhvQCe36n5nuNLUja4jr2pn5GVd6NeCG5evebmX7K7MsF8eo3KonliOAbY40Rjs
	eLYBLHF90vCa7IeyyMfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib8oS-000860-7R; Sat, 30 Nov 2019 19:53:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib8oM-00080I-AH
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 19:53:47 +0000
Received: by mail-wr1-x441.google.com with SMTP id z3so39050251wru.3
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 11:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qEJfZCeBJSuM1wQNJg197wMpa2YEmeZTan6JdMtsXfk=;
 b=N2HcumSgHhuRAqMJtdw+wwJo7f4WJ9p1rfzaKWAXf/oEy0uqchKr0lneqs1MNsU37l
 ByfOPAxn5bEwtSjwBafDO+IatLkPEmODgbN/7C3gbwzx+4mpgPzkCz+yKAtbWyEsDdEd
 ET0QHhtsp4+TUOJx9uD5mN93rKNzMN9wjtbddqJjepfuGFHT7QfFG0urC3QsB/czXZs6
 R7+9QGv1ct+HA/tYO1bc2qF476IrBGCGWHoVGXYUCGeqDzh3YL8EfJn62U0iCFRoA4Dv
 Aa09qCsfxxktASC8G1FfIH/kmXA1xjyFwQIfM9ROJU4SliB7RYriwGWjLC3zdFH7Gn8R
 gQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qEJfZCeBJSuM1wQNJg197wMpa2YEmeZTan6JdMtsXfk=;
 b=aIGk/84XQhSwoP8y8bGlL9j0TLR6fSn9FJj8OI8sHADzNqkjT64cfYdskYbfc1cAR/
 tOFtQoj60/hbVbShGNmbd5TReUstNjkirNyhpqhqY8RGQmTZK04UOuPTcxALX/JG4AQ+
 qwfD5J5uu8YoDw4ocn4O50jET0YxlvKs91QE+zz+9fyE70NFTgIxjpVTxnW06jvx5VvU
 JnmjzVil+Wn3JcBhGVrtUiht43KZ/gOHUmfNL5H0wSuePBJR0V0lXxVjPS6Nco1lI8gV
 NTdjQ3d6YOavCEBMMRa/zaQxYUDSjLdDphAjUQWoSVtMQJqAXhqVuc7Sx+ifycokjyr5
 P1XA==
X-Gm-Message-State: APjAAAXO1iuZ1r3ZRge1xBZ48z63/K+i3wKrpNDXkIoiujeCDK25bvtT
 0IvbVzynn2xpyRNFl+Xfb0U=
X-Google-Smtp-Source: APXvYqw2wwX4rs9Q64IJg8+tP0B5RHOBkk/BN6MnAyMt/7om6fzliAYbNeiPrXsRNhZxkLk5241uPw==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr5168426wrw.277.1575143625042; 
 Sat, 30 Nov 2019 11:53:45 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id f19sm34329929wrf.23.2019.11.30.11.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 11:53:44 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 3/3] arm64: dts: meson-gxbb: add support for Videostrong
 KII Pro
Date: Sat, 30 Nov 2019 22:53:35 +0300
Message-Id: <20191130195335.17740-4-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_115346_372106_E0C421A1 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds support for the Videostrong KII Pro tv box which is
based on the gxbb-p201 reference design

Device specifications:
- SOC: Amlogic S905
- RAM: 2GB DDR3
- Storage: 16GB
- Connectivity:
	- 10/100M Ethernet (IC Plus IP101GR)
	- 802.11 b/g/n/ac Wi-Fi (Ampak AP6335 BT/WIFI combo)
	- Bluetooth 4.0 (Ampak AP6335 BT/WIFI combo)
- Video out: HDMI 2.0 up to 4K @ 60Hz, and 3.5mm AV (composite video) jack
- Audio out: HDMI, AV (stereo audio) and optical S/PDIF
- Tuner: AVL6862 DVB-C/T/T2 + DVB-S/S2 demod and Rafael Micro R848 tuner
- Ports:
	- x1 micro SD card slot up to 32GB
	- 4x USB 2.0 host ports
- Misc:
    - Power button and LED, IR receiver

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 84afecba9ec0..a795a170dcab 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
new file mode 100644
index 000000000000..2f1f829450a2
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxbb-p20x.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+/ {
+	compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
+	model = "Videostrong KII Pro";
+
+	leds {
+		compatible = "gpio-leds";
+		status {
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			default-state = "off";
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_STATUS;
+		};
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <20>;
+
+		button-reset {
+			label = "reset";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+};
+
+
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4335a0";
+	};
+};
+
+
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rmii_pins>;
+	pinctrl-names = "default";
+
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rmii";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			/* IC Plus IP101GR (0x02430c54) */
+			reg = <0>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
--
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
