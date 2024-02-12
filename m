Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B607C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N3o/JlJfu0S/S2B2uf3GCPiKPAguQRB2FVtyZbHtlYo=; b=FlGOyyIhERPctT
	KwODSSlGH5HWk6W+3eeCcHrIxZZgKgrYBTwdxQY/5p2HIwkgZouc+orMF1o27P6Lr5+AKJ8seEW9f
	7r3hvPBLCitOR4rmbq8J8J78hmCrt94mTowEBRJYVJ617STtExiuFVvYs+dQjFnR0pmo4cBV+8XXH
	JGlKA6NUNrazuVkJxsJOwITrj5037TKnmWrQWHIfCx7AbSdDJdRYm8wRD+BMOtWMtrQKlVrR7w35y
	Gbz4gi97eU0Q6NRSsVT0br0B8YD2poUWh2wmEpAaguJ74Oi+Y2D0eUyA19iRAWlriUqPhACCTlEZh
	yxGZnee0uwPqxsHXbWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWM-00000006XTF-21X3;
	Mon, 12 Feb 2024 17:55:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWH-00000006XQo-3gox
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:55:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-33b0ecb1965so1899573f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707760504; x=1708365304; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2zOp39JdTBdqMs5UBO9EPz5yFfp8eAgceufC0MfE6Y=;
        b=SuSUeQhk0i9BUtv2mxzcaRkRvHdik7Y9o6DngBE7maIapbGT1Q8iZsoWLrVAC2Z3eW
         Ukphl3pGcG7cwSncc5lCgqszyg4+zOEHeNuBjbwVlDDK8srhkz36uwK4rMOgn0HcMwdM
         IayMDrODxNnLh9if3ZfCrg/EMeD4m+PLxBaUfD0wfMPofM1Pvzz5FK+AJTmyLR1nSMON
         nrhpQoTCkTwzdhfEeTwapa70IfcmxHZUjLblG8ueAJo8inLQ6mEr8U+/cGvG0VJrFRBa
         Aa9JLF1pdVC4pmqgGUahsgFNEDWoc/Nm1jOX/G0dXa+vz0JIxzZkR++M345YOw11Bwhf
         7Zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707760504; x=1708365304;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2zOp39JdTBdqMs5UBO9EPz5yFfp8eAgceufC0MfE6Y=;
        b=SBKk6sHZOfNIR2Eh/FIFnfGFLQuUp89lwRtt8oBbumiL1Ug8t0F0SLKNhNX0Kc9qpR
         kj6cGYXYmKfy2mmiPfuzZF9FELui0JVuwnsoNdbvg0WgG1UrSs2NWmAcbDccLUDkGy7S
         jyENuhLLhloour25b15lOxBvk4Z0mrO5T47Fyi4by/a1kQv96X8lVGBLsEn7XpZQulYt
         a0atUvLTbWDxAtMJ/pxE3SvPLARaX2X4bfWlfHRfMflt2msIqQdtalGAjZBOWRvXKi8M
         h/M5KphDVukf1Dl+0RQ/7Yw0EJiZoBlfWsET3ZRDzlRfgYtJ8zwnWuRAsF23FoYYbX5L
         6miw==
X-Gm-Message-State: AOJu0YwWVEAYBWlL/iIp6MBTIuaqkUqYlXNJ0fICMj6N86am/BHurILS
	eeemRalU7TSf9fNX33VXMCjLZH7AY1MsydH0Wimlhn07Di/wR/zeocT0exZHiHV0nZiISZ711aN
	Sn54=
X-Google-Smtp-Source: AGHT+IFcQHkhbij6vz+6yEgCBbgPycZJ0MGVMp8xLQK1W01QI+pymKu0X1w9vlj4UDsihgAwWC0R8g==
X-Received: by 2002:a5d:634e:0:b0:33b:3a90:13ea with SMTP id b14-20020a5d634e000000b0033b3a9013eamr5719024wrw.4.1707760504579;
        Mon, 12 Feb 2024 09:55:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMgnBwLznNVA7Ie3YoygxcsRbmBBl7Yy6HETG0NMCMylb0cp2POpo75roLyUF8lpkMU+wRgVeQoZGg5O3Ifr1m3BY1vUgeMAUTH3oENwOcN1Zw74rynReZf2FkC6tU8AHNyxrMsLyJbXKG0VRLAjxAZDuH6UQ6em/Qn1NtFb3tjKsmFyiil3+iwxTvPIG1R4Aiy95eY+AelDfoYuNyCTn4iJA8je3p8fv+UBsRhzDaVxDw1/nBVwqEYxTSeUKr5+1MA7WV7+oG/b+SY40rNO3GqApGjE2prOn0vdXHO2HId8MWKmvjtw97zV9uWkf/SeuWOrqnTVXn7r37RRyxSmKplaCVutfc9yE9pBCXHDxNSJ8=
Received: from ?IPV6:2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9? ([2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9])
        by smtp.gmail.com with ESMTPSA id z7-20020adfe547000000b0033b55186901sm7380912wrm.94.2024.02.12.09.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:55:04 -0800 (PST)
Message-ID: <5ac4741d-766d-4b6d-95ac-669474d05e6a@freebox.fr>
Date: Mon, 12 Feb 2024 18:53:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
In-Reply-To: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_095505_958977_E47438D2 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add support for two variants of the fbx8am board.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
  arch/arm64/boot/dts/amlogic/Makefile                       |  7 +++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
  3 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index e9baa2cf02273..2fd7c7a18126f 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -81,3 +81,10 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
+
+# Overlays
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtbo
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtbo
+
+# Enable support for DT overlays
+DTC_FLAGS_meson-g12a-fbx8am += -@
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
new file mode 100644
index 0000000000000..ed79809b15859
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+
+/ {
+	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
+};
+
+&uart_A {
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+		vbat-supply = <&vddao_3v3>;
+		vddio-supply = <&vddio_ao1v8>;
+	};
+};
+
+&sd_emmc_a {
+	/* Per mmc-controller.yaml */
+	#address-cells = <1>;
+	#size-cells = <0>;
+	/* NB: may be either AP6398S or AP6398SR3 wifi module */
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
new file mode 100644
index 0000000000000..5da88fb94fb98
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+
+/ {
+	compatible = "freebox,fbx8am-realtek", "freebox,fbx8am", "amlogic,g12a";
+};
+
+&uart_A {
+	bluetooth {
+		compatible = "realtek,rtl8822cs-bt";
+		enable-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		host-wake-gpios = <&gpio GPIOX_19 GPIO_ACTIVE_HIGH>;
+		device-wake-gpios = <&gpio GPIOX_18 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&sd_emmc_a {
+	/* No explicit compatible for rtl8822cs sdio */
+};
-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
