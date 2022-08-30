Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30853ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Aug 2022 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k8SUkxfb4H4Y4YZdVETDjnhhtfVtl6GiG9FpMvcUYo=; b=3Vk5Mr7SPEOugR
	4SpxsIBgrzDWmV588RqK/RxADelCxon/dUC51bz0b1E7c5JdoT7GAx1rn0pRUGJPgElfVHYP86hj1
	cO9c3Hv32+rxHLqptTzzpx2NTtdkKd+ctsY3n5j4MOjntu65sw//Zjhg4vS/1JenngZsoP7FSsM8q
	UMtbAnQnb5gpEHkUY2+a+8WbMWQ7d/icLaZamjZxG50omcQtdA5xW+1VOh/pJ2h9K3If66sCR40WX
	UJu2YIZH2HWLCkNyWJjH5bJ7Zu/3EcHgVgLq6V01A8DjzkQicSdtbTocTEKZzLSZy03MZjsQHla7J
	4zPzduaNBmEmyLwk//XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuoa-00ERxn-LQ; Tue, 30 Aug 2022 06:33:36 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSuoX-00ERvh-CB; Tue, 30 Aug 2022 06:33:34 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 14:33:30 +0800
Message-ID: <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
Date: Tue, 30 Aug 2022 14:33:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from vendor
 driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jianxin Pan <jianxin.pan@amlogic.com>
CC: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_233333_442750_D2827A99 
X-CRM114-Status: GOOD (  13.46  )
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



On 2022/8/29 17:54, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> On a S905X4-based system this call fails randomly.
>> The vendor driver has a retry mechanism and on my system
>> the second attempt is successful always.
>>
> 
> This reason looks a bit weak to me.
> I'd like AML team to comment on this PLL problem as I suspect it might
> relate to other PLL we have been seeing

First of all, we've had this problem before. But the probability is very 
low, most of the PLL will not lock when the chip is tested at high and 
low temperature.

Our actual code has retry mechanism to solve the above problem.

> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/clk/meson/clk-pll.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index 9e55617bc..daa025b6d 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>   
>>   static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>>   {
>> -	meson_clk_pll_init(hw);
>> +	int retries = 10;
>>   
>> -	if (meson_clk_pll_wait_lock(hw))
>> -		return -EIO;
>> +	do {
>> +		meson_clk_pll_init(hw);
>> +		if (!meson_clk_pll_wait_lock(hw))
>> +			return 0;
>> +		pr_info("Retry enabling PCIe PLL clock\n");
>> +	} while (--retries);
>>   
>> -	return 0;
>> +	return -EIO;
>>   }
>>   
>>   static int meson_clk_pll_enable(struct clk_hw *hw)
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
