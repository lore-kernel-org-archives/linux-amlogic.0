Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324E9C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Mar 2022 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4lNgqy08wLAeZxVo8TX98ec5nujscs4uWLe/ZZ9sg4=; b=YSI9NMOhwGFGJ0
	enj99iMw/YAyT9FhvUG/8JFhpAWrBC5cxILg7F38JjpwrB2T2gWFpkSNxYyrmpg9rZ1AzdpEJRRwj
	0XqYXNcpnIKnYa5rPiKYJdOO4A/NwUyvT/o9JDZaZ5epPOTTFKRWZt6tKcGMJZPxHXWV+Qqz31e4p
	kZuZ/4QN5IQ/otpBH53/2LYczwOc4jn/vZZjuDr1eyVpA3O9PG7XzAi9nD6pbQkOi2z7sLW6jIUwc
	FRk5f1i/28uKozeaUsIphGfxvdXcUugv/YY61keFHibgdInKxTF1NcfJIju84WQd0Y57wE7s2BAyI
	6HaBBPPa15OZjpvFB1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRsmt-007wmA-2S; Wed, 09 Mar 2022 09:39:19 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRsmq-007wl5-0z
 for linux-amlogic@lists.infradead.org; Wed, 09 Mar 2022 09:39:17 +0000
Received: by mail-ua1-f53.google.com with SMTP id j7so757039uap.5
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Mar 2022 01:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=p3OmlkM/OWiSIKDHkDHx5mNkj2zAQewRb+zd0+kavL4=;
 b=y/nuxO5LmxAAVjHKH4kuQ8KwKnY5nhT5ys6kPcYmiulSaru85gS1GPYNJVq3j1iksU
 33hD2TkA1xhaSl5dK4U/ZYiba8Z/5SfuhLEJfgR89gbFvsX8PYvG8ldoQjEnRR5ffb0P
 vIpW4XX3gIZzhu/bAKCPEJ4KxXSlKeyKt/CdJef2Iap+rb+vpXPyrh/uSu8VrTbQShy2
 pNvW7qcHDesln34akoizRP036onEjJkyB7YFjJEOi08dIqSLUY68/FgCB4+OKUMdYQQ2
 3Zdffk3jqChZ0bMV+/znLz3AcFJoPqIBA7W08KH/cvSfewFwSSzmZbcOmJrRFxYrTz7q
 3pIg==
X-Gm-Message-State: AOAM532EERlAhEEihj6BRjz95FCVsyB9UT7kLEGTJrR06ykDkQNR/NAi
 vwOFJ8JFkML78Nmzn3NLAui5cqCKq01SDg==
X-Google-Smtp-Source: ABdhPJw4lDej3u/4V5xWmUMCa2VQxNUBI+IxQkSm833ZiQYmbhT1F6Uz/DQOQg7aVoB5LgwySgMw2A==
X-Received: by 2002:ab0:3752:0:b0:343:434c:3378 with SMTP id
 i18-20020ab03752000000b00343434c3378mr8181550uat.95.1646818754124; 
 Wed, 09 Mar 2022 01:39:14 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com.
 [209.85.217.46]) by smtp.gmail.com with ESMTPSA id
 s63-20020a1fa942000000b003336910de3esm164012vke.14.2022.03.09.01.39.13
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 01:39:13 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id u124so1612299vsb.10
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Mar 2022 01:39:13 -0800 (PST)
X-Received: by 2002:a67:fb87:0:b0:320:bd8a:f24c with SMTP id
 n7-20020a67fb87000000b00320bd8af24cmr6908771vsr.51.1646818753634; Wed, 09 Mar
 2022 01:39:13 -0800 (PST)
MIME-Version: 1.0
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
 <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
 <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
 <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
In-Reply-To: <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 9 Mar 2022 09:39:02 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+1OwvpypMXsdBpra8Ozys9DUEpbbqJipEqcuS2P3UqvVw@mail.gmail.com>
Message-ID: <CAJX_Q+1OwvpypMXsdBpra8Ozys9DUEpbbqJipEqcuS2P3UqvVw@mail.gmail.com>
Subject: Re: VIM3 - A311D - I2C AO Clock Questions
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_013916_101843_D2918B41 
X-CRM114-Status: GOOD (  35.74  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Mar 8, 2022 at 6:49 AM Lucas Tanure <tanure@linux.com> wrote:
>
> On Mon, Mar 7, 2022 at 8:29 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >
> > Hi,
> >
> > On 06/03/2022 11:23, Lucas Tanure wrote:
> > > Hi,
> > >
> > > I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
> > > My device uses a 100000Hz clock, but after changing
> > > meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
> > > not properly read its registers.
> > >
> > > It reads 0x9100, but the correct data should be 0xcb58.
> > > The first thing I saw on the bus was that the frequency I requested by
> > > the device tree was being set after the probe of my driver already
> > > failed.
> > > For that, I sent "i2c: meson: Fix wrong speed use from probe" which
> > > fixes that issue.
> > >
> > > But I still get the wrong data, so my next guess is that the clock
> > > duty cycle is 30%, and I think should be 50%.
> > > Here is an image of the signals of the bus:
> > > https://pasteboard.co/TEoxQucsXUUD.png
> > >
> > > I have tested other frequencies and all of them uses a 30% duty cycle,
> > > where SCL is up 30% and low for 70% of the period.
> >
> > Indeed it seems by default the duty cycle is for Fast Mode, but standard mode should
> > be around 50%. Did you try 400khz ?
>
> Yes, 400Khz has the same issue of 30% duty cycle.
>
> >
> > Amlogic did some changes on their off-tree linux fork, please look around:
> > https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143
>
> Thanks! I am investigating that code, but so far doesn't work.
>
> >
> > I'm unsure when REG_SLAVE_ADDR BIT(28) appeared, but if you try to port this upstream,
> > we'll be happy to review it for inclusion.
>
> I will try to get this working and push a patch.
> Thanks
> Lucas
>
> >
> > Neil
> >
> > >
> > > Is possible to configure the clock to be 100000Hz, but with a 50% duty
> > > cycle for this I2C bus on A3111D?
> > >
> > > Thanks
> > > Lucas Tanure
> > >
> > > _______________________________________________
> > > linux-amlogic mailing list
> > > linux-amlogic@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-amlogic

After some debugging, I got the 50% duty cycle working, but that was
not the issue.
The issue was that my device address is 0x22, the same as FUSB302B.

But FUSB302B is not on the device tree, so I didn't there was an
address collision.
I will push some patches for the duty cycle later this week.

Thanks
Lucas Tanure

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
