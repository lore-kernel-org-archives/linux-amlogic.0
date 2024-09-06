Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5393CE7B1D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Tzp5fyAp5ziZWDaQUec1PCgH0CPkWIHFZwGcVxg/pY=; b=KOiI07rcToQGW1
	xmzL+Yv3tt4wBckwr1zsNe/TXQrlN9U/Jc+LN9xswlN5rxs0+e4yCiQkGXawofSE3KXzaX+dwnVzx
	vXXNBf8eYmuaQ58jf4Pi2lmbIRFPXVyGKCVjwh7eOvbzxy55fSNy41Q8SsNn+DIEfqCp9py1HBUBq
	9QkYA40+sPq0as7b8a41qHuN0S1fqhFUhIdfQE+J2yq2HoN1QCKElWMMzBa75josMHEp4etrH0fVJ
	45kGE+Y3qlRYx6/QeXeL2U7LZQlEpYAg5JdP54V1F6Z4ZJqkVRWFJLWHoiZ5D9cTE4mxxY+KOYQAg
	uBnNBANxTdGpT7EWfJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaFV-0000000CbgB-3YzZ;
	Fri, 06 Sep 2024 14:47:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaES-0000000CbPD-24LB
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 14:46:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so16776735e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725633998; x=1726238798; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDas7/3GnB3gI3FiQmSZkr4FI1Dk7Pb5iN0NPlHwcvo=;
        b=UONzLS5Kg7ErlzGVX5HgqROX2wjAkJCkKrKsP2XGWbKmFygalKwF6DtGdXhmGdQiHl
         5RoIxy15OlyRHZRoJjBV+8P6SWYb/ksDYgTQMsinUXB/L+J7b5ISBbmExBsLcxygpBZi
         4A0UsA9fXx2XvL/SaU3Uzg2CJR4KyGzLja5otzbIv0WI3WVvIHs8Ne9QUJJJAm4exGZ7
         E8KiEFZoYR+RfHJt9liet5cDn430rc6LFyWmNt74ZrHLtIBBrv2tzGvHgbZIDTPT6KDr
         gb929U+XwDV9o7sFOnlvHYgGr79ihPsm9SUleqK9/StMAQ5+OuLE1CmYTf4CJHwDPR0z
         CRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725633998; x=1726238798;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDas7/3GnB3gI3FiQmSZkr4FI1Dk7Pb5iN0NPlHwcvo=;
        b=uFWnTlMOs1jPa33SutiTW/EDGNK93IO6ruCQ0746N5VTVRLMoucONog7hE8iFoKbsG
         olDWEvwZaStBu/8tDzVojDjI6WsR++7sLGd0CDA2IDZQliPYeSOeqTHRKqiqiYRZYSlQ
         CDYFFDGJDijfXafTfooB+1n/JLp51FYYDFK2vuftxjN5UMvG+Czlk99x1wbUhWd7Xwij
         ViA0dCs4sZD88Rf4XsrMiBeBzdPgSpX/XrkzxR1Z2h+Rajtnb0yhcq1v9hKFpYT3aAAv
         hzUCUnAWhXXjrt8oiCfmCFspbzW4+D+rBwbi1xcZzRQtED5ku83WA1buJeO1AGztnE1K
         l2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXcECBOvJXKfaIPUKmPGMaH14kt58fVh69GlA703WCpraHMjZSGwnopQ2pWlbdY96veuWOoYQk4AUB3z61b@lists.infradead.org
X-Gm-Message-State: AOJu0YxKPhwoAM848MD/U0RhLakPdcVGUCMV8J53rNktpZ0PI2PjalTs
	xrGcpvRgdZo649BeT6hR9zpCvpGUWTUkslALYtcdAoo/oiRbb2jHTZt1YB7BLQc=
X-Google-Smtp-Source: AGHT+IHMg7y0aw1m8lQnqNRNlNkZBuLXMZvJfNBbKP0BuiZSWuVA7JEZ4Ct05EbZan7vjpnXQFX2og==
X-Received: by 2002:a05:600c:35ce:b0:42b:8a35:1ade with SMTP id 5b1f17b1804b1-42c9f9d648dmr17095365e9.27.1725633997508;
        Fri, 06 Sep 2024 07:46:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4d9f:a9a2:6f41:699f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05cc3dbsm22410485e9.20.2024.09.06.07.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:46:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] reset: amlogic: convert driver to regmap
In-Reply-To: <984d928a37b3db11ae53c07da672ccae0d79734f.camel@pengutronix.de>
	(Philipp Zabel's message of "Fri, 06 Sep 2024 16:19:00 +0200")
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
	<20240906-meson-rst-aux-v4-1-08824c3d108b@baylibre.com>
	<984d928a37b3db11ae53c07da672ccae0d79734f.camel@pengutronix.de>
Date: Fri, 06 Sep 2024 16:46:36 +0200
Message-ID: <1jfrqcrgab.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_074640_616548_0CDDB1B1 
X-CRM114-Status: GOOD (  27.22  )
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

On Fri 06 Sep 2024 at 16:19, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fr, 2024-09-06 at 15:34 +0200, Jerome Brunet wrote:
>> To allow using the same driver for the main reset controller and the
>> auxiliary ones embedded in the clock controllers, convert the
>> the Amlogic reset driver to regmap.
>> 
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 79 ++++++++++++++++++++++++---------------------
>
> This patch should also make RESET_MESON select REGMAP.

Indeed

>
>>  1 file changed, 43 insertions(+), 36 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index 1e9fca3e30e8..9dd38cc209e2 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -11,36 +11,43 @@
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
>
> You know this is always 4. Having a #define for this (that is also used
> to initialize regmap_config.reg_stride, and for now nr_resets, below)
> instead of going through an exported function would allow the compiler
> to optimize this all away:

Yes, for now. However, with the auxiliary you may get a regmap with
different value. I've seen example with stride = 1. 

I'll admit is very unlikely but I does not really worth it considering
how often we'll get through this and how difficult it will be to debug
if stride ever get different.

>
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
>> +	return regmap_write(data->map, offset, BIT(bit));
>>  }
>>  
>>  static int meson_reset_level(struct reset_controller_dev *rcdev,
>> @@ -48,25 +55,13 @@ static int meson_reset_level(struct reset_controller_dev *rcdev,
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
>
> Matter of taste, perhaps, but the BIT() could be moved into
> meson_reset_offset_and_bit().

It's not really related to this particular patch which is about moving
to regmap.

I can add it to another patch if you want

>
>>  }
>>  
>>  static int meson_reset_assert(struct reset_controller_dev *rcdev,
>> @@ -119,30 +114,42 @@ static const struct of_device_id meson_reset_dt_ids[] = {
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
>
> regards
> Philipp

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
