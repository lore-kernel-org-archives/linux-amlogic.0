Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B4C48BED
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qeETmwavcR98gEjYL64U6utxvwcQbWh1dTSouGZrHw=; b=LAyiCCTBzb1YUm
	/EOqUQHPfP6BOXPV4Ky5qdDfUCXQvrZDkJ60k9HcC8rTWFguP1j9RnVP8bfVhe7/HHgDbA3ksImCx
	RaXvxCwWChtOnDna6H/tnwO23vrJC+OUOEuX6OnKuybTYThLfCBXb1uqs2OgL2+0MQHXhoBxaiNiX
	IUIUbxkmOzAfXLk6C32FEn8KNH9tA24EURfVjc5m9hGUlIhHTX7ihd+9IQBcqkAoXtH9/knIhZdyE
	2cudDR06Tn1kDk9rd7TeGnfpSg323f9lPN25wmHGNODC62eVKuNabn/ZtJqmOaErQawcU/2SiTq55
	CJR2x2lwcdPMZkQZpufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOr-0000000A6ps-34Lo;
	Tue, 13 Feb 2024 17:16:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOp-0000000A6od-1vEm
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 17:16:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-410c1ebf5e4so20988105e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707844609; x=1708449409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6RlH3wZJESaMwkf7v3z2NOiEtaER29lJKbWVlOBM50=;
        b=yXdjNUtZJz8OdNCZdItEM9XplBLpeolx+OAg8khJ7kQoka/3dmeMUuhPJmWACUTEei
         /q8nltfZfh3IJ2Mu29MS0trmz28+wMUrAcbm8pJT9tFEkXeNjdVccFZC6GWjKo0xI/uB
         b0f3yHccx/KERpYr3qhuUT9oYL8SRyw8vDJj6SCmW0AhB5NrlNIJhvtcj/c5LxoE8MDp
         FNXpHxC1ezRWEohEKrrgWKZRVONOcd/lGE/FzQmgl/W4sarm99EkzCKa8n3M8PxtpAuo
         dDX2uwvrqezCXVZHPL9CQktayq/lRgFxot6tqJzy549sm5G5JNIqDI4JCk04kcITeJXa
         aHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844609; x=1708449409;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6RlH3wZJESaMwkf7v3z2NOiEtaER29lJKbWVlOBM50=;
        b=wLSvy7cLy1JV01yQz4KI2ru9lXVqVwZZ1ItVcpAW/cXIuD5E5zBqv4cGxGdSrCpSn8
         89DgO4UVir3V0r66k1eXCtLskwUPQLM1YM5DKaBv7Z3cwXKjgRwiajlJgu4mHvJvVClE
         iAGNa+l43F0HkvEpwalLmriTgS1NBGXNQUDOu4zH9QQZmHf90fYtGuP9nDByAzAzpPge
         e94G919PrD8qrmu0MAXt57IPXwifV/oBHDL+dUhoefyDfb/rDEPLqFUk5YYXpnsUfsoT
         WiKifgGX92SEykQ4wYSFFXl0JvkFlnRtPokfHJGqQxCAg25aT+tmP0X+LXdjUcya20kp
         BKtQ==
X-Gm-Message-State: AOJu0YxPxQKRBgk5KcMr0RBlwLM4IPb9IxC189HrmF5jRJKiozIkCjJ6
	uhYNpUrp33gBTdx+pwakUEQxHcqaEdCcUpdQlnTo4n0eG1yagQKOU4ywSWZqbqApEgkxyKHbRQw
	guTk=
X-Google-Smtp-Source: AGHT+IGBkzqazmXuDW7QopiONN8TxjsMnqDJicaApuScpDpGFK7Oww7xwL14MWpsXZrK+iEmSRCXQg==
X-Received: by 2002:a05:600c:1383:b0:410:adc2:6d1c with SMTP id u3-20020a05600c138300b00410adc26d1cmr262825wmf.12.1707844606230;
        Tue, 13 Feb 2024 09:16:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWC2orr4N4ebUitNoPpK94a91+0uiiTbLyOtBGE3I+o7/81cHMERbe/2+UrEpyrBMM8Z64UxdNCvVvzhyOP2aofO3D9bQHsqVuWpjYLEB3KEdtrNmHh0G7I/AoQaisw/14wYpIufpXKw3hMMrGx0p5tv1mnIQFjJRhZdlRlxWH+BRWGCMTYQ/WqaizfV9rN03uoJwijj8UtJ7Z9TyZ7HzYr8Dv3jf3JXD2yPTsLpGumzP166d/74NUO+w4OG++08Ct9exCopO84Rvsuu2KQIlaLAfmuol52UE3daY3gnQuqjys+AV4fOUY3tLB9yisOdXZSJv67/S1vUGOha+xnISZmWpc3TGdMcZjWC/Se2p0EJyQ=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b00410c2f39833sm7805785wmq.30.2024.02.13.09.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:16:46 -0800 (PST)
Message-ID: <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
Date: Tue, 13 Feb 2024 18:14:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/4] arm64: dts: amlogic: add fbx8am DT overlays
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
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
In-Reply-To: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_091651_540578_C8C63481 
X-CRM114-Status: GOOD (  10.84  )
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

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Add support for two variants of the fbx8am board.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/amlogic/Makefile                       |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index cc8b34bd583d8..1ab160bf928ae 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
@@ -80,3 +82,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
+
+# Overlays
+meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
+meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
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
