Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8335CF5A8A5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6/sPjbsyHjnxg+Sg5Hyu2GJ96SCBI0kN5ObFw3LGbc=; b=1U6VH4uqgd2FlyW1k3SkUS/Afr
	NkkEIsiR4oMSeGf2Wlm5asfLs+F+3SvC4ze7cvBZzoaRMjw3jmxelMGkjgUj5AeoQHpjpl5Qm+uUR
	Ax6U63fYtWbsHqKRRz7g+UEcUOS3beqeuYVS3V4fBKrQfmyGhmJRxpDkJ+IHZWv46ev/E+aw/SGbv
	rlGgLlYxzcQCSgT3ltTqqNR42IXdn83NN2vBCTRONm2SQJJ7b9CAGOW9BHZNFuxqhsnDrrCXMluiQ
	qfdWnrtnbz59xJnyChVCfmZkr/OkUIymQE9X6D759guDCh08DtmOV7kRO9HlqiBkxxfHpTXGghgp9
	fnWzIz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsTA-00000007Ua6-3dvq;
	Mon, 20 Apr 2026 17:31:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsT8-00000007UZO-2F1b
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 17:31:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso8715175e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706292; x=1777311092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=gROZXcGLyfMFon2RfYOoPwsK2nMWTf2ATyf8QQeBvyCnwoluScjWH810Vfd7OeZD5E
         muAHi8NsF0FBGzcpwyP5A6ihCoeqELKLk9P0QdEN8qFRYm+p7ITqNQ02JnFBKefjsiyC
         HQFsM5CzfB60BNTSst2sGyz7cYddNa4sPgT/Gthz3L2LeYuuvlAUVu7+AhnS6dMY4dRh
         22yVQlG/Zu/voU6LMOJGamNb6Ji6AzW22XCM9L4NRev0aEwjyHgwdYYLP9LMj04r7kkH
         TPvUBFpou4SM2cHK94D5Wm9khy/elmvZUUj+BIS2kXiYSJekg1peVGfO9zaB7XL7b8JG
         xjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706292; x=1777311092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY//u7sg+42QXalxUid10GxLcQ4s1uuTMxgqca1+Zkk=;
        b=NeN8PgnOudpdjfvIg4ZMOw177lXxuXl9b1JNqve9/UbDiphHtlaSIDqc2uBnhrVjmJ
         sB82cUXFcJk9RFSSTR6mwsnM2tKXHqdr+ZItR5Dx8Dwx1r5NMK1axkbV5CniDduHdkA1
         e6dn+C25YmH1zgQ6LuyV94IUMlKnJZef0PrpxYfk7hwo1kiDEUCAxQXwAxop9GUnVVnj
         9vf5k8Bx/oz08n+WLsuvLJKiRtm0HJGR9s9KisCDbeRoc0kNh1d7Nnp8KI47gSdZ96Fj
         Ww0C09R8tPBYIwXbDhicK6MQAsf753l5fo9cRDdd6XujO75yK0rxK9+G5D7Fg4YmMBXV
         C1kg==
X-Forwarded-Encrypted: i=1; AFNElJ+5p24K7YM+DozF2PU36Pi3Khv/9jGSb3reNy8YJFiIusid+eglfdSlH5TDwFs0vpNrijX/jRYd50NRw7tY@lists.infradead.org
X-Gm-Message-State: AOJu0YxGBh/ZH5sedAGw99E+kyoenQ/VjoJb3QyPw0B3kEgBWzajIcW6
	wlATgVCAL+5FnIBjZz0pRLPT3WEJ1zxYrWVyecfyr0obRRnakWdVXFwbhgSi44qWTBU=
X-Gm-Gg: AeBDieud/wEZYHJL9G2oCstS2NkUZYYMN8rnEtnacvJ2Iegb8p1sm7BBit6+8Bi25Qm
	Jc1Q7vCARCxWnLWdN7VPoifjX4t5D1XP88hPEB8hlRM4rGRcYSzkRBMmgHDam86u+cOZAw7I4ga
	4iRcHUBe34frMKBaw4ydAJbhc7EQ0pT67CS1AcGZTiHEKTzlsMC7ZeeYcPl/9DEgBNnwqlKbbzf
	UnP23uqsKnQQozlSXT6issQmqfyIHt0/DkFzrF0Qz9XkRBwF2VXPQWu0qKah49q8jd7zCe6BBR9
	p77CZmY9HaQuToXwiHRR+HGadCAC7pOL0iA7HmyDTFNgwP8k6GQVEPMlyZEKBQNzpThb10J406k
	vvK1btsknPObJw2QYOTT5+WJnhdN0C0k94N0+b88O9MmCDinCD4vp+maF5MkcvH/DV5S+bdSD6K
	82EEX2sgsJgijTpqNh27yP62AjTqU3NuTL5i0npQ2/43Dzn0oYz8cJx19Hc+i9mK0lFd5D4Ye0K
	YAf6xz62d8zJHFjGw==
X-Received: by 2002:a05:600c:c4a2:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-488fb78eebdmr202614535e9.26.1776706291547;
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5? ([2a01:e0a:106d:1080:9a74:aa46:4b5c:7fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4633bsm30305685f8f.26.2026.04.20.10.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 10:31:31 -0700 (PDT)
Message-ID: <5d9c1c31-5e89-4699-b910-f5ca2c36260f@linaro.org>
Date: Mon, 20 Apr 2026 19:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
 <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
 <4b2a319e-3292-4576-b5b9-4e7db8aebe87@kernel.org>
 <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
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
In-Reply-To: <43ae9d05-5cc9-4f68-933a-99eb744756b7@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_103134_619424_8599EFEE 
X-CRM114-Status: GOOD (  24.77  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/20/26 17:25, Arnd Bergmann wrote:
> On Mon, Apr 13, 2026, at 09:30, Krzysztof Kozlowski wrote:
>> On 13/04/2026 09:17, Krzysztof Kozlowski wrote:
>>> On 13/04/2026 09:10, Neil Armstrong wrote:
>>>>>
>>>>> I will wait with this. It might miss the merge window if v7.0 is
>>>>> released this weekend.
>>>>
>>>> Ok wow, just like that... I mean the amlogic DT is stable, all patches
>>>> patches bindings checks and none is critical since it mainly touches
>>>
>>> You sent your pull very late, just before v7.1, and skipping late
>>> posting is not a new rule. It was always going late pulls, which might
>>> make it or might not make it.
>>>
>>>> new platforms and the incriminated commit is a low priority fix for
>>>> 10y old development boards...
>>>
>>> I did not check which commit was not in next. You can provide feedback
>>> to my reply with actual argument, because such explanation was missing
>>> in tag. Instead you decided to be surprised that patches needs to be in
>>> next...
>>>
>>
>> And to clarify, I did not say that pull will not make it. Considering
>> the timeline:
>> 1. You sent the pull on 10th April, Friday
>> 2. v7.1 is released on 13th April, Sunday
>>
>> and that people are allowed to take weekends off, then there is simply
>> almost no way that pull can be merged before v7.1 is released, so by
>> definition it is a *late pull*. The policy for late pulls, like that,
>> did not change.
>>
>> Lack of exposure of a few commits to linux-next is only the explanation
>> why I did not pull it while doing last round of pulls.
> 
> I'm looking through the backlog for any missing fixes that should
> still make it into -rc1 or -rc2. Just a few more points to add
> from my end:
> 
> - I had in the past always trusted platform maintainers to only
>    send pull requests when they felt the contents had spent enough
>    time in linux-next already, but I did not have any scripting
>    to ensure this was done correctly.
> 
> - I see that only a few of the patches in the branch got applied
>    during the fineal days before the merge window, while the rest
>    had been part of next-20260330 or earlier. Aside from just
>    sending the bulk of the contents earlier, I think the best
>    solution on Neil's side would have been to send two separate
>    pull requests, for the earlier and the later contents
>    respectively, even if sending them on the same day

I never did a split because I don't have enought changes to justify
2 PRs and I had some contributors & other maintainers activity late
in the cycle.
Anyway I'll make sure to send the PRs earlier.

> 
> - I see that some of the late commits are clear bugfixes that
>    we should still merge as soon as possible. Neil, can you go
>    through the branch and send another PR for anything that
>    qualifies as a bugfix? While by now it's clearly too late
>    for any of the new features, there is no need to delay those
>    any further.

The fixes are clearly low priority, but I can lop over and send them as fixes.

Thanks,
Neil

> 
>        Arnd


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
