Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B63C48BC3
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Feb 2024 09:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4Kv+lD/0P68GaZiNH20QBAdxAsmQfr3qe+zNC1XyNc=; b=KMuuIIllioVQeaF+SA3oRUa4KU
	m1f3Vp6BjUdzXQPKLFzGbPhzUyVdp6S6P+4zmHAlrc1lDk0Y+ABCZ0UHO8W6t4oBoHCzUpUaw1xxN
	qDoFEBUOY9HGDdYip7fwDVRvFbMg5bhboKErNv1s2jTCYbTpwe2QnQ7CVeSyXOq2NOVNtvg5x/P9r
	XbxmRS1uzY99aiPyTsmjJi9suF7/xdH+EteGtm7ar6WPQmK309quWuAK6NYmRIXw7XtKSxiVzd9w7
	R/sPY80+0QST+FXpFAebN9PRGWSREN5oxtehZLE/7r1M9P0mdrW8A09JRmFp9bsBEDld5C3wABWUR
	R2ygtH0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzd4-00000009jv3-3EQr;
	Mon, 19 Feb 2024 09:08:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzd2-00000009jtK-0NMU
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Feb 2024 09:08:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41243d19ecaso19047395e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Feb 2024 01:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708333677; x=1708938477; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjE8Ckzgumm8AZzjDZn5dzYN55ahrIvajl4vX0vSh44=;
        b=XbEIx9DMOFzSiRi+Gut+0Unulq/IV1hYkxvewDZdMDtnJPmSsBsJCiLdY2vgn/qvPE
         Xg+Ku/vx6N3erOdVAfDRNXedflr+WnnmJXcmbegWZLtOaZBz2Am2N7926ei72fFHzhqf
         iK0awDtJFZEb9mP8iwOikBPpqon3GU5zWw818hZOY2UBN/Y2L3/6bS3Nl2h/ywwhoI7L
         RGhuJjC6oZv7qhRy5KJos56idvjeHWEH7qoa+PuS3HEK1bDEl3FBOdx1WYf0UbqWn1W3
         NQeGJbHzwyYWdKJkDitozwdfZY3GyaIFT6yx7bEaYERc0r0UGhHAYWkCEITkzQojE/Rl
         oxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333677; x=1708938477;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LjE8Ckzgumm8AZzjDZn5dzYN55ahrIvajl4vX0vSh44=;
        b=RO+EepgSAoyuPscZac1v6RYcuHHqBn/RdIo+ZFkLm0vgQZf13DR7bMtMSXawgmUd6V
         3o0RKkjK3gbme1a3UPWN9kNmWaeHOXv/dyWv2YxqCm2inW+TDFQ7ef0mN6/OwJfxtwrx
         ggVeITUQoTz/GI0bh91HGGluGP8qDfk9kqqAJ7Mk3KhjELW4b3b9EMilKjVlIxDhdxbM
         7mi/vfHK6Vqyw8hI6BcFzKNoW9Y/HAfDKh5+9kfftkfy9HvTu+nPey260hSFYgDhWjCr
         vCMJt5vBVeUVlZN5Ufj9J1Zr2YLS/C2sk24UiJAU1KbAMoYUeAUXIFErNkyTVGps3zyO
         homg==
X-Forwarded-Encrypted: i=1; AJvYcCUukeidiUIwx1v8kVw8vYFOPmBxvnnRTzhkUcD8ftHgmrwUxfkbExH9vXsOZi/GZFNM5hYCLyoum8WZCjutw2OKVwHhi+HAve9/GHJz+DXlg6U=
X-Gm-Message-State: AOJu0YxfLNJn+zv2+jQpTdYhqBylXNT56kliOV2lI+hLVS4iXGo8lfyC
	prNsVPyKvI1oqT4SQyFcKChcbhWT6irlNEi6PdTOjtTwopzBXCC94kCIxgMZIsw=
X-Google-Smtp-Source: AGHT+IGprtNRt9sGT/S0OHSwNQRPmRHg6Lr6oEhUZx0+ye2ltVVzao6rnEUESmmyQhMXlSu4kZmUXQ==
X-Received: by 2002:a05:600c:4fc4:b0:411:d822:d81b with SMTP id o4-20020a05600c4fc400b00411d822d81bmr9408955wmq.2.1708333676688;
        Mon, 19 Feb 2024 01:07:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f? ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bcbd8000000b004120c134b40sm10598727wmi.22.2024.02.19.01.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:07:56 -0800 (PST)
Message-ID: <3f08ae93-0bfb-4378-9b38-6ed1256353e7@linaro.org>
Date: Mon, 19 Feb 2024 10:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/4] Add support for Freebox fbx8am boards
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <170833286959.1749763.5981999865888937241.b4-ty@linaro.org>
 <80806260-ac19-4801-ba05-d4257aca8df0@linaro.org>
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
In-Reply-To: <80806260-ac19-4801-ba05-d4257aca8df0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010800_182061_FD029265 
X-CRM114-Status: GOOD (  10.88  )
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

On 19/02/2024 10:05, Krzysztof Kozlowski wrote:
> On 19/02/2024 09:54, Neil Armstrong wrote:
>> Hi,
>>
>> On Mon, 12 Feb 2024 18:47:33 +0100, Marc Gonzalez wrote:
>>> Add support for Freebox fbx8am boards
>>>
>>> Marc Gonzalez (4):
>>>     dt-bindings: vendor-prefixes: add freebox
>>>     dt-bindings: arm: amlogic: add fbx8am binding
>>>     arm64: dts: amlogic: add fbx8am board
>>>     arm64: dts: amlogic: add fbx8am DT overlays
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.9/arm64-dt)
>>
>> [1/4] dt-bindings: vendor-prefixes: add freebox
>>        https://git.kernel.org/amlogic/c/fedeacff9611917231d710382e7ccb518cd440a6
>> [2/4] dt-bindings: arm: amlogic: add fbx8am binding
>>        https://git.kernel.org/amlogic/c/beee431b3257334e450999ebe77636bb18ca87e7
>> [3/4] arm64: dts: amlogic: add fbx8am board
>>        https://git.kernel.org/amlogic/c/acbe5b6b0fb74197ebff06a62abcfec9858c23ae
>> [4/4] arm64: dts: amlogic: add fbx8am DT overlays
>>        https://git.kernel.org/amlogic/c/13636d5502204e671398470962babbfb46bc2721
> 
> Confusing... this was not applied actually, because it was not correct,
> and instead you applied v3. It took me some time to spot this...

I know, b4 ty does strange things sometimes, it sometimes also selects the previous version

Yes I applied v3

Neil

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
