Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D71CA0EE1
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJLj+w4XXtLHliiiBsMAh0sOMrN3NARRRQr96DUNj14=; b=Quok0z4AhQ3VBi
	UgZ/kwQGcYgBs5zxt60fvIdQb8FBo9O+/gTEiG4fhkzWDlKo1lPXHqk+9TnxAWfLngcK+o3xXJhoL
	PTvw2YpIJacdLqO4WT6vYa2104SxHL2/AXOnQjBBvoFfGrQufEA3UARh9g8duWe7k2FOSDafv3Iue
	yKsYD4wf5P3YpQHJb637zab6J+4HmRjROWI6I87/tz4BUI+LZQfQlbLMgSgTnNXE7OPbhxWrzoPdG
	10OQZZraeyKRWjL+wU5qc+i5pqYs1RIrQgno8mn8icTV1ZSqUIEX6JpQhqltYoJZ9n4BfmKD84/5p
	Cc0E33PCzpsJ3pzZfjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjuA7-00000004n3U-2rvT;
	Fri, 30 Aug 2024 05:27:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sju9G-00000004mpa-1Q6O;
	Fri, 30 Aug 2024 05:26:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6E892A43E69;
	Fri, 30 Aug 2024 05:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF66FC4CECB;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724995571;
	bh=QYKy3ItvpOU+P8gyuVySP8Mf4hzZhG36E4zOb4MYPcE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BGkk74lB4kzXcZ0o/Ir7KkY7I94FTY8xD03bHcpEsEY5o6OSmaYyPOCoNdNOp5GH2
	 5cyNmIRTg0RwBku4FFOUgbRMgTPcI7FUFf7PyHmzgEVWvz9zA7ExGJU9jWTJjsRVls
	 kkDYtFO+RSsIYHfCEQ7ZgdLX5baiQ7eUv79BL2e/KPqtjw4q49dUSzmV+Jp07CnP5l
	 eBbHnPenq1tDfjz7nZ498p0nr/kvYIRF2k7dr80MZks70Pnm5v4cslpYEU6q9ZhR/x
	 ez7zCgH66HqifmTCJGo0JpmLSw9qD53hadSeUFtqmDlXyi9JcHH29B94TGg0wQYcXO
	 m1QwaNJ+xQIiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC6CCA0EE5;
	Fri, 30 Aug 2024 05:26:10 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 30 Aug 2024 13:26:10 +0800
Subject: [PATCH v4 3/3] arm64: dts: amlogic: add C3 AW419 board
MIME-Version: 1.0
Message-Id: <20240830-c3_add_node-v4-3-b56c0511e9dc@amlogic.com>
References: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
In-Reply-To: <20240830-c3_add_node-v4-0-b56c0511e9dc@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724995568; l=7260;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1+fROI9qhU3i8mzqXqlDx8fCppD9gx8vfbGG6R9DkD0=;
 b=32BJhq7XYF0uz7YddyDWXEkepfaRAuEYvEWC7bnrfeJ+mcWTd9i8TKomAxuevgKI3ssz5p9S9
 ai+QkzKLwk2A5zpc7lWCaBqEIANT6lvAJdd13TzPCkdW8aDS+1hyf/G
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_222614_558509_0C56FD03 
X-CRM114-Status: GOOD (  13.21  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic C3 C308L AW419 board. The corresponding binding
has been applied, therefore, this series does not need to
add a binding corresponding to the AW419 board.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-c3-c308l-aw419.dts    | 262 +++++++++++++++++++++
 2 files changed, 263 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 9708abdadd7c..8db42f26c1e6 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a4-a113l2-ba400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-a5-a113x2-av400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c302x-aw409.dtb
+dtb-$(CONFIG_ARCH_MESON) += amlogic-c3-c308l-aw419.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-an400.dtb
 dtb-$(CONFIG_ARCH_MESON) += amlogic-t7-a311d2-khadas-vim4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
new file mode 100644
index 000000000000..4477a2659e27
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "amlogic-c3.dtsi"
+
+/ {
+	model = "Amlogic C308l aw419 Development Board";
+	compatible = "amlogic,aw419", "amlogic,c3";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart_b;
+		spi0 = &spifc;
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
+		/* 9 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@7f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x07f00000 0x0 0x900000>;
+			no-map;
+		};
+	};
+
+	main_12v: regulator-main-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&main_12v>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddq: regulator-vddq {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDQ";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&main_12v>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_12v>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddao_1v8: regulator-vddao-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	ddr4_2v5: regulator-ddr4-2v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "DDR4_2V5";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vdd_1v8: regulator-vdd-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD1V8_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddio_b: regulator-vddio-3v3-b {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_B";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	sdcard: regulator-sdcard {
+		compatible = "regulator-fixed";
+		regulator-name = "SDCARD_POWER";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOA_4 GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+};
+
+&uart_b {
+	status = "okay";
+};
+
+&nand {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-0 = <&nand_pins>;
+	pinctrl-names = "default";
+
+	nand@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-on-flash-bbt;
+
+		partition@0 {
+			label = "boot";
+			reg = <0x0 0x00200000>;
+		};
+		partition@200000 {
+			label = "env";
+			reg = <0x00200000 0x00400000>;
+		};
+		partition@600000 {
+			label = "system";
+			reg = <0x00600000 0x00a00000>;
+		};
+		partition@1000000 {
+			label = "rootfs";
+			reg = <0x01000000 0x03000000>;
+		};
+		partition@4000000 {
+			label = "media";
+			reg = <0x04000000 0x8000000>;
+		};
+	};
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&spifc {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-0 = <&spifc_pins>;
+	pinctrl-names = "default";
+
+	nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <83000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		status = "disabled";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "boot";
+				reg = <0 0x200000>;
+			};
+
+			partition@200000 {
+				label = "env";
+				reg = <0x200000 0x400000>;
+			};
+
+			partition@600000 {
+				label = "system";
+				reg = <0x600000 0xa00000>;
+			};
+
+			partition@1000000 {
+				label = "rootfs";
+				reg = <0x1000000 0x3000000>;
+			};
+
+			partition@4000000 {
+				label = "data";
+				reg = <0x4000000 0x8000000>;
+			};
+		};
+	};
+};
+
+&sd {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default","clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&sdcard>;
+	vqmmc-supply = <&sdcard>;
+};

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
