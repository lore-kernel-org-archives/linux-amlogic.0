Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC1AC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdAaukKTiPhRwOruzpX4pGVKxd/WzQGFRl+p4P+Zgc0=; b=DlM6AMwAkg1pNR
	K2bmmgf1DrcRLP6TZARp73RDonKZIe/X5WoGQniEA2DJWrT3sPX7SZR5MdR6oC/VRqOrvPESUlpVD
	XQsqYDw2lt1cMVBaRMdCAgwM+5zfbcfVs7/dE76nwOgQuSAcd+VCPUnBPKh7Sf9Znj99qobskk0TA
	7ajGcGFvCAcN01cZCzK2Q8Zv66+cEIRUUf+sD7uoVvWXxgEbmo5oCwSYc3PnYK/72gW5TQkSKC1n0
	574nxQGD6SPvN5bC/+DsswVF5VTEnJgvcR0rpYralYjDk9s2wuw75J6A6bD8Jv8eHXfwZh3t+gRIV
	hsdOhWuKzqZTGRaGq++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZrts-001qo6-9m; Thu, 31 Mar 2022 10:19:32 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrto-001qnA-VU
 for linux-amlogic@lists.infradead.org; Thu, 31 Mar 2022 10:19:31 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E1BF5C01B3;
 Thu, 31 Mar 2022 06:19:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 31 Mar 2022 06:19:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=aIIdikQ6BinNUj
 lLTKP7oRxwmVl6g9SbKG/hAgruEic=; b=HxlxHD+e8wxAkM73dNVXPWGE3qDmdG
 5ffDJI3vQHUykPaDNwy59OCk4u1beSzwPuVmOLcu/rwpqoG4nx06YH9VhfDCHNZ6
 +ohz0efnEiHKbpfpvOVFZc6lXJC5DuFble/X2Kdg8J2QCFOaB5Vyb5B6qYmwlFL/
 MVp2v8N5vaLTK/7s8L8r4X4lF/eUQJaUl/set5DUL0yIdCNxr+xkx1KE/QvGknMj
 tKsmi3IthtBqNRvzJsHesxwD4T87oshC+wMBiD7+KlxjIoV4uWAkGINvCVO4yka3
 Jh+Uo94ekyypEprG5F4Ax+nPTRQ+S2nVH9lpmt3mlH935+qwRQbwhaVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=aIIdikQ6BinNUjlLTKP7oRxwmVl6g9SbKG/hAgruE
 ic=; b=QKfkxoWADkg9OGe5Fm1C5or+nxS8ydkHOK8CimajDNfRHP3qfPWAujS9G
 MjrR2+kk6we4txWlkVX1GMN49+gByYXhSzU6DKlBeVcFVrk4JB+31IvEdj+y1lDt
 yo3K/WnSKCLLweeIq1FcrymX1I40jQ9uEJil3agdHYLtRSUdcT0ZMdKIrMu3tON8
 1nqi3zVaKky3bLkTwdF2QnlzMkbfA8jGBtFnvvZ79vfh5MlSA62or582I8EvnaDw
 y5PJjLlYm/qRAuwvp0NjhG8Pp/+DYbP7JkNhYJR+Bk9scLAeWn9qnWWP9w5mEjvN
 lwRUJQir2P6lkCa5D0wfMdwAj+5mA==
X-ME-Sender: <xms:KoBFYiz5CijH9U9O6rXJywNXtUVO9PrSwQFDY0Dc74KqWCgvrMSApw>
 <xme:KoBFYuS7Dw2nDPgvLECIUSOG5OKxPN3Gqh2fa4aSAdv4i8kjcFo1vHXdVXuwd5K1f
 6h-51JpwrHlLj9lI9Q>
X-ME-Received: <xmr:KoBFYkUwEpgAXkpS6LuC5_kzeOdjeIZwlV7umUD38mvuVFJBMG3VqgimOArPcvHTcjWqEo00zb2JONKPBdd9KPcfycnSd6yKa8wUR54>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeehledvhfeklefgveelkeeludevffethfdukedvfffhhfegfeeugfehgeef
 jeevtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KoBFYoj3m7HQ83GLNhSWdcxMydurXjmV14AsrRphh1blxxz3fkKTmg>
 <xmx:KoBFYkBZcB22RZCTD1u5ghaZ7WFCLZqhTYq5pZ3XdlJdiIHWTNHKcg>
 <xmx:KoBFYpIc7MAfpzwy1nuttYOtJZP3a23F3gydzX_2bms6Cn45Kpn50Q>
 <xmx:K4BFYj5SUJfBWhO1wf3oJTr7KXwhJi6DhiNFqsbqxm2B6vIRyUXL7A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 06:19:21 -0400 (EDT)
Date: Thu, 31 Mar 2022 12:19:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220331101919.urqhi2cspyjfthlj@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7465a7dc-c45e-2612-4c39-d15eceb9b75c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_031929_652441_AE37D979 
X-CRM114-Status: GOOD (  32.86  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Mar 31, 2022 at 11:56:51AM +0200, Marek Szyprowski wrote:
> Hi,
> =

> On 30.03.2022 10:47, Maxime Ripard wrote:
> > On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> >> On 25.03.2022 17:11, Maxime Ripard wrote:
> >>> While the current code will trigger a new clk_set_rate call whenever =
the
> >>> rate boundaries are changed through clk_set_rate_range, this doesn't
> >>> occur when clk_put() is called.
> >>>
> >>> However, this is essentially equivalent since, after clk_put()
> >>> completes, those boundaries won't be enforced anymore.
> >>>
> >>> Let's add a call to clk_set_rate_range in clk_put to make sure those
> >>> rate boundaries are dropped and the clock drivers can react.
> >>>
> >>> Let's also add a few tests to make sure this case is covered.
> >>>
> >>> Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> >>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >> This patch landed recently in linux-next 20220328 as commit 7dabfa2bc4=
80
> >> ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of
> >> the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato
> >> board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khad=
as
> >> VIM3/VIM3l). Rinato hangs always with the following oops:
> >>
> >> --->8---
> >>
> >> Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> >> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc4=
80
> >> #11551
> >> Hardware name: Samsung Exynos (Flattened Device Tree)
> >>   =A0unwind_backtrace from show_stack+0x10/0x14
> >>   =A0show_stack from dump_stack_lvl+0x58/0x70
> >>   =A0dump_stack_lvl from panic+0x10c/0x328
> >>   =A0panic from exynos4_mct_tick_stop+0x0/0x2c
> >> ---[ end Kernel panic - not syncing: MCT hangs after writing 4
> >> (offset:0x420) ]---
> >>
> >> --->8---
> >>
> >> Amlogic boards hang randomly during early userspace init, usually just
> >> after loading the driver modules.
> >>
> >> Reverting $subject on top of linux-next fixes all those problems.
> >>
> >> I will try to analyze it a bit more and if possible provide some more
> >> useful/meaning full logs later.
> > I'm not sure what could go wrong there, but if you can figure out the
> > clock, if it tries to set a new rate and what rate it is, it would be
> > awesome :)
> =

> So far I've noticed that the problem is caused by setting rate of some =

> clocks to zero. The following patch fixes my issues:
> =

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 32a9eaf35c6b..39cab08dbecb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2201,6 +2201,9 @@ static int clk_core_set_rate_nolock(struct =

> clk_core *core,
>  =A0=A0=A0=A0=A0=A0=A0 if (!core)
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> =

> +=A0=A0=A0=A0=A0=A0 if (req_rate =3D=3D 0)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
> +
>  =A0=A0=A0=A0=A0=A0=A0 rate =3D clk_core_req_round_rate_nolock(core, req_=
rate);
> =

>  =A0=A0=A0=A0=A0=A0=A0 /* bail early if nothing to do */
> --
> =

> I will soon grab the call stack and relevant clock topology show how the =

> rate is set to zero.

The most likely thing to happen is that clk_set_rate_range will call
clk_core_set_rate_nolock with clk_core->req_rate, and at the time
req_rate is at 0.

And I'm a bit puzzled at this point, the only reason I could spot for
req_rate to be at 0 is that it's an orphan clock that doesn't have its
parent yet, but during userspace init I'd expect all the clocks to have
been registered.

Can you check if that clock is still orphan?

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
