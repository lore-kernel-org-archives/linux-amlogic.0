Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39EC54EFC
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Jul 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFV0Zz1SpXKQdR0cnMgqxxjXAugjmKQ91KPV9uLca8c=; b=nUqsmuHozXa46VyywOV2WnAS5e
	m5xcz9UyP0qlvTlMiYka5KUKBJJjCHcazPYgGrZZs7hVExX8A6Bftr3Qz0JqyGLK01J4IhMdVIuUU
	VDV5Mzm0u9V2MbsSCIpDJzgYPVV9jxhO3ozw+8MFu/oP3W2Lm3hP1RfjENc1FQvEhYECeaIvJ8hPF
	xjPbg7qAOf3M1PCtilcsbRiQ94fgrfvphdxwIOK39NII+waQBPYfw6TvQp85OOYnV8P1aVzOx/jKr
	cdOwAbiuXLasdQe3zrsUoUzzxKKLSpb96XQZnCzRm3BQEqlznuIRUH93lens38VZPhrHYy58A15Bq
	yodVcWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodHB-00000004j79-4A93;
	Tue, 28 Jul 2026 08:35:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodHA-00000004j5T-1ILG
	for linux-amlogic@lists.infradead.org;
	Tue, 28 Jul 2026 08:35:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso24311875e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 28 Jul 2026 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785227698; x=1785832498; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lceCMquYfWGQoKHrpWrtsA8ES4itoEqcbDu5tjp1DxI=;
        b=vOA8XpORWQKwFF9vFAv8IKKGcSxqMbF81rG0GQzl2CNGsKmeprA/a+ubRU1a2QgrBJ
         ev+Pkdv43tntrOMOLR8bVlsD+sVPRG7Wr9L022IpMZNgVXoiQh0T955wUmo8c2oQ0fQI
         0beoChn99SbXLlsPYCMS1k9eC7I7m0wZCZgvSwHKih46IKmCx74pWe9lk1OMiEf1Vf0J
         JAyG4ooNhmvWwhSAhsd8NkZuY/iYlO2qX+QcaZhSH4kMwMiRR1vQdLN66OmBDm8TJ3Be
         fEihSNHDWf/mujLmHo1Kk1K3tWGwP/Lvc2ma5l98P5CS1cxYaRNm8iPePGm1rol+XsSa
         6BjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227698; x=1785832498;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lceCMquYfWGQoKHrpWrtsA8ES4itoEqcbDu5tjp1DxI=;
        b=Gy2fHJtUJC31zdshy7jIl5znGjx++g9d8jd+PLlla2xLgM8veps3i5+E8CeVH8eVnB
         ibMJTs+wkBNcOzg323hfWXjEXuowEY6CKz8s79dr0cUypFxPgLwgLNwdcakwQFT7T3mr
         0HRQwLtGlsmxf0YjPDOkV9S9KMQ1Oh2kZSZZ5BsmwyCYjALgKQBMlpS0c1iQaK4IFLxF
         NA8aVWS0kxvqg4FD94csxJ69uaJlFCmIFka7Zp3O4m4LKrZDbYFkYNk03VUMkCCSRQqn
         YwvPX7Vxq3Qmas7lVjGifmTKTH9nOuvo7CkEH/KGTAuG1sen6S6WDtuUhPnAEYmK163u
         lCZw==
X-Forwarded-Encrypted: i=1; AHgh+Ro43QDB/DUMNYpnnYuNk5r4wBh5zQnqbi/0PdFwi3MpSC51ofgZ1ffjWJhxbaAwogf6+RXxisQJDpD6UA+2@lists.infradead.org
X-Gm-Message-State: AOJu0YwUtZWD60eIssSPJQUiO3EgN/82+Sfar31rZTd1Xl72Kdjlypgj
	xmNa+wD9WChQmKjBObaKwbEyjcGKpMPFBtwFDL+O1uOrpzLXx9p/Vnb6K8wW8ncAC1c=
X-Gm-Gg: AR+sD10qPPZkNv3YY2+xeu8jiV+DvUoZl6rqpDlYVr+dSz5hzV82InxX+Rfp14yFJge
	QwYuoCpecxZlAlcSq0yHPJifbN0ZejEEJj3LD8Vv8QBRzkJzS6X+0auOIpBzvoAEyKU3zxrsRbg
	ctr5wmR7YifrnK6ONEahqVaiz8N80WhHkuZUsM5WksIP0cV3D1ruPN2EX83zzsgTZa/dTaiHrwJ
	6v9gIz3IFake3qZF1sZlZH7IsV6LWvMJNSl5zD221rTTP5KIeqK2cgwytI8iulMwnR8eM1c50dy
	WGz6Qy9sjuummbONGgfyDz59vmQxf02hV28ntoLO5igxpsEhPd92e0v9ihBiRrr8Zj3n99mjMiI
	WjqqFFkBnlkvWQNU1F0q9s16PLO6BwWbBFt3SJVAqvsYO/Pw+SdoyS1OmxIJcy/4IFkemkv2Egg
	ItUU82IkXgXqTh1x968MfuOIbl3m+fpYdySr1ZiqZ6U3P17O5iirSa7RGoVhm9hejAZ+7e
X-Received: by 2002:a05:600c:1384:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-496c643be67mr15873355e9.12.1785227698475;
        Tue, 28 Jul 2026 01:34:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:5788:c4e1:cf35:7211? ([2a01:e0a:106d:1080:5788:c4e1:cf35:7211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56310759f8f.8.2026.07.28.01.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:34:58 -0700 (PDT)
Message-ID: <9dffc605-2ab6-42b4-a7f9-565bc16d8c07@linaro.org>
Date: Tue, 28 Jul 2026 10:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a9: Add power domain controller
 node
To: xianwei.zhao@amlogic.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20260722-a9-pm-v1-0-1fe20a44bf2d@amlogic.com>
 <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
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
In-Reply-To: <20260722-a9-pm-v1-3-1fe20a44bf2d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_013500_449159_E50FE4A0 
X-CRM114-Status: GOOD (  11.47  )
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

On 7/22/26 10:39, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add power domain controller node for Amlogic A9 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> index b0e0fadeed82..3652b2034c96 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +#include <dt-bindings/power/amlogic,a9-pwrc.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -72,6 +73,15 @@ cpu7: cpu@700 {
>   		};
>   	};
>   
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,a9-pwrc";
> +			#power-domain-cells = <1>;
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
