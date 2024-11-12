Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433E2D3ABFB
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GrHlYk9Q9oBU+dwBvyrFJ9m+obc8rFtbXsOW8qj5uQ=; b=BgBjheNgwLb+Zxzelouw5BqdM2
	91wv3jjiosx+evzIz+f0eWU4pVJCYRjDmP6WKFrkWceOVxPccvHOJonY7z0p231XYLzOYdh4FEXY7
	8XQmkyyY6gubggbq9IpDxlFulLi33RUnbTyRvsFkkkjhwZd9tHLQwaqaU2EmlLYv4OQvmq8nw2lJS
	DoorMPmJH5xhhvomyzwTt8Q2mNFwDp5QmnNkyCJbvbEdLbqdeRJO2j42apt7qAlm73tStC/N7dJNa
	x9UTVVK+cwDkkmSwLke552FomCWmlqeR/LiG5Rb/ju+GjGxm94cHZ9y7CDNLgpiDKM2JK2B69TiDS
	v4acHuCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqwc-00000003Z0H-2YA1;
	Tue, 12 Nov 2024 13:28:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqsj-00000003Y5P-2ASi
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 13:24:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-37d5aedd177so3315401f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Nov 2024 05:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731417872; x=1732022672; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op9TisDjuU6SXMVv/j5ec//p11wAht9zab/vpdAa0jE=;
        b=j15hQcMV0NYShAnHaUWxXWl2Nls61DXLv8JuxOtzrrrAANTCuA87R6lCERNe9XWrfJ
         x2JZpjIrN5Ke6WVr6BqvwJjZXuxpqmsIk9IW2/WBbPiDAeFp/JFsbY3wgaW61fY845VP
         gzrhDZ53/6RIXa8dI/hBlVi0ngy9sOD4PhtHnL26bMmU99SkwvQGmV0bRF6q4gQnA/Ot
         mN6UpMpOW5cJJPzTlVyrz5li1Uco84/CAXSBSE30yoF8D0FaartaoHFTiozM79M3QWKu
         SgyT9LmYasA4Fv322ufPKFGIur7nz+e1PFll2DVxHLTHNCdSCoMPtt9DasfFGQ7xNusz
         Q+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731417872; x=1732022672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=op9TisDjuU6SXMVv/j5ec//p11wAht9zab/vpdAa0jE=;
        b=jwPHw5TpPvl94nBlZsGN1XVazHml1hucAj38a6wQIHU3o8iGuRtQSoj+7Zmcye+qyp
         l1Kk8HGxVwKhfmP4m5Ix1ksMOospJn/5/kBysgJk3wFvgavmORbYtEDGqExrC/GNXRaX
         /qdyCf+77dJnW6L/qWIVY1gOXTaeudItBU9ZneXMWfkdepH6k/o00YfhxP8o/gD4dnwF
         MqvvIkXDArFyu69bnJUtH2BA8Juo4SxPK+X2UZnB2ExWorr4UTF6jZy6LT3sZyFQ3QNJ
         raNzfe4BN7bWIwCBrc9nGAH9ZxTFbxGNoWk/4r/yOEEpthnFUIVqtKFfwdWj/6xFXsik
         zXsw==
X-Gm-Message-State: AOJu0YzhqW5E1jrFahOD1gIM0HDHeN0m8Bts10TGzHtdb8VAf3QH+0rX
	ASevl9vnbrY3XR1HBr/a+eyXwhTGQicZaRTSRApAdryz0sLFUCXwqgCf+cFIFz8=
X-Google-Smtp-Source: AGHT+IFUbvqpp7hxTTTbUnzJmnji9CfW4r3V54ckUUimyAfT0DIrLZ5j+wf8asngwceIIwDWhCpAYw==
X-Received: by 2002:a05:6000:4913:b0:381:ed41:da7a with SMTP id ffacd0b85a97d-381f1848940mr12877952f8f.54.1731417871732;
        Tue, 12 Nov 2024 05:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05dfcsm15353314f8f.91.2024.11.12.05.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:24:31 -0800 (PST)
Message-ID: <35307d7a-a110-430d-9ba5-808a05450adb@linaro.org>
Date: Tue, 12 Nov 2024 14:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
To: chuan.liu@amlogic.com, Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jian Hu <jian.hu@amlogic.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
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
In-Reply-To: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_052433_665813_92DDAB9E 
X-CRM114-Status: GOOD (  22.41  )
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

On 12/11/2024 13:57, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> The rate determined by calling clk_regmap_divider_ro_ops with
> clk_regmap_div_determine_rate is not RO, which will result in the
> unexpected modification of the frequency of its children when setting
> the rate of a clock that references clk_regmap_divider_ro_ops.
> 
> Fiexs: ea11dda9e091 ("clk: meson: add regmap clocks")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Background: During the execution of clk_set_rate(), the function
> clk_core_round_rate_nolock() is called to calculate the matching rate
> and save it to 'core->new_rate'. At the same time, it recalculates and
> updates its 'child->newrate'. Finally, clk_change_rate() is called to
> set all 'new_rates'.
> ---
> Changes in v2:
> - Remove the CLK_DIVIDER_READ_ONLY judgment logic in
> clk_regmap_div_determine_rate().
> - Add clk_regmap_div_ro_determine_rate().
> - Link to v1: https://lore.kernel.org/r/20241111-fix_childclk_of_roclk_has_been_tampered_with-v1-1-f8c1b6ffdcb0@amlogic.com
> ---
>   drivers/clk/meson/clk-regmap.c | 36 ++++++++++++++++++++----------------
>   1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
> index 07f7e441b916..edf65ca92c7a 100644
> --- a/drivers/clk/meson/clk-regmap.c
> +++ b/drivers/clk/meson/clk-regmap.c
> @@ -80,21 +80,6 @@ static int clk_regmap_div_determine_rate(struct clk_hw *hw,
>   {
>   	struct clk_regmap *clk = to_clk_regmap(hw);
>   	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> -	unsigned int val;
> -	int ret;
> -
> -	/* if read only, just return current value */
> -	if (div->flags & CLK_DIVIDER_READ_ONLY) {

You're breaking current code by no more checking this flag,
the new clk_regmap_div_ro_determine_rate() is fine, but you should call
it from here if CLK_DIVIDER_READ_ONLY is set.

Neil

> -		ret = regmap_read(clk->map, div->offset, &val);
> -		if (ret)
> -			return ret;
> -
> -		val >>= div->shift;
> -		val &= clk_div_mask(div->width);
> -
> -		return divider_ro_determine_rate(hw, req, div->table,
> -						 div->width, div->flags, val);
> -	}
>   
>   	return divider_determine_rate(hw, req, div->table, div->width,
>   				      div->flags);
> @@ -127,9 +112,28 @@ const struct clk_ops clk_regmap_divider_ops = {
>   };
>   EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
>   
> +static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, div->offset, &val);
> +	if (ret)
> +		return ret;
> +
> +	val >>= div->shift;
> +	val &= clk_div_mask(div->width);
> +
> +	return divider_ro_determine_rate(hw, req, div->table, div->width,
> +					 div->flags, val);
> +}
> +
>   const struct clk_ops clk_regmap_divider_ro_ops = {
>   	.recalc_rate = clk_regmap_div_recalc_rate,
> -	.determine_rate = clk_regmap_div_determine_rate,
> +	.determine_rate = clk_regmap_div_ro_determine_rate,
>   };
>   EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
>   
> 
> ---
> base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
> change-id: 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
