Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03498C3DA49
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2024 12:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/hWSWCckfuq6kxCF4AEY2zsITlQQHLPoUJyNHKNQLE=; b=rI8afOUw7sU29S
	jl4+UOjH24Rq6uoc7rTjvDHkEbeaHauKBmAMFot5n38NprmW+KArhbPlB2WyR+cpPY8pbGNjmONKN
	rXbR9ix8H0pAmQZhkMdYnjxc+ICxN4SW5gJFmQNfM+oJAWb7NJ9ZzPnvr4y7X/jOrcc8qVSsYOiaE
	lS8iN0TXetLJ+LJK31F977BJ8V6G08N7Xsof/2mzmbP6CPPLBuIb2G/R5g8UOl2PgGJAsS07JgBot
	9m/Ld368ctO8nLpIVWTZ9cciiCm5BAJwsjtlZm0jUpL+v7z1yQS1DSxWaKqRvwKTITcIvli2iFX7X
	+WSYFH6fxMvrwIDaDdmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTh7f-0000000ANy2-1OZ9;
	Tue, 16 Jul 2024 12:17:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTh7b-0000000ANwj-0NqH
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jul 2024 12:17:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42679f33fefso37041675e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 Jul 2024 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721132249; x=1721737049; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCyvorohijdRKm4vXZWOZPoWQcguYD1LDURxXWUj1WE=;
        b=GrTaC3efnG14Ho0Ayook09DBfuTO5JUjSY4yTpvrOTHmUQxFXpu3MZJj1Eoi/VRHrO
         8XBScsCwsWKgIkOOlbTTPajNIY/LXNl7k3XETY33BF54frA08G53EFAIA7qzn3Ml3gJ8
         6rA8g+u041lNrBkwbFh8HnW0ivC7zYVrva7WxbseOeG8VlMOtQYdkz68vPVar3MlkNEl
         gJ6iaBCfj2Q60XQ5IhDTonB12PFZS9/9HII3sEk4UTUXDhRkU6z+n/DbtE4NTHN0DgEp
         fZpst1aKBxtigcb5OM6Yr8Hu4qjFwYxJdiz6rKORmjDiHyW4XWAqsmzkycVKeyTyKK8J
         nG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721132249; x=1721737049;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCyvorohijdRKm4vXZWOZPoWQcguYD1LDURxXWUj1WE=;
        b=l/o6Vej4aTiU0+adnS1t/lETM6AvGQlK3hK7HnGMpQOB0ESwlylZjDUT2lQ/LlOEIN
         HcTaw1iYXutm75sIn78jqbncgKGuxD4+xFYexMfqWhjz5FFWO1L5zzdIv5c2xr4nNNGv
         bbeZV/IvECPR4t2yXoP09vZVVRTb58vkisXSHn9SsgHCGEyPmK7oiGhgY7ZaeZ58jUqd
         uOr+yM6/+NEHl54m1WhZ/O0E0KZ9bC3OctXseNqDCaKNylRVTDGBGJOVH5b7xKiQRBU9
         NskM97MKrbgZRvBfx318lAGisACojRbSBJh2uCEuMpt6Dvgn9zvhx9iQAImsJI0aznFW
         kw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtu7YtZXoE9xOPbOAYRxWUish5Jt8bCZczwbAde+U6Jxx7Z/Ql7ij7koeeCGR+rdvgrhA3vDoOojkfV7khXyibaywBvFhPDO5m+sJ9TtXUxt4=
X-Gm-Message-State: AOJu0Ywwl4XnlLhNgIw362e6iF2gTsupV4enA3UrUk0pwxQn2ltmupEv
	18efBtwBuLKG3herC3i+WZw6B+McvYxM4Bv3Etiq3ZuG+kgSKvfgVo4MfZKydhA=
X-Google-Smtp-Source: AGHT+IH4yigp1gkjcQxeAeOLYjio+1QZ5295mCJAsZNF/cho9G7FBybV0wRa9cSEe7GhaXwmooof4Q==
X-Received: by 2002:a05:600c:46c9:b0:425:69b7:3361 with SMTP id 5b1f17b1804b1-427ba696a81mr12199525e9.18.1721132249171;
        Tue, 16 Jul 2024 05:17:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e816:4889:4177:9f12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2cc27asm159281425e9.34.2024.07.16.05.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:17:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  <linux-kernel@vger.kernel.org>,  <linux-amlogic@lists.infradead.org>,
  <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/8] reset: amlogic: split the device and platform probe
In-Reply-To: <66ef4ff5-b472-44ee-a4fc-a68ceacea159@salutedevices.com> (Jan
	Dakinevich's message of "Tue, 16 Jul 2024 01:48:18 +0300")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-4-jbrunet@baylibre.com>
	<66ef4ff5-b472-44ee-a4fc-a68ceacea159@salutedevices.com>
Date: Tue, 16 Jul 2024 14:17:27 +0200
Message-ID: <1j34o9pm3s.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_051731_262838_0F5C3424 
X-CRM114-Status: GOOD (  18.68  )
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

On Tue 16 Jul 2024 at 01:48, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> On 7/10/24 19:25, Jerome Brunet wrote:
>> To prepare the addition of the auxiliary device support, split
>> out the device probe from the probe of the platform device.
>> 
>> The device probe will be common to both the platform and auxiliary
>> driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/reset-meson.c | 55 +++++++++++++++++++++++--------------
>>  1 file changed, 34 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index 59126c9f194a..fec55321b52b 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
>> @@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
>>  	.deassert	= meson_reset_deassert,
>>  };
>>  
>> +static int meson_reset_probe(struct device *dev, struct regmap *map,
>> +			     const struct meson_reset_param *param)
>> +{
>> +	unsigned int stride = regmap_get_reg_stride(map);
>> +	struct meson_reset *data;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->param = param;
>> +	data->map = map;
>> +	data->rcdev.owner = dev->driver->owner;
>> +	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
>> +		* stride;
>> +	data->rcdev.ops = &meson_reset_ops;
>> +	data->rcdev.of_node = dev->of_node;
>
> It will be good to add here something like this. Later it would help in
> reset debugging.
>
> data->rcdev.dev = dev;

That is not the purpose of this change.
I'm merely re-organizing exiting code, not changing it.

Plus, if you refering to rcdev_name(), we already populate
rcdev->of_node, so a name is provided.

>
>> +
>> +	return devm_reset_controller_register(dev, &data->rcdev);
>> +}
>> +
>>  static const struct meson_reset_param meson8b_param = {
>>  	.reg_count	= 8,
>>  	.reset_offset	= 0x0,
>> @@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
>>  	.reg_stride = 4,
>>  };
>>  
>> -static int meson_reset_probe(struct platform_device *pdev)
>> +static int meson_reset_pltf_probe(struct platform_device *pdev)
>>  {
>> +
>> +	const struct meson_reset_param *param;
>>  	struct device *dev = &pdev->dev;
>> -	struct meson_reset *data;
>> +	struct regmap *map;
>>  	void __iomem *base;
>>  
>> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> -	if (!data)
>> -		return -ENOMEM;
>> -
>>  	base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> -	data->param = of_device_get_match_data(dev);
>> -	if (!data->param)
>> +	param = of_device_get_match_data(dev);
>> +	if (!param)
>>  		return -ENODEV;
>>  
>> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> -	if (IS_ERR(data->map))
>> -		return dev_err_probe(dev, PTR_ERR(data->map),
>> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
>> +	if (IS_ERR(map))
>> +		return dev_err_probe(dev, PTR_ERR(map),
>>  				     "can't init regmap mmio region\n");
>>  
>> -	data->rcdev.owner = THIS_MODULE;
>> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
>> -		* regmap_config.reg_stride;
>> -	data->rcdev.ops = &meson_reset_ops;
>> -	data->rcdev.of_node = dev->of_node;
>> -
>> -	return devm_reset_controller_register(dev, &data->rcdev);
>> +	return meson_reset_probe(dev, map, param);
>>  }
>>  
>> -static struct platform_driver meson_reset_driver = {
>> -	.probe	= meson_reset_probe,
>> +static struct platform_driver meson_reset_pltf_driver = {
>> +	.probe	= meson_reset_pltf_probe,
>>  	.driver = {
>>  		.name		= "meson_reset",
>>  		.of_match_table	= meson_reset_dt_ids,
>>  	},
>>  };
>> -module_platform_driver(meson_reset_driver);
>> +module_platform_driver(meson_reset_pltf_driver);
>>  
>>  MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
>>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
