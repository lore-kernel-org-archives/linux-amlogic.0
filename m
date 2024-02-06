Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AEEC4829A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Feb 2024 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lr5UwbHF2EL2b4/qYvpizfY0xQH1cOKlhsjkT5mwrQ=; b=XA+A2NnBbQ+oZ6HdxaxxShKsSM
	1rXBurRWOR0HGBdD0Pp57dKhymXoJUtNDtsUf3DPD6zPDrsC3+shM4xhenTNB8kdNuptYpoB4OD/W
	LKVbMurgJ9dPFJIuyvPQP/Zm2Vaaq0K04j/QJSaBJK3e+4cptaogxU/dRn1fgDwmQCXuOYHxB+Z0B
	I0YUtKNQ8JlOLKELC+vaEdsxLh/S5buthHb4ChX1a2YVhbUdYwxiMRL1iquuOLU0wMxNwtlaOLHf0
	4aqfEG+xoV7NxwFln3EPa87JVQhHhy+kiY2MVKYYFI9GnoqKcxzwnlWieM+gmA9LK+OKALYe+hlLJ
	w0maZBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJQX-00000007G5L-0o48;
	Tue, 06 Feb 2024 11:15:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHDz-00000006Y2S-12k7
	for linux-amlogic@bombadil.infradead.org;
	Tue, 06 Feb 2024 08:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=PpfNty4V2FJSl99hyIMrQ7HHIvMTg7pW9dV5rhCPpfQ=; b=UnMvBxBRTkhAFlq3+rh/DVHiSc
	PMdJlOp+pxmxR+xk0B5zuYm/rHg6MLm9so0227+Kh4Jabc6Sj11aDoyNoOgcqpsMX6T98xBDwkveC
	7bFR7FRhi1cisRCeWquHMO5QYPfB53jCdaMspUOuGZTZnQs8C2YPxVH5iwSY6YMJjPc+0QWuOkfLE
	pUeiihPzmsMhwY7Ly47gjUji1qRth9qODjjCK9+lOPdrAkOH7pDLLthDkWCzlEVMj6Eez47UzozrK
	tHbzKOKVDQiDhLdeSWVVvuCTnMXgyOebQN2qMFiDvRC/yZV5Nwv9h4Bn140eSbLHFi39y4ZK43SIg
	VNE0o23w==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHDp-0000000CORa-41hi
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Feb 2024 08:54:32 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5114cd44f6aso2312154e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Feb 2024 00:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707209665; x=1707814465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PpfNty4V2FJSl99hyIMrQ7HHIvMTg7pW9dV5rhCPpfQ=;
        b=adw2+koWqb5fie2zui1cApt2PPFJdpNGfm1dCjShmFSH5yN3C74Qf4VnuAreMsh5hU
         FISKqMl851C163sTBggWV9wjhIYg9rO+iYYFrQX/agn0qC0GYDuCwt99ItPIQsRk7oSD
         WyW+D5Xh8mEyrEHIzT2sF7lWncBGiurIwL86Ko+kPk6gD1pAFpPaat+TNBPo5VkqDrtq
         V8Y1CzW1peMlznXUeD6VyAqHE0ypaPos9IqQJxP8B0/1/D05UoH6z6/1BABNaUJL19dh
         WT/R9ETjjR2RavSRQRpr00e9z3aY1/jUhrFihgi+CH3XxTu4RU72E5DdQ+vIKOhqATjB
         FsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707209665; x=1707814465;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PpfNty4V2FJSl99hyIMrQ7HHIvMTg7pW9dV5rhCPpfQ=;
        b=gJSvFcdmYAuXSN0dy1pu2TKC09ztEKDfH+iFBvF/BMD8ieZYNHSjwUnW2wbcthVCyt
         ks1/0xACPuqPuDgIW1PSPUjgRZ/NqJi9CQGm2XfvyeD83uHqYDh4kE7pGl+J/EOl9OpQ
         Iun490xm+dL/aH1gERc3EXkdwlFCQYP3fbEh84oJmUlbbOtfc1F/IVJy65/2KPXuMnSh
         LgU1caQWVvtx1SAXYRsI3MU0LKEHwpjp6GJHJBTsfqVZms1Op0SH1yTxatYGCHZxSyaT
         PL6HjdtNhxMIHhUuoZPr45RVOaNJMbhaShRXYtyqXW4EJ1qEV3C/zAs9RWqmlwPePsq1
         WRbw==
X-Gm-Message-State: AOJu0YxDJQTtFcmJMb5JAr4woJA9pkAjRP/kAaFKazSgS4ko0XrAlfZF
	K86Lds3W1eRCOO77M+J4jWx7cMJggo0Mnn4t3qqzupdi2Y3nDirwEUQlIngiS9I=
X-Google-Smtp-Source: AGHT+IFDuq2X6Uvryx2hWt2fAZuxhgi0XTgVH8xY45EUkgsc37IDyLafR++qOnorPu2PMc+4r2ZTDw==
X-Received: by 2002:a05:6512:401c:b0:511:48ab:2f9c with SMTP id br28-20020a056512401c00b0051148ab2f9cmr1639393lfb.42.1707209665385;
        Tue, 06 Feb 2024 00:54:25 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUsA3tHV93bjseQi9VAWCbR5rYjl+ynyrSGk88N5INNZDvQL1XbJfo95gKDoH+zgAQiLSdYxgwdKdbnOIZXHLccA5Kb+G1PYItQQr5OFFa6dwgO2VWbDNu4G1HSgoqTCqrGQ/8YublNLuk4l+uEJDy6fi7MLw4imMjw2pBxUTAkiLsSgUZepH8FTviIkskqvGoRsG20JVXnq9kas3aLPNRVa7QdvgNnqZo2GoAp3YqX+2Mirru59YyyaoEMgmPlIGVPMVAPrE4KIytrewPkTxMWdaeYD94rsG0KgWs91BeV16viAeUqRM7sUC7h0Qt+nK/DyFUI1QpfvUYYKDS/OGQhpDgD+XBJoF7fVhsBSExw9n41wmYHBs/mtFi1rJC63WnL1ox3ubEKfggpZI/FKN4OcQ==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd? ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
        by smtp.gmail.com with ESMTPSA id fa13-20020a05600c518d00b0040fb03f803esm1251337wmb.24.2024.02.06.00.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 00:54:24 -0800 (PST)
Message-ID: <26732d5a-9fe1-4662-9362-ed397d266e01@linaro.org>
Date: Tue, 6 Feb 2024 09:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCHv1 2/5] arm64: dts: amlogic: Add cache information to the
 Amlogic SM1 SoC
Content-Language: en-US, fr
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240205171930.968-1-linux.amoon@gmail.com>
 <20240205171930.968-3-linux.amoon@gmail.com>
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
In-Reply-To: <20240205171930.968-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_085430_721781_236E65D4 
X-CRM114-Status: GOOD (  13.53  )
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

On 05/02/2024 18:19, Anand Moon wrote:
> As per S905X3 datasheet add missing cache information to the Amlogic
> SM1 SoC. ARM Cortex-A55 CPU uses unified L3 cache instead of L2 cache.
> 
> - Each Cortex-A55 core has 32KB of L1 instruction cache available and
> 	32KB of L1 data cache available.
> - Along with 512KB Unified L3 cache.

This 512K number is for the NPU, AFAIK the CPU L3 Cache size isn't specified in the datasheet

> 
> To improve system performance.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Datasheet
> [0] https://dn.odroid.com/S905X3/ODROID-C4/Docs/S905X3_Public_Datasheet_Hardkernel.pdf
> [1] https://en.wikipedia.org/wiki/ARM_Cortex-A55
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 39 ++++++++++++++++++----
>   1 file changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> index 643f94d9d08e..403443e782e4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
> @@ -55,7 +55,13 @@ cpu0: cpu@0 {
>   			compatible = "arm,cortex-a55";
>   			reg = <0x0 0x0>;
>   			enable-method = "psci";
> -			next-level-cache = <&l2>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l3>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -64,7 +70,13 @@ cpu1: cpu@1 {
>   			compatible = "arm,cortex-a55";
>   			reg = <0x0 0x1>;
>   			enable-method = "psci";
> -			next-level-cache = <&l2>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l3>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -73,7 +85,13 @@ cpu2: cpu@2 {
>   			compatible = "arm,cortex-a55";
>   			reg = <0x0 0x2>;
>   			enable-method = "psci";
> -			next-level-cache = <&l2>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l3>;
>   			#cooling-cells = <2>;
>   		};
>   
> @@ -82,14 +100,23 @@ cpu3: cpu@3 {
>   			compatible = "arm,cortex-a55";
>   			reg = <0x0 0x3>;
>   			enable-method = "psci";
> -			next-level-cache = <&l2>;
> +			d-cache-line-size = <32>;
> +			d-cache-size = <0x8000>;
> +			d-cache-sets = <32>;
> +			i-cache-line-size = <32>;
> +			i-cache-size = <0x8000>;
> +			i-cache-sets = <32>;
> +			next-level-cache = <&l3>;
>   			#cooling-cells = <2>;
>   		};
>   
> -		l2: l2-cache0 {
> +		l3: l3-cache0 {
>   			compatible = "cache";
> -			cache-level = <2>;
> +			cache-level = <3>;
>   			cache-unified;
> +			cache-size = <0x7d000>; /* L2. 512 KB */

Comment should be L3 here

> +			cache-line-size = <64>;
> +			cache-sets = <512>;
>   		};
>   	};
>   

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
