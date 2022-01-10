Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504BAC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3b7GDe56wbpmNb8L3xR048ydJosLXdfYVs1ufFUBlc=; b=coCurBOo507ONOTa+laAhoM+y4
	FM+gZd8mxOzO6DPFXNDH8Ut0z1dwqJfCQKiuJm97ZZkYb+qONAUML/a/4kDN6fEs4HwO1inZzDJHV
	UApl15vVrDVmezG8yi8lcTN5dxvaKArIyIuN+SVQmF14qUHMi6HaQS0kYpc6MgNHFB9tw5e2qxygE
	iHa1EWoGUcs6J2SCR0NlOkRC4KSSlZkV98zRLH2yjspvLxux1wuhfCHF3cmi1pqwEGNYlgHlfqcA2
	VT2v9gNrqmMdFWjfOU4dA+8TE/Wzz1iDjHmN7voF60e12z39W+p25Ur+ENQGsohe3OTq0/9YI07rF
	4/I3vrfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tlX-00BLsj-PB; Mon, 10 Jan 2022 12:27:11 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tlV-00BLrQ-9V; Mon, 10 Jan 2022 12:27:10 +0000
Received: from [10.28.39.18] (10.28.39.18) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 10 Jan
 2022 20:27:07 +0800
Subject: Re: [PATCH 3/4] irqchip/meson-gpio: add select trigger type callback
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
 <20220108084218.31877-4-qianggui.song@amlogic.com>
 <87sftytsk4.wl-maz@kernel.org>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <0525de06-03b0-2321-5131-eb2710e5935c@amlogic.com>
Date: Mon, 10 Jan 2022 20:28:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87sftytsk4.wl-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.28.39.18]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_042709_371891_AE7332D3 
X-CRM114-Status: GOOD (  17.35  )
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



On 1/8/22 6:44 PM, Marc Zyngier wrote:
> 
> On Sat, 08 Jan 2022 08:42:17 +0000,
> Qianggui Song <qianggui.song@amlogic.com> wrote:
>>
>> Due to some chips may use different registers and offset, provide
>> a set trigger type call back.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>   drivers/irqchip/irq-meson-gpio.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
>> index 6a7b4fb13452..98419428fcbd 100644
>> --- a/drivers/irqchip/irq-meson-gpio.c
>> +++ b/drivers/irqchip/irq-meson-gpio.c
>> @@ -55,6 +55,8 @@ struct irq_ctl_ops {
>>   	void (*gpio_irq_sel_pin)(struct meson_gpio_irq_controller *ctl,
>>   				 unsigned int channel, unsigned long hwirq);
>>   	void (*gpio_irq_init)(struct meson_gpio_irq_controller *ctl);
>> +	unsigned int (*gpio_irq_sel_type)(struct meson_gpio_irq_controller *ctl,
>> +					  unsigned int idx, u32 val);
>>   };
>>   
>>   struct meson_gpio_irq_params {
>> @@ -68,16 +70,17 @@ struct meson_gpio_irq_params {
>>   	struct irq_ctl_ops ops;
>>   };
>>   
>> -#define INIT_MESON_COMMON(irqs, init, sel)			\
>> +#define INIT_MESON_COMMON(irqs, init, sel, type)		\
>>   	.nr_hwirq = irqs,					\
>>   	.ops = {						\
>>   		.gpio_irq_init = init,				\
>>   		.gpio_irq_sel_pin = sel,			\
>> +		.gpio_irq_sel_type = type,			\
>>   	},
>>   
>>   #define INIT_MESON8_COMMON_DATA(irqs)				\
>>   	INIT_MESON_COMMON(irqs, meson_gpio_irq_init_dummy,	\
>> -			  meson8_gpio_irq_sel_pin)		\
>> +			  meson8_gpio_irq_sel_pin, NULL)	\
>>   	.edge_single_offset = 0,				\
>>   	.pol_low_offset = 16,					\
>>   	.pin_sel_mask = 0xff,					\
>> @@ -85,7 +88,7 @@ struct meson_gpio_irq_params {
>>   
>>   #define INIT_MESON_A1_COMMON_DATA(irqs)				\
>>   	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
>> -			  meson_a1_gpio_irq_sel_pin)		\
>> +			  meson_a1_gpio_irq_sel_pin, NULL)	\
>>   	.support_edge_both = true,				\
>>   	.edge_both_offset = 16,					\
>>   	.edge_single_offset = 8,				\
>> @@ -279,6 +282,10 @@ static int meson_gpio_irq_type_setup(struct meson_gpio_irq_controller *ctl,
>>   	 */
>>   	type &= IRQ_TYPE_SENSE_MASK;
>>   
>> +	/* Some controllers may have different calculation method*/
>> +	if (params->ops.gpio_irq_sel_type)
>> +		return params->ops.gpio_irq_sel_type(ctl, idx, type);
>> +
> 
> No. If you are going to indirect these things, indirect them for all
> implementations and keep the code clean.
Okay, I' ll try to implement a new macro
> 
> 	M.
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
