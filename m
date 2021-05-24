Return-Path: <SRS0=3IHZ=KU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2F7C2B9F7
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 00:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C58B860FEB
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 May 2021 00:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C58B860FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qwrcon67e7LGksUs+oaaCOLNkRRXfLxYVCpE+r4lE7c=; b=CwZ2Ymfpp+WlkL
	7uN9Dekxp3SqyPU2c3SR/4bDFYzmEVZ7LXVpIzlkNpvSiq7q1xX3b/svzzKi6NN2+/HZgUyeTkPIn
	RITq1tmqyPabLBKizhi5Lfb7/yrpKJzG0aWUU8qCGDEqXSBapjRZXAx0dfinSeTKWLWEFS99wnd/Y
	0UzgVP2ZEUmbIVo7f0aFmeskOLKX9A9Y9hUSGjEuSbMroxOXNVfQzvCQ5Y8PdN7LEz+NRpMv/5OaY
	hRTG008RqYqv7/++2ioe19ibSV8AKpoXx+6Truy7g+ml3ont3mJA1R0Hi5cCzzLCJ3HY3MG2Ng20x
	DqiaIfNJiz+lMuVWy8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llKzR-002ZfI-7u; Tue, 25 May 2021 00:32:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llEAX-001Ekr-E4; Mon, 24 May 2021 17:15:11 +0000
Received: by mail-ed1-x535.google.com with SMTP id b17so32885863ede.0;
 Mon, 24 May 2021 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NqymAOfKkJSvsQ9cL9DRucWC0MzQQIr199sZKb1IYM=;
 b=Y3oJTV7yKehEVsznvxHyHGR9MACEMlTosuXANvqXj+TKXkico5Q1nWxe87O3mhMu+y
 q5sUZl6rY3onoY6gDEHJiPoZ25WOoxsLCXuaQBePhn3L4N4L0D/bRNJdmp3xfY7uwll3
 1SMt/rKRlhHl3E9/FvL9S5U/3XqL8hV4YDipZtbpBht4WU3YmK6E4ImC4TA8adUJOAV2
 k1nWmzizfos4yQ7SM3DeXDodKYvk8A3dIE3EImzmavHmEPUmsWh4DT3EWS8byDWtz6ra
 xd2kdLFp9r4+XrCgzM9jcPINsYZ29hweQ2PYiq0OyK65JFgL6PHxOum3UeFlYUC8gyT5
 PksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NqymAOfKkJSvsQ9cL9DRucWC0MzQQIr199sZKb1IYM=;
 b=H49h5AXab9y2YAKTNK1/VvY3bdROXnN7tXZWKXiOJtGe5hOXAxB/6O9FsrxwzAewSP
 mld8WPk6P5lhwvB/ogJPxVBs1UG40pFoL1LiJ6Eu9qxRbom3hHEnEmW1V4oP1Z5cnY3R
 ah8byZfhqg+rkYRb0sKj8lA0hzAnsdKgpXvlrf+Q8+x0dLB1gI8fnn1TCBXwqEw35nqX
 dnLKyENTuzUeR1E3aXx5Mfwr6b+YezLQtqd90R2x6BvkvqY+hErZ9VMujE3P+pDJZWVY
 rLaDLGqs7H5AgohPer/GB7qmFvU/JnfuGtT+r8GUF8MFWDZZVxJV18N3iSZaDR7eMOux
 Pr8A==
X-Gm-Message-State: AOAM530pf9RYuKXa8nqc6EAANAGsJnzmdbk/MvrkIglzD9d5XGNsMMJX
 iKvF1CLgYLKpYOwOq5+s5AGae8AXk/1oW1fcGu4=
X-Google-Smtp-Source: ABdhPJzbauczmKWwr8OghHMny4dnkH5wJ73w40kBJBuHpYhBIe6XjgJRNeCTMtESQ4MBP9Htvbs3jaoGwJIB25n9x/o=
X-Received: by 2002:a50:d54c:: with SMTP id f12mr26271733edj.301.1621876507863; 
 Mon, 24 May 2021 10:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210524134517.687089-1-martin.blumenstingl@googlemail.com>
 <1jmtskb3w2.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmtskb3w2.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 24 May 2021 19:14:57 +0200
Message-ID: <CAFBinCA-JADYi4C4P0cm4fpD6Bg5GyOo0iwferhB0mDW2XEk0w@mail.gmail.com>
Subject: Re: [PATCH v2] clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for
 vclk{, 2}_in_sel
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_101509_537970_53989164 
X-CRM114-Status: GOOD (  24.41  )
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

On Mon, May 24, 2021 at 4:30 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 24 May 2021 at 15:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Use CLK_SET_RATE_NO_REPARENT for the vclk{,2}_in_sel clocks. The only
> > parent which is actually used is vid_pll_final_div. This should be set
> > using assigned-clock-parents in the .dts rather than removing some
> > "unwanted" clock parents from the clock driver.
> >
> > Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> > After a hint from Jerome (thanks) this is the improved version of
> > "clk: meson: meson8b: Don't use MPLL1 as parent of vclk_in_sel" from [0]
> >
> >
> > [0] https://patchwork.kernel.org/project/linux-clk/patch/20210524104533.555953-1-martin.blumenstingl@googlemail.com/
> >
> >
> >  drivers/clk/meson/meson8b.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index a844d35b553a..0f8bd707217a 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -1175,7 +1175,7 @@ static struct clk_regmap meson8b_vclk_in_sel = {
> >               .ops = &clk_regmap_mux_ro_ops,
>
> I just noticed that these muxes are read-only ATM.
> It does not make this change (or the previous one) wrong but it does not
> make much sense as the mux won't ever change.
indeed, as-is the patch is a no-op

> I suppose you make this mutable with another patch later on ?
correct, I have a patch in my queue which will make all relevant
clocks in the vclk and vclk2 trees mutable
my idea behind this is to not mix any _ro_ops to _ops conversion with
other types of changes (so the actual reason for a change is still
documented in the git history)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
