Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6190C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 12:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bnEWGiOm2QVV6gRTNAWgNgAYYikWM0QtBCR8OuQPF8=; b=tTmvvcLJIrS0aENx/1VQ8nn7XE
	UDKuVM+RaI2boMk/DjPXiXUTaZxmnb7r7QBbyB1LmFFBwErOD/dz93HPNfMAcqUAyHEUQsjZF7HH6
	vm+2be7Ha4wq6x5ZMxOKwr6vHCQQfGjpGgcJuEPhvYyf80U6UvYFuZhitJR+aWW0hmFHpSjMzxHjm
	1g9704nvJ0WN0eGHNb7hnnjBHHwy1aisouX+sAu0AkjlFjPq3T1uxtwvu9Jp+HMt+9QVTJVlPslVh
	QKxvNvDluN23t0cc3QA6BHVfw4lEa/nl+wjKMxhJTBW6yqSZEJ9gkh5cdpyQtaryDYKyTspDTSNiF
	aqYr9UkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXiyX-0022ZH-RY; Fri, 25 Mar 2022 12:23:29 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXiyT-0022W4-No
 for linux-amlogic@lists.infradead.org; Fri, 25 Mar 2022 12:23:27 +0000
Received: from [10.28.39.40] (10.28.39.40) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2176.2;
 Fri, 25 Mar 2022 20:23:19 +0800
Subject: Re: VIM3 - A311D - I2C AO Clock Questions
To: <tanure@linux.com>
CC: <linux-amlogic@lists.infradead.org>, Beniamino Galvani
 <b.galvani@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
 <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
 <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
 <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
 <CAJX_Q+1OwvpypMXsdBpra8Ozys9DUEpbbqJipEqcuS2P3UqvVw@mail.gmail.com>
 <CAJX_Q+3RcQZhi7haG8-7d7PzWcaRE-72Si3DCoetp=rbZHJ6+A@mail.gmail.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <c042b6b5-6fd2-3b64-78e8-6698354c8e49@amlogic.com>
Date: Fri, 25 Mar 2022 20:22:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+3RcQZhi7haG8-7d7PzWcaRE-72Si3DCoetp=rbZHJ6+A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.40]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_052326_302146_0DD17B52 
X-CRM114-Status: GOOD (  35.52  )
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

Hi, lucas

On 2022/3/21 18:08, Lucas Tanure wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, Mar 9, 2022 at 9:39 AM Lucas Tanure <tanure@linux.com> wrote:
>>
>> On Tue, Mar 8, 2022 at 6:49 AM Lucas Tanure <tanure@linux.com> wrote:
>>>
>>> On Mon, Mar 7, 2022 at 8:29 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 06/03/2022 11:23, Lucas Tanure wrote:
>>>>> Hi,
>>>>>
>>>>> I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
>>>>> My device uses a 100000Hz clock, but after changing
>>>>> meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
>>>>> not properly read its registers.
>>>>>
>>>>> It reads 0x9100, but the correct data should be 0xcb58.
>>>>> The first thing I saw on the bus was that the frequency I requested by
>>>>> the device tree was being set after the probe of my driver already
>>>>> failed.
>>>>> For that, I sent "i2c: meson: Fix wrong speed use from probe" which
>>>>> fixes that issue.
>>>>>
>>>>> But I still get the wrong data, so my next guess is that the clock
>>>>> duty cycle is 30%, and I think should be 50%.
>>>>> Here is an image of the signals of the bus:
>>>>> https://pasteboard.co/TEoxQucsXUUD.png
>>>>>
>>>>> I have tested other frequencies and all of them uses a 30% duty cycle,
>>>>> where SCL is up 30% and low for 70% of the period.
>>>>
>>>> Indeed it seems by default the duty cycle is for Fast Mode, but standard mode should
>>>> be around 50%. Did you try 400khz ?
>>>
>>> Yes, 400Khz has the same issue of 30% duty cycle.
>>>
>>>>
>>>> Amlogic did some changes on their off-tree linux fork, please look around:
>>>> https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143
>>>
>>> Thanks! I am investigating that code, but so far doesn't work.
>>>
>>>>
>>>> I'm unsure when REG_SLAVE_ADDR BIT(28) appeared, but if you try to port this upstream,
>>>> we'll be happy to review it for inclusion.
>>>
>>> I will try to get this working and push a patch.
>>> Thanks
>>> Lucas
>>>
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Is possible to configure the clock to be 100000Hz, but with a 50% duty
>>>>> cycle for this I2C bus on A3111D?
>>>>>
>>>>> Thanks
>>>>> Lucas Tanure
>>>>>
>>>>> _______________________________________________
>>>>> linux-amlogic mailing list
>>>>> linux-amlogic@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>
>> After some debugging, I got the 50% duty cycle working, but that was
>> not the issue.
>> The issue was that my device address is 0x22, the same as FUSB302B.
>>
>> But FUSB302B is not on the device tree, so I didn't there was an
>> address collision.
>> I will push some patches for the duty cycle later this week.
>>
>> Thanks
>> Lucas Tanure
> 
> Hi Jian Hu,
> 
> You sent the patch "i2c: meson: add configurable divider factors",
> where it sets the div factor for Meson-AXG soc to be 3.
> The current state of the clock is a 30% duty cycle, and I would like
> to port a 50% duty cycle from Khadas 5.4 driver.the div_factor is 3 in Meson-AXG.
> 
> https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143
> 
In this patch, div_factor is not used any more.

> The problem now is that div_factor must be 4 for VIM3, as the value of
> 3 (current one) the clock is set wrongly.
> The value of 3, plus the 50% patch sets the clock to be 85k instead of
> 100k, and the duty of 42%.
it seems the div_factor is changed back to 4 in Meson-G12A.

set div_factor as 4, the frequency is 100k, and duty cycle is 33%.

> 
> So, why div_factor is 3 for Meson-AXG?
> Can we remove that patch "i2c: meson: add configurable divider
> factors" and set div_factor to be 4 for all?
If depends on the i2c controller design, AXG was changed to 3.
Now the duty cycle is 33% as default, We can enable "REG_SLAVE_ADDR 
BIT(28)" to support 50% or 40% duty cycle.

> 
> And it seems that for devices at I2C3, i2c@1c000, the Meson I2C driver
> must be built as a module.
> If I build the Meson I2C driver as built-in my I2C devices fail to
> probe, but works if Meson I2C is a module that probes after 10 seconds
> or so.
> These 2 devices boot fine at i2c_AO, i2c@5000, even if Meson I2C is built-in.
> But because of an address clash with FUSB302B a 3rd device, I need to
> move all of them to I2C3.
> 
> Is there any requirement for I2C3 to work during boot? Any power or
> clock that needs to be configured before I2C can be used?

i2c_AO and i2c3 controller is the same. Maybe you should check the i2c3 
pinctrl/clk settings before FUSB302B works.

HHI_GCLK_MPEG0 bit9 controls its clock.
> 
> Thanks
> Lucas
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
