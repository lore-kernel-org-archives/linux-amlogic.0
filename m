Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA3BC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYk7GDb6XqYJ+aHZLGwKi+tyjIL4fEmXEpxx7AIwNAs=; b=XdwM7I2l1w8MDC
	h3hTnL/PJsUeOyHU2FKf0UnbB7DTRWnR2mZ2szWlF5UBt8XUM6sD1zIDHAxVSKM8VhKqIaEsTcf/s
	HDVc2bIa+heX/LOkcdtVaZe6w5rq9BXbSL9/WmEu6NtKKFKeBpoM7Lh04b6weOgMTykxysh0HtWGq
	YKyXxNDKcf/zJiGFFgqh0FgyrRVEbpoktXESE3P96U8BY3+AzVZo85qKnotMuCTc1RlfZ7Pzx10h2
	40nkQXassrSGUVasc2tbv8CXEzl6qnF2IYKKFOfpRmpdzCp7BR5y+GuMckcwbRG39URLHDlDm4YTm
	zcRnZErzhn4FEuLaPuLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM6aT-000000033oD-29ws;
	Tue, 25 Jun 2024 13:51:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM6aQ-000000033nE-2p0U
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 13:51:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42108856c33so39015265e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719323513; x=1719928313; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KTXG/FRxZ0m4qvnOPb2W46Bb/zdn6G2YXIXWD74rp1w=;
        b=oElnPj2oS/ltPo7Q6Oee9bgqVy8/rB9A1xgw45gg3uVG0c5Q8WwO7pT4bMdM/ppFLv
         l2zhXWDsy3seEPIdtLLOFYsOSwKRWG37RGBNqtRMbD7SRswOkzxGaQZIuRBqS7H8jYhb
         vcR8WoI5B/pz3j/cAIqmLeyRXcoYKQg1048/0aJrgKpxmJ8KpbzxsOJ8+QVYRFbXc+65
         aS/oNOeSIoRNQHfk4yLMyM2yW3R+c1PwaWRUvv/NJcAEoUzS8pRWYY6waETP4mxtgwOG
         Le9ZLbuXkLuIQghHxjl3AyJ6j3goDGIEltdqJpoOc22APocHQlBb6SCXiEmHmPOEkPwr
         4VeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323513; x=1719928313;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTXG/FRxZ0m4qvnOPb2W46Bb/zdn6G2YXIXWD74rp1w=;
        b=CyVr9/tGeHS/XKLat1qMgrwhutXWerZTqmr0pUmEb03KKW0THFsjWVOSgUmecadR+V
         y+f9TmyQY7PmYuF76R6IHOaJy8U7M7ylFLHxXWu3ezEzQWMgBo5YUO6/GBOyD26YF0wr
         oh4ro6sVp69YqXT6eo7kiQpYBdgiOVdH4DIJ8gCStpUPKbluHFg2Osg3Ii7hV8svqX4M
         iFN3OUBkqtSna3iRo2HIpZomQsSXAdSxyG/0emc7US150brx9JmlGS7T+tfjb5JZC/20
         ON661D3T3HmVYnhgokzlzg9ykPgVOadC3fmhll+DYYI5iW0CdCQgxa9LUrroQ6d7tGJ8
         W8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9lAyELfazZ+U2fhWh8nW8IEBNEfJC5kFIIpQAObxYAxP6WQ24ai3K9y9AIj/alTTf7oDeDtLefCccAeJaFhy6PoUN8ElMtaX2Ivz7QnoAm4=
X-Gm-Message-State: AOJu0Yw5RKuoN5ZTNwO8TYoQojdZZijQX3u1+PvrDTgYN5XRb6mBmiI+
	NtVIRZRg1YeOSv0w9bML5REunB/XsMVjjNi97EtcT+/f13ct2B9yZJHf15SpC8A=
X-Google-Smtp-Source: AGHT+IEalVLvF2V4HVuOBDYasPTatv9mBYVJq42aJr3idMXc9t+1AfV6Rij0cOM4lR1IMYrnqTV/bQ==
X-Received: by 2002:a05:600c:56cd:b0:424:8a34:9890 with SMTP id 5b1f17b1804b1-4248a349975mr68512565e9.7.1719323512709;
        Tue, 25 Jun 2024 06:51:52 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424abf622cdsm172075e9.28.2024.06.25.06.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 06:51:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,  Lars-Peter Clausen
 <lars@metafoo.de>,  Kevin Hilman <khilman@baylibre.com>,
  linux-kernel@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-iio@vger.kernel.org,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
In-Reply-To: <c092ec67-e384-411d-8885-665597547523@linaro.org> (Neil
	Armstrong's message of "Tue, 25 Jun 2024 15:18:11 +0200")
References: <20240624173105.909554-1-jbrunet@baylibre.com>
	<52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
	<1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
	<c092ec67-e384-411d-8885-665597547523@linaro.org>
Date: Tue, 25 Jun 2024 15:51:51 +0200
Message-ID: <1jv81xgmfc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_065154_850705_DBFA28BC 
X-CRM114-Status: GOOD (  26.59  )
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

On Tue 25 Jun 2024 at 15:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:

> On 25/06/2024 11:53, Jerome Brunet wrote:
>> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> 
>>> Hi,
>>>
>>> [+cc people from linux-msm]
>>>
>>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>>> system clocks.
>>>> This drivers aims to replace the one found in
>>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>>> * Access to the measurements through the IIO API:
>>>>     Easier re-use of the results in userspace and other drivers
>>>> * Controllable scale with raw measurements
>>>> * Higher precision with processed measurements
>>>> Jerome Brunet (2):
>>>>     dt-bindings: iio: frequency: add clock measure support
>>>>     iio: frequency: add amlogic clock measure support
>>>>    .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>>    drivers/iio/frequency/Kconfig                 |  15 +
>>>>    drivers/iio/frequency/Makefile                |   1 +
>>>>    drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>>    4 files changed, 868 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>>    create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>>
>>>
>>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
>> The reason why I went through the trouble of doing an IIO port is
>> because I need that for other purposes than debug. I need to to be able
>> to check a frequency from another driver. I don't see a reason to invent
>> another API when IIO provide a perfectly good one.
>> The HW does measurements. IIO seems like the best place for it.
>> For the record, I need this for a eARC support.
>> eARC has a PLL that locks on incoming stream. eARC registers show wether
>> the PLL is locked or not, but not at which rate. That information is
>> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
>> is a life saver in that case.
>
> This is a very interesting use-case, and quite weird nothing is provided
> on the eARC side.

Indeed.

>
> So yes it's definitely a valid use-case, but:
> - we should keep the debugfs interface, perhaps move it in the iio driver ?

I considered this initially but it would add a lot of boiler plate
code to provide over debugfs exactly what iio already provides over
sysfs. As you pointed out, the previous driver only provided debug
information, the debugfs interface it provided is hardly a
critical/stable one.

> - we should keep a single compatible, so simply update the current bindings with iio cells

Using a new compatible allows to split the memory region, making the
interface between DT and driver a lot easier to implement seemlessly
between old and new SoCs. Eventually it may allow to implement the duty
part too.

> - for s4 & c3, it's ok to either add a second reg entry in the bindings

Doing that for s4 and c3 only would still make a mess of offset handling
the region because duty prepend the region on old SoC. The goal is to
have an interface that seemlessly support both old and new SoCs.

>
> Neil
>
>> Everything that was available through the old driver still is, with more
>> precision and more control.
>> 
>>>
>>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>>> they chose to keep it in userspace until we find an appropriate way to expose
>>> this from the kernel the right way.
>>>
>>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>>> it's not the best way to expose those clocks.
>>>
>>> Neil
>> 

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
