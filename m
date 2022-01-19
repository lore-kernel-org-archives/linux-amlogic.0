Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC67C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l7n467HbM3T+0qjKURqTn6x1EkpR1J82WrKkyRaul6c=; b=ValZI1juYi96N7tK5XUSHcS9Jl
	uPETzVnpsfRwBHbmlUQqh3IgDCoCETRvxX20yhCXyyzBSBW3v8WU9eAkUFbKNvWSbdsQtmwKr8mA9
	3aEfaoNV1Ooo5FzoQQpQ4fT8YlnPzIumvBP/Y97UxM2+dMohjakaZI1mbpZDy6yEzL/3PTjbwqPBl
	7BgGUN0sG9yp/169x0TqpLCty+endbJwz6GF5I6Xb6KMbagCpUIgO3LIsp8wIMef7D+8JrGmi4+TX
	XwTzrXyJA9xk26pGjp/8YXiTa+2Mf51wT2j08UQstkS187UWWa9KI4moxe4+uBuIKAufrUEZYF3Au
	Zl+pa/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6iU-004Oqm-V6; Wed, 19 Jan 2022 08:53:18 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6iG-004Oju-IJ
 for linux-amlogic@lists.infradead.org; Wed, 19 Jan 2022 08:53:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c2so3844879wml.1
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Jan 2022 00:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=20v1qW8h1O5ten4wL7c3Va4icHS7gN2AsYBTibsl1ZQ=;
 b=GJ74SPI7hyP6NxRHhfOMYuYsl24Lngx/RB89jxq2D9HtNxZmAULhKzydShOrRI22Jj
 0FXNwp8WxB0wa+85U3NpcoRmiz6hkfcHS6ogaGb9JWRz/i4IHB+BiT57Avqxla3GQ9D4
 lqItNs5U6MBgzfGp4Jll2ET/48YG/P/56kKsVEFF55eJ1HlC0NT4jhFb+EmcEQOwKIvD
 JUcOo3hrvZYh+Tzzn9x38JW8ALKqBFDIdv71WJSwzp8+AkGBQMidR9nDX4wQ42fZ3qBH
 edEWEPc2NkBGI62UgHi/BR++88ej7t2yc6Gdh6u8gYlQG+ATEfy722k/1W1eMrbceOkl
 pe7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=20v1qW8h1O5ten4wL7c3Va4icHS7gN2AsYBTibsl1ZQ=;
 b=3Z4ISZ4BJtVtYS5FsGOs/wyHj+s5wJ+joKYkiUs3P6Lq9DwkbtqzB/ZoYxYI+Lq6XA
 ISIiXKk96xwKjVP9lJYW3Fed7Ug3WCCwF8MB2Tt5LgA759mBah2r73gJwKfui9AKGysr
 rQ4yFpi23PH77tCgqZOkUm753GvSIPqVefjYAmHX13K/qv02XIsPUyEGTwHMvm1HsSiX
 o+Y0F3SpyQ/8MKFxBUYImyu6+uLj1+iadx9lOh3RjtDpWeBDKiV+ZUtVJCEjmH3uhIpB
 0xM5/ib8F1dFcg/AFVYBHuEpp4AmnxRf0f7E9drz68Hxqra+dChlFZVsKNqQrDfLi3h/
 wbkw==
X-Gm-Message-State: AOAM533SHUtVFA+yBNpnP0RXDyHALDfwBCAI+gFsM99Apn2Jb2ecEJ/5
 xU1QN0FgkFosBdkVoLQe9NufZBQxQ/FHPw==
X-Google-Smtp-Source: ABdhPJxOLdJpvEytnYNXzk/+DefhvASC+EPLAZjxrPyNtVfZ70hnOUvUjKXS1V3OzzkoKL+SyCyDiA==
X-Received: by 2002:a1c:f413:: with SMTP id z19mr2376154wma.111.1642582382358; 
 Wed, 19 Jan 2022 00:53:02 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d394:97d0:bc02:3846?
 ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id h11sm4569696wmb.12.2022.01.19.00.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 00:53:01 -0800 (PST)
Subject: Re: [PATCH v2 2/4] irqchip/meson-gpio: support more than 8 channels
 gpio irq line
To: Qianggui Song <qianggui.song@amlogic.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20220119070809.15563-1-qianggui.song@amlogic.com>
 <20220119070809.15563-3-qianggui.song@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <4c6b7f6b-b9a2-c08d-7ac4-f5132808b1c5@baylibre.com>
Date: Wed, 19 Jan 2022 09:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220119070809.15563-3-qianggui.song@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_005304_619107_CA6B6343 
X-CRM114-Status: GOOD (  22.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/01/2022 08:08, Qianggui Song wrote:
> Current meson gpio irqchip driver only support 8 channels for gpio irq
> line, later chips may have more then 8 channels, so need to modify code
> to support more.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/irqchip/irq-meson-gpio.c | 33 +++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index d90ff0b92480..eefe15e1b3a6 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -16,7 +16,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  
> -#define NUM_CHANNEL 8
>  #define MAX_INPUT_MUX 256
>  
>  #define REG_EDGE_POL	0x00
> @@ -60,6 +59,7 @@ struct irq_ctl_ops {
>  
>  struct meson_gpio_irq_params {
>  	unsigned int nr_hwirq;
> +	unsigned int nr_channels;
>  	bool support_edge_both;
>  	unsigned int edge_both_offset;
>  	unsigned int edge_single_offset;
> @@ -81,6 +81,7 @@ struct meson_gpio_irq_params {
>  	.edge_single_offset = 0,				\
>  	.pol_low_offset = 16,					\
>  	.pin_sel_mask = 0xff,					\
> +	.nr_channels = 8,					\
>  
>  #define INIT_MESON_A1_COMMON_DATA(irqs)				\
>  	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
> @@ -90,6 +91,7 @@ struct meson_gpio_irq_params {
>  	.edge_single_offset = 8,				\
>  	.pol_low_offset = 0,					\
>  	.pin_sel_mask = 0x7f,					\
> +	.nr_channels = 8,					\
>  
>  static const struct meson_gpio_irq_params meson8_params = {
>  	INIT_MESON8_COMMON_DATA(134)
> @@ -136,8 +138,8 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
>  struct meson_gpio_irq_controller {
>  	const struct meson_gpio_irq_params *params;
>  	void __iomem *base;
> -	u32 channel_irqs[NUM_CHANNEL];
> -	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
> +	u32 *channel_irqs;
> +	unsigned long *channel_map;
>  	spinlock_t lock;
>  };
>  
> @@ -207,8 +209,8 @@ meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
>  	spin_lock_irqsave(&ctl->lock, flags);
>  
>  	/* Find a free channel */
> -	idx = find_first_zero_bit(ctl->channel_map, NUM_CHANNEL);
> -	if (idx >= NUM_CHANNEL) {
> +	idx = find_first_zero_bit(ctl->channel_map, ctl->params->nr_channels);
> +	if (idx >= ctl->params->nr_channels) {
>  		spin_unlock_irqrestore(&ctl->lock, flags);
>  		pr_err("No channel available\n");
>  		return -ENOSPC;
> @@ -447,13 +449,26 @@ static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_i
>  
>  	ctl->params = match->data;
>  
> +	ctl->channel_irqs = kcalloc(ctl->params->nr_channels, sizeof(*ctl->channel_irqs),
> +				    GFP_KERNEL);
> +	if (!ctl->channel_irqs)
> +		return -ENOMEM;
> +
> +	ctl->channel_map = bitmap_zalloc(ctl->params->nr_channels, GFP_KERNEL);
> +	if (!ctl->channel_map) {
> +		kfree(ctl->channel_irqs);
> +		return -ENOMEM;
> +	}
> +
>  	ret = of_property_read_variable_u32_array(node,
>  						  "amlogic,channel-interrupts",
>  						  ctl->channel_irqs,
> -						  NUM_CHANNEL,
> -						  NUM_CHANNEL);
> +						  ctl->params->nr_channels,
> +						  ctl->params->nr_channels);
>  	if (ret < 0) {
> -		pr_err("can't get %d channel interrupts\n", NUM_CHANNEL);
> +		pr_err("can't get %d channel interrupts\n", ctl->params->nr_channels);
> +		kfree(ctl->channel_map);
> +		kfree(ctl->channel_irqs);
>  		return ret;
>  	}
>  
> @@ -507,7 +522,7 @@ static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *
>  	}
>  
>  	pr_info("%d to %d gpio interrupt mux initialized\n",
> -		ctl->params->nr_hwirq, NUM_CHANNEL);
> +		ctl->params->nr_hwirq, ctl->params->nr_channels);
>  
>  	return 0;
>  
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
