Return-Path: <SRS0=U5JB=6T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B866C47247
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 08:18:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412B82068E
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2020 08:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gdvwRTTP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lizeE891"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412B82068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtCTfGoOWdKWygNSq/j5xqDXPdcZu5/jy74sozuz6Gc=; b=gdvwRTTPhV/zZq
	R192G/NVgvaBvBpnaykB4syT4Kk0B26YleqFxtT5RR9OjK12bqqcSst16v/DXx0aQHavMdgIT5F8c
	mXW3hsf5onPJq1Z5BEN4Cns7pNADxfo9GkH7D6ty1tmjFiG10d2EoJO/wqwULzGWk46r5j6w/S9tk
	vxkIaYKoVwhyVKSLR7/VS+wElmLls2Mv9brgHiBhld71vKxiRBAZIWKBjoeID+8qGbYpjZm+7dox6
	nqRy+wUUaJ1Cfdu/08phyY+gu0GVLZtmTtecN3UBB9FdcEfM3Yx2TMflD9cKLpWfnmY7/TvC6bbJy
	y6IMWUWvewWwUlvhjK0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVsm6-0003rj-3X; Tue, 05 May 2020 08:17:58 +0000
Received: from mail-vk1-xa41.google.com ([2607:f8b0:4864:20::a41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVsm1-0003oJ-AQ
 for linux-amlogic@lists.infradead.org; Tue, 05 May 2020 08:17:56 +0000
Received: by mail-vk1-xa41.google.com with SMTP id j1so275657vkc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 05 May 2020 01:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbQ/NUsTl64Wiv4a1ipzIuD3CBdf0yc6n6AHT0AzX6s=;
 b=lizeE8913OsCMHce51oPvAyEnSr00jzla8Wj9ZJX8Yj4J1Psb7aJ12HDbUuxzEASuV
 CJOcUf/1RPpJ18db073V2gTXAgZrhjOiqKsFQTtxkRjpOYi7p+8iPI6IgM2MLiGzaKLy
 cLIvq0bhk4yEFz1lkPgzduKThkyI9/FNNBUECjt00MMWx/SmSy1QyuQ90mKXKVovzmJ9
 4fKGh0hJnh1TGnDmYd/ZhNdLxC+6X+tPCtAfmgDvTlLfG9iZKYS2tw377gR8NwBlvma+
 N8uaPL/HAJq4slF/CQIAr93/bDUWK4Xy5o9CeYh1dInheigK6z+mx2xsFNL4I2ItVIiH
 Sw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbQ/NUsTl64Wiv4a1ipzIuD3CBdf0yc6n6AHT0AzX6s=;
 b=QO9diUVXrGTkV9dzmrP9trUlUFsjl3QECfozdpwZY3hw6PoTmgr/BJK2lakgeZl4aa
 yMy9RMezTsdv+OqcTSshrH/Lp9nj/euKwQLfWZ+gL/TZgIDibQM3BgqF8nRbXYul4lql
 CCG5yRzkx+pV8nu2jxQNA63qlpnTJrEcH7/H+evJS62HtXSuee3aL5fPshoahBXJbdtD
 QB5ldCHiEkqCSSaJfq8yFtMKpPVM95xO3I5lPuEybTgQoivrNlRntGagVBybxfuhoO2W
 Qy3JzT/x3VL4/6/RvaAmapmY2nrLos6KqaModL5LyoMIvQE/A9iIfu3aHLbmBKYIkRI5
 CnbQ==
X-Gm-Message-State: AGi0PuZKJKsbWLInu5gGZotG/YOzuE76hahPGyqc13ostpuHnMEqB93m
 gafbFp/gg/lZeyJqZj6P3pO1P1mqmi5IUAg9EUs78w==
X-Google-Smtp-Source: APiQypJn4YPdoD6blL7gFwU0ijM52tdeLzBf7tlSaUAOwu8rfRRQ9Nd8hu+SfYhQA6qyrUO32C4i1Xcp+YT+RFkLY84=
X-Received: by 2002:a1f:a60b:: with SMTP id p11mr1325157vke.43.1588666671822; 
 Tue, 05 May 2020 01:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200428210229.703309-1-martin.blumenstingl@googlemail.com>
 <20200428210229.703309-3-martin.blumenstingl@googlemail.com>
 <1jlfmdi9uw.fsf@starbuckisacylon.baylibre.com>
 <CAPDyKFoEh8qKYFONo1SHnvwhDwjUa5bMnnT1Kbu8=4rd=T-8Kg@mail.gmail.com>
 <1jh7x1i3hj.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jh7x1i3hj.fsf@starbuckisacylon.baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 5 May 2020 10:17:15 +0200
Message-ID: <CAPDyKFq_USCNNps3s4+C_1hriycrxtRMKJvnPFcP59CZmLXbGw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mmc: host: meson-mx-sdhc: new driver for the
 Amlogic Meson SDHC host
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_011753_408354_9D7EEE08 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: DTML <devicetree@vger.kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Boyd <sboyd@kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Anand Moon <linux.amoon@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[...]

> >> > +
> >> > +     return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> >> > +                                        onecell_data);
> >>
> >> I think registering a provider for a module that does not provide clocks
> >> to any other device is a bit overkill.
> >>
> >> I understand the matter is getting the per-user clk* pointer.
> >> Since this is the module registering the clock, you can use clk_hw->clk
> >> to get it.
> >>
> >> Once you have the clk* of the leaf clocks, you don't even need to keep
> >> track of the clk_hw* since you are using devm_
> >>
> >> Afterward, we should propably discuss with Stephen if something should
> >> be added in CCF to get a struct clk* from struct clk_hw*.
> >>
> >
> > [...]
> >
> > Hmm.
> >
> > I am not sure the above is a good idea, at all. Unless, I am
> > misunderstanding your point, which may be the case.
> >
> > I think above "shortcuts" could lead to abuse of the clock framework
> > and its internal data structures. When going forward, this could make
> > it unnecessary harder to maintain the clock framework.
> >
> > I know, it's not my responsibility, but from my experience with MMC
> > and SDIO interfaces, is that those have been too easy abuse - since
> > most of the data structures and interfaces have been exported. Now,
> > it's hard to roll back that, if you see what I mean.
>
> Indeed, it worth clarifying this first.
>
> With clk_register deprecated in favor of clk_hw_register, we are likely
> to see that case rise elsewhere.
>

So, according to the separate discussion [1], I think we can let
Martin decide what option to implement at this point.

1. Implement the "clk_hw_get_clk()" approach. The preferred option,
but requires wider changes of the clock subsystem as well.

2. Keep the existing approach, with devm_clk_get(). I am fine with
this as well, we can always switch to 1) later on.

[...]

Kind regards
Uffe

[1]
https://www.spinics.net/lists/linux-clk/msg48373.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
