Return-Path: <SRS0=unGP=RY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F08C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Mar 2019 11:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB8F218B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Mar 2019 11:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZIu2/3m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SPzqAfFc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB8F218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYGvQQQyw9lNSLeb+Zh2IqY+eF3Cu/5xLmamiUL/xIc=; b=dZIu2/3m76E+j5
	09nAzpqwEfzt11+n3BYGLWIdfrX1oGtPyjl+sdQBIbfOs1iOaDKZ967Tyypi7/6Xh2IFxcx0SL20/
	FMqsntqeIsAqXdNhWoJcSVLcg8bT767sAuMimlNCR3tsaGN6MTZdQPay5nhCQd7CG4G8cr8hE09tK
	P8XQ4OgOREaWoxv418QP5Cho3KTahXpH3SL3Yi/3G9qOcjG/7Jx5FL7yx2ErcNf2gB4M86eo428qZ
	FzjIXdcaZH1/NeYSDdAOGEh9htMWSbJtvRNp3KWEy7QtAMBsYGBD3kOHD9Nw5G3eGbnIQP29VURIt
	Pa2kQlij4vNtwyC7gRbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6w6G-0002OJ-0a; Thu, 21 Mar 2019 11:43:08 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6w66-0002F7-Kj
 for linux-amlogic@lists.infradead.org; Thu, 21 Mar 2019 11:43:00 +0000
Received: by mail-wr1-x444.google.com with SMTP id p10so6238936wrq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Mar 2019 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59vR2A+euBJN67GSOF7WwYlE4GrC2rdZixdgHu8KXFA=;
 b=SPzqAfFcZOqJFtRDDMtvVo+VyuHgxdzzlkNf31ph7Z0/bYXuHib8HlB1A2924t6Fx+
 SypyvnU23tZLyG31hBzu3jZN9U1bUKqk/vdEziOFUf5zsLls+nrXF9W3J05sBTPXSGaL
 btBBUHOtnsPOJHiaAQ6oL+/1HRFVXpOcn6NdaEBjUc2kILs+3MtBcwObCdGRwtMyjS42
 VtVKQ8SuClZ/WJe1QYyM3ey48j6RWCQJndwJtvIOduMO9SvKgiKzLoArBZ9utd9BuSPT
 VK7Jtl8ZR2grStniBz5Ts6p5x2bBaG5dCaKuPMdq4l52mINR8eY2LZdlOIbW7sPqXJtj
 cFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59vR2A+euBJN67GSOF7WwYlE4GrC2rdZixdgHu8KXFA=;
 b=c8uYQGoKhvSLsE64g3UfxGx6Q1RGj3pvg6+nSbVTc2WBlAs0ka6VHjRODz7YsXnstF
 h2gzdOetohLnX8FK9dy1Fk1jXQjLu6V8xJQbaCxfjO8kHMnm3jRnDqg5MqBqufTc/00B
 PaH7TqFPsNYtEWBD3jGqmqUhAKaZJGBZvWWUaQ3861KMIpqJLlrdb95fgATrbEcKv3nd
 5VdMFQZIEKdYAzegv+tM4EwXZLQzfRJx6epeSe2xbiONQOniPJd1QGduiOPRAvhpeC/0
 9Pn6zzhyesMALsQZC25MMUgSTidg9bv+WagBt2vKH1TK28rKJoVS8nomRaTj6BThcI8j
 VBFg==
X-Gm-Message-State: APjAAAXtWqSviCvjz5C/N7ZUOzO/U5n3u3/ovEc9hTGL5s6hBW5kRcis
 VqWXCtawctwF7BQwu52MEBwenHvi3x2i0ccFcPPx9A==
X-Google-Smtp-Source: APXvYqxZ34sTxFSQXNIkibuzBKuMCfbwSqdSa8Y+VtsnHDC1q7+XT6KALtfnOECI+q6NJymYvsBgXs5YMfZDKSgr+AI=
X-Received: by 2002:adf:f147:: with SMTP id y7mr2153774wro.102.1553168576647; 
 Thu, 21 Mar 2019 04:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
 <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
 <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
In-Reply-To: <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Thu, 21 Mar 2019 12:42:45 +0100
Message-ID: <CAMO6nawCPH_VP1D6cbGtPVVNsKyoSqaGbe2pNmBq=HqZ80tP-w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_044258_731438_F763CF44 
X-CRM114-Status: GOOD (  23.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 9:53 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Maxime,
>
> On Wed, Mar 20, 2019 at 12:16 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
> >
> > Hi Martin, thanks for looking into the video decoder for meson8!
> you're welcome - this is only possible because of your work on the
> video decoder driver!
>
> > On Tue, Mar 19, 2019 at 11:00 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > This adds the four video decoder clock trees.
> > >
> > > VDEC_1 is split into two paths on Meson8b and Meson8m2:
> > > - input mux called "vdec_1_sel"
> > > - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
> > >   and "vdec_1_2")
> > > - and an output mux (probably glitch-free) called "vdec_1"
> >
> > Yes, all vdec clocks have a glitch-free mux to be able to safely
> > adjust the frequency on the fly, although in practice it's barely
> > used.
> >
> > > On Meson8 the VDEC_1 tree is simpler because there's only one path:
> > > - input mux called "vdec_1_sel"
> > > - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> > > - (the gate is used as output directly, there's no mux)
> > >
> > > The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> > > consisting of an input mux, divider and a gate.
> > >
> > > The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> > > However, the register offsets of the second clock path is not known.
> > > Amlogic's 3.10 kernel (which is used as reference) sets
> > > HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> > > to 0 afterwards. For now, leave a TODO comment and only add the first
> > > path.
> > >
> >
> > Looking at aml-3.10/drivers/amlogic/amports/m8b/vdec_clk.c, it's weird
> > indeed. They seem to copy the divider's value to the same place
> > (HHI_VDEC2_CLK_CNTL[16~23]), and the only thing that stands out is
> > enabling HHI_VDEC2_CLK_CNTL[31].
> >
> > Then again they don't make use of that codepath at all, so who knows..
> indeed, that's why I skipped it for now
>
> [...]
> > > diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> > > index e775f91ccce9..ed37196187e6 100644
> > > --- a/drivers/clk/meson/meson8b.h
> > > +++ b/drivers/clk/meson/meson8b.h
> > > @@ -37,6 +37,9 @@
> > >  #define HHI_MALI_CLK_CNTL              0x1b0 /* 0x6c offset in data sheet */
> > >  #define HHI_VPU_CLK_CNTL               0x1bc /* 0x6f offset in data sheet */
> > >  #define HHI_HDMI_CLK_CNTL              0x1cc /* 0x73 offset in data sheet */
> > > +#define HHI_VDEC_CLK_CNTL              0x1e0 /* 0x78 offset in data sheet */
> > > +#define HHI_VDEC2_CLK_CNTL             0x1e4 /* 0x79 offset in data sheet */
> > > +#define HHI_VDEC3_CLK_CNTL             0x1e8 /* 0x7a offset in data sheet */
> > >  #define HHI_NAND_CLK_CNTL              0x25c /* 0x97 offset in data sheet */
> > >  #define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data sheet */
> > >  #define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data sheet */
> > > @@ -156,8 +159,20 @@
> > >  #define CLKID_VPU_1_SEL                186
> > >  #define CLKID_VPU_1_DIV                187
> > >  #define CLKID_VPU_1            189
> > > +#define CLKID_VDEC_1_SEL       191
> > > +#define CLKID_VDEC_1_1_DIV     192
> > > +#define CLKID_VDEC_1_1         193
> > > +#define CLKID_VDEC_1_2_DIV     194
> > > +#define CLKID_VDEC_1_2         195
> >
> > In order to make use of the glitch-free mux by the driver, shouldn't
> > CLKID_VDEC_1_1 and CLKID_VDEC_1_2 be exported in the bindings ?
> I considered this but I didn't export them because of three reasons:
> - the video decoder driver doesn't have any logic to use the glitch-free mux yet
> - assigned-clock-rates or clk_set_rate will figure out the parent
> setup on it's own if we ignore the glitch-free mux until the video
> decoder driver supports it
> - exporting CLKIDs is easier than un-exporting them
>

Sure, makes sense. We'll revisit those in the future if we add on the
fly frequency adjusting to the vdec driver.

Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

> Regards
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
