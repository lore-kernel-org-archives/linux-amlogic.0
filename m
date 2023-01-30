Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F13C54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2Yu/YoP+4Tywxv4Uee7txGlv6NFHuHvnZEk+vM1F5U=; b=KfcfypPUHgYQxs
	WO07ONXBkG+WCkUOnDTk82aKEaUxkp+AP3ByzHKJRryKyT1mQmR7lRJjrOLHde60ZYeoQKexxCAPT
	1FYBu52iWDmpiS9tOphBuyja/AOUbCkd3mQPwftKzGRg++ZCwqKpv2zmhPNo4ZiXKXo8iFEX1A95J
	edQnqwEt4CAY5OYPid+NawfXQs8XlL+ZV7JuEzeirH1YRjeJ1HmyuXg2ArPEX/Dw5DnNrZXYEtOOB
	VstxWGg0X4raBW8kWMh7uS7B8F27m7808zaFf5JMtGZaOlSD+9KX12gbx8Oxko3THHN/F9+2ZQHe2
	f1ohU1loV+wk0YED+LXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRDL-0035LD-E3; Mon, 30 Jan 2023 10:16:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRCJ-00357I-Gr
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 10:15:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg26so1752935wmb.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 02:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=1GD6xvkAI4vVIPmoXjUJESxT67/DmEIL0NxqWHVJZ14=;
        b=ou/WTQh/rbAEo5i1/IWRz6TsdWW9GiyVSx95zPqG1wlb8uWq7GDDJ1AF1NNoVq4cP7
         Hk2AP5lqUGtDGN2zKp441z2I4OVTn//z/nMIdbVCWEyaijkTDCFIN9Fm/3+DrTm7tfb/
         kr0MymPvx6aDZSR2W65kNFOhRZHvN7ax66qvN4fLLI4OT710+qUuo4xPvT2mKB1NeHth
         c/XuA42ZBrSAmwl0qFnZSFdR3bmj9zZSMYUYHa68bnR/jOH5eXgvpuxOnUZtoxqxYx/S
         48M/WsrjxhilD+BuPQ+j6gzyayhLv34WC+jhgOzPYLa0/WNjVIDfv9unLvqoQ9SpQMoE
         vGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GD6xvkAI4vVIPmoXjUJESxT67/DmEIL0NxqWHVJZ14=;
        b=zKTcHeMqQA/2t0CG7UnNOl5yeQ4p04zI1gu1vnqmGvS+UJ72Nx2w4ozH4I3O6XtsOR
         3nc3jj2k1fmfUc+s1S/VGByJf87xLB7HNRewO69MypNBVLeO8yZY6UXZB5igEx0CBpKP
         4ojexw9nMz/21ZS0/4uqc2U22+v9Tzqj2HJ02+MTCo+RiyaO/pDgLcUj+hUwAj4YL505
         rxvk3RruNjaDddtDN9OLQKLOAlHvtSSdO/QxB2CmZCcpsAw21tneTeAxn6RPuhAnJds9
         gdmVN53o/Qn2mX2DklzZJPzenI96swWBgdKcxRCdkmoXwhBmdo7WzL+uiSZrWlfPNCyL
         zVPw==
X-Gm-Message-State: AO0yUKXqUm6s50lgMunAOOS86XTijEJQy4ZFRRlVfEdS1C3zthhIs84v
	7uuxNpyNC3l6QZGY062hQneK0g==
X-Google-Smtp-Source: AK7set8BN8DVUVltmKpqNSmrNuOc+vShSw+Cdb+p4Xr2bLyDzS9ZnhXiE4NnCN8obYC0pP2DuBQrzw==
X-Received: by 2002:a05:600c:b93:b0:3dc:5965:2c35 with SMTP id fl19-20020a05600c0b9300b003dc59652c35mr2792658wmb.24.1675073731709;
        Mon, 30 Jan 2023 02:15:31 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d33-20020a05600c4c2100b003dc41a9836esm8478505wmp.43.2023.01.30.02.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:15:30 -0800 (PST)
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
Date: Mon, 30 Jan 2023 11:07:28 +0100
In-reply-to: <37e5d1a9-9379-a7ff-e288-9a4b80a0cc5f@amlogic.com>
Message-ID: <1jmt60nxa7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_021535_592157_7238051A 
X-CRM114-Status: GOOD (  24.97  )
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


On Mon 30 Jan 2023 at 17:59, Yu Tu <yu.tu@amlogic.com> wrote:

> On 2023/1/30 17:47, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Mon 30 Jan 2023 at 17:41, Yu Tu <yu.tu@amlogic.com> wrote:
>> 
>>> On 2023/1/30 17:06, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>> On Sat 28 Jan 2023 at 18:17, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>
>>>>> On 2023/1/20 17:47, Jerome Brunet wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>> On Fri 20 Jan 2023 at 11:33, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>>
>>>>>>> Hi
>>>>>>> On 2023/1/19 19:37, Jerome Brunet wrote:
>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>> On Mon 16 Jan 2023 at 15:42, Yu Tu <yu.tu@amlogic.com> wrote:
>>>>>>>>
>>>>>>>>> Add the peripherals clock controller driver in the s4 SoC family.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>>>>>> [...]
>>>>>>>>
>>>>>>>>> +
>>>>>>>>> +/* Video Clocks */
>>>>>>>>> +static struct clk_regmap s4_vid_pll_div = {
>>>>>>>>> +	.data = &(struct meson_vid_pll_div_data){
>>>>>>>>> +		.val = {
>>>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>>>> +			.shift   = 0,
>>>>>>>>> +			.width   = 15,
>>>>>>>>> +		},
>>>>>>>>> +		.sel = {
>>>>>>>>> +			.reg_off = CLKCTRL_VID_PLL_CLK_DIV,
>>>>>>>>> +			.shift   = 16,
>>>>>>>>> +			.width   = 2,
>>>>>>>>> +		},
>>>>>>>>> +	},
>>>>>>>>> +	.hw.init = &(struct clk_init_data) {
>>>>>>>>> +		.name = "vid_pll_div",
>>>>>>>>> +		/*
>>>>>>>>> +		 * The frequency division from the hdmi_pll clock to the vid_pll_div
>>>>>>>>> +		 * clock is the default value of this register. When designing the
>>>>>>>>> +		 * video module of the chip, a default value that can meet the
>>>>>>>>> +		 * requirements of the video module will be solidified according
>>>>>>>>> +		 * to the usage requirements of the chip, so as to facilitate chip
>>>>>>>>> +		 * simulation. So this is ro_ops.
>>>>>>>>> +		 * It is important to note that this clock is not used on this
>>>>>>>>> +		 * chip and is described only for the integrity of the clock tree.
>>>>>>>>> +		 */
>>>>>>>> If it is reset value and will be applicable to all the design, regarless
>>>>>>>> of the use-case, then yes RO ops is OK
>>>>>>>>
>>>>>>>> >From what I understand here, the value will depend on the use-case requirements.
>>>>>>>> This is a typical case where the DT prop "assigned-rate" should be used, not RO ops.
>>>>>>>
>>>>>>> Check the previous chip history, the actual scene is not used at all,
>>>>>>> basically is used in simulation. So the previous SOC was "ro_ops" without
>>>>>>> any problems.  This S4 SOC is not actually useful either.
>>>>>>>
>>>>>>> So when you were upstream, you had no problem making "ro_ops". I wonder if
>>>>>>> I could delete this useless clock, so you don't have to worry about it.
>>>>>> I don't know what to make of this. What is the point of adding a useless
>>>>>> clock ?
>>>>>
>>>>> As explained earlier this "vid_pll_div" is actually used in chip
>>>>> emulation. So next I'd like to know what you suggest to do with the clock?
>>>>>
>>>> If it does not exist in the actual SoC, please remove it
>>>>
>>>
>>> If I remove it, the "vid_pll_sel" clock will be missing a parent
>>> (vid_pll_div). I will use the table method and give the above reasons. Do
>>> you accept this method?
>> Either the clock exists or it does not.
>> If the HW actually exist, it is expected to be properly described.
>> If it does not, it obviously cannot be an input to another clock.
>> Please sort this out and make the necessary changes.
>> 
>
> The CLKCTRL_VID_PLL_CLK_DIV register is actually described, but it is not
> used in the actual board. According to your reply just now, description is
> required, but I want to know how to describe it to meet your requirements.
>
> Please give me some suggestions.

Implementing things is NOT about usage, it is about correctness.
Either there is actually a clock in the silicon you are producing at the
Amlogic factory, or there is not. 

If the clock is there in the actual HW should be properly
described/implemented, as it "might" be used as an input to other clocks
- even if you personnaly don't.

If clock does not exists (nothing behind the registers, or broken, etc
...)  then, yes you'll need to use parent tables and document this.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
