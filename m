Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B523C02198
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpQmzkW1rpIE+F5jsqbmDRMKZ7fPM9FRuxrUsC10sAM=; b=1guEp0xEn6JiCIqSYk3O8yTed3
	t04lQZT7Zl83fokVWa5Dk5q54NXgE4fmsihRRS9I5/p9XsFAmNQXCD6zbW5Q4k7sExLu6CPYscXIz
	J8CdOcHMUpS/3RLmVgog+XOfI3fH/EJVExBGlTuKj9X1o2bL5IfljtCr/U3YmuXMOBsrLLX98iBH4
	wnNVy5yEEpEKenvwGCq3MJ/fSo7xfhEz/VqmjViWWpWEqrSlpAFgLdgEupqNdfO+FWycc4XR2JDVI
	RH03EuqwSADTsMxF4RW3x2LbbIGXX2UuZg1l+HZDxQ0VrwXT80ai87wC0PmgTXiGoyZeJ0B4ubQhb
	FRqJIKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQSa-0000000Gsot-0rWn;
	Mon, 10 Feb 2025 09:52:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQR2-0000000GsW1-2nSW
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 09:50:37 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso41103045e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739181035; x=1739785835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LagJi4kw7+CXMtX4h66oy5kDRSLSVOPBo3JG3mSYr8w=;
        b=DFHUTACgXU36E+CvhI4hU5OEKOeY0CiYRCzjUAyLQoSC/vttkzQqBr9bIph6+O4G2o
         mBbfwaOQVjreBPUJeT9oZGE5XEHFaWzENSdKGXHlR9AHS8S8l4iEZR9mMO5EqccA8LDw
         A4g+4uLNW0h/ZKBzVMkGoUKqEtegDXXd6tVefmh7II+SyvFXXll4ROST0o0UolcVZ9Cb
         GGiJkSXNxPYTgFgKw/QF3QRiX4zcaM6NgYuSXcRaGj0TmxZck+WIvWeKoRRxhsde726s
         55ERJCpliBGt53EP2djiGoS8wfiBAQMZZeHcxQxdVkdhp4X5H+0LXdMxZSIEcOpaTz+P
         BTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739181035; x=1739785835;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LagJi4kw7+CXMtX4h66oy5kDRSLSVOPBo3JG3mSYr8w=;
        b=gnI0+/5SNxWIXwThrWY3oQK2hnon+UDXkxuftf/sYz6uxCkxz0x2WoFCk8/3s1qFdH
         2ryJfkbh/veqgK6r3Vu9X9Bq+WhiHnozlVAVKn0UKm3V5A3/GonC4vvndcxZy7xYK7RB
         NEhB6qQfcSOqWqvP7vx7uLDP8IiAnryiPm7OA4Mm1BU9io359H8cTA5Dtw0YAp2AeA/z
         SK004slmqGa8AHto+eimtiloZ5osE0YOzM+2UWNIATTVNuGNxQGX9+s0L9eo3By0blZs
         S+xyk0Ru5UXfWSwjzhZRuofzt2OY6/c6eGrcXHwmhUTHOd8s8sHRVsHsj6HNB5CQrv9c
         DFWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsBxTr/jnIhngPDRcwsczYiIKUWG2tQI5JJQ2DQpJLm9k9dRrrJJRKnizjb6EgBVfqf2Kd4Nkx/1vGU7OL@lists.infradead.org
X-Gm-Message-State: AOJu0YwTVf0MvAoQTOP7KRW46IxR+C2PCpUwxj57AETagVQ1vq/Z1Vyi
	qdc4pNKM8ww5/qAR0ilWztlV0DTR4CLUWdPUde6op7w8aadqK2tMJVQaII1Gv/+fCfaomlBnSrB
	L
X-Gm-Gg: ASbGnctS6uNvwJgAfipYiDW0quCQmPYJ8hljkZ4tnqUTq47wQg3htcmwkwcOOUsOgZE
	gnzWoy/afWce8UzPjPh6mo9qllARK5RBT0PgjK/IevBCeG0Bm961e7c7E4W1uDTA5oQl0ksjPRd
	6lqWGuYdiOTx8Ooq39flYnIWm9eqVXl6RWpJWUf9OKZvszT+aSmTeFuE5Y4dDjlLhXcP/lQ0KAA
	45gxfbUi3N45nHBZ/42q/gl9WS7feS4MuLxcvYE/ZDTbkt7HExj8DBqu2AdPavnBkkrkp1teZVk
	QMZKfxMJdhbdD8N4KjKOpA/K33KbdA62H0sHdG/5m0aQWLtx0KQ8ZdJ8aJY4Wa4Wg18w
X-Google-Smtp-Source: AGHT+IE+Zw8vElKrozbDz9J93cx5VFxG4xf7O0Noct2EF/OGFeCzZy73gmY3TWsR9K3loN+SESU9JA==
X-Received: by 2002:a05:600c:4e89:b0:439:45ce:15e9 with SMTP id 5b1f17b1804b1-43945ce19a1mr13888945e9.26.1739181034804;
        Mon, 10 Feb 2025 01:50:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5? ([2a01:e0a:982:cbb0:8235:1ea0:1a75:c4d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc73c2e00sm9872571f8f.57.2025.02.10.01.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 01:50:34 -0800 (PST)
Message-ID: <774d1a84-cc35-418d-9a84-867888b843da@linaro.org>
Date: Mon, 10 Feb 2025 10:50:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
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
In-Reply-To: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_015036_702596_1E682778 
X-CRM114-Status: GOOD (  24.43  )
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

On 05/02/2025 08:58, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
> the structure to specify the count of msr_id.
> 
> Mark the table of msr_id as const.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> The number of msr_ids for each chip is inconsistent. Defining a
> fixed-size array for each chip to store msr_ids would waste memory.
> ---
> Changes in v2:
> - Discard the global variable and restore the "priv" member in the
> "struct meson_msr_id".
> - Mark msr_id_table as const.
> - Link to v1: https://lore.kernel.org/r/20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 86 ++++++++++++++++++++++++---------
>   1 file changed, 62 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index a6453ffeb753..39638d6a593c 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -33,23 +33,26 @@ static DEFINE_MUTEX(measure_lock);
>   #define DIV_STEP		32
>   #define DIV_MAX			640
>   
> -#define CLK_MSR_MAX		128
> -
>   struct meson_msr_id {
>   	struct meson_msr *priv;
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
> +static const struct meson_msr_id clk_msr_m8[] = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee2"),
> @@ -98,7 +101,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(63, "mipi_csi_cfg"),
>   };
>   
> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_gx[] = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -168,7 +171,7 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(82, "ge2d"),
>   };
>   
> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_axg[] = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -242,7 +245,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(109, "audio_locker_in"),
>   };
>   
> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_g12a[] = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -358,7 +361,7 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>   	CLK_MSR_ID(122, "audio_pdm_dclk"),
>   };
>   
> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_sm1[] = {
>   	CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>   	CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>   	CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -489,7 +492,7 @@ static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>   };
>   
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
> -			       unsigned int duration)
> +			    unsigned int duration)
>   {
>   	struct meson_msr *priv = clk_msr_id->priv;
>   	unsigned int val;
> @@ -573,13 +576,14 @@ DEFINE_SHOW_ATTRIBUTE(clk_msr);
>   static int clk_msr_summary_show(struct seq_file *s, void *data)
>   {
>   	struct meson_msr_id *msr_table = s->private;
> +	unsigned int msr_count = msr_table->priv->data.msr_count;
>   	unsigned int precision = 0;
>   	int val, i;
>   
>   	seq_puts(s, "  clock                     rate    precision\n");
>   	seq_puts(s, "---------------------------------------------\n");
>   
> -	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> +	for (i = 0 ; i < msr_count ; ++i) {
>   		if (!msr_table[i].name)
>   			continue;
>   
> @@ -604,7 +608,7 @@ static const struct regmap_config meson_clk_msr_regmap_config = {
>   
>   static int meson_msr_probe(struct platform_device *pdev)
>   {
> -	const struct meson_msr_id *match_data;
> +	const struct meson_msr_data *match_data;
>   	struct meson_msr *priv;
>   	struct dentry *root, *clks;
>   	void __iomem *base;
> @@ -621,7 +625,16 @@ static int meson_msr_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
> +	priv->data.msr_table = devm_kcalloc(&pdev->dev,
> +					    match_data->msr_count,
> +					    sizeof(struct meson_msr_id),
> +					    GFP_KERNEL);
> +	if (!priv->data.msr_table)
> +		return -ENOMEM;
> +
> +	memcpy(priv->data.msr_table, match_data->msr_table,
> +	       match_data->msr_count * sizeof(struct meson_msr_id));
> +	priv->data.msr_count = match_data->msr_count;
>   
>   	base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(base))
> @@ -636,45 +649,70 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	clks = debugfs_create_dir("clks", root);
>   
>   	debugfs_create_file("measure_summary", 0444, root,
> -			    priv->msr_table, &clk_msr_summary_fops);
> +			    priv->data.msr_table, &clk_msr_summary_fops);
>   
> -	for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> -		if (!priv->msr_table[i].name)
> +	for (i = 0 ; i < priv->data.msr_count ; ++i) {
> +		if (!priv->data.msr_table[i].name)
>   			continue;
>   
> -		priv->msr_table[i].priv = priv;
> +		priv->data.msr_table[i].priv = priv;
>   
> -		debugfs_create_file(priv->msr_table[i].name, 0444, clks,
> -				    &priv->msr_table[i], &clk_msr_fops);
> +		debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
> +				    &priv->data.msr_table[i], &clk_msr_fops);
>   	}
>   
>   	return 0;
>   }
>   
> +static const struct meson_msr_data clk_msr_gx_data = {
> +	.msr_table = (void *)clk_msr_gx,
> +	.msr_count = ARRAY_SIZE(clk_msr_gx),
> +};
> +
> +static const struct meson_msr_data clk_msr_m8_data = {
> +	.msr_table = (void *)clk_msr_m8,
> +	.msr_count = ARRAY_SIZE(clk_msr_m8),
> +};
> +
> +static const struct meson_msr_data clk_msr_axg_data = {
> +	.msr_table = (void *)clk_msr_axg,
> +	.msr_count = ARRAY_SIZE(clk_msr_axg),
> +};
> +
> +static const struct meson_msr_data clk_msr_g12a_data = {
> +	.msr_table = (void *)clk_msr_g12a,
> +	.msr_count = ARRAY_SIZE(clk_msr_g12a),
> +};
> +
> +static const struct meson_msr_data clk_msr_sm1_data = {
> +	.msr_table = (void *)clk_msr_sm1,
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

Looks fine, thanks !!!

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
