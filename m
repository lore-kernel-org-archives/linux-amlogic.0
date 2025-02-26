Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA8C021B8
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Feb 2025 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-ID:Date:Subject:
	In-Reply-To:References:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QWAm4OApA0sZ6jsaXxPXyZfPxtMjqGjkJhllU3nYqw=; b=xoTDliQuNbqoRa
	ZCiU3ecFb2mtg5pNM+B783e0RJ5gIpN2ZzaHm5hWG6BhS/rYA9orfM+MC563UGwS1MknaKJ73P+BH
	RGjO35JN8j1+Iw4pllM+mHqXcj4Z826Gaeg86wJjFQBMie06h0qv9f15WDBYlqTDaRZLWYEve74gk
	X4ctuWtYpxC2VeJOuvC8UGTSZ+nAlB4k7JPqjB6dir2VViPovXkO9DfNq41fT7K1hsM/PEXlzwIah
	nloCW2sYwPHwEAtcMZjcgciaFxVlcI68qjeqU2L+EALPGN+jYVbe2dC/1BrxLMv8Dqb6RSdUmhhse
	afPkXv06MyHSvt32N3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOC3-00000005MtP-0a4d;
	Wed, 26 Feb 2025 20:39:47 +0000
Received: from mail.mvand.net ([185.229.52.35])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnOBz-00000005Msz-3zub;
	Wed, 26 Feb 2025 20:39:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.mvand.net (Postfix) with ESMTPSA id C6A1B1FE54;
	Wed, 26 Feb 2025 21:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=martijnvandeventer.nl; s=default; t=1740602379;
	bh=Us1Ow4+6XA3oM8CNVlGcAJVhehzo86KySSpNCM9g1Mg=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:From;
	b=hqGR0Othq8GqD+Fmyma4JQQO33n6Sx7TUB9dim/KvrVtYWLQ+J5Puc7ypC8piUv4A
	 ngsDRZqBnOb9VALJ8nfBl43nZ90KfdCPlBs9GPsFmAtXFbOT6VqqmJXl655EWVwaG/
	 fHhNktlcqhXRgeqfhBtpSOE3mGqNJi7ZTZNVaSEMzND5i30Gvvq+ET2OFfbG0153Ad
	 vZejdWhT9RxYiI0FvvUtsAQOGsR4kUeY1mEfOTCfuqwH2tpwrwmsazTReRvbwnRR9J
	 kk0pkvggl/C+gs73nO28lPh+OQ05Uzw2WPb7vrBP25tGR414NvFdZkz/cxAI5JvZmw
	 msR4QXHrdNtnA==
From: <linux@martijnvandeventer.nl>
To: "'Jerome Brunet'" <jbrunet@baylibre.com>
Cc: "'Neil Armstrong'" <neil.armstrong@linaro.org>,
	"'Michael Turquette'" <mturquette@baylibre.com>,
	"'Stephen Boyd'" <sboyd@kernel.org>,
	"'Kevin Hilman'" <khilman@baylibre.com>,
	"'Martin Blumenstingl'" <martin.blumenstingl@googlemail.com>,
	<linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20250213221702.606-1-linux@martijnvandeventer.nl> <1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jpljkzyf0.fsf@starbuckisacylon.baylibre.com>
Subject: RE: [PATCH] clk: meson: g12a: Fix kernel warnings when no display attached
Date: Wed, 26 Feb 2025 21:39:39 +0100
Message-ID: <003301db888e$8ea84e90$abf8ebb0$@martijnvandeventer.nl>
Mime-Version: 1.0
Thread-Index: AQH3Houg6kGqwWGxu7A7A+ZA83tGEAI4axMrsxEbdYA=
Content-Language: en-us
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_123944_191313_721F95EF 
X-CRM114-Status: GOOD (  25.10  )
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

Hi Jerome,

Thank you for reviewing, and apologies for my late response due to a holiday.

> On Thu 13 Feb 2025 at 23:17, Martijn van Deventer
> <linux@martijnvandeventer.nl> wrote:
> 
> > When booting SM1 or G12A boards without a dislay attached to HDMI,
> > the kernel shows the following warning:
> >
> > [CRTC:46:meson_crtc] vblank wait timed out
> > WARNING: CPU: 2 PID: 265 at drivers/gpu/drm/drm_atomic_helper.c:1682
> drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> > CPU: 2 UID: 0 PID: 265 Comm: setfont Tainted: G         C
> > Tainted: [C]=CRAP
> > pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> > lr : drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> > Call trace:
> >  drm_atomic_helper_wait_for_vblanks.part.0+0x240/0x264
> >  drm_atomic_helper_commit_tail_rpm+0x84/0xa0
> >  commit_tail+0xa4/0x18c
> >  drm_atomic_helper_commit+0x164/0x178
> >  drm_atomic_commit+0xb4/0xec
> >  drm_client_modeset_commit_atomic+0x210/0x270
> >  drm_client_modeset_commit_locked+0x5c/0x188
> >  drm_fb_helper_pan_display+0xb8/0x1d4
> >  fb_pan_display+0x7c/0x120
> >  bit_update_start+0x20/0x48
> >  fbcon_switch+0x418/0x54c
> >  el0t_64_sync+0x194/0x198
> >
> > This happens when the kernel disables the unused clocks.
> > Sometimes this causes the boot to hang.
> >
> > By (re)adding the flag CLK_IGNORE_UNUSED to the VCLK2 clocks, these
> > clocks will not be disabled.
> >
> > This partially reverts commit b70cb1a21a54 ("clk: meson: g12a:
> > make VCLK2 and ENCL clock path configurable by CCF").
> 
> It looks like DRM needs those clock enabled regardless of connection
> status on HDMI. Even with this change applied, you would get the same
> problem again if the bootloader does not take of turning the clock on,
> which is not a given.
> 
> CLK_IGNORE_UNUSED gives not guarantee a clock will be enabled or stay
> enabled at any point.
> 
> A proper fix to this issue should be done in DRM, IMO.

I know and I totally agree. Unfortunately, I don't have access to any vendor 
documentation, nor do I have any real knowledge about the DRM/HDMI 
subsystem to fix that.

And I guess if it were as easy as adding a clock to the DT and calling 
clk_prepare_enable on it in the probe function, Neil would have done that 
already.

So, all I can do, for now, is revert to the previous situation when it did  work
for (probably) most boards. 

> >
> > Fixes: b70cb1a21a54 ("clk: meson: g12a: make VCLK2 and ENCL clock path
> configurable by CCF").
> > Signed-off-by: Martijn van Deventer <linux@martijnvandeventer.nl>
> > ---
> >  drivers/clk/meson/g12a.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> > index cfffd434e998..1651898658f5 100644
> > --- a/drivers/clk/meson/g12a.c
> > +++ b/drivers/clk/meson/g12a.c
> > @@ -3234,7 +3234,7 @@ static struct clk_regmap g12a_vclk2_div = {
> >  			&g12a_vclk2_input.hw
> >  		},
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_GATE,
> > +		.flags = CLK_SET_RATE_GATE | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> >
> > @@ -3270,7 +3270,7 @@ static struct clk_regmap g12a_vclk2 = {
> >  		.ops = &meson_vclk_gate_ops,
> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2_div.hw
> },
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_PARENT,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> >
> > @@ -3354,7 +3354,7 @@ static struct clk_regmap g12a_vclk2_div1 = {
> >  		.ops = &clk_regmap_gate_ops,
> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_PARENT,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> >
> > @@ -3368,7 +3368,7 @@ static struct clk_regmap g12a_vclk2_div2_en = {
> >  		.ops = &clk_regmap_gate_ops,
> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_PARENT,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> >
> > @@ -3382,7 +3382,7 @@ static struct clk_regmap g12a_vclk2_div4_en = {
> >  		.ops = &clk_regmap_gate_ops,
> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_PARENT,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> >
> > @@ -3396,7 +3396,7 @@ static struct clk_regmap g12a_vclk2_div6_en = {
> >  		.ops = &clk_regmap_gate_ops,
> >  		.parent_hws = (const struct clk_hw *[]) { &g12a_vclk2.hw },
> >  		.num_parents = 1,
> > -		.flags = CLK_SET_RATE_PARENT,
> > +		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
> >  	},
> >  };
> 
--
Martijn


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
