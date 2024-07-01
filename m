Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA0C2BD09
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LhIWX4qKg9ZTRtTgPnU5yr8P8pOHvXVnWPOllQWiik=; b=xnUR5Sr9PT2b2jRZMDfzy1JnVh
	VYX1skPogssC1g7X5tSCLbuiMZ4vpuF8JEJhL8ZsbjLgJmEr4ruZu8yvimrRdJptgQD6cvxsjev7z
	KkrfwkBlFk0af4c32NCAtrUcHTetSARxFEElmCEARGx9tqLz1TQzZr/btYsiltDPbr3/l3ttPsw4z
	HpkSmbgyufB3dv58dIvPbvQM514bjewbDme73lfDAzFARQ6lh9uUUsI304EB1+uaIO8PeWFVpzgXd
	X1c8PO8ZQ9fS7Vr6tybj5DAZHN9hnwpsO6Gjgv9awo2llMT9HjApYcSIJXsErgxzxKPFrPkfX4obA
	vjlO/GTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD3c-00000002OWV-0BEN;
	Mon, 01 Jul 2024 09:10:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD3Y-00000002OVv-3lcj
	for linux-amlogic@lists.infradead.org;
	Mon, 01 Jul 2024 09:10:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so2753708e87.2
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Jul 2024 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719825039; x=1720429839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WmxwoN5WifjaiLHb4RF2OzomH1ffmSkrRHOoZR2aCx8=;
        b=pyvIRLVOkSrcg7V58rEK0BVtD4fa2GUPhou6+fXBQBT2YBvY8UOju9IBpQ0hhU3i7c
         ZEc8TSLAPX83OrIj05yGM6qojEmsae3TtVtD+4pzmg4hPo3g+YKMexO9B7P0et84RqHA
         TKdSGZNH0ocwUaYcnGUAWeLGBckiIXcHD56nWA2IMOC8O3tmU8bEClfcoBv/g07k+0Ic
         DJnQGhIIvT0NpLEpFaRSMQncpsDue9HIZw/6sRaq9bmbIftMrIhTijKlRaOQhWYYiKCL
         N4fzmrgWojDhCyaHyvtvnk7tFnnoIy7FzO4jB/DDYJSbrxDod0vp7NiZ+LBxOx5IiXEj
         RuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825039; x=1720429839;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WmxwoN5WifjaiLHb4RF2OzomH1ffmSkrRHOoZR2aCx8=;
        b=pa2us3zxn2xewzuEYpQIjMd3dsrC2SHArDPXpp28enqewwHptZSjQi5TbIwy6A8Vew
         uWaMRfLkFd1xO7P62d3x+NUzXa54npKtIU3ruksjWS7ww9OP55IGNKwSQqBpWxSzGget
         GzcbBm68WJllRrWrq5l6y9Xatj2vnI3kkbiWxHs8ihHxhO3ay+oPGJDjPJJyX6uqA4zl
         9BrSYi2ZVykYsINYyNwySIJ4qy4PAPx5DP/HgNqh3xNnnz+YGKU0pRRU34IgFOVLQnvx
         ed80yZ6chAnGvtbxpzn48CND1h5Rt2DN6cjntWvJmrCFjFu9PnIjOBZ78Oc4Zf8lrO2P
         RRNA==
X-Forwarded-Encrypted: i=1; AJvYcCXMEWyYJaIlP6aOU55zeSPXhmJir+JcHkTVqYio6g/FLmGhTSS4Ic6dvUMpWbflu+7RB580CeeyJGdSAyT2ohtl0IL7McGTIIBm4AIIcNoT5Jg=
X-Gm-Message-State: AOJu0YwHVkwWBZLMvz4ICsOJxbmrCVBq2lvPPeYm/624FUn+kMxi5+xF
	U2CurjBt6BR6d/G1NgOfQMqaDUKlIZwA5VzxA/ALxKmk1mFrlKHW92MfLvKVcy4=
X-Google-Smtp-Source: AGHT+IEU8xp3goGxhTEutzBiuLEdZgqoKoixVNFadzR5iUuvIJM+GQ80X/3pH/R60oEG9o4bMBlLAw==
X-Received: by 2002:a05:6512:39ca:b0:52c:e312:2082 with SMTP id 2adb3069b0e04-52e826febbamr3646811e87.54.1719825038326;
        Mon, 01 Jul 2024 02:10:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4719:99ea:652b:10d0? ([2a01:e0a:982:cbb0:4719:99ea:652b:10d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd687sm9494431f8f.14.2024.07.01.02.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 02:10:37 -0700 (PDT)
Message-ID: <bd1c0c99-e394-4ad2-bc86-a277018b3ec0@linaro.org>
Date: Mon, 1 Jul 2024 11:10:36 +0200
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
 <5da26c0e-75a7-4d5a-9eca-f88ecf369996@linaro.org>
 <1jjzi5a3ka.fsf@starbuckisacylon.baylibre.com>
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
In-Reply-To: <1jjzi5a3ka.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_021041_002098_FF54E5F4 
X-CRM114-Status: GOOD (  39.38  )
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

On 01/07/2024 11:01, Jerome Brunet wrote:
> On Mon 01 Jul 2024 at 09:41, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> On 25/06/2024 15:51, Jerome Brunet wrote:
>>> On Tue 25 Jun 2024 at 15:18, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>>> On 25/06/2024 11:53, Jerome Brunet wrote:
>>>>> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> [+cc people from linux-msm]
>>>>>>
>>>>>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>>>>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>>>>>> system clocks.
>>>>>>> This drivers aims to replace the one found in
>>>>>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>>>>>> * Access to the measurements through the IIO API:
>>>>>>>       Easier re-use of the results in userspace and other drivers
>>>>>>> * Controllable scale with raw measurements
>>>>>>> * Higher precision with processed measurements
>>>>>>> Jerome Brunet (2):
>>>>>>>       dt-bindings: iio: frequency: add clock measure support
>>>>>>>       iio: frequency: add amlogic clock measure support
>>>>>>>      .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>>>>>      drivers/iio/frequency/Kconfig                 |  15 +
>>>>>>>      drivers/iio/frequency/Makefile                |   1 +
>>>>>>>      drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>>>>>      4 files changed, 868 insertions(+)
>>>>>>>      create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>>>>>      create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>>>>>
>>>>>>
>>>>>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>>>>>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
>>>>> The reason why I went through the trouble of doing an IIO port is
>>>>> because I need that for other purposes than debug. I need to to be able
>>>>> to check a frequency from another driver. I don't see a reason to invent
>>>>> another API when IIO provide a perfectly good one.
>>>>> The HW does measurements. IIO seems like the best place for it.
>>>>> For the record, I need this for a eARC support.
>>>>> eARC has a PLL that locks on incoming stream. eARC registers show wether
>>>>> the PLL is locked or not, but not at which rate. That information is
>>>>> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
>>>>> is a life saver in that case.
>>>>
>>>> This is a very interesting use-case, and quite weird nothing is provided
>>>> on the eARC side.
>>> Indeed.
>>>
>>>>
>>>> So yes it's definitely a valid use-case, but:
>>>> - we should keep the debugfs interface, perhaps move it in the iio driver ?
>>> I considered this initially but it would add a lot of boiler plate
>>> code to provide over debugfs exactly what iio already provides over
>>> sysfs. As you pointed out, the previous driver only provided debug
>>> information, the debugfs interface it provided is hardly a
>>> critical/stable one.
>>
>> I still don't see why it could add so much boilerplate, all the tables and
>> calculation fonction would be shared, only the debugfs clk_msr_show() and
>> clk_msr_summary_show() would be kept, all the rest would be common.
>>
>> I insist, please keep the debugfs interface for debug purposes. You don't
>> want to mess with IIO when you bring up new platforms with bare minimum
>> kernels.
> 
> I don't think that is going to change anything. It's not like IIO brings
> any complexity or will be compiled out.
> 
> But since you insist, I'll add it in the next version as a separate patch.
> 
>>
>>>
>>>> - we should keep a single compatible, so simply update the current bindings with iio cells
>>> Using a new compatible allows to split the memory region, making the
>>> interface between DT and driver a lot easier to implement seemlessly
>>> between old and new SoCs. Eventually it may allow to implement the duty
>>> part too.
>>
>> It's a problem for new platforms, you can introduce the split only for the
>> new ones, the impact on code won't high enough to justify new bindings.
>>
> 
> What you are requesting will introduce two drivers providing the same
> compatible, unless you plan on removing the old one in a coordinated
> way.
> 
> That's an unncessary churn. The old driver could stay there for a
> while and platform slowly migrate. What you are requesting forcefully
> migrates every consumer, assuming the old driver is compiled out.
> 
> This is an opportunity to more correctly describe the interface.
> It does not break any DT rules, that is enough of a justification IMO.

DT describes the Hardware, I don't see how the new bindings describes better
the current hardware... tying the new bindings to a new driver is actually
against the DT rules, the bindings thing is actually to avoid that.
For PWM, bindings architecture was clearly wrong, but here, not really.

I still don't see the problem of migrating current users to the new driver
using the current compatible, really, please explain what would be the problem ?

In any case you'll only need to add the #io-channel-cells to boards that would
require frequency monitoring for eARC, for all the other boards you'll won't need it.
So this property can safely be added as optional to the current bindings.

Neil

> 
>> Neil
>>
>>>
>>>> - for s4 & c3, it's ok to either add a second reg entry in the bindings
>>> Doing that for s4 and c3 only would still make a mess of offset handling
>>> the region because duty prepend the region on old SoC. The goal is to
>>> have an interface that seemlessly support both old and new SoCs.
>>>
>>>>
>>>> Neil
>>>>
>>>>> Everything that was available through the old driver still is, with more
>>>>> precision and more control.
>>>>>
>>>>>>
>>>>>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>>>>>> they chose to keep it in userspace until we find an appropriate way to expose
>>>>>> this from the kernel the right way.
>>>>>>
>>>>>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>>>>>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>>>>>> it's not the best way to expose those clocks.
>>>>>>
>>>>>> Neil
>>>>>
>>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
