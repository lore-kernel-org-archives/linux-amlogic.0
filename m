Return-Path: <SRS0=nUoP=3D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E50C33C9E
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 20:21:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2998824655
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jan 2020 20:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="npgXwO4A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uPnlPYEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2998824655
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rkydsidZ5Jl0coBE5F/7f/Yk3TSXGvpdbMW3EvhFIw=; b=npgXwO4AD5wWCO
	hL2FFkr52nqt5VRn1tlrZVqBHngbLe+b2TPt5AF3FSyTXCGKQWGcRklPpt/YZl6U4c2Ddc2WxKJg9
	eFGFY8lmMdXYLxy7Sly+a8eRp7/e7wm0PhtGVCF8/S9ULheVWUqTyAdExG3Tb+A8zge7fsdCEKunI
	ld0zZmf+mnZE3A2ugKk3lHH3+5o+zZCAKAPZsp7DjZ6srDn27did1/QJ/xNeSNoz3brTIvRG8YTwS
	dhAO3KEG7UHusi3dB4IumyfM7de8vZqMVa3Av7RZJGXnuXBv0DqZR1utOdMrll61+M/njbbmFrYoT
	msiHOHvc7gVa1F9R66cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irSh6-0000E3-48; Tue, 14 Jan 2020 20:21:44 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irSgz-0000Ck-GO; Tue, 14 Jan 2020 20:21:41 +0000
Received: by mail-ed1-x541.google.com with SMTP id v28so13162998edw.12;
 Tue, 14 Jan 2020 12:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTYOdAjqpPQyd/dKUd7t4m1y6m6buUvTbOTtmO8r2xg=;
 b=uPnlPYExpuZKHXBq0k1aDFQypwDgNSHN+5V84q3ieCd874DrCu8HeEwMpj5bzRFH+P
 F1QXEi8rne5kzXiaawvx7TbGhZwwQR+x3dVDWFlXR/Sc1lLsa8eIVcEv+YyC2/NwDMIy
 pJvXxofQ1Xj7CuoHioC8CVqOX+C6PwyQK43bhK2g/wxMUW9PeRKGwvVBGi1yRgOJx1EH
 3SoHWKXB2QHnuzpGffvxygQR1x1L9Id36rfosShZB3jm6tCQR3W8Pky/sS2jaRWP4FgF
 Zhx9TOCGmzN4LHksxWRKSzE91ZH8b6LOCoqNMjE1VBfHBLCVNWqVZkP5b85iiKkTGoQe
 vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTYOdAjqpPQyd/dKUd7t4m1y6m6buUvTbOTtmO8r2xg=;
 b=AvFTNLhf5XRpBp0ZvkvOmqzmRKJces6B+aNM2AcHqcVWgaI9MPdE4diZInjcGAfgKL
 tDHPzKlH5YVN2zZDu2MNTug60NhhtJagjyol4E3fJFGLQgssEC1Mv2DkcSXq+m/igxP1
 xtjlSJa2FK3CXPxSK9ZORPG52wn5+TgmaZUpdinN2K/RdJ9Bsui4WLCY0w3HwvmZYc8a
 2mS+dFAlkgLdIM8+gaJjIsrVsCmoj6wmkaHllKKYZgk4iCHxj3eZjjogRKPfn8xuSdsO
 /J6vtnWJ5YSlgw10IinWlCiA22xVVBjw6VnS9Z1qWto+sKddDDbj9RIdZvzEdyTNqag+
 pVGg==
X-Gm-Message-State: APjAAAVnJRZFioQKmdO5e0g9YLjC6UDkPpylGOCWDHMh8doHDA/QOlAR
 0z8Hek6qF6hlGlgzk2U/0V/vqbiLAwdyR27GiSU=
X-Google-Smtp-Source: APXvYqwUGwwmpnBLO0b5hpgDEXjku/e8Ri4iad2bNMoLATaQhP7Vu24eJWlvCK7tUZvc70ovkb7JVC8NryjWKrbam2A=
X-Received: by 2002:aa7:d94d:: with SMTP id l13mr23832761eds.328.1579033295846; 
 Tue, 14 Jan 2020 12:21:35 -0800 (PST)
MIME-Version: 1.0
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
 <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
 <CAFBinCD7o-q-i66zZhOro1DanKAfG-8obQtzxxD==xOwsy_d6A@mail.gmail.com>
 <21d0730b-8299-8bfd-4321-746ccb3772d0@arm.com>
In-Reply-To: <21d0730b-8299-8bfd-4321-746ccb3772d0@arm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 Jan 2020 21:21:24 +0100
Message-ID: <CAFBinCC4LttRsWDpMDEsYFa-ccRcErOuhpwa41O54f9Cmn4v0A@mail.gmail.com>
Subject: Re: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator
 for control again
To: Steven Price <steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_122137_572690_F007A2F9 
X-CRM114-Status: GOOD (  23.44  )
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com, alyssa@rosenzweig.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Steven,

On Mon, Jan 13, 2020 at 6:10 PM Steven Price <steven.price@arm.com> wrote:
>
> On 09/01/2020 17:27, Martin Blumenstingl wrote:
> > On Thu, Jan 9, 2020 at 12:31 PM Steven Price <steven.price@arm.com> wrote:
> >>
> >> On 07/01/2020 23:06, Martin Blumenstingl wrote:
> >>> dev_pm_opp_set_rate() needs a reference to the regulator which should be
> >>> updated when updating the GPU frequency. The name of the regulator has
> >>> to be passed at initialization-time using dev_pm_opp_set_regulators().
> >>> Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
> >>> will update the GPU regulator when updating the frequency (just like
> >>> we did this manually before when we open-coded dev_pm_opp_set_rate()).
> >>
> >> This patch causes a warning from debugfs on my firefly (RK3288) board:
> >>
> >> debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
> >> present!
> >>
> >> So it looks like the regulator is being added twice - but I haven't
> >> investigated further.
> > I *think* it's because the regulator is already fetched by the
> > panfrost driver itself to enable it
> > (the devfreq code currently does not support enabling the regulator,
> > it can only control the voltage)
> >
> > I'm not sure what to do about this though
>
> Having a little play around with this, I think you can simply remove the
> panfrost_regulator_init() call. This at least works for me - the call to
> dev_pm_opp_set_regulators() seems to set everything up. However I
> suspect you need to do this unconditionally even if there are no
> operating points defined.
I'm not sure if I can safely remove panfrost_regulator_init() because
it calls regulator_enable()
but there's no regulator_enable() equivalent in devfreq or OPP

I'm not sure how this is supposed to work
if someone has an idea: please let me know

> > [...]
> >>>       ret = dev_pm_opp_of_add_table(dev);
> >>> -     if (ret)
> >>> +     if (ret) {
> >>> +             dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
> >>
> >> If we don't have a regulator then regulators_opp_table will be NULL and
> >> sadly dev_pm_opp_put_regulators() doesn't handle a NULL argument. The
> >> same applies to the two below calls obviously.
> > good catch, thank you!
> > are you happy with the general approach here or do you think that
> > dev_pm_opp_set_regulators is the wrong way to go (for whatever
> > reason)?
>
> To be honest this is an area I still don't fully understand. There's a
> lot of magic helper functions and very little in the way of helpful
> documentation to work out which are the right ones to call. It seems
> reasonable to me, hopefully someone more in the know will chime in it
> there's something fundamentally wrong!
OK, if you know anybody who could help then please Cc them


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
