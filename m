Return-Path: <SRS0=z86A=UD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBE8C282CE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 08:37:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362BB205F4
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 08:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BHuwiDOk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362BB205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzmXSp73Bf7NkqOSjVNpn3Nd7Z+vZuBCs3c8UMwtWCw=; b=BHuwiDOkuao+eW
	8KPU4JoKzeM75jy+y01YdD3lCjWTcOLiocEmWgQ0T34ODkqQTfnoqkAytVoYwxitdT+SYn2vP4pk4
	IQimLDDG6IOZvYLFxpIYGcgrO/MvM72PsYpiqOJnzi04TMhbqbXIf+IwQWTYry3UpwqdQAD9zvMan
	vkm1ffmgWLHRTp33lHPk641TPmzQ96CSzRyvoDD4kIq7ebBEK3Ga1EIoTJO4xaWS0D7ca+mq2s1Nw
	8/fxwzfvmenPcZFhjqqKJmRbiebJ9aSDiTA/WyEfrA4RHX7GMhPCkc152OhRxRXlaXVs4N7rcUzhv
	Kd0oVY3DUru65Ps9cpvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY4wR-00040N-4K; Tue, 04 Jun 2019 08:37:11 +0000
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY4wN-0003zM-FX; Tue, 04 Jun 2019 08:37:08 +0000
Received: by mail-lf1-f67.google.com with SMTP id p24so9313907lfo.6;
 Tue, 04 Jun 2019 01:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9Nt6qozBUK6drcpof1+TwMEXL9WmUd9V+VggpiZn+A=;
 b=kuEXVM4Upt0kiS2y0dYi0DDH91n/+AYXct2WLpoKuLGZrw7cxn6Aqa5uvqm21JwgMy
 i1qfH7JKODgZzqQsZCLS3Y780oTLAddHFG7PFHCLOchAOBvAHnCyaM1SkSCqM1HyYTG3
 v++REEQs9Z7cXvUJ4I+Kco3N1SRUIqMrLjDv4nW05y1f6TXjjSgKgscO3OLDMjPbBWyQ
 TqpkEZA8uCXGhHGGhXEsCNm+yP4gInnJ2z1uKm8PGB93lBwmX+OdiIPKTGIKJ1bDPvrI
 tPkoUp9/+G+f4EdDHqW/7TzLT4Q5oH3OPGw5UYJ87Kuw0dMtE9QxUjAfgu4rdvillV+U
 bwnQ==
X-Gm-Message-State: APjAAAXwR3pHt8hq+lINGt9mJSQEfdyT4Ak1ZH1bAhER/nscIdKXu8AT
 epuZcjODdRBnEJHtyKE8y82BczaEAUiaOVyIREs=
X-Google-Smtp-Source: APXvYqw93iUlXYu8dPqQcx+f3tfXZ72Q5ZS8GVxBMq0ItikCpS0IsuP0YnKL3t97ZoLH9sUbcmA4K/rRcZzJe16lhLU=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr15738576lfn.23.1559637424910; 
 Tue, 04 Jun 2019 01:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190520143647.2503-1-narmstrong@baylibre.com>
 <CAPDyKFoOHnYiYogjogRr=7PBjqHOseDDS6L0eirTo7Y+F449ow@mail.gmail.com>
In-Reply-To: <CAPDyKFoOHnYiYogjogRr=7PBjqHOseDDS6L0eirTo7Y+F449ow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Jun 2019 10:36:53 +0200
Message-ID: <CAMuHMdWHnyTWMToXU_DSezwYs_Lkxj+v0BC8PKXHZgX=e1N3ww@mail.gmail.com>
Subject: Re: [PATCH 0/2] mmc: meson: update with SPDX Licence identifier
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_013707_527933_62EE405C 
X-CRM114-Status: GOOD (  11.45  )
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
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ulf, Neil,

On Tue, May 28, 2019 at 10:53 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Mon, 20 May 2019 at 16:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
> > Update the SPDX Licence identifier for the Amlogic MMC drivers.
> >
> > Neil Armstrong (2):
> >   mmc: meson-gx-mmc: update with SPDX Licence identifier
> >   mmc: meson-mx-sdio: update with SPDX Licence identifier
> >
> >  drivers/mmc/host/meson-gx-mmc.c  | 15 +--------------
> >  drivers/mmc/host/meson-mx-sdio.c |  6 +-----
> >  2 files changed, 2 insertions(+), 19 deletions(-)
>
> Applied for next, thanks!

Please note this conflicts with commit 2874c5fd28426836 ("treewide:
Replace GPLv2 boilerplate/reference with SPDX - rule 152") upstream,
which added (different) tags.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
