Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E6DCA0EE4
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Aug 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXT/Y4ZkJeM9j5VZNzcaWWRL4epFC1TGgyhnwcfEfBM=; b=fQcJCPpqY7L0r6uOv4bjV4t6Sw
	KBxkgIXwGvZX5Z4s3mfsD0BAHWAzT25Vm/1XC4PTflcD9XXf1+A24VID3KayPFiyQ8sS+4wuN5LU1
	MnJCe0Fy84g1bjFbJCRIWymnbd7omjGlKVJ/his+JQ2ZCUh4Z7ax7gMWKwmQNIM1quDkrczB56VW1
	i5Q0OFqq+Wa3Pdw6qooIBEDdM25OPKk2xhmMhH5usBf1sThdP5Kv6rz2rBIrtewObMm1fMdZMPCe2
	FFYnHcgmxuRUmjn/tlhxyewcO3V8B04BvXkjEdX1DZyUnY/Douaxk6KVbopXyA/rWavUvUznTE0U7
	nLeyHqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZpo-0000000HQab-1Y8W;
	Thu, 14 Aug 2025 15:25:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYoL-0000000HEey-2ECv
	for linux-amlogic@lists.infradead.org;
	Thu, 14 Aug 2025 14:20:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9170db547so908758f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 14 Aug 2025 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755181207; x=1755786007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bdQgEC7rZ77bKFkIIw8e//b55v9uHd60dNBACGWzhY=;
        b=MpzPlGUZoS70KGvojjbGWCZgeU+HnYOzVJRXItWqnNqetSnjvTy+OXn4DsOkgcNPv5
         i6+QseCGZPi4TpqLGqoj5rhGhtjpojcAHlHZd4RD0R5fLb4TOJqf1JC6GZIH59dxp0Ti
         xzZwHGMiLaFEoA5/umDM/rf5rGoi4lQLBSSzlh7L5eBWfOSz5JI9IQHSOHtGfLr3760l
         VfxlmZAHbVsG3fzIlzI1vvQccWYnGy5JDzfoSBS01FzHhyl25MtmlkbHAoJ/UNebR/dS
         3S0B/bmdVdzPJNvQW4N1OQfUyhFrDDSguReNz7dTuLOS7V04GhFbHTHNEPeHBVLGubny
         LddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181207; x=1755786007;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bdQgEC7rZ77bKFkIIw8e//b55v9uHd60dNBACGWzhY=;
        b=E+rFNZULV7jpBWr6tSE+C9ib7FIoADN8nNv9Q+YOK4tnmDGuhfi4UTryAFEEDFVAA6
         ypK128OBMq9WyvBZ1KRp473mYfZJBfkHqMZ5mNQF2MrNX9xSleEfTYsENiK2FTdqdzf9
         biUHHeyCXWdjPG5eFjZGkPNvHaVuQ8oHOSWof5PMjWzinN3G/n87u2fTGHkm2MUq44uF
         rUDJ6CyW831kCk+DIGaqJE0ydADhk8H0nFtUSUNI/YYbOo+gW/4lksNRhwDT8PuLajQ9
         mGdLKgLyceIl6TvElk9oJY9JeOWdy7twYf54DRhCbs1RebLBmrDnnk7bVR9xCWrH+mPX
         ZbIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBpa7SbK9og0FtAOLzW2FoNcFn7fSPCSADVCGzTwm+Pl93SeFxxr1HWOJbJtBmowMQsA1IB7uHNiW8zmHt@lists.infradead.org
X-Gm-Message-State: AOJu0YxELRYqnl/N1O3Tc9pOyV7IdKjhQpumBliYZ5pj9oribSQWqoxG
	d/aTzzYV91BoHZ5SRxf6hrIryCHGZHMbFy+sTSvOKnV6RLYcSnxOSZEKG5g6KihK1Mdp4s/d0eH
	rtgY6
X-Gm-Gg: ASbGncvwLNhHLWEgkg+hvXIahzsMgLpgjySb/loAQuuuSDC/12A0VdF5Oa6m92shZJO
	1HrG7zyEhIc6I1i11LZZxERS7F6UgeYx5SJQcXQsH+4/QWwnBdzMjJcPB7qXbwussXlh1My/Ivj
	lXkbX5VmaHJqvHbjyB5hwfIXeGARPRENW9sM6cjya4h8v9gcAx8VdmavUDSArqcsDhRrx9XTww1
	Ksgq7Q3x9fI6/rbUeGlkqV/aN2i5j3MNMafkMCyozPC+MXRyT2Jq0tYAi7PU8Ak3GtcO1Th/5UX
	aW0ENfWu68lRpAZ53y0gagAixEDSnUzCuRNVhG6/h1+EBSVUsAfLtmNOOPs8xj1fQcT5KRTXnPJ
	PBVsEyYO+9bpUIJRwSO1De0VSLZnshwup30zPXJmdxA5IUcb3zp6DwLOvaoRVIJDFssf4kbuG
X-Google-Smtp-Source: AGHT+IHIriY44PvISGPQnuaFi77640VOHi2AzHePwqO5rLcVQO7pXXuzSy2y2TPprE6NsOwOB+2/OA==
X-Received: by 2002:a05:6000:2282:b0:3b7:8ba2:9818 with SMTP id ffacd0b85a97d-3ba50d4b1c4mr2635910f8f.22.1755181207507;
        Thu, 14 Aug 2025 07:20:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7336:e60:7f9e:21e6? ([2a01:e0a:3d9:2080:7336:e60:7f9e:21e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abedesm51508312f8f.3.2025.08.14.07.20.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 07:20:07 -0700 (PDT)
Message-ID: <382972ef-92e2-44b3-a510-37009fa2f781@linaro.org>
Date: Thu, 14 Aug 2025 16:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 17/21] rtc: remove unneeded 'fast_io' parameter in
 regmap_config
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
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
In-Reply-To: <20250813161517.4746-18-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_072009_565615_FB10F014 
X-CRM114-Status: GOOD (  14.59  )
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

On 13/08/2025 18:15, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>   drivers/rtc/rtc-meson.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
> index 47e9ebf58ffc..21eceb9e2e13 100644
> --- a/drivers/rtc/rtc-meson.c
> +++ b/drivers/rtc/rtc-meson.c
> @@ -72,7 +72,6 @@ static const struct regmap_config meson_rtc_peripheral_regmap_config = {
>   	.val_bits	= 32,
>   	.reg_stride	= 4,
>   	.max_register	= RTC_REG4,
> -	.fast_io	= true,
>   };
>   
>   /* RTC front-end serialiser controls */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
