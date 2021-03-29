Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECA5C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC7A6157F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 23:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC7A6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxY6DuQc7YgujlB6wCGBhkoeGETlG34rUrete6UFQWk=; b=R3yPirz4h6mE0y/FlFxdVFuQaq
	y+RFxB3a426UARX8B9d9tvH+sI0097Vu0g19gWIT8yimMMXRIbxanWDS+Twgfn5CDKiJgCrAYi94i
	eBbfxY8l/hDE//id2Q0L+L34+TrusjHqQ4MP/DwwERyGW4gAgs6dgXmIFkgyogfJaYdJch7sk7dtW
	0HKSC8Qc4iizUpzxqwq9GrKqENOYALuWCUHD9jQ1jzV+EIxnJh+mEvnCvZXon2no9X6Ayq4S1Vz5g
	z/BdVCwHBwVnwbzGZjS/ihHQmbD8Nak5ZlHKOBEiPekfiYWnLePgKz5xCmrRGY3n3CboKu5VRGo+g
	D9hbnI/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR12Q-001qzR-HI; Mon, 29 Mar 2021 23:11:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQu7V-000kDo-UC; Mon, 29 Mar 2021 15:48:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo6895365wmq.4; 
 Mon, 29 Mar 2021 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8vTax4vGXeJlAusGjSxRFk/xedDbUBF4fuZSgptJcQ=;
 b=kNr8ermtOiF4nGD8VNP4DuvshX/MfsZ8hdtAs1s6WkDNABc6E9/jgz51a9vtWaf8Of
 nsG5CLAXi0eLqwc9tEzm26HGyRciIrMkH0Jvpoyte5MEDm/nTYqB0Gm0VeDZomr2uEH2
 yRegWMH0eZNfHi7U7xqRExDUfh/1EKSyU5vhmbtks9eB9TZCULig/Pjcb0MZRpHqz+4U
 1c1ETxNPuB3sk+NmC5aGQ+UbLF6HR3zwY9ltDLCyToeuMWEP4p9v4QjfA5S3gzqqwwnC
 LV+nu+eFztl4tXcp/T5TyoyXU3KFu4YyK+MXOjKpE3FjLIbpk9n+ourADjmEYmkjr3fk
 MnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P8vTax4vGXeJlAusGjSxRFk/xedDbUBF4fuZSgptJcQ=;
 b=i8GilR6c6YmyuxueVkaoNtKELgetCnPmzTx8naTwVrm7zvF0nm+wP+V4FOlBvcrUy5
 glE5K2R1F/8LAMV/3kXs0jgxt7p14iXbknpGt4UAbmu4AkOowRBkVpnNWIYO4SZYThBN
 Ps01H29oDk7o9Z2JFOfqHlRy8nGlFkJ6ULSP7SYWLk77oG9hg4wQx9r22sAvAs1nnjR0
 SjuPaUzkON+5PENFsMJt5cjHejxp7Ez+PJtk7+i7rXxiks81g1M8i1R+4hbQm5iBcfbh
 ao+69BReZeiM3a5P8hgQBk6MtdeSWxkHDSJ40iQhdph5abQ7A3/DvzDEwKkUVs7hvX8G
 t0Tw==
X-Gm-Message-State: AOAM532DcVwVyOwvtOhqHQHtYkV2oY99PH5PvIgsl/BZfAKs2OMbedUi
 32UkmsrSU4WQuWO4pnxQ0VQ=
X-Google-Smtp-Source: ABdhPJxgPl9jPEbxeqm5eA964ZOa53TtaZwTejokGHmpP789ucLwIFiBOgMeWj/LULFaBLhGFh+LoA==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr17645918wmc.92.1617032881387; 
 Mon, 29 Mar 2021 08:48:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b131sm24987323wmb.34.2021.03.29.08.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 08:48:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Drazen Spio <drazsp@gmail.com>
Subject: [PATCH 2/3] arm64: dts: meson: add initial device-tree for MeCool KII
 Pro
Date: Mon, 29 Mar 2021 15:47:52 +0000
Message-Id: <20210329154753.30074-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329154753.30074-1-christianshewitt@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_164804_011708_18FA5EF0 
X-CRM114-Status: GOOD (  15.70  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MeCool (Videostrong) KII Pro is based on the Amlogic P230 reference
board with an S905D chip and the following specs:

- 2GB DDR3 RAM
- 16GB eMMC
- 10/100 Base-T Ethernet
- BCM4335 Wireless (802.11 b/g/n/ac, BT 4.0)
- DVB-C/T/T2/S/S2 (AVL6862TA demod + R848 tuner)
- HDMI 2.0a video
- S/PDIF optical output
- CVBS/Analogue output
- 4x USB 2.0 ports
- IR receiver
- 1x Power button (with integrated blue LED)
- 1x micro SD card slot

Tested-by: Drazen Spio <drazsp@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../meson-gxl-s905d-mecool-kii-pro.dts        | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index aebd49c88719..f8f515c93055 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-mecool-kii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p230.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-p231.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-phicomm-n1.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
new file mode 100644
index 000000000000..5ab5d3aa0646
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/*
+ * Author: Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905d.dtsi"
+#include "meson-gx-p23x-q20x.dtsi"
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	compatible = "videostrong,gxl-kii-pro", "amlogic,s905d", "amlogic,meson-gxl";
+	model = "MeCool KII Pro";
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "Update";
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
+		button@0 {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		blue {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+	};
+};
+
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&ir {
+	linux,rc-map-name = "rc-mecool-kii-pro";
+};
+
+&sd_emmc_a {
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
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
