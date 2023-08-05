Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9641BC04A6A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Aug 2023 21:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1O8Ju6vj97s84q+uCtpF7TdYX2uHsMTrdeRqvGtb4k=; b=oaDO7xJ+inyv3Z
	A/bmRLEDSDoGmdANCiSxVHmLvh8hN+ilGN16XLTyoIumKFMDPXR8pu3jzKGQkgyktOVzIhO7nZfpX
	OAv7EcYaLnBFaeV8pUdktK7PoodPpNevopVjrga32lnuMcbWQ3Bn5qQ4Vk7fSt1hQArbOuJtfB0Kb
	b+q3jUo1Nm+aU3A/9CAsaBlLppivh3Z9dXQNg0nZlTQCSuspDsIs2WANw8tEBZm1TiFiYdpaEIJTW
	rIYl69odEhNmfpPoFqxO42N497b4C7I8aWv45u8AgHfd5hvfnpZ+HxzYXTPFyZVCPHq/fbEgKcVFU
	r6eNj3AQophyoT4AK14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSOr5-00EaaM-34;
	Sat, 05 Aug 2023 21:30:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSOr2-00EaZC-0c
	for linux-amlogic@lists.infradead.org;
	Sat, 05 Aug 2023 21:30:33 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe07f0636bso5458331e87.1
        for <linux-amlogic@lists.infradead.org>; Sat, 05 Aug 2023 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691271024; x=1691875824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Udedw+f7sx05Q6DqlAhOSPpIuk4HuNrRk0FviM5bJCg=;
        b=Cu+OQzJCl9FU2+XLRN5mS+hfTTB/Cwtwf6ChMAsI4j4vULW5wnrmGo+IGNjXVTtElh
         xQQbMf7r7JckgYGmn5sAA8+Q5CaMfq4bwSg0BOz2bUj3xpNceBbddVaFHkRW9xXprTUC
         7+kPWAVEfXiX1kiItHQxc8Atx9BIgOPUP+ExAXASrHvwhFZuEXKAzVTGyZQ9/KFnWsW0
         4HKR7Klaoiu8fkrDAsRkSh2pWQl9KoZiwyt5zJr9tcoTeZlbj0W83R2Hk+5OqJUiKDMX
         prRj/BYVb7a8Bx/0QElXm+tLn3QzSZ8li4qERuI7qTN6fz25vt3veGpZe5O5/m+mFnay
         7gDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691271024; x=1691875824;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Udedw+f7sx05Q6DqlAhOSPpIuk4HuNrRk0FviM5bJCg=;
        b=Eb5rqE95UpW/Unx7PMdaKujzwolIRJhCUFmbtspgdBvENEog8KB/ROM3u3iqooJ7Dl
         YvRJN95vvRPjJn9rVWLGUIZcp5aFfkH8E1thDxnYomtwHLKJjr0MqojLFKs3lq0InO6W
         5t/xkpty1vpu07mIFe0eviuA6IYXZzqKQySYKeeQDX7k9InN85ZsSzyzJ+MPql9HB41V
         NCparKE8HXim4SbRaBQ2Ja5bmi9wZNk25zY/LcHMexQews4fx6YbqmgsuHwAPkNP/88g
         NECMj9Pw014jviNXWK60ueJmPl5vCdZOFKz0aIF33aEZta1glKv9OsVA0e5Lm6zEEIAR
         k2yg==
X-Gm-Message-State: AOJu0Yye8LB1yJNS9Y7mLR9N8Dbh0rtUWu/thQNeOQMZ0DQWyNDD3lD3
	nBj17t+3HaiHB5ixZOu2iSVH1w==
X-Google-Smtp-Source: AGHT+IEhTQgOjVXcX2K7FMOId42YhEmbOgLrWHIWvScZnVOdAcuePZAlBztMGO2G54UZgxWLjf8Udg==
X-Received: by 2002:ac2:5f98:0:b0:4fd:d481:ff35 with SMTP id r24-20020ac25f98000000b004fdd481ff35mr3526879lfe.42.1691271023831;
        Sat, 05 Aug 2023 14:30:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402115100b005230f2a12b9sm3073310edw.43.2023.08.05.14.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 14:30:23 -0700 (PDT)
Message-ID: <45d25fd5-465f-347b-448b-ce171626f34e@linaro.org>
Date: Sat, 5 Aug 2023 23:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/9] arm64: dts: amlogic: Used onboard usb hub reset on
 odroid c2
Content-Language: en-US
To: Ben Wolsieffer <benwolsieffer@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-4-linux.amoon@gmail.com>
 <ZMrFb7H1ynwwBSCA@Dell-Inspiron-15>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZMrFb7H1ynwwBSCA@Dell-Inspiron-15>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_143032_257834_F522768D 
X-CRM114-Status: GOOD (  18.04  )
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

On 02/08/2023 23:06, Ben Wolsieffer wrote:
> On Sat, Jan 21, 2023 at 05:56:31PM +0000, Anand Moon wrote:
>> On Odroid c2 previously use gpio-hog to reset the usb hub,
>> switch to used on-board usb hub reset to enable the usb hub
>> and enable power to hub.
>>

...

>> +	hub@1 {
>> +		/* Genesys Logic GL852G USB 2.0 hub */
>> +		compatible = "usb5e3,610";
>> +		reg = <1>;
>> +		vdd-supply = <&p5v0>;
>> +		reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
>> +	};
>>  };
>> -- 
>> 2.38.1
>>
> 
> Hello,
> 
> This patch breaks USB support on the ODROID-C2. As soon as the
> onboard_usb_hub module is loaded, all USB devices disconnect.
> Blacklisting onboard_usb_hub makes USB work as expected.
> 
> I tried to reproduce the problem by manually toggling the reset line,
> but the problem seems to be specific to this driver. When reset is
> asserted manually, the devices disconnect, but they all enumerate again
> as soon as reset is released.
> 
> Also, I have been unable to make USB work again (until the next reboot)
> even after unloading onboard_usb_hub.

Wasn't this patch made exactly to fix USB support, not break it? I might
be missing something but maybe this was not tested at all?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
