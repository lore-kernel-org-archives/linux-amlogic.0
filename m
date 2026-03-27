Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AEF10F2843
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Mar 2026 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAz5yG3QAH8tImpb2sdsBXEWGqQwB5IyPYVHSEpEAxY=; b=LViy0PPWZ0rULDTondmqmI+Vrg
	qzWTKs9CFPxm2QpeMMTcKtOmHHcLJMj9v9eWTcEXy3us3rliZC7phnFk92ts42lBQDXFx+O6zS1Iw
	5Q5X0eSwEMGdllxQxNRWRmLyg4FQfwlA1ZlntRsE6NzFzJsNneWlZimzIOuVfciK0q53zTFzAdl2i
	5mYGXvxpafQJ5xoe4W2TCjyGek6nVKFD5U1u0ySLnC06iZdtFu4j7MbXJI2EvAjqgjqIra27sp//d
	s/C9oQh6LvYm7cD82vDE08cj5jUMtdY0kRcc6PIKWu2//5b9+xJnhKUq57wa56pwTfwLCL8fh1ZUU
	9+XjE2+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69Ca-00000007hGO-15ra;
	Fri, 27 Mar 2026 15:34:24 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w69CX-00000007hFl-46WI
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Mar 2026 15:34:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439d8df7620so1619038f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Mar 2026 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774625660; x=1775230460; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjKuvUBQiFpFuXYPv0VREJdyhtsXZOAchMgwkjnvo+U=;
        b=uQGgpN0G3zaBD54jt+xq5vCTOQQDNtqIZXYLz+pKJ3h/5prBnNrvc/ci6l9IADFELC
         MOxOUXMmb/bnc/8BhzDQkxMAsosDs/BKZPe27e06JQ6EEAXSr0FjhP4WRTawNXTiMfGD
         ELm9HjulettYS+i/Wfi8+jdfuT7y4t8iVnC2CovcIdhtxeMqaB/9uk2ftKQRvTcrRVhO
         2LjTP0cJ3kijAEbU3OsLySjCYvucpaobt792CTq9aFKmu6kmVpLGSbK4bcST4fTlLe9V
         zIg/6JBrWCPCEX2kZ1cdjhCX7gIDBCS3ZxGRFmTlYZ77kdWdqHU9lZj3U97NTLhsn8g6
         2Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625660; x=1775230460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RjKuvUBQiFpFuXYPv0VREJdyhtsXZOAchMgwkjnvo+U=;
        b=JoxbfmPuElQWjQ3SSU5pXF23BL5zDm5W0TXX63bwr8dMBbLu2el4eT5Gh8g8SOHlOA
         2nT2T7aQIygNNeLVEdJzqinr+LIin8/bGyINbZjde+Od71mTfKBl2fZBZb+Xo/fmiKrq
         vXslZ+/k8imPMwEGrDaQHEwYLVIVgkrHWHQUOEyACkCVOp0bjPDGm0xYT1KenQKeZTHL
         OhaNM3Islf4njqjdCZjGPi7qso+U31x0rWWpeezrN/Nd+Ghq0PD1VODBr3MtwKQYT5Lj
         RqsqYCOKkIfurPEo6OxGxoSiRD03SUI7FWthlWwlVfXSVFkickQlIThhzlS2shzVN66w
         /e4A==
X-Forwarded-Encrypted: i=1; AJvYcCUFt4TPhy1Jd1I7yMviv6+hwxB7wRVtNiNC9lGh/DGfzdcejwQYes1InPehxPshICdcYQWuV9pMUlaOxY0I@lists.infradead.org
X-Gm-Message-State: AOJu0YyQqaiaOq3oLQmod1m8uIZRcY4slpHqvY6gGrY+GC3fVha/TaG7
	Ak4zcsnQbJZGKazPvz0nLcvaUyvIkdRuq9PG5cmM07ku5bOY5b4zEdv7wPCbLsHd8kg=
X-Gm-Gg: ATEYQzxUAiYFfMI0N0Z9ETt0jjKC860gxCbhCKOartEPw/GTGBpKI2BWg35Xnq9YRMm
	eZCsFOewvWUYp7uf33TnB8w4IqRVNLm5A7i/W/l4xQl0uOnmFuhYObSmxOcH1oCAdQtxTf0xy4C
	P+vnXRDAnI3fIXm9GJbgsQHzMgIGJdKPa07WZsHsq+LDM7hA1J84MBpwaNnGmAQwbAD/tDkX9w7
	UlyBuHbf4hhGdS10j22zB00niK+Rixc3QXF3FrPeTLMkCe0LCubl6SjdPENYNb5TaIZtrnAnbIA
	GPKLpUjUXgbbC1was1HURYCPnWha5nuXTxN+DbymCD67uDyKu8KI/0uiF6+p2JXTGvY/Wx8LbI8
	6QzewtfmcFqwd6p8kfW3evAOeZQ5L+1568GwkdFjOoNtNCI/D8OX4+DLdVq5Pea23TgNG4lxW2m
	jTpUozByKkF4K6Qv7vaF7fwGMG1hjLPtROhVX48b4SPKaMoJHkjp7lxinDa5lC6fRiBQMx4hQBL
	1KOyWk=
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr5245421f8f.28.1774625659628;
        Fri, 27 Mar 2026 08:34:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:39df:9101:d239:f5dc? ([2a01:e0a:106d:1080:39df:9101:d239:f5dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e5f0sm16597152f8f.4.2026.03.27.08.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:34:19 -0700 (PDT)
Message-ID: <f8c47b7d-29ae-4aa1-ae92-07dd691b3b92@linaro.org>
Date: Fri, 27 Mar 2026 16:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/3] arm64: dts: amlogic: meson-s4: add VRTC node
To: Nick Xie <nick@khadas.com>, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jbrunet@baylibre.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327093016.722095-1-nick@khadas.com>
 <20260327093016.722095-2-nick@khadas.com>
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
In-Reply-To: <20260327093016.722095-2-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083422_026372_F752EBB9 
X-CRM114-Status: UNSURE (   9.96  )
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

On 3/27/26 10:30, Nick Xie wrote:
> Add the Virtual RTC (VRTC) controller node to the Meson S4 SoC dtsi.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 936a5c1353d15..2a6fbd5308362 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -59,6 +59,11 @@ psci {
>   		method = "smc";
>   	};
>   
> +	vrtc: rtc@fe010288 {
> +		compatible = "amlogic,meson-vrtc";
> +		reg = <0x0 0xfe010288 0x0 0x4>;
> +	};
> +
>   	xtal: xtal-clk {
>   		compatible = "fixed-clock";
>   		clock-frequency = <24000000>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
