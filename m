Return-Path: <SRS0=jorr=AZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A182C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 15:28:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD72221EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2020 15:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnyoytrT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBS/Rh+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD72221EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ROdy3J9OOj7Rcy9bBsDW6qFWroE/YySwXo/u080ZftY=; b=HnyoytrTlZixykfzy0UC9Yxgx
	wRoWTL0oN5MjzdcgctvXHBbSwLifTK5i98SCA9rqfMGZzdi7TBK+oXiqYz5XcyutROwP25I+F/9Ol
	0HymP6WpiRHZbEQzC6zduGwSFVzwlJcTJ9Imjg/ukAj8kS8NJ15OZ1BfXoARssGvdibJuvbxiyTzy
	l+1/Y1oVqvDFvK8qSV713fUmoLGECGvq9InCv/20Dk/WgnwaPeUHX42HTNGPMIMp6lPA01GViR1ib
	eAGtULPVqY18YpMwfx0Z5Xu3ODd7tvx6tK3il6z8Th2rfKc0e6mugEu6qXqi0z3T7AwwpMN9Vb3cV
	/KiiyPfCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvMqX-0002Oz-I3; Tue, 14 Jul 2020 15:27:53 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvMqU-0002N1-1M; Tue, 14 Jul 2020 15:27:51 +0000
Received: by mail-io1-xd41.google.com with SMTP id d18so17719709ion.0;
 Tue, 14 Jul 2020 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BbZ9kr+tjhtn9gptP5s+2QHSlxvmisN7ysGLWO9RQ7g=;
 b=nBS/Rh+xcf6Q7r1KHl496akxGYQmykeMq4rAxsJ7Yr0kbjZC+joldKAKLW0blahKsW
 TunItucvFORMdOCQFLEwLK4jo6/SU+gFxLyvcds0VCBcfasaElbgbOYa90ce6h6ncxZm
 kDjw2cZGTeLtphAOjx7cJ9xkDNvrXdfDkCvOcUMoM2d0dN3yyZTr6CTA1/6ezDLob6WS
 PfquvNUYSE7qaVIGrv1r1q3Prn9IrBg7UmNxfHE8ZYInU2rbo0RA6bsQIWcm9meQwQtI
 uLyeFLckbrliMlDV5s+OJn5Y2/2gFXw+/9Ne03wRwsepbbnOyiW1AinVZ2aT7GpKovf/
 rHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BbZ9kr+tjhtn9gptP5s+2QHSlxvmisN7ysGLWO9RQ7g=;
 b=Ym7gkIlp4CzVXSAc4Pp759qWoG8RJI+XL7NPVSxr5snkzzXX0M0hCjYZfz1A+2Vw81
 lTr1o/lx+kgOBsiLmM4vURJbqiPhIu1D6dwwWS4PDEOhCgEanwPLgNMzUDlI82OM0jfu
 862BxU+KFfUq0bQMuU94GNmI31mm+sT3UkK1M8+MUokwBcOUx2a59tcX9I5n0vOzh4Gx
 I8AbBuAFyEEAk2A62SXpXv5qJy1mzlQI4LEjSzLfgttSyqMWP4kJRECzAu51P40FIgNW
 dhtUkQYPtp1Ar+vLoGve/BpbANMWB4ic+Dv3gPTFAi0lWUpjGVgVaP5amoKi8IJi9u8S
 GW3Q==
X-Gm-Message-State: AOAM533nFDI+bYcD2r8lgkbrh+1Qeg8tuoeltAetcsfKXesLDe0lHfT7
 Ivs5KDAvmePlEw+4+truirxjXAwUWX20VyoU3EA=
X-Google-Smtp-Source: ABdhPJySWYJTKH+LCICqszWfwqAQWTKusitxWVAMF2CGsn85j3IrHlwtvJXrfe+2BJe0wHapdmCvaA1x/4lFI6i6hog=
X-Received: by 2002:a05:6638:164a:: with SMTP id
 a10mr6662401jat.126.1594740466748; 
 Tue, 14 Jul 2020 08:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <CANAwSgR3ry19bxi8ZG026tHi-Bj+mP_O=PHuzUR_ujhjsdeLzA@mail.gmail.com>
 <20200714133024.GA27406@gothmog.test>
In-Reply-To: <20200714133024.GA27406@gothmog.test>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2020 20:57:35 +0530
Message-ID: <CANAwSgQJgqHC41D8f+9J5cEpeg71PD-Oc08wQgzdjRPY6ZsuLQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Dan Robertson <dan@dlrobertson.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_112750_136561_FCA3C68B 
X-CRM114-Status: GOOD (  39.31  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Dan,

On Tue, 14 Jul 2020 at 19:00, Dan Robertson <dan@dlrobertson.com> wrote:
>
> Hi Anand!
>
> On Tue, Jul 14, 2020 at 12:26:57PM +0530, Anand Moon wrote:
> > hi Dan,
> >
> > On Mon, 13 Jul 2020 at 21:37, Dan Robertson <dan@dlrobertson.com> wrote:
> > >
> > > When testing suspend for another driver I noticed the following warning:
> > >
> > > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> > > Hardware name: Hardkernel ODROID-N2 (DT)
> > > [..]
> > > pc : reset_control_assert+0x184/0x19c
> > > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > > [..]
> > > Call trace:
> > >  reset_control_assert+0x184/0x19c
> > >  dwc3_meson_g12a_suspend+0x68/0x7c
> > >  platform_pm_suspend+0x28/0x54
> > >  __device_suspend+0x590/0xabc
> > >  dpm_suspend+0x104/0x404
> > >  dpm_suspend_start+0x84/0x1bc
> > >  suspend_devices_and_enter+0xc4/0x4fc
> > >
> > > In my limited experience and knowlege it appears that we hit this
> > > because the reset control was switched to shared and the the use
> > > of the reset control was not changed.
> > >
> > > > * Calling reset_control_assert without first calling reset_control_deassert
> > > > * is not allowed on a shared reset control. Calling reset_control_reset is
> > > > * also not allowed on a shared reset control.
> > >
> > > The above snippet from reset_control_get_shared() seems to indicate that
> > > this is due to the use of reset_control_reset() in dwc3_meson_g12a_probe()
> > > and reset_control_deassert is not guaranteed to have been called
> > > before dwc3_meson_g12a_suspend() and reset_control_assert().
> > >
> > > After some basic tests with the following patch I no longer hit the
> > > warning. Comments and critiques on the patch are welcome. If there is a
> > > reason for the current use of the reset control, I'd love to learn why!
> > > Like I said before, I have not really looked at this driver before and
> > > have verify limited experience with reset controls... Was working on
> > > another driver, hit the warning, and thought I'd take a shot at the
> > > fix :-)
> > >
> > Thanks, I was also looking into this issue
>
> Awesome!
>
> > So best Fix to this issue is to drop the call of reset_control_assert
> > from dwc3_meson_g12a_suspend
> > and drop the call of reset_control_deassert from dwc3_meson_g12a_resume
> > With these changes we do not see the warning on suspend and resume
>
> We definitely would avoid hitting the warning without the
> reset_control_(de)assert calls in suspend and resume. That is a valid use of
> the reset control, but why would that be best?
>
> From reset_control_reset():

Before entering the suspend state the code tries to do following
     clk_bulk_disable_unprepare
     regulator_disable
     phy_power_off
     phy_exit

After this operation it's needless to call *reset_control_assert*
I tried to move this call before all the above operations
but still no success with this.

Similarly on resume we should avoid calling resume
*reset_control_deassert* earlier
as the core is just reinitializing the devices.
      clk_bulk_prepare_enable
      usb_init
      phy_init
      phy_power_on
      regulator_enable
>
> > * Consumers must not use reset_control_(de)assert on shared reset lines when
> > * reset_control_reset has been used.
>
> If we use reset_control_reset() then we can not (de)assert the reset line
> on suspend/resume or any other time. Wouldn't we want to be able to
> (de)assert the reset line? And why do we no longer want to (de)assert the
> reset line on suspend/resume?
>
> > > Can you try this attached patch?
> >
> > Best Regards
> > -Anand
>
> I think I had already tested something similar. Removing the (de)assert calls
> but keeping reset will definitely remove the warning, but it means we can not
> (de)assert the line. My guess is that this is not what we want, but I could be
> wrong. Thoughts, input, or references to documentation on this would be
> appreciated.
>

As per my knowledge suspend to mem will do complete power down of the
devices with support suspend and resume feature sequentially and then it tries
to bring the device up one by one.
So it should also take care of reset lines as well.

> Cheers,
>
>  - Dan

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
