Return-Path: <SRS0=GSYe=ZD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5BFC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 06:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7AF214E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Nov 2019 06:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gU96R7MR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7AF214E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ve3y3Scsrj/ZuHGnI62b8BykReSkcUgKdKIn09SCfV8=; b=gU96R7MR0WyfzM
	rQYhA/OuoQ+tp1NHtorVP2l8APCcvKWC5Ot/xZSfW3J6tGSyLKSSROKVmPRxUHzyFVzhNNHMeEeEW
	/rbjtiMJE34aBj7MuxxEK4TVpuYcowGU5FqC6oGL+bNi54aCYHYLgy4AaDL/09CQ8WWkD9Nmrusgo
	GyyajFSeOQYlhd5ViMVnJE3Msi8ofWRMq2uCb6SNyKABSJN60wNy29QV5iDT1Uk7CNORTQxncRbj4
	shxCLxOFJYXZpHYUb9DQJ7mjeK1iDESPfB4TB+TZf5+xOZeR1e2N17UatCFAeBjgdkhFbuce3uPgX
	BcjXxG3g+lhlI8Cdyi+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU3Qw-0005Ca-LR; Mon, 11 Nov 2019 06:44:18 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU3Qt-0005Bc-Jp; Mon, 11 Nov 2019 06:44:17 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 11 Nov
 2019 14:44:28 +0800
Subject: Re: [PATCH v5 1/3] pinctrl: meson: add a new callback for SoCs fixup
To: Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
References: <1573203636-7436-1-git-send-email-qianggui.song@amlogic.com>
 <1573203636-7436-2-git-send-email-qianggui.song@amlogic.com>
 <54809378-d4b0-2013-eb22-d6570eff2a8c@baylibre.com>
From: Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <ce76e0e0-62b4-ca89-5d56-982b021af72c@amlogic.com>
Date: Mon, 11 Nov 2019 14:44:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <54809378-d4b0-2013-eb22-d6570eff2a8c@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_224415_659414_0E901506 
X-CRM114-Status: GOOD (  17.49  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Xingyu Chen <xingyu.chen@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/11/8 20:50, Neil Armstrong wrote:
> Hi,
> 
> On 08/11/2019 10:00, Qianggui Song wrote:
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
>> |gxbb  |   no                                 |     pull-enable = pull;  |
>> |axg   |                                      |                          |
>> +------+--------------------------------------+--------------------------+
>> |g12a  | parse regs:                          | parse regs:              |
>> |sm1   |   gpio,mux,pull,pull-enable,ds       |   gpio,mux,ds            |
>> |      | fixup:                               | fixup:                   |
>> |      |   no                                 |   pull = gpio;           |
>> |      |                                      |   pull-enable = gpio;    |
>> +------+--------------------------------------+--------------------------+
>> |a1 or | parse regs:                                                     |
>> |later |  gpio/mux (without ao domain)                                   |
>> |SoCs  | fixup:                                                          |
>> |      |  pull = gpio; pull-enable = gpio; ds = gpio;                    |
>> +------+-----------------------------------------------------------------+
>> Since m8-axg share the same ao fixup, make a common function
>> meson8_aobus_parse_dt_extra to do the job.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson-axg.c  |  1 +
>>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  9 +++++++++
>>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  1 +
>>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  1 +
>>  drivers/pinctrl/meson/pinctrl-meson.c      | 25 ++++++++++++++++++-------
>>  drivers/pinctrl/meson/pinctrl-meson.h      |  5 +++++
>>  drivers/pinctrl/meson/pinctrl-meson8.c     |  1 +
>>  drivers/pinctrl/meson/pinctrl-meson8b.c    |  1 +
>>  8 files changed, 37 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> index ad502eda4afa..072765db93d7 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
>> @@ -1066,6 +1066,7 @@
>>  	.num_banks	= ARRAY_SIZE(meson_axg_aobus_banks),
>>  	.pmx_ops	= &meson_axg_pmx_ops,
>>  	.pmx_data	= &meson_axg_aobus_pmx_banks_data,
>> +	.parse_dt	= meson8_aobus_parse_dt_extra,
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
>> index 5bfa56f3847e..926b9997159a 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
>> @@ -851,6 +851,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= meson8_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> index 72c5373c8dc1..8b1a49f5da43 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
>> @@ -820,6 +820,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt 	= meson8_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 8bba9d053d9f..a812c6d986d9 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -625,7 +625,7 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
>>  
>>  	i = of_property_match_string(node, "reg-names", name);
>>  	if (of_address_to_resource(node, i, &res))
>> -		return ERR_PTR(-ENOENT);
>> +		return NULL;
>>  
>>  	base = devm_ioremap_resource(pc->dev, &res);
>>  	if (IS_ERR(base))
>> @@ -665,26 +665,24 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	pc->of_node = gpio_np;
>>  
>>  	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
>> -	if (IS_ERR(pc->reg_mux)) {
>> +	if (IS_ERR_OR_NULL(pc->reg_mux)) {
>>  		dev_err(pc->dev, "mux registers not found\n");
>>  		return PTR_ERR(pc->reg_mux);
> 
> If pc->reg_mux is NULL, it will return "0" here, which is wrong.
> 
> Either keep the return ERR_PTR(-ENOENT); in meson_map_resource, or
> 	return pc->reg_mux ? -ENOENT : PTR_ERR(pc->reg_mux);
> 
 Thanks. ERR_PTR(-ENOENT) to NULL make below region easy to handle, I
will change to "return pc->reg_mux ? -ENOENT : PTR_ERR(pc->reg_mux);"

>>  	}
>>  
>>  	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
>> -	if (IS_ERR(pc->reg_gpio)) {
>> +	if (IS_ERR_OR_NULL(pc->reg_gpio)) {
>>  		dev_err(pc->dev, "gpio registers not found\n");
>>  		return PTR_ERR(pc->reg_gpio);
> 
> Ditto
will do as above.
> 
>>  	}
>>  
>>  	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
>> -	/* Use gpio region if pull one is not present */
>>  	if (IS_ERR(pc->reg_pull))
>> -		pc->reg_pull = pc->reg_gpio;
>> +		pc->reg_pull = NULL;
>>  
>>  	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
>> -	/* Use pull region if pull-enable one is not present */
>>  	if (IS_ERR(pc->reg_pullen))
>> -		pc->reg_pullen = pc->reg_pull;
>> +		pc->reg_pullen = NULL;
>>  
>>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>>  	if (IS_ERR(pc->reg_ds)) {
>> @@ -692,6 +690,19 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  		pc->reg_ds = NULL;
>>  	}
>>  
>> +	if (pc->data->parse_dt)
>> +		return pc->data->parse_dt(pc);
>> +
>> +	return 0;
>> +}
>> +
>> +int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
>> +{
>> +	if (!pc->reg_pull)
>> +		return -EINVAL;
>> +
>> +	pc->reg_pullen = pc->reg_pull;
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..bfa1d3599333 100644
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
>> @@ -171,3 +174,5 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>>  
>>  /* Common probe function */
>>  int meson_pinctrl_probe(struct platform_device *pdev);
>> +/* Common ao groups extra dt parse function for SoCs before g12a  */
>> +int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc);
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
>> index 0b97befa6335..dd17100efdcf 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
>> @@ -1103,6 +1103,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson8_pinctrl_dt_match[] = {
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
>> index a7de388388e6..2d5339edd0b7 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
>> @@ -962,6 +962,7 @@
>>  	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
>>  	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
>>  	.pmx_ops	= &meson8_pmx_ops,
>> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>>  };
>>  
>>  static const struct of_device_id meson8b_pinctrl_dt_match[] = {
>>
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
