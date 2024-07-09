Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40775C3DA41
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pk4bz/aoOQB0LVsphGiv0Zc5CWiQyeKCzyqGzsgpZG8=; b=bdJOH5EmcvtI36OwxoU/6p8xTX
	ekZkdbD2ZJ1OCF+M9NxSjyxdvacTO2OTlRoHv5zfIrjyab5s2vuO5CI2yZ0/xA8MlTL23kyYQ99Wf
	6YyPEuGX3FnZ6LPn8zzMN0kD8v9yFwjs9e2TkQyOOwzcaLafXAN8RWuIkHS4SbxlGN+GgCblIRodZ
	EK0Lzs0LOmZuGpnVJFgGuuTBlMXNR5TTZCuNGndUNuL0Clm/EoRHYzxte2CWZSVqyfEia/BrOxbUI
	XbHtJD+JLWECyZGe5AjVu5zXRz+1FbV6ZdVnv/EEvQOWlIxTJdotR0qTaHdGAHYNnmlecT8Bedtb4
	/b8FOfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6qD-00000006XvG-2bmt;
	Tue, 09 Jul 2024 09:08:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6qA-00000006Xt7-0jkH
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jul 2024 09:08:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-424ad289949so35398615e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jul 2024 02:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720516128; x=1721120928; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ANmKzDOIKVmKZHKX18dtZ0Xwvo3oCJHasWzFPD4tQ0=;
        b=KRlG6UXddd7vTDOpdamEf3GvOIg+/+VlOksYhcAtm9n0fH+D1kXNyCYr9eIVvYp9RV
         DJIPYGnHso5wbJorGZe+IDjnJPJKXbcrKYRYU6yG7dTAK3yCCfZ/MP8PkZZDEclrHi2N
         jCpAMdruXV3cLBlUta/D88IEnEA1DTkoZVM14pFgCZLUC0dqRexxqyQj/U6VhZrZwuBK
         /IAIcgMzO/4SQdtInUZI9UH/KBWoObQfbUdXHDW2nyNpn4o2fDt+gz0UjNlQZ2aXHB2o
         OXkDtRE18PNzNMcZwUuw0IrsyaR3va1lzqzn1Hd2BSSYLN0JZsZj4rX0IdGldFQe9NmI
         l44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720516128; x=1721120928;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ANmKzDOIKVmKZHKX18dtZ0Xwvo3oCJHasWzFPD4tQ0=;
        b=QjU/z6w8ezrLxkipP8hGDZhyNEl0mAvCrDq0I31OuJZl0mBB4Cq3uPHHUCLmFEQWqj
         mXglTWxkcaHKX6J9kby7UyXJbIyqRLIqwFyl/q6jBf+6sfFi+qlDx7MziI9VyuJ0OuNL
         qYv6bFtayEgCuX9UUFphE7bCWCpl7qpQC3nv1KqD5kimB6gSaii8Ru/LgPy5jFu5CVWP
         VFh033T7/S6f9j1em6thGpl4Hn1nJ/vr9u94dJQwFUsw4XIYEL+Cc22K9rt+VrUyxZWh
         RsuFP46AEPoY4uYQ0HcSBwEX15hp6LBH3LOg6OBvXMxWZVLCTybtspUdeD7fQXoOgbzC
         UHfg==
X-Forwarded-Encrypted: i=1; AJvYcCX2E6tC/pyhvc/t6//ceBLnd9tH/vxh01Jo2dw4xD3r7MpF+4jnsYjpaFvswdy+PWm+gyGQYqws8VaEUGEtvcaAobJ9yKyF3EdWOBOC7m/NMVc=
X-Gm-Message-State: AOJu0YwAMDHGyH5rXgtuHuad0KCXoXJji0YiPa6zC/I0EuaC0kEuwAPm
	7+Ycc6LtvgezPnJ9BpqGZEaFJ5pAih1jPOUnuOqaRTvWM2q7b4wzF2Ru8MNT/GbU52Fbdhyl7+y
	4D04=
X-Google-Smtp-Source: AGHT+IE8dGfgukDFvsdorYHZw//51MvpbEXXLFPm2ybjz9IBphbGLeUpfAWThkn7OBaAt18C73eG9A==
X-Received: by 2002:a7b:c446:0:b0:426:5ddf:fd22 with SMTP id 5b1f17b1804b1-426705ce962mr12407445e9.6.1720516128261;
        Tue, 09 Jul 2024 02:08:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:b12a:8461:5e2a:dfe? ([2a01:e0a:cad:2140:b12a:8461:5e2a:dfe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42663f049e5sm98687965e9.35.2024.07.09.02.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 02:08:47 -0700 (PDT)
Message-ID: <3ad982d1-6626-4618-b815-cbee1f4f4901@linaro.org>
Date: Tue, 9 Jul 2024 11:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pmdomain: amlogic: Constify struct
 meson_secure_pwrc_domain_desc
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
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
In-Reply-To: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_020850_291858_FFE4F2D1 
X-CRM114-Status: GOOD (  20.45  )
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

On 01/07/2024 21:53, Christophe JAILLET wrote:
> 'struct meson_secure_pwrc_domain_desc' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     4909	   4072	      0	   8981	   2315	drivers/pmdomain/amlogic/meson-secure-pwrc.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8605	    392	      0	   8997	   2325	drivers/pmdomain/amlogic/meson-secure-pwrc.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> The .is_off() function is *always* set as pwrc_secure_is_off(), so it could
> make sense to remove this function pointer and call pwrc_secure_is_off()
> directly when needed.
> This would save some memory and useless indirection.
> 
> I leave it as-is because it is maybe here for future use.
> ---
>   drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> index df5567418226..62857482f874 100644
> --- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> +++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
> @@ -46,7 +46,7 @@ struct meson_secure_pwrc_domain_desc {
>   
>   struct meson_secure_pwrc_domain_data {
>   	unsigned int count;
> -	struct meson_secure_pwrc_domain_desc *domains;
> +	const struct meson_secure_pwrc_domain_desc *domains;
>   };
>   
>   static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
> @@ -110,7 +110,7 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
>   	.parent = __parent,			\
>   }
>   
> -static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   	SEC_PD(DSPA,	0),
>   	SEC_PD(DSPB,	0),
>   	/* UART should keep working in ATF after suspend and before resume */
> @@ -137,7 +137,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   	SEC_PD(RSA,	0),
>   };
>   
> -static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>   	SEC_PD(A4_AUDIO,	0),
>   	SEC_PD(A4_SDIOA,	0),
>   	SEC_PD(A4_EMMC,	0),
> @@ -155,7 +155,7 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
>   	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
>   };
>   
> -static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_NNA,		0),
>   	SEC_PD(C3_AUDIO,	0),
>   	SEC_PD(C3_SDIOA,	0),
> @@ -172,7 +172,7 @@ static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
>   	SEC_PD(C3_VCODEC,	0),
>   };
>   
> -static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>   	SEC_PD(S4_DOS_HEVC,	0),
>   	SEC_PD(S4_DOS_VDEC,	0),
>   	SEC_PD(S4_VPU_HDMI,	0),
> @@ -184,7 +184,7 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
>   	SEC_PD(S4_AUDIO,	0),
>   };
>   
> -static struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
> +static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
>   	SEC_PD(T7_DSPA,		0),
>   	SEC_PD(T7_DSPB,		0),
>   	TOP_PD(T7_DOS_HCODEC,	0, PWRC_T7_NIC3_ID),

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
