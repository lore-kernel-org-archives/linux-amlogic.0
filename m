Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3E6C52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lA1nt3UaCdULnNCLZFqJks9EDjXjM3Aw56E+ptL/MAw=; b=Mtj0J7KdkBq0a9
	oNotph+MmmBC516MzLvZEJ7Qb/LPdt5taqYswZVRTIQsbzWDNlRTMvkUmteHb1P4TfK3Pd+YhMKik
	fAyTrGyr9iZMVgfbz9YeanmiV2NKa6Op0Ok4rwhG4wgcQ3jRED5fdKd9Ej6jdZh+78rTImxN1GeeE
	Kicr7nw8sRvHsVXfiy+cAHCUHxrvULBTAa7BxXfLTEtr8H7zA2oRQxGvmSfrOfnVaQhpv0fFxOF36
	grpKuPOnAYxQNNEgCrOJRQVz9sfaFcw1+XZMTmFAu5EQzvtUbU4Fusz0mxxT0yPEbhqbOFhp7Or/W
	2Gim4HD+0eGEePDJ+Pxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrAb-00000003nqm-46a9;
	Tue, 13 Aug 2024 13:02:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrA1-00000003nmv-1cXv
	for linux-amlogic@bombadil.infradead.org;
	Tue, 13 Aug 2024 13:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=; b=hXfGzXrSWgYCvSX7c37fDU6lIR
	Y3zdiMOXwXrgZeijX8LicCtP0fYd95abeZa0oLCbM5Fqx/sYfYoJzkiXaGH5YaRP9u0MYBm0Z/BbM
	UohGpb+/hva5kO2Fnxd4p0eLM5Tto5LSB50JgwEILSw21lEhIFtt0JsWb1mT2tkD1PCy91uOhY7Wn
	qhbIkSVqb74sfOgZJP9GGxrrhgeTQRpl/I0+e7uRGqP4bLOuGBl5UjhIy6eesUclCHUICvdF0mYiF
	TaUotTWwKFGf5aCOaqoNPqqXFHyadK8EX5U53GTLGpzfmjSYWFBqihtrIAmlxlSlS9HXKUsNWPdhP
	+qdBJZdQ==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr9y-00000007mtd-1VH5
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 13:02:00 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f040733086so51891991fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723554114; x=1724158914; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=ddCRVBGzQG4eSqMUXWM5PmWZWtHkoBD/YDtHHnKxNEUkJ0e9HIXu33Th7NJ+tVvzUl
         9ot9xvN/1AaWDeB+3HoNIGb2Ti/SO23TqiRPcif/rFkA0gWAkHlGZIKjzzsBXSw4j38m
         JiudEau1RH+6FJv+xChqOfcqxW/eii9khSNRw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554114; x=1724158914;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ3qkhG6IpTE9k1+4JdfEiuc6iwsZmU2tud2hbQlnTM=;
        b=u4rac9yAEIWmIZ/Zxs4LBkAEDXoWOLlK2MhLtZ2NMCd9tzzwvIcnsl5aveCGnSRM/K
         T2ROqgbleRRDiNnFwCsRzSCE/p7ZlDDi1Iwx/Xcmbf/MuBRbLJW/RyEvkGeFT3m8pFgq
         eDHDYmddqrpPOCece8l3yzi1zCw6b2/A5RcjmGBYRF0XrEO7Gim2JN/SmtJ7nWUmSq0j
         5yRV9ly1BzZ23zLapMPZlwiEPQuWaPnmWFaRsFIsiJ8d1K7kDIijrNczaPkS8bBjVdM4
         29h/uyBkJ4hiYOk82jHSy760lYed6Ry0+MEyX2UW+khIHiaGXk+WvCVqOt5urlTpAz7I
         q6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXLKoIf9DAx+2V4Zao4whgJVEeJqzt40yWZalvFeL3UoMM4CpiN80HVGIApR8C+WMnSwFWoxuy0CJyQIXasIl5vFaY6oCjMOOs4eDUKKMRRaFs=
X-Gm-Message-State: AOJu0YxzkgcGbDM5BTrK7idrwM3EcrV5NHeowQV9oAQtqlFBSX5YyHGl
	Gm/QUG0xGNfyGKPTWEAC0pHM6FmstiMSw2tOt+/KGDXx22gTObuyjU9cF2z3r7fa6cC5fdh8rP7
	+JA==
X-Google-Smtp-Source: AGHT+IHyT9hSzByeGpSTwa9i3gWbrpnINrcW2bVP5rU6jDvs7FuvpLBkdUf0ynqha5uOrrYU15cq0A==
X-Received: by 2002:a05:651c:516:b0:2ef:2e3f:35d2 with SMTP id 38308e7fff4ca-2f2b712fa3fmr27305941fa.5.1723554113748;
        Tue, 13 Aug 2024 06:01:53 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f4184ebesm67788166b.207.2024.08.13.06.01.52
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7a843bef98so79316566b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 06:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXvlrAsG6R7Re3/3R2n4/gdt7yfR79F1+h5boT9FPdG1AJdfR9FwvIMose4xCKgEcIkys1PD3USfnO6oZK69qEDjyPo4i3WZU9TtxOya5G82hw=
X-Received: by 2002:a17:907:d2d9:b0:a7a:ae85:f245 with SMTP id
 a640c23a62f3a-a80ed258d19mr244135166b.38.1723554111718; Tue, 13 Aug 2024
 06:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org> <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
In-Reply-To: <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 15:01:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Message-ID: <CANiDSCu6BUdJt1sjmbOq2s4KU1JUN9D+HfnvSG6OqMhD-dKekw@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_140158_496978_26C048AD 
X-CRM114-Status: GOOD (  29.47  )
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

Hi Dan

On Tue, 13 Aug 2024 at 14:54, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Tue, Aug 13, 2024 at 12:13:48PM +0000, Ricardo Ribalda wrote:
> > Factor out all the power off logic, except the clk_disable_unprepare(),
> > to a new function __ar0521_power_off().
> >
> > This allows ar0521_power_on() to explicitly clean-out the clock during
> > the error-path.
> >
> > The following smatch warning is fixed:
> > drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
>
> It's better to just ignore false positives...  The problem here is that
> Smatch can't track that to_ar0521_dev(dev_get_drvdata(dev))->sensor is the same
> as sensor.  What I could do is say that "this frees *something* unknown" so
> let's silence the warning."
>
> The problem is that check_unwind.c is not very granular.  It just marks things
> as allocated and freed.  I could make it more granular so the free and the
> alloc have to match.  Or we could match based on the type.  This frees a
> "struct ar0521_dev" so mark all those as freed in the caller.
>
> >  drivers/media/i2c/ar0521.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > index 09331cf95c62..2c528db31ba6 100644
> > --- a/drivers/media/i2c/ar0521.c
> > +++ b/drivers/media/i2c/ar0521.c
> > @@ -835,7 +835,7 @@ static const struct initial_reg {
> >            be(0x0707)), /* 3F44: couple k factor 2 */
> >  };
> >
> > -static int ar0521_power_off(struct device *dev)
> > +static void __ar0521_power_off(struct device *dev)
> >  {
> >       struct v4l2_subdev *sd = dev_get_drvdata(dev);
> >       struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > @@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
> >               if (sensor->supplies[i])
> >                       regulator_disable(sensor->supplies[i]);
> >       }
> > +}
> > +
> > +static int ar0521_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > +     struct ar0521_dev *sensor = to_ar0521_dev(sd);
> > +
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
>
> You had intended to remove the clk_disable_unprepare() from __ar0521_power_off()
> but forgot so these are double unprepares.

Ups, thanks for catching it :)

Will send as v2, unless you fix it in smatch first ;P

Regards!

>
> regards,
> dan carpenter
>
> > +
> >       return 0;
> >  }
> >
> > @@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
> >
> >       return 0;
> >  off:
> > -     ar0521_power_off(dev);
> > +     clk_disable_unprepare(sensor->extclk);
> > +     __ar0521_power_off(dev);
> >       return ret;
> >  }
> >
> >
> > --
> > 2.46.0.76.ge559c4bf1a-goog
> >



-- 
Ricardo Ribalda

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
