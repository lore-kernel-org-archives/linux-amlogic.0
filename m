Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B60C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs1O2qGD61ckk9ojNV2QsUTSxUh4j6LTllPl0LbOo9k=; b=KVNRCgN11ldkF5y+lBATORoUNg
	UaQYsKvhBVEdkVCZjUqIy4VIHsKpVotixSjOcYk4ScSf4ndvLYurGOxTF++fBwmGfVEpaLewgM0R2
	xJ82E1hHQdsn5U3bvFvA10V/3Mv5+XKEucL6aO4QfMGi/C38tOXTfVjL9oTIPh0k/XQhUx8UaUrn9
	GvUHk1R7+dNPEymX5yX39wZmd9Moz70tfgi3DrWXFMcrq+mI1UYklS5bN1c2FdZSllncOxnvDn01g
	xpw4cIP6mB6D7Jt+0baBI3GVXsy5UNd3ggDNOqG5iVS1fFjY8iOhHH3pBmukYftgYlxqBPI6C/pjA
	FlWmabnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe9R-004hTF-2A;
	Mon, 11 Dec 2023 11:08:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCe9M-004hQj-0L
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 11:08:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c2308faedso45496325e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Dec 2023 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702292915; x=1702897715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/RqXxfpj+JRqX9l19TDqZ+cjowYfkXBepIWo3cd1zw=;
        b=aJd6rEYTGMhWLbuN8jqT1ghxNbSXmRibgdbP8pRxVFOkaVMveHVV2+vn5ux+67O901
         D6btTqX9GbA0kj3izOp2gOUH8DB/4hJXaSHMxqZcTJkAYSFZ+XVcjjrQ7kfsBYHcep3/
         mTfk6E5c11qCm3jRtTY/KXivhWLAsVCFFybBQRQ0g4eVXvbAqHgqNeOJg0Iyazlqvin/
         tubUnk8Yj36HWvV12c5z6353kEMMWF8EEID0Lrkrsjr9mBAwj/701e1irPyaNJfPZdXS
         xSCAL0uJQ2Xsjtu92sqv3IzFUGWZ1iL1vRGjzPyETPwy+7BLGgC/Z9wXKQ6M9eCaQ8tw
         Z+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702292915; x=1702897715;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p/RqXxfpj+JRqX9l19TDqZ+cjowYfkXBepIWo3cd1zw=;
        b=faPfiMYmDqEsEktK0wOU+EskV2vi4/+mSTbcgMZvl5/lgoqrf9oe9df9YiTa6wvGJD
         CBeRjTAV50KRKcAD1nJiok8ie4zudmyBpqJyO47UPJ+WRLzwGaInneJqj0GPElJDNne2
         aGwkCz1yg7Bfq5/qZloD+0voWh/mG0YF40nTCOJnbSUG4Bni/+TPX4h1eXYXlorFaMzP
         TupOgDS+l51OL0NNnInMeIGafIyUy3SffUDrXiY6PaxFpKUW+QV/0EvaZjpeGziMIV63
         ewemTvoVSHVJUxjtrSc+hUCIq93iefISNHIgh2v1zsgcf+7xmhYO1XwhJjoj7Y7Ibgi+
         hGIw==
X-Gm-Message-State: AOJu0YztdGOFXwnvQ1Bj9r8ecAOVAmGkcEhWJEMtIiL/+3U/3BbZ1xrn
	RcPCS9PZY5g8TCFYMO8FYuPU5A==
X-Google-Smtp-Source: AGHT+IEAVqD2pf0lIXHv9RUG24iG1TBtw72baJaE34DMMMFURDxTmpCN0F/Nfq6dzs2YGWB8K4YoLQ==
X-Received: by 2002:a05:600c:204c:b0:40c:2788:28f3 with SMTP id p12-20020a05600c204c00b0040c278828f3mr2094151wmg.79.1702292914759;
        Mon, 11 Dec 2023 03:08:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600c450b00b0040c495b1c90sm2263608wmo.11.2023.12.11.03.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 03:08:34 -0800 (PST)
Message-ID: <5c85ff3c-3576-4415-a8f1-07d786201dc7@linaro.org>
Date: Mon, 11 Dec 2023 12:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: minor whitespace cleanup around
 '='
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231124094739.58163-1-krzysztof.kozlowski@linaro.org>
 <20231124094739.58163-2-krzysztof.kozlowski@linaro.org>
 <4150bf8e-a48d-4d16-902f-a95f6489c6f5@linaro.org>
 <449d675f-e98c-4924-ab81-14a139081a97@linaro.org>
 <e4a163c0-5f4f-4c0e-a597-1ee06a84f3cc@linaro.org>
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
In-Reply-To: <e4a163c0-5f4f-4c0e-a597-1ee06a84f3cc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_030836_143341_98AA0452 
X-CRM114-Status: UNSURE (   8.99  )
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

On 11/12/2023 11:38, Krzysztof Kozlowski wrote:
> On 11/12/2023 10:10, Neil Armstrong wrote:
>> Hi,
>>
>> On 24/11/2023 10:49, Krzysztof Kozlowski wrote:
>>> On 24/11/2023 10:47, Krzysztof Kozlowski wrote:
>>>> The DTS code coding style expects exactly one space before and after '='
>>>> sign.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>
>>> Please ignore, that's duplicated of my previous send.
>>
>> I don't see a previous send, so I'm confused.
>> I can apply this patch if you're ok.
> 
> This was the original submission, which you applied (Thank you):
> https://lore.kernel.org/all/20231124094700.58071-1-krzysztof.kozlowski@linaro.org/
> 
> Both patches here can be ignored (applied through different series).

Ah ok, right!

> 
> Best regards,
> Krzysztof
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
