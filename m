Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4015CFA466
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Nov 2025 08:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHtANiiVaWLrG/JuRzt6+2DVOs46qgW8t/ziCSmKnCk=; b=sFrlpzAWDGvxLgpjQ944UVikTj
	QUpiaDmICpEutzy1qdk7p26sZ/tGgolOgyTTiOIbV3yk2IXMTXDvS2Z1OZzDGBMWEiB0zgGQWMtlv
	xhBmIt4YM/aMEzCdjcfgCpWaxELg/lG2G06s8rI19FGp6Rfu/hRic3KSHplSJt8dEs2qgtU9tHA/G
	6JkM7aVJ5TDfhXlZCHcAas6LbY5crQfXJqcKx/ZFpksHKO/0M9G+TwCGdCSoZXZqa8KVNLmPzkkDG
	jzrAKNpgQd8o747O0nxArlrPUxUDRpjqFWJ3wuwLei4wixj+ufVQ8DlmAA490mnuvqBbzPI4+jkus
	NZELTRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRus-0000000BHNs-2pgN;
	Mon, 24 Nov 2025 08:27:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNRup-0000000BHMu-1MQu
	for linux-amlogic@lists.infradead.org;
	Mon, 24 Nov 2025 08:27:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so25508505e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 24 Nov 2025 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763972837; x=1764577637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxBsA+u52Glx00g9dRDSH7FR8fkXTnZDlelCU5NPOqk=;
        b=juppovyMtJg4SlbtVnJkLD76VXEGU5fIB/z35/zdG7prsFzoik4UsFg2PFTh6ku2UU
         L9Ii7bUKg6NofytSj8bsF183imIjgEJhEgXqsWCAdlcWRb+8QH8fLSF/i/tvFM+nDPlS
         RQ+aamrJfmKGwx1kjxcLrflLmStCsAepA7YhFMqOR6C1R7a2eHaoRracnyLV+RR8tcQd
         v+oHgNxpFWDIUw+VJX/dmVuw3M8GFZu5tFa1x9+wtDsiOiRh+OC98lxJgLZCkDzB6mZY
         HBDSEg2mlVg8bl28zXIk3TH0KfABNUhPLYZDRfnXaVqJSK3vZWRgvudMYxt6kCIMMxyp
         8kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763972837; x=1764577637;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxBsA+u52Glx00g9dRDSH7FR8fkXTnZDlelCU5NPOqk=;
        b=AViEVjWO/RAYkdS+TNgIuvlNLNilfkP3Jg2qxZc+sYH+mYT8geOlm/6Y9OQPkRpnkw
         n7q7FucwnG6uKFkRZ4wkt/Ch+xtO3zjwVwCHqf0lFhGsd35s63o0tSIsp6Eo1VWf1k4O
         CH5KbAVYpfVUui6F4KGSevML7jJIGPY0BifQp8SJpri2xTF7+RbnotqpDu6hvz33aWty
         Hp0g4Kxa7nax04aZ6ysFSRHCYA17NwLUhtKR41jiSjDp4qVJhS9S1QZNbAooBJBRcW14
         NVnlaui32Fee5yHegMo1RGc03SngiezEBUCExKVU7meeXkuSiQeJEg6I6Aj+7Av7b91D
         lkiA==
X-Forwarded-Encrypted: i=1; AJvYcCWlfdSnIPbkvpg03+yfqjMzbweMcESxXUUJBflwEFO140YY5esJOum51ihx24gkegx5dITKL7EZLre5+ZmQ@lists.infradead.org
X-Gm-Message-State: AOJu0YybnGTCZSn3gSHMyHfOhnjI1dLYF+QMSNr62e+HW8wYjIP+UMCu
	XXkymZtgYcjapn4F1c4OrbSHQEMu/ztBi3Arua7D2LohY+s+nCtVOYRuRfFQ9Ui/+wo=
X-Gm-Gg: ASbGncv2cCPpaNwkU3uMZp7u5Pa4Um/AWyO+WQ4N5bRDXcm0iVujeyfYIApThXc9EWn
	6+kW2hHKZVk3AW79k3V6QTh4r0LDSkqD8Mkzi+mJHiUs4BroRjj7I4JGu16bniGLSukSjXKSMED
	DFY8862gxlOOrNDdKax8xUDskouZ0FYP0SJwzhWrU3L065+Lju9sSONkAS4XnjZpClMhTszBcd/
	twyuns5lAzK/nVPyf7z7dWdW/Xc/phYL7pVCY+NI07cNGIhjDyNJddPnE+7FTo9uirbnuQHRwDi
	bS+tSK2bnxorjI8BM60nX0ssbsqe6juXuf3WE6EgCy16FthlDAo624FjyOAuxXpVQN1MtDWdD13
	58aA5HyxjAziu+NzqmYBFDQ/EApcVJIhd2jXVNebIU+HMyeK+/w4IBp8cCqe2/3BUu+vrkN/yR2
	au2LzkEDts+O4dK2dDWweRzUS/uBae5D6VFiw1oJCuIvYLqcaI6FoaKsy6desaeHU=
X-Google-Smtp-Source: AGHT+IEmDEtuYmnXYRV6tZiqi54hm2qUz17sARsuhORYI/DXmb/Dj/FFZngja8G3IWf3t5i4YFRQNg==
X-Received: by 2002:a05:600c:1c98:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-477c10d4887mr86783455e9.9.1763972836912;
        Mon, 24 Nov 2025 00:27:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:ab13:96f5:1459:8396? ([2a01:e0a:3d9:2080:ab13:96f5:1459:8396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf355af6sm183596525e9.3.2025.11.24.00.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 00:27:16 -0800 (PST)
Message-ID: <144870b7-133c-47e6-944f-b780605618a7@linaro.org>
Date: Mon, 24 Nov 2025 09:27:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference
 for S922X CPUs
To: Guillaume La Roque <glaroque@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
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
In-Reply-To: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_002719_408545_F18621C1 
X-CRM114-Status: GOOD (  13.36  )
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

On 11/23/25 18:14, Guillaume La Roque wrote:
> The original addition of cache information for the Amlogic S922X SoC
> used the wrong next-level cache node for CPU cores 100 and 101,
> incorrectly referencing `l2_cache_l`. These cores actually belong to
> the big cluster and should reference `l2_cache_b`. Update the device
> tree accordingly.
> 
> Fixes: e7f85e6c155a ("arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC")
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index f04efa828256..23358d94844c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -87,7 +87,7 @@ cpu100: cpu@100 {
>   			i-cache-line-size = <32>;
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
> -			next-level-cache = <&l2_cache_l>;
> +			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -103,7 +103,7 @@ cpu101: cpu@101 {
>   			i-cache-line-size = <32>;
>   			i-cache-size = <0x8000>;
>   			i-cache-sets = <32>;
> -			next-level-cache = <&l2_cache_l>;
> +			next-level-cache = <&l2_cache_b>;
>   			#cooling-cells = <2>;
>   		};
>   
> 
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251123-fixkhadas-c84da7d7c47c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
