Return-Path: <SRS0=z86A=UD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865C0C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 10:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C32324C2B
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 10:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrO/wNpm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQHXiLPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C32324C2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMl5SKtIQJPx3mPdtLPj7sdUVJ062FgEeHVymUCjbHY=; b=LrO/wNpmM4lkWv
	fjGBVuSCwJBYPREbXzpSxOs3Jx3V9VgRx/NOyKu+XVEIE8Vy+DtZmS5HTrOrcjW7HcSUT2QpQfvFt
	gWhr74Z8JGf1yIo0K7BoYiVX0y+kLfh82DOnNElQtSO1a9Vet5WhalNyJrcyOICkmJhA+y6LRRU/d
	1OyX148G7014cJ1FrjGCO1+3UIlnBrX7AJhfLGvJRvFlNQu0L2YkX6mnho8IV0nW/A7SFoK3p2wGQ
	JPKBG008/GjRyg3mj2CsxAg6B9bKFwfPbryUeLEqc5S/D0OjJljHQMMdbrKt/n59qPlyDfiUzWBJG
	eofg1ksLjEstJ2Fp8UYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY6Pi-0005wl-1R; Tue, 04 Jun 2019 10:11:30 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY6Pf-0005vY-25
 for linux-amlogic@lists.infradead.org; Tue, 04 Jun 2019 10:11:28 +0000
Received: by mail-ua1-x941.google.com with SMTP id 7so7596410uah.1
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2019 03:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vIAhQXsHJOyXhrVT0CHYLbhy05/J5RqxTMr2w2w4Y2I=;
 b=hQHXiLPx88stEsF25lRD9d1mmW3eRvX2gS3t/o9d8ANOAc2IwjY09NFrzx6Hq1JR3C
 uLW6K/95h+EHigfTJw4GCy+EEffjN5dnO5niUMWSyEwanSjMbSjOBOB+F2FRK8Hij7jS
 1TeJTMtqy+T1Hj9hbSsjWYWejx+wo/a7+PXHa1iVbw2Pni4jBXVki5eKzgwPXhIQetC3
 nvDcY84Z8Uc7b2YNs2AnLpIbgsz9GeUU3LmUF11IscqtaNC/6062Jz8HmnEklR1lBWRR
 zzFq/Aiho5kgbxIUDQFj+lzAJWMeUQha1g0f8bu7mtZCmCVxp7CTTA280jI9aOBiMm1O
 IRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vIAhQXsHJOyXhrVT0CHYLbhy05/J5RqxTMr2w2w4Y2I=;
 b=PpWNJWnEyWMQ0uemTvy8O9vNUeheesGVvD4FGEHVDfqI5Z5mSbWZG1M4W87PpbpCvi
 F9MISqXWVMovgO0EEEfjlJ602XNg8echjlI8WSqN0OSkktQams0IWgVhWpXr7mGRK0o5
 jnozIS1lIeNYkRflGV4pXkoa/hlXUwDL0r5XBwIIzKsZXeqQQxSQyKP44GYjwoF58GIo
 LFnelZ+gIJT93uFx9WyAXnRqj960TkC9LvzqC1LEFKF7RHm/PKcTf0paNzgbDiNr9188
 ruy2WT/MLzycb5cCb8BVzrSklEgeo8+1Va6xRFXivZiaRNJHe9Nako6SkigS3jn/l4o1
 zf/g==
X-Gm-Message-State: APjAAAWz/AxP0J088tnBqFBFzs9JIwBheNrxcIo3TyFQzGqpI+wutWiX
 M3YMxkc2qcBzSB9uyuJ62ChIGT+TExdNP/yEAnF0GQ==
X-Google-Smtp-Source: APXvYqx2OahnUZixNsj1G0zgpQmMhnztq1ywvKQDB+AKOAvTww/7rf5gLsRm9dBCyMhNeCDtQYchFVgLSfXBphrWUE4=
X-Received: by 2002:ab0:16da:: with SMTP id g26mr8574345uaf.15.1559643085791; 
 Tue, 04 Jun 2019 03:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <CAPDyKFoOHnYiYogjogRr=7PBjqHOseDDS6L0eirTo7Y+F449ow@mail.gmail.com>
 <CAMuHMdWHnyTWMToXU_DSezwYs_Lkxj+v0BC8PKXHZgX=e1N3ww@mail.gmail.com>
 <b6e67d32-6092-4bdf-312d-7241094a9248@baylibre.com>
 <20190604090041.GB2855@kroah.com>
In-Reply-To: <20190604090041.GB2855@kroah.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Jun 2019 12:10:49 +0200
Message-ID: <CAPDyKFoAzf-K+ZoK0Kn7W8dH+1RHmRNjd91qZiO2am0whqexow@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: meson: update with SPDX Licence identifier
To: Greg KH <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_031127_121065_E50BA44D 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 4 Jun 2019 at 11:00, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 04, 2019 at 10:52:51AM +0200, Neil Armstrong wrote:
> > Hi,
> >
> >
> > On 04/06/2019 10:36, Geert Uytterhoeven wrote:
> > > Hi Ulf, Neil,
> > >
> > > On Tue, May 28, 2019 at 10:53 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >> On Mon, 20 May 2019 at 16:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
> > >>> Update the SPDX Licence identifier for the Amlogic MMC drivers.
> > >>>
> > >>> Neil Armstrong (2):
> > >>>   mmc: meson-gx-mmc: update with SPDX Licence identifier
> > >>>   mmc: meson-mx-sdio: update with SPDX Licence identifier
> > >>>
> > >>>  drivers/mmc/host/meson-gx-mmc.c  | 15 +--------------
> > >>>  drivers/mmc/host/meson-mx-sdio.c |  6 +-----
> > >>>  2 files changed, 2 insertions(+), 19 deletions(-)
> > >>
> > >> Applied for next, thanks!
> > >
> > > Please note this conflicts with commit 2874c5fd28426836 ("treewide:
> > > Replace GPLv2 boilerplate/reference with SPDX - rule 152") upstream,
> > > which added (different) tags.
> >
> > This happens when we are not CCed with such changes.
>
> No one was cc:ed on such huge changes.  The merge conflicts are trivial
> to work out, this should not be an issue.

No worries, I deal with it as I am going to rebase my tree on rc4 on
Monday anyway.

Thanks for the heads up!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
