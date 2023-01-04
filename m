Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96EFC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 10:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJzhIYONlmw+BkH59aP3+HBafiZ5Pq4dSYL5apXAsNU=; b=Z1USODiU3Rn5i+TRQTyTwb5u5H
	3TS8odeYA1pwfmOAPtk7URhZsGlXgUS2L9ODfgP5OCYZIor0200oB02neEsYITh6Ka1myflMNOU0b
	J51q0UjOiC+vkO3e/VUopNjADasnp8mdfpNHax1sb9D3xwlck+hgv77nHbDDXrMUpGeurSLYm0FCp
	ZsXiSaB8H0cGyWgrFqNnd5jBnA9v5IyrfYVbYmenN7xip2a48/t5lUPm9e3uWoVGU8UmzX8t7DhwV
	BuJYGZzoBG7Rq+wif7THJSptLjv6qBG1Ehfmg7t38D/3r3iagP6/iPxr/vUcKh6/DigjFdkGoGuCg
	mMG1vDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD16j-008PrT-3W; Wed, 04 Jan 2023 10:34:53 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzZJ-007p5K-Ig
	for linux-amlogic@lists.infradead.org; Wed, 04 Jan 2023 08:56:21 +0000
Received: by mail-wr1-f43.google.com with SMTP id d4so24273402wrw.6
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Jan 2023 00:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HyeD42ASTohnhG8PBq16ESn0fobcpb8ovKy3Ww5fcDg=;
        b=o2ooXOQ6dPldjaJOtvM1YfYyy2GVA/bJIVJ7cdK+tbjn0eiVvb8FGKjpSg4Y2LdlqU
         M9/n7DThVNQUD2EP6U3Foc7YI7aJ4mp4CggD49gRuu6VeE6FE7IUw6yfLZo57kUKVjcb
         /mnEaODceB/RuzNmitFpSEM5wo4W+lYTlXEr+h11Dv79UVzXC4xnJwKWH1n7egewjqQb
         Gc4IPnBqustj2EmukPNUR4/K8NxuksOV1YVxvBNgAaD1jQQhhGwpN7qy2JUMr3txrovn
         q9SOgPjaW7Jux5nA18LFEDMp027XD2syF1bQV3zJnZXeQd4/3wpzzma96aFTb8biWsqB
         aYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyeD42ASTohnhG8PBq16ESn0fobcpb8ovKy3Ww5fcDg=;
        b=raPPo3Md55hAq77j6ofAQ51jZC841CTCP5GHpBdqd72vgJN08Iua1rzWSwQN25OwzH
         vCPciFIdLnG6nW7ZaMNLfAUDl9k5s+IC5aTSGMTS+mLgLFS0dj9aMQIkRG5Kxj80aib7
         schsULIUSSc8ZqQlyNNP+fXFnZ2rJakqJLlwp2Fdk4VHiGK+52OgHKOiiqXq1c3jY8n3
         nrcgEx45MtbB76XkhfXDsVeGXvqriPTjeDR2OdG9VqTYVW3u1Xt1qdkwyhih4BAGsgGg
         pfs+kFkb9m80k7jI/iQgf21+BbnvfQ4SYr+1zUhuxtVNcdgj4tkvYaSz5l8M8wDzLQIR
         EI9A==
X-Gm-Message-State: AFqh2kqVgr8A7ohz+R9/T58tJR5+t7VEEIaHkw5Isb+NNuBteRO3fW/R
	j+gK0KtL3SvYGHhHsh8iz+5+Fw==
X-Google-Smtp-Source: AMrXdXtxA65BDM8b0iW+0Q1/36Od59YM1bViy4tJKnTuc7uQ1VQ2hVL6/lJdTbF377sRYZBmHqOzQQ==
X-Received: by 2002:a05:6000:136b:b0:27f:85ce:bc9e with SMTP id q11-20020a056000136b00b0027f85cebc9emr23614208wrz.24.1672822574567;
        Wed, 04 Jan 2023 00:56:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:102f:89e:4a9f:68c? ([2a01:e0a:982:cbb0:102f:89e:4a9f:68c])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d42d2000000b00288a3fd9248sm19162392wrr.91.2023.01.04.00.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 00:56:14 -0800 (PST)
Message-ID: <260b70ae-0758-592b-9c4d-90938e8a5b00@linaro.org>
Date: Wed, 4 Jan 2023 09:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-4-linux.amoon@gmail.com>
 <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com>
 <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
 <CANAwSgTc=uGyZ0H_-ZckYoKztMB--DRfx7apBtP9zAbAU1XTvA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgTc=uGyZ0H_-ZckYoKztMB--DRfx7apBtP9zAbAU1XTvA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_005617_939246_A7ED2F4F 
X-CRM114-Status: GOOD (  27.01  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/01/2023 09:13, Anand Moon wrote:
> Hi Martin,
> 
> On Wed, 28 Dec 2022 at 20:14, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Martin,
>>
>> On Wed, 28 Dec 2022 at 18:21, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>>>
>>> Hi Anand,
>>>
>> Thanks for your review comments.
>>
>>> thank you for working on this topic!
>>>
>>> On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
>>> [...]
>>>> +       usb {
>>>> +               dr_mode = "host";
>>>> +               #address-cells = <1>;
>>>> +               #size-cells = <0>;
>>>> +
>>>> +               hub@1 {
>>>> +                       /* Genesys Logic GL852G-OHG usb hub */
>>>> +                       compatible = "genesys,usb5e3,610";
>>>> +                       reg = <1>;
>>>> +                       vdd-supply = <&usb_otg_pwr>;
>>>> +                       reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
>>>> +               };
>>>> +       };
>>> My understanding is that the hub@1 node should be part of the
>>> corresponding USB controller node, not a new node.
>>> In this case hub@1 should go into the existing &usb1 node. That way we
>>> describe the way the hardware is set up (meaning: hub@1 is connected
>>> to &usb1).
>>>
>>
>> Ok, I will move this code under &usb0 and &usb1 nodes.
>>
>> onboard_usb_hub module just assists in usb hub reset.
>> so these changes are meant to replace the gpio-hog.
>>
>> $ dmesg | grep onboard
>> [    5.405558] usbcore: registered new device driver onboard-usb-hub
>> [    6.383428] onboard-usb-hub 1-1: reset high-speed USB device number
>> 2 using dwc2
>>
>> Here is the boot log of the odroid c2 [0] https://pastebin.com/PFy5waPb
>>
> 
> Moving the usb hub into usb subnode usb0 or usb1 does not work
> on Odroid n2 and c4, we have a combo phys of usb 2.0 and usb 3.0
> so the onboard usb hub reset does not get initialized until both the PHY
> and USB nodes are brought up by the drivers.

Fine, then add a comment before the usb node explaining that.

Thanks,
Neil

> 
> # On Odroid n2 has a combo hub
> alarm@odroid-n2:~$ lsusb -tv
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>          ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub
>          |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
>              ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s bridge
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>          ID 05e3:0610 Genesys Logic, Inc. Hub
>          |__ Port 2: Dev 4, If 0, Class=Vendor Specific Class,
> Driver=ax88179_178a, 480M
>              ID 0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet
> 
> # Odroid C4 also has a combo hub
> 
> alarm@odroid-c4:~$ lsusb -tv
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
>          ID 2109:0817 VIA Labs, Inc.
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
>          ID 2109:2817 VIA Labs, Inc.
> 
> So I will continue to work with this usb hub node to do a proper reset
> of the USB hub.
> 
>>> In case hub@1 is not detected within &usb1 then you maym need something
>>> like [0] (not tested for your use-case).
>>> If that helps: feel free to include that patch in your series.
>>>
>>
>> Thanks, will check if this is needed in this case. As of now it just
>> reinitializes the hub.
>>
>>>
>>> Best regards,
>>> Martin
>>>
>>>
>>> [0] https://github.com/xdarklight/linux/commit/d8b96e5bc9c20ab2585194e0e59580c3b062c431
>>
>> Thanks
>> -Anand
> 
> Thanks
> -Anand


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
