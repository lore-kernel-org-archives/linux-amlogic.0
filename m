Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BA1C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 10:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C8vYFY6Udc44B/ohGzwl8uw7jFlZ+V4pG0nTJ6RxvdY=; b=nXg04MD8MYzYd4
	YgD+4NGPBtRXep6hnuLdMJ0EN5+0/8gYFlAd3Jf8xsMwC2s2IZAUIGVOXdHStYBr66iOwiTuPLcGu
	Ed3Qngy0IJf9OxNcxahNae1p4Kqil7PTwLT2kyAN7aBY2MckcMtmYT3AfI5d5XTwfIhKSjmER9Wck
	8jB4gm6VR4E+DgaNsz+2WYannLukASw6jEruBwcCdCBPCgjnF3/QL45TFkvd7v5FaZ5a7lY7rj/c1
	Lg538YO6shtQF27jGu0nOjKCRGnBrGPxpsabDA/0bV+OFvMBT+ZBQxP5bysvrpJHtHPy+Bb7olvqo
	Ob9tDZkXx7IuWOgwsq8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbKLq-00Ecm9-HM; Mon, 04 Apr 2022 10:54:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbKLm-00EciR-2u; Mon, 04 Apr 2022 10:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649069662; x=1680605662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rQ+A9jrxP/AoNdJehS0U+xaw6T3SSUsxJMay+kwDw0g=;
 b=U6oWvS31yGE+gKE4w9vx/xDc/yi1mEkXbRy5Ha844KcAroz0I+dOuM08
 XJU0/sAVCA9e9IxD7q3gv3urzr24HNZsL3wLDqbx1yjSJBsLY71b5jyGA
 JQhBcvSn45LdvwJzvtJ3pi4aFs/y+JJ4agFWcsQGX8u6svzsWucz+p3xx
 BXA91jfmqn4g2C5JlWoNxCMTe2Isf6Hp4GJHoMHIKsXQvAUOVJfjMzmhO
 4BnGrEwgeqdxDbDyR1R0lhoJ/+cLBokXlf8WC+gE3pjj/CeErAyybLrgZ
 ZSPUfFNRTy0D2tU+Dcc/IiC9RKNdA6jiywUHb0p5s0ddI+FtGCrTdpgfU A==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643670000"; d="scan'208";a="23073726"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 Apr 2022 12:54:16 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 04 Apr 2022 12:54:16 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 04 Apr 2022 12:54:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649069656; x=1680605656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rQ+A9jrxP/AoNdJehS0U+xaw6T3SSUsxJMay+kwDw0g=;
 b=UeSxzdcc2p1icXFPdkoh46DqaU+0QaKapY01QotqNbfAheCiBj/lrg4N
 btU/syVGc/Cdz4Jxmpxqq+fMkkTIaaaYAaEf6oY4bsSGT8eAcxQjifXXu
 CQLGwV0SDXpuKQL5lIhbxw/sCrlsdoPIl+uVJg6GVxMD4T3PokhPevJJ7
 qPqlpTK94h0XAIEqypTveTV4t2Uv1uqglX/vB2/V73uvSY166R+FykoMJ
 dIzsl3sEA9Seqf/tSQnKYk8XHo4pkR0nxgXKA6P5H4UexXXkVWTj8ccJM
 BfBKs+5Oer8bZebfSC4gqBdxMTMe3b2wFieloaVwiH2UiBbC2YdKBgW/7 g==;
X-IronPort-AV: E=Sophos;i="5.90,234,1643670000"; d="scan'208";a="23073724"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 Apr 2022 12:54:09 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CB22F280065;
 Mon,  4 Apr 2022 12:54:04 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re: (EXT) Re:
 [PATCH v2 3/3] clk: Drop the rate range on clk_put
Date: Mon, 04 Apr 2022 12:54:02 +0200
Message-ID: <12990313.uLZWGnKmhe@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220404072712.bbsbkq3cpyx4xuzy@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <4391300.LvFx2qVVIh@steina-w> <20220404072712.bbsbkq3cpyx4xuzy@houat>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_035422_569773_205D1EC8 
X-CRM114-Status: GOOD (  28.85  )
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

Hello Maxime,

Am Montag, 4. April 2022, 09:27:12 CEST schrieb Maxime Ripard:
> On Mon, Apr 04, 2022 at 09:06:42AM +0200, Alexander Stein wrote:
> > Here is the requested output:
> > ---
> > $ ./scripts/faddr2line build_arm64/vmlinux
> > 'clk_mux_determine_rate_flags+0x33c/0x380'
> > clk_mux_determine_rate_flags+0x33c/0x380:
> > clk_mux_determine_rate_flags at drivers/clk/clk.c:627
> > ---
> > From a first look it seems that 'best_parent' is just a NULL-pointer here.
> > With this small fix
> > --->8---
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 071857ef381a..45e081330fac 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -626,7 +626,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> > 
> >         pr_crit("%s: Best parent %s (%lu)\n",
> >         
> >                 __func__,
> > 
> > -               best_parent->name,
> > +               best_parent? best_parent->name : "unknown",
> > 
> >                 best);
> >         
> >         return 0;
> > 
> > --->8---
> > 
> > The boot eventually get stuck, but at a later point.Which is probably why
> > your analysis found nothing strange. Due to the size of the output I put
> > it on a gist on github [1]. Please note that this is still based on a
> > next-20220331 based tree without the revert.
> 
> I've looked into it over the weekend, and ran qemu on an imx6 to try to
> see if it was any similar
> 
> I believe the issue comes from the fact that the core will forward rate
> requests structure to the parent clock as is, and if the parent clock
> changes the parent it wants, we end up trying to use that parent in the
> initial clock which doesn't work really well.
> 
> I've fixed it in my branch here:
> https://github.com/mripard/linux/commits/rpi/clk-improvements-more-fixes

Thanks for providing another patchset. Unfortunately, my board hangs still at 
the same location. For reference I put a branch based on next-20220401 on [1].
Reverting still does the jobs, a branch is shown on [2]

next-20220404 has the offending patch already reverted, so this should work 
again, I did not test it on that base on purpose.

Best regards,
Alexander

[1] https://github.com/tq-steina/linux/tree/clk-fix
[2] https://github.com/tq-steina/linux/tree/clk-revert



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
