Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0D0C76191
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 984F22238C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MZqNMnqP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2kS5kGz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 984F22238C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14NUKVVpgiIgGzxNsxBinIdx80tKUGIC0FviZO4wPLo=; b=MZqNMnqPtWH1Mj
	XCAQks3RD6oaKkq9ZhYmy1FDyHoj62j/JGOCqGVaznyqFKD9o3oxVjqS1gkoUDkBh4Q1A7hetBP5/
	VYV8AImg4YRX4guBTUDED8c0LlEjLkYJVk7y2byNB/KJwxeTjBa772qZK6ut6g28KsnGuJ1UTgTcB
	4LR64iAFfimoKkT0xEpoZMK8UKQixWE8QTkuMJg2JVGxNbu0M2tJuT0w6RhZcUBdE3MrDltXYsA6H
	lv864ap62/fdHB9G661vuPFh1/SO3paP+ww13UTwEMMCYWKpjAiEXzOG9YJu0qQG8xo2qvib0YLsq
	MN229QAxiRQ/wz2tu5rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqhFJ-0000ol-Fg; Thu, 25 Jul 2019 17:09:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqhFG-0000oE-93; Thu, 25 Jul 2019 17:09:35 +0000
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6733E22C7C;
 Thu, 25 Jul 2019 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564074573;
 bh=rkdM8CWr1A1LMWe/EH04Dnfcj0n7tqCfgrgm7BTi5jQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=V2kS5kGzF++a03Gk5zIP6RZHen6WFgWlfieoKDlrHqhEHPec5TNp/uyFIM1M9uehw
 LnN/eGuu4aLZCbQHXlzK4cEM25XKPTnaNYChzXcEWdoNw9zQyjL+vFPdlyy6PV4aH5
 wyN/g5oynAZo0AxPt7Dvwsws0Sm+M9vkaj0veq4o=
Received: by mail-wr1-f52.google.com with SMTP id p13so51544001wru.10;
 Thu, 25 Jul 2019 10:09:33 -0700 (PDT)
X-Gm-Message-State: APjAAAUyapbx3QmtplWVk2r8DJPtzsb1qh2JowR/7/emSHemOR/wVbCV
 a+/AxS1+7Ia7bIj2mpjryM6oeU6g2Eu5xCcFOXI=
X-Google-Smtp-Source: APXvYqyhMUD0VRm57goMo+umKK9xrgzMe/ILEaoUR4e6spWK6lgrnxam7yAoo2qceAKGdHiCpgWiUDRXhXO1xXYbZ1k=
X-Received: by 2002:adf:c613:: with SMTP id n19mr39171710wrg.109.1564074571943; 
 Thu, 25 Jul 2019 10:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190722095425.14193-1-amergnat@baylibre.com>
 <20190722095425.14193-4-amergnat@baylibre.com>
 <1j5znqxj74.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j5znqxj74.fsf@starbuckisacylon.baylibre.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 26 Jul 2019 01:09:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
Message-ID: <CAGb2v64AJFMkZQaytYMN+EsLT0sS-3VwzWUfb3g7SdL7kCfu+g@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: meson: gxbb: migrate to the new parent
 description method
To: Jerome Brunet <jbrunet@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_100934_353411_E1A5A68F 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, baylibre-upstreaming@groups.io,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jul 25, 2019 at 10:50 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Mon 22 Jul 2019 at 11:54, Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
>
> > @@ -1592,13 +1737,29 @@ static struct clk_regmap gxbb_vid_pll_div = {
> >       .hw.init = &(struct clk_init_data) {
> >               .name = "vid_pll_div",
> >               .ops = &meson_vid_pll_div_ro_ops,
> > -             .parent_names = (const char *[]){ "hdmi_pll" },
> > +             .parent_data = &(const struct clk_parent_data) {
> > +                     /*
> > +                      * This clock is declared here for GXL and GXBB SoC, so
> > +                      * we must use string name to set this parent to avoid
> > +                      * pointer issue.
> > +                      */
>
> I don't really get the issue with this comment.
>
> How about:
>
> /*
>  * Note:
>  * gxl and gxbb have different hdmi_plls (with different struct clk_hw).
>  * We fallback to the global naming string mechanism so vid_pll_div picks
>  * up the appropriate one.
>  */

If you're sticking to global names for now, you could just skip converting
this clock altogether. I suspect .parent_names will be around for some time.

On the other hand, if you really want to get rid of global clock name based
parenting, you could use clk_hw pointers, and have the probe function fix
up this one based on the compatible string. That's what I did.

Just my two cents.

ChenYu

> > +                     .name = "hdmi_pll",
> > +                     .index = -1,
> > +             },
> >               .num_parents = 1,
> >               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> >       },
> >  };
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
