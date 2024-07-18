Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94CEC3DA49
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ONpHS7kcAYC2Xwb5C/gUQN7zTind5wfdJ5AmEa3YOEA=; b=bqcBwXnPBwwS6m
	htZD6dwxaAf9rSFrou82bylf9CN27ISmp6L+Todkq2piQ+6FCkRdNngKQwOvlzUcIjkZqQrz2eFmD
	2uN8fesVjaJv8OBsvWUNUkzsu4CoEXkGyE4TZC+zKYKiUjr3TT2bW+RvQ4RYAa6HJChLdDaQS2fvy
	YBJYbfj9LNwcbRWsqV44V0x+4+02Ll4XdFcRsfgHDGgXQu1veCPBgaeGHyzGHKes6FdMqxmF1i2ez
	WvEwFeTOqcyFR0CrVOS5A6lFqT1773Nb/2dqhNJX3ZvDead9tFGb1B4pYLddbRR81AdA+AN0Rsi2+
	ft+8WfT7MQ3Nc1RywHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULQA-0000000G91T-2Alg;
	Thu, 18 Jul 2024 07:19:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sULQ7-0000000G90v-1MqW
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 07:19:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-368526b1333so136113f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721287157; x=1721891957; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ldXwhYdLjCB5OhXChmN89rx5JEnqOucYXmRIj6SqA3k=;
        b=zvim0+bmXPCOt8pI1/I7wf/NdqaM2F8dVv0TNMvI74+dxwAIEJqJNV/YpsrQMANPyW
         1+c0wHzJrlhbk3CHPCgu8c1I8xgyXCWD8blSgj7NNzaJRFZM+RMuXRJHlLrSiUykSyvZ
         9ybvKoS8i1hpmSvE+K74bwK6yDH+DzyZr4uRKwph/GQ6b1GImvwxggJEkbFeAnAHKl2C
         zSE4Na4Jgl3PEla3TAcsAl4hHBqBFQNN2FW5VGMuupnMpiXb0xXG3BxbemyHw/Oq5BWN
         wUH5fhSJUYMF2vbMqRbHbr/JqVyJYF841c1AF7rKsoXEOdMBUUCd80rfaxncVHOlLNYR
         l4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721287157; x=1721891957;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldXwhYdLjCB5OhXChmN89rx5JEnqOucYXmRIj6SqA3k=;
        b=NqzLWsIPvkCo75EcAJbzck1M7voi/SgcUomFXabLQUttSO4aTmuXKZQ+R1nThE1BLd
         usGoZWLr543dWaU9vV6+EiUHZgoXMLCMwhyrzA8R7xmPK0ynWqgSblGxUm1imzTYKniR
         dxDVQDo8/8T7YvAz5LGyazGb8BesxkjFPtl3Kc1ztw4I4iQW43l5jXDYRw4HGlqccbK9
         lDYb7TY/MUH6e9w/UB1Lt502TAL+EAvgA6NKGDWn1hS8BD91wuSQ+boATTNeCz9uyrrj
         e4yyUoKXHFMXCGlB71u4l9OqxFB65UTg/M5NaB7MOtys19fNPYW3ppkZ/dEQMQv7TjVD
         pgAg==
X-Forwarded-Encrypted: i=1; AJvYcCVGEBx7JnBySCu7i4qfZMnb3zqfxLs1uQpRa+ZG93ahNZlMGNaA9dTnIAo6Un6t7E11Pa0N69OVzp01KgfXZMav0PDkkxjD8k56UNDW8fL2eas=
X-Gm-Message-State: AOJu0YwMwlIgm/FTmwq4YK0QQ41Tv1n0ZgGGCx8EgAnNSiR+s2cGgMiu
	/hRTPdBEqPATbPkUyOA/EwGgjwYJI2gpaTDBjDt7UKkI3DEN6niPTVlU+fmSmHY=
X-Google-Smtp-Source: AGHT+IHVrdI8ylyGTNYquZxonkwTNks5h1wMUjxX60+yWD44He7AmkFO/vKibReY6DPwE49s7q12fQ==
X-Received: by 2002:a5d:554e:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-3684b378956mr1134875f8f.1.1721287157244;
        Thu, 18 Jul 2024 00:19:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c7792c99sm23110455e9.3.2024.07.18.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 00:19:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 1/8] reset: amlogic: convert driver to regmap
In-Reply-To: <b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com> (Jan
	Dakinevich's message of "Thu, 18 Jul 2024 05:39:39 +0300")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-2-jbrunet@baylibre.com>
	<b12ac6b2-cb46-4410-9846-86ed4c3aea1f@salutedevices.com>
Date: Thu, 18 Jul 2024 09:19:16 +0200
Message-ID: <1jv813makr.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_001919_394503_2D155046 
X-CRM114-Status: GOOD (  24.28  )
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

On Thu 18 Jul 2024 at 05:39, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 7/10/24 19:25, Jerome Brunet wrote:
>> To allow using the same driver for the main reset controller and the
>> auxiliary ones embedded in the clock controllers, convert the
>> the Amlogic reset driver to regmap.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 80 ++++++++++++++++++++-----------------
>>  1 file changed, 44 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index f78be97898bc..8f3d6e9df235 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -11,36 +11,44 @@
>>  #include <linux/of.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>  #include <linux/reset-controller.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>>  
>> -#define BITS_PER_REG	32
>> -
>>  struct meson_reset_param {
>>  	int reg_count;
>>  	int level_offset;
>>  };
>>  
>>  struct meson_reset {
>> -	void __iomem *reg_base;
>>  	const struct meson_reset_param *param;
>>  	struct reset_controller_dev rcdev;
>> -	spinlock_t lock;
>> +	struct regmap *map;
>>  };
>>  
>> +static void meson_reset_offset_and_bit(struct meson_reset *data,
>> +				       unsigned long id,
>> +				       unsigned int *offset,
>> +				       unsigned int *bit)
>> +{
>> +	unsigned int stride = regmap_get_reg_stride(data->map);
>> +
>> +	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
>> +	*bit = id % (stride * BITS_PER_BYTE);
>> +}
>> +
>>  static int meson_reset_reset(struct reset_controller_dev *rcdev,
>> -			      unsigned long id)
>> +			     unsigned long id)
>>  {
>>  	struct meson_reset *data =
>>  		container_of(rcdev, struct meson_reset, rcdev);
>> -	unsigned int bank = id / BITS_PER_REG;
>> -	unsigned int offset = id % BITS_PER_REG;
>> -	void __iomem *reg_addr = data->reg_base + (bank << 2);
>> +	unsigned int offset, bit;
>>  
>> -	writel(BIT(offset), reg_addr);
>> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>>  
>> -	return 0;
>> +	return regmap_update_bits(data->map, offset,
>> +				  BIT(bit), BIT(bit));
>
> regmap_update_bits() is not equal to writel(), I suppose regmap_write()
> should be here.
>
> I'm still under testing, but I see unexpected behavior on A1 SoC:
>
> [    1.482446] Call trace:
> [    1.484860]  dump_backtrace+0x94/0xec
> [    1.488482]  show_stack+0x18/0x24
> [    1.491754]  dump_stack_lvl+0x78/0x90
> [    1.495377]  dump_stack+0x18/0x24
> [    1.498654]  __report_bad_irq+0x38/0xe4
> [    1.502453]  note_interrupt+0x324/0x374
> [    1.506244]  handle_irq_event+0x9c/0xac
> [    1.510039]  handle_fasteoi_irq+0xa4/0x238
> [    1.514093]  generic_handle_domain_irq+0x2c/0x44
> [    1.518664]  gic_handle_irq+0x40/0xc4
> [    1.522287]  call_on_irq_stack+0x24/0x4c
> [    1.526168]  do_interrupt_handler+0x80/0x84
> [    1.530308]  el1_interrupt+0x34/0x68
> [    1.533844]  el1h_64_irq_handler+0x18/0x24
> [    1.537898]  el1h_64_irq+0x64/0x68
> [    1.541262]  default_idle_call+0x28/0x3c
> [    1.545143]  do_idle+0x208/0x260
> [    1.548334]  cpu_startup_entry+0x38/0x3c
> [    1.552220]  kernel_init+0x0/0x1dc
> [    1.555579]  start_kernel+0x5ac/0x6f0
> [    1.559206]  __primary_switched+0x80/0x88

That stack trace is not helping

>
>
> and using of regmap_write() (apparently) fixes it.

Nor does that conclusion.

It is perfectly possible I have made mistake somewhere (I have already
fixed one in v2), but sending incomplete report like this, with
unargumented conclusion is just noise in the end.

No, there is no situation in which `regmap_write` would solve a problem
with `regmap_update_bits`.

Either send a full analysis of the problem you found, if you did one, or
at least send the full dump, explaining that you don't know what is
happening.

I'll also point that I did not send g12 clock along with v1 and that a1
support is not upstream or even reviewed. So this 'tests' obviously rely
on an integration of v1, rfc and your custom develpment. That is hardly a
reference at this point.

This patches address g12 and sm1. If you want to contribute with tests,
please test on these platforms. a1 will be addressed in due time.

Testing is good but making complete report (trace and environment
details) is equally important, especially for maintainers who might not
be following Amlogic development as much as you do.

>
>>  }
>>  
>>  static int meson_reset_level(struct reset_controller_dev *rcdev,
>> @@ -48,25 +56,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
>>  {
>>  	struct meson_reset *data =
>>  		container_of(rcdev, struct meson_reset, rcdev);
>> -	unsigned int bank = id / BITS_PER_REG;
>> -	unsigned int offset = id % BITS_PER_REG;
>> -	void __iomem *reg_addr;
>> -	unsigned long flags;
>> -	u32 reg;
>> +	unsigned int offset, bit;
>>  
>> -	reg_addr = data->reg_base + data->param->level_offset + (bank << 2);
>> +	meson_reset_offset_and_bit(data, id, &offset, &bit);
>> +	offset += data->param->level_offset;
>>  
>> -	spin_lock_irqsave(&data->lock, flags);
>> -
>> -	reg = readl(reg_addr);
>> -	if (assert)
>> -		writel(reg & ~BIT(offset), reg_addr);
>> -	else
>> -		writel(reg | BIT(offset), reg_addr);
>> -
>> -	spin_unlock_irqrestore(&data->lock, flags);
>> -
>> -	return 0;
>> +	return regmap_update_bits(data->map, offset,
>> +				  BIT(bit), assert ? 0 : BIT(bit));
>>  }
>>  
>>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -113,30 +109,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
>>  
>> +static const struct regmap_config regmap_config = {
>> +	.reg_bits   = 32,
>> +	.val_bits   = 32,
>> +	.reg_stride = 4,
>> +};
>> +
>>  static int meson_reset_probe(struct platform_device *pdev)
>>  {
>> +	struct device *dev = &pdev->dev;
>>  	struct meson_reset *data;
>> +	void __iomem *base;
>>  
>> -	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>>  	if (!data)
>>  		return -ENOMEM;
>>  
>> -	data->reg_base = devm_platform_ioremap_resource(pdev, 0);
>> -	if (IS_ERR(data->reg_base))
>> -		return PTR_ERR(data->reg_base);
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>>  
>> -	data->param = of_device_get_match_data(&pdev->dev);
>> +	data->param = of_device_get_match_data(dev);
>>  	if (!data->param)
>>  		return -ENODEV;
>>  
>> -	spin_lock_init(&data->lock);
>> +	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(data->map))
>> +		return dev_err_probe(dev, PTR_ERR(data->map),
>> +				     "can't init regmap mmio region\n");
>>  
>>  	data->rcdev.owner = THIS_MODULE;
>> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_REG;
>> +	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
>> +		* regmap_config.reg_stride;
>>  	data->rcdev.ops = &meson_reset_ops;
>> -	data->rcdev.of_node = pdev->dev.of_node;
>> +	data->rcdev.of_node = dev->of_node;
>>  
>> -	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
>> +	return devm_reset_controller_register(dev, &data->rcdev);
>>  }
>>  
>>  static struct platform_driver meson_reset_driver = {

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
