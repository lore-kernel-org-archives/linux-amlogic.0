Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46889C54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CviD/+0PWypHWVoI/jhogtDkodBajMDYISvgMf0j9mU=; b=BW6zvrYcZ7xQ+/
	F6YadkA0PbZ8p/+aIPxAdbSr5PYNRSfTsBrpXTeYGxs99H8rjOItuoS69vESPl8fotmtiDoEdTXlF
	HR6csd9xzALOGgjyuopbhlt+alMLig7iXW58QC3ZXqB2DDkrl/zkXkF5Nn28sLSNv7etA1FT6ZdY7
	/fsfpb5/eMeokkoMKbeI80p9zlNov//V6qwTJtc8xh2DjfTdbpxNNKZb84rs46Uq2eg9OF0mB8fdN
	Sh1EOupm6VTXmmTbHxoJt1bYKSDL2Tyjnzuy/60VNMS08uLSuQCXcmEpY3KnAvMQiYeo+FzT7JIff
	Z1DxrXZSWBvw9omAUQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQ9P-002lUy-8t; Mon, 30 Jan 2023 09:08:31 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQ8a-002lKT-TY
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 09:07:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id m14so9876915wrg.13
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 01:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=lsYDdEUERNa3haOuJCyAm4JNnP3W5R6kzY4+GKk1/bQ=;
        b=BcPcAmLYez/2WbtfoRyE4Tmt4L6RHSzHIyQHIxkGShoJ8nsggaHJo/hwm2rGInqlBY
         TOd96pVmLH5CSkR0ZpjrrTbvm2nHG3lPJ2QuHgFFzzNcV9xsgqhyJgEKP2jh1wih3R0x
         rHNeicYddOa1OfTbdn6h8Cuu0f80lXvIkp4d3WXn2ZPz4ZcHFX0Adcfpd/WPHXKWJK8w
         aYW8w9p6UJOHYCcRhB7K8KfU1z3HL7YoMjMMUT7ROa/ei1AM3yNX3GfNGYS9wHK76lS7
         sUDri8lcLIE+vQRuLMTizVOcbcxD7rF3PPnNVxxoOEqkxUHtH2CNO5XnuQF5b3RolWi6
         APZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsYDdEUERNa3haOuJCyAm4JNnP3W5R6kzY4+GKk1/bQ=;
        b=wO68DWaRi7xuvYrwuMHS71A3U4UFMtSuyoztK5o3Gxqzk8bh8wNcMedI60SJpfjyw/
         +jHpZ1b3M7wkhS7F1fcpJJ78U4zp3NRAF6N3XHt8yi8XEtCy3AGd+DInAr+zlFgG+AGJ
         tRG+tYnDLWc14Ay/tLUpBfk8juP+Km3FckSm9wS2U09j+cx3Hsw1I6B4lvCEHv8APiyJ
         9e3X+ERINgtAngM0ForAC8p7RIfeP8UI2WANeMKRey/oekqDcGVLzkv84TeDsntF+3dU
         S4HX4rk+CevZvy3uQ72/kMddAHXwn4jjchr+7HLE93vW4PC2kEBjcm4YiFnghu78r2bH
         NpoQ==
X-Gm-Message-State: AFqh2ko2JnfsaQsKZwibOAQ2E0uTGM6iEx8M7eLBl1Wy/hpN6qWCVsGh
	UjyJPuagB8idM1wPw9Gpf8ebqA==
X-Google-Smtp-Source: AMrXdXtLM5yCOsKxBBWj+DH7khxMs+DnILPh4por/ncjDzW//iFJ0t2Qxjhu8HVdGwvrrSuBjQGabQ==
X-Received: by 2002:adf:c78b:0:b0:2bd:dd13:170f with SMTP id l11-20020adfc78b000000b002bddd13170fmr52501442wrg.26.1675069657414;
        Mon, 30 Jan 2023 01:07:37 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t4-20020a05600001c400b002bdcce37d31sm12691897wrx.99.2023.01.30.01.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 01:07:36 -0800 (PST)
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-4-yu.tu@amlogic.com>
 <1ja62eybrv.fsf@starbuckisacylon.baylibre.com>
 <aedb0764-b5cb-7f49-f279-51dbec070e80@amlogic.com>
 <1jwn5hwn0w.fsf@starbuckisacylon.baylibre.com>
 <a4ad6ac6-60c2-8f7b-fdb0-509de31db282@amlogic.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
  Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
 <qi.duan@amlogic.com>
Subject: Re: [PATCH V6 3/3] clk: meson: s4: add support for Amlogic S4 SoC
 peripheral clock controller
Date: Mon, 30 Jan 2023 10:06:49 +0100
In-reply-to: <a4ad6ac6-60c2-8f7b-fdb0-509de31db282@amlogic.com>
Message-ID: <1jy1pko0fc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_010741_167117_E1E4EFAD 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 28 Jan 2023 at 18:17, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2023/1/20 17:47, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 20 Jan 2023 at 11:33, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> Hi
>>> On 2023/1/19 19:37, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>
>>>>> Add the peripherals clock controller driver in the s4 SoC family.
>>>>>
>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>> [...]
>>>>
>>>>> +
>>>>> +/* Video Clocks */
>>>>> +static struct clk_regmap s4_vid_pll_div = {
>>>>> +	.data = &(struct meson_vid_pll_div_data){
>>>>> +		.val = {
>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>> +			.shift   = 0,
>>>>> +			.width   = 15,
>>>>> +		},
>>>>> +		.sel = {
>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>> +			.shift   = 16,
>>>>> +			.width   = 2,
>>>>> +		},
>>>>> +	},
>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>> +		.name = "vid_pll_div",
>>>>> +		/*
>>>>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>>>>> +		 * clock is the default value of this register. When designing the
>>>>> +		 * video module of the chip, a default value that can meet the
>>>>> +		 * requirements of the video module will be solidified according
>>>>> +		 * to the usage requirements of the chip, so as to facilitate chip
>>>>> +		 * simulation. So this is ro_ops.
>>>>> +		 * It is important to note that this clock is not used on this
>>>>> +		 * chip and is described only for the integrity of the clock tree.
>>>>> +		 */
>>>> If it is reset value and will be applicable to all the design, regarless
>>>> of the use-case, then yes RO ops is OK
>>>>
>>>> >From what I understand here, the value will depend on the use-case requirements.
>>>> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.
>>>
>>> Check the previous chip history, the actual scene is not used at all,
>>> basically is used in simulation. So the previous SOC was "ro_ops" without
>>> any problems.  This S4 SOC is not actually useful either.
>>>
>>> So when you were upstream, you had no problem making "ro_ops". I wonder if
>>> I could delete this useless clock, so you don't have to worry about it.
>> I don't know what to make of this. What is the point of adding a useless
>> clock ?
>
> As explained earlier this "vid_pll_div" is actually used in chip
> emulation. So next I'd like to know what you suggest to do with the clock?
>

If it does not exist in the actual SoC, please remove it

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
