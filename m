Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C9C606A326
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 08:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fzLq+hzL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B4rTpt+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vDTEuFpMwxcwF/6YrPsqXie3JOY8FANqed1LEY5rVxM=; b=fzLq+hzLGNmaDBZO++NqY5Jj0n
	XlBrR9i/a5L/kLA3vUSNC2WsKsZqRYg3VBgjXXK1Lys5DQd1A6G9K2W70kKvW2Gh7FNG4FCznxjAo
	hzQXg8A0H9m1zhHOxWTRf82JXTJ58s3l3NnaUvU4dIoZTL9zMmHP99D3dry503NXFUrbfn8BNQsUT
	D5uXHx0wPI/EpE8OwpHTYiWbPovK9V2RcE5VGKahnsp4HNt8kU3Ik/+0p4j15G40YmF30UZ0E1BJ6
	J3OQwhxDeTNVcr95GXmFWYiRCXRDglWQd2y596oE7qMevVmSXGpBchViRL5M0cyFoHpTPECdzq2y1
	Kub7Y/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAH3-00000001dwG-3eMn;
	Tue, 03 Nov 2026 08:53:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAH0-00000001dul-1aA7
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 08:53:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so2444665e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 00:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793696020; x=1794300820; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=B4rTpt+CUrrv14grfn6G8/KlP32wqI7Gb8oVCzu5U7u9Nri7gso33fRma/8GWKw4lr
         1b2ZTHMJgJrzC1NimQY7JCnZrIR+BBCpg3hyikHswkZFEeEHpObcVlte4JHp3Ko65pYM
         Dyg0gXYU1fbEFVyyjb9FIXAHN/heJccuEW6HYAFFG30YSOna90txoRf4vQcGaRVF1j5H
         uS/1hFxsqveygqVn+OQXtef7CJjcGd3RvOJEtJYecC5Xfyoffm8KPI5Pss86nGUdAByk
         Oiujtr46doOdTA9be1qpT2ACxp03Zid65Vh7/JctWMvK4eCvxFO+hEkO8i6H5h06KURz
         Re0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696020; x=1794300820;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYVEhmFXBYWgKUnLGpmzVsxJ6ulxA2Owk59YswCIlXg=;
        b=005kzEaQhuqKbW5PwjDmPUyOSt5F6LZrMYcZ7lsEqZW2WBvudwZCreUAUQ4UOSWx9J
         CUHFDGbk9kDdG996ffsoSOOxYLWL/aEcmjIJo1ymMVUJcwk5k87vQMrosffMtxKK3yVf
         UEbPzwg1F4g6k9dXLO64LIsrQZY6xioA/PTuB223Kw1baYTPTA2lfHEqJ3jJzdj11PCc
         19BUqqKq6x6Z/5HPhYpPv2KKoD36yiJuAjD5bYHZdJfwf4PjFwMeNpwJPuXu64wJPX43
         s3/+9Cv30YxH3f6c3bfDXMZ5CYZ4A6zoSVbpKrQIr5bMuZyaach3UVCg1q4bDIuW5AIz
         qTmA==
X-Forwarded-Encrypted: i=1; AKwUvBzis4YmeB01i9+ZI96ufsSuMeyGCfMqHM8d4FQQXweTMWXyBV79xxQCLA0eJgS4XBh00iDj+NWRmlxfFmma@lists.infradead.org
X-Gm-Message-State: APuU4Z9k5D0p16qViDvFoBUITs5mFoHEESBV8NE2w27UJf6sOvuyRIBH
	ltf/L1Gh2ga/ykDcWU8iKSlOByUSLEWooSRMioAuxfvu4r6o3JZRnWgR6qm3p0EPhA4=
X-Gm-Gg: AYBFou1ydIWltEcwKB94tewGZC1U7ZyJQ6vi+f213pQuU2/sNPuhHPQvVXMbTNJmOfK
	Zo+SIvL5xvQnuiW9GNp61ETtI0KkkjG9TKFnN73YIiBgCiM3iC+7EUf2wCiE65lUh+ZRL0lOhFP
	LwPBbTVslwDXUCOiUOY4wNRlWQJqd10rmONLBf0oyXY+eY68Jf1MWMIvltjNx31hoTzeYmBCZnF
	ZAdhps5GAIDp0h3XOCODS0XRilfmqDbbHyuVu67/GBDX9LVVEyUz/bqehSJEM4wc8yQbNZ4CSFe
	JtsLp/G/Xm1AmV8+3D4MggQCcK4ZKmwS9Q2cop4UPges60CFlT+6j7LRnE3N0SB5vJ6ChXp6maJ
	RJvgu2fgr2PD4Wh5kWlrej6WaB1RiFc4/8HfYOcPJV2HIz8qmOBZPF5pSs+P9Z0bx9Xo7yTsXsy
	gJxFxXN5rCdsSl326zMD3VvgHyX1dnGg1FsAHj97oeNGdFZZQnlslziXtvxM4plU9BFxotz5MNp
	gHHsJ7JhCDatTUQZgOOAth0g4EuH4uwI63ptXXC2yBOiXP2vjFOAxRD5i37U5wasGHYalXEc8BE
	5y0+72/D0B0J2FKq9wrxBnKqG9Ie69/0pooIOyx4EfubrBghQeHI4LbwmYJDaR3Rf2KbRmwMVvg
	SmNfY/m/0DXGl+V+RsSmmRcUVAdJY
X-Received: by 2002:a05:600c:2541:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4aa8b060adcmr301144395e9.18.1793696020400;
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm23606102f8f.9.2026.11.03.00.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:53:40 -0800 (PST)
Message-ID: <2fdcea84-8b95-4ec1-af62-07e1803cb418@linaro.org>
Date: Tue, 3 Nov 2026 09:53:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth HDMI
 DTDs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005342_447988_4F155D45 
X-CRM114-Status: GOOD (  22.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 22:28, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>    DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                 Hfront   80 Hsync  32 Hback   48 Hpol P
>                 Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> Those high clock rates are currently not supported by the meson_vclk
> code as it limits the PLL OD (output divider) to a minimum of 2. The
> formula to calculate the clock internally is (ignoring fractional
> dividers):
>    319.750MHz * 10 * od = 24MHz * m
> 
> With od = 2 this results in m = 266, which is outside the supported
> range of the PLL on G12A SoCs (the driver limits m to 106..247).
> Using od = 2 results in m = 133, which is supported.
> 
> Allow the driver to pick OD = 1 to gain support for modes such as
> 3440x1440@60Hz.
> 
> Link: https://forum.khadas.com/t/can-not-set-display-resolution-to-3440x1440-for-dell-monitor/26271/12
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Re-send of [0] which seems to have slipped through.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20260109204836.790096-1-martin.blumenstingl@googlemail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index dfe0c28a0f05..c0be0b7655bf 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -700,8 +700,8 @@ static bool meson_hdmi_pll_find_params(struct meson_drm *priv,
>   				       unsigned int *frac,
>   				       unsigned int *od)
>   {
> -	/* Cycle from /16 to /2 */
> -	for (*od = 16 ; *od > 1 ; *od >>= 1) {
> +	/* Cycle from /16 to /1 */
> +	for (*od = 16 ; *od > 0 ; *od >>= 1) {
>   		*m = meson_hdmi_pll_get_m(priv, freq * *od);
>   		if (!*m)
>   			continue;
> @@ -750,7 +750,7 @@ static void meson_hdmi_pll_generic_set(struct meson_drm *priv,
>   		/* OD2 goes to the PHY, and needs to be *10, so keep OD3=1 */
>   		od3 = 1;
>   		if (od < 4) {
> -			od1 = 2;
> +			od1 = od;
>   			od2 = 1;
>   		} else {
>   			od2 = od / 4;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
