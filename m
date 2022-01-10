Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D532EC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRYyW+AaipsyeWylggLs411DVzgxPtlkRNiNIMFa72E=; b=A03r837GZWtOsve7JTZctf86Me
	5SYOLZ0Fp9eyIvArwNjlwQayvwsF9TfSrrY83bITSl81pnWhmuJ8DDvGPdyvDDFvn2p1KPUZOnVKd
	cGS3qxr2/ZulGhV0nIVsQciCzpdtkTuUZVtGvzCYb0308PbUuTfB1ESU8vyksKuxSUQdWJ6FWukUP
	v75vTfBQkXf0UzFG2V09aXhQlFNm+0THa69qfQt/zUfdzr2RB72Ymg4HvkNffxTUIpepYqKYqzTjj
	OYtwzCMEDNBAkmmgv3tBn+eVTSk6wB99fkSMccCts4+GQAfNNI/23IRpsA8OCX/RrQd6HVrMSp9Kh
	ttW/s+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tpo-00BN0t-L0; Mon, 10 Jan 2022 12:31:36 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tpl-00BMzF-1m; Mon, 10 Jan 2022 12:31:34 +0000
Received: from [10.28.39.18] (10.28.39.18) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 10 Jan
 2022 20:31:31 +0800
Subject: Re: [PATCH 4/4] irqchip/meson-gpio: Add support for meson s4 SoCs
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
 <20220108084218.31877-5-qianggui.song@amlogic.com>
 <87r19itrjx.wl-maz@kernel.org>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <835a3f28-ec6a-9cd2-d574-5ef87b630fb3@amlogic.com>
Date: Mon, 10 Jan 2022 20:32:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87r19itrjx.wl-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.28.39.18]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_043133_137172_484635D6 
X-CRM114-Status: GOOD (  26.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 1/8/22 7:06 PM, Marc Zyngier wrote:
> 
> On Sat, 08 Jan 2022 08:42:18 +0000,
> Qianggui Song <qianggui.song@amlogic.com> wrote:
>>
>> The meson s4 SoCs support 12 gpio irq lines compared with previous
>> serial chips and have something different, details are as below.
>>
>> IRQ Number:
>> - 80:68 13 pins on bank Z
>> - 67:48 20 pins on bank X
>> - 47:36 12 pins on bank H
>> - 35:24 12 pins on bank D
>> - 23:22 2  pins on bank E
>> - 21:14 8  pins on bank C
>> - 13:0  13 pins on bank B
>>
>> - PADCTRL_GPIO_IRQ_CTRL0
>>    bit[31]:    enable/disable the whole irq lines
> 
> s/the whole/all the/
Okay
> 
>>    bit[12-23]: single edge trigger
>>    bit[0-11]:  poll trigger
>>
>> - PADCTRL_GPIO_IRQ_CTRL[X]
>> - bit[0-16]: 7 bits to chooge gpio source for irq line 2*[X] - 2
> 
> choose?
yes it is choose
> 
>> - bit[16-22]:7 bits to chooge gpio source for irq line 2*[X] - 1
>>    where X = 1-6
>>
>> - PADCTRL_GPIO_IRQ_CTRL[7]
>>    bit[0-11]: both edge trigger
> 
> This information would fit better in the code than in the commit
> message.
> 
will copy this to code.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>   drivers/irqchip/irq-meson-gpio.c | 51 ++++++++++++++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
>> index 98419428fcbd..c5d20a866c37 100644
>> --- a/drivers/irqchip/irq-meson-gpio.c
>> +++ b/drivers/irqchip/irq-meson-gpio.c
>> @@ -42,6 +42,11 @@
>>   #define REG_PIN_SEL_SHIFT(x)	(((x) % 4) * 8)
>>   #define REG_FILTER_SEL_SHIFT(x)	((x) * 4)
>>   
>> +/* use for s4 chips */
> 
> s/use/Used/
okay
> 
>> +#define REG_EDGE_POL_S4	0x1c
>> +#define REG_EDGE_POL_MASK_S4(x)				\
>> +	({typeof(x) _x = (x); BIT(_x) | BIT(12 + (_x)); })
> 
> Why on Earth should this macro handle multiple types?
If I use  #define REG_EDGE_POL_MASK_S4(x) (BIT(x) | BIT(12 + (x)), when
run git format-patch -1 --stdout | ./script/checkpath.pl --strict -,
will get a message
CHECK: Macro argument reuse 'x' - possible side-effects?

> 
>> +
>>   struct meson_gpio_irq_controller;
>>   static void meson8_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
>>   				    unsigned int channel, unsigned long hwirq);
>> @@ -50,6 +55,9 @@ static void meson_a1_gpio_irq_sel_pin(struct meson_gpio_irq_controller *ctl,
>>   				      unsigned int channel,
>>   				      unsigned long hwirq);
>>   static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl);
>> +static unsigned int
>> +meson_s4_gpio_irq_sel_type(struct meson_gpio_irq_controller *ctl,
>> +			   unsigned int idx, u32 val);
>>   
>>   struct irq_ctl_ops {
>>   	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
>> @@ -96,6 +104,17 @@ struct meson_gpio_irq_params {
>>   	.pin_sel_mask = 0x7f,					\
>>   	.channel_num = 8,					\
>>   
>> +#define INIT_MESON_S4_COMMON_DATA(irqs)                         \
>> +	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,         \
>> +			  meson_a1_gpio_irq_sel_pin,            \
>> +			  meson_s4_gpio_irq_sel_type)           \
>> +	.support_edge_both = true,				\
>> +	.edge_both_offset = 0,					\
>> +	.edge_single_offset = 12,				\
>> +	.pol_low_offset = 0,					\
>> +	.pin_sel_mask = 0xff,					\
>> +	.channel_num = 12,					\
>> +
>>   static const struct meson_gpio_irq_params meson8_params = {
>>   	INIT_MESON8_COMMON_DATA(134)
>>   };
>> @@ -126,6 +145,10 @@ static const struct meson_gpio_irq_params a1_params = {
>>   	INIT_MESON_A1_COMMON_DATA(62)
>>   };
>>   
>> +static const struct meson_gpio_irq_params s4_params = {
>> +	INIT_MESON_S4_COMMON_DATA(82)
>> +};
>> +
>>   static const struct of_device_id meson_irq_gpio_matches[] = {
>>   	{ .compatible = "amlogic,meson8-gpio-intc", .data = &meson8_params },
>>   	{ .compatible = "amlogic,meson8b-gpio-intc", .data = &meson8b_params },
>> @@ -135,6 +158,7 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
>>   	{ .compatible = "amlogic,meson-g12a-gpio-intc", .data = &axg_params },
>>   	{ .compatible = "amlogic,meson-sm1-gpio-intc", .data = &sm1_params },
>>   	{ .compatible = "amlogic,meson-a1-gpio-intc", .data = &a1_params },
>> +	{ .compatible = "amlogic,meson-s4-gpio-intc", .data = &s4_params },
>>   	{ }
>>   };
>>   
>> @@ -202,6 +226,33 @@ static void meson_a1_gpio_irq_init(struct meson_gpio_irq_controller *ctl)
>>   	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL, BIT(31), BIT(31));
>>   }
>>   
>> +static unsigned int
>> +meson_s4_gpio_irq_sel_type(struct meson_gpio_irq_controller *ctl,
>> +			   unsigned int idx, unsigned int type)
> 
> An 'unsigned int' return type, directly returned by a caller that
> has 'int' as its return type. What could possibly go wrong?

will modify this next patch
> 
>> +{
>> +	unsigned int val = 0;
>> +
>> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4, BIT(0 + (idx)), 0);
> 
> Drop the 0 + as well as the useless bracketing all over this function.
> 
Okay
>> +
>> +	if (type == IRQ_TYPE_EDGE_BOTH) {
>> +		val |= BIT(ctl->params->edge_both_offset + (idx));
>> +		meson_gpio_irq_update_bits(ctl, REG_EDGE_POL_S4,
>> +					   BIT(ctl->params->edge_both_offset + (idx)), val);
>> +		return 0;
>> +	}
>> +
>> +	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_EDGE_FALLING))
>> +		val |= BIT(ctl->params->pol_low_offset + (idx));
>> +
>> +	if (type & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING))
>> +		val |= BIT(ctl->params->edge_single_offset  + (idx));
>> +
>> +	meson_gpio_irq_update_bits(ctl, REG_EDGE_POL,
>> +				   REG_EDGE_POL_MASK_S4(idx), val);
>> +
>> +	return 0;
>> +};
>> +
>>   static int
>>   meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
>>   			       unsigned long  hwirq,
> 
> 	M.
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
