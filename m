Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2172C5AD49
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 13:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ/SdmS/OT6eKZhp+O9Ov+NvUwt0mB9eZbGhtuTHr28=; b=GzsMNY+BYdavhWCKA/+yTPJXND
	A1RgIyZGqIm0TySDBdSa1dRmDk9jMT3FkgAfFjysZZGWb55b0CRT5GFFjnYYouyJgRq9Ub5hdQmuB
	uxaCHigMmKeCl3l2xj3ZT7wYOtGUYz52SGVs8VcLUp1XU1B4AboRjm6zErRgiRswrr+hcakERTSgw
	xgA/wtCn1HCEn0YyA8Md9ckZ/4jVwqXDyiFB5rDrIQopLOmD5qQNDB4gges1NX00iy3yLq64BYAy0
	U2Y8Qq6N+EnDd0Bq/fAxQvy0PVpvdr5XZrEGXvPct3UmhIV5N9Umn5AnfKTpjQD7QIQoYzHOHjhdQ
	PvQGRx7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRbT-0000000B1Xc-2EEm;
	Tue, 03 Jun 2025 13:22:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRbQ-0000000B1We-0wPu
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 13:22:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a35c894313so5054547f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 06:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748956970; x=1749561770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=AyuI7UhgW99YPSoVWilSYcqToF5AroywIMOyWshnFDE+2fbDalZlX5DiRWKrLUf+RC
         PBRV/Eflfhvak7vfslqHB9Rj+5xEVm0eEX9V4rWVPEflqv6Mmx1hlpCh+0UWdgZfmnHt
         zoYWcBh/7GTkt6GDnmedGT0DA1ct1FeSFG8tYbyREMrr6gy3BYwe5k8uFAn/Lwpy+lnw
         tZkr3V79HSmLBLE5FOVs/tmfFZpZmPOCbqAIroWgLmvjdjXp5881SEUSeHjWaQVG4OA8
         4GO/X/8HMF8AYv+7Vy7ccO231rkmwgbSv140XJWZTOw/cb9BRjjI7UXITUoQ4EhWsmnA
         u2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956970; x=1749561770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9o1OG5gJMnbyvyc0DC5kIEpva13qObOrgWmt6a2YYaM=;
        b=tF5RZ+wIVuDjY5pi97ec2L1dwW+th0/qJo2fAdjkj44vuQLf5shVKS0TVsuyvFBGax
         qK56TSPak9/osKVJbiR5z6EAAi6S+Dw4rEQ2LuH+1kY/9kiLyl2qAPPZJYw9qojcTVh7
         cUe05dVj4ZMwqvO2Bj9lHsoQLm4NDSNmz+cKFuZi7dIxY9pAYIDV+XIHMul0sgt0+eVS
         tLk2lAGyGkLGaLZ9+qk8jD7vYZzAWqbkrpIVe7RIiTbk87kfESzEywqNulEk0iqbDcWN
         syuZX3xtQkOE8TwrzzPpsCf+EhI+brWmwmcSbEEDVk18utfBK5tO8ODN0oxbZhtQqx8i
         W0bw==
X-Forwarded-Encrypted: i=1; AJvYcCWfUGD2nzF4qUcZtvlLskmaCKmc9COOMmSTiKI3KI6bSUI03Ukp2d4PWVc0FYCcCiTzFmHsN0RDb4q1gvGy@lists.infradead.org
X-Gm-Message-State: AOJu0YzZFfeSiVa6X6AMCM1sMJZS4qCzbkp5go2jHf5x3RK7p+UAVxYx
	urwvKdkiWqa+KvwXo2zDW3Eo/dmQQ1vI02pQWMdPsUa9qaRpCVZcMAKjCMnye+WvMug=
X-Gm-Gg: ASbGncvvIF6IBqQzy2RI/mpDissBdH9AsH/AjeSKxb08T+t4lZ8waXoFOYHhdK4/iX4
	omFV2nfw4iycWZ8brlv/y7/graaxXt8iknrXI7oGGijqU33zBuY01Xr7f8qQL7ze3D/qAXguw5L
	g1TVnXia2+GUk6PNGEK0tDvi7J4PP6AW17DZV2MTpu/2X+4yRDrTN61zHUH1iQimZDkZthehR2i
	APFlOIaPykeKE9ubBudSlly4K0vHLqul6LPj/I4hsumaV88QcBHFw87DyOX53usd7ZecvcKRxZv
	f2JATM43EBSmfIyQ7PObViUWC2g0rujDf7nzDoTRrd6vtz6EuBhFRJIOdp4N5OeFb2BG6frLSt2
	cVKWHxBudi5m9TauKdbRYTWeu72PhBg25rvdn
X-Google-Smtp-Source: AGHT+IGwM1OzgbnP1nAlLY2AaZkYQUoZH8oN0rymNrDg+49LiXGRY5PKTqcJSZ1tfnP2AMJFUo1T8Q==
X-Received: by 2002:a05:6000:230d:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a4fe39363cmr9636222f8f.36.1748956969885;
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:563:3654:17de:c930? ([2a01:e0a:3d9:2080:563:3654:17de:c930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972f3sm18588651f8f.69.2025.06.03.06.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:22:49 -0700 (PDT)
Message-ID: <d950d77a-2bc0-4f8d-88c0-3d4da9cc772e@linaro.org>
Date: Tue, 3 Jun 2025 15:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
 <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
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
In-Reply-To: <366cdccf-571c-4f7f-ae26-2e529de5d5ec@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_062252_272130_7072C988 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

On 03/06/2025 11:50, Krzysztof Kozlowski wrote:
> On 03/06/2025 09:47, Neil Armstrong wrote:
>> This fixes the following error:
>> meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
>> 	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>>
> 
> I already sent it:
> https://lore.kernel.org/linux-arm-kernel/3c3c3652-be5f-4f54-a0b8-4829f9549116@linaro.org/
> 
> Can you pick that one instead?

Sorry I forgot, of course I'll pick yours.

Neil

> 
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
