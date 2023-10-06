Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9AE92FEC
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kozros3NWmGtYWUh/AxgAdzioMfdoRIlgIpuC+BcNEE=; b=cJkE5qBWyG3xi7w+d22fs7Icdc
	KOMqasUK69wRqQzncQ8888CFQ6CK0SsSVzjf+dRqAwpP4LUBKerwZBZZIpGvwiZuCtdqkrpChh3q+
	/3Ztin+Uuk2L7jhZjpzWRF9Rm0hLgndURGQOCKUutrJwW/H+zBmbIxXvSgszeh72hpTSPQgvWVfpQ
	B3z//BCIkUzu+qxodYkSC2FOc2fEViaQxhu1xySqUDIq1z5UmhkG4SIfDGKwdEoeKndIzm4vJA383
	XSsuvXjhK4c/litLTVd3j8vqVY7Fu3MBwvjC3BSfuwf08o5G0krQjdX2VQBYJ0iCBqFBr6CVbAxBI
	t6Bu9o6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeUY-0055Qw-2W;
	Fri, 06 Oct 2023 06:39:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoeUW-0055Ps-1X
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 06:39:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5068692b0d9so293518e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Oct 2023 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696574352; x=1697179152; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/Oe20eq5hm/+Em5p9d3iI+mb2ITB6meerwxw35smVY=;
        b=nvbHuGqOViKIoVV0PeNx2fxy6LbEFLUf7ZGk+RqKCObxZnSGK2opbWvojKA1YJnvUs
         y1OFTskR4T9CwybfR80Yt6xVDb45PK1TdHYgR0mtokOWQ2K+LPpZmpSPVEcYEZuuRZU5
         ytQJja92UEa5wAioJ1+/Nd4mYGqrcDeCWZxQpxKzOgeHV7tAkMXzWeDicR+5INCoduDP
         p+b+5VUGKHEpu1eg3jElVnsDhlOc1Z7RsUCfWl+orDTs7S2A3awlmptVn+SPfMVYofiI
         seG99wRcgkWKzfzmRme+t1JrZSqM5HYMUNPTDFaMwyX3AzD9dktYQvuj65InI7DSxPQI
         cMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696574352; x=1697179152;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W/Oe20eq5hm/+Em5p9d3iI+mb2ITB6meerwxw35smVY=;
        b=HbqeHZbWhp0fdj+11o7SZjstNoKpoPg144uyP1gBm1bB8WJ2AjPQtsco5BIkykJ8Z8
         ozkvE6T13UVJGmhZHtD/MLoBaqEBXsGFfA11Erg8nEaVal9YuZvZf09puUeulCNOROGs
         MH1rWBc2UjF2yUNrxLocvFGX8RTqlLnO12fzAqC5mFPl0Wga542LTchYDoNU7mXyKuog
         QSacZe/ek1mNQYNGB+jShhtTwr7LwK+HolZdaVQu3D//DbKlTcEo0ROFtMbYx0c/kKPT
         VwHClhps2TPrQiMOEh5b3rT+8UCn+juc5GUmzWOKkC5hfwkzF1G4xMQWK6MLTcpUFRSx
         vG4Q==
X-Gm-Message-State: AOJu0Yzu+NASWgowcVwRz47+HBxIOu0JyssX5H/gfUdZo2RtnkZ4ssJ8
	0pK3g/i2GsL7GZf4vhpqpZOW6A==
X-Google-Smtp-Source: AGHT+IGDgHi+Dqi7dzq19URpX2w0CDyuB/8q2REgQRlKgwGayqgeuRpXDzX5nux46VGVeMRQQgdWjw==
X-Received: by 2002:ac2:43cf:0:b0:503:655:12e0 with SMTP id u15-20020ac243cf000000b00503065512e0mr5995373lfl.50.1696574352377;
        Thu, 05 Oct 2023 23:39:12 -0700 (PDT)
Received: from [192.168.7.189] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b0040642a1df1csm3042793wml.25.2023.10.05.23.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 23:39:11 -0700 (PDT)
Message-ID: <bbca1c2f-2b7e-4132-a23e-12bd41abfec5@linaro.org>
Date: Fri, 6 Oct 2023 08:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 0/2] arm64: dts: meson-a1-ad402: Add SPIFC pins
Content-Language: en-US, fr
To: Igor Prusov <ivprusov@salutedevices.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Cc: prusovigor@gmail.com, kernel@sberdevices.ru,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231005195543.380273-1-ivprusov@salutedevices.com>
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
In-Reply-To: <20231005195543.380273-1-ivprusov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_233916_514540_8065CC9F 
X-CRM114-Status: UNSURE (   7.16  )
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

On 05/10/2023 21:55, Igor Prusov wrote:
> This series adds SPIFC pins description to A1 pinctrl node and selects
> them in AD402's SPIFC node to make sure that muxed GPIO is properly
> configured.
> 
> Igor Prusov (2):
>    arm64: dts: meson: a1: Add SPIFC mux pins
>    arm64: dts: meson-a1-ad402: set SPIFC pins
> 
>   arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts |  2 ++
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi      | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 

For the 2 patches:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
