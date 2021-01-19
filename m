Return-Path: <SRS0=ZD2b=GW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4EBC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD7520DD4
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jan 2021 14:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD7520DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfwyDcr717FytGeXOZVqnuLrleIvuTc9vvzVXg7ovhU=; b=B3WikFBzFhrsSYbFN+CWP96xmD
	2dkuD80jf53HoiGLQcZHXwomJQfzVdU1KU3m7AglOyag+4BUCDN+SwMCtplerP2oEB5OI25hCVtTm
	i5uxYTLgqz9goJ14K0eCcj3FR7PX7Wfpp93Dsv9Mor1vFX4W5YEpFSCPBk1GWmxwtMtnKCdX1QVMY
	S0fs80n5iz9vLXfUF7CW63b30ZxS8s09nefiX9dzDetYWsHKZYOzn7TnrzFjX9mRSaCn4928WlWM5
	8V0XlS8YhJB8xMHErSdvaneqOjETDWa8zCIdp2YiCBQ/Swk6xuk7GBY0H8G1M1En6nKg45lgFvq76
	mnqV6XtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1sSB-0007MW-0J; Tue, 19 Jan 2021 14:57:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1sS0-0007IZ-H5; Tue, 19 Jan 2021 14:57:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v184so34131wma.1;
 Tue, 19 Jan 2021 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gvg6EKXcV+ZlSGn2h1lTgKayE+k74jIv1PZxsFjQ3l0=;
 b=AitiDzLbEtdu6gr3W9KisuygAfgqX1HpLdIK8cXlQ4ucnOZsFug1FnIYd/PTvD+cxO
 g4yg6UjEGR1eeoo38Eh6aIZ7atjf465w4hLS3GGFK53OgY7GbBIxX6rQuXHS4UYfpWgX
 51bfbuq1HwQXWFmfPtlXR2nOV+WqEMvvD91HvVh+q6GXr5ptXghK8W58b0bjj4MP01Ge
 lRQ6UE/4ATMZu1mt3N8tHVqTrLZgTN4ee57/i2hlL7LvGLGtR42RupZJfaoKP1yM59Fn
 SQlFfRYu4at5C257zD/R7Q27iyIjDuhy34vBd5c6pcEq6jGjqaFGGM/IjbrvSPOrWrnX
 2WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gvg6EKXcV+ZlSGn2h1lTgKayE+k74jIv1PZxsFjQ3l0=;
 b=goA9nz/QCPC6h+I3iZSJsv4z61X+S5pRKsdD1Di6QIx4/xWNo9vh7RkvOYISBt3vvZ
 p1MwrT+PFkjT3AxjVnzZWqUrazt0fUVx72CBKP9wCSCob779hHtFpaGNgSdGFuxvPFet
 duyDAdPOHcMD9wgJiD7ht1fwGYwmEr6wSM7wdSn5oGemTT54vM0TVNUphQPnKOJ+nmLu
 sOSFwsfqIqeYl27dFDbq+4n6fLfRxhu2yIqR9mN6cexW4uKOsmNKG+/TXaDFFyjJGweN
 nqJWYtrGhkTAG1i91/egNSORaVXjrEWV3WcdoHm5+0m+Sd4SJvN2uHLJBX9jDt5PHwzH
 goiw==
X-Gm-Message-State: AOAM533spbG38vGhE22FhO1HixwnzyrTueZ6UslTyzPSrAZ6QZ4QnnBn
 1wjSnXjbYn9yz8aAJsc2U8E=
X-Google-Smtp-Source: ABdhPJyuXhJoZcY0Sle5Q4xr5UPf9w6X82S1erR93cLl3TJ4Jj3FNWQ7RML2DGJo2T7A+WDhiQKupw==
X-Received: by 2002:a05:600c:268b:: with SMTP id
 11mr35008wmt.132.1611068262984; 
 Tue, 19 Jan 2021 06:57:42 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id s1sm36786893wrv.97.2021.01.19.06.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:57:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: meson: add initial Beelink GS-King-X
 device-tree
Date: Tue, 19 Jan 2021 14:57:34 +0000
Message-Id: <20210119145734.12675-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119145734.12675-1-christianshewitt@gmail.com>
References: <20210119145734.12675-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_095744_602949_6858F17F 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GS-King-X is based on the Amlogic W400 reference
board with an S922X-H chip.

- 4GB LPDDR4 RAM
- 64GB eMMC storage
- 10/100/1000 Base-T Ethernet
- AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
- HDMI 2.1 video
- S/PDIF optical output
- 2x ESS9018 audio DACs
- 4x Ricor RT6862 audio amps
- Analogue headphone output
- 1x USB 2.0 OTG port
- 3x USB 3.0 ports
- IR receiver
- 1x micro SD card slot (internal)
- USB SATA controller with 2x 3.5" drive bays
- 1x Power on/off button

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
---
Single change since v2 to shorten the audio card name to align with the
audio card name changes submitted in [0] (no dependency on the patch).

[0] https://patchwork.kernel.org/project/linux-amlogic/patch/20210101063737.26635-1-christianshewitt@gmail.com/

 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-gsking-x.dts  | 133 ++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index ced03946314f..dce41cd3f347 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gsking-x.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
new file mode 100644
index 000000000000..211191f66344
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "meson-g12b-w400.dtsi"
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "azw,gsking-x", "amlogic,g12b";
+	model = "Beelink GS-King X";
+
+	aliases {
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
+	};
+
+	gpio-keys-polled {
+		compatible = "gpio-keys-polled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		poll-interval = <100>;
+
+		power-button {
+			label = "power";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "GSKING-X";
+		audio-aux-devs = <&tdmout_a>;
+		audio-routing = "TDMOUT_A IN 0", "FRDDR_A OUT 1",
+				"TDMOUT_A IN 1", "FRDDR_B OUT 1",
+				"TDMOUT_A IN 2", "FRDDR_C OUT 1",
+				"TDM_A Playback", "TDMOUT_A OUT";
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
+			sound-dai = <&tdmif_a>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-0 = <1 1>;
+			dai-tdm-slot-tx-mask-1 = <1 1>;
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-tx-mask-3 = <1 1>;
+			mclk-fs = <256>;
+
+			codec {
+				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
+			};
+		};
+
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
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
+&tdmif_a {
+	status = "okay";
+};
+
+&tdmout_a {
+	status = "okay";
+};
+
+&tohdmitx {
+	status = "okay";
+};
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
