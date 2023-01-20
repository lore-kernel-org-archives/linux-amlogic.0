Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED0DC25B4E
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKQ/1SpkZNIYTMXEr/wqnd01Bx5W8chEr9EnxC/I4XU=; b=1X9a8w7/3KCfwq
	o5j6nYgQ4axGNYeWZKbIUQJjT3hb7AQor6pNDsS5peDTRMvrFLt+zGKn6O0KWk+nnrF9nZr9lw4/W
	zfRuSIysAJ+Pc7lApub64CoCUE3rtvBzmoBoCZGlgYM+OUPVsqFlLgTnYK/1WWjg6DPUR0tL45Iyw
	SbvwS8WyKF8YDGoLvRXLchml/REI7d6eMReE8Dn/6RN7HmxKy9pL1oXIVpKyiPGItmdAMgN9FwGHm
	0GuzCp2rnWailpdmAU9Q/s2jTDjasSUmIjrY1r6MpS4MD7OxMowq/HnuDUKKflBjM1VXXx86P/WBw
	BcV3nmoTFmVjb33BmyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIobp-009oDt-AN; Fri, 20 Jan 2023 10:26:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIobj-009oAp-Bq
	for linux-amlogic@lists.infradead.org; Fri, 20 Jan 2023 10:26:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l8so3629649wms.3
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Jan 2023 02:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=e4mt5lGPeAiHXoegntNYO5GB6SA6d9P+daV7EOX7KxE=;
        b=fUjHtccIWB0vyjuM9shK7iOBnKRcjVRyDKG0+xnJ/+VnAf+laV6pKo7tbZ3ksh8PvH
         DTpqVBt9YxlTy9n6MPUwHXfZ17dkV9yIPWutuUoJu1xJKHVVNMqdVkVp71GC8ya2gIrM
         eKdkevkw7tLtIFyHILfqruPo7R105xSjIPdWcI+57E+FGKb1pzNud70c4jQxXTrpbH5g
         0MuACQyEH65XIdgQYsrV8x7ILK0SztEBKHhA8qS4PiGT/5AJcMjRPWZSU7O7U19qxeM6
         AqiHyd94dI/VIZPCUrv69g6vEPxL73eyTPX7/XkYMkKowY3ofeEkr6zxH/d9UwiJo5pd
         XOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4mt5lGPeAiHXoegntNYO5GB6SA6d9P+daV7EOX7KxE=;
        b=1DCmBlsqqbpnx/2sgTT3rRLAZdWbdTcj0LVKGqnpWV1TUcLOsGalZQvoxpGgNPTOop
         tjfnk/ZYUR8E3T5h6rsBe3lqyQTZZk28/UdnMAaNhIUCTbqK0ITMWPIS4F1qzUOZhbvy
         b83tOm5DgzTU4VLhcrQ4r0LaVWKD/2kVYViiNZOPZWu8EDk7N0TdZWJB053QLgifAcz7
         UP62EzTiJ9DDWOxO0ensn0fXU3FuS2X/XauIkikd+anFk7Do6161kwk6R5Ewj3bEafzJ
         uCih4dge9zALEEFsHGzj0y3T2rv8xfs0g/W8wpjihLGvfPRcgNUtLwRPMIfV5qP14pqM
         F+wg==
X-Gm-Message-State: AFqh2krPQXQoxk3gRV+9V2EPbKFtuJ9C4FADpSfFuoCYdmioZx/PeM+x
	+M73J0lzF3b67jltivkvqQEApg==
X-Google-Smtp-Source: AMrXdXurHyG2XSMT/oqWAcqCqisVjbAkEuwYynC+zJ20Z/Wc3RoAgIV4gZyyioyzciWoE/Yk0mgjTg==
X-Received: by 2002:a05:600c:3ac8:b0:3da:f67c:aca6 with SMTP id d8-20020a05600c3ac800b003daf67caca6mr13518984wms.34.1674210407420;
        Fri, 20 Jan 2023 02:26:47 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003db01178b62sm2095567wmp.40.2023.01.20.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 02:26:46 -0800 (PST)
References: <20230116091637.272923-1-jbrunet@baylibre.com>
 <20230116091637.272923-3-jbrunet@baylibre.com> <Y8dhUwIMb4tTeqWN@lunn.ch>
 <1jmt6eye1m.fsf@starbuckisacylon.baylibre.com> <Y8l7Rc9Vde9J45ij@lunn.ch>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@lessconfused.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Date: Fri, 20 Jan 2023 11:16:20 +0100
In-reply-to: <Y8l7Rc9Vde9J45ij@lunn.ch>
Message-ID: <1jcz79wlgc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_022651_472547_69B616BC 
X-CRM114-Status: GOOD (  35.75  )
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


On Thu 19 Jan 2023 at 18:17, Andrew Lunn <andrew@lunn.ch> wrote:

>> >> +
>> >> +	/* Set the internal phy id */
>> >> +	writel_relaxed(FIELD_PREP(REG2_PHYID, 0x110181),
>> >> +		       priv->regs + ETH_REG2);
>> >
>> > So how does this play with what Heiner has been reporting recently?
>> 
>> What Heiner reported recently is related to the g12 family, not the gxl
>> which this driver address.
>> 
>> That being said, the g12 does things in a similar way - the glue
>> is just a bit different:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/mdio/mdio-mux-meson-g12a.c?h=v6.2-rc4#n165
>> 
>> > What is the reset default? Who determined this value?
>> 
>> It's the problem, the reset value is 0. That is why GXL does work with the
>> internal PHY if the bootloader has not initialized it before the kernel
>> comes up ... and there is no guarantee that it will.
>> 
>> The phy id value is arbitrary, same as the address. They match what AML
>> is using internally.
>
> Please document where these values have come from. In the future we
> might need to point a finger when it all goes horribly wrong.
>

OK

>> They have been kept to avoid making a mess if a vendor bootloader is
>> used with the mainline kernel, I guess.
>> 
>> I suppose any value could be used here, as long as it matches the value
>> in the PHY driver:
>> 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/meson-gxl.c?h=v6.2-rc4#n253
>
> Some Marvell Ethernet switches with integrated PHYs have IDs with the
> vendor part set to Marvell, but the lower part is 0. The date sheet
> even says this is deliberate, you need to look at some other register
> in the switches address space to determine what the part is. That
> works O.K in the vendor crap monolithic driver, but not for Linux
> which separates the drivers up. So we have to intercept the reads and
> fill in the lower part. And we have no real knowledge if the PHYs are
> all the same, or there are differences. So we put in the switch ID,
> and the PHY driver then has an entry per switch. That gives us some
> future wiggle room if we find the PHYs are actually different.
>
> Is there any indication in the datasheets that the PHY is the exact
> same one as in the g12? Are we really safe to reuse this value between
> different SoCs?

There is zero information about the PHY in the datasheet.
The gxl and g12 don't use the same ID values.
The PHY ip is very similar but slightly different between the 2.
(see https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/meson-gxl.c)

My guess is the g12 as another version of the IP, with some bug fixed.
The integration (clocking scheme mostly) is also different, which is why
the mux/glue is different.

>
> I actually find it an odd feature. Does the datasheet say anything
> about Why you can set the ID in software? The ID describes the
> hardware, and software configuration should not be able to change the
> hardware in any meaningful way.

Again, zero information. 
It is a bought IP (similar to the Rockchip judging by the PHY driver).
I'm not surprised the provider of the IP would make the ID
easy to configure. AML chose to keep that configurable through the glue,
instead of fixing it. This is how it is.

>
>> >> +	/* Enable the internal phy */
>> >> +	val |= REG3_PHYEN;
>> >> +	writel_relaxed(val, priv->regs + ETH_REG3);
>> >> +	writel_relaxed(0, priv->regs + ETH_REG4);
>> >> +
>> >> +	/* The phy needs a bit of time to come up */
>> >> +	mdelay(10);
>> >
>> > What do you mean by 'come up'? Not link up i assume. But maybe it will
>> > not respond to MDIO requests?
>> 
>> Yes this MDIO multiplexer is also the glue that provides power and
>> clocks to the internal PHY. Once the internal PHY is selected, it needs
>> a bit a of time before it is usuable. 
>
> O.K, please reword it to indicate power up, not link up.
>

Sure

>      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
