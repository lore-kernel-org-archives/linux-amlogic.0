Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665C3C27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSz1FFV4KO4J9sXUmq1xnJk1gW+/PF8gpWiooOXC40I=; b=N+/D1NDR1iyHH4
	OXzGqGQY0zFuo8gbkjLWi7UCRh+tGGisQNGxF3HiyId0dlJyUcCqyPqecYyt2n07b1Qf8lBPXal2Y
	uqXEzC4eVQ/zTsm4Qdv4c6k7d46W8hdZ3U3or2xewaIDRaYHFJVtbQH7rIGtOH1GDty1iq3/HblY7
	VyflHb64z7yUfXLF4ceOur9+eozHEgkHxI2EYZQ1Dns7OsmXvOIWv1qs4EVEjmpBQspHrO9sNLPIv
	iyR3Rjy3XsW3c+YTkaZ6STKP6nOoXVRoXMVq/hVbA9LXmeV/w+ubOjVN4/g5jlyeqXq4T7EZd5Cb4
	5JUCNE/vOZCfMFTpkWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gV-00000009GEy-2DG6;
	Thu, 06 Jun 2024 09:45:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gS-00000009GCc-1T4B;
	Thu, 06 Jun 2024 09:45:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-35e573c0334so1084529f8f.1;
        Thu, 06 Jun 2024 02:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717667123; x=1718271923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPZxqd+HK9QCwefzujyEZ7YJtOnYuNMu/PxrY/D/zOs=;
        b=XZLTUoPj4iUYLuXdUuAtdCybUkAmCfKczOs5K0ztSErtcjKRpHIQPsNd8arhWB48Yi
         tpuTHHwPxjkeR3DTrttw4Ix38MI15TTWgHOfvfc9BEnYkNIKeTiAr7NX3V621X8gp9VO
         lXfTksLgf53/d6BV2ltyN4d92BMfqPwySDfat68d1LqG147ZoCigVvW/dhJWUlSnARht
         3nOe6eFLwjcLyH2cG1HYXn9owqkPH1DZdRUENp0rJ0kHMMVB4uGr293ZtcgS/xbR7zvZ
         QfXsrlE6Lk4P9OmplU/eiVt0hcYnfJBI+/o4TVfOeCqyjBmYJ1M1ZBI7sf9SH1BWQ4kD
         OTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667123; x=1718271923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPZxqd+HK9QCwefzujyEZ7YJtOnYuNMu/PxrY/D/zOs=;
        b=suJrMfDrcHxJ1sk7ILRryZeUbR/zlKWNgfSj3PCFug9yF2CS04FsiwyJjmbDMpVXuQ
         Dzi1DygeAWnFe/ENtGOhkxrMYsUoCXh/JwSwreLwA3eczTAzwJ1Jd6JRvaVUkJJo4vRi
         07wtGDz30jagI1t372IAEumBVDVWw3ufBQtwZv6U1ZQwm1HO8x+V7jdP+7NdGkd4sTau
         2OfyGXxodwX/KCQoZLXNPqI7FeNgomVatH6uioEdv4gEKAnwhBj7CDMc+x/K4bDkMEl6
         ioHgTrPP4OCf8RWqef4R/AU/38xLBx8AWiISz8GgiLxXJL1wWCfMlOL3ABzFPAylnbd0
         Y4lw==
X-Forwarded-Encrypted: i=1; AJvYcCWJn5nSBTLNr4h/SK1Tz9F0iSDTDh49D8nKzv+IrNM8+gN9/dORehWk5XFAMhtI1msf5Ws6givI//SjuPuztF9wO/LLScUwtXbqvh3f55dc29gMBJxntjeZnzsk13Z4+xWskAg21EnNfLlGxhXTt0FmwNw4urPxVw==
X-Gm-Message-State: AOJu0Yz6XHvxfqMU5kumLsiY9kZRt95jAOWRlg7+3YwVKb+cy8U4nu4P
	BAbw5DSXE4wglESCf2BRpcmZFn9M/AVfmNrisb922jg+go0uspX2
X-Google-Smtp-Source: AGHT+IE2X+VpgV5lHOPi8IXiPFCpUTJ+8Znq4ocgTTnSSZ4q7QaQ6QMoF8m2FysALx1HYwvwnwWNuw==
X-Received: by 2002:a5d:6889:0:b0:356:4cd7:d3ac with SMTP id ffacd0b85a97d-35ef0d80463mr1759717f8f.12.1717667122636;
        Thu, 06 Jun 2024 02:45:22 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d47930sm1094817f8f.29.2024.06.06.02.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:45:22 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox One/Two
Date: Thu,  6 Jun 2024 09:45:13 +0000
Message-Id: <20240606094513.3949323-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606094513.3949323-1-christianshewitt@gmail.com>
References: <20240606094513.3949323-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_024524_624551_498679D7 
X-CRM114-Status: GOOD (  15.72  )
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

Dreambox One and Dreambox Two are based on the Amlogic W400 reference
board with an S922X chip and the following specs:

- 2GB DDR3 RAM
- 16GB eMMC
- 10/100/1000 Base-T Ethernet
- AP6356 Wireless (802.11 b/g/n/ac, BT 5.0)
- HDMI 2.1 video
- S/PDIF optical output
- 2x DVB-S2/T2
- Smartcard Reader Slot
- 2x USB 2.0 port (1x micro-USB for service)
- 1x USB 3.0 port
- IR receiver
- 1x Power LED (blue)
- 1x Power button (top)
- 1x Update/Reset button (underside)
- 1x micro SD card slot

Dreambox Two differences:

- 3" Colour LCD display (MIPI-DSI)
- Common Interface Slot

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   2 +
 .../dts/amlogic/meson-g12b-dreambox-one.dts   |  17 ++
 .../dts/amlogic/meson-g12b-dreambox-two.dts   |  20 +++
 .../boot/dts/amlogic/meson-g12b-dreambox.dtsi | 159 ++++++++++++++++++
 4 files changed, 198 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 0746e01b5853..4addcae2c54e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -21,6 +21,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-one.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-dreambox-two.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
new file mode 100644
index 000000000000..ecfa1c683dde
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-dreambox.dtsi"
+
+/ {
+	compatible = "dream,dreambox-one", "amlogic,s922x", "amlogic,g12b";
+	model = "Dreambox One";
+};
+
+&sd_emmc_a {
+	sd-uhs-sdr12;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
new file mode 100644
index 000000000000..df0d71983c3d
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-dreambox.dtsi"
+
+/ {
+	compatible = "dream,dreambox-two", "amlogic,s922x", "amlogic,g12b";
+	model = "Dreambox Two";
+};
+
+&sd_emmc_a {
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
new file mode 100644
index 000000000000..a302b127f32a
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2021 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+#include "meson-g12b-w400.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	cvbs-connector {
+		status = "disabled";
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOA_11 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	spdif_dit: audio-codec-1 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "DREAMBOX";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT",
+				"SPDIFOUT_A IN 0", "FRDDR_A OUT 3",
+				"SPDIFOUT_A IN 1", "FRDDR_B OUT 3",
+				"SPDIFOUT_A IN 2", "FRDDR_C OUT 3";
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
+			sound-dai = <&tdmif_b>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
+			};
+		};
+
+		/* spdif hdmi or toslink interface */
+		dai-link-4 {
+			sound-dai = <&spdifout_a>;
+
+			codec-0 {
+				sound-dai = <&spdif_dit>;
+			};
+
+			codec-1 {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_A>;
+			};
+		};
+
+		/* spdif hdmi interface */
+		dai-link-5 {
+			sound-dai = <&spdifout_b>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_SPDIF_IN_B>;
+			};
+		};
+
+		/* hdmi glue */
+		dai-link-6 {
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
+	assigned-clocks = <&clkc CLKID_MPLL2>,
+			  <&clkc CLKID_MPLL0>,
+			  <&clkc CLKID_MPLL1>;
+	assigned-clock-parents = <0>, <0>, <0>;
+	assigned-clock-rates = <294912000>,
+			       <270950400>,
+			       <393216000>;
+
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
+&ir {
+	linux,rc-map-name = "rc-dreambox";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddao_1v8>;
+};
+
+&spdifout_a {
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spdifout_b {
+	status = "okay";
+};
+
+&tdmif_b {
+	status = "okay";
+};
+
+&tdmout_b {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
