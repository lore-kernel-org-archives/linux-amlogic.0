Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C20CED275
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi1Ykse/kWlJOmOVV9qqEOWRz09vy0gcChjhTq7TK6w=; b=4KKmCD1K0K8x2OfO+hr1GY2pjA
	MZ4dnKvkLPsvBFbYTItSsCglv4XQFyp9H7xLvap5WagpGy6H9SxnIwSvb25kExDe1o1lIoBAvZl+5
	Qva2XM2JAnpp46pNdS1Qb/feJNWc+EMJnnmLXmUVp+OhPnsHn/fTnTjQB6hj2aUGF53RhGnaBC023
	UBn25YGAHPQPz4Yif2pFdMYjHZV38DUYcYI+wOo4BZTUVKEatPJ3bbtjVmX925yoIBo7u1/YJnfvN
	c4CvkA6k41ZdkGwa1tYZN2ENypO3J3/twcEEhfHTPR+tyKfCkB6bBbR4qQVB87WF6AnNPaIALezFL
	6LF+5BYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4k3-00000004oII-2FfW;
	Tue, 08 Oct 2024 07:34:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4ga-00000004nPu-3esU
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:31:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37cc810ce73so2777161f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728372671; x=1728977471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy2shiK3fmb6j9W5GjzkVqsj9Kn/pQMnvw0hDyVzAGg=;
        b=WzoReafHcyHykCjPr/59IXd9kQmkBueL0v+Q84+v09J4eaH8yY2vVR2/T7oSZ+41mZ
         +bAZeGC7xAPeB9ZPP1pJ+bdamrhHNoyNiIsdL9oE6eGd21xDO7Xb0ctefm4tmEGr92oV
         3VBe3mvvt0OwQ6CgJgf2pztmfgqxllyb7arpZ2Lmv8OPEhBjblkU3rea4bCr722+pD7c
         vV7nSpjqgWqr6+RWxCa35+2bkmL/5rCy9EJayvbFjBg8Bhe1lAG9FHIjYLChaLFknK+D
         pvviVAibD550JjGu+DhIo50IeZqO6Y3qV1FMZq/uJWnLv7W5Bbm/luSEWMNAs2LKMK3W
         tBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372671; x=1728977471;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fy2shiK3fmb6j9W5GjzkVqsj9Kn/pQMnvw0hDyVzAGg=;
        b=fKtIY8h6UIT6msyK4kZ1mBnDzj+3qnFz1v1QUFlm9k3tNr+vxg45XrCA5oKm+jzWLn
         tPSdFn6FWMPVE1qOEyJly8eE+Vu8v24a5yS4MwshSbRu3n8UM2qYRTj9dztHlrbGtFym
         xHJQEf7KRkB/+B2Unp28uiW7AM6HuUzkNaMdjM1+WS2Q/OgO9Wu154XRAM+1MIn3kdJj
         POmOEwg9wtrlBGXX2679Hvu5HBJ+rVP0qN+PcGhn+3oEAbYadlKGYmgZ9YAS49Ck0tB4
         Q7IX7Cj4rQzEI7yr+8LVRMujbdCOQT7afqv6G3tXddgA2WUHrsI3ssuCwyeH6eds9NlF
         p3AA==
X-Forwarded-Encrypted: i=1; AJvYcCWfTyNaYOvogaIKxzFbcWFWMNHmSbJqFdt+gGmRwfIHJTAUv4HcsdvFWg9j/UE/b+19Pn08651oUEUZKrO7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv/EMSnKJ8YdGlfsfqRz+r1/JU1ftwgIR+igqYsj1+ZU2rpOwN
	5t/5tbUQgidPDEJ81OpjfQFSmeQwFAqRWCABkwAmY4axc3NdCkb/AtHu7fR2B/U=
X-Google-Smtp-Source: AGHT+IHIPRLHczs/vsnv1oAAp5+Q/um5G5Z/VdRLJkNxGk807Uk3XMrbK8IQ+3b5doUrR7C6rxdWqQ==
X-Received: by 2002:a05:6000:1b8b:b0:37c:ce45:96f2 with SMTP id ffacd0b85a97d-37d0e8f7390mr7513067f8f.50.1728372671045;
        Tue, 08 Oct 2024 00:31:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20393sm116449555e9.12.2024.10.08.00.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:31:09 -0700 (PDT)
Message-ID: <5c3a6fdb-e4f0-4a22-9a8d-84baee12769c@linaro.org>
Date: Tue, 8 Oct 2024 09:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/3] pwm: meson: Enable constant and polarity features for
 g12, axg, s4
To: George Stark <gnstark@salutedevices.com>, u.kleine-koenig@pengutronix.de,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@salutedevices.com
References: <20241007193203.1753326-1-gnstark@salutedevices.com>
 <20241007193203.1753326-4-gnstark@salutedevices.com>
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
In-Reply-To: <20241007193203.1753326-4-gnstark@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003112_955740_96B4A454 
X-CRM114-Status: GOOD (  11.28  )
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

On 07/10/2024 21:32, George Stark wrote:
> g12, axg and s4 SoC families support constant and polarity bits so enable
> those features in corresponding chip data structs.
> 
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   drivers/pwm/pwm-meson.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 6701738c55e3..c6f032bdfe78 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -571,26 +571,36 @@ static const struct meson_pwm_data pwm_gxbb_ao_data = {
>   static const struct meson_pwm_data pwm_axg_ee_data = {
>   	.parent_names = { "xtal", "fclk_div5", "fclk_div4", "fclk_div3" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct meson_pwm_data pwm_axg_ao_data = {
>   	.parent_names = { "xtal", "axg_ao_clk81", "fclk_div4", "fclk_div5" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct meson_pwm_data pwm_g12a_ee_data = {
>   	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct meson_pwm_data pwm_g12a_ao_ab_data = {
>   	.parent_names = { "xtal", "g12a_ao_clk81", "fclk_div4", "fclk_div5" },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct meson_pwm_data pwm_g12a_ao_cd_data = {
>   	.parent_names = { "xtal", "g12a_ao_clk81", NULL, NULL },
>   	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct meson_pwm_data pwm_meson8_v2_data = {
> @@ -599,6 +609,8 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>   
>   static const struct meson_pwm_data pwm_s4_data = {
>   	.channels_init = meson_pwm_init_channels_s4,
> +	.has_constant = true,
> +	.has_polarity = true,
>   };
>   
>   static const struct of_device_id meson_pwm_matches[] = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
