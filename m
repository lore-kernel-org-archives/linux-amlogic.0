Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1A1CE8D6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNhoTffv3VjPh5+hgYurXE/jVfMB1cONnRKblgIuRPw=; b=RggsQms3fLJ+DIauXsDGKY0uXs
	YmVWV0dE0pw8N/INpnm7ddF0AZvm1ZzZU5n5jVq7WDvwRQC52JUgFiVaUOAGWmJbsOf37325dNP3j
	CnmQ16xPUUerNWwpiN19IlMKTidVQH6fDGsr1iLzLAqrGZbjsXJwqRqyS0b6XW0Uy92xh33SmOAWY
	U9hg8ZrvoHriurCqhKjmmsOgoSXN8dSzs/BEl8AWPuovtRtx0IfnNJJwlK6WxOygyaalPnzXWn9rl
	LYWLIXpqwjHzq3FL03wXIi6sU7y2JSCu4aO6ACmBwssyoTDMyFp7zbssEuusttZf0mRFsJd7ODDGs
	MpuLd5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvFj-0000000Fl5x-3VoM;
	Mon, 17 Nov 2025 09:10:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvFg-0000000Fl4e-2Lyo
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 09:10:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so11288095e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 01:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370623; x=1763975423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLxVKWIHglxfb8tAgDDKVJo+NTOcB5a0GO0w4pJQiPw=;
        b=Pvitl7JLy5hxAy5ns/AbbhqtNTO5eZIE6HSjHRlgDnR5fc0RVglv3cc04ADGH6Ivtv
         UtxTO+cV2AcKwjLJrXTP/1JMYlDrPsJHGXJDRnc3Hr/fl4CBO21J7CiJOzl80W1dOA2u
         3T33GKzvho0WfiAQwjNEos6XsNaFlJpCVBkudOLPs1onhi9V6WRq/g7PKVHtBdp8oH5d
         1nE6tN+v0W69Kurv2LBWDIP6Ff2brj0qAS9EOdydNirwpj2JlcfuSL34r7KjwdBowZF3
         gpCraAGfhjyE8Mu+XIoaAth5pBSkE/ps/VskErDi2qWenKUgS8cYUIo5nw1E/3kqBjbj
         3DEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370623; x=1763975423;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLxVKWIHglxfb8tAgDDKVJo+NTOcB5a0GO0w4pJQiPw=;
        b=A/TfrC16KOeKVlOQDiCAP4f+JgLfLVsBBKkAZbDAYaXAI4U9Vu8Vcy9Qfqhx8ZI3c3
         8fBrZGVy7dBuiHxhF3LmKtlem8fbGRrTDI/yU4BCA2QRq2LaHUE7mb6ERyiNJvhqNVy8
         1CpuHorXHsdqG9Cuwh8mNoKZklaSNEtOa9n2m52WYhVQxq8S6jU+XIpLoVs0XJhi8Ohg
         AJ3QVnojiRJfZx+HBmPlJa4ahZeuxFG/TW08k6YUhuhsAia6gxX12yInyexPDR+1sve7
         7Y14fYveaXtxFxk3DhtYdyi9MUUzaMpnF/TLHYAR8yjGJQXE2UX+tC0Ofesdf6FrySq5
         DuIw==
X-Forwarded-Encrypted: i=1; AJvYcCVt3mnex18xabW9OJf95Qz+5iT3x/mEpu8XhRI2fbOvkpYrYJqqecTJp0Ibe/je6lt10h3lXPg6qsB1RMDz@lists.infradead.org
X-Gm-Message-State: AOJu0YydkyLdJ2jOZ9qPBZa2VMeR89tXgIBRhGcqCxH9MUSwC8Xy/T/6
	0xIDreH+uRM4e31XtSHy0pHchWf2mi2LEZFquNfBiLwg/S0P4hDSMbOYfpfLoFFFbyI=
X-Gm-Gg: ASbGncuJihviEfbtLiHObpZZEwK/inoJIazj9eee1CPQE0TG8ypkUbrmALNePrH9rSe
	CCp3HnS3fHTz7R+UbivwhTYI6wbvCX+58f+TJyxMxK2xMG01wC6sozGujWaxK1O4N9TfLrbR7IV
	JuSIwODP5IWPkpZ3RvHeD1cRr1Ovsx6joYAxYs6JIWyDyrUogHhSX25g1ZjaRjvngWmojTOlCjM
	p+mHjkgJxga8YmUJRJDLnu7KJXvIjjTeMNz+eWdziQfnmA6lZKn5MkFeaFUH+GJWpCslDMk/VPl
	X/25ZcCFibksBulVe7pxSNg6vRoLR4bmdbGostfeYV+jw/AhdvoK2FNH5lHqzToQXSkt+nHhv4V
	31KEEzb+5jvap88yhUWx/xQsFQW/fVqi7VXEEI1TuehyklfKfbWQ0TbCoYCPcWUCw5k2g2L1WIF
	AuNDjN8m7O0HezCy72cFq/TiWb1grY7NVCfsaPbUwbQ8RNK85+XEeLljmWhaTnJck=
X-Google-Smtp-Source: AGHT+IHzs/FH8zMsIZdeSQnHXZamtDjuZgE7t4GyT8+Rzh1vO8S/OVrjZ8A59XksMNfjALKbiojoHg==
X-Received: by 2002:a05:600c:8b4c:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-4778fe67aeamr107158895e9.10.1763370622473;
        Mon, 17 Nov 2025 01:10:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bd27ad5sm106977585e9.16.2025.11.17.01.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:10:22 -0800 (PST)
Message-ID: <47aadf0e-f59c-47de-8c7c-78571c83017a@linaro.org>
Date: Mon, 17 Nov 2025 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 3/7] mmc: meson-mx-sdio: Refactor internal clock
 initialization
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-4-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_011024_666827_C1FA0927 
X-CRM114-Status: GOOD (  23.82  )
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

On 11/9/25 00:12, Martin Blumenstingl wrote:
> Use modern common clock framework helpers for simplifying the clock
> controller management:
> - switch to struct clk_hw for internal clocks and only get the
>    "cfg_div_clk" (which has to be managed at runtime) as struct clk
>    using devm_clk_hw_get_clk() which is then the only clock used by
>    struct meson_mx_mmc_host.
> - use CLK_HW_INIT_FW_NAME and CLK_HW_INIT_HW helper macros for simpler
>    init data initialization
> - keep the clock controller memory allocation separate to prevent a
>    potential use-after-free because struct meson_mx_mmc_host_clkc is
>    free'd before controller_dev
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/meson-mx-sdio.c | 119 ++++++++++++++++---------------
>   1 file changed, 61 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 1159cc911359..ce1828d915da 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -99,15 +99,15 @@
>   #define MESON_MX_SDIO_RESPONSE_CRC16_BITS			(16 - 1)
>   #define MESON_MX_SDIO_MAX_SLOTS					3
>   
> +struct meson_mx_mmc_host_clkc {
> +	struct clk_divider		cfg_div;
> +	struct clk_fixed_factor		fixed_div2;
> +};
> +
>   struct meson_mx_mmc_host {
>   	struct device			*controller_dev;
>   
> -	struct clk			*parent_clk;
> -	struct clk_divider		cfg_div;
>   	struct clk			*cfg_div_clk;
> -	struct clk_fixed_factor		fixed_factor;
> -	struct clk			*fixed_factor_clk;
> -
>   	struct regmap			*regmap;
>   	int				irq;
>   	spinlock_t			irq_lock;
> @@ -548,8 +548,7 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>   
>   	/* Get the min and max supported clock rates */
>   	mmc->f_min = clk_round_rate(host->cfg_div_clk, 1);
> -	mmc->f_max = clk_round_rate(host->cfg_div_clk,
> -				    clk_get_rate(host->parent_clk));
> +	mmc->f_max = clk_round_rate(host->cfg_div_clk, ULONG_MAX);
>   
>   	mmc->caps |= MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY;
>   	mmc->ops = &meson_mx_mmc_ops;
> @@ -565,54 +564,62 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>   	return 0;
>   }
>   
> -static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host,
> -				      void __iomem *base)
> +static struct clk *meson_mx_mmc_register_clk(struct device *dev,
> +					     void __iomem *base)
>   {
> -	struct clk_init_data init;
> -	const char *clk_div_parent, *clk_fixed_factor_parent;
> -
> -	clk_fixed_factor_parent = __clk_get_name(host->parent_clk);
> -	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
> -				   "%s#fixed_factor",
> -				   dev_name(host->controller_dev));
> -	if (!init.name)
> -		return -ENOMEM;
> +	const char *fixed_div2_name, *cfg_div_name;
> +	struct meson_mx_mmc_host_clkc *host_clkc;
> +	struct clk *clk;
> +	int ret;
>   
> -	init.ops = &clk_fixed_factor_ops;
> -	init.flags = 0;
> -	init.parent_names = &clk_fixed_factor_parent;
> -	init.num_parents = 1;
> -	host->fixed_factor.div = 2;
> -	host->fixed_factor.mult = 1;
> -	host->fixed_factor.hw.init = &init;
> -
> -	host->fixed_factor_clk = devm_clk_register(host->controller_dev,
> -						 &host->fixed_factor.hw);
> -	if (WARN_ON(IS_ERR(host->fixed_factor_clk)))
> -		return PTR_ERR(host->fixed_factor_clk);
> -
> -	clk_div_parent = __clk_get_name(host->fixed_factor_clk);
> -	init.name = devm_kasprintf(host->controller_dev, GFP_KERNEL,
> -				   "%s#div", dev_name(host->controller_dev));
> -	if (!init.name)
> -		return -ENOMEM;
> +	/* use a dedicated memory allocation for the clock controller to
> +	 * prevent use-after-free as meson_mx_mmc_host is free'd before
> +	 * dev (controller dev, not mmc_host->dev) is free'd.
> +	 */
> +	host_clkc = devm_kzalloc(dev, sizeof(*host_clkc), GFP_KERNEL);
> +	if (!host_clkc)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fixed_div2_name = devm_kasprintf(dev, GFP_KERNEL, "%s#fixed_div2",
> +					 dev_name(dev));
> +	if (!fixed_div2_name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	host_clkc->fixed_div2.div = 2;
> +	host_clkc->fixed_div2.mult = 1;
> +	host_clkc->fixed_div2.hw.init = CLK_HW_INIT_FW_NAME(fixed_div2_name,
> +							    "clkin",
> +							    &clk_fixed_factor_ops,
> +							    0);
> +	ret = devm_clk_hw_register(dev, &host_clkc->fixed_div2.hw);
> +	if (ret)
> +		return dev_err_ptr_probe(dev, ret,
> +					 "Failed to register %s clock\n",
> +					 fixed_div2_name);
> +
> +	cfg_div_name = devm_kasprintf(dev, GFP_KERNEL, "%s#div", dev_name(dev));
> +	if (!cfg_div_name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	host_clkc->cfg_div.reg = base + MESON_MX_SDIO_CONF;
> +	host_clkc->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
> +	host_clkc->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
> +	host_clkc->cfg_div.hw.init = CLK_HW_INIT_HW(cfg_div_name,
> +						    &host_clkc->fixed_div2.hw,
> +						    &clk_divider_ops,
> +						    CLK_DIVIDER_ALLOW_ZERO);
> +	ret = devm_clk_hw_register(dev, &host_clkc->cfg_div.hw);
> +	if (ret)
> +		return dev_err_ptr_probe(dev, ret,
> +					 "Failed to register %s clock\n",
> +					 cfg_div_name);
>   
> -	init.ops = &clk_divider_ops;
> -	init.flags = CLK_SET_RATE_PARENT;
> -	init.parent_names = &clk_div_parent;
> -	init.num_parents = 1;
> -	host->cfg_div.reg = base + MESON_MX_SDIO_CONF;
> -	host->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
> -	host->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
> -	host->cfg_div.hw.init = &init;
> -	host->cfg_div.flags = CLK_DIVIDER_ALLOW_ZERO;
> -
> -	host->cfg_div_clk = devm_clk_register(host->controller_dev,
> -					      &host->cfg_div.hw);
> -	if (WARN_ON(IS_ERR(host->cfg_div_clk)))
> -		return PTR_ERR(host->cfg_div_clk);
> +	clk = devm_clk_hw_get_clk(dev, &host_clkc->cfg_div.hw, "cfg_div_clk");
> +	if (IS_ERR(clk))
> +		return dev_err_ptr_probe(dev, PTR_ERR(clk),
> +					 "Failed to get the cfg_div clock\n");
>   
> -	return 0;
> +	return clk;
>   }
>   
>   static int meson_mx_mmc_probe(struct platform_device *pdev)
> @@ -682,16 +689,12 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   		goto error_free_mmc;
>   	}
>   
> -	host->parent_clk = devm_clk_get(host->controller_dev, "clkin");
> -	if (IS_ERR(host->parent_clk)) {
> -		ret = PTR_ERR(host->parent_clk);
> +	host->cfg_div_clk = meson_mx_mmc_register_clk(&pdev->dev, base);
> +	if (IS_ERR(host->cfg_div_clk)) {
> +		ret = PTR_ERR(host->cfg_div_clk);
>   		goto error_free_mmc;
>   	}
>   
> -	ret = meson_mx_mmc_register_clks(host, base);
> -	if (ret)
> -		goto error_free_mmc;
> -
>   	ret = clk_prepare_enable(host->cfg_div_clk);
>   	if (ret) {
>   		dev_err(host->controller_dev, "Failed to enable MMC clock\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
