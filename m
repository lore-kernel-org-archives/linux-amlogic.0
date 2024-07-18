Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D365C3DA60
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S0fg0PdSDbBFZ3pUCgwJKuqDwliO+5N1dfR5m2cKpU=; b=YEEAwK8t7nQDgT+NUyk3scctNT
	MmHz/JUdYsLGYAfnRRc9uC8hbsn7lbeFE9ayNaBfzPbm+vSS8LK5cDuy4WlVvP1hoh2vssYUxji+m
	RqfSP5D97Bq9Km4Crl3XP0WOJgKotblXAWDNK8IyQRkHjHkInuLzLxAxVswruWwdHhAHITLg+yCRa
	1EJMDHDz/Ungd57TISZRP8ZK641AReiUmYOzerDUlfdZnVIbvoS9SZy/TTfL42cEf5Taw0b8g1b8T
	7+bw2Snf8MtEUKs+gaGE4Bc+f4vT1u5SVvO6dOQzKXWmk0Lq3TAeS6kSywTIw4k0wRO0ybRmRAIGM
	vFLWicCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQVy-0000000H0Es-03tr;
	Thu, 18 Jul 2024 12:45:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUQVv-0000000H0EK-1Azf
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 12:45:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3685a564bafso351173f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 05:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721306737; x=1721911537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLm16o1N99p/GKaWwoIJx5VDLlMHAuvKF6xQ0KJlwY8=;
        b=XZ5ahZ1dLfmZUxCVGD1Xk2MzvjkemMw3GMZ5Rd2yGg3fBf9NfFovjVVBPwlYzVXVVk
         uw6l4Ceqx2m/MauKh1xsM9OLhK3SMIh3c9sEV9KZRSpFc+zWQ/T8eEXYfTiKV8bu5JC3
         n00TG1BSp7eGyaZeG6EtBGfnPa/auff+bDz5LslI3L4lIllbu656bPhlD/AlNmh55NF7
         qabuUR1I096BUAcnoC9Igp7kwJz5P7yeT6LHyVrOM8o02SJn7Eo+G6QCo9dRX3wZUZaN
         4YAjvCTH5xs6UoATASjMkUprBSjrNxaal4VOkl7W6BEXV7ciuUZi7I5Kokjff9WTA7Vf
         gXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721306737; x=1721911537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qLm16o1N99p/GKaWwoIJx5VDLlMHAuvKF6xQ0KJlwY8=;
        b=weFkjhaLWEmiwu97KtIv39vE3qmwyknIeL5uUcc6OGVtpa0ZNicbZuJjxvOJhlqJQz
         jf1FSaFNMPw/5l+8hwH3B5d5ftZX2bkobV3ekU7sWYQGRzwRpJmRv34leLmEJih8iEJ/
         WtyO/iVRK4V4rm0i2XllY6EW7Zv6OJOhTpIs3qcUlPMWxS9P6qcROZc6+zebtdAaHTwF
         H0nMdjDLKGQ3T76sqTEdRPgWeXHNzSgG5K+2aiL/tUitIw1YziUlbVzD39+dIExjeh7L
         Mpl3ey5ZzKGeZx4p+OaUVW5pXvwnha0hb5lKUMDRmYhPb03VSxxKMdFPZcBrZnBBkDlE
         asQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8A73YpoByIz38mW5msFyNT3p3nXEHBcdm941piIsKTv+P2QCSA7av80hOGIRm4Vr3nBNRWsD1QLqyVyN8np59OLVRqRhgPEusELN7UgfDqj4=
X-Gm-Message-State: AOJu0Ywwf0wRhB6PaEWAuAlScgQfZSXBZxOXMSbCoWIU5cQ7N6BuKCI2
	m5TnhUhLKOo267EKPGhL0JPYKmiGkQKeE2OVh3RTn4PQgJqa52S7UwhSHV9kUr+YprV/UUVDaSL
	b
X-Google-Smtp-Source: AGHT+IE4aUFSBsSc/TGzH5LOwVpQObZ6rzvXnNXFvQA+sXRph7ULCgzYUUO4yfehrY88zvXYcAW8yw==
X-Received: by 2002:a5d:44ce:0:b0:368:5b2f:67b5 with SMTP id ffacd0b85a97d-3685b2f6c1fmr863619f8f.20.1721306736585;
        Thu, 18 Jul 2024 05:45:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6398:c95d:f83b:e9b1? ([2a01:e0a:982:cbb0:6398:c95d:f83b:e9b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3686659142asm506581f8f.25.2024.07.18.05.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 05:45:36 -0700 (PDT)
Message-ID: <2f094b21-aa55-4a81-b9af-ff06c34c5a67@linaro.org>
Date: Thu, 18 Jul 2024 14:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/9] reset: amlogic: convert driver to regmap
To: Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
 <20240718095755.3511992-2-jbrunet@baylibre.com>
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
In-Reply-To: <20240718095755.3511992-2-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_054539_369227_5E4393F8 
X-CRM114-Status: GOOD (  21.89  )
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

On 18/07/2024 11:57, Jerome Brunet wrote:
> To allow using the same driver for the main reset controller and the
> auxiliary ones embedded in the clock controllers, convert the
> the Amlogic reset driver to regmap.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
>   1 file changed, 44 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index f78be97898bc..8f3d6e9df235 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -11,36 +11,44 @@
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>   #include <linux/reset-controller.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
>   
> -#define BITS_PER_REG	32
> -
>   struct meson_reset_param {
>   	int reg_count;
>   	int level_offset;
>   };
>   
>   struct meson_reset {
> -	void __iomem *reg_base;
>   	const struct meson_reset_param *param;
>   	struct reset_controller_dev rcdev;
> -	spinlock_t lock;
> +	struct regmap *map;
>   };
>   
> +static void meson_reset_offset_and_bit(struct meson_reset *data,
> +				       unsigned long id,
> +				       unsigned int *offset,
> +				       unsigned int *bit)
> +{
> +	unsigned int stride = regmap_get_reg_stride(data->map);
> +
> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
> +	*bit = id % (stride * BITS_PER_BYTE);
> +}
> +
>   static int meson_reset_reset(struct reset_controller_dev *rcdev,
> -			      unsigned long id)
> +			     unsigned long id)
>   {
>   	struct meson_reset *data =
>   		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
> +	unsigned int offset, bit;
>   
> -	writel(BIT(offset), reg_addr);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>   
> -	return 0;
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), BIT(bit));

Here, you're converting a:
writel(BIT())
to a:
reg = readl()
reg |= BIT()
writel(reg)

so indeed you should use regmap_write(data->map, offset, BIT(bit))


>   }
>   
>   static int meson_reset_level(struct reset_controller_dev *rcdev,
> @@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>   {
>   	struct meson_reset *data =
>   		container_of(rcdev, struct meson_reset, rcdev);
> -	unsigned int bank = id / BITS_PER_REG;
> -	unsigned int offset = id % BITS_PER_REG;
> -	void __iomem *reg_addr;
> -	unsigned long flags;
> -	u32 reg;
> +	unsigned int offset, bit;
>   
> -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
> +	offset += data->param->level_offset;
>   
> -	spin_lock_irqsave(&data->lock, flags);
> -
> -	reg = readl(reg_addr);
> -	if (assert)
> -		writel(reg & ~BIT(offset), reg_addr);
> -	else
> -		writel(reg | BIT(offset), reg_addr);
> -
> -	spin_unlock_irqrestore(&data->lock, flags);
> -
> -	return 0;
> +	return regmap_update_bits(data->map, offset,
> +				  BIT(bit), assert ? 0 : BIT(bit));

This one if fine

>   }
>   
>   static int meson_reset_assert(struct reset_controller_dev *rcdev,
> @@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>   
> +static const struct regmap_config regmap_config = {
> +	.reg_bits   = 32,
> +	.val_bits   = 32,
> +	.reg_stride = 4,
> +};
> +
>   static int meson_reset_probe(struct platform_device *pdev)
>   {
> +	struct device *dev = &pdev->dev;
>   	struct meson_reset *data;
> +	void __iomem *base;
>   
> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>   	if (!data)
>   		return -ENOMEM;
>   
> -	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(data->reg_base))
> -		return PTR_ERR(data->reg_base);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
>   
> -	data->param = of_device_get_match_data(&pdev->dev);
> +	data->param = of_device_get_match_data(dev);
>   	if (!data->param)
>   		return -ENODEV;
>   
> -	spin_lock_init(&data->lock);
> +	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(data->map))
> +		return dev_err_probe(dev, PTR_ERR(data->map),
> +				     "can't init regmap mmio region\n");
>   
>   	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
> +	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
> +		* regmap_config.reg_stride;
>   	data->rcdev.ops = &meson_reset_ops;
> -	data->rcdev.of_node = pdev->dev.of_node;
> +	data->rcdev.of_node = dev->of_node;
>   
> -	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +	return devm_reset_controller_register(dev, &data->rcdev);
>   }
>   
>   static struct platform_driver meson_reset_driver = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
