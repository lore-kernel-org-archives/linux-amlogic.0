Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ADFC48260
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaHpcmOh7OXryxRhtdAmkDsvp5qhM7NjV/B4uqQUl1k=; b=JI7kkttqP1YGDcnbIae3SCTa0K
	hXW8pzM9HafGZok/ktFOxbrqg214KskPE4o26eSOMT9On22Qqz0dEbN7HigrHQ/tD1F5QSXkixHW6
	8WWGF5cF84eOl48JwWhqOQ8dw3iO763rjs615JiVQS78oJUBe+KNOxKRoRMTAUwFRi0BNZCbLttqj
	aNIbM9+zhQL/MbdI25F9YT2QU//AticPbyuhCZswInA19jCOwMLAa1CP9lyManj/M3TVFQgjO0apG
	deddfexIkFktgEhvTURQV/O9ZxsMn20CwBPxTyt0K+5Zoesc8lZm4jnU+SWoUaYA2ZSAjXRjzTocU
	krLh6A9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz9k-00000009cSA-0USo;
	Mon, 19 Feb 2024 08:37:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbz9g-00000009cQO-0xms
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 08:37:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-51181d8f52fso5152660e87.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 00:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331858; x=1708936658; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ot3mhi97s6/9aZCMB2riyQgz1wZSt/7mTvF+Ozc5gEg=;
        b=r8Vhs0ch/eT6Bq0E40YNy+zE/1Xc4n65XLHx73q8pytIEC0vbkbjN9eruZIoJsKwSZ
         nSSRRLMunpfKDEwCfISuzfoi2RYPOZfdcQxuYlzd1ygsO141UjBVbKNqhKegsVZDnQM+
         ttmG8bNzujtUp0XopQ+PhBqw6NtcilMZ29bpN1hlknLMvKBTgkpbQ0wfJD+EEJGIzA9E
         +VqSz8cL5zdBlQGKdHG7PDlY3Xpe1esYhZmk4OVJXXLIBJoTn62hYUUhG2Uzj+gp6sva
         4zRWZ10u3tTACDBKzo5nPiFjHlSNK/Un1W2a/Aaw/N0sNiBUrbs8AGf1VHIrzBGkb4rB
         MXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331858; x=1708936658;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ot3mhi97s6/9aZCMB2riyQgz1wZSt/7mTvF+Ozc5gEg=;
        b=TD2gdtLyHAgnimXR2QuIYe3K3onLk3kXmcqhKQUTgITXy1ofmEa5pwMG2lJg7GYVGJ
         68VKfcxz+FyxTYHWddVwq9nxndGobCUWeVysHAk7t2k8EP/80Xaf4yGcHfYU/SmIJhiS
         ivVUGnjOkK6t9RF6Wh4wc0dmDuEEtSBVJ/dUSaOwy1uShwLTTATSFkrlbFETUR1B+zJc
         /zQrSfiyKpyOZeGUsDWjif8oF9aEDf37qBG9J9RyJLQWPpCoco4s0cExv7REJUsnXcgR
         wm+yCRd9dG/qIZ4mgHrdW2a1a2dCncP5vbA6DAxhbAF3adZZv5UYJeo5sTd7lOwD6lWv
         nU+w==
X-Forwarded-Encrypted: i=1; AJvYcCXIi4VwkFBrZlSwVzDk7SVYMWmz/fbd4b2veNqucjeQscKU1x6eElyJyGX2aXNuE9LLlmGGU9M3fkyQ7TwtI80M07V7abFXGo3KncKnm1ge67I=
X-Gm-Message-State: AOJu0YzMs9I9hJBri2D4dqts41hTKTPIZT2DUpu4Ncx9bpXYa5lEy4A/
	p4aKKymCPb8xpqLzWHE+JeaGbSbserWRBt2Yeyfm6xA9ypX3FH4/0ZZHDA7KmlU=
X-Google-Smtp-Source: AGHT+IGB2EfGRcnx45+mLUJnUMRu9qt4x4481hQ1u7jhQm5TGGPwPbM1n8o7wqWntRV0wH74bmP/xg==
X-Received: by 2002:a19:f815:0:b0:512:aae7:d79a with SMTP id a21-20020a19f815000000b00512aae7d79amr2161561lff.27.1708331858584;
        Mon, 19 Feb 2024 00:37:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f? ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
        by smtp.gmail.com with ESMTPSA id g19-20020a7bc4d3000000b004126101915esm4868608wmk.4.2024.02.19.00.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:37:38 -0800 (PST)
Message-ID: <f1dd75d3-d86b-447a-8a76-73da7d14c936@linaro.org>
Date: Mon, 19 Feb 2024 09:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/3] ARM: dts: amlogic: Three small binding check error
 fixes
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_003740_331417_366F0133 
X-CRM114-Status: UNSURE (   9.08  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 18/02/2024 12:19, Martin Blumenstingl wrote:
> This series contains three small binding check fixes.
> Nothing functional was broken before, so no need to backpport any of
> these to -stable.
> 
> 
> Martin Blumenstingl (3):
>    ARM: dts: meson: fix bus node names
>    ARM: dts: meson8: fix &hwrng node compatible string
>    ARM: dts: meson8b: fix &hwrng node compatible string
> 
>   arch/arm/boot/dts/amlogic/meson.dtsi   | 6 +++---
>   arch/arm/boot/dts/amlogic/meson8.dtsi  | 1 -
>   arch/arm/boot/dts/amlogic/meson8b.dtsi | 1 -
>   3 files changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
