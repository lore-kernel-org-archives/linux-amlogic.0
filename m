Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E90CC636D3
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Jan 2023 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wU47KaJkSCuta6P/uZbHupoM0dbGeGFOjtpNqiPm88Q=; b=BCpdFdaeEj800l
	kWAav+e+7Az5jkHW+C268L6c85CaO/R/gC+V8lmfnGzPDYUkSOQF23FzPjlRn4p5cwvFNsTcKo/eU
	lrrlm9etip/dAHHf1swmrceFDqyEFWy6NK2JaJfdx9OqkU/lXuC8Jt/pjgQNcyhgIFzeg7Yqn4Gw6
	Z5sX/jm26i6wskVGUJPfMKyCzf0YurPQgWHN1f67wPrQjJUFRc8HtbRG1IgQ/uHNL8Vikk80GcHXE
	ASjw/tzsjJ/9pJE1sKINPVsxaVZtJtBC0fKi7FTd9vtG+3AolzNEjtc5wsnB8Wcs6Swexz1+0gPun
	q484vCZju+XXO4LQoBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMhKk-006AZc-UC; Tue, 31 Jan 2023 03:29:22 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMhKa-006AXi-Cb; Tue, 31 Jan 2023 03:29:13 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Tue, 31 Jan
 2023 11:29:04 +0800
Message-ID: <ad1f6ea5-f506-22f7-1f88-0291167fb7fd@amlogic.com>
Date: Tue, 31 Jan 2023 11:29:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 3/3] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
	<qi.duan@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-4-yu.tu@amlogic.com>
 <1ja62eybrv.fsf@starbuckisacylon.baylibre.com>
 <aedb0764-b5cb-7f49-f279-51dbec070e80@amlogic.com>
 <1jwn5hwn0w.fsf@starbuckisacylon.baylibre.com>
 <a4ad6ac6-60c2-8f7b-fdb0-509de31db282@amlogic.com>
 <1jy1pko0fc.fsf@starbuckisacylon.baylibre.com>
 <e2e9045a-6e35-112f-69a7-15b080571b69@amlogic.com>
 <1jr0vcnyf7.fsf@starbuckisacylon.baylibre.com>
 <37e5d1a9-9379-a7ff-e288-9a4b80a0cc5f@amlogic.com>
 <1jmt60nxa7.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jmt60nxa7.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_192912_464256_611BB613 
X-CRM114-Status: GOOD (  23.90  )
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



On 2023/1/30 18:07, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Mon 30 Jan 2023 at 17:59, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> On 2023/1/30 17:47, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>> On Mon 30 Jan 2023 at 17:41, Yu Tu <yu.tu@amlogic.com> wrote:
>>>
>>>> On 2023/1/30 17:06, Jerome Brunet wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>> On Sat 28 Jan 2023 at 18:17, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>
>>>>>> On 2023/1/20 17:47, Jerome Brunet wrote:
>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>> On Fri 20 Jan 2023 at 11:33, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>>>
>>>>>>>> Hi
>>>>>>>> On 2023/1/19 19:37, Jerome Brunet wrote:
>>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>>>>>
>>>>>>>>>> Add the peripherals clock controller driver in the s4 SoC family.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>>>>>> [...]
>>>>>>>>>
>>>>>>>>>> +
>>>>>>>>>> +/* Video Clocks */
>>>>>>>>>> +static struct clk_regmap s4_vid_pll_div = {
>>>>>>>>>> +	.data = &(struct meson_vid_pll_div_data){
>>>>>>>>>> +		.val = {
>>>>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>>>>> +			.shift   = 0,
>>>>>>>>>> +			.width   = 15,
>>>>>>>>>> +		},
>>>>>>>>>> +		.sel = {
>>>>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>>>>> +			.shift   = 16,
>>>>>>>>>> +			.width   = 2,
>>>>>>>>>> +		},
>>>>>>>>>> +	},
>>>>>>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>>>>>>> +		.name = "vid_pll_div",
>>>>>>>>>> +		/*
>>>>>>>>>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>>>>>>>>>> +		 * clock is the default value of this register. When designing the
>>>>>>>>>> +		 * video module of the chip, a default value that can meet the
>>>>>>>>>> +		 * requirements of the video module will be solidified according
>>>>>>>>>> +		 * to the usage requirements of the chip, so as to facilitate chip
>>>>>>>>>> +		 * simulation. So this is ro_ops.
>>>>>>>>>> +		 * It is important to note that this clock is not used on this
>>>>>>>>>> +		 * chip and is described only for the integrity of the clock tree.
>>>>>>>>>> +		 */
>>>>>>>>> If it is reset value and will be applicable to all the design, regarless
>>>>>>>>> of the use-case, then yes RO ops is OK
>>>>>>>>>
>>>>>>>>> >From what I understand here, the value will depend on the use-case requirements.
>>>>>>>>> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.
>>>>>>>>
>>>>>>>> Check the previous chip history, the actual scene is not used at all,
>>>>>>>> basically is used in simulation. So the previous SOC was "ro_ops" without
>>>>>>>> any problems.  This S4 SOC is not actually useful either.
>>>>>>>>
>>>>>>>> So when you were upstream, you had no problem making "ro_ops". I wonder if
>>>>>>>> I could delete this useless clock, so you don't have to worry about it.
>>>>>>> I don't know what to make of this. What is the point of adding a useless
>>>>>>> clock ?
>>>>>>
>>>>>> As explained earlier this "vid_pll_div" is actually used in chip
>>>>>> emulation. So next I'd like to know what you suggest to do with the clock?
>>>>>>
>>>>> If it does not exist in the actual SoC, please remove it
>>>>>
>>>>
>>>> If I remove it, the "vid_pll_sel" clock will be missing a parent
>>>> (vid_pll_div). I will use the table method and give the above reasons. Do
>>>> you accept this method?
>>> Either the clock exists or it does not.
>>> If the HW actually exist, it is expected to be properly described.
>>> If it does not, it obviously cannot be an input to another clock.
>>> Please sort this out and make the necessary changes.
>>>
>>
>> The CLKCTRL_VID_PLL_CLK_DIV register is actually described, but it is not
>> used in the actual board. According to your reply just now, description is
>> required, but I want to know how to describe it to meet your requirements.
>>
>> Please give me some suggestions.
> 
> Implementing things is NOT about usage, it is about correctness.
> Either there is actually a clock in the silicon you are producing at the
> Amlogic factory, or there is not.
> 
> If the clock is there in the actual HW should be properly
> described/implemented, as it "might" be used as an input to other clocks
> - even if you personnaly don't.
> 
> If clock does not exists (nothing behind the registers, or broken, etc
> ...)  then, yes you'll need to use parent tables and document this.
> 

According to your suggestion, we need to describe the clock 
(vid_pll_div).So it seems like we need to implement 
"meson_vid_pll_div_ops" and do a commit first. Then submit the S4 SOC 
clock driver. So change whether you take it or not?

Or if you have a better idea, let me know.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
