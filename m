Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32040EC01B1
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 09:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rITmpzWUKXGZC7VbtB6CRx62qJ+BPYtpKHkNSD9Dat4=; b=2Pc/b7Jd+vhdjb
	uKjLGlwwvY5oq9C0GXVAI24nWl99oo9a0aiOX4NAVmnUqmEarHdGFXKALz/RB6OCd+MCC3CXcWyUY
	m2VdRV4W7w5C54k/1RiWTrlCXXZPGEj4fjHbcFRt63z8YQ2Z8+nqKe/qjeW04eYoKc+xW3DqXS/Dj
	WLd1VGoaviynQBX+sbtkqQhS95lpTK3NUkiT4XQ5mvm5/O8jiwxNgvKkKpaIgTFtTf/et1tBySzij
	renm0GNQ/F25ohRphWsozSkKeKZufnMmHGDPzfFHqPtBO9UmfO5zafFRLy7YLSOJRiFRm3KSTZNJT
	4KNU1vEsXjvksveKMagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3q-0000000GR4x-0r9E;
	Mon, 23 Mar 2026 09:59:02 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4c3K-0000000GQYC-1g2p;
	Mon, 23 Mar 2026 09:58:32 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774259902;
	bh=ZPh1Ffg46SESKBriWMqpzSn5XjrMVWuNy3WH4xfUZ5A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TS+jRnKNGHtdaqZg1ZVubazE5moSsgdnsCc54AXeGGRXBRCm+cdTUnqk5WCrJ5ust
	 IsHHMcd6UE/eFn5TxSPIAqHpwAXv0qKbVLieNIwWEuxgdRxB5NULA3bBXVIUEqUbLP
	 BasDTRf68fBtjgpmz2JDrWAmgCdT6IQ2z1qoVa+w=
Date: Mon, 23 Mar 2026 10:55:31 +0100
Subject: [PATCH v3 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
MIME-Version: 1.0
Message-Id: <20260323-add-emmc-t7-vim4-v3-6-5159d90a984c@aliel.fr>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774259895; l=3369;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=ZPh1Ffg46SESKBriWMqpzSn5XjrMVWuNy3WH4xfUZ5A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEk7jRQ5NqIXVtgE0yrDaWudAWWqnyzdVDSDtVR07dfpvFdfMdfIYkLbvXvFvHDpDzRHxmw+dm4
 q9sElrp4CdAc=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025830_636851_571A2BD1 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

Add voltage regulator nodes describing the VIM4 power tree,
required by peripheral nodes such as the SD card controller.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index fffdab96b12eb..2450084d37642 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include "amlogic-t7.dtsi"
+#include <dt-bindings/gpio/amlogic,t7-periphs-pinctrl.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Khadas vim4";
@@ -45,6 +47,94 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	dc_in: regulator-dc-in {
+		compatible = "regulator-fixed";
+		regulator-name = "DC_IN";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sdcard-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		gpio = <&gpio GPIOD_11 GPIO_ACTIVE_LOW>;
+		regulator-boot-on;
+		enable-active-low;
+		regulator-always-on;
+	};
+
+	vcc5v: regulator-vcc-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&dc_in>;
+
+		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vcc5v0_usb: regulator-vcc-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_USB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v>;
+
+		gpio = <&gpio GPIOY_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vddao_1v8: regulator-vddao-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&dc_in>;
+		regulator-always-on;
+	};
+
+	vddio_1v8: regulator-vddio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddio_3v3>;
+		regulator-always-on;
+	};
+
+	vddio_3v3: regulator-vddio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddio_c: regulator-gpio-c {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_C";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddio_3v3>;
+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
+		states = <1800000 1
+			  3300000 0>;
+	};
 };
 
 &uart_a {

-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
