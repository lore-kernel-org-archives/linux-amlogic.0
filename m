Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E0DC10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 12:03:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EFB520650
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 12:03:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G2y+YkyS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EFB520650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhFgdYoHv6XA7ZU3SeKGjs3VvPxAvd3PVwkgGpbhGBE=; b=G2y+YkyS5qVzgn
	YCM2kyjdue8LBaqe78YhdJYV0jfnTJ1+PLNHdILq4usPb5kBWMYJyKN5V8TatLDD++duLbqZoZDS0
	gboGREkT9ue1WjosyRZZjuvzGdnqXYIgbZ0H89/tpuXXxZ26Nf7KVln+/xZ36o3xFaU1wMH5KkHYn
	iGiRzo51VK8mXQVgjnbA5Er0gL822athEY4wk683BU9taIDWpiXd+LWjZNrSrcNMjKGwVdfCQXZ1h
	/KJ2mvcOepZdUvshhAGBse2W7/Dtaynl1QGswSfiOpX5AO4ARUd81gG4eqf6kmtcVAPEdEt5b+2C8
	iqLvJquDnL4ztcZk6b5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIX9f-0005pW-B2; Thu, 10 Oct 2019 12:02:51 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIX9c-0005om-4n; Thu, 10 Oct 2019 12:02:49 +0000
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 10 Oct
 2019 20:02:43 +0800
Subject: Re: [PATCH v2 2/3] pinctrl: meson-a1: add pinctrl driver for Meson A1
 Soc
To: Neil Armstrong <narmstrong@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
References: <1570532999-23302-1-git-send-email-qianggui.song@amlogic.com>
 <1570532999-23302-3-git-send-email-qianggui.song@amlogic.com>
 <cca24aa5-07dc-f2d6-885a-09bc8e20b3b6@baylibre.com>
From: Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <a41f0685-a42c-b21c-d0be-e0e1c3ae7c8f@amlogic.com>
Date: Thu, 10 Oct 2019 20:02:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cca24aa5-07dc-f2d6-885a-09bc8e20b3b6@baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_050248_190791_B04A522F 
X-CRM114-Status: GOOD (  17.64  )
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

Hi,Neil

On 2019/10/8 21:07, Neil Armstrong wrote:
> Hi,
> 
> On 08/10/2019 13:09, Qianggui Song wrote:
>> Add pinctrl driver for Meson A1 Soc which share the same register layout of
>> pinmux with previous Meson-G12A, however there is difference for gpio
>> and pin config register in A1.The main difference is that registers before A1
>> are grouped by function while those of A1 are by bank. The new register layout
>> is as below:
>>
>> /* first bank */	      /* addr */
>> - P_PADCTRL_GPIOP_I         base + 0x00 << 2
>> - P_PADCTRL_GPIOP_O         base + 0x01 << 2
>> - P_PADCTRL_GPIOP_OEN       base + 0x02 << 2
>> - P_PADCTRL_GPIOP_PULL_EN   base + 0x03 << 2
>> - P_PADCTRL_GPIOP_PULL_UP   base + 0x04 << 2
>> - P_PADCTRL_GPIOP_DS        base + 0x05 << 2
>>
>> /* second bank */
>> - P_PADCTRL_GPIOB_I         base + 0x10 << 2
>> - P_PADCTRL_GPIOB_O         base + 0x11 << 2
>> - P_PADCTRL_GPIOB_OEN       base + 0x12 << 2
>> - P_PADCTRL_GPIOB_PULL_EN   base + 0x13 << 2
>> - P_PADCTRL_GPIOB_PULL_UP   base + 0x14 << 2
>> - P_PADCTRL_GPIOB_DS        base + 0x15 << 2
>>
>> Each bank contains at least 6 registers to be configured, if one bank has
>> more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included. Between
>> two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that is to say,
>> for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24,0x25 according
>> to above register layout.For privous chips, registers are grouped
>> according to their functions while registers of A1 are according to bank.
>>
>> Current Meson pinctrl driver can cover such change by using base address of
>> GPIO as that of drive-strength. While simply giving reg_ds = reg_pullen
>> make wrong value to reg_ds for Socs that do not support drive-strength like
>> AXG.To make things simple, add an extra dt parser function for a1 or later chip
>> and remain the old dt parser function for old Socs.
>>
>> Also note that there is no AO bank in A1.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/Kconfig            |   6 +
>>  drivers/pinctrl/meson/Makefile           |   1 +
>>  drivers/pinctrl/meson/pinctrl-meson-a1.c | 942 +++++++++++++++++++++++++++++++
>>  drivers/pinctrl/meson/pinctrl-meson.c    |  16 +-
>>  drivers/pinctrl/meson/pinctrl-meson.h    |   5 +
>>  5 files changed, 969 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/pinctrl/meson/pinctrl-meson-a1.c
>>
> 
> [...]
> 
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	return 0;
>>  }
>>  
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node)
>> +{
>> +	int ret;
>> +
>> +	ret = meson_pinctrl_parse_dt(pc, node);
>> +	pc->reg_ds = pc->reg_pullen;
>> +
>> +	return ret;
>> +}
>> +
>>  int meson_pinctrl_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -708,7 +719,10 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>>  	pc->dev = dev;
>>  	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
>>  
>> -	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
>> +	if (pc->data->parse_dt)
>> +		ret = pc->data->parse_dt(pc, dev->of_node);
>> +	else
>> +		ret = meson_pinctrl_parse_dt(pc, dev->of_node);
>>  	if (ret)
>>  		return ret;
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..ca29efd90aac 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.h
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
>> @@ -11,6 +11,7 @@
>>  #include <linux/regmap.h>
>>  #include <linux/types.h>
>>  
>> +struct meson_pinctrl;
>>  /**
>>   * struct meson_pmx_group - a pinmux group
>>   *
>> @@ -114,6 +115,7 @@ struct meson_pinctrl_data {
>>  	unsigned int num_banks;
>>  	const struct pinmux_ops *pmx_ops;
>>  	void *pmx_data;
>> +	int (*parse_dt) (struct meson_pinctrl *pc, struct device_node *node);
>>  };
>>  
>>  struct meson_pinctrl {
>> @@ -171,3 +173,6 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>>  
>>  /* Common probe function */
>>  int meson_pinctrl_probe(struct platform_device *pdev);
>> +/* Extra dt parser function for register layout grouped by bank */
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node);
>>
> 
> I think you should add this parse_dt callback in a separate patch.
> 
> Neil
> 
> .
> 
OK, will do it in the next patch set.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
