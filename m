From: b.galvani@gmail.com (Beniamino Galvani)
Date: Tue, 16 Aug 2016 11:49:48 +0200
Subject: [PATCH 2/4] arm: dts: update DTS files for meson-gxbb and odroid-c2
In-Reply-To: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
Message-ID: <1471340990-16247-3-git-send-email-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Import DTS files and dt-bindings includes from Linux 4.8-rc1.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/dts/meson-gxbb-odroidc2.dts               |  19 ++
 arch/arm/dts/meson-gxbb.dtsi                       | 170 ++++++++++++++++-
 include/dt-bindings/gpio/meson-gxbb-gpio.h         | 154 +++++++++++++++
 .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 210 +++++++++++++++++++++
 4 files changed, 552 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/gpio/meson-gxbb-gpio.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h

diff --git a/arch/arm/dts/meson-gxbb-odroidc2.dts b/arch/arm/dts/meson-gxbb-odroidc2.dts
index 653c2fa..79bee64 100644
--- a/arch/arm/dts/meson-gxbb-odroidc2.dts
+++ b/arch/arm/dts/meson-gxbb-odroidc2.dts
@@ -45,6 +45,7 @@
 /dts-v1/;
 
 #include "meson-gxbb.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -62,8 +63,26 @@
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		blue {
+			label = "c2:blue:alive";
+			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+	};
 };
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
 };
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
index 832815d..e502c24 100644
--- a/arch/arm/dts/meson-gxbb.dtsi
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -43,6 +43,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/gpio/meson-gxbb-gpio.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 
 / {
 	compatible = "amlogic,meson-gxbb";
@@ -129,13 +131,35 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
 
+			reset: reset-controller at 4404 {
+				compatible = "amlogic,meson-gxbb-reset";
+				reg = <0x0 0x04404 0x0 0x20>;
+				#reset-cells = <1>;
+			};
+
 			uart_A: serial at 84c0 {
 				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x084c0 0x0 0x14>;
+				reg = <0x0 0x84c0 0x0 0x14>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>;
 				status = "disabled";
 			};
+
+			uart_B: serial at 84dc {
+				compatible = "amlogic,meson-uart";
+				reg = <0x0 0x84dc 0x0 0x14>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>;
+				status = "disabled";
+			};
+
+			uart_C: serial at 8700 {
+				compatible = "amlogic,meson-uart";
+				reg = <0x0 0x8700 0x0 0x14>;
+				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller at c4301000 {
@@ -158,6 +182,29 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
 
+			pinctrl_aobus: pinctrl at 14 {
+				compatible = "amlogic,meson-gxbb-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank at 14 {
+					reg = <0x0 0x00014 0x0 0x8>,
+					      <0x0 0x0002c 0x0 0x4>,
+					      <0x0 0x00024 0x0 0x8>;
+					reg-names = "mux", "pull", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				uart_ao_a_pins: uart_ao_a {
+					mux {
+						groups = "uart_tx_ao_a", "uart_rx_ao_a";
+						function = "uart_ao";
+					};
+				};
+			};
+
 			uart_AO: serial at 4c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x0 0x004c0 0x0 0x14>;
@@ -167,6 +214,115 @@
 			};
 		};
 
+		periphs: periphs at c8834000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc8834000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
+
+			rng {
+				compatible = "amlogic,meson-rng";
+				reg = <0x0 0x0 0x0 0x4>;
+			};
+
+			pinctrl_periphs: pinctrl at 4b0 {
+				compatible = "amlogic,meson-gxbb-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank at 4b0 {
+					reg = <0x0 0x004b0 0x0 0x28>,
+					      <0x0 0x004e8 0x0 0x14>,
+					      <0x0 0x00120 0x0 0x14>,
+					      <0x0 0x00430 0x0 0x40>;
+					reg-names = "mux", "pull", "pull-enable", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+				emmc_pins: emmc {
+					mux {
+						groups = "emmc_nand_d07",
+						       "emmc_cmd",
+						       "emmc_clk";
+						function = "emmc";
+					};
+				};
+
+				sdcard_pins: sdcard {
+					mux {
+						groups = "sdcard_d0",
+						       "sdcard_d1",
+						       "sdcard_d2",
+						       "sdcard_d3",
+						       "sdcard_cmd",
+						       "sdcard_clk";
+						function = "sdcard";
+					};
+				};
+
+				uart_a_pins: uart_a {
+					mux {
+						groups = "uart_tx_a",
+						       "uart_rx_a";
+						function = "uart_a";
+					};
+				};
+
+				uart_b_pins: uart_b {
+					mux {
+						groups = "uart_tx_b",
+						       "uart_rx_b";
+						function = "uart_b";
+					};
+				};
+
+				uart_c_pins: uart_c {
+					mux {
+						groups = "uart_tx_c",
+						       "uart_rx_c";
+						function = "uart_c";
+					};
+				};
+
+				eth_pins: eth_c {
+					mux {
+						groups = "eth_mdio",
+						       "eth_mdc",
+						       "eth_clk_rx_clk",
+						       "eth_rx_dv",
+						       "eth_rxd0",
+						       "eth_rxd1",
+						       "eth_rxd2",
+						       "eth_rxd3",
+						       "eth_rgmii_tx_clk",
+						       "eth_tx_en",
+						       "eth_txd0",
+						       "eth_txd1",
+						       "eth_txd2",
+						       "eth_txd3";
+						function = "eth";
+					};
+				};
+			};
+		};
+
+		hiubus: hiubus at c883c000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc883c000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
+
+			clkc: clock-controller at 0 {
+				compatible = "amlogic,gxbb-clkc";
+				#clock-cells = <1>;
+				reg = <0x0 0x0 0x0 0x3db>;
+			};
+		};
+
 		apb: apb at d0000000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xd0000000 0x0 0x200000>;
@@ -174,5 +330,17 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
 		};
+
+		ethmac: ethernet at c9410000 {
+			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
+			reg = <0x0 0xc9410000 0x0 0x10000
+			       0x0 0xc8834540 0x0 0x4>;
+			interrupts = <0 8 1>;
+			interrupt-names = "macirq";
+			clocks = <&xtal>;
+			clock-names = "stmmaceth";
+			phy-mode = "rgmii";
+			status = "disabled";
+		};
 	};
 };
diff --git a/include/dt-bindings/gpio/meson-gxbb-gpio.h b/include/dt-bindings/gpio/meson-gxbb-gpio.h
new file mode 100644
index 0000000..58654fd
--- /dev/null
+++ b/include/dt-bindings/gpio/meson-gxbb-gpio.h
@@ -0,0 +1,154 @@
+/*
+ * GPIO definitions for Amlogic Meson GXBB SoCs
+ *
+ * Copyright (C) 2016 Endless Mobile, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _DT_BINDINGS_MESON_GXBB_GPIO_H
+#define _DT_BINDINGS_MESON_GXBB_GPIO_H
+
+#define	GPIOAO_0	0
+#define	GPIOAO_1	1
+#define	GPIOAO_2	2
+#define	GPIOAO_3	3
+#define	GPIOAO_4	4
+#define	GPIOAO_5	5
+#define	GPIOAO_6	6
+#define	GPIOAO_7	7
+#define	GPIOAO_8	8
+#define	GPIOAO_9	9
+#define	GPIOAO_10	10
+#define	GPIOAO_11	11
+#define	GPIOAO_12	12
+#define	GPIOAO_13	13
+
+#define	GPIOZ_0		0
+#define	GPIOZ_1		1
+#define	GPIOZ_2		2
+#define	GPIOZ_3		3
+#define	GPIOZ_4		4
+#define	GPIOZ_5		5
+#define	GPIOZ_6		6
+#define	GPIOZ_7		7
+#define	GPIOZ_8		8
+#define	GPIOZ_9		9
+#define	GPIOZ_10	10
+#define	GPIOZ_11	11
+#define	GPIOZ_12	12
+#define	GPIOZ_13	13
+#define	GPIOZ_14	14
+#define	GPIOZ_15	15
+#define	GPIOH_0		16
+#define	GPIOH_1		17
+#define	GPIOH_2		18
+#define	GPIOH_3		19
+#define	BOOT_0		20
+#define	BOOT_1		21
+#define	BOOT_2		22
+#define	BOOT_3		23
+#define	BOOT_4		24
+#define	BOOT_5		25
+#define	BOOT_6		26
+#define	BOOT_7		27
+#define	BOOT_8		28
+#define	BOOT_9		29
+#define	BOOT_10		30
+#define	BOOT_11		31
+#define	BOOT_12		32
+#define	BOOT_13		33
+#define	BOOT_14		34
+#define	BOOT_15		35
+#define	BOOT_16		36
+#define	BOOT_17		37
+#define	CARD_0		38
+#define	CARD_1		39
+#define	CARD_2		40
+#define	CARD_3		41
+#define	CARD_4		42
+#define	CARD_5		43
+#define	CARD_6		44
+#define	GPIODV_0	45
+#define	GPIODV_1	46
+#define	GPIODV_2	47
+#define	GPIODV_3	48
+#define	GPIODV_4	49
+#define	GPIODV_5	50
+#define	GPIODV_6	51
+#define	GPIODV_7	52
+#define	GPIODV_8	53
+#define	GPIODV_9	54
+#define	GPIODV_10	55
+#define	GPIODV_11	56
+#define	GPIODV_12	57
+#define	GPIODV_13	58
+#define	GPIODV_14	59
+#define	GPIODV_15	60
+#define	GPIODV_16	61
+#define	GPIODV_17	62
+#define	GPIODV_18	63
+#define	GPIODV_19	64
+#define	GPIODV_20	65
+#define	GPIODV_21	66
+#define	GPIODV_22	67
+#define	GPIODV_23	68
+#define	GPIODV_24	69
+#define	GPIODV_25	70
+#define	GPIODV_26	71
+#define	GPIODV_27	72
+#define	GPIODV_28	73
+#define	GPIODV_29	74
+#define	GPIOY_0		75
+#define	GPIOY_1		76
+#define	GPIOY_2		77
+#define	GPIOY_3		78
+#define	GPIOY_4		79
+#define	GPIOY_5		80
+#define	GPIOY_6		81
+#define	GPIOY_7		82
+#define	GPIOY_8		83
+#define	GPIOY_9		84
+#define	GPIOY_10	85
+#define	GPIOY_11	86
+#define	GPIOY_12	87
+#define	GPIOY_13	88
+#define	GPIOY_14	89
+#define	GPIOY_15	90
+#define	GPIOY_16	91
+#define	GPIOX_0		92
+#define	GPIOX_1		93
+#define	GPIOX_2		94
+#define	GPIOX_3		95
+#define	GPIOX_4		96
+#define	GPIOX_5		97
+#define	GPIOX_6		98
+#define	GPIOX_7		99
+#define	GPIOX_8		100
+#define	GPIOX_9		101
+#define	GPIOX_10	102
+#define	GPIOX_11	103
+#define	GPIOX_12	104
+#define	GPIOX_13	105
+#define	GPIOX_14	106
+#define	GPIOX_15	107
+#define	GPIOX_16	108
+#define	GPIOX_17	109
+#define	GPIOX_18	110
+#define	GPIOX_19	111
+#define	GPIOX_20	112
+#define	GPIOX_21	113
+#define	GPIOX_22	114
+#define	GPIOCLK_0	115
+#define	GPIOCLK_1	116
+#define	GPIOCLK_2	117
+#define	GPIOCLK_3	118
+#define	GPIO_TEST_N	119
+
+#endif
diff --git a/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
new file mode 100644
index 0000000..524d607
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-gxbb-reset.h
@@ -0,0 +1,210 @@
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * GPL LICENSE SUMMARY
+ *
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of version 2 of the GNU General Public License as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ * The full GNU General Public License is included in this distribution
+ * in the file called COPYING.
+ *
+ * BSD LICENSE
+ *
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above copyright
+ *     notice, this list of conditions and the following disclaimer in
+ *     the documentation and/or other materials provided with the
+ *     distribution.
+ *   * Neither the name of Intel Corporation nor the names of its
+ *     contributors may be used to endorse or promote products derived
+ *     from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_GXBB_RESET_H
+
+/*	RESET0					*/
+#define RESET_HIU			0
+/*					1	*/
+#define RESET_DOS_RESET			2
+#define RESET_DDR_TOP			3
+#define RESET_DCU_RESET			4
+#define RESET_VIU			5
+#define RESET_AIU			6
+#define RESET_VID_PLL_DIV		7
+/*					8	*/
+#define RESET_PMUX			9
+#define RESET_VENC			10
+#define RESET_ASSIST			11
+#define RESET_AFIFO2			12
+#define RESET_VCBUS			13
+/*					14	*/
+/*					15	*/
+#define RESET_GIC			16
+#define RESET_CAPB3_DECODE		17
+#define RESET_NAND_CAPB3		18
+#define RESET_HDMITX_CAPB3		19
+#define RESET_MALI_CAPB3		20
+#define RESET_DOS_CAPB3			21
+#define RESET_SYS_CPU_CAPB3		22
+#define RESET_CBUS_CAPB3		23
+#define RESET_AHB_CNTL			24
+#define RESET_AHB_DATA			25
+#define RESET_VCBUS_CLK81		26
+#define RESET_MMC			27
+#define RESET_MIPI_0			28
+#define RESET_MIPI_1			29
+#define RESET_MIPI_2			30
+#define RESET_MIPI_3			31
+/*	RESET1					*/
+#define RESET_CPPM			32
+#define RESET_DEMUX			33
+#define RESET_USB_OTG			34
+#define RESET_DDR			35
+#define RESET_AO_RESET			36
+#define RESET_BT656			37
+#define RESET_AHB_SRAM			38
+/*					39	*/
+#define RESET_PARSER			40
+#define RESET_BLKMV			41
+#define RESET_ISA			42
+#define RESET_ETHERNET			43
+#define RESET_SD_EMMC_A			44
+#define RESET_SD_EMMC_B			45
+#define RESET_SD_EMMC_C			46
+#define RESET_ROM_BOOT			47
+#define RESET_SYS_CPU_0			48
+#define RESET_SYS_CPU_1			49
+#define RESET_SYS_CPU_2			50
+#define RESET_SYS_CPU_3			51
+#define RESET_SYS_CPU_CORE_0		52
+#define RESET_SYS_CPU_CORE_1		53
+#define RESET_SYS_CPU_CORE_2		54
+#define RESET_SYS_CPU_CORE_3		55
+#define RESET_SYS_PLL_DIV		56
+#define RESET_SYS_CPU_AXI		57
+#define RESET_SYS_CPU_L2		58
+#define RESET_SYS_CPU_P			59
+#define RESET_SYS_CPU_MBIST		60
+/*					61	*/
+/*					62	*/
+/*					63	*/
+/*	RESET2					*/
+#define RESET_VD_RMEM			64
+#define RESET_AUDIN			65
+#define RESET_HDMI_TX			66
+/*					67	*/
+/*					68	*/
+/*					69	*/
+#define RESET_GE2D			70
+#define RESET_PARSER_REG		71
+#define RESET_PARSER_FETCH		72
+#define RESET_PARSER_CTL		73
+#define RESET_PARSER_TOP		74
+/*					75	*/
+/*					76	*/
+#define RESET_AO_CPU_RESET		77
+#define RESET_MALI			78
+#define RESET_HDMI_SYSTEM_RESET		79
+/*					80-95	*/
+/*	RESET3					*/
+#define RESET_RING_OSCILLATOR		96
+#define RESET_SYS_CPU			97
+#define RESET_EFUSE			98
+#define RESET_SYS_CPU_BVCI		99
+#define RESET_AIFIFO			100
+#define RESET_TVFE			101
+#define RESET_AHB_BRIDGE_CNTL		102
+/*					103	*/
+#define RESET_AUDIO_DAC			104
+#define RESET_DEMUX_TOP			105
+#define RESET_DEMUX_DES			106
+#define RESET_DEMUX_S2P_0		107
+#define RESET_DEMUX_S2P_1		108
+#define RESET_DEMUX_RESET_0		109
+#define RESET_DEMUX_RESET_1		110
+#define RESET_DEMUX_RESET_2		111
+/*					112-127	*/
+/*	RESET4					*/
+/*					128	*/
+/*					129	*/
+/*					130	*/
+/*					131	*/
+#define RESET_DVIN_RESET		132
+#define RESET_RDMA			133
+#define RESET_VENCI			134
+#define RESET_VENCP			135
+/*					136	*/
+#define RESET_VDAC			137
+#define RESET_RTC			138
+/*					139	*/
+#define RESET_VDI6			140
+#define RESET_VENCL			141
+#define RESET_I2C_MASTER_2		142
+#define RESET_I2C_MASTER_1		143
+/*					144-159	*/
+/*	RESET5					*/
+/*					160-191	*/
+/*	RESET6					*/
+#define RESET_PERIPHS_GENERAL		192
+#define RESET_PERIPHS_SPICC		193
+#define RESET_PERIPHS_SMART_CARD	194
+#define RESET_PERIPHS_SAR_ADC		195
+#define RESET_PERIPHS_I2C_MASTER_0	196
+#define RESET_SANA			197
+/*					198	*/
+#define RESET_PERIPHS_STREAM_INTERFACE	199
+#define RESET_PERIPHS_SDIO		200
+#define RESET_PERIPHS_UART_0		201
+#define RESET_PERIPHS_UART_1_2		202
+#define RESET_PERIPHS_ASYNC_0		203
+#define RESET_PERIPHS_ASYNC_1		204
+#define RESET_PERIPHS_SPI_0		205
+#define RESET_PERIPHS_SDHC		206
+#define RESET_UART_SLIP			207
+/*					208-223	*/
+/*	RESET7					*/
+#define RESET_USB_DDR_0			224
+#define RESET_USB_DDR_1			225
+#define RESET_USB_DDR_2			226
+#define RESET_USB_DDR_3			227
+/*					228	*/
+#define RESET_DEVICE_MMC_ARB		229
+/*					230	*/
+#define RESET_VID_LOCK			231
+#define RESET_A9_DMC_PIPEL		232
+/*					233-255	*/
+
+#endif
-- 
2.7.4
