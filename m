Return-Path: <SRS0=Dnil=YQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD1CA9EB6
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 12:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B458214B2
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Oct 2019 12:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+O+zqEY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B458214B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRO/TvkQPbrwG0V90MV4hkgQ0c7gBQmoonQfIbO4f1Q=; b=g+O+zqEYPh7h8g
	+ySdscYpAwvQOhCVpFzcM+Z7sqjKaj34FvOd6bx6XLQcSNp6bo9PfrJ38Svz8NPryDdcwx+tArHCv
	ki8p5p2DqyxQYXZl6KPuLD+z6saGcEIN1zT6ntLbhVbUa9vKtb0UsELkeAolTFYyCkbiyxjWJ+sbS
	YUtDquzbiBLIs8a6V6PsSfsLpkCCwdQxdhl0ulgxDZU6rLWz28FkshgNcJKuGE1ZP4ySlQndIOdyF
	OvQwwRIMHK6imBfjt/lUwoHImwf6X47OhNOQ2dXw6CPVXV4SzGTJAfb1015xKgiloivuExe0wTZtD
	nDRuyjyzn4Tyzkahj3WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNFsM-0001O0-ED; Wed, 23 Oct 2019 12:36:30 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNFpd-0006cH-WD; Wed, 23 Oct 2019 12:33:47 +0000
Received: from [10.28.18.45] (10.28.18.45) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 23 Oct
 2019 20:33:42 +0800
Subject: Re: [PATCH v3 2/4] pinctrl: meson: add a new dt parse callback for
 Meson-A series SoCs
To: Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
References: <1571050492-6598-1-git-send-email-qianggui.song@amlogic.com>
 <1571050492-6598-3-git-send-email-qianggui.song@amlogic.com>
 <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com>
From: Qianggui Song <qianggui.song@amlogic.com>
Message-ID: <4e4aa76e-d315-2b99-91f4-6667eb5221e7@amlogic.com>
Date: Wed, 23 Oct 2019 20:33:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1j4kzzvnrr.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.18.45]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_053342_065313_1298C1DE 
X-CRM114-Status: GOOD (  19.85  )
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



On 2019/10/23 17:01, Jerome Brunet wrote:
> 
> On Mon 14 Oct 2019 at 12:54, Qianggui Song <qianggui.song@amlogic.com> wrote:
> 
>> Meson A1 Soc share the same register layout of pinmux with previous
>> Meson-G12A, however there is difference for gpio and pin config register
>> in A1. The main difference is that registers before A1 are grouped by
>> function while those of A1 are by bank. The new register layout is as
>> below:
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
>> Each bank contains at least 6 registers to be configured, if one bank
>> has more than 16 gpios, an extra P_PADCTRL_GPIO[X]_DS_EXT is included.
>> Between two adjacent P_PADCTRL_GPIO[X]_I, there is an offset 0x10, that
>> is to say, for third bank, the offsets will be 0x20,0x21,0x22,0x23,0x24
>> ,0x25 according to above register layout. For previous chips, registers
>> are grouped according to their functions while registers of A1 are
>> according to bank.
>>
>> Current Meson pinctrl driver can cover such change by using base address
>> of GPIO as that of drive-strength.While simply giving reg_ds = reg_pullen
>> make wrong value to reg_ds for Socs that do not support drive-strength
>> like AXG.To make things simple, add an extra dt parser function for
>> a1 or later chip and remain the old dt parser function for old Socs.
>>
>> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
>> ---
>>  drivers/pinctrl/meson/pinctrl-meson.c | 16 +++++++++++++++-
>>  drivers/pinctrl/meson/pinctrl-meson.h |  7 +++++++
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
>> index 8bba9d053d9f..e8f6298fc96a 100644
>> --- a/drivers/pinctrl/meson/pinctrl-meson.c
>> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
>> @@ -695,6 +695,17 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>>  	return 0;
>>  }
>>  
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node)
> 
> This function is the fixup for the a1 family, AFAICT.
> It should be named as such and it belong in pinctrl-meson-a1.c
> 
> Every controller performing fixups should have their function as well:
>  (1) AO of gxbb, gxl and axg 
>  (2) AO of g12 and sm
> 
OK, Will try to move this function to pinctrl-meson-a1.c. That should be
better than rewriting parse function for each chips EE/AO alone.
>> +{
>> +	int ret;
>> +
>> +	ret = meson_pinctrl_parse_dt(pc, node);
> 
> As said in previous review,  meson_pinctrl_parse_dt() should be called
> for every SoC to parse the *available* regions.
> 
> The fixup, if necessary, will be done by providing a callback
> 
> IOW, please:
>  * rework meson_pinctrl_parse_dt() to only parse the avaialble region
>  * don't call meson_pinctrl_parse_dt() from the extra function
>  * provided the extra function for the AO controllers of the other SoCs
> 
That means I need to move not only ao fixup but ds to extra function for
old chips do not support this.But it will touch other Socs, should I do
this in A1 pinctrl patchset? or do this rework in another patchset.
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
> 
> 
> 
>>  		return ret;
>>  
>> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
>> index c696f3241a36..0cd6a869cae3 100644
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
>> +	int (*parse_dt)(struct meson_pinctrl *pc, struct device_node *node);
>>  };
>>  
>>  struct meson_pinctrl {
>> @@ -171,3 +174,7 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>>  
>>  /* Common probe function */
>>  int meson_pinctrl_probe(struct platform_device *pdev);
>> +
>> +/* Extra dt parse function for register layout grouped by bank */
>> +int meson_pinctrl_parse_dt_extra(struct meson_pinctrl *pc,
>> +				 struct device_node *node);
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
