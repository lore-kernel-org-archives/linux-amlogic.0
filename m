Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076F0CD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 09:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7+25yZIeSWI5aSptfDw28/sZKiB9K1MFJVDJAJ5p/E=; b=Vb4VuZRD82Z7nq4F9KUqUXr8RG
	WKPFaBT/FSJTl9eKrJKaJLkIcinU9f1ciLpGCzANJ87LMnkfViuPHIb4pMa1bICLwryUBgQGOIxq0
	M66LczUMtFIN2Ws4y3zPC5etmAOuzW3BlNs3vekXRI/11EtWV43BsabPb+2c2NjyUZ/5wKyJEIg1g
	aNAaLVuSGE/6O/R4MzsoBrNMIuFh81tGePNQgm/9EBtfRdm5puNwWi/VuvOVHibSzpb65nW+iQzRe
	oTleXqdoM2Uy9ud8IO/6uO+a8QHtzhMlK+fu1/wbzd0Rvg6UiEJ9cFF8m2duZqbmO322cqs6/mtb2
	/B+6aL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8UW-0000000HTgJ-3J1e;
	Fri, 29 Mar 2024 09:25:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8US-0000000HTde-3D6K
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Mar 2024 09:25:38 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-341d730bdfcso1578889f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2024 02:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711704331; x=1712309131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEQURDN2hc0rSK6rdl4NmLGBAAhTVwyKdlzTTBj2f1Y=;
        b=FHfn4eK9ZtswZaMeGZ+AZQ/AARSI0SJqH2/h3IGKPbBU6HIWeIA0TDSDL67PaIx/QN
         ztOMoh+KCRpUE7OImOS6JK+GV6mAvkWcMtQhfyxI53vZhjcb/b/i3Oqk/xwf0pDmzqGF
         TxXxrp50RCYdHupehaldeNi0eaD/cVWuxvkq03Kc5KbEPnYsBiIxYKDemh2bS3BPx7vd
         MGTmXH9XxsxPR5K9td68Xp6LajU+z3rV+YB9UJfkO7u047dPOIKCLMnwXsR35ipjHaia
         OPIgdIfOilC5j/gU0TgfUDnhe0VS6LtZTbG83Gl8e0h9xl5k5l5zXEfPzbex7mT2A2+M
         iPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711704331; x=1712309131;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GEQURDN2hc0rSK6rdl4NmLGBAAhTVwyKdlzTTBj2f1Y=;
        b=b8PQLbZaUQha8jW+YpNksgtBqzhotpXXOgufCkBPSel9eQafoBrMpZr3A8sXcXkniY
         HIyH1x806HvpnbgxqtrwKGcAr+hUvFM0j5d9jjCdE7TPpLcrGtquaK28sN+YAq7FYk1A
         eTvb6hpEvLxQ19TGjXhatS/U62F6SIAikArqUQ9s3q9sITk3TFqK8Mk03gYsf/JQg9PA
         cSNdBIlFscnGYPPpq0NBkbmEhjIZ3maJvixtMVkDzQw/tes0fqVTklAnleGdzKptVlgY
         zqx+0SriADGOY9SFWN/onRxbkJmtgoWi8pq2UuvC6/ci1KFoLwE7aNSCFjsTay1uxAFk
         mNpg==
X-Forwarded-Encrypted: i=1; AJvYcCVHMo3HX2F3dTSGO45igzKnQWT23Z5H68KOsXQmPAgit+6s3Zek7TN/qpSF6frB69xVXbEQUwRtOiqrSHWYKuoTC3k3bhY6dzugCE3Li97aL8c=
X-Gm-Message-State: AOJu0YzBH3x+ZHA0ZEqF/U29DRQ9mZgdf4cFsNVsifbxR4HUTFmntRCY
	0ZmsxQTtEhmCtU9zufN2JN/jb998hgO3m9BZQSZ2wERnfG7tnSRVyY9/b0pyV30=
X-Google-Smtp-Source: AGHT+IHMYXV+HQAfMGTkNrpH0Nc8z57jRzmZssTg62uPFuuEAS0jJ9N+Vu7WdhPYRHT4wOscd1BfoA==
X-Received: by 2002:adf:ea0a:0:b0:343:2e06:9a10 with SMTP id q10-20020adfea0a000000b003432e069a10mr1254676wrm.15.1711704331306;
        Fri, 29 Mar 2024 02:25:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3cd8:c97b:1468:c232? ([2a01:e0a:982:cbb0:3cd8:c97b:1468:c232])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d67c3000000b00341ddb65b07sm3742703wrw.63.2024.03.29.02.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 02:25:30 -0700 (PDT)
Message-ID: <15e3114d-0446-4668-83a9-1d28d50f4eb9@linaro.org>
Date: Fri, 29 Mar 2024 10:25:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] reset: reset-meson: add support for Amlogic T7 SoC
 Reset Controller
To: kelvin.zhang@amlogic.com, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zelong Dong <zelong.dong@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
 <20240329-t7-reset-v1-2-4c6e2e68359e@amlogic.com>
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
In-Reply-To: <20240329-t7-reset-v1-2-4c6e2e68359e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_022537_070580_72F226B4 
X-CRM114-Status: GOOD (  15.22  )
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

On 29/03/2024 10:17, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> There are 7 sets of Reset Source in Amlogic T7 SoC Reset Controller,
> and the offset between base and level registers is 0x40.
> Add a new compatible string and struct meson_reset_param to support
> the reset controller on T7 SoC.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   drivers/reset/reset-meson.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index f78be97898bc..1e9fca3e30e8 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -102,6 +102,11 @@ static const struct meson_reset_param meson_s4_param = {
>   	.level_offset	= 0x40,
>   };
>   
> +static const struct meson_reset_param t7_param = {
> +	.reg_count      = 7,
> +	.level_offset   = 0x40,
> +};
> +
>   static const struct of_device_id meson_reset_dt_ids[] = {
>   	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
>   	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
> @@ -109,6 +114,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>   	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
>   	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
>   	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
> +	 { .compatible = "amlogic,t7-reset",   .data = &t7_param},
>   	 { /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
