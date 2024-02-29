Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0447C54E49
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Feb 2024 15:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0P/nulNxN/UjbWIMBwScD2PUuzsgDZg/i+xn3PCzbaU=; b=rU75biX4QvulXidvI5Js+/x4Tj
	JfFmzrXK7qGkNG+pF9aO8KS1I2s2RqWQn54dEaQotMWw4p2AD8Y+CZ9x3TZ60hi3kky0RUh0UK5HC
	T9HXWfXCAyMSAdgtVcIQtwzDBbkk31DgC+5CC4yb4QyNoO5wVMdNFNe9HpIEjlkixpWECIsjf/xpD
	PR/Fb4aidBHUaQ924JMUsdDeQZRFCcDt7bkslJzAByt/0NWAbz68neQSXJ/8YHiP4BxbHSihD7vYH
	WW65dDuDxLMQJvEceBOuAoykAkXeO0cmP+wLuJ/+NaapQerBA2b73Pd4UInAivFScPjWs7W9h+4Rw
	Dh+CS9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfi6z-0000000E0so-2yI2;
	Thu, 29 Feb 2024 15:14:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfi6w-0000000E0qs-3PUC
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Feb 2024 15:14:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-412a14299a4so7935125e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Feb 2024 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709219653; x=1709824453; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXEUZD7HIc5+BDhLp1eCYIkSCHTY2l0iyo8ZM3GFsdA=;
        b=bbtHm9Lu2VhhyQPgH9D9D9WZc1JXI0w4jIbH7HnadA2Ick3El9uAQ5wUsvP/mUAWdM
         Ekn8cHzjcTr9nVLhyJI5bo/Zs5i6C0u8lDJPkuK35iTtxs50C2h8jxaKi5LvHoFV/t2h
         z/MrnPSvKnMgVPCQ1POsUVtkov276M0TIpsoqb3MLb/gSySF8BhWPKWp/UIPG030YhB7
         mTsLrF891di3HXU+hXQ8eC+dzoNdVsNbNr+2/2qcHBx0pQtBx1o2f8pnm87R0gFD60bJ
         dHXCIBdtv6yRxpEKFFw1SeB/uFOC5kO1SJ+cYb8fCBvG/X/O7kj+xICjAdV+AYokgWc/
         2x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709219653; x=1709824453;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BXEUZD7HIc5+BDhLp1eCYIkSCHTY2l0iyo8ZM3GFsdA=;
        b=vIqy8JShnwqXxQWMdRBjWYU1JSxAg07duGcY/h6DGq7CJbSTfrrpZMMiIzao4yTZYD
         nN55Vag4DfFYT0v885Tgq4Gj1Ify3O5tK1LuTPIDNToynVnAmjnkUBnCtc4Hmv3tBUxy
         oh7/p2dglpjIepfbYgw6cq1Tfs+Zq6DVbxSZFOIUusLMNX2zessvJW1wwGVW5Mvumzjt
         wFpQ4nGsIXkbOolEh/GcpeX+EzmLa8GtHmAYnnI4gYHT4CJG0kQa0j+ttSYOaiHUGnF2
         2TazwqDBmtQaXsjsB9VgFFOJ2kp1JCAzdNxNDtC9TvgEk4T8U7RmwlhwO55IV5e4PMy3
         pyFw==
X-Forwarded-Encrypted: i=1; AJvYcCURnuuht6cCaQLtBdAP128fvu577W5C2S32JwOEhDujjtI1djAY259wJakan5Rp+WWLyKpQvqCZUZaGf6IMvJrzW8+kOelDwcedXwujKxGeqds=
X-Gm-Message-State: AOJu0Yxtu1bFjKyt2YC1b1/GbsCFSzUJrQvCgO8CBEAX2rnWJMNLbpiP
	9q5mNeHOaL0v8PAEHWr4oI2lc8nLLnkSlZHvt48Zeyd3Md5XjKVdYXvsdX8DCRU=
X-Google-Smtp-Source: AGHT+IEiNaycCnI+8/fdk5xkL9CXSWuu/KBH0Xt6zhKFcDq5ZtgRezOd+aaT2eCbXnVsaGyxIl30yA==
X-Received: by 2002:a05:600c:4ec7:b0:412:a206:ad3c with SMTP id g7-20020a05600c4ec700b00412a206ad3cmr2261718wmq.3.1709219652688;
        Thu, 29 Feb 2024 07:14:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:651:5318:b12c:be82? ([2a01:e0a:982:cbb0:651:5318:b12c:be82])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm2010514wrb.29.2024.02.29.07.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 07:14:12 -0800 (PST)
Message-ID: <456a6aa7-60e0-4a56-9efa-731f717012ac@linaro.org>
Date: Thu, 29 Feb 2024 16:14:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 00/20] Support more Amlogic SoC families in crypto
 driver
To: Alexey Romanov <avromanov@salutedevices.com>,
 Corentin Labbe <clabbe.montjoie@gmail.com>
Cc: "clabbe@baylibre.com" <clabbe@baylibre.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <ZcsYaPIUrBSg8iXu@Red>
 <20240215104719.njq6ie2niisntcnv@cab-wsm-0029881.sigma.sbrf.ru>
 <ZdL713ae1swwTU_B@Red> <20240228133656.24bic6djmjvkill7@cab-wsm-0029881>
 <Zd-VVGXHoH2ikbmV@Red> <20240229025337.ftbvoaafmu5zvyha@cab-wsm-0029881>
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
Organization: Linaro Developer Services
In-Reply-To: <20240229025337.ftbvoaafmu5zvyha@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_071414_922578_2111E10C 
X-CRM114-Status: GOOD (  18.43  )
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

On 29/02/2024 14:05, Alexey Romanov wrote:
> Hello!
> 
> On Wed, Feb 28, 2024 at 09:19:32PM +0100, Corentin Labbe wrote:
>> Le Wed, Feb 28, 2024 at 01:37:02PM +0000, Alexey Romanov a 'ecrit :
>>> Hello,
>>>
>>> On Mon, Feb 19, 2024 at 07:57:27AM +0100, Corentin Labbe wrote:
>>>> Le Thu, Feb 15, 2024 at 10:47:24AM +0000, Alexey Romanov a 'ecrit :
>>>>> On Tue, Feb 13, 2024 at 08:21:12AM +0100, Corentin Labbe wrote:
>>>>>> Le Mon, Feb 12, 2024 at 04:50:48PM +0300, Alexey Romanov a 'ecrit :
>>>>>>> Hello!
>>>>>>>
>>>>>>> This patchset expand the funcionality of the Amlogic
>>>>>>> crypto driver by adding support for more SoC families:
>>>>>>> AXG, G12A, G12B, SM1, A1, S4.
>>>>>>>
>>>>>>> Also specify and enable crypto node in device tree
>>>>>>> for reference Amlogic devices.
>>>>>>>
>>>>>>> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
>>>>>>> custom tests [1] and tcrypt module.
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>
>>>>>> added patchs up to  "drivers: crypto: meson: process more than MAXDESCS descriptors"
>>>>>
>>>>> Including this patch or not?
>>>>
>>>> The crash start with "drivers: crypto: meson: move algs definition and cipher API to cipher.c"
>>>
>>> Unfortunately I was unable to reproduce this. I use Khadas Vim1 board
>>> and my custom tests (https://gist.github.com/mRrvz/3fb8943a7487ab7b943ec140706995e7).
>>> Tried both build as module and built-in.
>>>
>>> Can you, please, give more information? Maybe your test cases?
>>
>> My test case is simple, simply load the driver.
>>
>> The problem is that you moved the algs[i].mc = mc after the register of algs (in drivers: crypto: meson: move algs definition and cipher API to cipher.c)
>> Test could happen as soon the register is done and so mc is deferenced.
> 
> Yeah, you are right. Will fix it. Thank you.
> 
>>
>> Since you didnt hit the case, I suspect you didnt test the driver as module.
> 
> No, I test the driver as module.
> I think the problem is that on my system no one uses this crypto backend
> outside of my tests module, unlike your system.

I reproduced the issue, testing each commit with enabled runtime cryto tests:

I get the following when applying "drivers: crypto: meson: introduce hasher":
[    4.514031] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    4.517193] Mem abort info:
[    4.519934]   ESR = 0x0000000086000004
[    4.523641]   EC = 0x21: IABT (current EL), IL = 32 bits
[    4.528903]   SET = 0, FnV = 0
[    4.531920]   EA = 0, S1PTW = 0
[    4.535025]   FSC = 0x04: level 0 translation fault
[    4.539856] [0000000000000000] user address but active_mm is swapper
[    4.546155] Internal error: Oops: 0000000086000004 [#1] PREEMPT SMP
[    4.552359] Modules linked in:
[    4.555376] CPU: 2 PID: 77 Comm: cryptomgr_test Not tainted 6.8.0-rc6-next-20240229-g2296d426c21a #105
[    4.564608] Hardware name: Libre Computer AML-S905X-CC (DT)
[    4.570125] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.577025] pc : 0x0
[    4.579178] lr : ahash_def_finup+0x12c/0x14c
[    4.583406] sp : ffff8000825037a0
[    4.586683] x29: ffff8000825037a0 x28: 0000000000000001 x27: ffff000007ab8060
[    4.593758] x26: ffff800082503958 x25: 0000000000000400 x24: ffff800082503918
[    4.600830] x23: 0000000000000820 x22: ffff0000048ec390 x21: ffff000003d9e200
[    4.607903] x20: ffff0000048ee300 x19: ffff000003d9e400 x18: 0000000000000020
[    4.614976] x17: 00000000b5f74d5b x16: ffff800081bbbc60 x15: ffffffffffffffff
[    4.622048] x14: ffff0000049fb380 x13: 0000000000000000 x12: 0000000000000000
[    4.629120] x11: ffff800082503778 x10: ffff800082503780 x9 : 0000000000001388
[    4.636193] x8 : ffff800082503988 x7 : fefefefefefefefe x6 : 0101010101010101
[    4.643265] x5 : ffff0000049fb300 x4 : ffff00007f2d5830 x3 : 0000000000000000
[    4.650338] x2 : 0000000000000000 x1 : ffff0000048ee300 x0 : ffff000003d9e200
[    4.657411] Call trace:
[    4.659823]  0x0
[    4.661633]  crypto_ahash_finup+0x38/0x44
[    4.665602]  test_ahash_vec_cfg+0x680/0x7dc
[    4.669742]  test_hash_vec+0xac/0x1ec
[    4.673364]  __alg_test_hash+0x158/0x308
[    4.677246]  alg_test_hash+0xfc/0x1a0
[    4.680868]  alg_test.part.0+0x51c/0x524
[    4.684750]  alg_test+0x20/0x64
[    4.687854]  cryptomgr_test+0x24/0x44
[    4.691477]  kthread+0x118/0x11c
[    4.694668]  ret_from_fork+0x10/0x20
[    4.698214] Code: ???????? ???????? ???????? ???????? (????????)
[    4.704247] ---[ end trace 0000000000000000 ]---

Please make sure every single commit builds without error and doesn't regress at runtime on existing platforms.

Thanks,
Neil

> 
>>
>> Regards
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
