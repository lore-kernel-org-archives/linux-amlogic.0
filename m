Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2746C2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBH51sJkjubQxnzXxx1Stc103c7jU2rIggtinWJuKJM=; b=Q/U6N1WnQV385UneF/VLbutF1p
	zf6xHlye6p77lnlqRpUZz2T1kPfI/K1Eo+dsdjR7xSBicKIWX/pS9eipWNguquh6ia1gkqc/Qduq9
	0sYwfPoOJGc10dPvYAYREhMm8OSgrGeJSEc8kqrfmkRc6uls1kTYwLILuOHQf4Y4XBdi65kz2U0xq
	Xy12mHErxSWMSmdLYOuOgZAmaSvrcvml/rd7+BpzKL4P4Qshn9MrnhkfGwbA1sLDQAVbAK5Ofxn/U
	ZQPbx9dZ8AUbCjbiituOgv2Gwi8SCGJbVuJWtnF9W5nNDd7f+y57dZORiR+4CX1m+pJvBanpVzXjw
	6U61q7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM63v-00000002vwV-3xfi;
	Tue, 25 Jun 2024 13:18:19 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM63t-00000002vw0-1boE
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 13:18:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so253992e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719321495; x=1719926295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uefSQG/mxFIjK0TTS7sVu9h46rtrTN9wB4tex/yXkcs=;
        b=PeHlxm7ugqqFEDkzl9Qd7wHk4qK2ifhbrwKdka6FMjWOjvLA1X66d9KERbyJNFri1G
         tkNm2GiVNNZLTSwKCVpZPSMo+pFMuaZsqpS85HUueTd3dUGQ7P6fj04t8Cr7+2TqeGI5
         91K5fDQbd0/2snYL8XvMcLAZ6FPjYmiCaVSq4rjucAyD4Q/W4oBtNvUjYCgbNzjYAyy0
         s7Gr4rvfA+x/IiHD3pBtU0vno7ZriWQ4Q4apvwkTvMmaLjFfCZarYRsF8TiAhTFxDfgV
         E7D2UPgnEw+DbBQnyquJBCL3KG65GLaMMcwe9U1PpmC4WFhtTz9AyJn/RdPmUBWyqBm5
         uHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719321495; x=1719926295;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uefSQG/mxFIjK0TTS7sVu9h46rtrTN9wB4tex/yXkcs=;
        b=c9q38hXVbM75c1RiONlETXzOuH6c8nUe7rJ/UjMxw0Fu5f7QHOV2/1IzISacs1EIJn
         GcTPUozDx4LYcL6c9bgr6hASuMbKB1hC9kqD95vqEmsoLacxZy4qJQAahlc7iiXu8kK2
         VQoVHO63wg00pAMAn6ozWZyU2MLAoi+JAAJxMU9WfuWo6LiXxvjCQRpo2n0+LkB9NLco
         VmtMMHE6vMlxSo+TiaTgsj16PJ4UdA3jnp4hync70AixE5XKyyagIIF19e7XTq09VQOp
         bjCj9znsPhaAEhdvVC7SUewSOeDCLAZ77ITwZxTQuXG+dK23qat7bk+JMFcijbTJyWTU
         1FTA==
X-Forwarded-Encrypted: i=1; AJvYcCWe8miDXPsoHqPCwII2h28mmRIWQD7ZYASKMf7tdvLGOwkNQJwWkpSvwIMoZ12mH9A/7WhfcKCRIjRPuyzNIUuwCAcepy9oDFVcTkSBtxY7PXs=
X-Gm-Message-State: AOJu0YxqXyVYBr+5dRQSId2TLyjCzjJtRylnJDprKpo6xj/2sOR4afqn
	55kYDkXE5FIKHAQ/+0/b3S1jksfJVocPn7PSPos/2O12V9y6Hm7gYDLhSTJkkXc=
X-Google-Smtp-Source: AGHT+IEnTpTZ2IlLjKyNQrP0ZdAcA/qO6OAOd4d+supPVqo5E7/xG28f25nQaSpGRJR8gbOuvMWNUA==
X-Received: by 2002:a05:6512:5cf:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-52ce063e3f0mr4908932e87.13.1719321494995;
        Tue, 25 Jun 2024 06:18:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a? ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d208b4asm210778585e9.29.2024.06.25.06.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 06:18:14 -0700 (PDT)
Message-ID: <c092ec67-e384-411d-8885-665597547523@linaro.org>
Date: Tue, 25 Jun 2024 15:18:11 +0200
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
In-Reply-To: <1jzfr9gxh4.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_061817_584839_33497142 
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

On 25/06/2024 11:53, Jerome Brunet wrote:
> On Tue 25 Jun 2024 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> Hi,
>>
>> [+cc people from linux-msm]
>>
>> On 24/06/2024 19:31, Jerome Brunet wrote:
>>> Add support for the HW found in most Amlogic SoC dedicated to measure
>>> system clocks.
>>> This drivers aims to replace the one found in
>>> drivers/soc/amlogic/meson-clk-measure.c with following improvements:
>>> * Access to the measurements through the IIO API:
>>>     Easier re-use of the results in userspace and other drivers
>>> * Controllable scale with raw measurements
>>> * Higher precision with processed measurements
>>> Jerome Brunet (2):
>>>     dt-bindings: iio: frequency: add clock measure support
>>>     iio: frequency: add amlogic clock measure support
>>>    .../iio/frequency/amlogic,clk-msr-io.yaml     |  50 ++
>>>    drivers/iio/frequency/Kconfig                 |  15 +
>>>    drivers/iio/frequency/Makefile                |   1 +
>>>    drivers/iio/frequency/amlogic-clk-msr-io.c    | 802 ++++++++++++++++++
>>>    4 files changed, 868 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/iio/frequency/amlogic,clk-msr-io.yaml
>>>    create mode 100644 drivers/iio/frequency/amlogic-clk-msr-io.c
>>>
>>
>> While I really appreciate the effort, and the code looks cool, the clkmsr is really
>> a debug tool, and I'm not sure IIO is the right place for such debug tool ?
> 
> The reason why I went through the trouble of doing an IIO port is
> because I need that for other purposes than debug. I need to to be able
> to check a frequency from another driver. I don't see a reason to invent
> another API when IIO provide a perfectly good one.
> 
> The HW does measurements. IIO seems like the best place for it.
> 
> For the record, I need this for a eARC support.
> eARC has a PLL that locks on incoming stream. eARC registers show wether
> the PLL is locked or not, but not at which rate. That information is
> needed in ASoC. Fortunately the eARC PLL is one of measured clock, which
> is a life saver in that case.

This is a very interesting use-case, and quite weird nothing is provided
on the eARC side.

So yes it's definitely a valid use-case, but:
- we should keep the debugfs interface, perhaps move it in the iio driver ?
- we should keep a single compatible, so simply update the current bindings with iio cells
- for s4 & c3, it's ok to either add a second reg entry in the bindings

Neil

> 
> Everything that was available through the old driver still is, with more
> precision and more control.
> 
>>
>> There's almost the same interface on qcom SoCs (https://github.com/linux-msm/debugcc) but
>> they chose to keep it in userspace until we find an appropriate way to expose
>> this from the kernel the right way.
>>
>> If it enabled us to monitor a frequency input for a product use-case, IIO would be
>> the appropriate interface, but AFAIK it's only internal clocks and thus I'm worried
>> it's not the best way to expose those clocks.
>>
>> Neil
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
