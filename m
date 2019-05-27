Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52682C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B959208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:50:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gIr5voqa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ACRGDPCU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B959208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/OblrpQvV+I5NaPJZ2kUgRV/bhqCIaKw2EpF+wj1AQ=; b=gIr5voqa48Yz0j
	I130r97CoGxjUc9RXLmhubFAfpn67YSc/xaqOQC+Djp6bJf19v8KqZykoCETDlsVuqdlyao4Nwafp
	J4cQ0rh6H/R/yCFOFgeX/KbJLgSd1wPkLYyNwoaQVDvCvXDemZTigDu7F8L1V621Vxn+czyW6qlpq
	8WsAnRfcbZ105SiMmaLFooFo2dPR4c6BlSe1S1DSCoVI+O+XXqmFvvJEyIkfgTAHFMjz7+lwS382P
	n3N4CDHrFV8+tlOynBNJhTMbgI1BV3bRJ8abVNnbe+t8dk4QGuZ0aD/mxbu4rDC8C1Ur5wR408A7b
	byUJiCyUzjWgK4eTtxQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJlo-0002PR-A8; Mon, 27 May 2019 17:50:48 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJll-0002Oi-DG; Mon, 27 May 2019 17:50:46 +0000
Received: by mail-ot1-x341.google.com with SMTP id r10so15473352otd.4;
 Mon, 27 May 2019 10:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=szfrkxYTB3oS9uYVAvQcAHaVtZZAEKMCalggoiWkkvM=;
 b=ACRGDPCU4JiUBP6ShAcgH9cmU4IWA3saNBYva6SUbvOIdRYMS1YRY0c0tWyhrYLrqd
 NEKGiZ8tgEiva5giVOkczbf+nDGoO8A2RtrK30Q7QA4xidBN//QpiluqfksV7ZjJmGow
 mtTpmd7JFUOI/KELjOsEbFMZylX2EBP/Oh42j64UkFnMAuH9ERIJrPNPpSyNgGUH+l7n
 Sy2s6ZgJ3YZTVAod7zMIdEaVml2gG4dBiTb5wfVfhbyBIsFDv0zNeMUdTu57+FEuoM9E
 SfNDxLg/nBNkc+NUBrkrj4ZZbs2/QeqPlPMI/uR4jGdkpnzKPE9kTu+O6+jVofxsXt7n
 REkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=szfrkxYTB3oS9uYVAvQcAHaVtZZAEKMCalggoiWkkvM=;
 b=DeNS3Cd4HYv23XtTQhjkVqulFwETzNEwqZIjiEEVTqH+zEozrOr0hOqH+0PpMuAB+v
 3sbEZug4kPBrQyJzHQC0ZHC3fLAzOYSwpqoNEvpnAUOeLe3hfJaeLqF+b/uRckC8yUTq
 uDm9/ASglNK2iqIXXRB25WL6y4TOCzAh3fRp1EmUISHu4L5UgDtQ7qoegPLd0dAAAMrk
 l203iCn/lygBcxTGX/tCQ8Lp0pOedRHnHcfMy+gYRpHeVTv1R41N/mOqh0u14HEvfVGL
 ykqwVOLuik9jnOoUPMv1GAdJjBMl/czuC3amEXntspR0WXTFRQ+o0jAJPQ7D2CyPrV3X
 j+eQ==
X-Gm-Message-State: APjAAAXr17EPQaDOM9sIV3/aRFSWAwxNhG6ioywdRNWrPW9dSaYFCDFC
 kLdrhIo3jKmNh+2BibjLiuHZH5PoY5zTiqZ5Amk=
X-Google-Smtp-Source: APXvYqw5Nce89yUOvRESxHDe40cny8RCzJRIgZJvL5llwkndlqbYEpXkgq2GWGpsOfknIkifaZkChPng2XztzeoskRg=
X-Received: by 2002:a9d:69c8:: with SMTP id v8mr18512077oto.6.1558979443935;
 Mon, 27 May 2019 10:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-14-martin.blumenstingl@googlemail.com>
 <4de7d436-32b7-e4ed-39b2-e85f75a17c16@baylibre.com>
In-Reply-To: <4de7d436-32b7-e4ed-39b2-e85f75a17c16@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 19:50:33 +0200
Message-ID: <CAFBinCCPsnX+OqjHgVi+tshE3EdVWS0Bk9qK1V+cg6DALnT1qA@mail.gmail.com>
Subject: Re: [PATCH 13/14] pwm: meson: add support PWM_POLARITY_INVERSED when
 disabling
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_105045_450841_4A185F2D 
X-CRM114-Status: GOOD (  26.49  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, May 27, 2019 at 2:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 25/05/2019 20:11, Martin Blumenstingl wrote:
> > meson_pwm_apply() has to consider the PWM polarity when disabling the
> > output.
> > With enabled=false and polarity=PWM_POLARITY_NORMAL the output needs to
> > be LOW. The driver already supports this.
> > With enabled=false and polarity=PWM_POLARITY_INVERSED the output needs
> > to be HIGH. Implement this in the driver by internally enabling the
> > output with the same settings that we already use for "period == duty".
> >
> > This fixes a PWM API violation which expects that the driver honors the
> > polarity also for enabled=false. Due to the IP block not supporting this
> > natively we only get "an as close as possible" to 100% HIGH signal (in
> > my test setup with input clock of 24MHz and measuring the output with a
> > logic analyzer at 24MHz sampling rate I got a duty cycle of 99.998475%
> > on a Khadas VIM).
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/pwm/pwm-meson.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> > index 900d362ec3c9..bb48ba85f756 100644
> > --- a/drivers/pwm/pwm-meson.c
> > +++ b/drivers/pwm/pwm-meson.c
> > @@ -245,6 +245,7 @@ static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
> >  static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> >                          struct pwm_state *state)
> >  {
> > +     struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
> >       struct meson_pwm *meson = to_meson_pwm(chip);
> >       int err = 0;
> >
> > @@ -252,7 +253,27 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> >               return -EINVAL;
> >
> >       if (!state->enabled) {
> > -             meson_pwm_disable(meson, pwm);
> > +             if (state->polarity == PWM_POLARITY_INVERSED) {
> > +                     /*
> > +                      * This IP block revision doesn't have an "always high"
> > +                      * setting which we can use for "inverted disabled".
> > +                      * Instead we achieve this using the same settings
> > +                      * that we use a pre_div of 0 (to get the shortest
> > +                      * possible duration for one "count") and
> > +                      * "period == duty_cycle". This results in a signal
> > +                      * which is LOW for one "count", while being HIGH for
> > +                      * the rest of the (so the signal is HIGH for slightly
> > +                      * less than 100% of the period, but this is the best
> > +                      * we can achieve).
> > +                      */
> > +                     channel->pre_div = 0;
> > +                     channel->hi = ~0;
> > +                     channel->lo = 0;
> > +
> > +                     meson_pwm_enable(meson, pwm);
> > +             } else {
> > +                     meson_pwm_disable(meson, pwm);
> > +             }
> >       } else {
> >               err = meson_pwm_calc(meson, pwm, state);
> >               if (err < 0)
> >
>
> While not perfect, it almost fills the gap.
> Another way would be to use a specific pinctrl state setting the pin
> in GPIO output in high level, but this implementation could stay
> if the pinctrl state isn't available.
I just noticed that Amlogic updated the PWM IP block in G12A:
it now supports "constant enable" (REG_MISC_AB bits 28 and 29) as well
as PWM_POLARITY_INVERSED (REG_MISC_AB bits 26 and 27) natively!

I like your idea of having a specific pinctrl state.
we can implement that for anything older than G12A once we actually need it.
for G12A we can do better thanks to the updated IP block


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
