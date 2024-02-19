Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E35EC54764
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 10:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVvfqmWUIMEwe0e+e32QQT8v5ZZ6xW9mjUsarVulkmQ=; b=4dJ0Lar9oCeLjW
	wjLRAG/dHE7v0aXMmkKGYPsvwNCrU97NP8ohf/AvJumHLbkBesBz2/AtBfHI+FrF15AcLG9Q/VoBg
	Ut6XNMtCs4NnD0bKABa6elHk3O2PbHaXnVAH1HRGo1UmsbQ36X/DI7YkmqLa8e8zSnJDJThGB375W
	KYI2aRkbOuIEBbhSZScL9+0V+ONCUlk8b8DvwVL7VuZ+lOvZOyCHlAblE0NgWsK8+k9NC7RluiguH
	nlvyT1vLI1VNjAj5j2RTOFdVFW47nuRm7swDAVXym/Hszf5beuW9JkrBrEG0ANjY0jcseDzSkDKUN
	2oY9IS/I+rzt/AO0NkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0wm-0000000A3hG-18jE;
	Mon, 19 Feb 2024 10:32:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc0wi-0000000A3go-45hh
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 10:32:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3394ca0c874so1994994f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 02:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1708338742; x=1708943542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zw7/XBaMc7MFJFGgdoFUnkBYvbNQYnhQTaj8fjHTmo=;
        b=l/eCbE6T23Xb0HhiiAh6rJxc6Jdtd8BdaLF7SQ0KtFO2BYV8xXJb77A6SXuokgba7P
         fQ+9hcXwZ2GrLl6H89zzae3M5EVOk76/uwy1wzZKW8lByvkRx2d7cwJ3NLLxV/m9QK+e
         FWUddohq9icTGybaFurUETOy5Xcaivo7CmOL/+CEwRPe7W8LAbe/lKxZgBuw9/BTmY9r
         HarkRvyVKWxlkC9tGo+0iC98A2qwMi3WxhpTd0q63VDPW3nmDlPVU8Afn8dIk1ty/JLY
         s4jLdtM63LJpjdN5xLO0urQHS8PoxJTpqiMFy+6Lb5BZCiC1h9zcUK4Mdr42gumMMj2T
         QTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708338742; x=1708943542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zw7/XBaMc7MFJFGgdoFUnkBYvbNQYnhQTaj8fjHTmo=;
        b=OOTBk/EFEmHyDs0p9ptYZ6nnhFkCzq0JEKM01FPsNDUg9sH5sJ4V1ChP1/HlRC2yUk
         cvuflOQnFpEs/6BN/LF0hyZd/oFyKjmPmRZ3Xu0ekbDX6wYoN0TLtZ2CttGYftQKWosc
         fXmZT4mtX5kfc7Ayi6r3cbQy0d7jZA7jC/gqpu3zguoslAx1SC4s+y2kLRCR0tq5PSe2
         8x0g5AFCIsIJkfobyw7ks/6HOQ/L94YmuSnhD8m0qJEVNCgJxjs9pBWjP6c6rv0akO+N
         lRuWcZaYHcZJFv69VoyxUXs+rMMzzEEsf3SxGtBYJI86bnkmVLw+8ssN05RuuuC4O3YD
         xv7g==
X-Forwarded-Encrypted: i=1; AJvYcCWN3iRHUE1XfOkFiG3mFaVQhGAITyPVEF6vh6Jky/ZKcISP52fSFn9xFV5yaybuxP/yju/D2zq9R5IVdAhz54flhO2LYIuExETX/99VGLv+Br8=
X-Gm-Message-State: AOJu0Yy/9v6pkwFxgpRPzAfNlZ5SvR7s2jOJ4wI9WcDa67ZnfckjAl7o
	/y8wUUULgninWm1eZzwbJZg7HPzBC6XImfO8G9iKuFZO5gCQsSHX4Zi8HJs8ajc=
X-Google-Smtp-Source: AGHT+IFE0+9Jgnkp9agPS6QS2SGbk0FJ5Z7jOlUjDlyXqIACVcPCVM4Buec+LPfJXA2IUTX71GturA==
X-Received: by 2002:a5d:5148:0:b0:33d:374f:83e9 with SMTP id u8-20020a5d5148000000b0033d374f83e9mr3497049wrt.45.1708338742405;
        Mon, 19 Feb 2024 02:32:22 -0800 (PST)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ay5-20020a5d6f05000000b0033d1ef15821sm9563900wrb.25.2024.02.19.02.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 02:32:22 -0800 (PST)
Message-ID: <15fcafb2-4b4a-40a1-8ef5-ee3aef9b3b9d@freebox.fr>
Date: Mon, 19 Feb 2024 11:32:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: amlogic: add fbx8am DT overlays
Content-Language: en-US
To: DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>
References: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
 <79ba726d-d02c-44b9-b6f6-59b17ba9755c@freebox.fr>
 <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <54b4e810-754e-481a-bbc8-984f859b116d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_023225_277744_90EF9F09 
X-CRM114-Status: GOOD (  12.77  )
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

On 14/02/2024 10:47, Neil Armstrong wrote:

> On 13/02/2024 18:14, Marc Gonzalez wrote:
>
>> Add support for two variants of the fbx8am board.
>>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>   arch/arm64/boot/dts/amlogic/Makefile                       |  6 ++++++
>>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    | 35 ++++++++++++++++++++++++++++++++++
>>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso | 25 ++++++++++++++++++++++++
>>   3 files changed, 66 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index cc8b34bd583d8..1ab160bf928ae 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j100.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-2.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-jethome-jethub-j110-rev-3.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-brcm.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-fbx8am-realtek.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-radxa-zero.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>> @@ -80,3 +82,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-hc4.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air-gbit.dtb
>>   dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
>> +
>> +# Overlays
>> +meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
>> +meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>> new file mode 100644
>> index 0000000000000..ed79809b15859
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
>> @@ -0,0 +1,35 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +// Copyright (c) 2024 Freebox SAS
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/gpio/meson-g12a-gpio.h>
>> +
>> +/ {
>> +	compatible = "freebox,fbx8am-brcm", "freebox,fbx8am", "amlogic,g12a";
> 
> This looks fine but I'm unsure if those new compatible should be documented or not,
> since they are in an overlay

Rob, Krzysztof, Conor,

Just want to make sure this was done "right".

Is it acceptable for an overlay (DTSO) to define a more specific compatible prop?

Regards



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
