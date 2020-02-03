Return-Path: <SRS0=mDOd=3X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB8FC3524D
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2020 09:04:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D132920661
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2020 09:04:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YlkSojuu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D132920661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CZJqEUqPeF2lT+DafoWIjIMM2JlePvRTbFi7/qgnbq8=; b=YlkSojuu6luCq1xbXSEvidN+k
	219JrLetT4MfOf7sxfiadPhGgCDxeGkaaHbwB6EoWKfn/8UA4tfS2zngfxNUKbJtTqy/gSgp3hzir
	1/5cq5bwiTZhgkS3YrOFk9yEc2LVI5FvsT4pCJwKKrciSsedw0kEQ+egZbJVo/jITISKlpvOcVKF4
	L9KguNmuWF/VK4zVYHVxSJ2B6l2dgFVf+mULWA7GpaC3Y5DeCrPDJcgrZR1IDh+RTjWwJiCDWdLOT
	6VeuzdMMQSqc1iVF3ZhIXZ/HBox3V22oTx1L8p41mz4mjGoR+n4GFkT0azLnt7UezdFQhw3D9wa/b
	bWywjUUcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyXeL-0003wB-Qr; Mon, 03 Feb 2020 09:04:09 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyXeF-0003qU-4R; Mon, 03 Feb 2020 09:04:04 +0000
Received: from [10.7.0.4] (10.28.11.250) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Feb
 2020 17:04:25 +0800
Subject: Re: [PATCH v6 5/5] clk: meson: a1: add support for Amlogic A1
 Peripheral clock driver
To: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20200116080440.118679-1-jian.hu@amlogic.com>
 <20200116080440.118679-6-jian.hu@amlogic.com>
 <20200129054253.6F8CD2071E@mail.kernel.org>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <3e103a45-62d4-1a10-e4af-5a4c588162d6@amlogic.com>
Date: Mon, 3 Feb 2020 17:04:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200129054253.6F8CD2071E@mail.kernel.org>
Content-Language: en-US
X-Originating-IP: [10.28.11.250]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_010403_171950_31378AF9 
X-CRM114-Status: GOOD (  11.23  )
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
 Qiufang Dai <qiufang.dai@amlogic.com>, Chandle Zou <chandle.zou@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi, Stephen

Thanks for your review

On 2020/1/29 13:42, Stephen Boyd wrote:
> Quoting Jian Hu (2020-01-16 00:04:40)
>> diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
>> new file mode 100644
>> index 000000000000..2cf20ae1db75
>> --- /dev/null
>> +++ b/drivers/clk/meson/a1.c
>> @@ -0,0 +1,2249 @@
> [...]
>> +       &a1_ceca_32k_clkout,
>> +       &a1_cecb_32k_clkin,
>> +       &a1_cecb_32k_div,
>> +       &a1_cecb_32k_sel_pre,
>> +       &a1_cecb_32k_sel,
>> +       &a1_cecb_32k_clkout,
>> +};
>> +
>> +static struct regmap_config clkc_regmap_config = {
> 
> Can this be const?
OK, I will add const in next v8 version.
> 
>> +       .reg_bits       = 32,
>> +       .val_bits       = 32,
>> +       .reg_stride     = 4,
>> +};
>> +
>> +static int meson_a1_periphs_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct resource *res;
>> +       void __iomem *base;
>> +       struct regmap *map;
>> +       int ret, i;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +
>> +       base = devm_ioremap_resource(dev, res);
> 
> Can you use the combination function that does the get resource and
> ioremap in one function?
OK, I will use 'devm_platform_ioremap_resource' here.
> 
>> +       if (IS_ERR(base))
>> +               return PTR_ERR(base);
>> +
>> +       map = devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
>> +       if (IS_ERR(map))
>> +               return PTR_ERR(map);
>> +
>> +       /* Populate regmap for the regmap backed clocks */
> 
> Seems like a useless comment.
OK, I will remove it.
> 
>> +       for (i = 0; i < ARRAY_SIZE(a1_periphs_regmaps); i++)
>> +               a1_periphs_regmaps[i]->map = map;
>> +
> 
The same with a1-pll.c file, I will modify, too.
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
