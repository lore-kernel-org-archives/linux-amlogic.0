Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDB5C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Mar 2022 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ik75j3yzYInGLDWsHpHhVOIOIRbhvUWlrj/9ocDrVxo=; b=JrTsddhwVQU3p1
	Ry9pGISLBmftr72DklRtQ5Ch7GFfiiL2tGUjrkQ+WNkW2HuLhYx4KT8sGHeRh9X1/6xLahmpg4y2t
	7nxJuzaMvKwifRBoireGIeg3Sbe3nX7UFtG/dqCXvXNcxrYurw1GLS7ZzSLg5si9DWNwLzeiQXp46
	UrC+GdbGyPx7H2aI9L7PQU+LcYA3ZSdW8WJvoCZweZZNTHW5De9J+nW00daktd8qxR2kEFXE1W6gi
	cI94Nae0gASkSkum+pdxn8Vmob2x6Ssf9SBvGVBpEbGS6rr3xx7R/6TjyMr5w7mbkgKUW583NKGqw
	wC76yai/uXVqfMWwplnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEy6-007JNY-IG; Mon, 21 Mar 2022 10:08:54 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEy3-007JMB-9O
 for linux-amlogic@lists.infradead.org; Mon, 21 Mar 2022 10:08:53 +0000
Received: by mail-ua1-f42.google.com with SMTP id a28so5578542uaf.7
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Mar 2022 03:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=0jUkLdiyqbkEdbaqE3rQexqq3veRUEVx67FHMuLSaBc=;
 b=J24RX6wawch3nXSVlIf9Y4VSW6rEcztfoQnQUEddHuHFBhtJQcRyF0QW11xuysqr2P
 yGhJchTYRzwaLh70Bfof79bgAA9CWQBFjY9xjyTyGjKHUidKtQdi89MnXAy9OPcObZ/6
 8/XUKdG2jbFWJqLl3fGp456KRKlxT2xvzj16e+g9NvaHvCJbgebALJapnVGutv+9EgsR
 Ksduum01++TpOKquFtTrwquwDGfZexf8ZafdOoHa3FT/kWEP5SlA9AuafPkeC9oQfXfv
 boW50Rpji6OODMDtW68M3u7eKRGe4TaeGp+wlgdE2ocy2lysxnMV73f2XWvSxzXv/0BQ
 6how==
X-Gm-Message-State: AOAM532pZYegJvTfrCOaP9m1LMSCIQXYMS1GINSxYHqhs6hfUahBpI6u
 mTQHJGYJeQOm5H142EC+PPziaQlEVvBoSg==
X-Google-Smtp-Source: ABdhPJyiMrEQOViZN1Zaz909FTvWohLoIZjzcJv6ZfMyK2CIMmj2SMxkN3qksSWnyXekDLPJxoxFuA==
X-Received: by 2002:ab0:3da4:0:b0:306:a7f8:f28b with SMTP id
 l36-20020ab03da4000000b00306a7f8f28bmr6656237uac.47.1647857328902; 
 Mon, 21 Mar 2022 03:08:48 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 r204-20020a1fa8d5000000b0033839b32d5esm1878343vke.48.2022.03.21.03.08.48
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 03:08:48 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id f68so2843762vsc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Mar 2022 03:08:48 -0700 (PDT)
X-Received: by 2002:a67:ee93:0:b0:320:7e6d:e088 with SMTP id
 n19-20020a67ee93000000b003207e6de088mr7044945vsp.1.1647857328418; Mon, 21 Mar
 2022 03:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
 <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
 <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
 <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
 <CAJX_Q+1OwvpypMXsdBpra8Ozys9DUEpbbqJipEqcuS2P3UqvVw@mail.gmail.com>
In-Reply-To: <CAJX_Q+1OwvpypMXsdBpra8Ozys9DUEpbbqJipEqcuS2P3UqvVw@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 21 Mar 2022 10:08:37 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3RcQZhi7haG8-7d7PzWcaRE-72Si3DCoetp=rbZHJ6+A@mail.gmail.com>
Message-ID: <CAJX_Q+3RcQZhi7haG8-7d7PzWcaRE-72Si3DCoetp=rbZHJ6+A@mail.gmail.com>
Subject: Re: VIM3 - A311D - I2C AO Clock Questions
To: Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, Beniamino Galvani <b.galvani@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_030851_360463_A2A9625F 
X-CRM114-Status: GOOD (  44.63  )
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

On Wed, Mar 9, 2022 at 9:39 AM Lucas Tanure <tanure@linux.com> wrote:
>
> On Tue, Mar 8, 2022 at 6:49 AM Lucas Tanure <tanure@linux.com> wrote:
> >
> > On Mon, Mar 7, 2022 at 8:29 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > >
> > > Hi,
> > >
> > > On 06/03/2022 11:23, Lucas Tanure wrote:
> > > > Hi,
> > > >
> > > > I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
> > > > My device uses a 100000Hz clock, but after changing
> > > > meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
> > > > not properly read its registers.
> > > >
> > > > It reads 0x9100, but the correct data should be 0xcb58.
> > > > The first thing I saw on the bus was that the frequency I requested by
> > > > the device tree was being set after the probe of my driver already
> > > > failed.
> > > > For that, I sent "i2c: meson: Fix wrong speed use from probe" which
> > > > fixes that issue.
> > > >
> > > > But I still get the wrong data, so my next guess is that the clock
> > > > duty cycle is 30%, and I think should be 50%.
> > > > Here is an image of the signals of the bus:
> > > > https://pasteboard.co/TEoxQucsXUUD.png
> > > >
> > > > I have tested other frequencies and all of them uses a 30% duty cycle,
> > > > where SCL is up 30% and low for 70% of the period.
> > >
> > > Indeed it seems by default the duty cycle is for Fast Mode, but standard mode should
> > > be around 50%. Did you try 400khz ?
> >
> > Yes, 400Khz has the same issue of 30% duty cycle.
> >
> > >
> > > Amlogic did some changes on their off-tree linux fork, please look around:
> > > https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143
> >
> > Thanks! I am investigating that code, but so far doesn't work.
> >
> > >
> > > I'm unsure when REG_SLAVE_ADDR BIT(28) appeared, but if you try to port this upstream,
> > > we'll be happy to review it for inclusion.
> >
> > I will try to get this working and push a patch.
> > Thanks
> > Lucas
> >
> > >
> > > Neil
> > >
> > > >
> > > > Is possible to configure the clock to be 100000Hz, but with a 50% duty
> > > > cycle for this I2C bus on A3111D?
> > > >
> > > > Thanks
> > > > Lucas Tanure
> > > >
> > > > _______________________________________________
> > > > linux-amlogic mailing list
> > > > linux-amlogic@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>
> After some debugging, I got the 50% duty cycle working, but that was
> not the issue.
> The issue was that my device address is 0x22, the same as FUSB302B.
>
> But FUSB302B is not on the device tree, so I didn't there was an
> address collision.
> I will push some patches for the duty cycle later this week.
>
> Thanks
> Lucas Tanure

Hi Jian Hu,

You sent the patch "i2c: meson: add configurable divider factors",
where it sets the div factor for Meson-AXG soc to be 3.
The current state of the clock is a 30% duty cycle, and I would like
to port a 50% duty cycle from Khadas 5.4 driver.

https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143

The problem now is that div_factor must be 4 for VIM3, as the value of
3 (current one) the clock is set wrongly.
The value of 3, plus the 50% patch sets the clock to be 85k instead of
100k, and the duty of 42%.

So, why div_factor is 3 for Meson-AXG?
Can we remove that patch "i2c: meson: add configurable divider
factors" and set div_factor to be 4 for all?

And it seems that for devices at I2C3, i2c@1c000, the Meson I2C driver
must be built as a module.
If I build the Meson I2C driver as built-in my I2C devices fail to
probe, but works if Meson I2C is a module that probes after 10 seconds
or so.
These 2 devices boot fine at i2c_AO, i2c@5000, even if Meson I2C is built-in.
But because of an address clash with FUSB302B a 3rd device, I need to
move all of them to I2C3.

Is there any requirement for I2C3 to work during boot? Any power or
clock that needs to be configured before I2C can be used?

Thanks
Lucas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
