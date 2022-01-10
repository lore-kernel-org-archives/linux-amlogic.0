Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEF8C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 12:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0HWX2vBAF4YmP/GfvOy0pThADRAumGftFLEOBcYHEE=; b=UR05He3V4G0hVYBlHSXQQ4gjPY
	7bYBMfgs9vXl+WMX8+jphzcpXSF6Uy4DAFqa6vCThjrf+h0OMdX8KXJ6gXMNsoR1c5w37OJqWEjgf
	+qqOWdeXtJZzLF6tLdpujEtlIEtBpF3Xy65NL4jGxvdAg9FuL9VVhZiSN3Pvg8aNX3bhcpLN3offk
	fWS42YLi+vCGKe0M0TEtPPgX+0UtLnr5hx/lJr3+WtzCJoKK59qiWkdByqHQGNpEhnRLv7fumFqKO
	75JbvmPYi8gB33zglENL9MO9Q1/3fNoTFbUaJzCt26jpAuKCNOpCvGWPNsvvvSph3Bz8gQO1vAAfE
	laQZZ2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tkg-00BLec-6k; Mon, 10 Jan 2022 12:26:18 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tkd-00BLdL-84; Mon, 10 Jan 2022 12:26:16 +0000
Received: from [10.28.39.18] (10.28.39.18) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 10 Jan
 2022 20:26:10 +0800
Subject: Re: [PATCH 2/4] irqchip/meson-gpio: support more than 8 channels gpio
 irq line
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
 <20220108084218.31877-3-qianggui.song@amlogic.com>
 <87tueetsvz.wl-maz@kernel.org>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <3235dfc6-413c-7582-8204-2ac8ad0952d4@amlogic.com>
Date: Mon, 10 Jan 2022 20:27:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87tueetsvz.wl-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.28.39.18]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_042615_349608_970FCFEA 
X-CRM114-Status: GOOD (  22.00  )
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



On 1/8/22 6:37 PM, Marc Zyngier wrote:
> 
> On Sat, 08 Jan 2022 08:42:16 +0000,
> Qianggui Song <qianggui.song@amlogic.com> wrote:
>>
>> Current meson gpio irqchip driver only support 8 channels for gpio irq
>> line, later chips may have more then 8 channels, so need to modify code
>> to support more.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>   drivers/irqchip/irq-meson-gpio.c | 33 +++++++++++++++++++++++---------
>>   1 file changed, 24 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
>> index d90ff0b92480..6a7b4fb13452 100644
>> --- a/drivers/irqchip/irq-meson-gpio.c
>> +++ b/drivers/irqchip/irq-meson-gpio.c
>> @@ -16,7 +16,6 @@
>>   #include <linux/of.h>
>>   #include <linux/of_address.h>
>>   
>> -#define NUM_CHANNEL 8
>>   #define MAX_INPUT_MUX 256
>>   
>>   #define REG_EDGE_POL	0x00
>> @@ -60,6 +59,7 @@ struct irq_ctl_ops {
>>   
>>   struct meson_gpio_irq_params {
>>   	unsigned int nr_hwirq;
>> +	unsigned int channel_num;
> 
> For consistency, please name this nr_channels.
Okay
> 
>>   	bool support_edge_both;
>>   	unsigned int edge_both_offset;
>>   	unsigned int edge_single_offset;
>> @@ -81,6 +81,7 @@ struct meson_gpio_irq_params {
>>   	.edge_single_offset = 0,				\
>>   	.pol_low_offset = 16,					\
>>   	.pin_sel_mask = 0xff,					\
>> +	.channel_num = 8,					\
>>   
>>   #define INIT_MESON_A1_COMMON_DATA(irqs)				\
>>   	INIT_MESON_COMMON(irqs, meson_a1_gpio_irq_init,		\
>> @@ -90,6 +91,7 @@ struct meson_gpio_irq_params {
>>   	.edge_single_offset = 8,				\
>>   	.pol_low_offset = 0,					\
>>   	.pin_sel_mask = 0x7f,					\
>> +	.channel_num = 8,					\
>>   
>>   static const struct meson_gpio_irq_params meson8_params = {
>>   	INIT_MESON8_COMMON_DATA(134)
>> @@ -136,8 +138,9 @@ static const struct of_device_id meson_irq_gpio_matches[] = {
>>   struct meson_gpio_irq_controller {
>>   	const struct meson_gpio_irq_params *params;
>>   	void __iomem *base;
>> -	u32 channel_irqs[NUM_CHANNEL];
>> -	DECLARE_BITMAP(channel_map, NUM_CHANNEL);
>> +	u32 *channel_irqs;
>> +	unsigned long *channel_map;
>> +	u8 channel_num;
> 
> Same thing. Though this is completely superfluous, see below.
I will remove this variable
> 
>>   	spinlock_t lock;
>>   };
>>   
>> @@ -207,8 +210,8 @@ meson_gpio_irq_request_channel(struct meson_gpio_irq_controller *ctl,
>>   	spin_lock_irqsave(&ctl->lock, flags);
>>   
>>   	/* Find a free channel */
>> -	idx = find_first_zero_bit(ctl->channel_map, NUM_CHANNEL);
>> -	if (idx >= NUM_CHANNEL) {
>> +	idx = find_first_zero_bit(ctl->channel_map, ctl->channel_num);
>> +	if (idx >= ctl->channel_num) {
>>   		spin_unlock_irqrestore(&ctl->lock, flags);
>>   		pr_err("No channel available\n");
>>   		return -ENOSPC;
>> @@ -447,13 +450,25 @@ static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_i
>>   
>>   	ctl->params = match->data;
>>   
>> +	ctl->channel_num = ctl->params->channel_num;
> 
> Since you already have a pointer to params, why do you need to
> duplicate this information?
will remove it next patch
> 
>> +	ctl->channel_irqs = kcalloc(ctl->channel_num,
>> +				    sizeof(*ctl->channel_irqs), GFP_KERNEL);
>> +	if (!ctl->channel_irqs)
>> +		return -ENOMEM;
>> +
>> +	ctl->channel_map = bitmap_zalloc(ctl->params->channel_num, GFP_KERNEL);
>> +	if (!ctl->channel_map) {
>> +		kfree(ctl->channel_irqs);
>> +		return -ENOMEM;
>> +	}
>> +
>>   	ret = of_property_read_variable_u32_array(node,
>>   						  "amlogic,channel-interrupts",
>>   						  ctl->channel_irqs,
>> -						  NUM_CHANNEL,
>> -						  NUM_CHANNEL);
>> +						  ctl->channel_num,
>> +						  ctl->channel_num);
>>   	if (ret < 0) {
>> -		pr_err("can't get %d channel interrupts\n", NUM_CHANNEL);
>> +		pr_err("can't get %d channel interrupts\n", ctl->channel_num);
>>   		return ret;
> 
> You are now leaking the bitmap and channel_map allocations.
will fix it next patch
> 
> 	M.
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
