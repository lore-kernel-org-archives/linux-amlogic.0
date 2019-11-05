Return-Path: <SRS0=swgy=Y5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89D9CA9ED3
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Nov 2019 02:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C80B214D8
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Nov 2019 02:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TY39tArV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C80B214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Skx/+DLbo497u7IBFfDH860TFv3XmR7SuUQF14K1WHE=; b=TY39tArVCmz04w
	dBCEhlwNV6TKfniUlXo47iUtOllvzdMSOHqPAjWzeiyZppQI6/Uy7TKCrLwaKcKjH7NakUxyEHitJ
	/yX/zHaW0vTLcABtw8PMvm9PfLYPDwH1W4bey+tqgGvphbhlS1Gn8u1ezdDBDEWUOVtD9VIDxsmdE
	VSswrR4h99Qy5zBpbdVzOx2w7FIKzIosqo5/z1EiUli7tYWe0uZLqt8poI0mImVOHFai5ghtMb9Z7
	OS+RCx+E0U1PdVTZBHOkY8SIUyOMVVUWJo4HH2FD6erx+yhyOgtFP5bvZsgajTqWDQQxtS7Rc/yxg
	9iT+mRRssq6d9Bl1RjzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRokE-0007sh-WD; Tue, 05 Nov 2019 02:38:59 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRokC-0007rW-BG; Tue, 05 Nov 2019 02:38:58 +0000
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 5 Nov
 2019 10:39:04 +0800
Subject: Re: [PATCH v4 2/4] pinctrl: meson: add a new callback for SoCs fixup
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
References: <1572004167-24150-1-git-send-email-qianggui.song@amlogic.com>
 <1572004167-24150-3-git-send-email-qianggui.song@amlogic.com>
 <1jeeyo3wdg.fsf@starbuckisacylon.baylibre.com>
From: Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <25885aef-1ea6-600e-c022-6f0385d78559@amlogic.com>
Date: Tue, 5 Nov 2019 10:39:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1jeeyo3wdg.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_183856_389154_A493BD56 
X-CRM114-Status: GOOD (  18.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/11/4 15:59, Jerome Brunet wrote:
> 
> On Fri 25 Oct 2019 at 13:49, Qianggui Song <qianggui.song@amlogic.com> wrote:
> 
>> In meson_pinctrl_parse_dt, it contains two parts: reg parsing and
>> SoC relative fixup for AO. Several fixups in the same code make it hard
>> to maintain, so move all fixups to each SoC's callback and make
>> meson_pinctrl_parse_dt just do the reg parsing, separate these two
>> parts.Overview of all current Meson SoCs fixup is as below:
>>
>> +------+--------------------------------------+--------------------------+
>> |      |                                      |                          |
>> | SoC  |                EE domain             |        AO domain         |
>> +------+--------------------------------------+--------------------------+
>> |m8    | parse regs:                          | parse regs:              |
>> |m8b   |   gpio,mux,pull,pull-enable(skip ds) |    gpio,mux,pull(skip ds)|
>> |gxl   | fixup:                               | fixup:                   |
>> |gxbb  |   no                                 |     pull-enable = pull   |
>> |axg   |                                      |                          |
>> +------+--------------------------------------+--------------------------+
>> |g12a  | parse regs:                          | parse regs:              |
>> |sm1   |   gpio,mux,pull,pull-enable,ds       |   gpio,mux,ds            |
>> |      | fixup:                               | fixup:                   |
>> |      |   no                                 |   pull = gpio            |
>> |      |                                      |   pull-enable = gpio     |
>> +------+--------------------------------------+--------------------------+
>> |a1 or | parse regs:                                                     |
>> |later |  gpio/mux (without ao domain)                                   |
>> |SoCs  | fixup:                                                          |
>> |      |  pull=gpio; pull-enable=gpio; ds=gpio                           |
>> +------+-----------------------------------------------------------------+
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson-axg.c  | 11 +++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  9 +++++++++
>>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 11 +++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 11 +++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.c      |  9 +++++----
>>  drivers/pinctrl/meson/pinctrl-meson.h      |  3 +++
>>  drivers/pinctrl/meson/pinctrl-meson8.c     | 11 +++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson8b.c    | 11 +++++++++++
>>  8 files changed, 72 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> index ad502eda4afa..9c07f4423c37 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> @@ -1040,6 +1040,16 @@
>>  	.num_pmx_banks = ARRAY_SIZE(meson_axg_aobus_pmx_banks),
>>  };
>>  
>> +static int meson_axg_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>> +	return 0;
>> +}
>> +
>>  static struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
>>  	.name		= "periphs-banks",
>>  	.pins		= meson_axg_periphs_pins,
>> @@ -1066,6 +1076,7 @@
>>  	.num_banks	= ARRAY_SIZE(meson_axg_aobus_banks),
>>  	.pmx_ops	= &meson_axg_pmx_ops,
>>  	.pmx_data	= &meson_axg_aobus_pmx_banks_data,
>> +	.parse_dt	= meson_axg_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_axg_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> index 582665fd362a..41850e3c0091 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
>> @@ -1362,6 +1362,14 @@
>>  	.num_pmx_banks	= ARRAY_SIZE(meson_g12a_aobus_pmx_banks),
>>  };
>>  
>> +static int meson_g12a_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	pc->reg_pull = pc->reg_gpio;
>> +	pc->reg_pullen = pc->reg_gpio;
>> +
>> +	return 0;
>> +}
>> +
>>  static struct meson_pinctrl_data meson_g12a_periphs_pinctrl_data = {
>>  	.name		= "periphs-banks",
>>  	.pins		= meson_g12a_periphs_pins,
>> @@ -1388,6 +1396,7 @@
>>  	.num_banks	= ARRAY_SIZE(meson_g12a_aobus_banks),
>>  	.pmx_ops	= &meson_axg_pmx_ops,
>>  	.pmx_data	= &meson_g12a_aobus_pmx_banks_data,
>> +	.parse_dt	= meson_g12a_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_g12a_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>> index 5bfa56f3847e..f5494a948200 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>> @@ -827,6 +827,16 @@
>>  	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
>>  };
>>  
>> +static int meson_gxbb_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>> +	return 0;
>> +}
> 
> Can you share the definition of this function instead of repeating it ?
> 
Seems like this common function can only be placed in pinctrl-meson.c, I
will try to write a meson_aobus_parse_dt_extra in pinctrl-meson.c and
assign it to each SoCs  driver before g12a.
>> +
>>  static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
>>  	.name		= "periphs-banks",
>>  	.pins		= meson_gxbb_periphs_pins,
>> @@ -851,6 +861,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= meson_gxbb_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> index 72c5373c8dc1..943fb27dab08 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> @@ -796,6 +796,16 @@
>>  	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
>>  };
>>  
>> +static int meson_gxl_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>> +	return 0;
>> +}
> 
> Same
will do it for above and below other platform.
> 
>> +
>>  static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
>>  	.name		= "periphs-banks",
>>  	.pins		= meson_gxl_periphs_pins,
>> @@ -820,6 +830,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt 	= meson_gxl_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 8bba9d053d9f..e182583422a4 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -677,14 +677,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	}
>>  
>>  	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
>> -	/* Use gpio region if pull one is not present */
>>  	if (IS_ERR(pc->reg_pull))
>> -		pc->reg_pull = pc->reg_gpio;
>> +		pc->reg_pull = NULL;
> 
> Instead of doing this fixup, could modifhy meson_map_ressourse() to
> return NULL instead of -ENOENT ?
> 
> Then you should IS_ERR_OR_NULL() for "mux" and "gpio" and just IS_ERR()
> for the rest
> 
Ok, will modify this in the next patch set
>>  
>>  	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
>> -	/* Use pull region if pull-enable one is not present */
>>  	if (IS_ERR(pc->reg_pullen))
>> -		pc->reg_pullen = pc->reg_pull;
>> +		pc->reg_pullen = NULL;
>>  
>>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>>  	if (IS_ERR(pc->reg_ds)) {
>> @@ -692,6 +690,9 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  		pc->reg_ds = NULL;
>>  	}
>>  
>> +	if (pc->data->parse_dt)
>> +		return pc->data->parse_dt(pc);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..d570f7c53045 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>> @@ -11,6 +11,8 @@
>>  #include <linux/regmap.h>
>>  #include <linux/types.h>
>>  
>> +struct meson_pinctrl;
>> +
>>  /**
>>   * struct meson_pmx_group - a pinmux group
>>   *
>> @@ -114,6 +116,7 @@ struct meson_pinctrl_data {
>>  	unsigned int num_banks;
>>  	const struct pinmux_ops *pmx_ops;
>>  	void *pmx_data;
>> +	int (*parse_dt)(struct meson_pinctrl *pc);
>>  };
>>  
>>  struct meson_pinctrl {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
>> index 0b97befa6335..65c70c9b7070 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
>> @@ -1079,6 +1079,16 @@
>>  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0, 16,  0,  0,  0,  0,  0, 16,  1,  0),
>>  };
>>  
>> +static int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>> +	return 0;
>> +}
>> +
>>  static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
>>  	.name		= "cbus-banks",
>>  	.pins		= meson8_cbus_pins,
>> @@ -1103,6 +1113,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson8_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
>> index a7de388388e6..85dc12e0c839 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
>> @@ -938,6 +938,16 @@
>>  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
>>  };
>>  
>> +static int meson8b_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>> +	return 0;
>> +}
>> +
>>  static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
>>  	.name		= "cbus-banks",
>>  	.pins		= meson8b_cbus_pins,
>> @@ -962,6 +972,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= &meson8b_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson8b_pinctrl_dt_match[] = {
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
