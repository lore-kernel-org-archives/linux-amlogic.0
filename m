Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF5AC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Mar 2023 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10vRh2bdttgbyr3XopuJhtDwhjSev50pyH/IKM5Iojw=; b=L17mOWlNNEN58O
	E/12pdIDyjp3dzDkQZhSC9EwqAgBDPRt3jxQ2oyw6BR3O6WF6k3oOpm7BvplYJRkTNZq3PHGYKOWA
	sUBwdHD6vTdRSz0o+kUM65Ii4TpAdj/VKjkrcnPXyG5oiwvI5fv1ZoFns7VMowCaTBO3DIUsJV0Th
	MjkgBE0lumlzlFf3RzCcSt14L8SH8KDKDJec804fqooxhSKkSotjzvAKEWC769QBUXzuXsDbrNpiB
	t7FWGp0l8m3HrxAXo47lq4HM9+uxzV/TKlZzUOj6P4npWL9f4DRAQeIsrkZXOkHNVio3p1/JnPIcs
	anSOfkTtQPp9gd2ht7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6Qz-00AZrC-24;
	Tue, 14 Mar 2023 15:19:29 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc6Qw-00AZq7-2j
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Mar 2023 15:19:28 +0000
Received: by mail-ed1-x533.google.com with SMTP id eh3so7571247edb.11
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Mar 2023 08:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678807164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WRpNQYPj8YUnb7ACu0Ig19uqCjhxtAieKpvbmH1gpQ=;
        b=WO/bAMiS1G9ZfN7Q6edDyk/aRa4CNgthvYuMmh23Q3wxPq6BNC0NQJ+VxXfB7CGvnN
         XQGwbnGacTpGdDT13czlqVLffdyPB5J4ArpRE+lNqbfGxGg+DLEaoXaYkreu+Y3Y7FpV
         iGblHAuboZ80NHV5gSE2mubXjpWui74+boqP8bDc1tqMBZhFnSAyJEK5SMxefMSC/8Ta
         mcEtkfKRZcYLABK2aCrCOkmJxEZif7zqyEc2sjah5iOAaetuFkGR07j3oqt7rmTn0Jyx
         xDkWhSBbRYDIl62li20Bd48mGIBdm5vrJXXCgnNFr4uXIrjTK6L6ghQ4n4prZ4l0JodU
         dcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WRpNQYPj8YUnb7ACu0Ig19uqCjhxtAieKpvbmH1gpQ=;
        b=5MPB+T1PPllzcnjjsqHk4d30avpuKycWfA+hyULRhMrwCoyKefRYlnhZcKwxi9YBlz
         brLDnNZp1x0zR9xYPL0n7kz/5lix6/UHxLPXMgSldUmj9Y8Whnd8uTvA0Mhe60RX0bUs
         yYavFOvebsnf8UEBM5tPNnnXPq6bWHzSkwI/di40ElOSqPeoni1tE8Hs7ZjGv86LITKn
         qg/TusidUnlPmh/qpIhgY6z3OrYQOdCsisY0vKkNA+AgK+QANn+ofcr67JkfqAnR138J
         W9kPilsaN3q+rbNVuU0SuxuDroULAXM+qDIDzrC1uyKyGmZLBeeM0VLIjRF4iJMGlgbh
         +8Qg==
X-Gm-Message-State: AO0yUKWHNZO1Jpp5tlb9djS2zVCPnfpsKH+EjORsR/Yi9WosF2uW36+T
	9NOSFYfFF8vG6I4UkHsTY0zDOA==
X-Google-Smtp-Source: AK7set9WFmX0z0AGnNuSMHFmGviyUfj6MQ2P63ueoNpOn2QDL0TiZlGuXF5XHv6Xd76dY313a+U/+w==
X-Received: by 2002:a17:906:25c5:b0:8af:5403:992d with SMTP id n5-20020a17090625c500b008af5403992dmr2574839ejb.28.1678807164560;
        Tue, 14 Mar 2023 08:19:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709061e1100b00922547486f9sm1286953ejj.146.2023.03.14.08.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 08:19:24 -0700 (PDT)
Message-ID: <9d176288-cd7c-7107-e180-761e372a2b6e@linaro.org>
Date: Tue, 14 Mar 2023 16:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 3/5] dt-bindings: clock: meson: add A1 PLL and
 Peripherals clkcs bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230313201259.19998-1-ddrokosov@sberdevices.ru>
 <20230313201259.19998-4-ddrokosov@sberdevices.ru>
 <ffebef1d-8447-181b-1890-3e638d399c62@linaro.org>
 <20230314114825.yiv4vcszr6b7m45w@CAB-WSD-L081021>
 <2d9297e9-dab7-9615-3859-79b3b2980d9a@linaro.org>
 <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314150107.mwcglcu2jv4ixy3r@CAB-WSD-L081021>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_081926_899852_6871185D 
X-CRM114-Status: GOOD (  41.47  )
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

On 14/03/2023 16:01, Dmitry Rokosov wrote:
> On Tue, Mar 14, 2023 at 03:05:48PM +0100, Krzysztof Kozlowski wrote:
>> On 14/03/2023 12:48, Dmitry Rokosov wrote:
>>> On Tue, Mar 14, 2023 at 12:28:40PM +0100, Krzysztof Kozlowski wrote:
>>>> On 13/03/2023 21:12, Dmitry Rokosov wrote:
>>>
>>> [...]
>>>
>>>>> +#define CLKID_SPIFC		84
>>>>> +#define CLKID_USB_BUS		85
>>>>> +#define CLKID_SD_EMMC		86
>>>>> +#define CLKID_PSRAM		87
>>>>> +#define CLKID_DMC		88
>>>>
>>>> And what is here? Between 88 and 121?
>>>>
>>>
>>> Explained below.
>>>
>>>>> +#define CLKID_GEN_SEL		121
>>>>> +
>>>>> +#endif /* __A1_CLKC_H */
>>>>> diff --git a/include/dt-bindings/clock/amlogic,a1-pll-clkc.h b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>>>>> new file mode 100644
>>>>> index 000000000000..8e97d3fb9d30
>>>>> --- /dev/null
>>>>> +++ b/include/dt-bindings/clock/amlogic,a1-pll-clkc.h
>>>>> @@ -0,0 +1,20 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>>
>>>> I found in changelog:
>>>> "fix license issue, it's GPL-2.0+ only in the current version"
>>>> and I do not understand.
>>>>
>>>> The license is wrong, so what did you fix?
>>>>
>>>
>>> Sorry don't get you. Why is it wrong?
>>
>> Run checkpatch - it will tell you why wrong. The license is not correct.
>> This is part of binding and should be the same as binding.
>>
> 
> I always run checkpatch before sending the next patch series. Checkpatch
> doesn't highlight this problem:
> 
> --------------
> $ rg SPDX a1_clkc_v10/v10-0003-dt-bindings-clock-meson-add-A1-PLL-and-Periphera.patch
> 32:+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 111:+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 188:+/* SPDX-License-Identifier: GPL-2.0+ */
> 294:+/* SPDX-License-Identifier: GPL-2.0+ */
> 
> $ ./scripts/checkpatch.pl --strict a1_clkc_v10/v10-0003-dt-bindings-clock-meson-add-A1-PLL-and-Periphera.patch
> total: 0 errors, 0 warnings, 0 checks, 259 lines checked

Hmm, my bad, that's something to fix/improve in checkpatch.

> 
> a1_clkc_v10/v10-0003-dt-bindings-clock-meson-add-A1-PLL-and-Periphera.patch has no obvious style problems and is ready for submission.
> --------------
> 
> I've got your point, will fix in the next version.
> 
>>> I've changed all new source files to GPL-2.0+ except yaml, because yaml
>>> dt bindings schemas require the following license:
>>>
>>>     # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>
>>> I've pointed it in the changelog.
>>
>> The only thing I found was:
>> "fix license issue, it's GPL-2.0+ only in the current version"
>>
>> so what exactly you pointed out in changelog? What was to fix? What was
>> fixed? Correct license into incorrect? But why?
>>
> 
> By 'license issue' I meant your comment for the previous version at:
> https://lore.kernel.org/all/6a950a51-fe90-9163-b73d-0a396d7187ee@linaro.org/
> 
> I thought you mentioned the problem is in two license usage in the one
> line (GPL + MIT), I've fixed it to GPL2 only, and mentioned it in the
> changelog.

The comment was for a reason why the license here is different than in
the binding. Should be the same. Binding had license:
GPL-2.0-only OR BSD-2-Clause

> 
> I didn't know about the special requirement for a dt-bindings license, I've
> just checked other clock dt-bindings and found that license is different
> in the many places:
> 
> $ grep -r "SPDX" include/dt-bindings/clock | grep -v -e "GPL-2.0.*BSD-2-Clause" | wc -l
> 291
> 
> And Tegra Car 124 as an example for different license between yaml
> schema and binding header:
> $ grep "SPDX" include/dt-bindings/clock/tegra124-car.h
> /* SPDX-License-Identifier: GPL-2.0 */
> $ grep "SPDX" Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
> # SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

checkpatch has the correct license. Many files were licensed differently
*on purpose* so I asked about purpose here.

> 
> Anyway, it's not a problem to fix the license to the same value between
> header and yaml schema, I'll fix it in the next version.
> But based on the above experiments, other clock bindings should be fixed

Your binding has a correct license. What should be fixed?

> as well, checkpatch behavior should be extended for dt bindings headers
> licence checking.

Yes.

> 
>>>
>>>>> +/*
>>>>> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
>>>>> + * Author: Jian Hu <jian.hu@amlogic.com>
>>>>> + *
>>>>> + * Copyright (c) 2023, SberDevices. All Rights Reserved.
>>>>> + * Author: Dmitry Rokosov <ddrokosov@sberdevices.ru>
>>>>> + */
>>>>> +
>>>>> +#ifndef __A1_PLL_CLKC_H
>>>>> +#define __A1_PLL_CLKC_H
>>>>> +
>>>>> +#define CLKID_FIXED_PLL		1
>>>>> +#define CLKID_FCLK_DIV2		6
>>>>> +#define CLKID_FCLK_DIV3		7
>>>>> +#define CLKID_FCLK_DIV5		8
>>>>> +#define CLKID_FCLK_DIV7		9
>>>>> +#define CLKID_HIFI_PLL		10
>>>>
>>>>
>>>> Probably I asked about this... why indices are not continuous? You know
>>>> that consumers are allowed to use number 2 and it will be your ABI, even
>>>> though you did not write it in the binding? That's a tricky and
>>>> confusing pattern for no real gains.
>>>
>>> Actually, indices are continuou but splitted into two parts: public and
>>> private. The public part is located in the dt bindings and can be included
>>> from device tree sources. The private part is in the drivers/clk/meson
>>> folder, and only clk drivers can use it.
>>> I know, there is some trick when the user just inserts a digit value and
>>> doesn't use constants.
>>
>> This is not a trick. This is how DTS works. You have only indices/numbers.
>>
>>> But I'm starting from the assumption that such
>>> dts changes will not be approved by maintainers. In other words, the user
>>> *must* apply defined ABI constants from dt bindings; it's a strong
>>> restriction.
>>
>> But it is not correct assumption. Defines are very important, but they
>> are just helpers. Otherwise without defines you could not use any clock?
>> We pretty often use IDs - for DTS to allow merging via different trees,
>> for DT binding examples to not rely on headers.
>>
>> Your driver implements the ABI and the driver exposes for example clock
>> ID=2, even if it is not in the header.
>>
>> These IDs are unfortunately undocumented ABI and you if you change them,
>> users are allowed to complain.
>>
>> Solution: don't do this. Have all exposed clock IDs and clocks in sync
>> (and continuous).
> 
> I see. But I don't understand how I can restrict access to private
> clock objects. I don't want to open ability to change system clocks
> parents, for example. Or it's under device tree developer responsibility?
> I would appreciate any assistance in determining the best path.

There are many ways - depend on your driver. For example like this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-exynos5420.c#n975

The first argument is the clock ID (or ignore).

BTW, quite likely the problem is generic to all Meson clock drivers.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
