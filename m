Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDAC25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1h9Uv5bWU8gHo/7bV8t2F1eaJyk/lR5wwrGzlYgDeg=; b=kyhm73emHppHitmtSzNH5Ur2Yi
	o23CDSBeKRM9Ckny8yb1QdNFwOZgtbUoCa2uhn7KFHVJZAZroVOl+kV/fQTvzfr47BVWeiDaqp+dV
	u3qTRxy0Lau+YKCQtOXNlrC8cOMf1VOhyWQIu0n7m3f+pMWAChD1xA06a4BKyIAhXKh7MVY64L9ha
	QNHdNsE9zsmKJMeEHCB0O0OihNM5Mia3Alov+ydbI6W2xpVOeMNPaRQYC3LtlKHA15nrWxJXTwVfg
	4SKPK4bmP2OroyGIyaa9TAizEEVlydslUlUnOrwxOCIuxfs3i4rllhq89AvRdDltuGqQc1MZGPo8g
	Du1rbDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsU3-0000000HX52-3PYG;
	Tue, 28 May 2024 08:47:03 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBsU0-0000000HX2U-34q8
	for linux-amlogic@lists.infradead.org;
	Tue, 28 May 2024 08:47:01 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-35508106cc2so515987f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 28 May 2024 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716886008; x=1717490808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoPTkSstfWYikQCW+JvBw9OJ4aACkIS7xPQ45I1/spU=;
        b=R/lE+yE1saaWCwqM+KxIxZfkOGux+tumO20eUfVf6FzLmFJkXfA5MwQbiAgB6cnVBy
         j+ufPU+t4GikRY6+vQ/DL0to4/ujpaSvPVc2+aUKOKScBudmq5frEKNRkMRC/J8izk3h
         rxbxIOYK3JfxAgAzeb5fhHm+ZdPFz/PCiZ0j/sn6EartsgjlqLJG5aMIk1VRB5WrPvjo
         wWo8/FQz8oBiGJsCqQsHN9iNLFoGwo0KiBtwvm93JCg1q44Mnu+WEz0UJ6artPC/T4gk
         7xCGsnb2+PfWp5xjDe68WJjlgXMfUM8jBa8OetQEOcIGJIr4mnlRDBeVcX7sRIeGXa8/
         J7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886008; x=1717490808;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uoPTkSstfWYikQCW+JvBw9OJ4aACkIS7xPQ45I1/spU=;
        b=CmdPSygL4WEYz2ySR8i8DAhWe7ERdfxdeJnepsdZPMR9a4IgB7tywMFXRl7bmZhnWD
         2T5K63xBG1So/UGw2B87T511BAZm01h8B6eGju+mwRIAPFmCR/h+uXRpboiYp5sR6Oh0
         EhbcrASPbejBavzpnAzXElLYu5RG97QVO7W6lxzMPcGvwZ7sW/CVhsgqkrATsLOfkXQ+
         zp0GXIJtabTrmpa6DwSkPGtArHf1sxQd3wM3XXl2nQc0mJ6wTpGZWXqZVAq/Ix1lV0wq
         7w8qiC+ZktHb1AhPcmZkXrT7q8DgQVsIPVe7pAVYRLxLRBBfZXPA4ckA2SNCx7MPOyX8
         mTzA==
X-Forwarded-Encrypted: i=1; AJvYcCUvzwcnGYKD7J+f+7Wser0G3qJjQT41NDMN3Cx0EwLnZ1WhMZselldgdPmP+esFd4SeB+5T7EJlZiPRFmj2aHuqEjyTf9U6LrJbRm4XvqSzV5o=
X-Gm-Message-State: AOJu0YzCfuIPX6DDcRKqxiaPlcAZC+hnkbv3qIWYdTNNNEtd1UMu/A//
	HJ1Qxvcb1+LBUR6YNfvW1saDuau1rHLuL4PIBKETe42ndoo6WqMKm1fTRzMUCPs=
X-Google-Smtp-Source: AGHT+IHeh7vF7KnRorjGCeQhv0h5uhIs1a7fiuao8jvp6p4jUUN7Bs3ltOy//i/SKrOI4IqXAveejQ==
X-Received: by 2002:adf:f909:0:b0:352:e4d5:5e12 with SMTP id ffacd0b85a97d-35526c2b7c6mr7551225f8f.20.1716886007402;
        Tue, 28 May 2024 01:46:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8f19:f965:3f93:6385? ([2a01:e0a:982:cbb0:8f19:f965:3f93:6385])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35607bcdf26sm10980087f8f.99.2024.05.28.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 01:46:47 -0700 (PDT)
Message-ID: <c97b12bb-8b56-4129-a292-588226a0ec42@linaro.org>
Date: Tue, 28 May 2024 10:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a4: add power domain controller
 node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240528-a4_secpowerdomain-v1-0-2a9d7df9b128@amlogic.com>
 <20240528-a4_secpowerdomain-v1-3-2a9d7df9b128@amlogic.com>
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
In-Reply-To: <20240528-a4_secpowerdomain-v1-3-2a9d7df9b128@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_014700_791461_57FAAA3A 
X-CRM114-Status: GOOD (  12.12  )
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

On 28/05/2024 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add power domain controller node for Amlogic A4 SoC
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi | 4 ++++
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        | 5 +++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> index b6106ad4a072..eebde77ae5b4 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4-common.dtsi
> @@ -27,6 +27,10 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +	};
> +
>   	soc {
>   		compatible = "simple-bus";
>   		#address-cells = <2>;
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index 73ca1d7eed81..917c05219b9c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -37,4 +37,9 @@ cpu3: cpu@3 {
>   			enable-method = "psci";
>   		};
>   	};
> +
> +	pwrc: power-controller {
> +		compatible = "amlogic,a4-pwrc";
> +		#power-domain-cells = <1>;
> +	};

pwrc is supposed to be a child of secure-monitor.

Neil

>   };
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
