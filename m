Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96990C49361
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:17:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51DB1613E9
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 20:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51DB1613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lRYzs3/tMR0akhQruQNQqX439Yn2s+4kcYlUzd2tr8=; b=Va778YH0Qbnzof
	HAN/VZj6dGeAo4JoYzlTF4aJfqMWKdJxsblZ3+p32fXpm1Ywj22ldVNDR6tIa5NQ5SlF4cmdPwaOr
	8GSLfjj2NOdrLph7kDRruwUwfz2vAVoxKliv8Jsgzg6NfxUBwWsQT32fbj14HS6XxHNK8gUNTygXB
	VgxMKyDhpwhZ7r289abXsUNrknnFDEnlUeJtn3bCsxnvKzyPTHkTW861Pi29MuQyuzCX27IWN4gnT
	+ac1iLa5K1hwcdK6O4K7mxFFxl/UN2mgd7niq/N+a7ljVc2KUZGWcX5WuxCNto1frl9wKYDBxJLb4
	RFwVC3TQPIM2SY6wsRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luKvU-00FQwS-I5; Fri, 18 Jun 2021 20:17:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luKvH-00FQut-5O; Fri, 18 Jun 2021 20:17:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id g8so17729727ejx.1;
 Fri, 18 Jun 2021 13:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YErG3nsC1wpUdGOxN53HPKj5RJIEYjjh/nGCBmnSwyU=;
 b=Pa0lJFQeRj540tKKzMKLN5/JSaecM7l/kTaoSNkJ6lmb7Ts1euLl+WIhPYDV6PrbXK
 SREIB1OAGs/OXCGL8WnzC4MrnJxVgyvEgMPr3HFWwx1BzWbGhAWUnnsl/Fz5lKiXhaok
 r8F4X7Nod0tFySZYgNg9IxZEUwSG/RpEmzXdoLrKpDi8LOaoQnbCBMPBdeig+nc9ej+g
 E5Wfgj7PHJEGuwSNS2WOFlR2lOlxAn7uN7eFEK0fR1w/K53OyYWjoUYgWeaa8HjZVacN
 ScMNVn/nEnzi3m0Wky9Aszc0sSYfxiHkOY9tMkZ0YXFKsz7HyYYfA5R6Nag7vzDaky8N
 PWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YErG3nsC1wpUdGOxN53HPKj5RJIEYjjh/nGCBmnSwyU=;
 b=NovW4einA+j7UoI2lyBYB2clz7UsqACFmNULXvYVeWwSC0mw+y1lgoJkrFpBwl0DdG
 nOoZy6w7yaAQ5XIJblmeOkoSLhM3LGIFhUg4BT/NJ5gY16KwvuF0IOpF46tBzx4ZPS9H
 7TKeiLmURBz4qMYzLoOcbxnixd5zv2KdYOBFtTTVnDW237ygWrDIFRPEQiGq/58RCwn5
 A2lNJBtSsxfB4YfYszARpRiXeULLrXtHKMx3waOzaA9ZLm3R5DvF7VzdK4kOmrayMFzX
 8si0cr47x0na5mZNAnkSZOZAyemRZQwNWvNQGQb+7DImjpoYG+wrqUMkXZXeuHi8miQ0
 rmYw==
X-Gm-Message-State: AOAM531DoUxhN1BhsSF0Es6qt22eNQ21zJ1ExRZRB+E6Df4SRXne6hnN
 OU9gr/J6EddWheMn82SNQJx3Rau05gB2+S+2vHQ2VOZCpbg=
X-Google-Smtp-Source: ABdhPJzuvG3rFfUe4S6n0416xLdb1JkOOjogjvkHUHWHawCwHS3pxkZTCYzpCZZfCwAy34dWxUzSPVsCQ3nFJ1U8DXw=
X-Received: by 2002:a17:907:1de6:: with SMTP id
 og38mr12866537ejc.471.1624047421761; 
 Fri, 18 Jun 2021 13:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <CAFBinCDVnBApYziHazeS8f2FXHQ-tUS55-g6B22c20OtfYD=xw@mail.gmail.com>
 <CANAwSgQcVDdPMZjuaN4O1dpVDd-KrNCGLDq0h4vfP4YZ2vSV2Q@mail.gmail.com>
In-Reply-To: <CANAwSgQcVDdPMZjuaN4O1dpVDd-KrNCGLDq0h4vfP4YZ2vSV2Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jun 2021 22:16:51 +0200
Message-ID: <CAFBinCA0-M-P5bWMKmMTq+Kgx+iEBpxirjWGxpaQqR3pfn84Fw@mail.gmail.com>
Subject: Re: [RFCv1 0/8] Meson-8b and Meson-gxbb USB phy code re-structure
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_131703_273412_2E3AAA0A 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Anand,

On Fri, Jun 18, 2021 at 3:20 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> (some email id got messed up while sending these changes.)
it happened to me before: don't worry, it's something that can be fixed

[...]
> > > Initially if we connect USB HDD at initial boot it get detected.
> > > but after that usb hotplug of USB HDD is broken.
> > > I did not observe and USB debug events messages to trace the root cause.
> > >
> > > Another issue I observed is increase of USB interrupts event
> > > even if there is not much activity on USB ports.
> > > I tried some clk changes but it did not workout for me.
> > I suggest reporting this to the dwc2 maintainers and asking for advice
> > on how to debug these issues.
> >
> Yes I have enabled the CONFIG_USB_DWC2_DEBUG
> to help debug this issue but could not find much clue on
> why this is happening.
I think CONFIG_USB_DWC2_DEBUG is a good starting point.
For myself I came to the conclusion that the dwc2 IP is too complex to
understand without additional information
Some additional information can be found in public datasheets of other
SoCs which are also using a dwc2 core, see for example RK3128 [0] or
RT3050 [1]
That's why my suggestion is to additionally ask the dwc2 maintainers
(which are not Cc'ed on this mail) for debugging suggestions.


Best regards,
Martin


[0] https://rockchip.fr/RK312X%20TRM/chapter-26-usb-otg-2-0.pdf
[1] http://static6.arrow.com/aropdfconversion/aa9a14376a75e7c5d6daa9f6aaed8411909d2021/rt3050_5x_v2.0_081408_0902.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
