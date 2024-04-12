Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97055C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 13:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w+iA/nceWQSb7P4mgrBOHflROFvZMKTWlAy6Q1DqKA=; b=Tl+KTpW14ibVtzXEM0fOJB6Wha
	DaodYwJlBv2Na/BidFOFikMoGwBXooC0iz4T0lSaeFRM3N2Xp90d75jDlbmxnsiiepOj2wLzuBzNl
	oQfLO7oPvM7Qi6gmkj853tmdUkCKsipsCSnHIzXkhHoveL5SV4n+IzCAQH7OW48M4+0/wyG+bdiyK
	HqwVmHrQR5ymQ0vR3H5iO1yIYd/QeutGd141MkccX7iQeCk8BU3v0wvv2QSJ00dvE+xq0NOIehTl6
	kavCK2CU+5FlT8pJAcBrWKZHfUhUJk4gf76HWlA1Yj8OMbEsvVvskaPBJQJLiuxRY6a+gKRhYX8Ux
	a0yGoG3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGav-0000000HDqC-1Pp1;
	Fri, 12 Apr 2024 13:05:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvGan-0000000HDo8-1zeL
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Apr 2024 13:05:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3442f4e098bso1101251f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2024 06:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712927118; x=1713531918; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOcTNt5ByY5dfitA7rAX7DzfF2K3DjcIDFUSulbTkvM=;
        b=pWYupy8T6nWQtrnLOguhheJS4KPSNaIbQHWPPjjJ3GOyXDtMjFuaIZ0FjeSKtvy4S7
         96V+FNY8NPQFakhjAPqIluRAfOmFL7r2Zt6Evz0iUmUNBeWpFndRHPD783jr3H9o0fd8
         bdKTyeAAyZh7BN7OEedDisVNKoppa+Q+fGL/uLsnpYMmD/oodnwiyX2tjLTxuoMBsf5f
         UztMvnTILtGgh5aZMSXKm5O3P+0aqC/ETc1WQWgNSBzBDjIixcKlK9eTyLDavNzsMNHd
         xJ4bXvrX0oOAjzLljm8nfXVgy4cE8e8OJgZ8T/9W090KCVPY9iME8ue/cF+pRz6jox6V
         iOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712927118; x=1713531918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xOcTNt5ByY5dfitA7rAX7DzfF2K3DjcIDFUSulbTkvM=;
        b=epWSU1TxEP/EZkvauc8ABbLkf1mGN+HQvlrv8zyF6CBETGf+9mB38kLYD/y+qtlHM0
         6VAV5P0EB4EZGOo+6Lkg6KpVF6RhsPmdlyHWXbzP7TQwpejKY4r3P/QyKq1qCIWDNElC
         7uSSKO2TJhhu/esg+x22sxvG1/8Krl8XcPLOGCYafkS34xXzQU/w2feTuh9bC1ph4rdP
         eV7Jh/5V9skmzsMFlUWfFogEtItFSZoju+LkM6IO5c5OJEGsz5PgsfozXtAdVHZjIlyV
         z3HtJP7ZVzkHie26lWYCfNiLIaNd3mLxi5xbEtSzkwS6BW1mr1uwiKhrgkfG05KVWATB
         S+eA==
X-Forwarded-Encrypted: i=1; AJvYcCV7IPDyTVNRpMufODi0KwO5IWPS/8xXWJOBD5hpQMIRLbjJJP+DElB6wFiQK94yrp7crwso+gzDW/jYkCSS4ZhiEd4VP5yY4VayX1zre3xzMwg=
X-Gm-Message-State: AOJu0YyOLU/6KfNFDxKBLuH1OH0Eu+8LKEZVJMHIRJgx5Y5qUu38v82k
	52q/9BAQeE/ah6h2KOtz92K5zwnsQEqne14i7ulsoF2HYvYZCi6qX0RdpFReZZWGQqoaPrKOOi2
	EC4AQwA==
X-Google-Smtp-Source: AGHT+IFiR9h8j51gi72vNffX3hceH0q+iH5LXTWgHiNHNmQPVUHiRpuRwEL/hhoSi7c6hrWzj0BB+A==
X-Received: by 2002:a5d:6542:0:b0:343:d23a:c977 with SMTP id z2-20020a5d6542000000b00343d23ac977mr4802161wrv.1.1712927118429;
        Fri, 12 Apr 2024 06:05:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:986c:54c:12ce:a121? ([2a01:e0a:982:cbb0:986c:54c:12ce:a121])
        by smtp.gmail.com with ESMTPSA id k12-20020a5d6d4c000000b00343e392829dsm4215174wri.97.2024.04.12.06.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 06:05:18 -0700 (PDT)
Message-ID: <bb32ccd8-cc94-43ea-b5e8-09162cf56179@linaro.org>
Date: Fri, 12 Apr 2024 15:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: meson: fix S4 power-controller node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240412-fix-secpwr-s4-v2-1-3802fd936d77@amlogic.com>
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
In-Reply-To: <20240412-fix-secpwr-s4-v2-1-3802fd936d77@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_060521_712807_86819395 
X-CRM114-Status: GOOD (  14.24  )
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

On 12/04/2024 10:42, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> The power-controller module works well by adding its parent
> node secure-monitor.
> 
> Fixes: 085f7a298a14 ("arm64: dts: add support for S4 power domain controller")
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> Changes in v2:
> - Add fixes tags in commit message.
> - Add firmware node to adapt documentation.
> - Link to v1: https://lore.kernel.org/r/20240408-fix-secpwr-s4-v1-1-01aa7ee72c52@amlogic.com
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ce90b35686a2..10896f9df682 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -65,10 +65,15 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> -	pwrc: power-controller {
> -		compatible = "amlogic,meson-s4-pwrc";
> -		#power-domain-cells = <1>;
> -		status = "okay";
> +	firmware {
> +		sm: secure-monitor {
> +			compatible = "amlogic,meson-gxbb-sm";
> +
> +			pwrc: power-controller {
> +				compatible = "amlogic,meson-s4-pwrc";
> +				#power-domain-cells = <1>;
> +			};
> +		};
>   	};
>   
>   	soc {
> 
> ---
> base-commit: 4cece764965020c22cff7665b18a012006359095
> change-id: 20240408-fix-secpwr-s4-a99ff960d0ae
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
