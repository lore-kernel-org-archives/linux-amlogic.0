Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C488C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 07:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG2j2t4OI/W8v3BxKeTRI7Y8xgHPs7I7Gw5ZiRK/KPQ=; b=WJEh+3Fc51i9PY
	8PFUC4DLJUh8ttqn9jaZftcL+4a5I2mMDISGThlQYpU/kdkBmj9QnMKHxnhBWqlJSXtEDL+/o9kDM
	+lzYRSjs/9COMKgWOnfUOgT3aOm4zPf9SVd1WZbzj4j4rmR89QTJu4ri1llLKWCUWh3g0awLZLKXm
	V2NjVZI6N3j6EKVMXYAowJ2m7kQkLcKLmCoX9HfI7zPy9tGwMqXSaDbWGaoBZ4PPX32UTCiVxoZvp
	3anNI6OuPwM7xUtAiBn75IRa9Y7oVCgFWEcFby1ZCn37Sm+WV93cVkCai7102J5yqFybG8+UfTHAZ
	uqlqRruB0YXkgILpYIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDVm-002bth-GP; Tue, 24 Jan 2023 07:14:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDVb-002bsl-6J; Tue, 24 Jan 2023 07:14:20 +0000
Received: by mail-ed1-x529.google.com with SMTP id k20so104105edj.7;
        Mon, 23 Jan 2023 23:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/gscYi2CxqFQn/wHKaRq7cLM4225WOiA33RvJa6O3g=;
        b=GEGmlW6RXixgZLaBN1PDq4KYA+MYsAky/BGFsvi6dIHiQ4i5FNAkO2ibqCc6WxVzKG
         Lo5ePI6vLLAUN5L8R/+I4wZeq4gmnwyEC/AsznF0Uq59YCxnBQQCX+U6tv3aW3//EmvE
         1C0LN059V2PLbOWZsTlU+wwXvVjIgiKHyEfTyvOot7ZpmoCwrmoaPz4xQ1t3Nkag4FGZ
         tT/sfY8r8h5mjB6PeKhrqHGs0FkQAdtg3Bbls3RXRCC/sZx5N2LsHJ1AjBjpJuSzcBSK
         r87c7lfv/rW5+DWHT9HDVqSn1QXMZ79SwrMTtVrkH1vrj6Vd78kkdV9/u/nUtxv9GBVI
         uQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/gscYi2CxqFQn/wHKaRq7cLM4225WOiA33RvJa6O3g=;
        b=FpmyZvesXZa64it3bUvmpqtgXl9srWESOlhZo0aQc0+F6GGjFcd142EvESWwz/bIEH
         EaRbX1uhtIeWC/fbdXDvfPtb0R48bBpNrApbwdmb4vcDN1Wc4EKM3VS0Q1fjWguNrWpc
         +AY8rtwweUHP5dbk4TfTtAChtPt/tmir8nyVYYhmme40jwf85eoMeAz6vsrCbXmfM9Ei
         wvdxfbiYsUbE5LhPyz+mVgbi6duiS1hiEMEaXpiBD8XFpkWYSCDUvEvidYYHnyQn5ztn
         5jjl9sCZ6gBru86Szk02lhsgqSTP3q1CS7rWhO1233hUZfu8OlbQS3kr1nt41Vg1bToz
         /NQw==
X-Gm-Message-State: AFqh2kqbZerccFYAZEDpzANRMynQWo+oT9Y+KOOHDMOtzUvTts1CmQiX
	rpTEHi8ND/f/ng5GIfyembo=
X-Google-Smtp-Source: AMrXdXvFkJvbBmITEt6DIqeWCdJcnHQKODdiqadQqUg4hRR5JJfLcF9kimnHbW9lIjH+l3gpJDcwAA==
X-Received: by 2002:a05:6402:24a0:b0:499:70a8:f918 with SMTP id q32-20020a05640224a000b0049970a8f918mr33964222eda.16.1674544453198;
        Mon, 23 Jan 2023 23:14:13 -0800 (PST)
Received: from ?IPV6:2a01:c23:c139:7c00:8402:5a53:ddd5:ab2c? (dynamic-2a01-0c23-c139-7c00-8402-5a53-ddd5-ab2c.c23.pool.telefonica.de. [2a01:c23:c139:7c00:8402:5a53:ddd5:ab2c])
        by smtp.googlemail.com with ESMTPSA id s10-20020a056402520a00b0049ea0854ba9sm406823edd.52.2023.01.23.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:14:12 -0800 (PST)
Message-ID: <04f4edd0-56ea-6c4b-1e0a-638c937ae945@gmail.com>
Date: Tue, 24 Jan 2023 08:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 8/8] dt-bindings: pinctrl: Add Amlogic Meson pinctrl
 binding
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Thierry Reding <thierry.reding@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <69188960-9d88-4163-8a87-1820fb673eb9@gmail.com>
 <167452325471.3119159.12105704680288885350.robh@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <167452325471.3119159.12105704680288885350.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_231419_263365_1385B781 
X-CRM114-Status: GOOD (  16.64  )
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

On 24.01.2023 02:22, Rob Herring wrote:
> 
> On Mon, 23 Jan 2023 22:30:44 +0100, Heiner Kallweit wrote:
>> Add Amlogic Meson pinctrl binding.
>> Tested with make targets dt_binding_check and dtbs_check.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>  .../pinctrl/amlogic,meson-pinctrl.yaml        | 121 ++++++++++++++++++
>>  .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>>  2 files changed, 121 insertions(+), 94 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>
> 

Thanks, I didn't catch these warnings because Meson8 support isn't
enabled on my system. Will look into it.

> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
> 
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
> 
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/69188960-9d88-4163-8a87-1820fb673eb9@gmail.com
> 
> 
> pinctrl@84: #address-cells:0:0: 2 was expected
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 
> pinctrl@84: compatible: ['amlogic,meson8m2-aobus-pinctrl', 'amlogic,meson8-aobus-pinctrl'] is too long
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 
> pinctrl@84: reg: 'anyOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 
> pinctrl@84: #size-cells:0:0: 2 was expected
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 
> pinctrl@9880: #address-cells:0:0: 2 was expected
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 
> pinctrl@9880: compatible: ['amlogic,meson8m2-cbus-pinctrl', 'amlogic,meson8-cbus-pinctrl'] is too long
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 
> pinctrl@9880: reg: 'anyOf' conditional failed, one must be fixed:
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 
> pinctrl@9880: #size-cells:0:0: 2 was expected
> 	arch/arm/boot/dts/meson8b-ec100.dtb
> 	arch/arm/boot/dts/meson8b-mxq.dtb
> 	arch/arm/boot/dts/meson8b-odroidc1.dtb
> 	arch/arm/boot/dts/meson8m2-mxiii-plus.dtb
> 	arch/arm/boot/dts/meson8-minix-neo-x8.dtb
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
