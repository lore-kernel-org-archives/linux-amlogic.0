Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3B3C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2024 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubS096Cqs3rxcI9mqFx/OK+dLw1qJInnXPhIeMfZETE=; b=dytRfwgX97kG0XdBCQhaAH2ERS
	GR3+PFk/mAYnnuqknYW7mWTOhcM00yMfknqZ5CCn+Ce+8kTDjL7qQ0grEL3bORsd6On+Z8CZi5+zB
	RaYK0+dKMcViRmYUGMNBHZUNMSU4LD7GLiDWXTqwfh7TZgmvrfVZUkwuV+0K19Ak578HVEpIJGu3b
	MW1tEEqm964PcQaqYkXomAdkAE7OlRtG6ZzsfDVYLmbncoAKNfS3dedc0jPd0m8BXLiNLiJoZM6sF
	TQbC6pbzTFz1jXmBOhHMidhBH5AOyAw0m6O9TNKfNeJlDg8RyDw6YmjQzyvKB1UN1UVMXxlZmqEgV
	48EZ/jRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Hk-00000002BOg-2Gdx;
	Mon, 19 Aug 2024 16:31:12 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg5Hh-00000002BMg-1em3
	for linux-amlogic@lists.infradead.org;
	Mon, 19 Aug 2024 16:31:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso38201365e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2024 09:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724085067; x=1724689867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8pX4yn6CKbjQ8Lpth791/scSYxiykMIBRADHew9tCc=;
        b=JsabgHmtbGA+EMf0Q0SzkA2vkQI3e/4iWcOPxt5x9I7qrrJiI+IRua/5z4r26C4Aul
         kDKzz8BTy6VIG8Cvo1Oq9JA41GUmntLXfPMTg8FCEVQVyGDON0LRvApQZXChKNiHUkV0
         UDw9daLUNSKTWn5Lc3LAUiCOAzqkncoBaGSHs+eN+LwYmy+QzI5tQomTuSLi+wD8RWRt
         DWwjtTmdq6MfBaZpoCgj7oLaCHc5scupa2O7w8cZWVIHFs687HRkMGmbpNG/EX/Zk7Ys
         4eqPXP0fJgIdEd2yyRuiP2M1Kvgul5uUtEYF8Hqxr4hw0e3Pjd5ofJCNIQLR3tHpQCe2
         03Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724085067; x=1724689867;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x8pX4yn6CKbjQ8Lpth791/scSYxiykMIBRADHew9tCc=;
        b=sFF4Sa63Sr03xGdyfKuiGwpn5qsjvnaQw3FO+xxiQLCL+y6G9gLe2Pr3hbuyRz6UF1
         dOaybJ4UuRIx5je5badyeWwPcKnTtTeeAtI7zWtccsB9GrGbNsI8YdIIoH705eXIWxfv
         MmPnvSEhzUg5bw2QCIo3Ba2/6r835UwYyirDQXG1zYRjK8pvrcF/MKnWWhSfIs7QXgZZ
         PQ2cpcjCHBDE0s1fyKP8SkoYmF64i8HHqFTmQCXtz8N0ehOz12aqwpA0sOdhI51acu5L
         fKIwbmbWp7MEFkFmHzuRYAbxmDXdqiGQIugVEiggqMaSaINqHb7YCPChXg/f4EqSSgte
         TgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP5vTKc0ldRW6HCqFsZ5xkf0z9UFMBzKzf/kMiilwzjUaDslG7a62PkydQUUmUW3hKP0CFTx2kugzcZoC7k+47AmYe34kDnnyGIrZv2wEw1nI=
X-Gm-Message-State: AOJu0YxPZp7FDdBaq5b7XW+vnz2EJQqfrAlOJQgTgfJEPowmBE6T+NZl
	Ew37HUh28JxdT/u5lSyAWmBUPyAl0deF7k5Fkq52ylVTTcxTyZ1F59kJZC8R7Tw=
X-Google-Smtp-Source: AGHT+IFV319GEVIPH1Hqpy9Bs8aSzc+KkvX3+H7JeA5+3QCFBV8LccuOw6oaMarldM0pUiXFW70NMw==
X-Received: by 2002:a05:600c:45d3:b0:428:2e9:65a9 with SMTP id 5b1f17b1804b1-42aa82651f1mr48240035e9.28.1724085067184;
        Mon, 19 Aug 2024 09:31:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727? ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed65079fsm114611955e9.16.2024.08.19.09.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:31:06 -0700 (PDT)
Message-ID: <0bbbf439-9722-4140-8044-78b71b2f23af@linaro.org>
Date: Mon, 19 Aug 2024 18:31:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/9] reset: amlogic: add reset status support
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
 <20240808102742.4095904-7-jbrunet@baylibre.com>
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
In-Reply-To: <20240808102742.4095904-7-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_093109_495894_06A309A6 
X-CRM114-Status: GOOD (  18.94  )
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

On 08/08/2024 12:27, Jerome Brunet wrote:
> Add a callback to check the status of the level reset, as done in
> the reset driver of the audio clock controller.
> 
> This is done keep the functionality when the audio reset controller
> get migrated to meson-reset.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 5b6f934c0265..b16d9c32adb1 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -56,8 +56,7 @@ static int meson_reset_reset(struct reset_controller_dev *rcdev,
>   static int meson_reset_level(struct reset_controller_dev *rcdev,
>   			    unsigned long id, bool assert)
>   {
> -	struct meson_reset *data =
> -		container_of(rcdev, struct meson_reset, rcdev);
> +	struct meson_reset *data = container_of(rcdev, struct meson_reset, rcdev);

Unrelated change

>   	unsigned int offset, bit;
>   
>   	meson_reset_offset_and_bit(data, id, &offset, &bit);
> @@ -68,6 +67,22 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   				  BIT(bit), assert ? BIT(bit) : 0);
>   }
>   
> +static int meson_reset_status(struct reset_controller_dev *rcdev,
> +			      unsigned long id)
> +{
> +	struct meson_reset *data =
> +		container_of(rcdev, struct meson_reset, rcdev);
> +	unsigned int val, offset, bit;
> +
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
> +
> +	regmap_read(data->map, offset, &val);
> +	val = !!(BIT(bit) & val);
> +
> +	return val ^ data->param->level_low_reset;
> +}
> +
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
>   			      unsigned long id)
>   {
> @@ -84,6 +99,7 @@ static const struct reset_control_ops meson_reset_ops = {
>   	.reset		= meson_reset_reset,
>   	.assert		= meson_reset_assert,
>   	.deassert	= meson_reset_deassert,
> +	.status		= meson_reset_status,
>   };
>   
>   static const struct meson_reset_param meson8b_param = {


with the first change removed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
