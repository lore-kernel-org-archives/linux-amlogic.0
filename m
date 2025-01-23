Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC136C02182
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jan 2025 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZF3tYKKY7c+9mMjbJCZeFbFwJyfRl5Xkaut7bNFvWA=; b=OPl1rPN9ZcFQsxLKQy0wzTB93U
	VCuiMNX+WNxdXlwGYuMzI+kVtZAmqUW7VYhorfpFDkC1vLBDc9GtAzPQOtf2jbXfNN2vTHX1VMzE9
	GCeVFF2kYRVP4Xlt7gPms8plCHsO6eRGVS/g0lLPZfFcAGDKmmFa3S+7evl30uBwnBZp7boJpUu5v
	SBzSNgOAEXsKLyESZ5p4cMT0nUoUxNCXeSQpc6uRdZUGbHDpqWPRwQCbQdlfUscc+GS/CrcNFxCqG
	50vP32WeIwGVhicTqWCECEjAgn4GQEaCo4XHvecMwjg+W86BQ96UT77GXl2ZJzHxjiBsBLTpHTxwS
	heMOA35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taztG-0000000Co5v-3kqg;
	Thu, 23 Jan 2025 16:17:10 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazri-0000000Cnpb-3SWh
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Jan 2025 16:15:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2163b0c09afso22000075ad.0
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Jan 2025 08:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737648933; x=1738253733; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjXMr6Ng/MoilJ94XOgJRq8mFPscVFXCm/mbI+9c2jY=;
        b=tg4dMIJ/4tlKRlnmZOxih7B2LtHLwRpoFp+BpXNAxx+Er9g73Qw1byZHVG+K/lTSrI
         KtF7JbFrUC+jYyWP1bFDPbJSmLe6pxcJG1M36jUVOZnphmm1zXVKE+860ZSxCWIYIvmb
         IN3LKrML8MgTH1u4yawEy05IIclqH+i6cK/Au+tuIm6e8VSKPJ4Ld3kq9Z5ptCWy4yPj
         Ukx213DXXuloABUDBOT1urpVeF1EHNC0GbX8/TQLbsOVX8D9q18JUFGVT6j72JE3VSnC
         SCUtKKEofu+tzAK8YD30GfDOz77lEwxHYa0Fg76HjWhTmhRrzf8qqen6eVCofen+CfrV
         ABwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648933; x=1738253733;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SjXMr6Ng/MoilJ94XOgJRq8mFPscVFXCm/mbI+9c2jY=;
        b=s43JXqj6p782NiSrIGEERyxxzj+dT3VR2gfcPfuJFCYyx4HI0QyGFswdqpb+OgcM7s
         koBRfYyfpSH+wnn5X3IrEsHVg4Fgw8BBrsM9PaSxcsZjE/3+G0NJ+OfZiG7Yf35i5NyT
         Bi6F8gBcJd4dYsM2v2OPUsvThE0epQDQbnwu3JiSdg/Wl3IrOuiLtrmdk650cbFOf+2C
         k16lj00yS97muLiRdowc4OKQ8WvjvEXqfElrZaGmuHkFrcqW2fLw+rlFpS3Afrp9WRCC
         qmqFmns4Sb9/n5zWuISDL+dy6drdMdxxpxXNY7rtoqbSmgpHND5ZFU43zNyRHQteAdvt
         RF3A==
X-Forwarded-Encrypted: i=1; AJvYcCWKKTrv4KGwUgWo6hJTgUnFAT6MNXE+gMODwbLgHsUm9b8yLrbR0gFTc5QgL40uZL+g1dVoJV3lN/fv4BH5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8gmn6FQgtF7hhj860kzzrsbKeM3Z3lmf4OVCs8jZbhEjwXHoW
	czQsxgUIThuMa+GCnMxh80Q7sgdEbt+4F9jxCfaFAert5UjDio8HcWKytFj0ciA=
X-Gm-Gg: ASbGncsKT6UZpXs694UbOu5NP0NvSKcfHa1C4oqqlmIbRsJd7UnpS+SxW3k3H8NDnYJ
	wz9KIi8O5N7aVWI5kcT8Bj33rhwFL7x+J4eOIVeNr6wGVg+bvwIZnC76yRKxiGti4G1fBbGO/bt
	6COmkxEfQBBFO7Fd0O2DhbBZNb5zr3F2ZNILwGCpnFc1QNLzvoMsQFUIKRnD92D6fQpMU6SR28n
	e4KbVGk1+Ue0CUXQq1Sg9+f6hjS8/X49bvKTGe7aymaknd+R3YhjhSfaLEkhupoWmGQfK3MjTsU
	j1O/MVdqILqmtcUcaQZPw4mxU98=
X-Google-Smtp-Source: AGHT+IHOReOWmKUvUXO+iQq96dVz6JvCSDyFOD3aHEJeWy8o6L8OFplpT4EoSfl5wx4ShJtxk8MQtA==
X-Received: by 2002:a17:902:dacc:b0:215:6995:1ef3 with SMTP id d9443c01a7336-21c352c799bmr381248595ad.3.1737648933225;
        Thu, 23 Jan 2025 08:15:33 -0800 (PST)
Received: from [172.20.6.90] ([207.170.229.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea3937sm889205ad.82.2025.01.23.08.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 08:15:32 -0800 (PST)
Message-ID: <04d08bf8-d5a2-4262-8210-b5173b8c613b@linaro.org>
Date: Thu, 23 Jan 2025 17:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com>
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
In-Reply-To: <20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_081534_863505_D47907C0 
X-CRM114-Status: GOOD (  29.08  )
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

Hi,

On 23/01/2025 11:37, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Define struct meson_msr as a static global variable and remove the
> "*priv" member from struct meson_msr_id.
> 
> Define the size of the corresponding array based on the actual number of
> msr_id of the chip.
> 
> The array corresponding to msr_id is defined as "__initdata" to reduce
> memory usage.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> Each msr_id defines a pointer(*priv), and all these pointers point to
> the same address.
> 
> The number of msr_ids for each chip is inconsistent. Defining a
> fixed-size array for each chip to store msr_ids would waste memory.
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 119 ++++++++++++++++++++------------
>   1 file changed, 74 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index a6453ffeb753..b52e9ce25ea8 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -33,23 +33,27 @@ static DEFINE_MUTEX(measure_lock);
>   #define DIV_STEP		32
>   #define DIV_MAX			640
>   
> -#define CLK_MSR_MAX		128
> -
>   struct meson_msr_id {
> -	struct meson_msr *priv;
>   	unsigned int id;
>   	const char *name;
>   };
>   
> +struct meson_msr_data {
> +	struct meson_msr_id *msr_table;
> +	unsigned int msr_count;
> +};
> +
>   struct meson_msr {
>   	struct regmap *regmap;
> -	struct meson_msr_id msr_table[CLK_MSR_MAX];
> +	struct meson_msr_data data;
>   };
>   
>   #define CLK_MSR_ID(__id, __name) \
>   	[__id] = {.id = __id, .name = __name,}
>   
> -static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
> +static struct meson_msr meson_msr;

The whole architecture was to avoid a global variable like this

> +
> +static struct meson_msr_id clk_msr_m8[] __initdata = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee2"),
> @@ -98,7 +102,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(63, "mipi_csi_cfg"),
>   };
>   
> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
> +static struct meson_msr_id clk_msr_gx[] __initdata = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -168,7 +172,7 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(82, "ge2d"),
>   };
>   
> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
> +static struct meson_msr_id clk_msr_axg[] __initdata = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -242,7 +246,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(109, "audio_locker_in"),
>   };
>   
> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
> +static struct meson_msr_id clk_msr_g12a[] __initdata = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -358,7 +362,7 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(122, "audio_pdm_dclk"),
>   };
>   
> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
> +static struct meson_msr_id clk_msr_sm1[] __initdata = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -489,9 +493,8 @@ static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>   };
>   
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
> -			       unsigned int duration)
> +			    unsigned int duration)
>   {
> -	struct meson_msr *priv = clk_msr_id->priv;
>   	unsigned int val;
>   	int ret;
>   
> @@ -499,22 +502,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	if (ret)
>   		return ret;
>   
> -	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
> +	regmap_write(meson_msr.regmap, MSR_CLK_REG0, 0);
>   
>   	/* Set measurement duration */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
> +	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_DURATION,
>   			   FIELD_PREP(MSR_DURATION, duration - 1));
>   
>   	/* Set ID */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
> +	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_CLK_SRC,
>   			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>   
>   	/* Enable & Start */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
> +	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0,
>   			   MSR_RUN | MSR_ENABLE,
>   			   MSR_RUN | MSR_ENABLE);
>   
> -	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
> +	ret = regmap_read_poll_timeout(meson_msr.regmap, MSR_CLK_REG0,
>   				       val, !(val & MSR_BUSY), 10, 10000);
>   	if (ret) {
>   		mutex_unlock(&measure_lock);
> @@ -522,10 +525,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	}
>   
>   	/* Disable */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
> +	regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
>   
>   	/* Get the value in multiple of gate time counts */
> -	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
> +	regmap_read(meson_msr.regmap, MSR_CLK_REG2, &val);
>   
>   	mutex_unlock(&measure_lock);
>   
> @@ -579,7 +582,7 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
>   	seq_puts(s, "  clock                     rate    precision\n");
>   	seq_puts(s, "---------------------------------------------\n");
>   
> -	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> +	for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
>   		if (!msr_table[i].name)
>   			continue;
>   
> @@ -604,77 +607,103 @@ static const struct regmap_config meson_clk_msr_regmap_config = {
>   
>   static int meson_msr_probe(struct platform_device *pdev)
>   {
> -	const struct meson_msr_id *match_data;
> -	struct meson_msr *priv;
> +	const struct meson_msr_data *match_data;
> +	struct meson_msr_id *msr_table;
>   	struct dentry *root, *clks;
>   	void __iomem *base;
>   	int i;
>   
> -	priv = devm_kzalloc(&pdev->dev, sizeof(struct meson_msr),
> -			    GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
>   	match_data = device_get_match_data(&pdev->dev);
>   	if (!match_data) {
>   		dev_err(&pdev->dev, "failed to get match data\n");
>   		return -ENODEV;
>   	}
>   
> -	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
> +	msr_table = devm_kcalloc(&pdev->dev, match_data->msr_count,
> +				 sizeof(struct meson_msr_id), GFP_KERNEL);
> +	if (!msr_table)
> +		return -ENOMEM;
> +
> +	memcpy(msr_table, match_data->msr_table,
> +	       match_data->msr_count * sizeof(struct meson_msr_id));
> +	meson_msr.data.msr_table = msr_table;
> +	meson_msr.data.msr_count = match_data->msr_count;
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> -	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> -					     &meson_clk_msr_regmap_config);
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> +	meson_msr.regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +						 &meson_clk_msr_regmap_config);
> +	if (IS_ERR(meson_msr.regmap))
> +		return PTR_ERR(meson_msr.regmap);
>   
>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>   	clks = debugfs_create_dir("clks", root);
>   
> -	debugfs_create_file("measure_summary", 0444, root,
> -			    priv->msr_table, &clk_msr_summary_fops);
> +	debugfs_create_file("measure_summary", 0444, root, msr_table,
> +			    &clk_msr_summary_fops);
>   
> -	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> -		if (!priv->msr_table[i].name)
> +	for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
> +		if (!msr_table[i].name)
>   			continue;
>   
> -		priv->msr_table[i].priv = priv;
> -
> -		debugfs_create_file(priv->msr_table[i].name, 0444, clks,
> -				    &priv->msr_table[i], &clk_msr_fops);
> +		debugfs_create_file(msr_table[i].name, 0444, clks,
> +				    &msr_table[i], &clk_msr_fops);
>   	}
>   
>   	return 0;
>   }
>   
> +static const struct meson_msr_data clk_msr_gx_data = {
> +	.msr_table = clk_msr_gx,
> +	.msr_count = ARRAY_SIZE(clk_msr_gx),
> +};
> +
> +static const struct meson_msr_data clk_msr_m8_data = {
> +	.msr_table = clk_msr_m8,
> +	.msr_count = ARRAY_SIZE(clk_msr_m8),
> +};
> +
> +static const struct meson_msr_data clk_msr_axg_data = {
> +	.msr_table = clk_msr_axg,
> +	.msr_count = ARRAY_SIZE(clk_msr_axg),
> +};
> +
> +static const struct meson_msr_data clk_msr_g12a_data = {
> +	.msr_table = clk_msr_g12a,
> +	.msr_count = ARRAY_SIZE(clk_msr_g12a),
> +};
> +
> +static const struct meson_msr_data clk_msr_sm1_data = {
> +	.msr_table = clk_msr_sm1,
> +	.msr_count = ARRAY_SIZE(clk_msr_sm1),
> +};
> +
>   static const struct of_device_id meson_msr_match_table[] = {
>   	{
>   		.compatible = "amlogic,meson-gx-clk-measure",
> -		.data = (void *)clk_msr_gx,
> +		.data = &clk_msr_gx_data,
>   	},
>   	{
>   		.compatible = "amlogic,meson8-clk-measure",
> -		.data = (void *)clk_msr_m8,
> +		.data = &clk_msr_m8_data,
>   	},
>   	{
>   		.compatible = "amlogic,meson8b-clk-measure",
> -		.data = (void *)clk_msr_m8,
> +		.data = &clk_msr_m8_data,
>   	},
>   	{
>   		.compatible = "amlogic,meson-axg-clk-measure",
> -		.data = (void *)clk_msr_axg,
> +		.data = &clk_msr_axg_data,
>   	},
>   	{
>   		.compatible = "amlogic,meson-g12a-clk-measure",
> -		.data = (void *)clk_msr_g12a,
> +		.data = &clk_msr_g12a_data,
>   	},
>   	{
>   		.compatible = "amlogic,meson-sm1-clk-measure",
> -		.data = (void *)clk_msr_sm1,
> +		.data = &clk_msr_sm1_data,
>   	},
>   	{ /* sentinel */ }
>   };
> 
> ---
> base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
> change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794
> 
> Best regards,

I think the goal is fine, but we should avoid any global variable to store
the state and avoid initdata, but yes I agree to drop the fixed size tables
and store the table size size in the compatible data.

The solution would be to:
- drop the MAX like you did
- add a msr_count with ARRAY_SIZE like you did
- but mark the compat data and table as const
- in probe, allocate priv with a large table inside, & copy the data into it

This should probably work and we could move the tables to read-only section.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
