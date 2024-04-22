Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8F2C07C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odEPZ5pgZfkjPaE62ex9n4fqL3NvY4OuVVdOutzNCmI=; b=XQozbYQLyW8weE
	H+KJJ0d7Tvck1U1viejYGTH9J1ac9vCxHkjPtZk5D2j+yKZ/Ko+Ikrt602F4gWP40j/yHPcFza3OA
	6yBXCJ8uupmVZTMIX6aj4v05VZlLYG/5n2p0fO4TmIQBWZZGqXuAqJ4xZRFFgtMdmGFZCLCeeoqt5
	+qrObpJlwhZOI4ujvNWlPCudMAUTXXraLv23LkeiSSVZd9oZDoVGT8JYGgfUci6c/n9VLeCDUn3bV
	fEHK5vvNkKgge2gD7ZOKrJwfrOMn4TgY0tEU6rGijhc5msMVYOq5JxFhL+bFt/XsqdZoo7geEI7yE
	8V5SLak3yc8U27w7rwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryw5d-0000000ECct-1s9H;
	Mon, 22 Apr 2024 16:00:21 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryw5Z-0000000ECaZ-1Foe
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 16:00:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-34af8b880e8so840595f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713801612; x=1714406412; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=dkMow7P9nbwYVpvi8tHneuz7LEnCqE9H/aKPdu2x/vw=;
        b=Gk/sV+DAp/uPLqGHIQe5P4ufV5jgGqogWDwOb2PWM3jWQpythRxsPToVKdzV/1t1/G
         TOBJTkFj5zSk3IYHv1NsII2HLF+NuzkKNj3KXYlMc4ZQEQ9cpik2urATIOq6FkYTdu9W
         jFnixLatsdPKsMtf0XNXPTBhZdbgnpi/J/81RScCCgu9grYgADd/Ywqef1KvyVMNbwrQ
         QTS55o0rbKM1/++HFEOJeoHgcx5RTjz2eibNXdVz3LBiEVmaiPepWCyt5LfQ/qVxhScQ
         S+a0VPpH4Ot7x7VF7c0v+gOmJW2EEpGVa8asN+BDtNNNnjkGqwbtb05gwP1reimOaQpp
         9bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713801612; x=1714406412;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkMow7P9nbwYVpvi8tHneuz7LEnCqE9H/aKPdu2x/vw=;
        b=vdDFps26iqZzyQrH2SdH/lDUupDJszvJgEXN5UWBzGIizIQFgceLDCTpDZoqKze9Bl
         NOw61XHfXPzSTzu152mrn3NYlXHUMs/BbUnO/Pcv8sscqMgcBvdiSdsONwIjgeADB4h1
         6EAJ4m99pfqE8Az/tkvykDfw16VydlP3csvONQRib4k2XL/LqebIf2cW72c6s6PqBnzw
         5aMBHq+B/0pinOK6RhBxI/GAu5NTMee9XasGgJ5Fp/LOrkyKM8Qlslgyzh+pvED7rwIK
         GefQd/kugrcLy59LCq2dLWLA/9QFhby2T9UvYYgMsSVfsH7TzBmKV6SIozeKXvvbB/ig
         mW5g==
X-Forwarded-Encrypted: i=1; AJvYcCVAPuqs5/D7g4Z3TngJzq8BbhW7bAoVFZ5aZJodZrh4FtU9B4qQQCrDc4GS8OSkC10KRot+WYKR8vWPi0xCBcQ74iQ314cT3xpWHE4+BWbNmUY=
X-Gm-Message-State: AOJu0YxZEMz9ZuZYArqrvMlpVIv3CzR+i0vKA09sJkftfiFZEKGEZDtJ
	4ar+S+UiJXQuyzSLOp6T9glzhbs3EoF/VIdbsnBKAi8Lzeu9TDiSy+zDFqQncSo=
X-Google-Smtp-Source: AGHT+IHBbJHMycTPOLmmfBqpNcPhCqj7r7p8ZmztmscScJphQOUSkwQ5U518mRjUw/T4P/o60zjV1g==
X-Received: by 2002:a5d:5087:0:b0:34a:5148:20e0 with SMTP id a7-20020a5d5087000000b0034a514820e0mr63176wrt.6.1713801612396;
        Mon, 22 Apr 2024 09:00:12 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ab40:ca64:3dab:1be9])
        by smtp.gmail.com with ESMTPSA id e4-20020adff344000000b0034349225fbcsm12391531wrp.114.2024.04.22.09.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:00:12 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <20240419210949.GA3979121-robh@kernel.org>
 <b86f1058-da53-4a9c-bc12-e7297351b482@salutedevices.com>
 <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
 <1jle55c0bl.fsf@starbuckisacylon.baylibre.com>
 <1jzftlakgg.fsf@starbuckisacylon.baylibre.com>
 <0272deb1-5427-4805-a6f1-df223a5c14f5@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Neil  Armstrong
 <neil.armstrong@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof  Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin  Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Date: Mon, 22 Apr 2024 17:38:28 +0200
In-reply-to: <0272deb1-5427-4805-a6f1-df223a5c14f5@salutedevices.com>
Message-ID: <1j5xw99ylw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_090017_463898_160F0A48 
X-CRM114-Status: GOOD (  39.66  )
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


On Mon 22 Apr 2024 at 17:31, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 4/22/24 10:57, Jerome Brunet wrote:
>> 
>> On Mon 22 Apr 2024 at 09:16, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> 
>>> On Sun 21 Apr 2024 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>>> On 20/04/2024 18:15, Jan Dakinevich wrote:
>>>>>
>>>>>
>>>>> On 4/20/24 00:09, Rob Herring wrote:
>>>>>> On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
>>>>>>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>>>>>>
>>>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>>>> ---
>>>>>>>
>>>>>>> This controller has 6 mandatory and up to 20 optional clocks. To describe
>>>>>>> this, I use 'additionalItems'. It produces correct processed-schema.json:
>>>>>>>
>>>>>>>   "clock-names": {
>>>>>>>       "maxItems": 26,
>>>>>>>       "items": [
>>>>>>>           {
>>>>>>>               "const": "pclk"
>>>>>>>           },
>>>>>>>           {
>>>>>>>               "const": "dds_in"
>>>>>>>           },
>>>>>>>           {
>>>>>>>               "const": "fclk_div2"
>>>>>>>           },
>>>>>>>           {
>>>>>>>               "const": "fclk_div3"
>>>>>>>           },
>>>>>>>           {
>>>>>>>               "const": "hifi_pll"
>>>>>>>           },
>>>>>>>           {
>>>>>>>               "const": "xtal"
>>>>>>>           }
>>>>>>>       ],
>>>>>>>       "additionalItems": {
>>>>>>>           "oneOf": [
>>>>>>>               {
>>>>>>>                   "pattern": "^slv_sclk[0-9]$"
>>>>>>>               },
>>>>>>>               {
>>>>>>>                   "pattern": "^slv_lrclk[0-9]$"
>>>>>>>               }
>>>>>>>           ]
>>>>>>>       },
>>>>>>>       "type": "array",
>>>>>>>       "minItems": 6
>>>>>>>   },
>>>>>>>
>>>>>>> and it behaves as expected. However, the checking is followed by
>>>>>>> complaints like this:
>>>>>>>
>>>>>>>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>>>>>>>
>>>>>>> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
>>>>>>> do it right?
>>>>>>
>>>>>> The meta-schemas are written both to prevent nonsense that json-schema 
>>>>>> allows by default (e.g additionalitems (wrong case)) and constraints to 
>>>>>> follow the patterns we expect. I'm happy to loosen the latter case if 
>>>>>> there's really a need. 
>>>>>>
>>>>>> Generally, most bindings shouldn't be using 'additionalItems' at all as 
>>>>>> all entries should be defined, but there's a few exceptions. Here, the 
>>>>>> only reasoning I see is 26 entries is a lot to write out, but that 
>>>>>> wouldn't really justify it. 
>>>>>
>>>>> Writing a lot of entries don't scary me too much, but the reason is that
>>>>> the existence of optional clock sources depends on schematics. Also, we
>>>>
>>>> Aren't you documenting SoC component, not a board? So how exactly it
>>>> depends on schematics? SoC is done or not done...
>>>>
>>>>> unable to declare dt-nodes for 'clocks' array in any generic way,
>>>>> because their declaration would depends on that what is actually
>>>>> connected to the SoC (dt-node could be "fixed-clock" with specific rate
>>>>> or something else).
>>>>
>>>> So these are clock inputs to the SoC?
>>>>
>>>
>>> Yes, possibly.
>>> Like an external crystal or a set clocks provided by an external codec
>>> where the codec is the clock master of the link.
>>>
>>> This is same case as the AXG that was discussed here:
>>> https://lore.kernel.org/linux-devicetree/20230808194811.113087-1-alexander.stein@mailbox.org/
>>>
>>> IMO, like the AXG, only the pclk is a required clock.
>>> All the others - master and slave clocks - are optional.
>>> The controller is designed to operate with grounded inputs
>> 
>> Looking again at the implementation of the controller, there is a clear
>> indication in patch 3 that the controller interface is the same as the
>> AXG and that the above statement is true.
>> > The AXG had 8 master clocks wired in. The A1 just has 5 - and 3 grounded
>> master clocks. This is why you to had to provide a mux input table to
>> skip the grounded inputs. You would not have to do so if the controller was
>> properly declared with the 8 master clock input, as it actually is.
>> 
>
> For simplicity, I could make something like this in device tree:
>
> clocks = <&clk0,
>           &clk1,
>           &clk2,
>           &clk3,
>           &clk4,
>           0,
>           0,
>           0>
> clock-names = <"mst_in0",
>                "mst_in1",
>                "mst_in2"
>                "mst_in2"
>                "mst_in3"
>                "mst_in4"
>                "mst_in5"
>                "mst_in6"
>                "mst_in7">
>
> But I don't see in the doc that the last 3 clocks are grounded to
> anywhere. It will be just community's assumption about internals of the
> controller.

Maybe so. Given how much we know about the amlogic HW, there will always be
assumptions (... and corrections). It is a fare assumption to
make. Looking at definitions for the master clocks or the TDM clocks,
you can see that the HW is same, only what is wired in has changed.

The register definition of the master clocks is still the same.
You may still put a '6' in the register, you just don't know where it
goes. Physically it may exist IMO.

I'll agree only the 5 first mst inputs are documented ATM.
Go ahead with a different interface but at least fix the names please.

>
> Anyway, I still don't understand what to do with external slv_* clocks.
> I can do the same as in example above: list slv_(s|lr)clk[0-9] in
> "clock-names" and fill the rest if "clocks" by "0" phandles.
>

You don't have to put them in the example when there is only <0> to the end.

>> It also shows that it is a bad idea to name input after what is coming
>> in (like you do with "dds_in" or "fclk_div2") instead of what they
>> actually are like in the AXG (mst0, mst1, etc ...)
>> 
>
> I agree, these are not the best names.
>
>>>
>>>>>
>>>>> By the way, I don't know any example (neither for A1 SoC nor for other
>>>>> Amlogic's SoCs) where these optional clocks are used, but they are
>>>>> allowed by hw.
>>>
>>> Those scenario exists and have been tested. There is just no dts using
>>> that upstream because they are all mostly copy of the AML ref design.
>>>
>>>>>
>>>>> This is my understanding of this controller. I hope, Jerome Brunet will
>>>>> clarify how it actually works.
>>>>
>>>
>>> I think the simpliest way to deal with this to just list all the clocks
>>> with 'minItems = 1'. It is going be hard to read with a lot of '<0>,' in
>>> the DTS when do need those slave clocks but at least the binding doc
>>> will be simple.
>>>
>>>> Best regards,
>>>> Krzysztof
>>>
>>> If you are going ahead with this, please name the file
>>> amlogic,axg-audio-clkc.yaml because this is really the first controller
>>> of the type and is meant to be documented in the same file.
>>>
>>> You are free to handle the conversion of the AXG at the same time if
>>> you'd like. It would be much appreciated if you do.
>> 
>> 


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
