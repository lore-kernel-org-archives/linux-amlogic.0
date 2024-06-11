Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE68BC27C77
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBYPzEicqNnQY2SThVe8K+c9jxzqVSvxopO+v0IZsow=; b=NT+jYAni657ymwo4YTDOZtJZuX
	XFX5sCiyBZ+fSKes1NQXt4kXCAT0k6gB9Q6U0DDG5H9R/YsserNrdFmPEqq8zz8nU4Gq5gxpxUWWv
	h++GLYBw1sqFl5+GW8nf7PYCW0RyMSkVTW1P/K6K1MctwyJcmw32KmXp3rwBD03PQHByI0+/5EvXg
	CqoUGiiWmKZ/pWTW/kp1Mlr1whtHPu8XA/NbkJldSpaTDfodCvK8SEM2WGfbKlDVW/C73LETDgYfg
	u64ZuOf1wNiZXaNSu/2rCyI0oZdW/t9b8jRFpWmpli+xXOrPHn3LXrGHVKv1ZGj5hpT0IRLij8mu3
	dkAVHbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3La-00000009Jkb-3S4T;
	Tue, 11 Jun 2024 15:23:42 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH3LX-00000009Jhs-0QcJ
	for linux-amlogic@lists.infradead.org;
	Tue, 11 Jun 2024 15:23:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso418608666b.0
        for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2024 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718119414; x=1718724214; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gr/GFIzdJKJ6qasNHXrRqoWa4hM/cqFCXBLFqXLE2/g=;
        b=hlM5mBFxC5DOlXXgLkdxtmvRcRI/TS4UcdQzpOE6pU1fLck76RHyLO3d/E66q6rYYS
         NRAkYwFLVmwGJGcxQbE1iyTULt89f4B5O1qMoYP3+Ug9kNEPqCizDhV1AOUQwUoBoyx+
         2SLbih6r3LREFnCLVccoS0ALv8Fs8ceaP5N9E3vJgCNVExleU7BqD0EZYnhZaesCltmX
         wk9QEF56aSG6tBVBYZ1wQKCpK/fCUk6auJn+O7JpzDOfP2Am2dbSerl6E/col7IlN4ZB
         k35MUUSZ3fGdacAUyZPGPJ039GM68HdTlA6RPUdf3wO/YfGfpjr3Ytlz3Z8PgemAC6wT
         B6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718119414; x=1718724214;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gr/GFIzdJKJ6qasNHXrRqoWa4hM/cqFCXBLFqXLE2/g=;
        b=lzKs78Y7+tq1b/11Tu45lJbXXW9064PSI+1m37FxmxtIyw4jbkG9OInzArRb5R7s2p
         xCv4G1hxG3c/O5rRp3pGO4viCHrYmUiArFdr9FAX5SgorfvvOGJ0/nlE1tggSFYvh0U+
         HnNseQVQmVGoXv9jz6WtP8f+H1O4Ei8ftisNUv/vlkB2xwrqoLZOzBMp9/RtLgYwT9lT
         pEsnFoOKG5K+o0837JOgM7yopvZXrw99p6PcZEvXtxtPtRO+2rBJaLWKVCl2E5vrxh10
         QBv6JMFSHcIcNFqaODMej3+Mh0P8066HiarRrysRVn9SSuTfjEtIedSuHciy7OmpwBFO
         vt1A==
X-Forwarded-Encrypted: i=1; AJvYcCWaoT/iKqF/QnlWwUb3/UGdn2zaoZ5vafGFhP33Fxl6vkI7QVFxUoXlu8WVKl96E7ulfQPFBEHNe7eInunlnSDA1OmyutjgQvJDjvGoSNq9Fi0=
X-Gm-Message-State: AOJu0YwMpDqU6MWl6WlNNkRbCFKVK4oT8rb31CUS740ADH0IoRXtf9ap
	avFLLdpeMMF9Q4t1Mvm1QW7AZ/cGTGYSJS59oIMGgg83M6kvl/5DessoQ9d8LgM=
X-Google-Smtp-Source: AGHT+IGoIoRFuoxa3E4g4XERJiS09RtlI3jJuN3E3xumax/c1mOj+ZRW7srHVBRkgYhktd/Jqch+XA==
X-Received: by 2002:a17:906:4f0a:b0:a6f:3b3b:b7cb with SMTP id a640c23a62f3a-a6f3b3bb944mr138517566b.7.1718119401929;
        Tue, 11 Jun 2024 08:23:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f19171cd0sm322482866b.61.2024.06.11.08.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 08:23:21 -0700 (PDT)
Message-ID: <eefc2c96-7309-4ea0-855f-44eff9fb0077@linaro.org>
Date: Tue, 11 Jun 2024 17:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] nvmem: meson-efuse: Fix return value of nvmem callbacks
To: Joy Chakraborty <joychakr@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240611145524.1022656-1-joychakr@google.com>
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
In-Reply-To: <20240611145524.1022656-1-joychakr@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_082339_348969_DBA86A87 
X-CRM114-Status: GOOD (  16.01  )
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

On 11/06/2024 16:55, Joy Chakraborty wrote:
> Read/write callbacks registered with nvmem core expect 0 to be returned
> on success and a negative value to be returned on failure.
> 
> meson_efuse_read() and meson_efuse_write() call into
> meson_sm_call_read() and meson_sm_call_write() respectively which return
> the number of bytes read or written on success as per their api
> description.
> 
> Fix to return error if meson_sm_call_read()/meson_sm_call_write()
> returns an error else return 0.
> 
> Fixes: a29a63bdaf6f ("nvmem: meson-efuse: simplify read callback")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> ---
>   drivers/nvmem/meson-efuse.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index 52ed9a62ca5b..d7f9ac99a212 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -18,18 +18,24 @@ static int meson_efuse_read(void *context, unsigned int offset,
>   			    void *val, size_t bytes)
>   {
>   	struct meson_sm_firmware *fw = context;
> +	int ret;
>   
> -	return meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
> -				  bytes, 0, 0, 0);
> +	ret = meson_sm_call_read(fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
> +				 bytes, 0, 0, 0);
> +
> +	return ret < 0 ? ret : 0;
>   }
>   
>   static int meson_efuse_write(void *context, unsigned int offset,
>   			     void *val, size_t bytes)
>   {
>   	struct meson_sm_firmware *fw = context;
> +	int ret;
> +
> +	ret = meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
> +				  bytes, 0, 0, 0);
>   
> -	return meson_sm_call_write(fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
> -				   bytes, 0, 0, 0);
> +	return ret < 0 ? ret : 0;
>   }
>   
>   static const struct of_device_id meson_efuse_match[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
