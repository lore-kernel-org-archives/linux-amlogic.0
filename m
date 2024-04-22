Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99941C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 08:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jd6oCqyrNTdBOAfcdDzOxbmHb5t+ZpuBuy1QLMxTL2A=; b=UE6pXR/3t1TdKb
	Qt5+qJhXvgEAoFrCwg2rv6GisGkn9lr7wYEVeOuDd5ECfSN3lnMiCwpaVH9u2ehbC3uICW17PxHdD
	RxTwrsMnmq+kD+vXz08laS86gQwWpmMNsS0OpyBqqa1FuihOnrrbpoK72Sg6Dt15gNXOpDKgSfHmC
	FzWyGsliz9l9X6cCHxR+qXdpNZ9SCJCvQ3gTrZgdq4LzDqzuClcT06HT8oeehay5VyNIqgFERi1xe
	7WV3XnrEo9bXF5AaBZ8L6CquClAM58eQ9DZl0K7j+wshxo3p5gAjnYP6R5uBWEjqzyQvtuLByCb7Z
	eupmWYuGFd4abyFXA1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoit-0000000CZIW-34dk;
	Mon, 22 Apr 2024 08:08:23 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryoiq-0000000CZF5-0ETP
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Apr 2024 08:08:21 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41a77836f16so2441285e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 22 Apr 2024 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713773297; x=1714378097; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8C4BLckR86w7PgEOSZT9fU6K8kU4TqYHyw+2yRDa35Q=;
        b=C80n2x19uT8GHnP3lYYNpfsPdDXrzBeT/EsZ+9PcYZNAzjoSFs1gJe3SbXV2Rz8WYh
         2BYw6eeGqX2ljPw/qSeqjPe8M3dypyI2nhhAmBdwegzsnAhrMTSEc0zW31FIW8A8dNma
         Q/E9dieXcnhttzCeoOd+p5m5nWtpPvBJTpcDbeJ7APZPnnfIsk9C9C6w4CRrkvJEtoWG
         dUocn0++2YQNX6ahYXr9Sy9dru/x35sZy1jno197wTo0/+uutWOQZk877R4OQ56+2m5S
         vY5CO9yc9cfj5waIWCfGu3HG7P8jOiHkazCttGIrDmLCvjal1hDnGGW8ohG79Oq5du8i
         Y5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713773297; x=1714378097;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8C4BLckR86w7PgEOSZT9fU6K8kU4TqYHyw+2yRDa35Q=;
        b=M7sdHuHtoVwRYh+OtdoNqdAYLUaiDEXoYjoTj5eJtKyKQ2Q4qbQT+cTnFzn3gAps3l
         SL4bmmNAAJYBo5OcQsv/Tuj9D2ziw9ji7QXo57K21azlOPfxT30T1L4dyVvi8TxZsieq
         vxJsz+gzAljmgQd1yb6gDE7XANCLlaR5oEDOUoC9edKo9yI3dob5GPf+By9UwoOc6hW3
         MyxPPGsU4mwwPimBmB6exbFyhMEiUcUS09fsoxG5Nemycwnfmi8PCRJgDoseOJPoWbde
         BoXll6hZZ7jugrcJ/RdIYearnsC883ZoHXHRmpLEEE7nv0HiT+sLssSagEH5FLcfQF7z
         EjjA==
X-Forwarded-Encrypted: i=1; AJvYcCUXOnpEFV9oqESCKtTc/zEhLKznHN9XhYUdfcr1ac6ATYeJJgGJKd8vqKBT8HUdDHn3m0WTxhHkHJxToR6BL9R87nuzFvuoDzFuZDcwNF5RWsU=
X-Gm-Message-State: AOJu0YxHILKFwXVtgHDE2q75MsRzLRJqY+id/l9t/3AdeHbXk55HVWI5
	KeoVYBIBlzyQ3wB3p8Fe/7q+hFiNXEH2BVPUQqBMqinAL3+ep9SDipDHnoKiMKA=
X-Google-Smtp-Source: AGHT+IHBRDMQwKvOZxdsZviBHLEtcpsSuo2S70D3ioZlID4dj7ckRfnd2O9nFp1K9jnxFnj/vmplIg==
X-Received: by 2002:a05:600c:a11:b0:418:f86a:5468 with SMTP id z17-20020a05600c0a1100b00418f86a5468mr8001096wmp.21.1713773296725;
        Mon, 22 Apr 2024 01:08:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a619:ccb0:5f40:262c])
        by smtp.gmail.com with ESMTPSA id u18-20020a05600c19d200b0041896d2a05fsm15566259wmq.5.2024.04.22.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 01:08:16 -0700 (PDT)
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <20240419210949.GA3979121-robh@kernel.org>
 <b86f1058-da53-4a9c-bc12-e7297351b482@salutedevices.com>
 <48e9f035-390b-40c9-a3ad-49880c0b972d@kernel.org>
 <1jle55c0bl.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jan Dakinevich
 <jan.dakinevich@salutedevices.com>, Rob Herring <robh@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Michael Turquette
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
Date: Mon, 22 Apr 2024 09:57:30 +0200
In-reply-to: <1jle55c0bl.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jzftlakgg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_010820_122332_5970FA3A 
X-CRM114-Status: GOOD (  35.35  )
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


On Mon 22 Apr 2024 at 09:16, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Sun 21 Apr 2024 at 20:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>> On 20/04/2024 18:15, Jan Dakinevich wrote:
>>> 
>>> 
>>> On 4/20/24 00:09, Rob Herring wrote:
>>>> On Fri, Apr 19, 2024 at 03:58:10PM +0300, Jan Dakinevich wrote:
>>>>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>>>>
>>>>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>>>>> ---
>>>>>
>>>>> This controller has 6 mandatory and up to 20 optional clocks. To describe
>>>>> this, I use 'additionalItems'. It produces correct processed-schema.json:
>>>>>
>>>>>   "clock-names": {
>>>>>       "maxItems": 26,
>>>>>       "items": [
>>>>>           {
>>>>>               "const": "pclk"
>>>>>           },
>>>>>           {
>>>>>               "const": "dds_in"
>>>>>           },
>>>>>           {
>>>>>               "const": "fclk_div2"
>>>>>           },
>>>>>           {
>>>>>               "const": "fclk_div3"
>>>>>           },
>>>>>           {
>>>>>               "const": "hifi_pll"
>>>>>           },
>>>>>           {
>>>>>               "const": "xtal"
>>>>>           }
>>>>>       ],
>>>>>       "additionalItems": {
>>>>>           "oneOf": [
>>>>>               {
>>>>>                   "pattern": "^slv_sclk[0-9]$"
>>>>>               },
>>>>>               {
>>>>>                   "pattern": "^slv_lrclk[0-9]$"
>>>>>               }
>>>>>           ]
>>>>>       },
>>>>>       "type": "array",
>>>>>       "minItems": 6
>>>>>   },
>>>>>
>>>>> and it behaves as expected. However, the checking is followed by
>>>>> complaints like this:
>>>>>
>>>>>   Documentation/devicetree/bindings/clock/amlogic,a1-audio-clkc.yaml: properties:clock-names:additionalItems: {'oneOf': [{'pattern': '^slv_sclk[0-9]$'}, {'pattern': '^slv_lrclk[0-9]$'}]} is not of type 'boolean'
>>>>>
>>>>> And indeed, 'additionalItems' has boolean type in meta-schema. So, how to
>>>>> do it right?
>>>>
>>>> The meta-schemas are written both to prevent nonsense that json-schema 
>>>> allows by default (e.g additionalitems (wrong case)) and constraints to 
>>>> follow the patterns we expect. I'm happy to loosen the latter case if 
>>>> there's really a need. 
>>>>
>>>> Generally, most bindings shouldn't be using 'additionalItems' at all as 
>>>> all entries should be defined, but there's a few exceptions. Here, the 
>>>> only reasoning I see is 26 entries is a lot to write out, but that 
>>>> wouldn't really justify it. 
>>> 
>>> Writing a lot of entries don't scary me too much, but the reason is that
>>> the existence of optional clock sources depends on schematics. Also, we
>>
>> Aren't you documenting SoC component, not a board? So how exactly it
>> depends on schematics? SoC is done or not done...
>>
>>> unable to declare dt-nodes for 'clocks' array in any generic way,
>>> because their declaration would depends on that what is actually
>>> connected to the SoC (dt-node could be "fixed-clock" with specific rate
>>> or something else).
>>
>> So these are clock inputs to the SoC?
>>
>
> Yes, possibly.
> Like an external crystal or a set clocks provided by an external codec
> where the codec is the clock master of the link.
>
> This is same case as the AXG that was discussed here:
> https://lore.kernel.org/linux-devicetree/20230808194811.113087-1-alexander.stein@mailbox.org/
>
> IMO, like the AXG, only the pclk is a required clock.
> All the others - master and slave clocks - are optional.
> The controller is designed to operate with grounded inputs

Looking again at the implementation of the controller, there is a clear
indication in patch 3 that the controller interface is the same as the
AXG and that the above statement is true.

The AXG had 8 master clocks wired in. The A1 just has 5 - and 3 grounded
master clocks. This is why you to had to provide a mux input table to
skip the grounded inputs. You would not have to do so if the controller was
properly declared with the 8 master clock input, as it actually is.

It also shows that it is a bad idea to name input after what is coming
in (like you do with "dds_in" or "fclk_div2") instead of what they
actually are like in the AXG (mst0, mst1, etc ...)

>
>>> 
>>> By the way, I don't know any example (neither for A1 SoC nor for other
>>> Amlogic's SoCs) where these optional clocks are used, but they are
>>> allowed by hw.
>
> Those scenario exists and have been tested. There is just no dts using
> that upstream because they are all mostly copy of the AML ref design.
>
>>> 
>>> This is my understanding of this controller. I hope, Jerome Brunet will
>>> clarify how it actually works.
>>
>
> I think the simpliest way to deal with this to just list all the clocks
> with 'minItems = 1'. It is going be hard to read with a lot of '<0>,' in
> the DTS when do need those slave clocks but at least the binding doc
> will be simple.
>
>> Best regards,
>> Krzysztof
>
> If you are going ahead with this, please name the file
> amlogic,axg-audio-clkc.yaml because this is really the first controller
> of the type and is meant to be documented in the same file.
>
> You are free to handle the conversion of the AXG at the same time if
> you'd like. It would be much appreciated if you do.


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
