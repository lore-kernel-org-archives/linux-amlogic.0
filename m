Return-Path: <SRS0=0C1t=2H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E14C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Dec 2019 09:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44AFF207FF
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Dec 2019 09:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btCP15hL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44AFF207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gCmuGeXC/fFGCrlwQM7/sD7dOIIw6YNO8P8U47Iwn1w=; b=btCP15hLETZxt6K4rccFoG28m
	sI/tccKjSLauR+THKEgmPr1ee2m0xB2eaUSEF5QZaX4o9bVMQd2Zy7SLwjzBaKR+357L/WFZVKZsK
	BtHDTbt8ZYajG7q/mvH5zEbJEJZSSz+EuSm5xabD0ps62il/AQK9aNYiU0600heVBcxmkpWyinXYm
	d2GB5gEp56MEfyYK4SoCgLg081lB77IoLVczbjhcfC4w9+0o7hfNOXynU2DB/YOVcFmreaJBDj86Y
	Nc/Ne2xMTXCwqQA0F0tLNWsQpsFhcAKXdTQhBJbmtIT0zRvmc/J1dWLY/bT0AehWLvyNhEwGljTMf
	Lz6uDK4hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih9Gm-0007Cq-7s; Tue, 17 Dec 2019 09:35:56 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih9GZ-00072F-CR; Tue, 17 Dec 2019 09:35:44 +0000
Received: from [10.28.39.99] (10.28.39.99) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 17 Dec
 2019 17:36:17 +0800
Subject: Re: [PATCH v4 3/6] clk: meson: eeclk: refactor eeclk common driver to
 support A1
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <20191206074052.15557-1-jian.hu@amlogic.com>
 <20191206074052.15557-4-jian.hu@amlogic.com>
 <1j7e31lub4.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <4cb9088c-bacb-ea3b-df43-103ce8902376@amlogic.com>
Date: Tue, 17 Dec 2019 17:36:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1j7e31lub4.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.99]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_013543_424062_FD456B31 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/12/12 18:19, Jerome Brunet wrote:
> 
> On Fri 06 Dec 2019 at 08:40, Jian Hu <jian.hu@amlogic.com> wrote:
> 
>> Introduce a common probe function for A1 series, the way to get
>> regmap is different between A1 series and the previous series.
>> The register region is only for one clock driver, the function of
>> meson_eeclkc_probe is not fit for A1, So it is necessary to
>> introduce a new function.
> 
> Please drop this patch
> 
> #1 you are patching the EE driver for something that is no longer an EE
>   driver
> #2 Let's get the basics right, you can move (re)factoring afterward
> 
> Your probe function is simple enough. Just properly write it in each
> driver for now.
OK, I will realize it in each driver.
> 
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/meson-eeclk.c | 59 +++++++++++++++++++++++++++------
>>   drivers/clk/meson/meson-eeclk.h |  1 +
>>   2 files changed, 50 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
>> index a7cb1e7aedc4..12ceb1caabd8 100644
>> --- a/drivers/clk/meson/meson-eeclk.c
>> +++ b/drivers/clk/meson/meson-eeclk.c
>> @@ -13,25 +13,37 @@
>>   #include "clk-regmap.h"
>>   #include "meson-eeclk.h"
>>   
>> -int meson_eeclkc_probe(struct platform_device *pdev)
>> +static struct regmap_config clkc_regmap_config = {
>> +	.reg_bits       = 32,
>> +	.val_bits       = 32,
>> +	.reg_stride     = 4,
>> +};
>> +
>> +static struct regmap *meson_regmap_resource(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	void __iomem *base;
>> +	struct device *dev = &pdev->dev;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +	base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(base))
>> +		return ERR_CAST(base);
>> +
>> +	return devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
>> +}
>> +
>> +static int meson_common_probe(struct platform_device *pdev, struct regmap *map)
>>   {
>>   	const struct meson_eeclkc_data *data;
>>   	struct device *dev = &pdev->dev;
>> -	struct regmap *map;
>>   	int ret, i;
>>   
>>   	data = of_device_get_match_data(dev);
>>   	if (!data)
>>   		return -EINVAL;
>>   
>> -	/* Get the hhi system controller node */
>> -	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
>> -	if (IS_ERR(map)) {
>> -		dev_err(dev,
>> -			"failed to get HHI regmap\n");
>> -		return PTR_ERR(map);
>> -	}
>> -
>>   	if (data->init_count)
>>   		regmap_multi_reg_write(map, data->init_regs, data->init_count);
>>   
>> @@ -54,3 +66,30 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>>   	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>>   					   data->hw_onecell_data);
>>   }
>> +
>> +int meson_eeclkc_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct regmap *map;
>> +
>> +	/* Get the hhi system controller node */
>> +	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
>> +	if (IS_ERR(map)) {
>> +		dev_err(dev,
>> +			"failed to get HHI regmap\n");
>> +		return PTR_ERR(map);
>> +	}
>> +
>> +	return meson_common_probe(pdev, map);
>> +}
>> +
>> +int meson_clkc_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *map;
>> +
>> +	map = meson_regmap_resource(pdev);
>> +	if (IS_ERR(map))
>> +		return PTR_ERR(map);
>> +
>> +	return meson_common_probe(pdev, map);
>> +}
>> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
>> index 77316207bde1..a2e9ab3a4f6b 100644
>> --- a/drivers/clk/meson/meson-eeclk.h
>> +++ b/drivers/clk/meson/meson-eeclk.h
>> @@ -21,5 +21,6 @@ struct meson_eeclkc_data {
>>   };
>>   
>>   int meson_eeclkc_probe(struct platform_device *pdev);
>> +int meson_clkc_probe(struct platform_device *pdev);
>>   
>>   #endif /* __MESON_CLKC_H */
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
