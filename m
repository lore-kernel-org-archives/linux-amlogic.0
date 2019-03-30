Return-Path: <SRS0=rMmM=SB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E888C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 15:56:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8292085A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 15:56:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UxE5QDxc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BEY94n0e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8292085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/r6aKAuWKME9YfZW1GbTCAyhK9SP7Qgb6dPVKBRWaWA=; b=UxE5QDxcaXaWHS
	A1quG0Vb0Tpr/2Q61TvWaMcJkgI6fDUJ/ztFx767S066hJNh2QQFn/DWm0Pr/hwwSfWj0Q/DdPQNJ
	PZ4C8tIQyORRNxxLHhs1AgflFGMkFidqq8YN3cTuMnmP35czwtFXeGUG/zkNQaB5ZwY1a4yasz7fQ
	tLI/d/YuLXX1FEA6ZENXCauulUXaPcuGJtOaCjM/X0WO0+lcmiZDZt5LlfhJW9qBjp4xMbvzI0mMp
	iRPYrbNjKA24FVBfvGBpQV/LIkuV6BS7OX1gxdpcZSka7Xvvhz5NW4q39ii0hkINJyjYMlTdFHE9W
	QnEMXBeCAqnTtqo5vlvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAGLQ-0005YW-Oo; Sat, 30 Mar 2019 15:56:32 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAGLN-0005Y2-Gf
 for linux-amlogic@lists.infradead.org; Sat, 30 Mar 2019 15:56:31 +0000
Received: by mail-oi1-x244.google.com with SMTP id 3so4009589oir.7
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Mar 2019 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OIydhpwZ/UxjYyTDP3PPEf0zfkdewWJwPqFZ/v/79lA=;
 b=BEY94n0eoFn1s+cHq5KP44we+NvzUlYvf9YH2cwq7yCYZlfC7UsCjqPrFwYvTkZEg2
 wxCswlaBcvqP9upZCdJnw2QulLzMOz9fy8+bQ4VaaGksn+4RZh39Nsf7/R3Ejpd3t2bz
 ZYJzSeYHapmH2ajrSd08WPYUXnFOZgzYcH0yeOfPReOPeQYT4rOpoWuzU60Zp8EHiJsP
 PT2U5i5Q5n0xvnQGPG0PCSJ8Nv1y7fUZyamcVceybXYfXtna7QHY0lJDswUapjhDBjKp
 esaWK7ouS2XoUWz82DL+goFr/i4XW0lUAy13yjuC2m4eq6RQN9DDNUcvZUU9ZY0zqD3O
 LKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OIydhpwZ/UxjYyTDP3PPEf0zfkdewWJwPqFZ/v/79lA=;
 b=bV4qe6CAX4sVoT02egyCutYi5L7ig2oGfIEmJ/6UstbUNiehAoUp8T1OJF04KipQc8
 /v5TfCvKafAIvl6FGc1bf4Avvl5rbBZb6Wtf+BgjgAoqWWSleKKkeMfr/63snJsin3Lh
 9L7Wi3JYQYsi6y9jXzvi2oRATiWGYlXW92XFQ9zsSCWVmk5KTIwy+/VPJzhFRluk2ASH
 Iy3e9kkvy9AHnHuBOucbYBGZNdwVAq8B6kCQ6qa/mkbNr74eB5zOYIpvfezVI6KbvexQ
 +m0lQti09R2Ud5/Fy4s2+NK3K4v+M43hkMBzk+zNB+pMkiNaRrnbPKJE++LO48TC06Cm
 lHfQ==
X-Gm-Message-State: APjAAAUt75p33PNbspdP+DIqNni4yVXYNdXXoHhLu25GQauRu7XvrxYI
 Noy11jdiaJJpjJ35Idu2sYsjcLmdV1cE1IYjsvE=
X-Google-Smtp-Source: APXvYqxLqmpxQyGLcoU4UOsKryx+jqssxxRw/EXko62N3CYmm9Ddn8CYYD8JgdOKLhfmNRj7IzX3TWlsju4eYcm25KY=
X-Received: by 2002:aca:bdc4:: with SMTP id n187mr7504730oif.140.1553961386667; 
 Sat, 30 Mar 2019 08:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <20190329153325.23869-2-jbrunet@baylibre.com>
 <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
 <3bef1bb26e9eff0cfc20cd4bb78a5d7cea4c5076.camel@baylibre.com>
In-Reply-To: <3bef1bb26e9eff0cfc20cd4bb78a5d7cea4c5076.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Mar 2019 16:56:15 +0100
Message-ID: <CAFBinCCUrKGPWpTu_u3okaHVfMY4CN5F5qaRcKdTRbg35xrMEQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_085629_600948_CDB9272E 
X-CRM114-Status: GOOD (  27.06  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Sat, Mar 30, 2019 at 12:07 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Fri, 2019-03-29 at 20:39 +0100, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> > > fractional part of the divider but to the function called
> > > 'Spread Spectrum'.
> > >
> > > This function might be used to solve EM issues by adding a jitter on
> > > clock signal. This widens the signal spectrum and weakens the peaks in it.
> > >
> > > While spread spectrum might be useful for some application, it is
> > > problematic for others, such as audio.
> > >
> > > This patch introduce a new flag to the MPLL driver to enable (or not) the
> > > spread spectrum function.
> > >
> > > Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/clk/meson/clk-mpll.c | 9 ++++++---
> > >  drivers/clk/meson/clk-mpll.h | 1 +
> > >  2 files changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> > > index 64d31c8ba3d0..2d39a8bc367c 100644
> > > --- a/drivers/clk/meson/clk-mpll.c
> > > +++ b/drivers/clk/meson/clk-mpll.c
> > > @@ -141,9 +141,12 @@ static void mpll_init(struct clk_hw *hw)
> > >         /* Enable the fractional part */
> > >         meson_parm_write(clk->map, &mpll->sdm_en, 1);
> > >
> > > -       /* Set additional fractional part enable if required */
> > > -       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> > > -               meson_parm_write(clk->map, &mpll->ssen, 1);
> > > +       /* Set spread spectrum if possible */
> > > +       if (MESON_PARM_APPLICABLE(&mpll->ssen)) {
> > > +               unsigned int ss =
> > > +                       mpll->flags & CLK_MESON_MPLL_SPREAD_SPECTRUM ? 1 : 0;
> > > +               meson_parm_write(clk->map, &mpll->ssen, ss);
> > > +       }
> > this changes the "ssen" flag on all supported clocks from 1 (before
> > this patch) to 0 (after this patch).
> > is this on purpose and how does it affect existing clocks?
>
> Yes, none of our application require spread spectrum
thank you for the explanation. can you please add it to the patch description?

> The fact is that only 2 MPLL had this bit, mpll0 on gx (without effect) and
> mpll0 on axg: actually spread spectrum impacts mpll2, making it unusable, as
> explained in the related patch
>
> >
> > based on the original commit 1f737ffa13ef ("clk: meson: mpll: fix
> > mpll0 fractional part ignored") it seems that
> > CLK_MESON_MPLL_SPREAD_SPECTRUM should be set for mpll0 (at least on
> > GXBB and Meson8b)
> >
>
> There a patch specifically targeting gxbb.
I missed that, sorry for the noise

> I have checked on GXL and this bit had no effect (fractional part still on, no
> spread spectrum)
>
> So either we fixed something since then or I messed up when doing the patch
> initially.
>
> Feel free to cross check
I tried it on Meson8b and it seems that there's no difference. I've
done a bit of software archaeology:
$ grep -R mpll_cntl uboot-2015-01-15-23a3562521/ | grep "=" | head -n3
uboot-2015-01-15-23a3562521/board/amlogic/m8_k100_1G/firmware/timming.c:
       .mpll_cntl = 0x600009A9,        //2.5G, fixed
uboot-2015-01-15-23a3562521/board/amlogic/m8_k100_2G/firmware/timming.c:
       .mpll_cntl = 0x600009A9,        //2.5G, fixed
uboot-2015-01-15-23a3562521/board/amlogic/m8b_ft_v1/firmware/timming.c:
.mpll_cntl = 0x600009A9,        //2.5G, fixed

Ethernet is still working on my Odroid-C1, so you can add my:
Tested-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
