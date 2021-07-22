Return-Path: <SRS0=ZIL+=MO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEFEC63793
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jul 2021 09:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12228610F7
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jul 2021 09:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12228610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A76EaRW4ppxxZz7+VCT51hw57B6t0GNcV1S1Hm9utqM=; b=QXEV7qMgxiaHlG
	17peoVhtx3OtGgdjuoyUZKaIWkzbPNvQ7bt1+LsFi/4fnMitrN/qI37+uaSarz0soujN2yvN3bwqN
	jB13E58CiuVCsWvyKkMeJIz7EXLBJZLpjDUk7Xz70Q+q6qb7+Ii/v5YaYzNMTDamhWYIV15mlbLvt
	kVA1nO5YkzjEWQb98JsHR74Cd/YSCRLvsrhL7GIiHMPtjxkMr1SnSAn97dWcK0AMbnnrRqI9iLaWk
	LB0wKP0z2DDiJFUcDRXQLc9jnMANxCY734Q21OtEQvLKA7nWygWIVm3fZTO5KUr0yOftnlBITQEEQ
	UiAwLB2HidTOBROQRSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6UhP-000o07-JL; Thu, 22 Jul 2021 09:08:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6UhM-000nz8-EE; Thu, 22 Jul 2021 09:08:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F5A16124B;
 Thu, 22 Jul 2021 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626944936;
 bh=5vl/tvBRm8U2+bS0nYWt65GcpJ17JVUvMxzOOfaQelU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6vj8RcXEityaBeLrN9dCcMrpbv3KCQM13vyJ+fXj1Nu18kUOoe/WHYJmFcIM1ZZ1
 9Y13djBPuWAC/CVzRf8C7AFC+OvvRyV38PnpV6N6zNnLI0LPC0wRWz7ypiw1x0JDs9
 LLb4v0c5CtA3XCqgFaLoLN67QB2qWhSgeCF4eTv1vY/+L8D2mEp7n2+kLm0E6y360q
 nijVU7dYbHm+Js6ZLeT+vVf2qWJ2WZmNwwubLxN24oVflmVVSCEqXDPPxl9sNofASc
 3TkTZD0F3OvEnFAIYn+hYpEtIbOWVKsHu5LZECH6Tim4UYK3X5jQ67f6VwEoQKmRIM
 5ogINrgxuaWLA==
Date: Thu, 22 Jul 2021 14:38:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kishon@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: amlogic: Add a new driver for the HDMI TX
 PHY on Meson8/8b/8m2
Message-ID: <YPk1pNi3CyzB2Jf4@matsya>
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
 <20210629182047.893415-3-martin.blumenstingl@googlemail.com>
 <YPaLKwEKcDLWwztM@matsya>
 <CAFBinCCJ5DjvjkfjYg7SveDB0bvJ-XV6BwcF_yEeUqxRN9awiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCJ5DjvjkfjYg7SveDB0bvJ-XV6BwcF_yEeUqxRN9awiQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_020856_557877_95AEA48A 
X-CRM114-Status: GOOD (  31.16  )
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

On 21-07-21, 00:08, Martin Blumenstingl wrote:
> Hi Vinod,
> 
> On Tue, Jul 20, 2021 at 10:37 AM Vinod Koul <vkoul@kernel.org> wrote:
> [...]
> > > +     if (clk_get_rate(priv->tmds_clk) >= 2970UL * 1000 * 1000)
> > > +             hdmi_ctl0 = 0x1e8b;
> > > +     else
> > > +             hdmi_ctl0 = 0x4d0b;
> >
> > magic numbers..? I guess these are register offsets, would be better to
> > define..
> Unfortunately these are register values, not offsets
> The only "documentation" I have is:
> - documentation for the bits/bit-fields in these registers [0]
> - some reference code with magic values from the vendor BSP: [1]
> 
> HDMI_CTL0/HDMI_CTL1 (the names from the datasheet) is not very
> specific and I could not find any other explanation on what the values
> mean.
> That's why I cannot offer more than these magic values (same situation
> for your finding below).

Ok, Can you add a comment that register documentation not available ...


> > > +     ret = device_property_read_u32_array(&pdev->dev, "reg", reg,
> > > +                                          ARRAY_SIZE(reg));
> >
> > we have reg as single property, why array with 2 entries here?
> My thought when Rob requested a "reg" property in the dt-bindings was
> that I should use offset and size.
> I am not validating the size here, which would be in reg[1].
> If it's fine for Rob as well then I'll switch the dt-bindings to just
> have the offset inside the reg property.

So the property is reg address and size. Two would imply you are using
two reg values.

So I would recommend to use:
        reg_offset = platform_get_resource(pdev, IORESOURCE_MEM, 0);

and skip this reg array.


> 
> [...]
> > > +static const struct of_device_id phy_meson8_hdmi_tx_of_match[] = {
> > > +     { .compatible = "amlogic,meson8-hdmi-tx-phy" },
> > > +     { .compatible = "amlogic,meson8b-hdmi-tx-phy" },
> > > +     { .compatible = "amlogic,meson8m2-hdmi-tx-phy" },
> > > +     { /* sentinel */ }
> >
> > I see that all three are handled similarly, no difference!
> So far this is correct, they're all treated the same.
> However, it happened to me (multiple times) in the past that later on
> I would spot a difference hidden in the vendor BSP.
> One example is commit f004be596c28f9 ("phy: amlogic: meson8b-usb2: Add
> a compatible string for Meson8m2").
> I know that other parts of the graphics pipeline are different on
> Meson8 compared to the other two SoCs (because Meson8b/Meson8m2 have
> some reset lines which need to be toggled after updating the video
> clocks. these resets don't exist on Meson8).
> So I decided to play safe and add compatible strings for every SoC so
> I can easily handle any differences in the future (in case I find
> any).

Correct, that is why you need to *keep* the SoC specific compatible and
document them. But use a generic one when you don't have any delta

Above would become:
        { .compatible = "amlogic,meson8-hdmi" },

with DTS specifying:
        compatible = "amlogic,meson8-hdmi-tx-phy", "amlogic,meson8-hdmi";

That way if required you can always use the specific one

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
