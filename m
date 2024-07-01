Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CBAC2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uv3kMhiVJ4kDeQU3UWRkOfuPYS0GChKz10Kk3aeMRqQ=; b=XnEGRgwZzA9Yua3uAgFLqTKAhp
	p4dm6bOtYq2a/yAtDQQG43NBXK+R57O4tv2co/bTtmz4VGY0e76FPyqmoDIgsNae5rXxPzrDAmPtO
	B2Eu/11CvYfPb/gthgSrmzi0FK+HZPL4FIwN06Mlfs/G5qr7hd9ULYqdNIYk0Se5MuhSYjqIRthiJ
	g3T76GksZ+ERV4kItaZlYEM/ZmRu2L/pIa6lonT50qD1j5MEJK2HR4svOwCRpq3bDJAk5IXnubF2E
	QnoIeUADyGqnNuxa0uo2Nyztma6ppsvSc+Xdo63GBYFdxZw/jKeQYYPC95sl98DYsXI2vYAyWoy6Y
	HrEgFvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBev-000000025IJ-45FQ;
	Mon, 01 Jul 2024 07:41:09 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOBes-000000025Fb-3l5i
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 07:41:08 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso27469591fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819665; x=1720424465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luwhpQx8+Zob3V/T6YJ1851XBEZCKognBMDo82oxZaA=;
        b=wJnSK1igfZ0dBi9YPLgPxebFf1YGlC76YFaoIo44o3auWAggzxyeJIcFZRYkkM70E0
         uGUUzlJwvO0Tf1CFEhSBG1DsOgRCsYNcD+GWYspV3Uz8c5Mzd2NOivd+kBllBYipzrnN
         AxNcdXYINZvb4AANNMGYSR+6kD9vuZuINdhIRuCaiC1YACH8XUmsF5oYrTpzQukqow9D
         nYds9hOGzhttujRyaVfyzBaf+DRI1IehAcLhWsfjkUFNGhuO/SbPIk0Jjt6SaaDEPztN
         XRouDQRF7++G38J++8awSG8UnkQt+Y2LKhDiCwIRzpq5k2kYjbQDgW7EDvQNMpBo7QTL
         7WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819665; x=1720424465;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=luwhpQx8+Zob3V/T6YJ1851XBEZCKognBMDo82oxZaA=;
        b=IR4SWtx5yh29627Zaro6zVIQgrvK4tnMqTp26coKdBmv0WAar84l8SXEYC31bmu1Jb
         Y8VybqbEXhUWXZGR1HoYF0Q6ovq6xHt/FtEmyf2g53GP0R3A2YmZpYSCa5CjWF2hOYfe
         2PAEf3xy+fw+P3rbGJ/upRfGzijwbmIDrog/mOgESKwO1U7dlIRPvM5nzBAAGWFL3HSF
         mVV4Ah0gHKRRfbTE1HasaE4er5nXWydRkv6BKcOwyCJa/e1ckoXm2fhx0gy28h2hcVmI
         2Kk/Rd0qDp+aslg2nQLXV8k7mHCgGPOP64aIeFmoDPjXleYBgEut52pt0Hk0wBuC/tvM
         ZGLg==
X-Forwarded-Encrypted: i=1; AJvYcCXsxY0NCaCpeLJesPskMHnMetoaVbNNSw61x5vLqR1Sgnuu5zTWYFNqvSEdwColjNdSrofcv3SimTyttqAPeEh3Lt8NszOiQN+jFVx3UAUYwz8=
X-Gm-Message-State: AOJu0Yx4N8k9TXmW2XEptT28gHCQyDyZnmaaDasB4w709KCfe8iHn6k7
	erhIDnajCK0NoooBtmAnqnwfx1pzV3btz3FWgfClCWBjCmJl432wyj8j0r3dYpk=
X-Google-Smtp-Source: AGHT+IEzuhMJAz/Pv97Qfz0wibA0VR4rH3uoXhjLiD7kH/3hRTfrPLFrntMsa8P9YcyF+7GW5WzXcQ==
X-Received: by 2002:a2e:96c6:0:b0:2ec:5644:8f85 with SMTP id 38308e7fff4ca-2ee5e3b37bdmr32247581fa.27.1719819664229;
        Mon, 01 Jul 2024 00:41:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3cf90sm140024045e9.5.2024.07.01.00.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 00:41:03 -0700 (PDT)
Message-ID: <5da26c0e-75a7-4d5a-9eca-f88ecf369996@linaro.org>
Date: Mon, 1 Jul 2024 09:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] iio: frequency: add iio support for Amlogic clock
 measure
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-iio@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20240624173105.909554-1-jbrunet@baylibre.com>
 <52fab9b5-2b44-49c0-8b90-cb2a74eb6633@linaro.org>
 <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
 <c092ec67-e384-411d-8885-665597547523@linaro.org>
 <1jv81xgmfc.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <1jv81xgmfc.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_004106_983685_8EBE9F94 
X-CRM114-Status: GOOD (  31.41  )
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

On 25/06/2024 15:51, Jerome Brunet wrote:
> On Tue 25 Jun 2024 at 15:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 25/06/2024 11:53, Jerome Brunet wrote:
>>> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>>> Hi,
>>>>
>>>> [+cc people from linux-msm]
>>>>
>>>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>>>> system clocks.
>>>>> This drivers aims to replace the one found in
>>>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>>>> * Access to the measurements through the IIO API:
>>>>>      Easier re-use of the results in userspace and other drivers
>>>>> * Controllable scale with raw measurements
>>>>> * Higher precision with processed measurements
>>>>> Jerome Brunet (2):
>>>>>      dt-bindings: iio: frequency: add clock measure support
>>>>>      iio: frequency: add amlogic clock measure support
>>>>>     .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>>>     drivers/iio/frequency/Kconfig                 |  15 +
>>>>>     drivers/iio/frequency/Makefile                |   1 +
>>>>>     drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>>>     4 files changed, 868 insertions(+)
>>>>>     create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>>>     create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>>>
>>>>
>>>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>>>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
>>> The reason why I went through the trouble of doing an IIO port is
>>> because I need that for other purposes than debug. I need to to be able
>>> to check a frequency from another driver. I don't see a reason to invent
>>> another API when IIO provide a perfectly good one.
>>> The HW does measurements. IIO seems like the best place for it.
>>> For the record, I need this for a eARC support.
>>> eARC has a PLL that locks on incoming stream. eARC registers show wether
>>> the PLL is locked or not, but not at which rate. That information is
>>> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
>>> is a life saver in that case.
>>
>> This is a very interesting use-case, and quite weird nothing is provided
>> on the eARC side.
> 
> Indeed.
> 
>>
>> So yes it's definitely a valid use-case, but:
>> - we should keep the debugfs interface, perhaps move it in the iio driver ?
> 
> I considered this initially but it would add a lot of boiler plate
> code to provide over debugfs exactly what iio already provides over
> sysfs. As you pointed out, the previous driver only provided debug
> information, the debugfs interface it provided is hardly a
> critical/stable one.

I still don't see why it could add so much boilerplate, all the tables and
calculation fonction would be shared, only the debugfs clk_msr_show() and
clk_msr_summary_show() would be kept, all the rest would be common.

I insist, please keep the debugfs interface for debug purposes. You don't
want to mess with IIO when you bring up new platforms with bare minimum
kernels.

> 
>> - we should keep a single compatible, so simply update the current bindings with iio cells
> 
> Using a new compatible allows to split the memory region, making the
> interface between DT and driver a lot easier to implement seemlessly
> between old and new SoCs. Eventually it may allow to implement the duty
> part too.

It's a problem for new platforms, you can introduce the split only for the
new ones, the impact on code won't high enough to justify new bindings.

Neil

> 
>> - for s4 & c3, it's ok to either add a second reg entry in the bindings
> 
> Doing that for s4 and c3 only would still make a mess of offset handling
> the region because duty prepend the region on old SoC. The goal is to
> have an interface that seemlessly support both old and new SoCs.
> 
>>
>> Neil
>>
>>> Everything that was available through the old driver still is, with more
>>> precision and more control.
>>>
>>>>
>>>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>>>> they chose to keep it in userspace until we find an appropriate way to expose
>>>> this from the kernel the right way.
>>>>
>>>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>>>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>>>> it's not the best way to expose those clocks.
>>>>
>>>> Neil
>>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
