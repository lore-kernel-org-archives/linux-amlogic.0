Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA429C432BE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DB2360EBA
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 13:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DB2360EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lexina.in
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28Me0irty3XJMrIW21Fwan/wButqZRPRlhkDvgKc0II=; b=0iCK38Qt3ujTdA
	tOL/LuLrilKr57A545MLCn800n06NXZmxFYQ1sk0qWtrnrsYJ2DucuogGEmOHAWp4wP6BG8YxyznZ
	nljIDH0UlkT/yMdybtvQ+JPyt4CT5JUzqO5OTVSlWQ/gRYun7oEFTbC9GaUgbs0/xWrjgW5F9JPOJ
	k8ROfAg2jgaaPSP6vCfmn8umuiSunNpBiC7AMkicjMiNVIyNmZmFtXmvpMkSWAj2fgEFecnNLXgwD
	Y5+iXRwK+LhCdvAXEg9wG8uWtD62fDyFMPySyD3xznt+t6z0C9xA8fAhbe0XBB9IV+dYAnChVjtpw
	avGmUY02CSyTdTTgkuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLmPl-009dtP-GK; Thu, 02 Sep 2021 13:05:57 +0000
Received: from mx.msync.work ([95.217.65.204])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLmPU-009dpy-Kb; Thu, 02 Sep 2021 13:05:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2CC38D3641; Thu,  2 Sep 2021 13:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1630587938; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=AEY2i9Y+bdsAK6qLsSl3XZHAM3qh6sM0ZfPwPPL7bpk=;
 b=B1Vb/uYcOm/lrFB9kBX9eEj1LuNNCIZcStPiYovu3WP1w/OMhsBBKct9Hmw/aAcGaBXnVw
 7ylhmfCgqwQlsNYpE5WjZfV6nkVif3yKsO9ZRLr+muUu4apNNF2d8eMZdlcglKTrTtD2Bw
 YFnOhfOOLVq9PXWI1ixE8eleVoeScjdJKH9hkWdP1p7f4iN0QQgzScE88IEVthfa79ClDS
 6xlNBjyfXvLjHszDOThoY2dKMPx40vE/dfUME8TPL60g5mrdoUS5hQInE/Ctuv0zsAvIKb
 e7UC+wYULelTJ6TCM20mOAL3QNU8VHAfBiqzuT+CGGCOjurQX+cUCZ0GSiQMzw==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: meson-gxl: add support for JetHub H1
Date: Thu,  2 Sep 2021 16:05:14 +0300
Message-Id: <20210902130516.3892452-2-adeep@lexina.in>
In-Reply-To: <20210902130516.3892452-1-adeep@lexina.in>
References: <20210902130516.3892452-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_060541_045030_A18C705A 
X-CRM114-Status: GOOD (  14.15  )
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

JetHome Jethub H1 (http://jethome.ru/jethub-h1) is a home automation controller with the following features:

- square plastic case
- Amlogic S905W (ARM Cortex-A53) quad-core up to 1.5GHz
- no video out
- 1GB LPDDR4
- 8/16GB eMMC flash
- 2 x USB 2.0
- 1 x 10/100Mbps ethernet
- WiFi / Bluetooth RTL8822CS IEEE 802.11a/b/g/n/ac, Bluetooth 5.0.
- TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
- MicroSD 2.x/3.x/4.x DS/HS cards.
- 1 x gpio LED
- ADC user Button
- DC source 5V microUSB

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s905w-jethome-jethub-j80.dts    | 325 ++++++++++++++++++
 2 files changed, 326 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index faa0a79a34f5..2c3ce7c401a5 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -38,6 +38,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s805x-p241.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-p281.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-tx3-mini.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905d-libretech-pc.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-gxl-s905w-jethome-jethub-j80.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-khadas-vim2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-mecool-kiii-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-minix-neo-u9h.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
new file mode 100644
index 000000000000..7b14c7c4eed5
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
@@ -0,0 +1,325 @@
+
+/dts-v1/;
+
+#include "meson-gxl.dtsi"
+
+/ {
+	compatible = "jethome,j80", "amlogic,s905w", "amlogic,meson-gxl";
+	model = "JetHome JetHub J80";
+	amlogic-dt-id = "gxl_jethubj80_v1";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable; size = <0x0 0x400000>;
+			alignment = <0x0 0x400000>;
+			linux,cma-default;
+		};
+	};
+
+	aliases {
+		serial0 = &uart_AO;   /* Console */
+		serial1 = &uart_A;    /* Bluetooth */
+		serial2 = &uart_AO_B; /* Wireless module 1 */
+		serial3 = &uart_C;    /* Wireless module 2 */
+		ethernet0 = &ethmac;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	partitions: partitions {
+		parts = <1>;
+		part-0 = <&rootfs>;
+		rootfs: rootfs {
+			pname = "rootfs";
+			size = <0xffffffff 0xffffffff>;
+			mask = <4>;
+		};
+	};
+
+	efusekey: efusekey {
+		keynum = <5>;
+		key0 = <&key_0>;
+		key1 = <&key_1>;
+		key2 = <&key_2>;
+		key3 = <&key_3>;
+		key4 = <&key_4>;
+
+		key_0: key_0 {
+			keyname = "mac";
+			offset = <0>;
+			size = <6>;
+		};
+		key_1: key_1 {
+			keyname = "mac_bt";
+			offset = <6>;
+			size = <6>;
+		};
+		key_2: key_2 {
+			keyname = "mac_wifi";
+			offset = <12>;
+			size = <6>;
+		};
+		key_3: key_3 {
+			keyname = "usid";
+			offset = <18>;
+			size = <32>;
+		};
+		key_4: key_4 {
+			keyname = "serial";
+			offset = <50>;
+			size = <32>;
+		};
+	}; //End efusekey
+
+	unifykey {
+		compatible = "amlogic, unifykey";
+		status = "ok";
+		unifykey-num = <6>;
+		unifykey-index-0 = <&keysn_0>;
+		unifykey-index-1 = <&keysn_1>;
+		unifykey-index-2 = <&keysn_2>;
+		unifykey-index-3 = <&keysn_3>;
+		unifykey-index-4 = <&keysn_4>;
+		unifykey-index-5 = <&keysn_5>;
+
+		keysn_0: key_0 {
+			key-name = "usid";
+			key-device = "efuse";
+			key-permit = "read","write";
+		};
+		keysn_1: key_1 {
+			key-name = "mac";
+			key-device = "efuse";
+			key-permit = "read","write";
+		};
+		keysn_2: key_2 {
+			key-name = "mac_bt";
+			key-device = "normal";
+			key-permit = "read","write","del";
+			key-type  = "mac";
+		};
+		keysn_3: key_3 {
+			key-name = "mac_wifi";
+			key-device = "normal";
+			key-permit = "read","write","del";
+			key-type = "mac";
+		};
+		keysn_4: key_4 {
+			key-name = "serial";
+			key-device = "efuse";
+			key-permit = "read","write";
+		};
+		keysn_5:key_5 {
+			key-name = "deviceid";
+			key-device = "normal";
+			key-permit = "read","write","del";
+		};
+	}; //End unifykey
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&efuse {
+	status = "okay";
+	compatible = "amlogic,meson-gxbb-efuse", "amlogic, efuse";
+	read_cmd = <0x82000030>;
+	write_cmd = <0x82000031>;
+	get_max_cmd = <0x82000033>;
+	key = <&efusekey>;
+	clock-names = "efuse_clk";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* Wireless SDIO Module */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+
+	non-removable;
+	disable-wp;
+
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* Console UART */
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+/* S905X only has access to its internal PHY */
+&ethmac {
+	reg = <0x0 0xc9410000 0x0 0x10000
+		0x0 0xc8834540 0x0 0x4
+		0x0 0xc8834558 0x0 0xc
+		0x0 0xc1104408 0x0 0x4>;
+	amlogic,eth-leds = <0x91>;
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
+
+&internal_phy {
+	status = "okay";
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_C {
+	status = "okay";
+	pinctrl-0 = <&uart_c_pins>;
+	pinctrl-names = "default";
+};
+
+&uart_AO_B {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_b_pins>, <&uart_ao_b_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-names="default";
+	pinctrl-0=<&i2c_b_pins>;
+
+	pcf8563: pcf8563@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		status = "okay";
+	};
+};
+
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
