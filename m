Return-Path: <SRS0=KZtH=SC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7762CC43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 18:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A06C2085A
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Mar 2019 18:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HQONUDrm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A06C2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2NVdvQTARUaCGQiXyorPmjhHwpm3372zS2yihNiUjU=; b=HQONUDrmrhvC7b
	tSUwoZnW42U2v3LLMcyoK11R5pl8rsm/d/WyiXhXnCvFhq8N3vxrQdy9F99p8muz1f54LjsWIkwWy
	Uly7YROVjCSqzqFOOD6aWArlST65NocHmASB+TlI8bkI1ic0jRQxmn9n3r74SYOLu0qyiRMRXKm6K
	1/EUuC8yptJh1lxrPTJgd5uENUiebulyhbNlb1ErAvlZ/GkS6arQDLVxOxYUsddR1r3qZJ5bwSWFM
	xQqv2FyZDrZSLJBkvOUwZzmT0ykGuyuJlA70qfLDv1RSOta4ugQ+AH2xArD3tTqxKLsug9veUl5ti
	Iz8O5V8XUrZf9UF/3D0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAfUb-0004Dm-F7; Sun, 31 Mar 2019 18:47:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAfUX-000453-0Y
 for linux-amlogic@lists.infradead.org; Sun, 31 Mar 2019 18:47:39 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hAfUR-0007FK-3o; Sun, 31 Mar 2019 20:47:31 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1hAfUQ-0001eS-E9; Sun, 31 Mar 2019 20:47:30 +0200
Date: Sun, 31 Mar 2019 20:47:30 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
Message-ID: <20190331184730.y767dxhblffxj3om@pengutronix.de>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
 <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
 <20190325200730.cx73jgxfexz6ybzq@pengutronix.de>
 <CAFBinCCGWsb+1WHFe6uwrpUYgH4iix0WT8_v_Nj5BhGKRyjiLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCCGWsb+1WHFe6uwrpUYgH4iix0WT8_v_Nj5BhGKRyjiLQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190331_114737_271094_76CD073C 
X-CRM114-Status: GOOD (  15.36  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Mar 30, 2019 at 08:29:35PM +0100, Martin Blumenstingl wrote:
> Hello Uwe,
> =

> On Mon, Mar 25, 2019 at 9:07 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> [...]
> > > >  - Does stopping the PWM (i.e. clearing MISC_{A,B}_EN in the MISC_AB
> > > >    register) freeze the output, or is the currently running period
> > > >    completed first? (The latter is the right behaviour.)
> > > I don't know, I would have to measure this with a logic analyzer.
> >
> > In practise you can do this with a multimeter, too. Just do something
> > like:
> >
> >         pwm_apply_state({ .enabled =3D true, .period =3D 5s, .duty_cycl=
e =3D 5s, .polarity =3D PWM_POLARITY_NORMAL });
> >         pwm_apply_state({ .enabled =3D false, .period =3D 5s, .duty_cyc=
le =3D 5s, .polarity =3D PWM_POLARITY_NORMAL });
> >
> > (assuming the PWM supports periods that long). The expectation is that
> > the last command takes nearly 5 s to complete and while it waits the
> > output is high and on return it's low. If that isn't the case, there is
> > a bug somewhere.
> the longest supported period (using the 24MHz crystal as input, which
> is the slowest input clock and thus gives the longest possible
> duration) is 349514407ns (that's approx. 0.35 seconds). my multimeter
> isn't fast enough to measure this so I'm using my logic analyzer with
> puleseview instead: [0]
> =

> I added the following code to meson_pwm_request:
>   struct pwm_state enable =3D {
>         .enabled =3D true,
>         .period =3D 349514407U,
>         .duty_cycle =3D 349514407U,
>         .polarity =3D PWM_POLARITY_NORMAL };
>   struct pwm_state disable =3D {
>         .enabled =3D false,
>         .period =3D 349514407U,
>         .duty_cycle =3D 349514407U,
>         .polarity =3D PWM_POLARITY_NORMAL };
>   pwm_apply_state(pwm, &enable);
>   pwm_apply_state(pwm, &disable);
> =

> this returns immediately. my logic analyzer doesn't see signal change
> (I'm sampling at 1MHz).
> =

> can you please confirm that my test code and measurement procedure is cor=
rect?
> if it is then my observation is that disabling the PWM does so
> immediately, without waiting for the current period to complete

Ack, with the above two pwm_apply_state the output must be high when the
first pwm_apply_state returns. Then it must stay high for n *
349514407 ns (for an natural n >=3D 1) and then go low.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
