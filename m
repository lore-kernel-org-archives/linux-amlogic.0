Return-Path: <SRS0=DMeG=XV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B60C4360C
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 16:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6916721D56
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2019 16:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlM5MUzO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AN9tMr/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6916721D56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GczXRVsqNcO5O1Boq9bfdNBnJZxc+dlRjKfq31IHcyk=; b=AlM5MUzOTQxIJu
	svaCg/pB6mWtFVgftqWr2bUUW4+kD4QJX93YIq9Oxmw38Jv//cvZXd3FYAr3bjmVPaydvPnKK1s6i
	Y2UBJA/zk/Zj9WlCd8tUX9Q2MrrC5EbDkz28mC95X3ctS3CvmVF6qYMhfu4suNAeW2mExHkoVCKfK
	/ppGgp1C7iagrMiY+vB47KhVMkfzGg4VFufOVcLhhNiiRiesKGkefcZpE3u6x1wFckAhfG6x/SIQO
	05eq4tg5VwntD3v/y87Swiee5CC2xhs+fNVXeWh/1FKeUyvHtKv3uYMrWQVIMf47KUe9CJ7VbxkvH
	lyiwDROugk2IIHvsIccw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDWYf-0007i1-1x; Thu, 26 Sep 2019 16:23:57 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDWYS-0007Yo-PN
 for linux-amlogic@lists.infradead.org; Thu, 26 Sep 2019 16:23:46 +0000
Received: by mail-pf1-x441.google.com with SMTP id h195so2129997pfe.5
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2019 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5KJXkwykZKMxFzMHYA7DO1LT2mHdYgxlgFlqTK43aSg=;
 b=AN9tMr/xQI6ixjCkoOmGxFdfQQtzy7Olh9LVYyYm42aA6ePb3swjBmTLHJbDhDG9c0
 m5sPVQYWjy4J96xClewSCc6+peXtW96QKUk3yBLYrK31fpIxgabsfI9rRa5cZzLh4cNr
 aVBYR8He61kDNtVrQWRiVcdpVmJMik1lgj+t6QFUnD2C7MbYsC3LJpfhOKW0vF7+AWDr
 ULvseh5sJ3UZ15ccyuqK1N3Vbyz/NxUVWqq8BGpNiRhLS4Ph7LFD26WxlZp2MLcyPk5w
 n5tdImLhl1Jqs1CiX409ZOVDPm2M7503awCd/tQopa4Bs5821cSrOpImfVJoT6cbGuqI
 nKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5KJXkwykZKMxFzMHYA7DO1LT2mHdYgxlgFlqTK43aSg=;
 b=KPwkpup+kOdoIEv3H1nWzRgbKgISDTFonheSLclWEoM5eH5aUnYdyd215vzPTzWpxB
 S0rcOYGBNw2jUFGZQyW/b8yGy5gRnxhqUO/0q1dNBL3wbnc/nGJ94zmMBhxxvMMg++wL
 fVQ+DEW0jCtqR1I0CERPZS58r1+lK2atTjT7fm6nZ6V2Ez1y8H94hpUyjkP3K3mNyVKU
 5F0kuYCJaglZFcHKtSCbbLF9Z4B+o6JlS1V0MTYqXaIcESSYwI1eEHr6lFT77P5UQPvE
 5Db8PZIMg0fBWzZm6k4hvkiNVhPHJQu/Im18G1heVQSmKlI6ZTEd1WHBj7+EUyuK7c+J
 vIxg==
X-Gm-Message-State: APjAAAVH6H3KPcxKU25k3l24aLMeJjWkQ/sJ6eUi2whufvEduOOP+ov5
 gPPVm9AqfW7C1g13gO7Caa0ciBuQcDgnMw==
X-Google-Smtp-Source: APXvYqyXRYUH9jhldr03tJ4HTnP6NcLAFrGaRJdGlX81M87HTImuFCaOBIrqy502qWA3AiMe4YNO+g==
X-Received: by 2002:a17:90a:8c15:: with SMTP id
 a21mr4308094pjo.99.1569515023652; 
 Thu, 26 Sep 2019 09:23:43 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id y144sm3041925pfb.188.2019.09.26.09.23.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 09:23:42 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: amlogic: Add support for Secure power domains
 controller
In-Reply-To: <3859c748-01f0-4dbd-05d6-20fff31edf11@amlogic.com>
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
 <7hh850t2wy.fsf@baylibre.com>
 <3859c748-01f0-4dbd-05d6-20fff31edf11@amlogic.com>
Date: Thu, 26 Sep 2019 09:23:42 -0700
Message-ID: <7ha7arrppt.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_092344_857196_95D91F68 
X-CRM114-Status: GOOD (  21.82  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Zhiqiang Liang <zhiqiang.liang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Hi Kevin,
>
> Thanks for your review. Please see my comments below.
>
>
> On 2019/9/26 6:41, Kevin Hilman wrote:
>> Hi Jianxin,
>> 
>> Jianxin Pan <jianxin.pan@amlogic.com> writes:
>> 
>>> Add support for the Amlogic Secure Power controller. In A1/C1 series, power
>>> control registers are in secure domain, and should be accessed by smc.
>>>
>>> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
>>> Signed-off-by: Zhiqiang Liang <zhiqiang.liang@amlogic.com>
>> 
>> Thanks for the new power domain driver.
>> 
>>> ---
>>>  drivers/soc/amlogic/Kconfig             |  13 +++
>>>  drivers/soc/amlogic/Makefile            |   1 +
>>>  drivers/soc/amlogic/meson-secure-pwrc.c | 182 ++++++++++++++++++++++++++++++++
>>>  3 files changed, 196 insertions(+)
>>>  create mode 100644 drivers/soc/amlogic/meson-secure-pwrc.c
>>>
>>> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
>>> index bc2c912..6cb06e7 100644
>>> --- a/drivers/soc/amlogic/Kconfig
>>> +++ b/drivers/soc/amlogic/Kconfig
>>> @@ -48,6 +48,19 @@ config MESON_EE_PM_DOMAINS
>>>  	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
>>>  	  Generic Power Domains.
>>>  
>>> +config MESON_SECURE_PM_DOMAINS
>>> +	bool "Amlogic Meson Secure Power Domains driver"
>>> +	depends on ARCH_MESON || COMPILE_TEST
>>> +	depends on PM && OF
>>> +	depends on HAVE_ARM_SMCCC
>>> +	default ARCH_MESON
>>> +	select PM_GENERIC_DOMAINS
>>> +	select PM_GENERIC_DOMAINS_OF
>>> +	help
>>> +	  Support for the power controller on Amlogic A1/C1 series.
>>> +	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
>>> +	  Power Domains.
>>> +
>>>  config MESON_MX_SOCINFO
>>>  	bool "Amlogic Meson MX SoC Information driver"
>>>  	depends on ARCH_MESON || COMPILE_TEST
>>> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
>>> index de79d044..7b8c5d3 100644
>>> --- a/drivers/soc/amlogic/Makefile
>>> +++ b/drivers/soc/amlogic/Makefile
>>> @@ -5,3 +5,4 @@ obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>>>  obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>>>  obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
>>>  obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
>>> +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
>>> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
>>> new file mode 100644
>>> index 00000000..00c7232
>>> --- /dev/null
>>> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
>>> @@ -0,0 +1,182 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> [...]
>>> +
>>> +static bool pwrc_secure_get_power(struct meson_secure_pwrc_domain *pwrc_domain)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +
>>> +	arm_smccc_smc(SMC_PWRC_GET, pwrc_domain->index, 0,
>>> +		      0, 0, 0, 0, 0, &res);
>>> +
>>> +	return res.a0 & 0x1;
>> 
>> Please use a #define with a readable name for this mask.
>> The return type of this smc is bool. I will remove 0x1 mask in next version. 
>
> Another question about smc:
> In this driver, no share memory is needed, and I use arm_smccc_smc() directly.
> Should I add secure-monitor = <&sm> in dtb and use meson_sm_call() from sm driver instead? 

Yes, that would be preferred.

>>> +}
>> 
>> What does the return value for this function mean?  Does true mean
>> "powered off" or "powered on">
> The return vaule for SMC_PWRC_GET :
> 0 -> power on
> 1 -> power off> See the rename I just did on the ee-pwrc driver:
>> https://lore.kernel.org/linux-amlogic/20190925213528.21515-2-khilman@kernel.org/
>> I will follow and rename to _is_off() in the next verson.
>>> +static int meson_secure_pwrc_off(struct generic_pm_domain *domain)
>>> +{
>>> +	struct arm_smccc_res res;
>>> +	struct meson_secure_pwrc_domain *pwrc_domain =
> [...]
>>> +
>>> +#define SEC_PD(__name, __flag)			\
>>> +{						\
>>> +	.name = #__name,			\
>>> +	.index = PWRC_##__name##_ID,		\
>>> +	.get_power = pwrc_secure_get_power,	\
>>> +	.flags = __flag,			\
>>> +}
>>> +
>>> +static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>>> +	SEC_PD(DSPA,	0),
>>> +	SEC_PD(DSPB,	0),
>>> +	SEC_PD(UART,	GENPD_FLAG_ALWAYS_ON),
>> 
>> This flag should only be used for domains where there are no linux
>> drivers.
>> 
>> Rather than using this flag, you need to add a 'power-domain' property
>> to the uart driver in DT, and then update the meson_uart driver to use
>> the runtime PM API so that the domain is enabled whenever the UART is in
>> use.
>
> PM_UART Power domain is shared by uart, msr, jtag and cec.
> Uart should keep working in BL31, after kernel suspend and before kernel resume.

OK.

>> 
>>> +	SEC_PD(DMC,	GENPD_FLAG_ALWAYS_ON),
>> 
>> Please explain the need for ALWAYS_ON.
>> 
> PM_DMC is used for DDR PHY ana/dig and DMC. 
> There is no linux drver for them, and it should be always on. 
>
> I will add comments for all these always on domains.

OK, thank you.


Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
