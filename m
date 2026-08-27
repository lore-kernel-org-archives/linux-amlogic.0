Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294C5C61DB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Aug 2026 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2MjEmo3dvcKtf3k7uGHqBnOoQVugkPTCtfaLELHnoA=; b=NAY8Ea1dOOGZ+DO9/gPIa8MlHo
	ao1kYr40qnwcPz/4KjCfZf7bR0Ka05YMNTxrSe0y4WQyG99gaVXkWj5omcAJWmcLCz4R7/37+eaas
	gxvgnPOifoxOtzE9nvZurcZVo6gbyXEzIcsqwn3ru3VTPFYRxmnB/bT9zob31nMPCFsVknUAbFc6v
	9lew+r2FsIgic3j2+wUiYFZQmb3ksxcFRg3BKutg1dtCJVV/g3mKj5qTArtaXiUG4206CSgguxaxX
	r4FruunTXjn4wwUubzA/NyOzDZx3lmrWicqWG7jfQk2g83r0m3JTn8HTPvVtV3iN0NX6pLMdi6Vri
	z64eOhmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVrh-00000003gjV-0qVf;
	Thu, 27 Aug 2026 08:53:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVre-00000003giB-1zUb
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Aug 2026 08:53:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f84023916so392575f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Aug 2026 01:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787820816; x=1788425616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=dnoWiYpQ97+ZK+fvJSlp91KmrMjWB0Kx9C0/aJbj6MzzdfLe7IRA6sa5AvvwSiN1ZP
         Jmt8qhvq8jPcF4ETfsd1cAU5eo6MyH0YrtKPtma2ziXsFSLe2Ebnum2Bx/c40nxaINcA
         ie1Lg9k5r0QVlCNXjPX/F0Z2fD2emtXGgqTbu1PSVr/gguDiJfWKihQKXNHazlBSUT4E
         qkAnMWxmc27FshHFEf7DFj5qp8nKQc/ntp4uqq1EajKhweFdDncI3scWn5WcFeWF+EA7
         7V5W9HGMzv5aoUuULhtB4bp0eM/yPlznO0QbkgdONE9PrTH2kz+h/mIJdQ/D0dQhH69G
         zaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820816; x=1788425616;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVehDwDn3vUosVzDAVI89hDucj1hjpgV8XEbxurpbsY=;
        b=HeqHVvM1rCAZtHSOTzheNLV2i4EHZETLDR149xFN89OLSxDleLG8c9X7+6+oAJLcZZ
         MCiSe7RWSOXM0SDzaYMr1ElBBbPpj45C0RNW9F3VgNnR8VvlsW7loFfkyceXKhGVVjiq
         y1j4C3anG5UGr0MvPmkJuzMzgDeS+iRVdwq8z1qz8lSD5TASsbqCy5asAEsEh9nQ6PMv
         RDNKOvbakYs94CTjC7zkS01YnCTeZVuFtJCxFSuI674WBLCuJeVjy8TUmoRFBuY7Vx4J
         KeIPSigrvw2ZzTLzYFAT8Sgd3tMw48vSKA5Q+JCy6RLmrAVo5ebqWg2gRkvnDIid9zNH
         Y5Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqjueeXltvJilI5O2PqMHFtcfojsaBfjTHRz8i43B6iczr/St9BbpGy9zF7FYvJiBt7/bBJHh1Co7qaJrCR@lists.infradead.org
X-Gm-Message-State: AFuF++mwYyF8kaSeFAQxeWO1lUzWMnktEj2FKFmXOhAgAgYNhoZoug1f
	jVr1KKpUxKXv7hRo07Dvh4wabEuZqUcYziZmbrLF71KCfCYxAw5XlDTdKIaLQ6MmcfY=
X-Gm-Gg: AR+sD11dHS5UvF0ymE8iDm3teaIwKSM9x+hz4ELkiIZRk6aJTjz/aJJXAG5wmCgEwf4
	TU7BeUBgpE+kZ7EtAITCOatv2gfgOr6asXhtLkjBBE/n6txqQnhIwIB/NGgjYw6iBZUQXZ0neKn
	InqwSpfuL/jZXYv8iLVnA4QPtrovT+GcePuefKJkYpE13afx56CfdVdlXF4gbc9dolxc+hRgN2/
	N/UZGC2sQvPMLChPsbnG9ogqlY2XW6PEz3qB2TYAnvjoaUx46kzjZJYN6o6PRHXcMzv9J0nVGY0
	RtE7XoNoBeXxyjYheiTMgT1g6ikU5ETIh59trH20+ZuIVn+bYvt/6nOdt7Ajl/mRz4ibOzu90Ag
	VLAkyUc3I0sxvrz+3/4dmkui7RuQZsxT8bTcrU17tTpuyU8/aB610RBP3j8PUP5Q15l7XJ6DcOZ
	VY+seia1ibunlqcIMpNpL/1G2M8ZngUeEGlfFWTS/g0dry++mWcXSq68dHWN1b8KU1Pnxy
X-Received: by 2002:a05:6000:310e:b0:482:ebb0:d00f with SMTP id ffacd0b85a97d-482ebb0d2dcmr5858920f8f.5.1787820816409;
        Thu, 27 Aug 2026 01:53:36 -0700 (PDT)
Received: from [172.20.10.4] ([37.165.68.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9f0esm8105572f8f.10.2026.08.27.01.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 01:53:35 -0700 (PDT)
Message-ID: <444d0f8f-e669-4267-b28c-697e205df51f@linaro.org>
Date: Thu, 27 Aug 2026 10:53:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] pinctrl: meson: Fix typo in s4 group name
To: Sean Anderson <sanderson@brivo.com>, Linus Walleij <linusw@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Qianggui Song <qianggui.song@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <20260817162212.1890616-1-sanderson@brivo.com>
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
In-Reply-To: <20260817162212.1890616-1-sanderson@brivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015338_557107_17689763 
X-CRM114-Status: GOOD (  13.40  )
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

On 8/17/26 18:22, Sean Anderson wrote:
> One of the i2c pin groups has some junk at the end. The name should be
> i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
> meson-s4.dtsi.
> 
> Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
> 
>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 872948699e9fe..365dafe457a9f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
>   static const char * const i2c2_groups[] = {
>   	"i2c2_sda_d", "i2c2_scl_d",
>   	"i2c2_sda_h8", "i2c2_scl_h9",
> -	"i2c2_sda_h0", "i2c2_scl_h1l,"
> +	"i2c2_sda_h0", "i2c2_scl_h1",
>   };
>   
>   static const char * const i2c3_groups[] = {
> ---
> base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
> branch: meson_pinctrl_group
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
