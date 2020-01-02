Return-Path: <SRS0=tZMI=2X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75B8C2D0DE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 00:30:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B903120863
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 00:30:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HtUU5LCn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B903120863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkxfkotsY7hIV0Oj/Ue6LltWvXnX4k5tL/caEOhK0HY=; b=HtUU5LCnubG4R2
	TZgYWIfYZ0u3OWE/b3hYLY2LeLYnZyTOqStqKjOC8goBXHM7eqORQSBhwB57kTkikcMmH1vMkPFo0
	LDG6zQIuwWU3lxjAAPDspLFmv/5Fyyyki6nUQlNtnHUoYIp5JX04+0W0/1kDl07AVrjA1ayB/knob
	52r9NtG69JxkWhalswcvR+soF2nEqmDRWGDLC8H1AKny+TIGBF5y8gkMjICQm8RkevEzNoem+PKtC
	ILMFOvXu5saceMst8X6+H3UtrSbmSP1iNz6IZBHj4M2W2MXPs4+i68GZrN/Jrl0OC/C6Fp1UU0qdK
	dUxQLdFKLGu9KUr0sxqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imoNf-0002i0-CA; Thu, 02 Jan 2020 00:30:27 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imoNc-0002h4-Ou; Thu, 02 Jan 2020 00:30:26 +0000
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 2 Jan
 2020 08:30:43 +0800
Subject: Re: [PATCH v3 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-5-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
From: Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <d66abc21-1440-503b-3515-6c495bf0db80@amlogic.com>
Date: Thu, 2 Jan 2020 08:30:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCD8V-Swihz+VJ780sXJtM9cXprDcGCHVuHjjCx0DEOodQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_163024_811421_E0171CCB 
X-CRM114-Status: GOOD (  23.40  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, devicetree@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 Liang Yang <liang.yang@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/12/28 0:38, Martin Blumenstingl wrote:
> Hello Hanjie,
> 
> sorry that it took me so long to look at this
> you can find my comments below
> 
> On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> +static const struct clk_bulk_data meson_g12a_clocks[] = {
>> +       { .id = NULL},
>> +};
>> +
>> +static const struct clk_bulk_data meson_a1_clocks[] = {
>> +       { .id = "usb_ctrl"},
>> +       { .id = "usb_bus"},
>> +       { .id = "xtal_usb_phy"},
>> +       { .id = "xtal_usb_ctrl"},
>> +};
> nit-pick: the values in meson_g12a_clocks and meson_a1_clocks all have
> a space after the opening "{" but no space before the closing "}"
> we should be consistent here (personally I prefer the variant with
> space after "{" and before "}", but having no space in both cases is
> fine for me too)
> 

Right, I will fix it.

> [...]
>>  static void dwc3_meson_g12a_usb2_set_mode(struct dwc3_meson_g12a *priv,
>> @@ -138,10 +156,13 @@ static int dwc3_meson_g12a_usb2_init(struct dwc3_meson_g12a *priv)
>>  {
>>         int i;
>>
>> -       if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
>> -               priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
>> -       else
>> -               priv->otg_phy_mode = PHY_MODE_USB_HOST;
>> +       /* only G12A supports otg mode */
>> +       if (priv->soc_id == MESON_SOC_G12A) {
>> +               if (priv->otg_mode == USB_DR_MODE_PERIPHERAL)
>> +                       priv->otg_phy_mode = PHY_MODE_USB_DEVICE;
>> +               else
>> +                       priv->otg_phy_mode = PHY_MODE_USB_HOST;
>> +       }
> can you comment on future Amlogic SoCs and how this code will look in
> the future?
> I would like to avoid having to adjust this "if" for every new SoC,
> but I don't know if the majority of the SoCs will have OTG support
> 
> also one idea that just came to my mind:
> you could define in the .yaml binding that for A1 only dr_mode =
> "host" is allowed
> then you may not need extra logic in the driver at all
> 

Good idea this different SoC extra logic could avoided by add constraints 
to .yaml, also code will be more elegant.

I will do this in next version.

> [...]
>> -               if (i == USB2_OTG_PHY) {
>> +               if (priv->soc_id == MESON_SOC_G12A && i == USB2_OTG_PHY) {
> on GXL we have two PHYs (0 and 1), the second one is OTG capable
> on GXM we have three PHYs (0..2), the second one is OTG capable
> on G12A/G12B we have two PHYs (0 and 1), the second one is OTG capable
> 
> you already wrote that there is only one USB2 PHY on the A1 SoC
> is really only the second PHY port ("usb2-phy1" instead of
> "usb2-phy0") used on A1?
> if "usb2-phy0" is correct then you don't need these checks (there are
> more checks like this below)

Actually, A1 have same phys("usb2-phy0", "usb2-phy1", "usb3-phy0") and register base with G12A.
But A1 driver is designed to support host mode with usb2-phy1 only.

> 
> [...]
>> -       usb_role_switch_unregister(priv->role_switch);
>> +       if (priv->soc_id == MESON_SOC_G12A)
>> +               usb_role_switch_unregister(priv->role_switch);
> I didn't expect this because in _probe usb_role_switch_register is still called
> on A1 we now call usb_role_switch_register() but we never call
> usb_role_switch_unregister()
> 

Actually, usb_role_switch_register() can be called only in G12A.

dwc3_meson_g12a_probe()
         ...
         if (priv->soc_id != MESON_SOC_G12A)
                 goto setup_pm_runtime;


Same with second suggestion, this different SoC extra logic could avoided by add constraints 
to .yaml.
I will do this in next version.

Thanks,
Hanjie

> 
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
