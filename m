Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D82FC83F01
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Aug 2023 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZJd7mUNc8z2SRm78rmCjjR+2iidkkEdw7WflqmcIHc=; b=VhDT/QBIcaJi8w
	2CIleDtgeSII0ogCpo+yP781NrFgTB6po4bUA2YrcAFwX6783KEQ7lh8nFlfKo7joqn5JlRz5s9QK
	phmsuQny+CdgbnJ9x6syc6IvWbSiAmQBAyp2f0xFQKBYeWIeCBDLZaDRToPDjh0LD51Zp2Fo8iTYv
	els+SIqYc+y+vBA5MVBdNWvtd/3q9OXl764SVGlNbbN3QzM2CRrO0yd2xIOAuvQFGmfXnI3J/wgsy
	PKG100sOa6jyL66DUYki+acedquKlisXiL8gNIBz9GCd5tM3v9V4pRwbPx5Wizq1wqcuA0bMdlz9e
	zz1VlFbmyc04p7ZeMk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxh4-00775I-0J;
	Sat, 26 Aug 2023 18:07:30 +0000
Received: from mail-ej1-f43.google.com ([209.85.218.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZxh0-00774X-28;
	Sat, 26 Aug 2023 18:07:28 +0000
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so243751266b.3;
        Sat, 26 Aug 2023 11:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693073241; x=1693678041;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0kZWHSaiCbSZZouMc9Cd5T9avQEho6jFDRRgwT4Ctc=;
        b=hlWV8KxpOmYlvkNw5+jnMJVUSgqFY4R4fQHwll/QIgvbPCI4cRbIfoF66Y4hBvEXGH
         vXuQ8e3+nvkxG21rbuCexZIIGsbMBBCisqLe7R0xGAOxVVbk8Kn24HkDSfTs7KB50Aet
         uUc3YRjLB8Szp30PFXqvWMZ4hRqbrj7xwZtMh7kaDvZmBCpAE5mqaqwjoaEFbS21I8WJ
         L4HzNwo1Na5dhhV+lpEhicW7+IxiSYHmhVCfxaE6Vf70n2CApz+oZJxhTQgS2mSb29gz
         KSquXIq7jKiKnYVTt9YXUSksc3LuF/2k8JyMl+tEBSl+z0xa/wZslseG49t27A0nj/Xk
         WtmQ==
X-Gm-Message-State: AOJu0YwxTkoymkBYDHXUnX1JfWJ1qhwHRUB63i987q4EewafOwYZWrd6
	oF7ejCX8O8oajraI/ScP9ZM=
X-Google-Smtp-Source: AGHT+IHPhlD8CyM5CErLxdEnnWbiZkLGcsudwktwI2j+HEH/R4+6x8uD+fI/UJcop8wTahGB7oi24w==
X-Received: by 2002:a17:906:8462:b0:9a5:81cf:57b5 with SMTP id hx2-20020a170906846200b009a581cf57b5mr2937812ejc.2.1693073240411;
        Sat, 26 Aug 2023 11:07:20 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id vw7-20020a170907058700b0099b921de301sm2454244ejb.159.2023.08.26.11.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 11:07:19 -0700 (PDT)
Message-ID: <29cfd5ef-16ae-4960-a95e-13b58c090604@linux.com>
Date: Sat, 26 Aug 2023 19:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] tty: serial: meson: Add a earlycon for the T7 SoC
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick <nick@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
References: <20230814080128.143613-1-tanure@linux.com>
 <20230814080128.143613-2-tanure@linux.com>
 <20230823082940.t4xjgfzwpt2hsfst@CAB-WSD-L081021>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20230823082940.t4xjgfzwpt2hsfst@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_110726_694865_9574393B 
X-CRM114-Status: GOOD (  19.51  )
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

On 23-08-2023 09:29, Dmitry Rokosov wrote:
> Hello Lucas,
> 
> Thank you for the patch! Please find my small comment below.
> 
> On Mon, Aug 14, 2023 at 09:01:28AM +0100, Lucas Tanure wrote:
>> The new Amlogic T7 SoC does not have a always-on uart,
>> so add OF_EARLYCON_DECLARE for it.
>>
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Since v8:
>>   - Fix issues with git send-mail command line
>> Since v7:
>>   - Send to the correct maintainers
>>
>>   drivers/tty/serial/meson_uart.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
>> index 790d910dafa5..c4f61d82fb72 100644
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
>> @@ -648,6 +648,8 @@ meson_serial_early_console_setup(struct earlycon_device *device, const char *opt
>>   
>>   OF_EARLYCON_DECLARE(meson, "amlogic,meson-ao-uart",
>>   		    meson_serial_early_console_setup);
>> +OF_EARLYCON_DECLARE(meson, "amlogic,t7-uart",
>> +		    meson_serial_early_console_setup);
>>   
>>   #define MESON_SERIAL_CONSOLE_PTR(_devname) (&meson_serial_console_##_devname)
>>   #else
> 
> I suppose you need to add a separate meson_t7_uart_data to switch the T7
> UART to a regular TTY devname 'ttyS'. For the new Amlogic SoCs, we have
> agreed to use 'ttyS' instead of 'ttyAML'. Please refer to the already
> applied patch series at [1] and the IRC discussion at [2].
> 
> Links:
>      [1] https://lore.kernel.org/all/20230705181833.16137-1-ddrokosov@sberdevices.ru/
>      [2] https://libera.irclog.whitequark.org/linux-amlogic/2023-07-03
> 
I asked Greg to drop this patch as is not need anymore.
T7 will use S4 TTY/UART code.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
