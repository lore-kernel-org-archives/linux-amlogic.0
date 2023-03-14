Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173A4C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8qmdJ1WxR0eqFAxEvr6QSTgMRfc8yrNkI4EtoArV6I=; b=DYEsR0XbDPY9ZP
	s4tdp06qarxsoY3A676xcYieGRG0IycsAbRHlNdZxm9FHyBNROc2K6mCYGpixux7rXahxWgL7ONOL
	2vTo6iS0nTVi1u99uj/Qv6JahXdgJl6N9ydUUxDstnRtMhjfVtIlTCUdkZqL8BR7bJMrs10vl52o/
	OQfU5McsTpI3bRxKX8YZqdt5ZFXehH5pylOQ6ce9cWT16Zb7eZm0zkkpFBbZGJIEJtEeYJ01YHFHr
	tZfe8WMHe6kA26WgyJINOpPNz4tBPRFJBUbDtbCkzjDD6kqXEHM5H5YckUsbsmTJjCbr70eNr7N+D
	HGMy9m+uR9geiPXgNQ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7eE-00ArS6-2L;
	Tue, 14 Mar 2023 16:37:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7eC-00ArRO-2o
	for linux-amlogic@bombadil.infradead.org;
	Tue, 14 Mar 2023 16:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jlGiPxrBuoe9rTT5t5btZfai4+ZRhJj1KWzKF0d0HFU=; b=LJbwMI0ay83J4WPQSWL8g9F2f/
	/k5+GVmKZrbJUtls15Wo29qxTouuyMkXNxb4DdKhcBvCnPcuCegaMtrvocLdyoVrIpRqZUbd7+NOj
	vsHSgbyFqQTuizwxabZFDeqFmV1FMg6u8GenW3Gu7O/U/jfbPLH1EbU0odiVHgIsSdSWQanDCvv91
	ah71SavGxwqktFmg9khVId0MNgO0hegS1tQGz+6yMM1NP2+QUDdovB+bkuwwXcAR1a2YGSwdl67sp
	EasacFqm3YeCCLKbIP7lAg6VWQJG4q4A4qIUsTqgvw5Rup4GDgYwUmJz24rqxsAqClBU/wW+9Fk/W
	JPyQ2mBQ==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7e8-001q4R-2o
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 16:37:11 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eg48so5232457edb.13
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 09:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jlGiPxrBuoe9rTT5t5btZfai4+ZRhJj1KWzKF0d0HFU=;
        b=FQ/jOD6i4QQu8oqCAAp5ZGGmktZ2aOz+YkkM8ZFiMxN80MnfYP1emmP8nM7ymFNpyz
         xJYIYUbYxnc/7QnSfRk+sVAS5KzuNa1L9hqn6KyvE9zOYh8H7LmYy+MNSAYfs7zgPj7L
         ot4J620sW+6KSVfw/+kaYfsoRHI4CtDy1s+MhMyVSSiD7LAKyFmclBYkGDCow1kjyr+l
         pOYoc4R100uTMGMrnrvA0Pcjft9D+KQ+PMzbPUGaUzG5Zwby6NcEPLrPJ2ph2XhgceH3
         MktBbOUBaSfdw8pYBQWXQjU33gj+DMnjBRG87wKxifJcbEL8sl3s74LurRBgV1YcSC4D
         D64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jlGiPxrBuoe9rTT5t5btZfai4+ZRhJj1KWzKF0d0HFU=;
        b=cG00JvLcJBAEj+IdJmbUF+qzIc4oYgzb9xTHqb+hjEfpq2wxu/an4fir2WGJX7Fd56
         W3XOuutZilLQTCfEnIWhXKoVS23s2hgG8IQk2veDZdQ7Bj1mv18TyTuTDpG8MaS5Pusk
         ZmCbiCavFAogkQ4LZUlzvI85KlfDvR/lu4h8BB7UT5c7iY2l3TsWICbrizUtixOA06ct
         VNO9H8ITSqIxgS0Afot4Yyfcr1+rKjJUNflNIiXpHK/y1FQshIaTKDUIrYJYOZxrTX1l
         thaLJh1ZEFQkYq8EsCMzDQAg/P7BaGQvjQCepSRrPFSLresBuH8ybNGv8KYPd9s1AJzw
         cGCA==
X-Gm-Message-State: AO0yUKUmjj2JQ4Zbasfxj9wBPPbrPJGXEdZvfHaUfrHvd+wsW5oHcio+
	V0TvGzyJbE7E6jHoR2unMIqszQ==
X-Google-Smtp-Source: AK7set9lnU/c+UFm9vu8VIT38DOdPTI3d2yJvUCDcnXWxLpHH00EYbhYjyI9vtClCCGH+kKcraHy5w==
X-Received: by 2002:a17:906:950a:b0:92a:32ac:8f3d with SMTP id u10-20020a170906950a00b0092a32ac8f3dmr2935863ejx.66.1678811825873;
        Tue, 14 Mar 2023 09:37:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id mh1-20020a170906eb8100b008eddbd46d7esm1358056ejb.31.2023.03.14.09.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:37:05 -0700 (PDT)
Message-ID: <b9b4d33d-f325-6437-4f4d-f051d2455e2d@linaro.org>
Date: Tue, 14 Mar 2023 17:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
 <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
 <c8fecf94-2581-6cc9-955c-324efdc7c70a@linaro.org>
 <21add21d-4afe-7840-6c49-3786f82761d9@linaro.org>
 <6b7ae52c-d84d-8d08-139c-5c67ec363e85@linaro.org>
 <20230314155641.6iw5vgkrrqcx22n6@CAB-WSD-L081021>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314155641.6iw5vgkrrqcx22n6@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_163709_071802_5D4CB6DA 
X-CRM114-Status: GOOD (  18.05  )
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

On 14/03/2023 16:56, Dmitry Rokosov wrote:
> On Tue, Mar 14, 2023 at 04:40:19PM +0100, neil.armstrong@linaro.org wrote:
>> On 14/03/2023 16:37, Krzysztof Kozlowski wrote:
>>> On 14/03/2023 16:33, neil.armstrong@linaro.org wrote:
>>>>> There are many ways - depend on your driver. For example like this:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975
>>>>>
>>>>> The first argument is the clock ID (or ignore).
>>>>>
>>>>> BTW, quite likely the problem is generic to all Meson clock drivers.
>>>>
>>>> This issue about "public" non-continuous defined was already discussed at https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/
>>>>
>>>> I don't see what's different with this one.
>>>
>>> So you are aware that all undocumented clock IDs are still allowed to
>>> use in DTS and they are ABI? Changing them will be an ABI break.
>>
>> Yes of course.
>>
>> Neil
>>
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
> 
> Sorry, guys, I'm little bit confused.
> In the discussion pointed by Neil not-by-one-increment ID with public and
> private parts are acked by Krzysztof due to explicit explanation in the
> gxbb header. Have I to comment out my situation and stay it as is?

I did not NAK your solution here. I just pointed my usual remarks that
it has certain outcome and minuses (undocumented ABI). But it is OK.

> 
> BTW, I think changing IDs value would not affect logic, because
> it's not connected to driver logic 'by values', but 'by constants

You cannot change the IDs, neither their values nor the names (with
exceptions). IDs - so the numbers - are ABI.

"Constant names" - I assume you mean the names of defines - do not exist
after preprocessing, so also not really relevant here...

> names'. We can expose/hide anything from device tree bindings, it will
> not change the clk driver logic.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
