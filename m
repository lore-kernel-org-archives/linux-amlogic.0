Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51555C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAzjnmSx/e0byT2/RpQH/MFOdHa0R449jCM3LFncR9Y=; b=zqys5o5qPpnqWu
	TVOlBeeApCC5EMLSZ5OT/AyAg89aYFffnwIey/g/fvdRnTxPqw/EH+X871w6gRphzmq93z0uAoQVm
	2ZN6GRLevneQZwJOXk3B0bI1dPUPNGOseOX3qypRL7lDNWOUplbZ/mMbqVQmOClGYx3Bl09fRd80n
	l/+kaGSrTyXUGnqQxAXluLOHZDu9dsxH5+G0Nq+FYkOQyYdu+O+B2erT+HF1dufhgLyS5Q6KP/Z4K
	L8CpzjQN+ppQLlE8Ed1MlVbJLIwvaInu0K4pzOhSAhPDXV6OZcAtYtxvq9nlnqvqJbcEre3kz/fvn
	GhIQsamxMOHpyBTJGGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7be-00Fdf5-2l; Thu, 23 Feb 2023 09:09:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV7bb-00Fdc9-FM
	for linux-amlogic@lists.infradead.org; Thu, 23 Feb 2023 09:09:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id ec43so39153470edb.8
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Feb 2023 01:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTHH9zlDbccoeTvmUDLrTEqObJ4nge6CNLgpKIfq2Nc=;
        b=L0TWocZdfOWbL96bTpIQDkvaSs7o3o4cO16HwuUxwlTvaIlvDlGhPqNlwkQFCz2BZH
         tbmfoULCqeCg9jidx+1+SLITPxcXi0ZzwEjg8Ue9fKJcw9dRqMcNmrSoIr+EHp3gEr9+
         GkOWxjHXVtSPWqXFyuQ4zjDCqG2G07kCCPXr2gttwyBYdchCl3x0vUoc3XDrN0vcV+Tw
         p8sXVg4Ic+4PJsZuJsOpHdLmiJ5RsJoXOmGTt60sx6qtXKQI4r2VU5NRT9w90aEOSHaS
         3clRGn+HvwmrCabpgXVtqto8lUvXDB7rwOcvTA3x2WSJDeCMeLzMDCmH64BaYoTUrUaC
         PMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTHH9zlDbccoeTvmUDLrTEqObJ4nge6CNLgpKIfq2Nc=;
        b=0mi8Z7IYdLJ6TagkaWDc+OYhR3GzIALjE+zDcW3v3rgz8HuDVRhFLvFwhETClVocOE
         QHITTtKaVXjckP9XNG8j+sXNyt4ojkSgV0Z/WZuVdMEbucC2BTZSX7i+6uqCfS07FaC+
         WvzFcvFeRa+B0kWMpYVtd5lna4wPTtAD2IjeDE4w0wgSASIkc1BQtXOX3FMVSzE3dcxu
         X91/t3hrYWke6QhOZsYde/kuwU/Ugg1+lint20K7Op0ssyJ6ZC6JYjkPPMpw6FcqSMT9
         VTsDoZ8Q7cV4Lf8irLD9jWmjcovSinJ9TWj0LXCqvuFKtjQvOiSmU6iOS5HB4PGgoeIF
         JnkQ==
X-Gm-Message-State: AO0yUKXHZWaeFRrYiRmNpZGaUJ/EtzKuyuJkiBTsocfRRyngFQ4dq15y
	TRnqsaIfVErRk1uXqsbWv9g8HQ==
X-Google-Smtp-Source: AK7set9zgkcJ/Ydry/Spnvy0EWMQ98kUtwo44jN+5Rz6tMBQUI/yAHDbBTpVQg27blmc1k0bmHFKng==
X-Received: by 2002:aa7:c98a:0:b0:4ae:eb17:3afc with SMTP id c10-20020aa7c98a000000b004aeeb173afcmr11652406edt.7.1677143369613;
        Thu, 23 Feb 2023 01:09:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b15-20020a1709062b4f00b008db605598b9sm3847171ejg.67.2023.02.23.01.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 01:09:27 -0800 (PST)
Message-ID: <d5d9a1fe-2f66-66e3-d88a-76a12f2ec55e@linaro.org>
Date: Thu, 23 Feb 2023 10:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 3/3] arch/arm: dts: introduce meson-a1 device tree
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-4-avromanov@sberdevices.ru>
 <bc514ba7-406e-bca8-4d3a-4f8997cd3241@linaro.org>
In-Reply-To: <bc514ba7-406e-bca8-4d3a-4f8997cd3241@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_010935_550772_FAD54A6B 
X-CRM114-Status: GOOD (  13.51  )
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

On 23/02/2023 10:08, Krzysztof Kozlowski wrote:
> On 22/02/2023 12:50, Alexey Romanov wrote:
>> Add basic support for the 32-bit Amlogic A1. This device tree
> 
> Use subject prefixes matching the subsystem (which you can get for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching).
> 
>> describes following compontents: CPU, GIC, IRQ, Timer, UART,
>> PIN controller. It's capable of booting up into
>> the serial console.
>>
>> This is based on arm64 version of meson-a1.dtsi.
>>
>> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
>> ---
>>  arch/arm/boot/dts/meson-a1.dtsi | 151 ++++++++++++++++++++++++++++++++
> 
> There is such file and there is such DTS/hardware support. I don't see
> any reason why entire DTSI should be duplicated. What's more, your
> commit does not explain it - does not justify duplication.

One more comment - I think you just added dead code. It's
uncompilable/untestable. Otherwise, please share how to build this DTSI
without DTS.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
