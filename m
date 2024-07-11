Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8F4C3DA47
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAVV85tZ2avgqIwv2lqeCtn8P04SwVlx9nssD/iieUw=; b=azpYemL0yVXz/+
	/emJ6uZuiC/3qfm3yhuLdBpMNi3AeIOjexmgovcIm61tyUGpyJeAvfhXyUuixALElNQarVQ+uU8ZO
	FyK21AlzoGvfPKfXysQSrx53tSr6BSEJPkpse5WVrXtd1NsBK8t2eQApbvFOISzwowKO2nxlnZJsT
	7pXO+plwUaYnW+jib61Vc0eBdVt4VvUlGHq9nCSghC85Gb7b2q35eYIyzfY0/PLdcyJ/dE+kwf39Z
	PNoQ+7Yx8WZz/EhQCmZ4Q98xeiGNA1T+4uwmZqzIv0hbWsaNq8Im11m3pVt28icEek4MG4IoiRbww
	yjcDCeXf3poyIda6RPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpg4-0000000DHLz-1NKB;
	Thu, 11 Jul 2024 09:01:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRpg0-0000000DHKw-396T
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 09:01:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-426685732dcso4165325e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jul 2024 02:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720688478; x=1721293278; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O76Wd1xdw6NT3rqbN+Mq89J6tI9yqcUKeCRTu1LWxmk=;
        b=b26g23z1au422ARDHLSBK69SmpqyjT+eJwh//Pz3g5tEFaKsMnxTHlN8WvyD1WCt3K
         FnrxFR2gzmjYnbOpeDHwy4oMu1mZ1QqUei7nkJ9Bwd8x+OKNC0GHxkKmAPMGTtUdZGs2
         KjRfzbc82v37gVF0vXMOc98zYnH/BYPp4ubGEdj/hWwPTp2Xt1taq9ofWsgmenUFG2lS
         BE/7ls0Ex2Emx6DJveA8GLQA0MWjaYD5R4h+AeL/Abpu57qJpNg7XTFCHUACx7YHUg7L
         24HVXlsF+WOK0kBCmDf+XvbEH07Ne2jMSOUbi6/2xfwmTkIfZVhJsQPy6CFvKjKoNm3t
         Rb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688478; x=1721293278;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O76Wd1xdw6NT3rqbN+Mq89J6tI9yqcUKeCRTu1LWxmk=;
        b=LtpAwQSJ8e2qHSqL7i/1XjgV3kMHXuAPjRovzhu27ngj96fIr5bxBVjVRShsYbVqz3
         Si8viZL0dUtSm7wVyC6+NC9NhEd+9AOSG9CDY/VdD47hlX9v5Z0/CeIbpP0KCmzx0l2v
         pGiCK5uiHFMNOiFlkFVjnJg2t0LrFZIOZsDJOM110qC/FnWKJmEFKiKOvVYTLgEMTS+I
         o521xls2vMAwPMLvTMKbDqVKR1dOPVPbfu3Cji5ZVzWVoHW1IjZHSjnvUGJG+LrCQdZd
         9c0u1Bsl0vp3LsLON3edNK6RVs0V49CWGOGCiWBlAAmyvWaeN7jH+zmQc9Ieh8ap+eQa
         wuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg/RoQTQUg4W5lIeYXH6YCmDkC9upmrz2mD9luVoxfzmm1Oqp2sX8xLWSERUzlrhzVwAhTREwV1waJokTIIR9MvxF6Pett1OPfcaO/Bk+UosQ=
X-Gm-Message-State: AOJu0YxIKXhrSCP8yx2LB0hDO8I32pc3FSMpHWVtzogvoGTfdSuulYgq
	SMnzgZSrL2TNqFs8WMr6rUOf2MUzqYst0WUseo7Jq6PSY31QbNMHB3ZHxh/BcSE=
X-Google-Smtp-Source: AGHT+IF8lHe9Es5HF0Ko8Tr5R/zHyd6BopakSB0f7nBr2KdNcKTrn7lbuxyBJzEVMvldK1lXJtcgrA==
X-Received: by 2002:a05:600c:358f:b0:426:8ee5:5d24 with SMTP id 5b1f17b1804b1-4268ef4a0b6mr39316115e9.20.1720688477752;
        Thu, 11 Jul 2024 02:01:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a9e9:c71a:10d8:7f63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e9666sm108670895e9.9.2024.07.11.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:01:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Jan Dakinevich
 <jan.dakinevich@salutedevices.com>,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org> (Stephen
	Boyd's message of "Wed, 10 Jul 2024 15:49:38 -0700")
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
	<20240710162526.2341399-8-jbrunet@baylibre.com>
	<88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org>
Date: Thu, 11 Jul 2024 11:01:16 +0200
Message-ID: <1jv81cgv4z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_020121_027824_8011CFCF 
X-CRM114-Status: GOOD (  23.59  )
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

On Wed 10 Jul 2024 at 15:49, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2024-07-10 09:25:16)
>> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
>> index e34a10b15593..5cc767d50e8f 100644
>> --- a/drivers/reset/reset-meson.c
>> +++ b/drivers/reset/reset-meson.c
> [...]
>> +
>> +int devm_meson_rst_aux_register(struct device *dev,
>> +                               struct regmap *map,
>> +                               const char *adev_name)
>> +{
>> +       struct meson_reset_adev *raux;
>> +       struct auxiliary_device *adev;
>> +       int ret;
>> +
>> +       raux = kzalloc(sizeof(*raux), GFP_KERNEL);
>> +       if (!raux)
>> +               return -ENOMEM;
>> +
>> +       ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
>
> Do we expect more than one device with the same name? I wonder if the
> IDA can be skipped.

I've wondered about that too.

I don't think it is the case right now but I'm not 100% sure.
Since I spent time thinking about it, I thought it would just be safer (and
relatively cheap) to put in and enough annoying debugging the
expectation does not hold true.

I don't have a strong opinion on this. What do you prefer ?

>
>> +       if (ret < 0)
>> +               goto raux_free;
>> +
>> +       raux->map = map;
>> +
>> +       adev = &raux->adev;
>> +       adev->id = ret;
>> +       adev->name = adev_name;
>> +       adev->dev.parent = dev;
>> +       adev->dev.release = meson_rst_aux_release;
>> +       device_set_of_node_from_dev(&adev->dev, dev);
>> +
>> +       ret = auxiliary_device_init(adev);
>> +       if (ret)
>> +               goto ida_free;
>> +
>> +       ret = __auxiliary_device_add(adev, dev->driver->name);
>> +       if (ret) {
>> +               auxiliary_device_uninit(adev);
>> +               return ret;
>> +       }
>> +
>> +       return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
>> +                                       adev);
>> +
>> +ida_free:
>> +       ida_free(&meson_rst_aux_ida, adev->id);
>> +raux_free:
>> +       kfree(raux);
>> +       return ret;
>> +
>
> Nitpick: Drop extra newline?
>
>> +}
>> +EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
>> +
>> +MODULE_DESCRIPTION("Amlogic Meson Reset driver");
>>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
>> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>>  MODULE_LICENSE("Dual BSD/GPL");
>> diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
>> new file mode 100644
>> index 000000000000..8fdb02b18d8c
>> --- /dev/null
>> +++ b/include/soc/amlogic/meson-auxiliary-reset.h
>> @@ -0,0 +1,23 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
>> +#define __SOC_AMLOGIC_MESON_AUX_RESET_H
>> +
>> +#include <linux/err.h>
>> +
>> +struct device;
>> +struct regmap;
>> +
>> +#ifdef CONFIG_RESET_MESON
>> +int devm_meson_rst_aux_register(struct device *dev,
>> +                               struct regmap *map,
>> +                               const char *adev_name);
>> +#else
>> +static inline int devm_meson_rst_aux_register(struct device *dev,
>> +                                             struct regmap *map,
>> +                                             const char *adev_name)
>> +{
>> +       return -EOPNOTSUPP;
>
> Shouldn't this be 'return 0' so that the clk driver doesn't have to care
> about the config?

I don't think the system (in general) would be able function without the reset
driver, so the question is rather phylosophical.

Let's say it could, if this returns 0, consumers of the reset controller
will defer indefinitely ... which is always a bit more difficult to sort
out.

If it returns an error, the problem is pretty obvious, helping people
solve it quickly.

Also the actual device we trying to register provides clocks and reset.
It is not like the reset is an optional part we don't care about.

On this instance it starts from clock, but it could have been the other
way around. Both are equally important.

I'd prefer if it returns an error when the registration can't even start.

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
