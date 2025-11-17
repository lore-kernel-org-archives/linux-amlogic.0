Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B59CE8D6B
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Nov 2025 09:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A7ngoh2UaNWQGEDnPwZ5p0I9hA2c7axMG+jvz6CkXE=; b=JxITNE7YDJDSXSPhpZa9RhWBUe
	jV2w6Jx5ezS4jAu+JPSD8HQ43NbXCiZ8M+p1/XuAsolotQ3IcfgHEcjCZAFXvGX2dYzo2qzWOJ8QI
	DN7HQWrthA2YflMy2PeABTmpwK+iRda36d000VqShLbQphXwF8htQJtXaS/zavGMZf2VSwbAAZzoC
	Vi1grV+k6YykOxRMaz0s3KyrMjguXkNYTcsfoyRorMZJodJEWSi2Bs7OW9q2hjOxC7xD8wNkqdhyE
	fSlfCyUhz2LAE3p6rGrFZ45qjw/212mpUvQjWC2DBhZvRI2VcGJ4F0vDOffY3u5qjgC56ETFYBOl5
	TI2ZTUDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvEP-0000000FklX-355x;
	Mon, 17 Nov 2025 09:09:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvEN-0000000FkkU-3Ljv
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Nov 2025 09:09:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so2870219f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Nov 2025 01:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763370541; x=1763975341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j80cA3+lrwgAsnc0giKu1MemC628u6PWriEbYYP1hp0=;
        b=oRGOiS0C4P2UGcHUOHyLLvUDCrgUWTkWMIeiDaYaDpaEkO1jkfGHP0nlaQhpKDvv+f
         Po4pa8JQz1qlME6BEBiPOkbUuZtIUzDBkwYloZEaJmL/2vp5kY76FXt3p6MilCjunHOL
         kgRNJXSd4L5uSFGDLFQUKbrPtacRqHfyVlF2S4qoeu/p7hh/pzOR0C/03YAGRO5yNIXo
         eFlxFDvXzh4zsIWf/6mYgykhrSjdv/XehuvKRFZxDmvcQcOqH0jwjE+DdUnC3n9Boyq5
         +7THN4a5SJz1Dr2+o8mUt/wK+mPqNWzGlEspof7Ic2kk4hSha+hGG0z09VPraX4Z0iRw
         IPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370541; x=1763975341;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j80cA3+lrwgAsnc0giKu1MemC628u6PWriEbYYP1hp0=;
        b=vSHVRNxCipfx+2aGZDec9A5iMO9q20xoZMpcVGF5MAPD0eTCcXB1Xm9fjO/cyQJO3N
         AOS3mUKeXrmub4PQ3sSc50KK8bHOmZ5SbIhKTQofvVyayCJk22kiHuIJlbQwrY5PomWs
         hyCNlKWJTqWqoW73Kab7rUCZN6kHAiEATfOAhaqivSMcdO+iYvWbc/CLVdvZ70/iBqQF
         8jBdJ+QgtnbZ6NaLMfOOyoSfCpOb0EO8IC1B9ei2sKeqbtzqteuGdH2JGl83HH9JO0YC
         i6M0Cv3Xmzmd0WfeZ61yfZ2sSbCIpEUSvasehv5+XX5RXG3n+d6sA1UtLDzmiGROu4Yp
         r8pg==
X-Forwarded-Encrypted: i=1; AJvYcCXuQEqsV6G77RHgQBgAOBppDKttpZEfvwvG27AMRfgx/ZrEo3gCzO3VE+Rywv7R5fmZlVQsTtY85Uo5Oy7t@lists.infradead.org
X-Gm-Message-State: AOJu0YyYabfiWcZYnCx+QkezYZzHFF6uilf5DDee5brusNhxwLaaSLfV
	GFE6KahrRZZOnxb2EM/Mk4D9oibBxWGcTckInimc6XOSWnQTM0JOr3XvSIgfvc0anOY=
X-Gm-Gg: ASbGncsfgMnLKJCqinOps84jqLLaDvt/8wrMF2ydIFjLf5rYnd/cubHtmtgpw3Tr7WA
	efoDfiisC5k+E8beCtYtsUdPyWE+UAWXXn5vn8QqwYR7Vr/sLophYF4/wOHBn0VvYw6NF+BTPnG
	Tq0epbRXFmN65hxxWKjkaZTt3qFoela3PATk5P+m/rvpaPYUV8n7A4BGgIx+cwgo9YYpAOCjF3X
	Itr6MszJPfE4Csk8FWTYfHgaKdUwgIPmoYEGqtEtxrMRj/fPmSmNo3Mn4+HGcaPDQaJBz4wWATo
	tgAOw3262P//gjgnhIBuDLApxU00jTyYTrGKV/g1Vd8WSBdOl2TcFPFBRWGYg033+gia+gusvn4
	MGOmOZw1A7Q+KvZwiBNvZxd/wtY14YizQ/UGG62UrsxQ7RVQdCH/wWcPaE23LYT933YPR/kXKqr
	o79qDaIdjp7djKHzZbE0OJ6hBP8Ew4FUeRp7ZXlWhH8NnBIMd3jvQupK1EYokKvFc=
X-Google-Smtp-Source: AGHT+IEbamgDekUoI8tFnZIk+ynap255pwjgX7qHYaMDgfodxB1QA2SjR+XQIFkW6+XHOriFBT/Ehg==
X-Received: by 2002:a05:6000:230b:b0:429:d253:8619 with SMTP id ffacd0b85a97d-42b52795624mr14671949f8f.5.1763370541052;
        Mon, 17 Nov 2025 01:09:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d631:aa74:9313:e9f3? ([2a01:e0a:3d9:2080:d631:aa74:9313:e9f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b8a0sm25627416f8f.25.2025.11.17.01.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 01:09:00 -0800 (PST)
Message-ID: <2aef88d5-b9cb-4b2a-866e-f856e49c6b85@linaro.org>
Date: Mon, 17 Nov 2025 10:08:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/7] mmc: meson-mx-sdio: Switch to regmap for register
 access
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ulf.hansson@linaro.org
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
 <20251108231253.1641927-2-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108231253.1641927-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_010903_902439_874078B4 
X-CRM114-Status: GOOD (  23.33  )
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
> Switch the driver over to use regmap to access the registers. This makes
> it consistent with the other Amlogic MMC drivers. No functional changes
> intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/mmc/host/Kconfig         |   1 +
>   drivers/mmc/host/meson-mx-sdio.c | 125 ++++++++++++++++---------------
>   2 files changed, 64 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 2c963cb6724b..027ef2540913 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -504,6 +504,7 @@ config MMC_MESON_MX_SDIO
>   	depends on ARCH_MESON || COMPILE_TEST
>   	depends on COMMON_CLK
>   	depends on OF_ADDRESS
> +	select REGMAP_MMIO
>   	help
>   	  This selects support for the SD/MMC Host Controller on
>   	  Amlogic Meson6, Meson8 and Meson8b SoCs.
> diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
> index 8a49c32fd3f9..2448f21bd683 100644
> --- a/drivers/mmc/host/meson-mx-sdio.c
> +++ b/drivers/mmc/host/meson-mx-sdio.c
> @@ -19,6 +19,7 @@
>   #include <linux/ioport.h>
>   #include <linux/platform_device.h>
>   #include <linux/of_platform.h>
> +#include <linux/regmap.h>
>   #include <linux/timer.h>
>   #include <linux/types.h>
>   
> @@ -108,7 +109,7 @@ struct meson_mx_mmc_host {
>   	struct clk_fixed_factor		fixed_factor;
>   	struct clk			*fixed_factor_clk;
>   
> -	void __iomem			*base;
> +	struct regmap			*regmap;
>   	int				irq;
>   	spinlock_t			irq_lock;
>   
> @@ -122,22 +123,10 @@ struct meson_mx_mmc_host {
>   	int				error;
>   };
>   
> -static void meson_mx_mmc_mask_bits(struct mmc_host *mmc, char reg, u32 mask,
> -				   u32 val)
> -{
> -	struct meson_mx_mmc_host *host = mmc_priv(mmc);
> -	u32 regval;
> -
> -	regval = readl(host->base + reg);
> -	regval &= ~mask;
> -	regval |= (val & mask);
> -
> -	writel(regval, host->base + reg);
> -}
> -
>   static void meson_mx_mmc_soft_reset(struct meson_mx_mmc_host *host)
>   {
> -	writel(MESON_MX_SDIO_IRQC_SOFT_RESET, host->base + MESON_MX_SDIO_IRQC);
> +	regmap_write(host->regmap, MESON_MX_SDIO_IRQC,
> +		     MESON_MX_SDIO_IRQC_SOFT_RESET);
>   	udelay(2);
>   }
>   
> @@ -158,7 +147,7 @@ static void meson_mx_mmc_start_cmd(struct mmc_host *mmc,
>   	struct meson_mx_mmc_host *host = mmc_priv(mmc);
>   	unsigned int pack_size;
>   	unsigned long irqflags, timeout;
> -	u32 mult, send = 0, ext = 0;
> +	u32 send = 0, ext = 0;
>   
>   	host->cmd = cmd;
>   
> @@ -215,25 +204,22 @@ static void meson_mx_mmc_start_cmd(struct mmc_host *mmc,
>   
>   	spin_lock_irqsave(&host->irq_lock, irqflags);
>   
> -	mult = readl(host->base + MESON_MX_SDIO_MULT);
> -	mult &= ~MESON_MX_SDIO_MULT_PORT_SEL_MASK;
> -	mult |= FIELD_PREP(MESON_MX_SDIO_MULT_PORT_SEL_MASK, host->slot_id);
> -	mult |= BIT(31);
> -	writel(mult, host->base + MESON_MX_SDIO_MULT);
> +	regmap_update_bits(host->regmap, MESON_MX_SDIO_MULT,
> +			   MESON_MX_SDIO_MULT_PORT_SEL_MASK | BIT(31),
> +			   FIELD_PREP(MESON_MX_SDIO_MULT_PORT_SEL_MASK,
> +				      host->slot_id) | BIT(31));
>   
>   	/* enable the CMD done interrupt */
> -	meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_IRQC,
> -			       MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN,
> -			       MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
> +	regmap_set_bits(host->regmap, MESON_MX_SDIO_IRQC,
> +			MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
>   
>   	/* clear pending interrupts */
> -	meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_IRQS,
> -			       MESON_MX_SDIO_IRQS_CMD_INT,
> -			       MESON_MX_SDIO_IRQS_CMD_INT);
> +	regmap_set_bits(host->regmap, MESON_MX_SDIO_IRQS,
> +			MESON_MX_SDIO_IRQS_CMD_INT);
>   
> -	writel(cmd->arg, host->base + MESON_MX_SDIO_ARGU);
> -	writel(ext, host->base + MESON_MX_SDIO_EXT);
> -	writel(send, host->base + MESON_MX_SDIO_SEND);
> +	regmap_write(host->regmap, MESON_MX_SDIO_ARGU, cmd->arg);
> +	regmap_write(host->regmap, MESON_MX_SDIO_EXT, ext);
> +	regmap_write(host->regmap, MESON_MX_SDIO_SEND, send);
>   
>   	spin_unlock_irqrestore(&host->irq_lock, irqflags);
>   
> @@ -263,14 +249,13 @@ static void meson_mx_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>   
>   	switch (ios->bus_width) {
>   	case MMC_BUS_WIDTH_1:
> -		meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_CONF,
> -				       MESON_MX_SDIO_CONF_BUS_WIDTH, 0);
> +		regmap_clear_bits(host->regmap, MESON_MX_SDIO_CONF,
> +				  MESON_MX_SDIO_CONF_BUS_WIDTH);
>   		break;
>   
>   	case MMC_BUS_WIDTH_4:
> -		meson_mx_mmc_mask_bits(mmc, MESON_MX_SDIO_CONF,
> -				       MESON_MX_SDIO_CONF_BUS_WIDTH,
> -				       MESON_MX_SDIO_CONF_BUS_WIDTH);
> +		regmap_set_bits(host->regmap, MESON_MX_SDIO_CONF,
> +				MESON_MX_SDIO_CONF_BUS_WIDTH);
>   		break;
>   
>   	case MMC_BUS_WIDTH_8:
> @@ -351,8 +336,8 @@ static void meson_mx_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>   	host->mrq = mrq;
>   
>   	if (mrq->data)
> -		writel(sg_dma_address(mrq->data->sg),
> -		       host->base + MESON_MX_SDIO_ADDR);
> +		regmap_write(host->regmap, MESON_MX_SDIO_ADDR,
> +			     sg_dma_address(mrq->data->sg));
>   
>   	if (mrq->sbc)
>   		meson_mx_mmc_start_cmd(mmc, mrq->sbc);
> @@ -364,24 +349,26 @@ static void meson_mx_mmc_read_response(struct mmc_host *mmc,
>   				       struct mmc_command *cmd)
>   {
>   	struct meson_mx_mmc_host *host = mmc_priv(mmc);
> -	u32 mult;
> -	int i, resp[4];
> +	unsigned int i, resp[4];
>   
> -	mult = readl(host->base + MESON_MX_SDIO_MULT);
> -	mult |= MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX;
> -	mult &= ~MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK;
> -	mult |= FIELD_PREP(MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK, 0);
> -	writel(mult, host->base + MESON_MX_SDIO_MULT);
> +	regmap_update_bits(host->regmap, MESON_MX_SDIO_MULT,
> +			   MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX |
> +			   MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK,
> +			   MESON_MX_SDIO_MULT_WR_RD_OUT_INDEX |
> +			   FIELD_PREP(MESON_MX_SDIO_MULT_RESP_READ_INDEX_MASK,
> +				      0));
>   
>   	if (cmd->flags & MMC_RSP_136) {
>   		for (i = 0; i <= 3; i++)
> -			resp[3 - i] = readl(host->base + MESON_MX_SDIO_ARGU);
> +			regmap_read(host->regmap, MESON_MX_SDIO_ARGU,
> +				    &resp[3 - i]);
> +
>   		cmd->resp[0] = (resp[0] << 8) | ((resp[1] >> 24) & 0xff);
>   		cmd->resp[1] = (resp[1] << 8) | ((resp[2] >> 24) & 0xff);
>   		cmd->resp[2] = (resp[2] << 8) | ((resp[3] >> 24) & 0xff);
>   		cmd->resp[3] = (resp[3] << 8);
>   	} else if (cmd->flags & MMC_RSP_PRESENT) {
> -		cmd->resp[0] = readl(host->base + MESON_MX_SDIO_ARGU);
> +		regmap_read(host->regmap, MESON_MX_SDIO_ARGU, &cmd->resp[0]);
>   	}
>   }
>   
> @@ -422,8 +409,8 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
>   
>   	spin_lock(&host->irq_lock);
>   
> -	irqs = readl(host->base + MESON_MX_SDIO_IRQS);
> -	send = readl(host->base + MESON_MX_SDIO_SEND);
> +	regmap_read(host->regmap, MESON_MX_SDIO_IRQS, &irqs);
> +	regmap_read(host->regmap, MESON_MX_SDIO_SEND, &send);
>   
>   	if (irqs & MESON_MX_SDIO_IRQS_CMD_INT)
>   		ret = meson_mx_mmc_process_cmd_irq(host, irqs, send);
> @@ -431,7 +418,7 @@ static irqreturn_t meson_mx_mmc_irq(int irq, void *data)
>   		ret = IRQ_HANDLED;
>   
>   	/* finally ACK all pending interrupts */
> -	writel(irqs, host->base + MESON_MX_SDIO_IRQS);
> +	regmap_write(host->regmap, MESON_MX_SDIO_IRQS, irqs);
>   
>   	spin_unlock(&host->irq_lock);
>   
> @@ -470,14 +457,13 @@ static void meson_mx_mmc_timeout(struct timer_list *t)
>   	struct meson_mx_mmc_host *host = timer_container_of(host, t,
>   							    cmd_timeout);
>   	unsigned long irqflags;
> -	u32 irqc;
> +	u32 irqs, argu;
>   
>   	spin_lock_irqsave(&host->irq_lock, irqflags);
>   
>   	/* disable the CMD interrupt */
> -	irqc = readl(host->base + MESON_MX_SDIO_IRQC);
> -	irqc &= ~MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN;
> -	writel(irqc, host->base + MESON_MX_SDIO_IRQC);
> +	regmap_clear_bits(host->regmap, MESON_MX_SDIO_IRQC,
> +			  MESON_MX_SDIO_IRQC_ARC_CMD_INT_EN);
>   
>   	spin_unlock_irqrestore(&host->irq_lock, irqflags);
>   
> @@ -488,10 +474,12 @@ static void meson_mx_mmc_timeout(struct timer_list *t)
>   	if (!host->cmd)
>   		return;
>   
> +	regmap_read(host->regmap, MESON_MX_SDIO_IRQS, &irqs);
> +	regmap_read(host->regmap, MESON_MX_SDIO_ARGU, &argu);
> +
>   	dev_dbg(mmc_dev(host->mmc),
>   		"Timeout on CMD%u (IRQS = 0x%08x, ARGU = 0x%08x)\n",
> -		host->cmd->opcode, readl(host->base + MESON_MX_SDIO_IRQS),
> -		readl(host->base + MESON_MX_SDIO_ARGU));
> +		host->cmd->opcode, irqs, argu);
>   
>   	host->cmd->error = -ETIMEDOUT;
>   
> @@ -578,7 +566,8 @@ static int meson_mx_mmc_add_host(struct meson_mx_mmc_host *host)
>   	return 0;
>   }
>   
> -static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
> +static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host,
> +				      void __iomem *base)
>   {
>   	struct clk_init_data init;
>   	const char *clk_div_parent, *clk_fixed_factor_parent;
> @@ -613,7 +602,7 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
>   	init.flags = CLK_SET_RATE_PARENT;
>   	init.parent_names = &clk_div_parent;
>   	init.num_parents = 1;
> -	host->cfg_div.reg = host->base + MESON_MX_SDIO_CONF;
> +	host->cfg_div.reg = base + MESON_MX_SDIO_CONF;
>   	host->cfg_div.shift = MESON_MX_SDIO_CONF_CMD_CLK_DIV_SHIFT;
>   	host->cfg_div.width = MESON_MX_SDIO_CONF_CMD_CLK_DIV_WIDTH;
>   	host->cfg_div.hw.init = &init;
> @@ -629,12 +618,23 @@ static int meson_mx_mmc_register_clks(struct meson_mx_mmc_host *host)
>   
>   static int meson_mx_mmc_probe(struct platform_device *pdev)
>   {
> +	const struct regmap_config meson_mx_sdio_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 32,
> +		.reg_stride = 4,
> +		.max_register = MESON_MX_SDIO_EXT,
> +	};
>   	struct platform_device *slot_pdev;
>   	struct mmc_host *mmc;
>   	struct meson_mx_mmc_host *host;
> +	void __iomem *base;
>   	int ret, irq;
>   	u32 conf;
>   
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
>   	slot_pdev = meson_mx_mmc_slot_pdev(&pdev->dev);
>   	if (!slot_pdev)
>   		return -ENODEV;
> @@ -656,9 +656,10 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, host);
>   
> -	host->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(host->base)) {
> -		ret = PTR_ERR(host->base);
> +	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +					     &meson_mx_sdio_regmap_config);
> +	if (IS_ERR(host->regmap)) {
> +		ret = PTR_ERR(host->regmap);
>   		goto error_free_mmc;
>   	}
>   
> @@ -687,7 +688,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   		goto error_free_mmc;
>   	}
>   
> -	ret = meson_mx_mmc_register_clks(host);
> +	ret = meson_mx_mmc_register_clks(host, base);
>   	if (ret)
>   		goto error_free_mmc;
>   
> @@ -708,7 +709,7 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
>   	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_M_ENDIAN_MASK, 0x3);
>   	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_WRITE_NWR_MASK, 0x2);
>   	conf |= FIELD_PREP(MESON_MX_SDIO_CONF_WRITE_CRC_OK_STATUS_MASK, 0x2);
> -	writel(conf, host->base + MESON_MX_SDIO_CONF);
> +	regmap_write(host->regmap, MESON_MX_SDIO_CONF, conf);
>   
>   	meson_mx_mmc_soft_reset(host);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
