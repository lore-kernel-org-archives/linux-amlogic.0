Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D481AC369B2
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Apr 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALN/gZhlf5WagcKAuaSyt0HeLwL1Y1mnyyHZN2/XwLk=; b=D9uMrt5XQ6QBbFcZucZjwacaMK
	65B0jUHDhWh8jQ29GeIOoeUUsIjtbaTiucH1fPqr+EL1vS8er47Z/qtGtZAIWobc19Xbj6tw8xnSS
	dSNspvMOYID6ltgUXD3zEdNG0By3IAU97ogzhVFoXHmXnZsMPz9BpexomK5PrQsxnKT4kmSLaje9B
	bu4/eXHvDUldDRE+f44I6p3/8IhTBhAqcyzIS612GYeZbgNn86qRw/2oLsKBs5V4/pr+c8BNRQ3Jh
	ljhIa3qZ12JIj6AC0VEwux4nNULSqrRxBFxJv1sfC6pJkyTeeuYlnU7KPYRTgq3/0VWh+A1xo0ejX
	qfvQ6mDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HGh-00000001aYV-2PEm;
	Mon, 14 Apr 2025 10:42:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GxT-00000001UzX-2COU
	for linux-amlogic@lists.infradead.org;
	Mon, 14 Apr 2025 10:22:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so19037895e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Apr 2025 03:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744626150; x=1745230950; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TW2P21MZtVFsuF8DinY899lkZVbNaCtSvhTYV3sTkc4=;
        b=e7S9U3YoumeGdioCe0t2FziLmdQbS5bm2FPRg+li+kG3p1uKOpnz25ngrnXWmeN6px
         wUzy3dyZCiUHzqCFUdhNp4jIrveQWaYPf0iv//qUWHsxudGYq4UZUaUR+M7alL8FAYzX
         1UP6qdUR1uTAivynsE7tlBuDbrWEP2O/jYPgzokdU/pZ4oKGertYooilOyyRrnnae6vW
         05amW7br958t5v4kgK6sLWzBuHD2UFziyVO+6Tl7MGAbe4Ue3CdZnwKyyEOJOKza3vb3
         QbahHJS5nVZC6nQWMwvxSMhw3piudLMm5VLgzwGmYWQkrMBsciPpR5Y+MDZdTdvyn7QS
         VNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744626150; x=1745230950;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TW2P21MZtVFsuF8DinY899lkZVbNaCtSvhTYV3sTkc4=;
        b=fGeLTnv+yzRG/bS8lwaTt9xF1R/jeVphS3YvwfTncNIib0A8JQ/Q3q2h3Uu3iZhdYI
         9AsLq9fDCoOr0qmTRMZDl/rtULMkVCsiD6/puw87i7WFg+g3AiSit7B5tKKXGhNBdbgU
         ryzzCfiX1PACa0NH9g7G0n2VCN6tsi3bgz9YNkHVjHf+b4MBdHLFHSXJqqJtnL/thHUu
         fwRW0QlDZi1QpBhlXijIns+WYunWAb+tmWF4Qt1HvaS5L+lFHSSXq+9Q92mxBeZ7piPt
         sDpl8sgWJlBZXSoZt0ZWOW+xtNgvGoaFw4m0Bo12Puh2Dwr4ZMBPlOUKu2hpIRUuDX5/
         /O+A==
X-Forwarded-Encrypted: i=1; AJvYcCVlfsPFzTtzDwpDZSpzsB6LvFfUZ15A6fxvsMKAkXL1dJx5a1NZvnL3Z6fQWIOVpnb3lL9A+9nqgBqnu4Iq@lists.infradead.org
X-Gm-Message-State: AOJu0YzWMF7UwmOgNVYfLWT1sI/D8m2qwx3mI/v3QHM7IOv/z0TTm84J
	Exg94Ls1wowsDZQ3Qeq/IlXPIwaseWhT5/0BiS1iQVXFDVjnACD5vit4ufwy7ic=
X-Gm-Gg: ASbGncvTzQ4rsqlmYu7CVM2e2x/f8oh+uvn4CYrIhVDe2xlqqHL1xmuGLMeGLARUHzy
	mJ+CxJTz4C1x3NmZR71rfPvka4tyYrKGjfEWY4IS8SB8CklrcCnWRL5wY8sFfDhkqF2tOpBo8dh
	vDygT0pAVf5Ly8hwEFFt/vSd+JPM4pvasxvcZ0KEPNxTm1SFNE1bIocnsn2hAYioxni9azFigBB
	vD8f/22KeoaNAvhKSE9YNpSqLFsjDmD2ApO3Yi1WNo0RSYgRghJhoXXfAPtaQFknLkI9dR+Mgll
	fKdy/IwBfLksZMXpZLe2G7XWnqZZK3t2xMBp2eQ30Y1E7ZkAwhAQQymhIkfq0MfXJmGNW4gNbDG
	YO/ogBq+ft+FfPAMoLA==
X-Google-Smtp-Source: AGHT+IFnnMpxrRX1IKPuzqKZUlJI+OH8HM/bkeHBq5BL8g7qMG+PpDEIxDigohVIq8aVk1XuQkVaKg==
X-Received: by 2002:a05:600c:1546:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43f3a93cdeamr103560625e9.12.1744626149598;
        Mon, 14 Apr 2025 03:22:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743? ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d004sm178412845e9.18.2025.04.14.03.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 03:22:29 -0700 (PDT)
Message-ID: <d38ac821-e98e-46f6-8649-78da5a56f48d@linaro.org>
Date: Mon, 14 Apr 2025 12:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 6/7] arm64: dts: amlogic: C3: Add clk-measure
 controller node
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
 <20250414-clk-measure-v2-6-65077690053a@amlogic.com>
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
In-Reply-To: <20250414-clk-measure-v2-6-65077690053a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_032231_579618_2607224C 
X-CRM114-Status: GOOD (  10.79  )
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

On 14/04/2025 12:12, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Add the clk-measure controller node for C3 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index fd0e557eba06..cb9ea3ca6ee0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -760,6 +760,11 @@ internal_ephy: ethernet_phy@8 {
>   				};
>   			};
>   
> +			clk_msr: clock-measure@48000 {
> +				compatible = "amlogic,c3-clk-measure";
> +				reg = <0x0 0x48000 0x0 0x1c>;
> +			};
> +
>   			spicc0: spi@50000 {
>   				compatible = "amlogic,meson-g12a-spicc";
>   				reg = <0x0 0x50000 0x0 0x44>;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
