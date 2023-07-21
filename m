Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BAEEB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Jul 2023 07:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdKB6E+X1yFBZozgLWssyh1P4n+6e9v2+hixhyIci0w=; b=CZa6fCMN7EmweX
	iq3r1oTRzIjEgxL9VapzjVQAOH6P7ioU/k0V6ZyVH+XhPw00BhhlLZMmuMcO+ZxAkmlnSrzgWOQvF
	jyFZf3x5sxPelBsdQ9fYyVBKHcN4sLskvhFkjRQhtp7ctpNj4RiNQWvyAdDvIvqokeHH+WbauwcLx
	5UW4dp/3qdXpnUx4ntOzKNXBOi1k5EktJZ3oDboWcfLGoxwQZyFVCZC0/nkAGJpmzSQuwYljTGo5M
	paFfyvoHZQLobjsfHOVtfoqL67ko0fH7dPC7Smvy1xBIFrt/n/LT/2lSzlG015WFKlTaQAKsGGfIw
	kPSsLFoZPoPEMR5nXQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfO-00DCIj-1t;
	Fri, 21 Jul 2023 07:35:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkfH-00DCC0-31;
	Fri, 21 Jul 2023 07:35:05 +0000
Received: from rd02-sz.amlogic.software (10.28.11.83) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 21 Jul 2023
 15:34:33 +0800
From: Huqiang Qin <huqiang.qin@amlogic.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Huqiang Qin <huqiang.qin@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: Replace the IRQ number with the IRQID macro definition
Date: Fri, 21 Jul 2023 15:32:14 +0800
Message-ID: <20230721073214.1876417-4-huqiang.qin@amlogic.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.83]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_003503_974242_D6326D2F 
X-CRM114-Status: GOOD (  10.77  )
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

Replacing IRQ numbers with IRQID macro definitions makes node properties
easier to understand and also makes GPIO interrupts easier to use.

Associated platforms:
- Amlogic Meson-G12A
- Amlogic Meson-G12B
- Amlogic Meson-SM1

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi |  2 +-
 .../boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts  |  4 ++--
 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi |  2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi     |  2 +-
 .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts   |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts     | 12 ++++++------
 .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts      |  2 +-
 13 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0c49655cc90c..0142abfc930c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq-meson-g12a-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b2bb94981838..c79f3e8d26b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -344,7 +344,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 97e522921b06..428b35e1d79c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -201,7 +201,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
index 83709787eb91..c69b0f803916 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
@@ -327,7 +327,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index 276e95b34022..eed2a23047ca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -380,7 +380,7 @@ rk818: pmic@1c {
 		compatible = "rockchip,rk818";
 		reg = <0x1c>;
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
+		interrupts = <IRQID_GPIOAO_7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
 		#clock-cells = <1>;
 
 		vcc1-supply = <&vdd_sys>;
@@ -519,7 +519,7 @@ rk817: pmic@20 {
 		reg = <0x20>;
 		interrupt-parent = <&gpio_intc>;
 
-		interrupts = <5 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_5 */
+		interrupts = <IRQID_GPIOAO_5 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_5 */
 
 		vcc1-supply = <&vdd_sys>;
 		vcc2-supply = <&vdd_sys>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 24d0442dffb2..01aa970b2f8c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -185,7 +185,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
index b40d2c1002c9..ac8b7178257e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
@@ -269,7 +269,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
index d1debccdc1c2..95e03bb02af2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
@@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index 17045ff81c69..62404743e62d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -45,7 +45,7 @@ key {
 			linux,code = <BTN_1>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOAO_3 IRQ_TYPE_EDGE_BOTH>;
 		};
 	};
 
@@ -217,7 +217,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
index 0f6660e68e72..ebda1dd30fa6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
@@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index 2fce44939f45..86b90f44a4b3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -283,7 +283,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 9068a334ea57..4f07d6387bb1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -53,7 +53,7 @@ key-1 {
 			linux,code = <BTN_0>;
 			gpios = <&gpio GPIOH_6 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <34 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOH_6 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key-2 {
@@ -61,7 +61,7 @@ key-2 {
 			linux,code = <BTN_1>;
 			gpios = <&gpio GPIOH_7 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <35 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOH_7 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key-3 {
@@ -69,7 +69,7 @@ key-3 {
 			linux,code = <BTN_2>;
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOAO_2 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key-mic-mute {
@@ -78,7 +78,7 @@ key-mic-mute {
 			linux,input-type = <EV_SW>;
 			gpios = <&gpio_ao GPIOE_2 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <99 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOE_2 IRQ_TYPE_EDGE_BOTH>;
 		};
 
 		key-power {
@@ -86,7 +86,7 @@ key-power {
 			linux,code = <KEY_POWER>;
 			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
 			interrupt-parent = <&gpio_intc>;
-			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
+			interrupts = <IRQID_GPIOAO_3 IRQ_TYPE_EDGE_BOTH>;
 		};
 	};
 
@@ -583,7 +583,7 @@ &uart_A {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		interrupt-parent = <&gpio_intc>;
-		interrupts = <95 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <IRQID_GPIOX_18 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "host-wakeup";
 		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
 		max-speed = <2000000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
index 7e1a74046ba5..6ee406066ee0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
@@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
 
 		interrupt-parent = <&gpio_intc>;
 		/* MAC_INTR on GPIOZ_14 */
-		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
