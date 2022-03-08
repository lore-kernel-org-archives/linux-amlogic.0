Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4399C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djjrF1c12D91favjCWiQ4ZTPCsDe5bHRF95V2MWFN3Q=; b=VHGqZeUX4eiMxm
	N45LtGOpaacTboSK3yTlcrfTZ6jCjt4MYPt5Py4YgVLQ/bpbM828zHSXamSefFORqNFkjF9/D3Dgc
	c0fy68+lrm6FwA5OB70mkb9Tzy+QfvaEgwqbWdKoj8LrYr4s1uUD/5vBUfAdgjb3K7nQuqHvgTQE3
	zrCWsRBAsNYsme4fqmpi+gdwfazUGXRLAqOFdnFFxCtzAhCPQaogfWYwC1htea6elLjQ9OzSnRonu
	rVIws/x+RgpaoRgp1QBuaSvxAkvDvF4Hal5OVjD2o2HibZ53ZkMpAs+8WCmFMdqBl8LC14NaBlTB9
	VlIjO/yfigy9FbjQ5Q7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRTfg-002xcZ-8x; Tue, 08 Mar 2022 06:50:12 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRTfc-002xax-H2
 for linux-amlogic@lists.infradead.org; Tue, 08 Mar 2022 06:50:10 +0000
Received: by mail-vs1-f42.google.com with SMTP id g21so19447853vsp.6
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 22:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=nopGcEy36OPDlMROTeq0NgMiqAfG6qBAsFXtTFqueWw=;
 b=OpGJI2rjarAivWO1SmcMRGKqLQHza0tUBdBKSahVl5kvjXPtdI14FqvP2rMn/KXR6u
 3Y5vGl/9ulz23mxSFZ3j6UEP90/XXykcu4fCpWTAAK49MLxeg/dF+fXcZObiYwplbwjO
 vVFLMt0LMQ0tClwdfmCud0YFhKGWPJiC64EoZmfWKobbQsEh3FoaucxrLalF31Gb24cR
 LGF1Hp5iB31fCaZx+Dzm9TWat8BFYnjkUoIz1u60aIhbRRMOkcO+SA8O2yc6yZajWGgm
 4X44MXBjr/ZRwKGq6mN3nxNihZggksR+OiKORun0QSPDLdwlw2Hr9xdsU1s6fbe9sKx/
 tPHQ==
X-Gm-Message-State: AOAM533Ix0Jvzeb51rD+2Ci7QQNuElOl/V70b0aTVFm+SYVpIZusVVzN
 JfUmdNfiHWZiu6NQyuOsMusnR9+QtHV7PQ==
X-Google-Smtp-Source: ABdhPJxJmKOPPNgj5NMMFjcKBgda943uLjfkQfT2fTPEJR/aKVtO1UP9uKNurgQLXMLVzUf4jz3dyw==
X-Received: by 2002:a05:6102:15a3:b0:320:a577:1fd1 with SMTP id
 g35-20020a05610215a300b00320a5771fd1mr4271096vsv.17.1646722206232; 
 Mon, 07 Mar 2022 22:50:06 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54]) by smtp.gmail.com with ESMTPSA id
 h20-20020a056122065400b0032d7987ef1asm2147778vkp.11.2022.03.07.22.50.05
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 22:50:06 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id b37so7531137uad.12
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 22:50:05 -0800 (PST)
X-Received: by 2002:ab0:380f:0:b0:34a:6820:9171 with SMTP id
 x15-20020ab0380f000000b0034a68209171mr5402501uav.98.1646722205771; Mon, 07
 Mar 2022 22:50:05 -0800 (PST)
MIME-Version: 1.0
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
 <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
 <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
In-Reply-To: <35db71b9-6574-b517-9687-33a826647821@baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 8 Mar 2022 06:49:55 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
Message-ID: <CAJX_Q+29A9zqTar=tR5JuV3xrEWQCOYu-ymw0W2368eT5AZU8A@mail.gmail.com>
Subject: Re: VIM3 - A311D - I2C AO Clock Questions
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_225008_595401_2DD3F76A 
X-CRM114-Status: GOOD (  28.92  )
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

On Mon, Mar 7, 2022 at 8:29 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 06/03/2022 11:23, Lucas Tanure wrote:
> > Hi,
> >
> > I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
> > My device uses a 100000Hz clock, but after changing
> > meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
> > not properly read its registers.
> >
> > It reads 0x9100, but the correct data should be 0xcb58.
> > The first thing I saw on the bus was that the frequency I requested by
> > the device tree was being set after the probe of my driver already
> > failed.
> > For that, I sent "i2c: meson: Fix wrong speed use from probe" which
> > fixes that issue.
> >
> > But I still get the wrong data, so my next guess is that the clock
> > duty cycle is 30%, and I think should be 50%.
> > Here is an image of the signals of the bus:
> > https://pasteboard.co/TEoxQucsXUUD.png
> >
> > I have tested other frequencies and all of them uses a 30% duty cycle,
> > where SCL is up 30% and low for 70% of the period.
>
> Indeed it seems by default the duty cycle is for Fast Mode, but standard mode should
> be around 50%. Did you try 400khz ?

Yes, 400Khz has the same issue of 30% duty cycle.

>
> Amlogic did some changes on their off-tree linux fork, please look around:
> https://github.com/khadas/linux/blob/khadas-vims-5.4.y-fc/drivers/i2c/busses/i2c-meson.c#L143

Thanks! I am investigating that code, but so far doesn't work.

>
> I'm unsure when REG_SLAVE_ADDR BIT(28) appeared, but if you try to port this upstream,
> we'll be happy to review it for inclusion.

I will try to get this working and push a patch.
Thanks
Lucas

>
> Neil
>
> >
> > Is possible to configure the clock to be 100000Hz, but with a 50% duty
> > cycle for this I2C bus on A3111D?
> >
> > Thanks
> > Lucas Tanure
> >
> > _______________________________________________
> > linux-amlogic mailing list
> > linux-amlogic@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-amlogic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
