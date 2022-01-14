Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F94BC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 03:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAYuhsg+E93510Qq9pZljzTKpms7Jgan3453KFEL18k=; b=wYqsv0/ooP2HFf
	BWehU+jZfv2Oze9Q1W2uEEbeenfNW9ap/HTwgLWGxd9cm8xWCijkNkEF/McvbyJ5NobJA5ot9CnLb
	3asCIyP52/y8IQbb8i9FWt0V/4hEuPqkucwb6Bbua1TiU6xJJGermOXkpm/KhD3d9NW2+sUuGMXU6
	lLqHXCzFy+gPIigpbaPjbuGLckwJLfYcBdqlPLLkLRFnoHeaqBFvX8TAPTF49nABOC90XIuu3/ER0
	ocF44l1pVVpPfsfO5dh4f2JuDQ/vghQLXeZL30KG30Rh8NUg2L1ZjgWM/Zicn2xhRVQBWOVJbNHbM
	zyxETP7fcxpImzLcLq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Cvx-007Z1C-7I; Fri, 14 Jan 2022 03:07:21 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Cvv-007Z0B-GF; Fri, 14 Jan 2022 03:07:20 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 14 Jan
 2022 11:07:17 +0800
Message-ID: <98619eef-8b51-c138-e98d-39fdbe4c9ebb@amlogic.com>
Date: Fri, 14 Jan 2022 11:07:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 1/4] clk: meson: add one based divider support for sclk
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao
 Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-2-liang.yang@amlogic.com>
 <20220113212801.E88BFC36AE3@smtp.kernel.org>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220113212801.E88BFC36AE3@smtp.kernel.org>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_190719_575174_9710A01D 
X-CRM114-Status: UNSURE (   6.59  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

On 2022/1/14 5:28, Stephen Boyd wrote:
> [ EXTERNAL EMAIL ]
> 
> Quoting Liang Yang (2022-01-13 03:57:42)
>> diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
>> index 76d31c0a3342..79c9efd28115 100644
>> --- a/drivers/clk/meson/sclk-div.c
>> +++ b/drivers/clk/meson/sclk-div.c
>> @@ -28,22 +29,39 @@ meson_sclk_div_data(struct clk_regmap *clk)
>>          return (struct meson_sclk_div_data *)clk->data;
>>   }
>>   
>> -static int sclk_div_maxval(struct meson_sclk_div_data *sclk)
>> +static inline int sclk_get_reg(int val, unsigned char flag)
>>   {
>> -       return (1 << sclk->div.width) - 1;
>> +       if ((flag & MESON_SCLK_ONE_BASED) || !val)
>> +               return val;
>> +       else
>> +               return val - 1;
> 
> Please drop the else
ok
> 
>> +}
>> +
>> +static inline int sclk_get_divider(int reg, unsigned char flag)
>> +{
>> +       if (flag & MESON_SCLK_ONE_BASED)
>> +               return reg;
>> +       else
> 
> Please drop the else
ok
> 
>> +               return reg + 1;
>>   }
>>   
>>   static int sclk_div_maxdiv(struct meson_sclk_div_data *sclk)
>>   {
>> -       return sclk_div_maxval(sclk) + 1;
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
