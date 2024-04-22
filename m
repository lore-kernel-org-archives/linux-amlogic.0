Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FA5C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHe4V8YI6+ERYRvh4eFL3c/wdGjeG0/k98XJi41HgL8=; b=Idg137WX5/umB5
	8LU3/7hCOBxpmVjpa66/rmHmUQruvi29YG/7S3olfFzIzO+dq7s9w+2L8+h8CbLdlZUtdoNEM4V5b
	/TENaY2k3IoK6dEHVF16ncyGJjc7125nvWMUB3rQO7cFZq1wUHPwFTKnDjh7fF8pxMv0rp87tWd38
	EgEet4RhaNbU3nyiMgYthqyMKsMz9vzkKqg/yqf47xVnhU0PX0dZHxBmxa9JyB0JL2l9bwnlga2D0
	b11dmWv9vLzaH6x5rrDHppawxELt0JOuGvm2bp+BusZsRhs07tV2Xgvv2eZeUNUob8jjhGN7ssEGN
	kzwrlev7UK6AQZatPc7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoHo-0000000CTMu-3OJ5;
	Mon, 22 Apr 2024 07:40:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoHj-0000000CTLo-3Tdw
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 07:40:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-419fc79e4dcso7642735e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713771616; x=1714376416; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QE+BamrWTuLTpWa6qXzuznIbfPLHvLIlFCqgFnP4XM4=;
        b=b0QtKJlUOx0fnnFkjVweE7sYNt/boWt5TSmLIhkBdNLYC3/XIvyUZeRGifvKzxU1FQ
         oQfdMAVjhGtDDDnNX+YNUpooeqsF8Ki6r3lTuz1r4pdTPrvH8R4dLT3ZDw69AQE4qYMA
         CLwrZsALurRSrpd17cYL0BUSSl7okiwAgzawfmBgJ05W7jvzoS7iFMxEPszVKuA5HBw+
         XHKImlEb8VCprtbIbFXI64vBzBVDdTyEk0ZlCQ9dLPBQidd/ukBPJE6Zpb2g3rKOnT5i
         dWCKQp/1ZxmeLzxgb5CX3PnA51XoSxAvuym7+obhm9NCm5SNVdRXc7944d1olaQjqnFG
         5RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771616; x=1714376416;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QE+BamrWTuLTpWa6qXzuznIbfPLHvLIlFCqgFnP4XM4=;
        b=gCfHz9Up8Va666yFlHP5rG/UN9UcWYtdzatsef/mrE4xA/uGKPSa+eG/4dPT/posd/
         QoPpxkRneFOtVuWG4H/5Dy99I3W8vH5qZN3z6Tz70HADZWKFvthfmlsLNqR9S04RLlpG
         tI9R0EISSSK/L+zkI+6iQOu8rQvcVttU4H9YPWVtFClt/VjjlXPwWOVWIYXez7S5NweD
         bX8VX8CHqmNkyq/ps5fY6UxFBQiIFYWULHzIrccXphSiG6eEMIoDlszgMJ+QwztAlCwV
         YKBvaGJXskJu97lKpb7STXHNyAqJ5ErmY8a2tBIT9C3ooNUOExEeApx+kblLgQEOuceI
         8iog==
X-Forwarded-Encrypted: i=1; AJvYcCXnOhDFDPf+Gg8rFKnK9OpUMk1kg/g/7rmFeKcVe8tGgohROUU1Fum6me18ePmw2UMDQ621Ptv2weCk6bRxTE/6GY25Sgp51KFx4MaD3fSJ5V0=
X-Gm-Message-State: AOJu0Yyui+DXwT6UUU4uij2RdXVsDgsdyuHWNp2NsieGbegIUlSx48/S
	Zr2pY2Zni67UuiJyd+WbWQKw5n02f6FfBtTJzo7c0Q66WfboPpgNKwO/kwPiDEg=
X-Google-Smtp-Source: AGHT+IG1GxMcmf9NdFOYPr777X3p7JMNSnBLkFZFuq+TgYqkM9gLohUFhW5rZ49xsD+geaucH5c0gg==
X-Received: by 2002:adf:fd0c:0:b0:343:f662:18f8 with SMTP id e12-20020adffd0c000000b00343f66218f8mr4577170wrr.63.1713771615818;
        Mon, 22 Apr 2024 00:40:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b0034b19cb1531sm1609899wrw.59.2024.04.22.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 00:40:15 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <20240419210949.GA3979121-robh@kernel.org>
 <b86f1058-da53-4a9c-bc12-e7297351b482@salutedevices.com>
 <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>, Rob Herring
 <robh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Date: Mon, 22 Apr 2024 09:16:01 +0200
In-reply-to: <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
Message-ID: <1jle55c0bl.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_004019_982326_C8847EF4 
X-CRM114-Status: GOOD (  25.41  )
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


On Sun 21 Apr 2024 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 20/04/2024 18:15, Jan Dakinevich wrote:
>> 
>> 
>> On 4/20/24 00:09, Rob Herring wrote:
>>> On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
>>>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>>>
>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>> ---
>>>>
>>>> This controller has 6 mandatory and up to 20 optional clocks. To describe
>>>> this, I use 'additionalItems'. It produces correct processed-schema.json:
>>>>
>>>>   "clock-names": {
>>>>       "maxItems": 26,
>>>>       "items": [
>>>>           {
>>>>               "const": "pclk"
>>>>           },
>>>>           {
>>>>               "const": "dds_in"
>>>>           },
>>>>           {
>>>>               "const": "fclk_div2"
>>>>           },
>>>>           {
>>>>               "const": "fclk_div3"
>>>>           },
>>>>           {
>>>>               "const": "hifi_pll"
>>>>           },
>>>>           {
>>>>               "const": "xtal"
>>>>           }
>>>>       ],
>>>>       "additionalItems": {
>>>>           "oneOf": [
>>>>               {
>>>>                   "pattern": "^slv_sclk[0-9]$"
>>>>               },
>>>>               {
>>>>                   "pattern": "^slv_lrclk[0-9]$"
>>>>               }
>>>>           ]
>>>>       },
>>>>       "type": "array",
>>>>       "minItems": 6
>>>>   },
>>>>
>>>> and it behaves as expected. However, the checking is followed by
>>>> complaints like this:
>>>>
>>>>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>>>>
>>>> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
>>>> do it right?
>>>
>>> The meta-schemas are written both to prevent nonsense that json-schema 
>>> allows by default (e.g additionalitems (wrong case)) and constraints to 
>>> follow the patterns we expect. I'm happy to loosen the latter case if 
>>> there's really a need. 
>>>
>>> Generally, most bindings shouldn't be using 'additionalItems' at all as 
>>> all entries should be defined, but there's a few exceptions. Here, the 
>>> only reasoning I see is 26 entries is a lot to write out, but that 
>>> wouldn't really justify it. 
>> 
>> Writing a lot of entries don't scary me too much, but the reason is that
>> the existence of optional clock sources depends on schematics. Also, we
>
> Aren't you documenting SoC component, not a board? So how exactly it
> depends on schematics? SoC is done or not done...
>
>> unable to declare dt-nodes for 'clocks' array in any generic way,
>> because their declaration would depends on that what is actually
>> connected to the SoC (dt-node could be "fixed-clock" with specific rate
>> or something else).
>
> So these are clock inputs to the SoC?
>

Yes, possibly.
Like an external crystal or a set clocks provided by an external codec
where the codec is the clock master of the link.

This is same case as the AXG that was discussed here:
https://lore.kernel.org/linux-devicetree/20230808194811.113087-1-alexander.stein@mailbox.org/

IMO, like the AXG, only the pclk is a required clock.
All the others - master and slave clocks - are optional.
The controller is designed to operate with grounded inputs

>> 
>> By the way, I don't know any example (neither for A1 SoC nor for other
>> Amlogic's SoCs) where these optional clocks are used, but they are
>> allowed by hw.

Those scenario exists and have been tested. There is just no dts using
that upstream because they are all mostly copy of the AML ref design.

>> 
>> This is my understanding of this controller. I hope, Jerome Brunet will
>> clarify how it actually works.
>

I think the simpliest way to deal with this to just list all the clocks
with 'minItems = 1'. It is going be hard to read with a lot of '<0>,' in
the DTS when do need those slave clocks but at least the binding doc
will be simple.

> Best regards,
> Krzysztof

If you are going ahead with this, please name the file
amlogic,axg-audio-clkc.yaml because this is really the first controller
of the type and is meant to be documented in the same file.

You are free to handle the conversion of the AXG at the same time if
you'd like. It would be much appreciated if you do.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
