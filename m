Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C8CC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 02:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTVTakAeOS13nDCv1wODCLuOcaIoGltAVmxVaRStNRs=; b=HyXnm7QTLKvYdX
	RlA7exAzdDPoYnHPqPIwdKqOEHXupFPkhn0BscRKThu5WTUfCdyD+SQDcE21GaPt/Nw1MNcYD5cd1
	oryEgBwCYgoL8fUra6sEIpYi8tDFMskpYfZWRvYS6NsgMcDcna9IqhkCagsoOspQ3z4/UjkLSniCI
	8EVFv/0+4rF0tiyizXaDXYDKGUNqUb3nDNHYM3unE9UwVla21ht+v1yeIIZif1aywvmgQVcoRix+R
	HPtk3D9wfNbsw/Ikh1g9AUPdHB7RO4wiHNQIR2GXgFB8v2SOxOlmRLaNSzDv7rp4F3EKj9uXWD6Sd
	w1EFxb4u67yxALwXGzCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7TRB-000tMa-Ue; Wed, 12 Jan 2022 02:32:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7TMS-000qbL-P9; Wed, 12 Jan 2022 02:27:42 +0000
Received: by mail-ed1-x535.google.com with SMTP id q25so4014857edb.2;
 Tue, 11 Jan 2022 18:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SNa+j7/TwcP4VUtNhzibteAqwPTDSMTlSS3cYR6qMFQ=;
 b=U0+h1wXbzY5FpnpNy7X5kjXNkag3rzvNeqi27aGagm0B7YLvSqSZNd0tpK9CxamQWd
 i4iYlOAjfU2cpbWY+qOBJXGqlxvmeENKbgYmKSupkhR86KZ7ejQg2eAR8JtahUXNE/W7
 Dbt01NtduyTMUfvhrzZ2Ph1IZy7SFMhJaPUwmeXQYjoeOn6qPIFoD3XQLsGjD1XXp9o5
 OskSgk4xWEFlK6RdQ1m3qlKbwT9eMhW3cyeoxRGYwkCgebYbr667ZgJb3psNHam5zYmb
 V2J6kAfn4zGUbfSYV/wfAagtfM02h4IpFzd+5AdVCxUc2Mgd3I7mkXNgCu/vBauXGwLY
 Lcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SNa+j7/TwcP4VUtNhzibteAqwPTDSMTlSS3cYR6qMFQ=;
 b=Phbe683xiMHYme4krmT0Pf/GDMafwuAgMWIS916fdzi59gSj9XB4ppdEUnMV+IdagP
 +h2anLWD+8zIJc4cfoo++kX80tu3fwValwV8u2NRXwq/B+cssbxcjnBl5xT1AJDVM6Rj
 5mkDE7FjCwSRrxnyIPi6oiBN7MTRPmqTOomA5nHC+TqRYYEFc+4sXFK/Qd1Oq5sgprcl
 4Qs0kEiw6Tm5CN3FPR77poiOCBOT+6RMrZpayWfrIoOud3k84DhUmjcgFD8wu0RnxWpV
 MJm/NqnpSTyaOSjz+ap/c65FYjLGLG+adK5k6XWnPQae10ua3khGmpGVUqq68cofUIwK
 SxNQ==
X-Gm-Message-State: AOAM532JGRaKcft79O6niwu3TGpwMaYJpkBpmK6RdkjcWc0dOzeAMJDO
 V9IH6vlJ7BKHQkDhjQXVwcc=
X-Google-Smtp-Source: ABdhPJzvFGiWoX4W2o2s4uHZQPISZivJLar95CkhPK9B7hN6BJAR4kdmwZ2mLiLbfoHCBxuPKYFokg==
X-Received: by 2002:a05:6402:51cc:: with SMTP id
 r12mr6874849edd.92.1641954458939; 
 Tue, 11 Jan 2022 18:27:38 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id ky10sm4041772ejc.151.2022.01.11.18.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 18:27:38 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [PATCH v3 9/9] arm64: dts: meson: add initial device-tree for H96-Max
Date: Wed, 12 Jan 2022 02:27:13 +0000
Message-Id: <20220112022713.25962-10-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112022713.25962-1-christianshewitt@gmail.com>
References: <20220112022713.25962-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_182740_900106_5E1159DB 
X-CRM114-Status: GOOD (  15.97  )
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

The Haochuangyi H96-Max is based on the Amlogic S905X3 reference
design with the following specs:

- 4GB DDR4 RAM
- 32/64/128GB eMMC
- HDMI 2.1 video
- S/PDIF optical output
- AV output
- 10/100/1000 Base-T Ethernet
- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
- 1x USB 2.0 OTG port
- 1x USB 3.0 port
- IR receiver
- 1x micro SD card slot (internal)
- 1x Reset/Update button (in AV jack)
- 7-segment VFD

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Benoit Masson <yahoo@perenite.com>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-h96-max.dts    | 145 ++++++++++++++++++
 2 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index e87adc6593df..868d74044072 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m5.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-h96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
new file mode 100644
index 000000000000..0f6660e68e72
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre SAS. All rights reserved.
+ * Copyright (c) 2020 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-sm1-ac2xx.dtsi"
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "haochuangyi,h96-max", "amlogic,sm1";
+	model = "Shenzhen Haochuangyi Technology Co., Ltd H96 Max";
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "H96-MAX";
+		audio-aux-devs = <&tdmout_b>;
+		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
+				"TDM_B Playback", "TDMOUT_B OUT";
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
+		/* hdmi glue */
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
+&ethmac {
+	status = "okay";
+
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-txid";
+	phy-handle = <&external_phy>;
+
+	rx-internal-delay-ps = <800>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211F (0x001cc916) */
+		reg = <0>;
+		max-speed = <1000>;
+
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+	};
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
+
+&uart_A {
+	status = "okay";
+
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
