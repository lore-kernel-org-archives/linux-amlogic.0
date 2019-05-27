Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EDCC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C20DB208C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JoDOPvyW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sr5PZkAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C20DB208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IhCrWmlqF1nyBcdovTY53SuTzOxzb27K41qFuXONdU=; b=JoDOPvyWLv3t1f
	DdNNgBwQ+5IDFhWFl5GLL6aVbt8HhCcNDUKU+fxUg0quzomZ2gUA3YLOFrHDZNL0AB4CSV//6PNZN
	Kn5Mn76OTgwHwakuknnEcO4jCvmKwk5qDwtH/b0vJChLARElRvKoGixBeT4mixr3+t2cL1Nyp0yEL
	AGsIWixLZnY6XmDSDwxhNhr5p8fsH2kppxQArMfXYEbHEOcpX/UQR7aZt4Dc8/ClMC0U5o9KF/CV9
	NCyXcl2tLtILzjqXbmtFeogJpV6iT33asMFqCvfi6Vb+nk7PPwU+OMKUBeQrlRP9UODadQCUcVy4L
	oChf69qRPbhy4DksKKnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJi6-0000qG-5r; Mon, 27 May 2019 17:46:58 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJi3-0000pu-L9; Mon, 27 May 2019 17:46:57 +0000
Received: by mail-oi1-x241.google.com with SMTP id v2so12398850oie.6;
 Mon, 27 May 2019 10:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RvWmgSpOjlIMaMZlqMhXFOz9qSbgkNwvRngL97A0kDQ=;
 b=sr5PZkAr/7xMIJI1iE3rnlUf2W//7xEl0rEv8uMQxjtApmCeIfuxKSdL2GConU+qlx
 P9vCZsz/G7nRW6fh6wnGHfcswe1ykoaXPZpMAXM4lJmzGKnyA6dHHJ15yy41O2Q8EXK1
 G+q+o9iv6qd6cYrH8i06p+Fg7y+4luf4xPg26eTOT1gSFEWOBF6Wjaf92UcGcuxHr6eL
 dg7JyncH0+v4PWErlFOWs4YwVy609jJvfk7DjwLW12TL9qjU0xy5wSQcqA/UlzLuX/ai
 ECfO4NlD85myKsx73AYmyq/4B4G8vl0wKKPVxaRGc0nrhWkVWEP4RxerxdRskW36zJLW
 yaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RvWmgSpOjlIMaMZlqMhXFOz9qSbgkNwvRngL97A0kDQ=;
 b=P/OzJQswmHLMTaoz77q3qR5BKq2adoHqc8CDOIcL5eLUGXgfsPsyAt7Gv1dZfxputB
 P0o9ACMgx5aq2yfuAtu+wQo6gOr7lNWbwdjqj7Xid0fGXn2yVjrTMnVr1WIAgXvecMHX
 g+5r/CBdQGWt0d1uwItOieANg/x/szKUASvCFOKRfPTVHEpEjTdD09NSbGCyr+YulIlZ
 z3hA8fr3kLvErJ7bKOn2MK15Pqy/vYTtWkWn4EF98F2uaW4WfH2K9hZOFhDlzLRQypKa
 QCOq8U9rrLhfxDTZkxF0L32LSro0GPkP2f/3EApGprYBdtTgsWCcMWUkcR4gFcob7qyO
 74QQ==
X-Gm-Message-State: APjAAAU8vx0xNuyp5GREM5BQCeHwY2f069KBwz9zqJsk2IHo7pTGfxYC
 FdJ8v5X5oDACbHyEqEu0+MB/hsx4/Mgqp84i4mc=
X-Google-Smtp-Source: APXvYqzOlHtTysG/NJMjTORoX4YkIoqs/i6VO44tMBIFa71EQ6WOH2ZGotkbC3hvW9Rj4y8Ks7VrpPwwNZd83dEYYlI=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr93471oih.39.1558979214200;
 Mon, 27 May 2019 10:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-5-martin.blumenstingl@googlemail.com>
 <3b61897a-267b-fd6e-181b-a8c7e47918fb@baylibre.com>
In-Reply-To: <3b61897a-267b-fd6e-181b-a8c7e47918fb@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 19:46:43 +0200
Message-ID: <CAFBinCDXNy4=6U2gsh6vK6WEtJKAdfDGPMrpPJthbp5Rru1hbg@mail.gmail.com>
Subject: Re: [PATCH 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_104655_722030_3CFC533D 
X-CRM114-Status: GOOD (  12.32  )
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

On Mon, May 27, 2019 at 2:26 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 25/05/2019 20:11, Martin Blumenstingl wrote:
> > MISC_CLK_SEL_WIDTH is only used in one place where it's converted into
> > a bit-mask. Rename and change the macro to be a bit-mask so that
> > conversion is not needed anymore. No functional changes intended.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/pwm/pwm-meson.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> > index c62a3ac924d0..84b28ba0f903 100644
> > --- a/drivers/pwm/pwm-meson.c
> > +++ b/drivers/pwm/pwm-meson.c
> > @@ -33,7 +33,7 @@
> >  #define MISC_A_CLK_DIV_SHIFT 8
> >  #define MISC_B_CLK_SEL_SHIFT 6
> >  #define MISC_A_CLK_SEL_SHIFT 4
> > -#define MISC_CLK_SEL_WIDTH   2
> > +#define MISC_CLK_SEL_MASK    0x3
>
> NIT I would have used GENMASK here
that was my initial idea but I decided against it.
the variant I came up with was: #define MISC_CLK_SEL_MASK    GENMASK(1, 0)

however, the actual offset is either 4 or 6 (depending on the PWM channel)
and I felt that duplicating the macro would just make it more complicated
so instead I chose to be consistent with MISC_CLK_DIV_MASK

Let me know if you would like me to change it (then I prefer to update
MISC_CLK_DIV_MASK as well).


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
