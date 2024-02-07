Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6798FC4828D
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Feb 2024 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZt7jDmGF5zru4PaRpArvHFcvPGSYW/VN1bCfW6v9lM=; b=QJZaLyIyUDc6BZ
	RmYhXDFEBFnIRPUm8dotkDviv5z93y4jEOlx79VS5NbHf8fScF+f0KoBtVm/RDVUyTMbGAmWe609z
	HecG7IxWwzd8mmwLroOn49zjVALxrWOYsDNZAJ2KbgpoZUckyqvcwpEwM1cANVThkNpjL7sor6PL+
	tIgk1LwoWmF/Uq7zVPLh6+LzxMhI8ocbED7Y6DXahSIVCeD0s4sXBno4uyl+9goY0YDKTaN2+ubss
	/csfPk3MS1gdl+ArYVOtxKQNJ1LYYg6UiBUBPBkeBogefnuQeyHSKQrIus84rQUse+QcJ7OuRB5oU
	fClfZVb6nKYt86xGQ1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmnp-0000000BUWL-2LQb;
	Wed, 07 Feb 2024 18:37:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmnl-0000000BUVh-1s0N
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Feb 2024 18:37:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-33b401fd72bso806519f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Feb 2024 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707331056; x=1707935856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hbPvzxIa6Wp7FdAAF5RXLHH8K3DSeUZPtNJYiZTw8=;
        b=fOHAmQ0ADCqnsiOotgbzeTQqeXbMlvmPsRD9ZeQRuO5x3Zv4D6tfP8dkVbQ+IA3AdF
         zelbdq4IDFT3qexh7hAnuE8hKRQWXCHr08NoDI3jCE/uUxU34YFujX6aMCEvx78jKdWE
         d0KO6TBIMKDySCYZH2P1ldidFKjkyjIiCK1ZKnj8L9Ebxf7H9TvwU1wAzXRIi2KVaYTu
         dQV3rcbn/vhXq0K6LgqCSMeD7+eu+D7oA49NmfYmNd3VHz8nnXeUkTDY4eurUb+9YM6i
         sOXvqU8AX7NXW9XXw/t3lzFni93rlRuYtmISBCVEP4Ing8oMrKjviAzS/yZQZs4PFhAC
         /lkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707331056; x=1707935856;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hbPvzxIa6Wp7FdAAF5RXLHH8K3DSeUZPtNJYiZTw8=;
        b=lj/KJG3lA2/4SUojuHFQzGlNZqUJM9eMej5iTa/mxoQ/TUfyCinvGyB4mxKdWo6d+u
         ggH6WrNpGFJ1UYAokrv8fxN4g3Sa7Kt3//hVZLYEHlKqmjE0cWYi6/roTLlS1VHNHbqJ
         hji4hTkYIQepGAlNtq4jrxaApSikOqMTfTtPHj4u7OAmHDj8ULeogIkIVq77121xa6SU
         MhzwbQsSoNRPfqFsxlft9/0hTmY1eOxadv+gMSo0SdjzRvd1rhZySNNe/XaFXqt1k9LP
         qy7h+BGvhlWOltw7JI3AcLf73DDQ/eQJvA/wpmy6Jd6YO2AwTTnIC+1WdwWGcv+KEwcS
         6cuA==
X-Forwarded-Encrypted: i=1; AJvYcCXfuUfaVTQ3mAArcqkZFzJgN6AlihPzIkElMpzpEvBT2hEUjlY/mW89N3fTTRwnckTLpUNFwNjnku6vlJbBAl4EmRo98bBGtmZTPYPnUvzZuFU=
X-Gm-Message-State: AOJu0YxV60fdGaF6IxwlhL+31TaJTzGBMh25T5oIqYMTcIAZ5sSJ1V6R
	rozOKZC4bCMfzhEYLe7NGzK0IDvOoEh+Sbzyh2rTBkgkYwuYA5DOWHckopVvHVs=
X-Google-Smtp-Source: AGHT+IHdjCu281igYonYc5LjAsqVjOjq7T6pfdcghL+Izjr/4nEkx9LlGFCy/8FEmItcI7B5ETar7A==
X-Received: by 2002:a5d:4986:0:b0:33b:20c:d2cc with SMTP id r6-20020a5d4986000000b0033b020cd2ccmr4208172wrq.20.1707331056262;
        Wed, 07 Feb 2024 10:37:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWIQsMyQaqINy6Ty1XhxUYXe940+8ZGjGvOFS+KBTy+M+aqr5DLRMd5lHa/FI0Mnxa+oAQkMI3Ppw+aIlinntG+Aew0uHqG+lhCflxFWRb2C4qFudJUJUCt2XIjpeKMxasEztHA9Pgt/JhpXFr7gMl7N/rOuewmTA/s4T/iRSrVlwld6ufIE4HECKQ4UtO9iKSFEgevKIYM8kKbX9gGn5O0FKP2saQ3Cbnu4kaHQLOWgd6DA6KrMA3/iRAgvt7OjEHBuBItJ+WO2CWVxnnO6uP2WT+oR+JJAMsHGJHDajEJpBgtOR6VmYrF5KCLfwQcWmP6H5d6cIpUgbxFOdOiTtZb67821sYiVm81AmoqTeyNvDZ/JV7SO8YTx8JHIeyg
Received: from ?IPV6:2a02:8428:2a4:1a01:a746:ab33:4ed9:80f9? ([2a02:8428:2a4:1a01:a746:ab33:4ed9:80f9])
        by smtp.gmail.com with ESMTPSA id z20-20020a05600c0a1400b0040fd24653d4sm2876829wmp.36.2024.02.07.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 10:37:35 -0800 (PST)
Message-ID: <091c3f9c-6bd2-42c5-a9b0-9257387b9455@freebox.fr>
Date: Wed, 7 Feb 2024 19:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] arm64: dts: amlogic: Add Freebox fbx8am boards
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <8c865c62-cd80-4c78-9fc5-c85491c037ca@freebox.fr>
 <2149edc1-e19d-4aae-851d-df35b91bcd98@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <2149edc1-e19d-4aae-851d-df35b91bcd98@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_103741_748519_B89A3684 
X-CRM114-Status: GOOD (  23.71  )
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

On 06/02/2024 14:38, Neil Armstrong wrote:

> Hi Marc, Pierre-Hugues,
> On 06/02/2024 14:12, Marc Gonzalez wrote:
>
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
>> and the SEI510 board design.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>> Request For Comments to spot obvious mistakes before formal submission
>> NB: on IRC, narmstrong mentioned:
>>> adding dtbos for variants seems to be the new preferred way to handle such case
>>> the fdtoverlay utility works well for this case
> 
> Thanks for this RFC, first please split it in at least 4 patches:
> - vendor prefix
> - bindings
> - _base_ dt
> - variant DT
> 
> For the variant DT, indeed I think DTBOs should be the new preferred way
> to handle that, for reference I pushed a patch for the DSI panel support
> of the Khadas VIM3 as a DTBO:
> https://lore.kernel.org/all/20240205-amlogic-v6-4-upstream-dsi-ccf-vim3-v10-6-dc06073d5330@linaro.org/
> 
> It would greatly simplify your handling of current and future variants,
> reduce the size of builds DTs and make it more flexible.

Below is my current patch (which still needs to be split in 4) for reference.

We're not quite sure how to apply the DTBO at run-time.

PH mentioned passing a -@ option to dtc?

$ fdtoverlay -i meson-g12a-fbx8am.dtb -o dt.img meson-g12a-fbx8am-brcm.dtbo
Failed to apply 'meson-g12a-fbx8am-brcm.dtbo': FDT_ERR_NOTFOUND


  Documentation/devicetree/bindings/arm/amlogic.yaml         |   1 +
  Documentation/devicetree/bindings/vendor-prefixes.yaml     |   2 +
  arch/arm64/boot/dts/amlogic/Makefile                       |   5 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    |  35 +++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso |  25 ++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts          | 469 +++++++++++++++++++++++++++++++++
  6 files changed, 537 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45a..fce12e44c00af 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -148,6 +148,7 @@ properties:
                - amlogic,u200
                - radxa,zero
                - seirobotics,sei510
+              - freebox,fbx8am
            - const: amlogic,g12a
  
        - description: Boards with the Amlogic Meson G12B A311D SoC
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db47..4f5a1f4e6689a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -500,6 +500,8 @@ patternProperties:
      description: FocalTech Systems Co.,Ltd
    "^forlinx,.*":
      description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^freebox,.*":
+    description: Freebox SAS
    "^freecom,.*":
      description: Freecom Gmbh
    "^frida,.*":
diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index cc8b34bd583d8..b10958e3837fe 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
@@ -80,3 +81,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
  dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
+
+# Overlays
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtbo
+dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtbo
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
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
new file mode 100644
index 0000000000000..750322c295133
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+// Copyright (c) 2024 Freebox SAS
+
+/*
+ * SEI codename: SEI530FB (based on SEI510)
+ * Freebox codename: fbx8am
+ * Commercial names: Freebox Pop, Player TV Free 4K
+ */
+
+/dts-v1/;
+
+#include "meson-g12a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/meson-g12a-gpio.h>
+#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
+
+/ {
+	compatible = "freebox,fbx8am", "amlogic,g12a";
+	model = "Freebox Player Pop";
+	chassis-type = "embedded";

[ snip ]


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
