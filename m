Return-Path: <SRS0=w3Gc=ZT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20816C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2019 07:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0D2720656
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Nov 2019 07:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UC0rVMrj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0D2720656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PrKMnAz4UXFFgNFzDqn4rLs4DyzMq54C1S/IfLsDyc=; b=UC0rVMrjeOhLvz
	mXWa8zBHfuUpHfyTd2yfJat3ZL0kh67776tepKEzbOoSkiE3ireoiIUAjo7aHWtIc/aT2TgVG73Jk
	85Lbc21Dc1LmbJRm7OrtXz0wMr1HJ2zUFbqI1CplLUmWB3F8pAA/cmNgYTrmqBYaoK4YbGeuMH+J4
	9ulJwLK/src5sg1G7ttEXhXOZ49+KeQARLxY9PQl/NdkcWK9hwpSzSCmJkjjfo+IdFyS7Si0vjMk8
	PkF6PoPA08BHmzzgfD0gM92wg6w7CmRuCp6M5JVRI1qlVd3Xjn0cWZhQ0VFnX19G2V7XEB1kiDwAa
	2H+Li2RnVpr4W8HeqCpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZrTM-0003Sd-EI; Wed, 27 Nov 2019 07:10:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZrTJ-0003S1-OD; Wed, 27 Nov 2019 07:10:47 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 27 Nov
 2019 15:11:07 +0800
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
 <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
 <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <0e8a96b4-9815-2d81-3dc9-3b51b878492e@amlogic.com>
Date: Wed, 27 Nov 2019 15:11:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_231045_791288_C4EFFF34 
X-CRM114-Status: GOOD (  31.12  )
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
 Felipe Balbi <felipe.balbi@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/11/26 6:02, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Mon, Nov 25, 2019 at 8:53 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>
>>
>>
>> On 2019/11/22 15:52, Martin Blumenstingl wrote:
>>> Hello Hanjie,
>>>
>>> On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>> [...]
>>>>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>>>>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>>>>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
>>> drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
>>> USB2 PHY you are introducing here.
>>>
>>>>   usb: dwc3: Add Amlogic A1 DWC3 glue
>>> drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.
>>>
>>> I have two questions:
>>> - how is the PHY and the dwc3 glue different from G12A (or SM1)?
>>> - why do we need a separate set of new drivers (instead of updating
>>> the existing drivers)?
>>>
>>> We try to use one driver for the same IP block, even if there are
>>> several revisions with small differences (for example the SAR ADC
>>> driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
>>> because 80-90% of the code is shared across all revisions).
>>>
>>>
>>> Martin
>>>
>>> .
>>>
>>
>> Hi Martin,
>>
>> thanks for the comment.
>>
>> 1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
>>    A1 has one usb2-phy0 phy and only support host mode.
> dwc3-meson-g12a treats PHYs as optional
> so if you only pass "usb2-phy0" and skip usb2-phy1/usb3-phy0 then it
> will still work fine
> (I didn't check whether the binding also reflects this)
> 
>> 2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
>>    G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
> dwc3-meson-g12a ignores the interrupt for HOST-only mode
> (I didn't check whether the IRQ is optional in the dt-binding)
> 
>>    G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
> my understanding is that whether a board has a VBUS regulator depends
> on the board design. it has nothing to do with the SoC itself
> 
>>    G12A glue driver has a hard coding support phys while A1 only supports host mode.
>>         enum {
>>                 USB2_HOST_PHY = 0,
>>                 USB2_OTG_PHY,
>>                 USB3_HOST_PHY,
>>                 PHY_COUNT,
>>                 };
> this goes together with comment #1 - you can skip USB2_OTG_PHY and
> USB3_HOST_PHY and the driver should still work fine
> 
>>    G12A glue driver only supports one clock while A1 needs four clocks.
> indeed, the dwc3-meson-g12a needs to be updated to support this
> I don't think that I have used it myself yet but there's the
> clk_bulk_data framework
> it seems to fit this use-case pretty well: define an arbitrary number
> of clocks for G12A/B an another set of clocks for A1 - then use the
> clk_bulk_data framework to enable/disable them all at once
> 
>>    G12A and A1 phy drivers have different register configurations since hardware differences.
> other drivers have similar requirements: (mostly) identical register
> layout but different values per SoC
> here are two examples (I'm not sure if they are good examples though):
> Lantiq/Intel SoC [0] and Allwinner SoCs [1]
> 
> I compared your driver with phy-meson-g12a-usb2 and only found four differences:
> 1) PHY_CTRL_R18_MPLL_DCO_CLK_SEL is set for A1
> 2) PHY_CTRL_R13_UPDATE_PMA_SIGNALS is not set for A1
> 3) PHY_CTRL_R21 is updated twice for A1 (once for earlier gen SoCs)
> 4) A1 doesn't reference the "xtal" clock
> 
> Difference 4) seems to be a general problem because there seems to be
> a PLL inside the PHY registers and that PLL must be fed by some input
> clock
> So I believe that there is some clock input (which is currently
> missing from your A1 USB2 PHY driver)
> 
>> 3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
>>    driver for A1 SoCs, so also dedicated dt-bindings.
> I think we should separate the driver and dt-bindings
> 
> Based on what I have seen so far my preference for the PHY is:
> - use the existing dt-binding, because it seems to be the same IP
> block with different register configuration
> - use the existing driver because there are only three different
> register values (to me it feels like a dedicated driver for these
> means more overhead for little benefit)
> 
> for the glue I think:
> - extend the existing dt-bindings and make some of the PHYs and the
> interrupt line optional. making the PHYs optional will be needed when
> adding GXL/GXM/AXG support anyways
> - use the existing driver and make the clock inputs depend on the SoC
> - everything else should already work as is
> 
> please let me know if I missed something:
> comparing/reviewing the new and existing drivers is harder than just
> copying the existing one and modifying that copy
> (this is one of the reasons why I think that duplicating code makes
> the drivers harder to maintain)
> 
> I also thought about the negative consequences of extending the
> existing driver(s).
> modifying the existing code could break the driver for existing boards.
> however, I think that is not a problem because BayLibre's Kernel CI
> labs have good coverage for G12A, G12B and SM1.
> so if you add some A1 boards there (or host your own lab with A1
> boards) any breakage will be found early (the Kernel CI bot even does
> git bisect and sends emails)
> 
> 
> Martin
> 
> 
> [0] https://github.com/torvalds/linux/blob/d2912cb15bdda8ba4a5dd73396ad62641af2f520/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c#L47
> [1] https://github.com/torvalds/linux/blob/c942fddf8793b2013be8c901b47d0a8dc02bf99f/drivers/phy/allwinner/phy-sun4i-usb.c#L862
> 
> .
> 

Hi Martin:

Okay.
We will try to move A1 usb phy/ctrl driver into G12A driver and send a V2 patch later.

Thanks.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
