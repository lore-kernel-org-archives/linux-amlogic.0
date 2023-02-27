Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66511C64ED6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niUj7Dm3MdDDXPOKNxR77Kfxity1fmCR6EO09shKYbQ=; b=C8oI/IiCR9EpBJ
	3zCpzMYtrxjO2ZYL9sLE4hdZOSt+l8t78PGfn7RDs9k324zX8ZLKolHp7Ug6bhErF/MbAt3lHNKXt
	hNY0A+yIUlI8VbOrlgy3MkGFgMMc0K4UY+GXkFkCeEg8JHXob6xLbMqc5UjznNvryy6BUOxipe1l8
	nnlz0xFA5k9oT9zPTeGYbCVe4JVd3R6rA8GzHJttGLazcM6fVgpYkPEtwuOAsFRP/n/ymVNO1h7lG
	2FEeda0WNJVtAoCuV7PTq5zmrKT/WxbcsGhyA7vZfO3j7OREEBBiatWUI5kjeo2g15Gj60dqSfSJn
	Irq3slUq4oo/qaSriPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWg8f-00AJWB-T0; Mon, 27 Feb 2023 16:14:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWg8V-00AJUG-4l
	for linux-amlogic@lists.infradead.org; Mon, 27 Feb 2023 16:14:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so6109087pjg.4
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Feb 2023 08:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iU3DIPiFHtyl6MAm66myHOcnybgqDkhP99roOt2WViA=;
        b=muARfEHVBJSBPQF3V/HIv82zR+6d+0M8snnG/omf3SMTJrZd9yx5aSHSUvTxc5+7fB
         j9ohcL7w8tctZ+6qDIZFbftTarwx8R7f4InksG7uXbcMOWdvxgSsEucSS/EPOrtEdf5b
         rigd63046P5nmnNZGlzV7ZJYmX1jv2m6EKpQmPcRQrbBC+wHH7ZD4wDAT88xv8x8Ao21
         5t8Z463DSiYcPx8WfDP2oatRSTTQ8v4wNd+wJBQgykaqsNC6Zk/owxEFtYFwQ03uAFk2
         45v6evTTHOdRutMkgBgGeeqPv4/a4Z0N+ySGndPRnSlnv7bv+Q5Jx5sy0FsjbfcN0fVG
         a8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU3DIPiFHtyl6MAm66myHOcnybgqDkhP99roOt2WViA=;
        b=ZVrMRyyuyI74ztR0vndgA/CY3jv4gvaVZMvyTAMh5h3kwlG0djbZain3l0XgN39N2T
         xp2wvxnFe30RD+mLQNF+pPXPMxZA34WYjEC5XNXfau6TXHhee0UM/9CL1iKZT65jLPX3
         KnB4gdg3/21qv7b4WIJsAX2E91SH6pewmAys7H76jqvmxA1Lqeijb2hPYT60ZLR+92Qh
         +pwQHmAvn4cISRzVkN2VMhJdsTM4UdY9RsqxahbOvxLgLq9/A3pCTQbOe7Ogj7sv2ZCo
         YUoHJYKY+3s2tNi64BYwHKApi1zEfxB9fhurT3gIA1k7HzZwER130etby0KvnjpIJnVT
         QAlw==
X-Gm-Message-State: AO0yUKVJlVGbRtNhpj/Chktc0yEKCk2Lq/bbDcKdxbvUSq21xs9JF0iQ
	SiYnGuz66Xjrk5sgaN8uh0fBpIHJqqfBhjuVt+NHdA==
X-Google-Smtp-Source: AK7set+3RvTeQEziGmtk2RuQy5O5q53GPTIM08XtVfn+x2E/MpjnjVsIv7Zlx2KgiyWDdvKW7HlccfQMlHrFw2G7ONA=
X-Received: by 2002:a17:90a:dc04:b0:233:d131:29be with SMTP id
 i4-20020a17090adc0400b00233d13129bemr5023702pjv.9.1677514435569; Mon, 27 Feb
 2023 08:13:55 -0800 (PST)
MIME-Version: 1.0
References: <02b46550-e0b5-4251-8156-56eb0f690d89@gmail.com>
 <2553f3bc-b1e6-4af2-fb6c-def486dd99a3@gmail.com> <CAPDyKFpCEzubkJ=roniomXHaWrY5AOqfPZmNLbMbBnubHzZrEg@mail.gmail.com>
 <0725e5eb-43fd-65a7-27e8-84bbfe31c798@gmail.com>
In-Reply-To: <0725e5eb-43fd-65a7-27e8-84bbfe31c798@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Feb 2023 17:13:19 +0100
Message-ID: <CAPDyKFouH_uxF_p7ke_WAwwuQxp=O3qitC7iXHU7n1MGN1Nhmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: core: add helpers mmc_regulator_set_ocr_vmmc_up/off
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_081359_196452_D49AB182 
X-CRM114-Status: GOOD (  28.22  )
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

On Fri, 17 Feb 2023 at 21:09, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 17.02.2023 11:47, Ulf Hansson wrote:
> > On Wed, 15 Feb 2023 at 21:14, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>
> >> A lot of drivers use this code, therefore let's factor it out to
> >> helpers.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  include/linux/mmc/host.h | 17 +++++++++++++++++
> >>  1 file changed, 17 insertions(+)
> >>
> >> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> >> index 812e6b583..f93fb8c7d 100644
> >> --- a/include/linux/mmc/host.h
> >> +++ b/include/linux/mmc/host.h
> >> @@ -597,6 +597,23 @@ static inline int mmc_regulator_set_vqmmc(struct mmc_host *mmc,
> >>  }
> >>  #endif
> >>
> >> +static inline int mmc_regulator_set_ocr_vmmc_up(struct mmc_host *mmc,
> >> +                                               struct mmc_ios *ios)
> >> +{
> >> +       if (IS_ERR(mmc->supply.vmmc))
> >> +               return 0;
> >
> > Rather than adding these two new helper functions, how about adding
> > the similar check in mmc_regulator_set_ocr() instead?
> >
> There's a number of drivers having 3 paths here:
> 1. IS_ERR() is true -> do nothing and go one
> 2. mmc_regulator_set_ocr() returns 0 -> some action and go on
> 3. mmc_regulator_set_ocr() returns an error -> bail out

Right, thanks for pointing this out.

The important point I am trying to make is that the mmc core is
treating "mmc->supply.vmmc" as optional (see
mmc_regulator_get_supply()). To be consistent with that behaviour, I
think it would make sense to bail out and return 0, in
mmc_regulator_set_ocr() "if (IS_ERR(mmc->supply.vmmc))". We don't need
a new set of helper functions to do that.

>
> So the question is: what should mmc_regulator_set_ocr_vmmc_up return
> if IS_ERR() is true:
> 1. An errno? Then this errno would have to be different from the
>    error codes the function can normally return.
> 2. A positive value? Seems to be the best option
>
> Then we could write:
>
> ret = mmc_regulator_set_ocr()
> if (ret < 0)
>         return ret;
> if (!ret) {
>         some_action();
> }
> ...
>
> Works but I'm not sure whether it's very intuitive.
>
> The other benefit of the proposed helpers is that they hide the
> complexity of using mmc->supply.vmmc and ios->vdd.
>
> Mileage may vary here. Do you have any preference?

Actually, there is no complexity. Drivers should always be able to
pass 'ios->vdd' to mmc_regulator_set_ocr() (as it holds the correct
value).

For some reasons, some driver authors seem to find it clearer (I
guess) to call mmc_regulator_set_ocr() with an explicit '0' at
MMC_POWER_OFF, but it isn't needed (see mmc_power_off()).

[...]

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
