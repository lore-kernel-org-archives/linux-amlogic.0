Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CBFC433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 19:58:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019D121D7D
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 19:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ExnoaW4x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CB7UxuU8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019D121D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvLDPhDCPRa9Wd+c8B9YirIlnKokgtyDlMo+/zkjEag=; b=ExnoaW4xzCH+HMS7rfr3W/0i1
	pJdxzfPeGBfo8YMFTL60jP+xqNQXLi29P/3PgpBep4XUmXgKRQqGQxIAv1G5KNabM11fNFjwXz5Jt
	81gwk+hwDpD7eqiSY+fwnRgIpOvQ7tgmwTVY9hqRcsyNtR3ND9naJtC3dT5iLk487Ua4FdnhSSn7z
	YuLtMt/4ioyV791pkobgcFDljDAK9Q6jjbntOYIuAj+l0ezb02iaZmDXtnL1vKV6VuoylzSY5k7/U
	VtpBGOilCKCJ7ugyZhdk5ZUGSsyRHdO5UKyPLM/4eFaaCJff4ZeErPno+58axAUISXOQ2ylZl7vBo
	NYKOWqI8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG6EC-0001QH-27; Wed, 09 Sep 2020 19:58:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG6E9-0001Pp-7i; Wed, 09 Sep 2020 19:57:58 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA6CC21D94;
 Wed,  9 Sep 2020 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599681476;
 bh=Fj/ZQbw6iThGFoHDEPgT4Mpjuadx6d6xm8WtTwb+cS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CB7UxuU8qcF/Ckc6M1KrLlYN6/DCb1jOpAKx+Ak99W936vuNUE+/lxI141BCweDut
 Y5oyYmit+lS3UI+K93AQgP3DGpr99TiiSDdpLjrLxhPQWC6ahmp/Gb9Hv3YtUSTAA0
 bCqbKV+fxv+RxSs5AOT41MG0C/3NMuruIv3SE9kI=
Received: by mail-ej1-f42.google.com with SMTP id u21so5353454eja.2;
 Wed, 09 Sep 2020 12:57:55 -0700 (PDT)
X-Gm-Message-State: AOAM531LeA9IY7TuzXBX7jUwy0i8E8Z+GrgLGjioVeU7C8ZdtsJzRgqI
 E8ek3MWZUcwrQI4Ta6IlCm/aajKPXhn0CUeQZy0=
X-Google-Smtp-Source: ABdhPJwTMqh5k7vWahnMEeb3gRi7HnzNHjrkeMUXR1813rl6InlKMxnwCaXk5Vx2ppJEqh/OTvng43DjT6sRq5dxx5s=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr5150651ejx.215.1599681474195; 
 Wed, 09 Sep 2020 12:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
 <20200909193600.41970d8c@archlinux>
In-Reply-To: <20200909193600.41970d8c@archlinux>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 9 Sep 2020 21:57:41 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
Message-ID: <CAJKOXPeo8SXWaRmiFG6z+t9jcnaSMRpvRPm2X22Rf6rtEeKVew@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] iio: adc: stm32: Simplify with dev_err_probe()
To: Jonathan Cameron <jic23@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_155757_431264_8C7F8013 
X-CRM114-Status: GOOD (  27.23  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-amlogic@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 9 Sep 2020 at 20:36, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat, 29 Aug 2020 08:47:16 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
> I don't have the thread to hand, but this tripped a warning next
> and the patch was dropped as a result. See below.

Thanks for letting me know. If you mean the warning caused by:
https://lore.kernel.org/lkml/20200909073716.GA560912@kroah.com/
then the driver-core patch was dropped, not the iio one:
https://lore.kernel.org/linux-next/20200909074130.GB561485@kroah.com/T/#t

So we are good here :)

Best regards,
Krzysztof

> Jonathan
> > ---
> >
> > Changes since v2:
> > 1. Wrap dev_err_probe() lines at 80 character
> >
> > Changes since v1:
> > 1. Convert to devm_clk_get_optional
> > 2. Update also stm32-dfsdm-core and stm32-dac-core.
> > 3. Wrap around 100 characters (accepted by checkpatch).
> > ---
> >  drivers/iio/adc/stm32-adc-core.c   | 75 ++++++++++--------------------
> >  drivers/iio/adc/stm32-adc.c        | 10 ++--
> >  drivers/iio/adc/stm32-dfsdm-adc.c  | 10 ++--
> >  drivers/iio/adc/stm32-dfsdm-core.c |  9 ++--
> >  drivers/iio/dac/stm32-dac-core.c   |  5 +-
> >  5 files changed, 35 insertions(+), 74 deletions(-)
> >
> > diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> > index 0e2068ec068b..3f27b4817a42 100644
> > --- a/drivers/iio/adc/stm32-adc-core.c
> > +++ b/drivers/iio/adc/stm32-adc-core.c
> > @@ -582,11 +582,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >       priv->syscfg = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
> >       if (IS_ERR(priv->syscfg)) {
> >               ret = PTR_ERR(priv->syscfg);
> > -             if (ret != -ENODEV) {
> > -                     if (ret != -EPROBE_DEFER)
> > -                             dev_err(dev, "Can't probe syscfg: %d\n", ret);
> > -                     return ret;
> > -             }
> > +             if (ret != -ENODEV)
> > +                     return dev_err_probe(dev, ret, "Can't probe syscfg\n");
> > +
> >               priv->syscfg = NULL;
> >       }
> >
> > @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
> >               priv->booster = devm_regulator_get_optional(dev, "booster");
> >               if (IS_ERR(priv->booster)) {
> >                       ret = PTR_ERR(priv->booster);
> > -                     if (ret != -ENODEV) {
> > -                             if (ret != -EPROBE_DEFER)
> > -                                     dev_err(dev, "can't get booster %d\n",
> > -                                             ret);
> > -                             return ret;
> > -                     }
> > +                     if (ret != -ENODEV)
> > +                             dev_err_probe(dev, ret, "can't get booster\n");
>
> This tripped a warning and got the patch dropped because we no longer
> return on error.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
