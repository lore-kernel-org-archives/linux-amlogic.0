Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E01EC61D97
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Nov 2023 16:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTrk6Vj76gHu7/ZCawV3lFlqc0aT9EdtW5Ert8xBiZM=; b=qZuySQ4Mboplnj2uigRwZ+ZQxt
	qEvbK1nUq0QvelbgaHqBG4gFThnbjhcGYVH0n7CZChgfg+c/FR+cX653qhUPJ25SpRZaf5QCYsT9f
	B9BTjYH+UpBxK25MulEUeGloKPP6ZDzH3AwkuY36xsHvkuHkhQ9SqPhtAowQkTiuaLSCGNznrWCtE
	c4NetUxEOBCeoCd59j87Yl/XuB7FofLBRq0aO2ng+cjhRk2EH3RMnOXBWQNwy8BlnZbLlXs3rYy+l
	s4IN8JlApYCOEe722fniJ+bhT+khKH42GhyVw5XyWc81tuRVea2rFJc4m4imiohO1eZHFvBnBH1CV
	meKEmnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CQZ-005HIn-0Z;
	Thu, 23 Nov 2023 16:19:43 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6CQW-005HHR-0S
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Nov 2023 16:19:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-332e58d4219so333102f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Nov 2023 08:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700756378; x=1701361178; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFib22uBVjZl/F9aPk76OV4H7hn/DOMh18iJcGB0mUg=;
        b=CsqPPAE8eRGrTf0jw4h/lHvZgL46QL2Xtati+iubwCqdWDkdsq3gX5cJYi3o8YdS66
         hpgDs2gslVAzgVZ0SdOe/cdimDSDC6w3fcstZwcu/Ty4xQMOHOYiXOX6/nkBdt2RY18J
         R3AG/4646e4ZGthj1SsCy4gfvsP0Kr0X1pqpTQTme0KC9gfYq3ghZIqJCQjOd4HqDqGl
         LUH6W1vi88yh8BSDVwUyby7OXdqq4a4HrSrm7pkmN4JsayWu0XrM/+RUBLtVw1KesXfk
         EGyvnGY18xqXbNqt1eFOBtwyoiKZpc0UO45q6N0iWnJ/JbMGAOGb36KonAnJ2CzbwV01
         dSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756378; x=1701361178;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kFib22uBVjZl/F9aPk76OV4H7hn/DOMh18iJcGB0mUg=;
        b=sxUrhLcwsXTw+QD6WmdSgtHtL1BImb94RmfwJXlAafhoYI48wiw80161vdfh3ovmCP
         wKkR/4scH161Tm20S9+JEIsMS3/ue/Y4ZRzF6iUZhCYOLdzAOrQO+kUc0tfSMFro0B7/
         06UqKV1+uUQWWRU5tiuYJ2xI6e8C0sHB1dkGDqtae2Pksf72NaH4G7ACTcZHs05hZaPX
         JdlFpQULRh/WW1A+r2Lowyi3XQ7BKPawCnpKSbCool2ZP/lnL+zQAHeB5+CeJ9zhOcst
         9qbrwsNJwYzYOitowWpYfmshrQAYF6OkFeaUQj+A32NTFBGejXGsyRUt6zWgMwpuiBrS
         i97w==
X-Gm-Message-State: AOJu0YzDa8RE7aW0MuBnrFTw6HqmVfAr0I2jdDLW+V90R89BNkkVTT5x
	G9RbtEA0KW0MpzfC2FzeMzmeCA==
X-Google-Smtp-Source: AGHT+IHMw3+2jNOgA+734otOpWfY2vuzMRBbfign+rWcFlx1PV+Buo7Mm4lDlK2VT1yXzL5+sl8dLA==
X-Received: by 2002:a5d:584e:0:b0:331:6c3b:4f1e with SMTP id i14-20020a5d584e000000b003316c3b4f1emr4595043wrf.56.1700756378356;
        Thu, 23 Nov 2023 08:19:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:89c5:1f48:b86f:30ba? ([2a01:e0a:982:cbb0:89c5:1f48:b86f:30ba])
        by smtp.gmail.com with ESMTPSA id j7-20020adfb307000000b00332e7f9e2a8sm45074wrd.68.2023.11.23.08.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 08:19:37 -0800 (PST)
Message-ID: <20dee547-8358-4af4-ba90-c5e9a7367c48@linaro.org>
Date: Thu, 23 Nov 2023 17:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-0-61f2fcf709e5@linaro.org>
 <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20231123-topic-amlogic-upstream-isp-pmdomain-v2-1-61f2fcf709e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_081940_182984_06269353 
X-CRM114-Status: GOOD (  10.54  )
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

On 23/11/2023 17:17, Neil Armstrong wrote:
> Add MIPI ISP power domain ID to the G12A Power domains bindings header
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   include/dt-bindings/power/meson-g12a-power.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
> index 44ec0c50e340..01fd0ac4dd08 100644
> --- a/include/dt-bindings/power/meson-g12a-power.h
> +++ b/include/dt-bindings/power/meson-g12a-power.h
> @@ -10,5 +10,6 @@
>   #define PWRC_G12A_VPU_ID		0
>   #define PWRC_G12A_ETH_ID		1
>   #define PWRC_G12A_NNA_ID		2
> +#define PWRC_G12A_ISP_ID		3
>   
>   #endif
> 

I forgot:
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Tested-by: Daniel Scally <dan.scally@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

If needed I can send a v4 with those added...

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
