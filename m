Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD31C54E58
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2024 10:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+OKWlT1mcofeb18mXEeSkjQ7qZD693g7cNUuhYYK4M=; b=4Z+fK4m4rxSHTe
	6oWC6MvJn9HOaFACS4s3r8yQyoGPfHpixKk0GhTQE3BSgps4EzEwas9KqIGVbJ+C7TF3nwK0tNaQN
	NGBeklewliJ3v8HZZMewJnjRkb7y7S+hxBFhLhNzYZ+cVbevWGIuacCGdJpYS7bTSIDW280zfsSRV
	4X8Xe6DIMs6xgqLQeGMiJ3sbNhqwmz4so79U1wQpOeJM5rm7h+VmaG8s6C6OYgkPBzKDupry3PtUZ
	TXdMeIr0QtOmFXZoVU0xBWEn26GtuUhjdL/UeNcI1FI8V+hCvd9dyIJAyM42WE2oxYfFkmCtdpn+s
	AjG6FJUxicFgNKzd5wsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4kT-0000000HSVD-0ET6;
	Fri, 15 Mar 2024 10:25:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4kP-0000000HSTu-3Ifs
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Mar 2024 10:25:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33ed4cf02ebso170467f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2024 03:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710498307; x=1711103107; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=ayZqBI399we34JjarUgplIfxu4WUxUPY+RhqdhQkMg9kcgmt0lJpUmWtqFCpUh11VT
         diB5xIeJB8KoSwZU0f8oaAMSLdfxA/HGFJrdlR/IC+hOA+omsnJOxSqyqe65r4vVBlJD
         EGBqIio/RPpIBJS13Oegr9BLGUw3D1UFbV/0nXAjTYf84TZm0vJpcuKdy0CLZosB1rPi
         cfIkInYQJmvC3NnY25wXUEodlsyyku1kCj68DUaffaS4LPSVhNpc5haEZw+VnUERowN2
         pgcGEvJXxiC1RboFQvf/8oBJIzex0DfLb6KydfDmuWZGPfc349GmfYQZJ9o2MDl8/4tQ
         Ip3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710498307; x=1711103107;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3EB/6PldhsbhWY9+bYWiu2w8/wr6W5dSP5c/9sIMoI=;
        b=FXmQS1/DNsuWJ+orqmfY4cYNaRXSXvr00e5X4NmbFVRV3jRlx5hOPr2aMx272+som0
         DLoS8xsXFeTvURZUBQSo0yS2JiUlY/RbxlApKmGYou2pPtfAVeCOKShsHjt8AjAub9xk
         /E+XC1+LGfqI8QRnAmXExRb4EGDH9kmelEV2UGe/a7iicveAt9pRN4tlOjp0WoNIeq2L
         GZ4EDM+BtwDab7SOtcks8LmnYjY8cfUn6Sj/a/cao0IFkl1EjTopsBkvxfiJKxJuEDJy
         cnzh0/EplWiHtmoPakd5M6OMBVgWPZ1kqJNFt5FzqoFVSC6p+o1ddQVajcVlZBDEMcRH
         MrBg==
X-Forwarded-Encrypted: i=1; AJvYcCWfeI8md9F3x83mgVMRcOglrAhCGeRN1gUpCNk2+BFacEeBOdKzR7azfHsbfWyBtZHZsoGf33aO0KiAWgAltcj2w170trV/iSckEuV5LxipsUc=
X-Gm-Message-State: AOJu0YzyJv3QugsShFXlc0Co7zLuh4T4BaT9A0OHxBOcRd0/UBC1y70e
	uRjOv2/E3sVEFel+CuZnfcYxlOO64gmEL0f49jJi1nqS6IZcGpdbfOXj7FcJnKM=
X-Google-Smtp-Source: AGHT+IGWDipfwojUVR3R0h/HAg8+ErMHQU1L9DU1QDqUHJY9+2A1t5wePivY0yDxiYGWnr60Q0NDnQ==
X-Received: by 2002:a5d:4cc1:0:b0:33e:7f5c:732c with SMTP id c1-20020a5d4cc1000000b0033e7f5c732cmr3060666wrt.62.1710498307090;
        Fri, 15 Mar 2024 03:25:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8151:4d0a:14d8:1124])
        by smtp.gmail.com with ESMTPSA id o14-20020adfe80e000000b0033e8c50fc3fsm2818997wrm.90.2024.03.15.03.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 03:25:06 -0700 (PDT)
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-14-jan.dakinevich@salutedevices.com>
 <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@salutedevices.com
Subject: Re: [PATCH 13/25] ASoC: dt-bindings: meson: axg-pdm: document
 'sysrate' property
Date: Fri, 15 Mar 2024 11:22:59 +0100
In-reply-to: <ca80caab-2664-4797-a222-e14537eea440@linaro.org>
Message-ID: <1jil1nhjwd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_032509_856617_E500D3F4 
X-CRM114-Status: GOOD (  15.88  )
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


On Fri 15 Mar 2024 at 11:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 15/03/2024 00:21, Jan Dakinevich wrote:
>> This option allow to redefine the rate of DSP system clock.
>
> And why is it suitable for bindings? Describe the hardware, not what you
> want to do in the driver.
>
>> 
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
>>  Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> index df21dd72fc65..d2f23a59a6b6 100644
>> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
>> @@ -40,6 +40,10 @@ properties:
>>    resets:
>>      maxItems: 1
>>  
>> +  sysrate:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: redefine rate of DSP system clock
>
> No vendor prefix, so is it a generic property? Also, missing unit
> suffix, but more importantly I don't understand why this is a property
> of hardware.

+1.

The appropriate way to set rate of the clock before the driver take over
is 'assigned-rate', if you need to customize this for different
platform.

Then you don't have to deal with it in the device driver.

>
> Best regards,
> Krzysztof


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
