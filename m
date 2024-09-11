Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A23EE498D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw6DrCAF60nHpQTPYFoLqe8KZqREahfG3zOs4y/AxEY=; b=D3hD617RJ/TT6f7sp65iprfa+g
	YnVBCVjZTEImYxXuP2AhiaATJPTJMR1jS23gbrlcrSoeg4Em+DkuKNHQI7cGxj9HRed5AK8rMJiMP
	51tSwMQTN1cvlbD2AXNkAzlJ5aLktnKlPHQVdaZVIAMqLEB4ENtTs09Bcjppab8JBAfXRzx3PyDjs
	xe1OeJ76QBXXooEWX/7NSKBmnSFsmOhKWCZlQUEP2aRuj8xU+HqFpsiXRtNt4S+ei7RxyEl+7w0hG
	uKo/m3l9toOR+ZstWrW5RrFaQpbn0jgx1MRf4mCzjZ5IuZs/+kHllfVl1kkrEodgQNiYJc54A2qia
	wdaLwXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKcO-000000095zu-2FAX;
	Wed, 11 Sep 2024 10:30:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKWs-000000094qk-16WP
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:24:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3780c8d689aso4147213f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726050292; x=1726655092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCdy0RdUyCbweijYWRS7Oe+sN0LYefHdLb2bjTmlhOI=;
        b=gW3bx2ZG6bLh8TiqkpsfE0t6nOBlUg4rUz86pIpBfEeuQ+rg0G+Mu7amsBmFKJsmZo
         4k5fAoA+pEGKMGgxzRq5A/qgzxb0rZdMeh/VE4KOz75lQusFhGrppesFWxh/5J/XQJf9
         hf8J2pMXTUeebYwr86kXc7H13ul2WRMX4G7d+aqPsdsXlR4ix0eZW7suZO4aCERRjape
         em3S6Mx9b/klK9vO97Cvwfkrq1NFkwRpNXLWEiNMNcrbRBZnpXpDpwOCcDq2YwUGY0Uk
         VCfe2MHgQ2FxvWJ6mHF7zGEKBKD3LZLiTMYyYqExPPKtUgr2yO5pUIyRHIrqvkOvBSt0
         lmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726050292; x=1726655092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UCdy0RdUyCbweijYWRS7Oe+sN0LYefHdLb2bjTmlhOI=;
        b=TJXL1zKPABck9GzKkpP+VHM8GNPjzAPFqCvVv01ICUz4YX832PKJkLOMxSQiRWSa9y
         id+3JpiBwUM3lRNRaqkcRrUlbAmAs4r+Ss3uRzHYi+7rcgWrXqwWqpTq/0Syn4BDWIAg
         L916Wz9v2vYdm80yQvBYMCmxMr0ojLx6fIW3vr3xGAjLTDIS4SAq5YKroKnepqkiUltY
         ru03HfiL/CmjpT8rNTPmE4u6CTHGTEHn3jHDHf2RhGhU0dcmLwvXakQRkert3wbc5Sgt
         8Y3TgWnDRM4fT9fhaJ6dVUi+e0gpIUxKQegEXXqhAobj2+wIzNXYy49nHUvTTvygsab0
         36Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUQcNjfFAbpfufB/PjXdJfWugLtFA0yJqaAzWNPnoVZDW698KGQw5+OEqza1ejmJGdDQH+RJtgbu5wsX3By@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy+IemkYAYQgGOX9D0xJk39nvrRsylB4VSQeyMw5A+Njs2iGUh
	U7BTbtZni6elBka+aluhexsIrZttKeW0zISw5SuNKUJyOL3krTgguBAz8PGJXVo=
X-Google-Smtp-Source: AGHT+IFEFNMXj/YrwUwSkNn9fs/IOdtEP7hEN+0kbQh4bzyWyI1Z98gsKKfyrZjB8tOoy3en2escAg==
X-Received: by 2002:a05:6000:128c:b0:374:c287:929b with SMTP id ffacd0b85a97d-378895c5224mr10490802f8f.4.1726050292245;
        Wed, 11 Sep 2024 03:24:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1680:3625:e94b:7c21? ([2a01:e0a:982:cbb0:1680:3625:e94b:7c21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc01a8ee7sm54782885e9.0.2024.09.11.03.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:24:51 -0700 (PDT)
Message-ID: <9f753151-b908-4585-aae2-4a2ff5dd41af@linaro.org>
Date: Wed, 11 Sep 2024 12:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/9] reset: amlogic: add driver parameters
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
 <20240910-meson-rst-aux-v5-4-60be62635d3e@baylibre.com>
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
In-Reply-To: <20240910-meson-rst-aux-v5-4-60be62635d3e@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_032454_538008_8DC3A35B 
X-CRM114-Status: GOOD (  17.21  )
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

On 10/09/2024 18:32, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, allow to customise
> the reset offset, same as the level offset. Also add an option to make
> the level reset active low or high.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 50bd2241ef2f..6a90613c8095 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -18,7 +18,9 @@
>   
>   struct meson_reset_param {
>   	unsigned int reg_count;
> +	unsigned int reset_offset;
>   	unsigned int level_offset;
> +	bool level_low_reset;
>   };
>   
>   struct meson_reset {
> @@ -46,6 +48,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>   	unsigned int offset, bit;
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->reset_offset;
>   
>   	return regmap_write(data->map, offset, BIT(bit));
>   }
> @@ -59,9 +62,10 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
>   	offset += data->param->level_offset;
> +	assert ^= data->param->level_low_reset;
>   
>   	return regmap_update_bits(data->map, offset,
> -				  BIT(bit), assert ? 0 : BIT(bit));
> +				  BIT(bit), assert ? BIT(bit) : 0);
>   }
>   
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -84,22 +88,30 @@ static const struct reset_control_ops meson_reset_ops = {
>   
>   static const struct meson_reset_param meson8b_param = {
>   	.reg_count	= 8,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x7c,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_a1_param = {
>   	.reg_count	= 3,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param meson_s4_param = {
>   	.reg_count	= 6,
> +	.reset_offset	= 0x0,
>   	.level_offset	= 0x40,
> +	.level_low_reset = true,
>   };
>   
>   static const struct meson_reset_param t7_param = {
>   	.reg_count      = 7,
> +	.reset_offset	= 0x0,
>   	.level_offset   = 0x40,
> +	.level_low_reset = true,
>   };
>   
>   static const struct of_device_id meson_reset_dt_ids[] = {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
