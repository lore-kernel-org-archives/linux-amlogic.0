Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA6BC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 18:31:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BE320675
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 18:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AfKzzkR1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="g1qxiTTj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BE320675
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIjJYJ2s+yJMi6O3WMSey2lYjJTXRjUq5lIsx9PsNtM=; b=AfKzzkR1eaZ3DY
	jIwcJaIM4sc9H7DJX0ANqtOmMwZutn5bHkzUvAmYIdqRWTkUG8Y7Orb4cv+fAEcd7w4V611seKWpR
	ZjrGJXdhjSrvQ+23kzdPRJOeZXcLHBrfdUlr9sIF5/1qq9wPFX5txZcQ8sHDASkYussv0KTGdaeGk
	Ldwfq/7K9UOR93iye9H8GnbfUmkhm8PG4Lyh0a4ERzba19IHTEBVjveX5V0cNl/xbkEGx3tUh0Ai2
	8x41xzA1IXbWJgrkvRDnq5ftSmiXOjDgIRFD5S4InmfiaqGxrvwr9vP9O4JDzJviDRiBkBSQpc4Y+
	7WgKoTQovH1vaZac8qAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLB3d-0008IF-3Z; Mon, 29 Apr 2019 18:31:17 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLB3a-0008HS-8k
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 18:31:15 +0000
Received: by mail-oi1-x241.google.com with SMTP id v23so8973320oif.8
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 11:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l92bR4EjGt+UpMrQV1OvZjmVnnjEn6tfuZ4aZIg95FI=;
 b=g1qxiTTjNipTpvxUNViX14Quw28skUobZiwTdIp/RwQzsWTCaiSep2uI8Ziay8jfvt
 6XWPHSRYJkAVPfNI0HzhwwBoJn4IOLm+2LXB9515jHSlsRnrexD86oRCA8660V+D1ph5
 oRDCxJ0w5AKpUmCj48u1mGT2/VQAaiereXvCGhECmPVCe+jssBGAE6xOKTsK+cC4JZBJ
 zrO0zG1ZJNb05Ep06O1lzIWfGI0FTXJJRBWDyCaLnKq71za+7Mm6ssBvwdwKVdKZABVu
 j4LQKLrABN+Fq2jwG8uGDhagTspAZT6CtyiH62nNKLaHrS3+w3vogMIWuuyEGppb6jmk
 rf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l92bR4EjGt+UpMrQV1OvZjmVnnjEn6tfuZ4aZIg95FI=;
 b=XB32Lh0sB/3ZJZmgOncP585KYtzqLAix2+0pNtD146gPcq0e8FdCnY+1nzn1czmxTO
 DCtSgR1f1oqffvHXOTZhpmRhZ3eDiZYp2nViy2sOPF5wXmLZzKoiCvFPTtE62ef35CDI
 gfhdp4xgIf6gX+OAP9XitdZYZ4FOKecpBXJzZ7VJWNMWAFKFaQa6o4R/d4b+nMlAV5CR
 +n6JIK8SgBYL8kzorTwnQdttgj8JHnOomKvvXNg+C8dOnE7UeDn2DgunRwo9IHUjN7Zz
 JKq3Ii7mSo5Sx1fCWAdpMls5ZBbh+2MozlnQMRecvZfwmS7dhrSC0Vas3FgauxBl5ygJ
 EKgg==
X-Gm-Message-State: APjAAAV9GYLf/ZEAK4HvQVpD6B7douuK3PfvKezpMhIUSmD0xGLQrSd6
 BwFvcDKkMhG9QYQL7c73VtYZUN/OMLgN5xzWNwo=
X-Google-Smtp-Source: APXvYqzmWJXhhtCOuL3EHow8QQYVzhKBprAiCXPua0uRy7LXD8+lLKd9LD8mgmGiQfZyrfp0mqEvRNThwT8uqcISDRA=
X-Received: by 2002:aca:b68a:: with SMTP id g132mr310479oif.47.1556562671225; 
 Mon, 29 Apr 2019 11:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-5-jbrunet@baylibre.com>
 <CAFBinCCf8fkBPR5aoPMensjhYKpan_UzG+HCEB5yNaYs+mB8OA@mail.gmail.com>
 <17c5978419c8778eb1f2c2a6e2aee66e864ac53d.camel@baylibre.com>
In-Reply-To: <17c5978419c8778eb1f2c2a6e2aee66e864ac53d.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 29 Apr 2019 20:31:00 +0200
Message-ID: <CAFBinCCus5T7LvH7aTMYmc5gKoFkZFR-MCMGK8bSV_eAsu9Svw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] mmc: meson-gx: disable HS400
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_113114_338134_6B952DAA 
X-CRM114-Status: GOOD (  21.66  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Mon, Apr 29, 2019 at 10:29 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2019-04-27 at 22:02 +0200, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Tue, Apr 23, 2019 at 11:03 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > At the moment, all our attempts to enable HS400 on Amlogic chipsets have
> > > been unsuccessful or unreliable. Until we can figure out how to enable this
> > > mode safely and reliably, let's force it off.
> > last year I have seen issues with HS400 on my Khadas VIM2: [0]
> > have you tested all other patches from this series and HS400 is still
> > not working for you?
>
> Because HS400 was never really stable to begin with.
> It was a mistake to enable it on the VIM2
>
> >
> > I'm curious because this patch is early in the series and all the
> > tuning fixes and improvements are after this patch.
>
> There are several reasons why this new tuning won't solve the HS400 problem:
> - Signal resampling tuning granularity gets worse when rate rises. The resampling
> is done using the input frequency. We can basically resample up to the value of
> internal divider.
>
> In HS200 - Fin is 1GHz, Fout is 200MHz (1/5) so the resample range is [0, 4]
> In HS400 - Fin should be fdiv5 (400MHZ) and in such case, no resampling is
>            possible (internal div = 1)
>            Even if we keep 1GHz, then out is 333MHz max giving a range of [0, 2]
>            that's not enough to tune
this limitation would be great to have in the description of patch 7
from this series

> Going further, tuning the Rx path does not make much sense in HS400 since we
> should be using the data strobe signal to account for the round trip delay of
> the clock and correctly sample Rx. AFAICT, If there is a tuning to be done for
> HS400, it is most likely linked to the data strobe.
it would be great to have a better description as part of the commit
message - with that you can add my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

my proposal for an update patch description (apologies I have
incorrectly summarized your findings):
"
At the moment, all our attempts to enable HS400 on Amlogic chipsets have
been unsuccessful or unreliable:
- signal resampling without delay adjustments and phase tuning for the
RX and TX clocks (this caused CRC errors and hangs even without HS400
mode, for example on the Khadas VIM, Khadas VIM2 and libretech-cc
boards)
- signal resampling without delay adjustments and RX clock phase
tuning (some HS200 and HS400 eMMC chips were not recognized, for
example on the Khadas VIM and Khadas VIM2 boards)
- signal resampling tuning with delay adjustments only (works fine for
HS200 and UHS modes but doesn't fix HS400 eMMC chips, for example on
Khadas VIM2)

Further improvements for the HS400 mode are likely to be linked to the
data strobe signal.
Until we can figure out how to enable this mode safely and reliably,
let's force it off.
"

This whole series is a good step forward.
also thank you for this additional explanation!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
