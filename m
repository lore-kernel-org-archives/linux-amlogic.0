Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B746C04EB8
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 12:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFE920839
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 12:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Igx+dNLO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E7F/Ukvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFE920839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fj6+4Y+nODV9iGy0eiShPmL5KbgyplhbZu3eUti/l2U=; b=Igx+dNLOS5otrF
	nXnFUXF91EJqALLcLTjvsPi9K08EjKwksyqGDMNvQ2NNf5BsxErYb49VNUgG6dMRISAPWx4C+2hDy
	rCLr/ERjXXg8oubJf9HepC6h0DeT/1BlwklQTe8ZRMAlypnpGcbTf14iAUlWkUbXW7YX71ojVZBN8
	RfEdsg3X7s0LK2obLRpSIj7ZuCbV2TQSV4ldjtVuZSZ3znx1zWkEKT8S9C6i8pgl0KdpJwNZ4w9Y+
	dmrtLEAskfx4PIkMH6sgFpk2MaV8Z70YZdGZ1P9CvxfFlyAETOY2aASgdoXtX74QcGUkEhABpoFcH
	W9xfZ4ubs+YO0bzIZFCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gX3XZ-0005VM-Kw; Wed, 12 Dec 2018 12:23:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX3XO-0005B4-4I
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 12:22:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id a18so5764099wmj.1
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6n1b3W6v8On8RcT3Da+D1SKbLIuuvBwoV0lCsE4MWJk=;
 b=E7F/Ukvi9OOBDC0WfO7R7wfKvbGURkJQ6f0fYKFe6OA67WpT59NToDDBZFv2CiqxMq
 DZtUSaPDrRiBr48QIK4C8X4HR/UdGAoSVOxOJLL3eVthB73RY86+Eyp0R5YOe5P7cI9/
 r5f22WOC88Vn3OH4HX4/SXW7RRGRRfkio2rWrwvKSbl99qbeHs2JKAQdiW5b2SzONfNK
 gikKA4AHxpvCKXQrwiXMq/fotXYTQXgrmOodQUj1iAZYsVI0Ddly5TKoxsfRONz+eS2k
 HJI8kYyrWIW4MWyV6ajh99zfgaqSDdvug8T34QTfAsD7QqPA1Ys/puowS3wITRCMWfKD
 vyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6n1b3W6v8On8RcT3Da+D1SKbLIuuvBwoV0lCsE4MWJk=;
 b=sRXlgVR8rvU7iISaoiGXjHFV/C/jU4Hi9alMZxPeUT0/lwSFJCcOORlZ++0Mj0CcUs
 gAwQ//T3bwtPbJW1uE5ncTzvT9gAtkVQr2Vyrtf1PqdYvcxMDKFbPCIBjtkyk6uYD1Ji
 w2kiAENB7V1dwZG0HMt38Rp11ewn3OkWRKFd+PoXXgKtPiY7Em/54uYlEzyXZgnslstz
 Vg5LF7ONsMc+T1TG51sLrjrlxahl2MoY+TQdjMMpblmX0NhiFJl2eePyqAUm9gnhNM7N
 MsXwq151y0RHNIysNMPfjTZPIOD9AvrLmdBM8AL7OKEAwzubXdwhfEBhYkdFN6z7CQY0
 rKvA==
X-Gm-Message-State: AA+aEWZGn2H0vrsdPkzL3JKIbyHLLTFYwBh1wNaHgyxJYYoS4EbVuZlb
 I8vpm4O1eKpIwto9cPLd8oFKPFI2z9Sbm4km/dD6Ew==
X-Google-Smtp-Source: AFSGD/WKZ9FXS3qZbzeoM87Jax+StOCXWTGTL0mE5wYAVVaoKI+z4Twgf2mXnj02Vbc7Bp5cXoLsWBOiTwIQqQwt9nY=
X-Received: by 2002:a1c:9e4a:: with SMTP id h71mr6437867wme.82.1544617358147; 
 Wed, 12 Dec 2018 04:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20181210092853.13050-1-mjourdan@baylibre.com>
 <c5138091-d801-8b2a-85ab-d815f0508933@baylibre.com>
In-Reply-To: <c5138091-d801-8b2a-85ab-d815f0508933@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 12 Dec 2018 13:22:27 +0100
Message-ID: <CAMO6nay4+8Y_O2iTWJ041Bt0+3VUuOQj0WEN3Pyf6L80vuxHTA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/meson: remove firmware framebuffers
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_042250_979628_8968921E 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,
On Wed, Dec 12, 2018 at 10:55 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Maxime,
>
> On 10/12/2018 10:28, Maxime Jourdan wrote:
> > In case we are using simplefb or another conflicting framebuffer, make
> > the call to drm_fb_helper_remove_conflicting_framebuffers()
> >
> > Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
> > ---
> >  drivers/gpu/drm/meson/meson_drv.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> > index d3443125e661..afbb3d707d15 100644
> > --- a/drivers/gpu/drm/meson/meson_drv.c
> > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > @@ -159,6 +159,23 @@ static void meson_vpu_init(struct meson_drm *priv)
> >       writel_relaxed(0x20000, priv->io_base + _REG(VPU_WRARB_MODE_L2C1));
> >  }
> >
> > +static void meson_remove_framebuffers(void)
> > +{
> > +     struct apertures_struct *ap;
> > +
> > +     ap = alloc_apertures(1);
> > +     if (!ap)
> > +             return;
> > +
> > +     /* The framebuffer can be located anywhere in RAM */
> > +     ap->ranges[0].base = 0;
> > +     ap->ranges[0].size = ~0;
> > +
> > +     drm_fb_helper_remove_conflicting_framebuffers(ap, "meson-drm-fb",
> > +                                                   false);
>
> I always wondered, where does the "meson-drm-fb" comes from ???
>
> Neil
>

This name ultimately ends up in a printk and has no functional impact.
See drivers/video/fbdev/core/fbmem.c:1613 :

printk(KERN_INFO "fb%d: switching to %s from %s\n", i, name,
registered_fb[i]->fix.id);

I just picked one that was similar to the names of other drm drivers
calling drm_fb_helper_remove_conflicting_framebuffers().

Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
