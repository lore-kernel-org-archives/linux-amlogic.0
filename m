Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F95CC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 19:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459162339D
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 19:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQIPEYp/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="towNl5GI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459162339D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BEnZtGnd8sJLPk8azyV9hayKUdund/0rm8ckknp2G+Q=; b=hQIPEYp/eFRnIY
	fia6BHtpzqvzkSdQwiy7WyxuRq41SffZnG1JR1Kel70uUUC8dZWrm7dlvReUr1zNu0CXJtDGG77Ry
	vr24t1g4DLkTOnnvqWSpBQlYIL5DrKZsPiNJTyLyZD2MzO1928IYrQeoWYoZre6NfRdHO8DOAzK09
	5MBg1SoLqHi5x+3hT3MAHVON/Bn18iPu1+/gShlZoLwe0WkoK+HGrQbgOiGdcH+mKXf8SL3zHqavh
	9lL19QRYnCJEbqapXxA6ctx0n7LBsYhCrIjrgRRCatyeDYUGBn5JjVBxUFF8lINpfcyGAqzPt6mfT
	Aswh0o66XSwRdGJyJIOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i09fB-0000kG-4Z; Tue, 20 Aug 2019 19:19:25 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i09f1-0000cB-7X
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 19:19:17 +0000
Received: by mail-pl1-x642.google.com with SMTP id c2so3226161plz.13
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=d3xEwsHTmPgqbdVb+zyY04Un4P6jiiCiFWweN/mQiKY=;
 b=towNl5GIX0HZUlEZQQPSdcqGKLHxu01ak6wG6m4xqV0MF6uZFhmtTj6oYHA+gHS/pn
 kPhnZhBjLjY8R/uXQhJbGdHUFfD7YYwOAfidXa8TmMoH5rknmzlBXHCf3hQlUyr5uS7C
 iYG1Bj8YXV+ZifjuoObVGhusuQbtGLbHs8e07tDxtMxCct58Nj3zcUGOrmsm/q8201Id
 V8MePkSYOPEPC208zQ4euGywwLdtgjNM6iji1pXXQdGrcfblp8+GELLaWksCKSB/p0UC
 TtiVWvaJkxdwMIw4U81blOVXv6HR+XZ8KTMQVqgIgioLgLkh6CxCzgMbvqCzIkN8ZaMf
 TNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=d3xEwsHTmPgqbdVb+zyY04Un4P6jiiCiFWweN/mQiKY=;
 b=teA8NNX7GtqMfFdppqAuj3Rq9z9hABUU9nB1oOZPqeriGzW1JIKQdi4ikRHOrUj+4E
 03xgvmQcFDKPaVTWi1BY9G6QPQ1EShwWZ5NxYLIrNKCDN1MnDNhqrOHRd/7S399RwLmH
 itZHBVj9dZ3S5j/FsSsLvxMmCWE9J+VdJbCtsgnx/Ym4CZBvPSZMIadf2/syXcB2jNTM
 Qnshbnqu6hzPAIby1KtUQsWGWahtZv3RZEsxrqZhe0rLx9qjXDdkdEsShGtC9lGEJvXf
 KnfYxaZ3hcy8v7KsUZOrVXYK/PxdqbYvZPHHDQHk43LM5cabLcsdW1sL8bwdH4Zv39RW
 Dt3Q==
X-Gm-Message-State: APjAAAUI0dF4SwE23DGT2aR5dmGDAbfqQP5FWMJe2YX1LlKjl2iweVrm
 xM484JYmFuE/k3b07Ah2eXWscA==
X-Google-Smtp-Source: APXvYqxkiZWI81IrAJlJc85yafLr/6GYWcmOU3ISRGRFq6Opi4QDH2DCpoiFyPamN/inoEReBVqNKQ==
X-Received: by 2002:a17:902:e489:: with SMTP id
 cj9mr24496481plb.327.1566328752258; 
 Tue, 20 Aug 2019 12:19:12 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t70sm676845pjb.2.2019.08.20.12.19.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 12:19:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC 04/11] soc: amlogic: Add support for SM1 power controller
In-Reply-To: <98bda35e-1b4c-404c-fdbd-eaef9ecf38a6@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-5-narmstrong@baylibre.com>
 <7hftlwvhdk.fsf@baylibre.com>
 <98bda35e-1b4c-404c-fdbd-eaef9ecf38a6@baylibre.com>
Date: Tue, 20 Aug 2019 12:19:11 -0700
Message-ID: <7hd0gzejbk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_121915_416526_50E27363 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 20/08/2019 01:56, Kevin Hilman wrote:
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>> 
>>> Add support for the General Purpose Amlogic SM1 Power controller,
>>> dedicated to the PCIe, USB, NNA and GE2D Power Domains.
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> 
>> I like this driver in general, but as I look at all the EE power domains
>> for GX, G12 and SM1 they are really very similar.  I had started to
>> generalize the gx-pwrc-vpu driver and it ends up looking just like this.
>
> Yes I developed it to be generic, but when starting to fill up the GXBB/GXL/G12A
> domains, except the VPU, they only need the PD parts.
>
>> 
>> I think this driver could be generalized just a little bit more and then
>> replace the the GX-specific VPU one, and AFAICT, then be used across all
>> the 64-bit SoCs, and be called "meson-pwrc-ee" or something like that...
>> 
>>> ---
>>>  drivers/soc/amlogic/Kconfig          |  11 ++
>>>  drivers/soc/amlogic/Makefile         |   1 +
>>>  drivers/soc/amlogic/meson-sm1-pwrc.c | 245 +++++++++++++++++++++++++++
>>>  3 files changed, 257 insertions(+)
>>>  create mode 100644 drivers/soc/amlogic/meson-sm1-pwrc.c
>>>
>>> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
>>> index 5501ad5650b2..596f1afef1a7 100644
>>> --- a/drivers/soc/amlogic/Kconfig
>>> +++ b/drivers/soc/amlogic/Kconfig
>>> @@ -36,6 +36,17 @@ config MESON_GX_PM_DOMAINS
>>>  	  Say yes to expose Amlogic Meson GX Power Domains as
>>>  	  Generic Power Domains.
>>>  
>>> +config MESON_SM1_PM_DOMAINS
>>> +	bool "Amlogic Meson SM1 Power Domains driver"
>>> +	depends on ARCH_MESON || COMPILE_TEST
>>> +	depends on PM && OF
>>> +	default ARCH_MESON
>>> +	select PM_GENERIC_DOMAINS
>>> +	select PM_GENERIC_DOMAINS_OF
>>> +	help
>>> +	  Say yes to expose Amlogic Meson SM1 Power Domains as
>>> +	  Generic Power Domains.
>>> +
>>>  config MESON_MX_SOCINFO
>>>  	bool "Amlogic Meson MX SoC Information driver"
>>>  	depends on ARCH_MESON || COMPILE_TEST
>>> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
>>> index bf2d109f61e9..f99935499ee6 100644
>>> --- a/drivers/soc/amlogic/Makefile
>>> +++ b/drivers/soc/amlogic/Makefile
>>> @@ -3,3 +3,4 @@ obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
>>>  obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>>>  obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>>>  obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
>>> +obj-$(CONFIG_MESON_SM1_PM_DOMAINS) += meson-sm1-pwrc.o
>>> diff --git a/drivers/soc/amlogic/meson-sm1-pwrc.c b/drivers/soc/amlogic/meson-sm1-pwrc.c
>>> new file mode 100644
>>> index 000000000000..9ece1d06f417
>>> --- /dev/null
>>> +++ b/drivers/soc/amlogic/meson-sm1-pwrc.c
>>> @@ -0,0 +1,245 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * Copyright (c) 2017 BayLibre, SAS
>>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>>> + */
>>> +
>>> +#include <linux/of_address.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_domain.h>
>>> +#include <linux/bitfield.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/of_device.h>
>>> +#include <dt-bindings/power/meson-sm1-power.h>
>>> +
>>> +/* AO Offsets */
>>> +
>>> +#define AO_RTI_GEN_PWR_SLEEP0		(0x3a << 2)
>>> +#define AO_RTI_GEN_PWR_ISO0		(0x3b << 2)
>>> +
>>> +/* HHI Offsets */
>>> +
>>> +#define HHI_MEM_PD_REG0			(0x40 << 2)
>>> +#define HHI_NANOQ_MEM_PD_REG0		(0x46 << 2)
>>> +#define HHI_NANOQ_MEM_PD_REG1		(0x47 << 2)
>>> +
>>> +struct meson_sm1_pwrc;
>>> +
>>> +struct meson_sm1_pwrc_mem_domain {
>>> +	unsigned int reg;
>>> +	unsigned int mask;
>>> +};
>>> +
>>> +struct meson_sm1_pwrc_domain_desc {
>>> +	char *name;
>>> +	unsigned int sleep_reg;
>>> +	unsigned int sleep_bit;
>>> +	unsigned int iso_reg;
>>> +	unsigned int iso_bit;
>>> +	unsigned int mem_pd_count;
>>> +	struct meson_sm1_pwrc_mem_domain *mem_pd;
>>> +};
>> 
>> If you add resets and clocks (using clk bulk like my other proposed
>> patch to gx-pwrc-vpu) then this could be used for VPU also.  We could
>> ignore my clk bulk patch and then just deprecate the old driver and use
>> this one for everything.
>> 
>> We would just need SoC-specific tables selected by compatible-string to
>> select the memory pds, and the clocks and resets could (optionaly) come
>> from the DT.
>
> Could you elaborate ?
>
> Do you mean I should slit out the memory PDs as different compatible ?

You currently create all these SoC-specific `mem_domain` tables.  We'll
need more of those for the other SoCs, so my suggestion was that, in
order to use this across multiple SoCs, you select the set of mem_domain
tables based on compatible string.

That was just my first idea.  If you have a better idea, I'm open to
that too.

> Let me try to fit the VPU stuff in it.

Great, thanks!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
