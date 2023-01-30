Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED003C54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfOH4R8dI4ytUAf+GFi75UbTp1N+O/jBAdcHBZ/MDKE=; b=TofLv72yC/QN8p
	eNMmKkp+Uimr4XSuJ8Vutkv6l8ecUwy0q82TGzgEnCBZ3Ux+FmXQhPZqsXSA8wkbWbDDh1NHPckIr
	XlnHcRo/435pONk4eqYoYVvjb44iizL0BF9afxEdK6JC5t/q3LE0IA/vYhZFMyKDDPWcSQtDTmWns
	ruAECPUN1jMqhbQX2q45hm8GSKggbpb7qTmYPLpEzBKt6/aS3ZMKY/CQpy/VeF6m+EO4TzxHI3zbI
	9X8vrj6+dmvtA/HTyrrExO8pGc9N8Wzv0l+QDsJ7/nVD908fXXup5QknvsNGQvGToLkpSOmSiyr+Y
	Plc9RF2SwHBzwCl6NQ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQg5-002wdF-74; Mon, 30 Jan 2023 09:42:17 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQfD-002wLR-C8; Mon, 30 Jan 2023 09:41:24 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Mon, 30 Jan
 2023 17:41:14 +0800
Message-ID: <e2e9045a-6e35-112f-69a7-15b080571b69@amlogic.com>
Date: Mon, 30 Jan 2023 17:41:14 +0800
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
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jy1pko0fc.fsf@starbuckisacylon.baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_014123_457554_9128BF6B 
X-CRM114-Status: GOOD (  16.95  )
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



On 2023/1/30 17:06, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Sat 28 Jan 2023 at 18:17, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> On 2023/1/20 17:47, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>> On Fri 20 Jan 2023 at 11:33, Yu Tu <yu.tu@amlogic.com> wrote:
>>>
>>>> Hi
>>>> On 2023/1/19 19:37, Jerome Brunet wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>
>>>>>> Add the peripherals clock controller driver in the s4 SoC family.
>>>>>>
>>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>> [...]
>>>>>
>>>>>> +
>>>>>> +/* Video Clocks */
>>>>>> +static struct clk_regmap s4_vid_pll_div = {
>>>>>> +	.data = &(struct meson_vid_pll_div_data){
>>>>>> +		.val = {
>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>> +			.shift   = 0,
>>>>>> +			.width   = 15,
>>>>>> +		},
>>>>>> +		.sel = {
>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>> +			.shift   = 16,
>>>>>> +			.width   = 2,
>>>>>> +		},
>>>>>> +	},
>>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>>> +		.name = "vid_pll_div",
>>>>>> +		/*
>>>>>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>>>>>> +		 * clock is the default value of this register. When designing the
>>>>>> +		 * video module of the chip, a default value that can meet the
>>>>>> +		 * requirements of the video module will be solidified according
>>>>>> +		 * to the usage requirements of the chip, so as to facilitate chip
>>>>>> +		 * simulation. So this is ro_ops.
>>>>>> +		 * It is important to note that this clock is not used on this
>>>>>> +		 * chip and is described only for the integrity of the clock tree.
>>>>>> +		 */
>>>>> If it is reset value and will be applicable to all the design, regarless
>>>>> of the use-case, then yes RO ops is OK
>>>>>
>>>>> >From what I understand here, the value will depend on the use-case requirements.
>>>>> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.
>>>>
>>>> Check the previous chip history, the actual scene is not used at all,
>>>> basically is used in simulation. So the previous SOC was "ro_ops" without
>>>> any problems.  This S4 SOC is not actually useful either.
>>>>
>>>> So when you were upstream, you had no problem making "ro_ops". I wonder if
>>>> I could delete this useless clock, so you don't have to worry about it.
>>> I don't know what to make of this. What is the point of adding a useless
>>> clock ?
>>
>> As explained earlier this "vid_pll_div" is actually used in chip
>> emulation. So next I'd like to know what you suggest to do with the clock?
>>
> 
> If it does not exist in the actual SoC, please remove it
> 

If I remove it, the "vid_pll_sel" clock will be missing a parent 
(vid_pll_div). I will use the table method and give the above reasons. 
Do you accept this method?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
