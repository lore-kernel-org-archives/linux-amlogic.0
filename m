Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D10DC27C77
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 07:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UH5+UlS+jlj6tgToKBjNV82Fuiq/X0HVgDtFDX1iVHg=; b=ZpRWWI9r2E5/y/0wvPzMqzXn8G
	E3aIl9LFJRQf9Kf+X7vca71J1NNn8CgazEPIxe4zKf8sjkBs3FJJbGc57hHfk6RkAH3tB/WWW/6ka
	lWfsaC3GNQPYQa0cXUL3U6GHhXB79HJH7/5exBIcRK6v765TukwfagVFldpqHlj1Ek7HJdc7MJ/Ec
	utRyARYCtDuq9qpejEqtpzOGKNiy2IkrUTnDo1iJpiCV1S5pyXo/+i4dWiLleHuxTj1Tlt6YeSNFm
	3tZfxxxZZrgbmaeI45tPpQmiLgI95tJwDK0EosNHbWW3AGScFSYrIm23ZiYjUw73L5pafsealk0zs
	128RV+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI0yg-00000001hi9-24So;
	Fri, 14 Jun 2024 07:04:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI0yc-00000001hgP-43Ce
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 07:04:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso13195405e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 00:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718348635; x=1718953435; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4TNjSLKkh/gyKR6pHDFcT9hwwp7eBZGwBalltj+b7Q=;
        b=A0SmxX2ppmZfk9jZDuD3jP9YZ3AgayvsPRTcBZQt5vv7kz+L1I/aHVgFELuLH5HzSP
         ob5UYXCwowO93OTn1yc9QiBr5L2vLO9g7bFNQMWPn1ZsccLE7phVN7beMX/ey7wVOBXL
         Q2zsTndOAbnSt3n97SH9pJJwUItrB1cORI31bLzbDt60tTTrD2n5pNUedY0FwNVxhIxt
         hvR+N7YggM/dwyIxS7Z9Kmc+16LAksfN8BEjlp6umEPQsLRJo0MSLBqiOPKMxLP5Rqgu
         ej7oUyE5Qs/1EvNYnD4N1GpFOxtyPxFLH/ZtFUYMeHEmBGB88b2mEQ9cgihASUHdrzQa
         llQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718348635; x=1718953435;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p4TNjSLKkh/gyKR6pHDFcT9hwwp7eBZGwBalltj+b7Q=;
        b=A0LSY9tQxxydTxsdQ0pWWt5nMhehkc/UPw52wUm8saKEZ6Ec8NfRm2ZXd9oi34W1go
         4FCWHVplbxXOHwKKudDRn6eScjnFSLBv46gXKIAa100p5ICG780AsezJbRqNv7S0RddT
         cG3nnClZV06dn5bbDgB8416F4ByCeZI1nMG1bTvfLjBRIMgXw8fLixClgS3Jwd24GKW5
         zdveM5JFOgbk1VEYfatr9+SnKrgPKNDzmh15ivoVF3y6OBuYYId7+I53nCv97qfxTjXn
         gym344Zi5YyLZT6yiYyZ/ku1wC+zbKmJdJOSL9msF/WsqOn8DtNsFFhf4IM7arGgOB21
         yNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhT4J/hIhUMdRG+P4BwRd2UHsDBGMeQDtaOTaUxbBU8u6jijB5qGKsE7C3YsyS9mudJsDLlHCvoHoZWrNEQoc7HWJR8vhlziCqI6nU5VDWDzo=
X-Gm-Message-State: AOJu0Yxu/M/4c0RzHo66GXidryXHV4TDK3Ci+B7LPkVYFsXRLClZyJM2
	kNIDJ9cqz5EF6eHUpGOHLV9eVOg+lKXcEtcOHgS04nlFmhFxLl1PB2N3jk3bjyI=
X-Google-Smtp-Source: AGHT+IHAglRk9laq/PIfLee3Z5IGuhgrv0laafxD6GLaZVL31iAoc0E90SWCdrFlPsghFo7Ds38cTA==
X-Received: by 2002:a05:600c:3c9a:b0:41c:2313:da8d with SMTP id 5b1f17b1804b1-4230483252bmr21763455e9.0.1718348635126;
        Fri, 14 Jun 2024 00:03:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc? ([2a01:e0a:982:cbb0:261a:269e:a3a8:a2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de623sm87193705e9.31.2024.06.14.00.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 00:03:54 -0700 (PDT)
Message-ID: <ef7015e9-53b8-414c-802c-a56b98506755@linaro.org>
Date: Fri, 14 Jun 2024 09:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson_sm: add missing MODULE_DESCRIPTION()
 macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
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
In-Reply-To: <20240613-md-arm64-drivers-firmware-meson-v1-1-28e4138a8597@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_000359_086116_B3974C04 
X-CRM114-Status: GOOD (  11.41  )
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

On 13/06/2024 23:18, Jeff Johnson wrote:
> With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/meson/meson_sm.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 5d7f62fe1d5f..f25a9746249b 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -340,4 +340,5 @@ static struct platform_driver meson_sm_driver = {
>   	},
>   };
>   module_platform_driver_probe(meson_sm_driver, meson_sm_probe);
> +MODULE_DESCRIPTION("Amlogic Secure Monitor driver");
>   MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240613-md-arm64-drivers-firmware-meson-2ce24a9a9de9
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
