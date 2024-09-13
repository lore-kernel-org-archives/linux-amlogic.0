Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40179EEEC39
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Sep 2024 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mERoJRfTRL4jDde73QPNlCsajsMhK5AdLFAKsEWDQeI=; b=SsYWgdvBA/oS7B
	HJJ2cSvN5NeJ+AhQd1m84iNV8Psm3yiTTp3cZKH775PLa1EIWsiGS4ZAgJ2pKWU5awX4vBTr/kq2U
	xh6JpdaQW/wnFtwN3h7t5aic6ZlZf9aFtumxj53r8qJDEU8yMXU30JtvXrHx75YCfUZNQnMVsFxe2
	XewgvTggA47QdYgr+r3qOo7D59Zlq8wZCJcuuD579KuypVPpzN5Z5e2R4VGkceuik3TmSm5dUYHuX
	9qJcS9vhuQcxqtB0A2AvGMDHaTx1tD02d0TEM6Up8bzGjC2myni2EM4EYVnzlCzCwquiRr9Om3/aQ
	LFFjXQV5D3NHh568Xx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0BN-0000000F5vG-2GwY;
	Fri, 13 Sep 2024 06:53:29 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0BK-0000000F5uY-0ANx
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Sep 2024 06:53:28 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f759688444so16189881fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Sep 2024 23:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726210404; x=1726815204; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D/JVmumvAmhH4T2M2SYhr9R81Y5mg2XZZPfgi7X4P4s=;
        b=DTpSGTy/QFVwa+ZSO3G3W1jPE4Rjs9A+eaa6vO9GmHnqYLRTqs1K1YwsD65N0vIeIz
         tLZsVvSdJNdDSn0ey6jEblb6SbSQEqaHEdzWSS94RMstcYFGoaawr5wdfJ3MXymqDuso
         bp+ktPvl+/o1PjJCa2VwdsfrGVAMZH6hkSiCQ1J8idYxhxg7Lb3Vi4+Qz7O6fHXqVe7h
         rnjrtXyYUBs2zOCawmSMIIndy89Bi/8bfVpRdXN4L/H66Jw7L1e7sgsEcmOreXpQ6fBl
         sPRx1tal9crLncw5PhVV+0zk+qQhkoc+SwWeAMCn2Z6+7vhjdBjmSfW/aOcbeHzvNc8U
         5S2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726210404; x=1726815204;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/JVmumvAmhH4T2M2SYhr9R81Y5mg2XZZPfgi7X4P4s=;
        b=JmhfrWcz8zh7Q3VezTi4qs9cFfZ+YT/644wuCCtDDZnhsUmmzVq8+LoBN5dv+u8lIs
         i3Fr1vyAUSzJQrQF5w22wEYysLR4Y/cNL9P7gp2aWwM2DhOTM2rhGrrs8lnxl8PeAER9
         PeqO/K3V1fRUtQ3zqoiQe8tDdDV6Lf5/lcVpzlf5VeOhLlmj+433wnvz0ClqtH3LcunA
         WziK9SatR/PI7R2z8DKPku1/3iIyMnCUNggyrY7oECglQMChNyIeXDz/MA23bnbfXkaL
         S2u5jMRETQoxHRD2uBDRNQp9JQE/o5IgoS+VZ1QDbEgbWJXwoTg4ZIH6+PpqbhQUsLyn
         g0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXfmWCG4Ibgg4d/XfMH0UWrKwHHv9vlERt0/6EH3byvuGFTgqdK6Er6Iu2DTVrS4BacYfvLdWc/IS6nGufC@lists.infradead.org
X-Gm-Message-State: AOJu0Yypabqw13TL1cJP9xA2vF8e8dSYX5Xea57aQ08OJMlqTowW8Bn2
	Dw718IFiXGtBXwKQFJUFNJE/NJDFwlLn25syZerhshvyzIuVSS4PZ2NEXrwO614=
X-Google-Smtp-Source: AGHT+IHjjlfV76zJQFOUoO0v8dhF0Bl3CQ4RiUDYruhQ4SFj0zyKwm9aj2oXnuAxIJ6qQTQKV6bSlA==
X-Received: by 2002:a05:6512:6ce:b0:534:36bf:b622 with SMTP id 2adb3069b0e04-53678ffa374mr2717302e87.61.1726210402875;
        Thu, 12 Sep 2024 23:53:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9766:a21e:6656:7a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b05d5dbsm13450095e9.13.2024.09.12.23.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:53:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
	(Philipp Zabel's message of "Thu, 12 Sep 2024 10:12:14 +0200")
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	<20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
	<8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
Date: Fri, 13 Sep 2024 08:53:21 +0200
Message-ID: <1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_235326_086267_B2C735DE 
X-CRM114-Status: GOOD (  19.73  )
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

On Thu 12 Sep 2024 at 10:12, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Di, 2024-09-10 at 18:32 +0200, Jerome Brunet wrote:
>> To prepare the addition of the auxiliary device support, split
>> out the device coomon functions from the probe of the platform device.
>> 
>> The device core function will be common to both the platform and auxiliary
>> driver.
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/reset/amlogic/Kconfig              |   7 +-
>>  drivers/reset/amlogic/Makefile             |   1 +
>>  drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
>>  drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
>>  drivers/reset/amlogic/reset-meson.h        |  24 ++++++
>>  5 files changed, 167 insertions(+), 108 deletions(-)
>> 
>> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
>> index 532e6a4f7865..1d77987088f4 100644
>> --- a/drivers/reset/amlogic/Kconfig
>> +++ b/drivers/reset/amlogic/Kconfig
>> @@ -1,10 +1,15 @@
>> +config RESET_MESON_COMMON
>> +	tristate
>> +	select REGMAP
>> +
>>  config RESET_MESON
>>  	tristate "Meson Reset Driver"
>>  	depends on ARCH_MESON || COMPILE_TEST
>>  	default ARCH_MESON
>>  	select REGMAP_MMIO
>> +	select RESET_MESON_COMMON
>>  	help
>> -	  This enables the reset driver for Amlogic Meson SoCs.
>> +	  This enables the reset driver for Amlogic SoCs.
>>  
>>  config RESET_MESON_AUDIO_ARB
>>  	tristate "Meson Audio Memory Arbiter Reset Driver"
>> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
>> index 55509fc78513..74aaa2fb5e13 100644
>> --- a/drivers/reset/amlogic/Makefile
>> +++ b/drivers/reset/amlogic/Makefile
>> @@ -1,2 +1,3 @@
>>  obj-$(CONFIG_RESET_MESON) += reset-meson.o
>> +obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
>>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
>> diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
>> new file mode 100644
>> index 000000000000..d57544801ae9
>> --- /dev/null
>> +++ b/drivers/reset/amlogic/reset-meson-common.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
>> +/*
>> + * Amlogic Meson Reset core functions
>> + *
>> + * Copyright (c) 2016-2024 BayLibre, SAS.
>> + * Authors: Neil Armstrong <narmstrong@baylibre.com>
>> + *          Jerome Brunet <jbrunet@baylibre.com>
>> + */
>> +
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#include "reset-meson.h"
>> +
>> +struct meson_reset {
>> +	const struct meson_reset_param *param;
>> +	struct reset_controller_dev rcdev;
>> +	struct regmap *map;
>> +};
>> +
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
>> +static int meson_reset_reset(struct reset_controller_dev *rcdev,
>> +			     unsigned long id)
>
> checkpatch --strict complains about the alignment here.
> I'll fix this up when applying, no need to resend.

Thanks Philipp.

FYI, those mis-alignement were already present in the original code and
there has been comments when I re-indented code while moving it
around so I did not touch it.

>
> regards
> Philipp

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
