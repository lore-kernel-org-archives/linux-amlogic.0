Return-Path: <SRS0=jD7o=Z4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A03C2BBE2
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 13:14:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C98D2464E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Dec 2019 13:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cjmXy1R4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C98D2464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:From:Date:
	MIME-Version:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5fTYoroGh/C2BhV8HTPhsXleIMk2WC2zeZxioMvH3hg=; b=cjmXy1R4bLNLyBYopJGhS8yj6
	Hgo7XyYftO+HZTKCrAkhXZjEe+yRXtuNmbNbrrpP2gwmaVcmw4ZIkoaBn89TsMz3zW4mnQh43Fw2F
	/xySxshKZpkSPnBozo3kUTUF06BkDBWnWdBp8J1kvdg7k3rCSouhiUe9W0SXMu1ewi0YW2SonQLJW
	90qsjllCRVDCpdNiPrY0HmoIQ0ZqGKj2k93sQRiBcMlEvcWzkDYYC/f4zaPtRv9wTgkQ7LQ1zf86u
	/Q4gy2q8W7SAzhiWnXMhvZB8TTy+xWnavCX9DcuyBobqe3XNzrTa4Bd/3qQUrySIOH8kyiku04k9s
	RRLYxHzTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idDQt-0004Jm-5Y; Fri, 06 Dec 2019 13:14:07 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idDQj-0004B2-Ev; Fri, 06 Dec 2019 13:13:59 +0000
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
 (envelope-from <maz@kernel.org>)
 id 1idDQc-0003C4-G3; Fri, 06 Dec 2019 14:13:50 +0100
To: Qianggui Song <qianggui.song@amlogic.com>
Subject: Re: [PATCH 2/4] irqchip/meson-gpio: rework meson irqchip driver to
 support meson-A1 SoCs
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Date: Fri, 06 Dec 2019 13:13:50 +0000
From: Marc Zyngier <maz@kernel.org>
In-Reply-To: <20191206121714.14579-3-qianggui.song@amlogic.com>
References: <20191206121714.14579-1-qianggui.song@amlogic.com>
 <20191206121714.14579-3-qianggui.song@amlogic.com>
Message-ID: <542e3e819e584d6e433d2c4276c3b379@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: qianggui.song@amlogic.com, tglx@linutronix.de,
 jason@lakedaemon.net, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, jianxin.pan@amlogic.com, xingyu.chen@amlogic.com,
 hanjie.lin@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_051357_650100_6B46100E 
X-CRM114-Status: GOOD (  18.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Hanjie Lin <hanjie.lin@amlogic.com>, Jason Cooper <jason@lakedaemon.net>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2019-12-06 12:17, Qianggui Song wrote:
> Since Meson-A1 Socs register layout of gpio interrupt controller have
> difference with previous chips, registers to decide irq line and 
> offset
> of trigger method are all changed, the current driver should be 
> modified.
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/irqchip/irq-meson-gpio.c | 79 
> ++++++++++++++++++++++++--------
>  1 file changed, 60 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/irqchip/irq-meson-gpio.c
> b/drivers/irqchip/irq-meson-gpio.c
> index 829084b568fa..1824ffc30de2 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -30,44 +30,74 @@
>   * stuck at 0. Bits 8 to 15 are responsive and have the expected
>   * effect.
>   */
> -#define REG_EDGE_POL_EDGE(x)	BIT(x)
> -#define REG_EDGE_POL_LOW(x)	BIT(16 + (x))
> -#define REG_BOTH_EDGE(x)	BIT(8 + (x))
> -#define REG_EDGE_POL_MASK(x)    (	\
> -		REG_EDGE_POL_EDGE(x) |	\
> -		REG_EDGE_POL_LOW(x)  |	\
> -		REG_BOTH_EDGE(x))
> +#define REG_EDGE_POL_EDGE(params, 
> x)	BIT((params)->edge_single_offset + (x))
> +#define REG_EDGE_POL_LOW(params, x)	BIT((params)->pol_low_offset + 
> (x))
> +#define REG_BOTH_EDGE(params, x)	BIT((params)->edge_both_offset + 
> (x))
> +#define REG_EDGE_POL_MASK(params, x)    (	\
> +		REG_EDGE_POL_EDGE(params, x) |	\
> +		REG_EDGE_POL_LOW(params, x)  |	\
> +		REG_BOTH_EDGE(params, x))
>  #define REG_PIN_SEL_SHIFT(x)	(((x) % 4) * 8)
>  #define REG_FILTER_SEL_SHIFT(x)	((x) * 4)
>
> +#define INIT_MESON8_COMMON_DATA					\
> +	.edge_single_offset = 0,				\
> +	.pol_low_offset = 16,					\
> +	.pin_sel_mask = 0xff,					\
> +	.ops = {						\
> +		.gpio_irq_sel_pin = meson8_gpio_irq_sel_pin,	\
> +	},

Please place the #defines that operate on the various data structures
*after* the definition of the structures. It would greatly help
reading the changes.

> +
> +struct meson_gpio_irq_controller;
> +static void meson8_gpio_irq_sel_pin(struct meson_gpio_irq_controller 
> *ctl,
> +				    unsigned int channel, unsigned long hwirq);
> +struct irq_ctl_ops {
> +	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
> +					 unsigned int channel,
> +					 unsigned long hwirq);
> +	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
> +};
> +
>  struct meson_gpio_irq_params {
>  	unsigned int nr_hwirq;
>  	bool support_edge_both;
> +	unsigned int edge_both_offset;
> +	unsigned int edge_single_offset;
> +	unsigned int pol_low_offset;
> +	unsigned int pin_sel_mask;
> +	struct irq_ctl_ops ops;
>  };
>
>  static const struct meson_gpio_irq_params meson8_params = {
>  	.nr_hwirq = 134,
> +	INIT_MESON8_COMMON_DATA
>  };
>
>  static const struct meson_gpio_irq_params meson8b_params = {
>  	.nr_hwirq = 119,
> +	INIT_MESON8_COMMON_DATA
>  };
>
>  static const struct meson_gpio_irq_params gxbb_params = {
>  	.nr_hwirq = 133,
> +	INIT_MESON8_COMMON_DATA
>  };
>
>  static const struct meson_gpio_irq_params gxl_params = {
>  	.nr_hwirq = 110,
> +	INIT_MESON8_COMMON_DATA
>  };
>
>  static const struct meson_gpio_irq_params axg_params = {
>  	.nr_hwirq = 100,
> +	INIT_MESON8_COMMON_DATA
>  };
>
>  static const struct meson_gpio_irq_params sm1_params = {
>  	.nr_hwirq = 100,
>  	.support_edge_both = true,
> +	.edge_both_offset = 8,
> +	INIT_MESON8_COMMON_DATA
>  };

OK, this isn't great. The least you could do is to make
your initializer parametric, so that it takes the nr_hwirq as
a parameter.

Then, any additional member that overrides common behaviour
should come after the main initializer.

Also, do you need 'support_edge_both'? Isn't a non-zero
'edge_both_offset' enough to detect the feature?

>
>  static const struct of_device_id meson_irq_gpio_matches[] = {
> @@ -100,9 +130,18 @@ static void meson_gpio_irq_update_bits(struct
> meson_gpio_irq_controller *ctl,
>  	writel_relaxed(tmp, ctl->base + reg);
>  }
>
> -static unsigned int meson_gpio_irq_channel_to_reg(unsigned int 
> channel)
> +static void meson8_gpio_irq_sel_pin(struct meson_gpio_irq_controller 
> *ctl,
> +				    unsigned int channel, unsigned long hwirq)
>  {
> -	return (channel < 4) ? REG_PIN_03_SEL : REG_PIN_47_SEL;
> +	unsigned int reg_offset;
> +	unsigned int bit_offset;
> +
> +	reg_offset = (channel < 4) ? REG_PIN_03_SEL : REG_PIN_47_SEL;
> +	bit_offset = REG_PIN_SEL_SHIFT(channel);
> +
> +	meson_gpio_irq_update_bits(ctl, reg_offset,
> +				   ctl->params->pin_sel_mask << bit_offset,
> +				   hwirq << bit_offset);
>  }
>
>  static int
> @@ -110,7 +149,7 @@ meson_gpio_irq_request_channel(struct
> meson_gpio_irq_controller *ctl,
>  			       unsigned long  hwirq,
>  			       u32 **channel_hwirq)
>  {
> -	unsigned int reg, idx;
> +	unsigned int idx;
>
>  	spin_lock(&ctl->lock);
>
> @@ -129,10 +168,7 @@ meson_gpio_irq_request_channel(struct
> meson_gpio_irq_controller *ctl,
>  	 * Setup the mux of the channel to route the signal of the pad
>  	 * to the appropriate input of the GIC
>  	 */
> -	reg = meson_gpio_irq_channel_to_reg(idx);
> -	meson_gpio_irq_update_bits(ctl, reg,
> -				   0xff << REG_PIN_SEL_SHIFT(idx),
> -				   hwirq << REG_PIN_SEL_SHIFT(idx));
> +	ctl->params->ops.gpio_irq_sel_pin(ctl, idx, hwirq);
>
>  	/*
>  	 * Get the hwirq number assigned to this channel through
> @@ -173,7 +209,9 @@ static int meson_gpio_irq_type_setup(struct
> meson_gpio_irq_controller *ctl,
>  {
>  	u32 val = 0;
>  	unsigned int idx;
> +	const struct meson_gpio_irq_params *params;
>
> +	params = ctl->params;
>  	idx = meson_gpio_irq_get_channel_idx(ctl, channel_hwirq);
>
>  	/*
> @@ -190,22 +228,22 @@ static int meson_gpio_irq_type_setup(struct
> meson_gpio_irq_controller *ctl,
>  	 * precedence over the other edge/polarity settings
>  	 */
>  	if (type == IRQ_TYPE_EDGE_BOTH) {
> -		if (!ctl->params->support_edge_both)
> +		if (!params->support_edge_both)
>  			return -EINVAL;
>
> -		val |= REG_BOTH_EDGE(idx);
> +		val |= REG_BOTH_EDGE(params, idx);
>  	} else {
>  		if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
> -			val |= REG_EDGE_POL_EDGE(idx);
> +			val |= REG_EDGE_POL_EDGE(params, idx);
>
>  		if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
> -			val |= REG_EDGE_POL_LOW(idx);
> +			val |= REG_EDGE_POL_LOW(params, idx);
>  	}
>
>  	spin_lock(&ctl->lock);
>
>  	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
> -				   REG_EDGE_POL_MASK(idx), val);
> +				   REG_EDGE_POL_MASK(params, idx), val);
>
>  	spin_unlock(&ctl->lock);
>
> @@ -371,6 +409,9 @@ static int __init meson_gpio_irq_parse_dt(struct
> device_node *node,
>  		return ret;
>  	}
>
> +	if (ctl->params->ops.gpio_irq_init)
> +		ctl->params->ops.gpio_irq_init(ctl);

It would make sense to provide a dummy init() method, since
you have all the infrastructure already.

> +
>  	return 0;
>  }

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
