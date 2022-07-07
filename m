Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A47C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Jul 2022 09:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWsiqOsMlegrnf6GyCbXItknKS3ucdr3xrNSdudkQe8=; b=WzV7b2b9DS05Eo
	6QILz5m6uOvV3MuePIrQLgudGKrbdMtbW6du7NTA7tpcs5+fK0AuLpPwzGmv1wMI807i+OC4QqKeV
	L5Mcdccg1xAsn+dmBeZvuHg2oScEzK4TsopoMBPWJAxp/qVs7Jdo110vGL+PA1bMRtbNn7mefsmL9
	BAFIBKe8h+py6wiwQ2tVhT9FmhYJYEy9aRKHdnWyTVz3us5DUNSrkGSL/P1HMG8rT9Wj95Vb1/JiV
	SCLTH2etIMkYMaNOb7HxIXtN+mTyCwot4RvPL6N5QX002qSdS3zskSSzbvFwT+Zk2xbDLJmjYWtG1
	BdLZIDsjB/L6fkz1wuSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Nzm-00FQhI-29; Thu, 07 Jul 2022 09:40:26 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9NzR-00FQaF-Eg; Thu, 07 Jul 2022 09:40:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id o4so25490021wrh.3;
        Thu, 07 Jul 2022 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OUVPcq4q3E4bhVRZ+lHAS4gY3QFj2Ligmd2Amh/NpBM=;
        b=cgcPPB2i6sWifOs6kPfLkJDu6QyNBgvnYiAW+eD3N7VX9ur4tjhvpsY2jeYTx9kbl5
         0OOea+sl6H45lrQu3944DtOZgS3MIaqdbPo7xg8loq10oFF/3cNiApRxvKUSQ2mcBaZ8
         mngsc/FQomfaMPav2kxUBKocvvUwos8tG2r7eU4GTSEncvjVUQyUnQK70J4Q7aJ2yB0P
         qZ8IFhuOYXNFkYuLjq8AXNb8p38UtdzMSiO/HFxKHD1Z9/KNh0RHs4WdV2dahZHeWjLk
         L5w6OmYZob+etg5OMpa+Zc4qf1kO61HZIHPeGrYHRIx2zgKCUKNNovexWSJWRQYXM8Gh
         zVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OUVPcq4q3E4bhVRZ+lHAS4gY3QFj2Ligmd2Amh/NpBM=;
        b=Z/sweYSmYwdiurTvVqzS/D/yx2iX3Cd4DiUURXLaX8Dh5XBBPF07apDEJqqJL/SuEP
         FAGJbzPqxiXfc9skT+Unq4pSBoCzgdJxQDUOK/kf148FnZFqJYQTIPN19nUw1dlSv4ZK
         3UqV36votm7R1//lgc8tZr9M/RzWte0LUF/ubxND3h1lRb8igUZfmdT8Jd+lJOexTvmk
         HmAUWGJiIqpR6zFaPT97ZnjZwFY7hXa7Yux/yiK3KHdDIm75Q6A1r7qsNcOnxoeMwkZe
         NeIE8XRYbOG0wiwuDKWT3A15kZnBRdI0sI95n1Ahu6nnZqQM9ou9i/h8GW7S8T+tpsT5
         LjqA==
X-Gm-Message-State: AJIora/6uwRrli04dYYBByMQK7lnIMB0n5h9k8+oxLgAH3/N/LG0C6Yb
	BESupdvHUEDja0b27zyVObc=
X-Google-Smtp-Source: AGRyM1s6r93NBy8U+IzwmI6xLdJA4hfOwghOpUgOiLfmSmEXkggIy53JffKlIDobnT9i2qxfZrxgLA==
X-Received: by 2002:a5d:4402:0:b0:21d:8093:138c with SMTP id z2-20020a5d4402000000b0021d8093138cmr5079378wrq.535.1657186801740;
        Thu, 07 Jul 2022 02:40:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d564e000000b0021d68d3a27dsm13831314wrw.45.2022.07.07.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:40:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
	Furkan Kardame <furkan@fkardame.com>
Subject: [PATCH 2/2] arm64: dts: meson: add support for Beelink GT1 Ultimate
Date: Thu,  7 Jul 2022 09:39:54 +0000
Message-Id: <20220707093954.21716-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220707093954.21716-1-christianshewitt@gmail.com>
References: <20220707093954.21716-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_024005_562949_09DFE335 
X-CRM114-Status: GOOD (  15.99  )
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

The Beelink GT1 Ultimate is based on the Amlogic S912 (Q200)
reference design with the following specifications:

- 3GB DDR3 RAM
- 32GB eMMC
- HDMI 2.1 video
- S/PDIF optical output
- 10/100/1000 Ethernet
- AP6356S Wireless (802.11 a/b/g/n, BT 4.2)
- 3x USB 2.0 ports
- IR receiver
- 1x micro SD card slot
- 1x Power LED (white)
- 1x Reset button (internal)

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/meson-gxm-gt1-ultimate.dts    | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 8773211df50e..641399fcbdd9 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc-v2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-libretech-cc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-nexbox-a95x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905x-p212.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxm-gt1-ultimate.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
new file mode 100644
index 000000000000..2c267884cc16
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) Christian Hewitt <christianshewitt@gmail.com>
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
+	compatible = "azw,gt1-ultimate", "amlogic,s912", "amlogic,meson-gxm";
+	model = "Beelink GT1 Ultimate";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-white {
+			color = <LED_COLOR_ID_WHITE>;
+			function = LED_FUNCTION_POWER;
+			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
+			panic-indicator;
+		};
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1710000>;
+
+		button-function {
+			label = "update";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <10000>;
+		};
+	};
+};
+
+&ethmac {
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	phy-mode = "rgmii";
+};
+
+&external_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&ir {
+	linux,rc-map-name = "rc-beelink-gs1";
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
