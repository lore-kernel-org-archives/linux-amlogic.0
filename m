Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6BE9F3D31A
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 15:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcyLtd8hQm7jjJAeZLprWXJ2WsPhcDBMLQI9vBDPXiw=; b=sjF2Gx7gHZVRpKwMNiLTboeGFw
	7oovfRpCeNJU/V3KSB55vjpq/dolhIonVq4oUQT+bge9f7PGPB9TVJL49skovn4JQ08Yr/pafZHRG
	8reINMPAJceTTEt5nza0zlVok/TMGA/BhYYW+5mjhsFHDEMhRqrkkK/FP1+sJNt5HJLm5AoEAFI/5
	QWxIdteuZ4U0qe0/SWVJZX26HL4ydsGCOOGDpzsbmCQu7I0b2CC0UJE9el8H9p/NzFmiYwIvJGEuO
	ENzH8M2nJJCAV8TLz2/ZkvpT3OfCYIf9bnhLh87gGHcYZkOi5e7iDt8XXEZH0R9MmVIIxV0+XxtB3
	aCZFhVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB5M-00000002ANy-2ZQU;
	Thu, 05 Mar 2026 15:58:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB5J-00000002AN8-44wb
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 15:57:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3286701f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 07:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772726276; x=1773331076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dVaAl61bpFuDZxzZADrOjRzw0mw5luPTO1AggexP8fw=;
        b=p1IEOO30wFy3oCDAYwkXrlOzayVezTJJmYgWsUiTj/kWRq6IQZvt49Iv7X2IkntCrk
         FzYEksgLnhfOoICKJSrnPT44N5Roxz82385NM1WICoKVl7M3DGYH81DMOCEmalB9wJid
         5K6zhiKUjYzLCt3b1h0PfRWzEPnIuDv0tiBC6Qv+8W/D7Q0xewElMjeZWWzpsdbcvL0K
         4avSSsxSBLdV/RfvjW/Gu2JSe5GSCmP5SBrsbjnKNFyTTFAxHAPP89gIzx5eZRyMHwdL
         xBTxFOECp0iYIXCpFxraB+MaFZo71xjgJCRgEU/+wPZlp2ikzu68aI7PKpBcuP3Q+FO0
         JkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726276; x=1773331076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVaAl61bpFuDZxzZADrOjRzw0mw5luPTO1AggexP8fw=;
        b=lR8cAoXLYTK7KOJGUCAw8JL5A77xExykrv10hmAnCZHAUxjcWXDrVlo8OAQs2cpO0N
         ZEENtskCXR5gdkF/pIOr6tAY01OZ7VMX9/N8U2w7VcmTOyIRM6ozv20w//4i/ZpJShPM
         ujRsmlhN01rky6kddKU9obz0YymHlgStpjpJPldv8h7xjhDxgA8qh/VsxUotHkghCSfD
         JsyBA6zIUPV+9R9PkwcjfJG18CauoD8HXKR6brJcW8rn8x+abguNyMQLZcZ3HOuRXlNJ
         7JsgyGYCWXxl7CJcGBobeKqtwRhtpqfjgUxNwnZ1rCjBxABo7tjTrai9WDfJ7QbbgzeY
         JGzg==
X-Forwarded-Encrypted: i=1; AJvYcCWmgacg0G6kV+Lgmi/lfknMPtQuaYJ2sUrIc3urKWoevgIFA/xm2OPZBhn6+En1BzYtDvzCFXGFWXCYhGg6@lists.infradead.org
X-Gm-Message-State: AOJu0YzhbwQSaCZ9bfruyuZtvFZBL2Wyjr1rzzu/fWhFU+sYdV4SGXrr
	lmzsbnOsOr/yZ1SZL++gQ8y2jIO3QrbAPC7+90mZFunN7kM6omwqcCEUc7PyoFPkl5Y=
X-Gm-Gg: ATEYQzyTHs7eWsffNlgFiWdefR6fYsoGH9nqmufqcsgahrINMc2EGhKAp3YBo6Irqq8
	IBWUdVKitJGJ9+vL2sDLMD4wHh7ky8D4agBOwd2Z5PMLFnZGaThZwv19dhjno5uv0FyIWt1FTNT
	9Z2UkoRdRxzMst08/zzGDTU5xGkfFc3FNBlM6ZPIioyB4OlMf/1mAORxjA1n6pD6FkyE+ZEnvWi
	lFNys3uZWNgtI56YtDT1h+e00IXrS2Xh8ARIZ4J3HyBTsDEtcZLTDl3hW2jHRqECFVxwi3/MJ5U
	9EQnZHLW7aBIfiZISOs5KFzHaES9w+YPhyYnaA4GHFR2n/S2spjeLSZm6vGc3Ish4wkYsx7va5I
	r+KyGBMsb9kMii0TgRkRichJrNlcAsWODahmLm7cGYsLjugyohV7IcW9yHyIkWGI02d1OVDnO1j
	f/MEsxCxJ6EFujLBpHyC4aHiwdxBNOi0bXgo/zWoEozkBxAF1riZwzBoFWuC6VCrYjQRnLJowPL
	7SD
X-Received: by 2002:a05:6000:250f:b0:439:abcd:b30d with SMTP id ffacd0b85a97d-439c7ee8e03mr11275542f8f.0.1772726275778;
        Thu, 05 Mar 2026 07:57:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:73bc:1eca:d39e:509? ([2a01:e0a:106d:1080:73bc:1eca:d39e:509])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b1b97927sm37622495f8f.28.2026.03.05.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 07:57:55 -0800 (PST)
Message-ID: <f3e9a770-a81e-453f-a908-59bcc567f01d@linaro.org>
Date: Thu, 5 Mar 2026 16:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC v4 1/4] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Zhentao Guo <zhentao.guo@amlogic.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
 <20260213-b4-s4-vdec-upstream-v4-1-c7112d00d662@amlogic.com>
 <d96c689d-a5a3-453d-a1ab-56dc1bf01635@kernel.org>
 <75e55ceb-e6dd-47b5-a829-66f6fbb3e13e@amlogic.com>
 <2f68ee18-e9d9-4da6-900c-93a7663b3c9d@kernel.org>
 <598c161c-d157-40e5-992c-912540589d7e@amlogic.com>
 <58d57a6c-7c69-4f5b-a4c2-f34ef0238511@kernel.org>
 <26d0f52e-3681-46ce-b0dc-0cb020e8d9a1@amlogic.com>
 <69900d76-3820-467a-9fbc-13f79189df2f@kernel.org>
 <278f5018-9183-4eeb-bde1-7c19adecab06@linaro.org>
 <c8b9aa23-9081-4482-b638-e57a0c419356@kernel.org>
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
In-Reply-To: <c8b9aa23-9081-4482-b638-e57a0c419356@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_075758_072669_D5DDCEE0 
X-CRM114-Status: GOOD (  17.53  )
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

On 3/5/26 12:53, Krzysztof Kozlowski wrote:
> On 05/03/2026 12:35, Neil Armstrong wrote:
>> On 3/5/26 12:08, Krzysztof Kozlowski wrote:
>>> On 05/03/2026 12:01, Zhentao Guo wrote:
>>>>
>>>>         2. Why canvas is needed?
>>>>
>>>>    1. Since the ARM IOMMU HW is not integrated into the Amlogic SOCs,we
>>>>       need canvas to prevent the DDR memory used by the decoder from being
>>>>       rewrote by other hardware. Canvas provides the decoder with a
>>>>       configurable DDR memory range, as well as hardware-based detection
>>>>       and blocking for out-of-bounds access.
>>>>     2. From the diagram above, we can see a lite CPU called AMRISC. AMRISC
>>>>       is the controller of the decoder HW and the decoder driver needs to
>>>>       access the decoder hardware through AMRISC. However, AMRISC is a
>>>>       16-bit CPU and cannot directly handle 32-bit or 64-bit physical
>>>>       addresses. Therefore, canvas is required to convert the addresses
>>>>       into index to facilitate processing by the AMRISC core.
>>>
>>> This suggests "Canvas" is IOMMU, thus use proper IOMMU abstractions and
>>> you cannot have own phandle for it.
>>
>>
>> No it is not, canvas was used for a long time for the display and video processing side.
>>
>> It's absolutely not like an IOMMU, the diagram is quite clear.
> 
> The diagram and all descriptions points to memory mapping...
> 
> "Canvas index is basically a reference to a memory region and its
> configurations."
> "Memory access through canvas has HW out-of-boundary check."
> "Canvas provides the decoder with a configurable DDR memory range"
> "canvas is required to convert the addresses into index to..."
> 
> so it is not a random phandle either.

No mapping is done by the Canvas HW, we simply reserve a "slot" we feed with
a linear buffer allocated by ourselves + parameters on the frame format, and
then the display engine or the video decoder will only need this slot index to
access the memory.

It doesn't fine anywhere and amlogic specific.

Neil

> 
> 
> Best regards,
> Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
