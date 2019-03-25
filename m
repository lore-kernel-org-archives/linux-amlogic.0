Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964F5C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 20:07:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6888F20850
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 20:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwznII7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6888F20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Lp0YZEkDmnTLpgOC9+zkmCAP5KX/ABAh3ma/CVvjms=; b=TwznII7GdCOg0u
	cibst2mgZFg5tWyFDnGP1/GY/ujFL+ofJ9DD5oixYCEw8ToaNrSIjGpmt5I8IG2M1LuF9pE7yRVi8
	Ed0jIcxq+PVtl2AD5ZvoNayVgLxfytqlgan6DcsfgbjaVK/vjcKPL71Qpz1WIleGlOvh7gfKCg/9O
	fIxAfZWBE35qaZR7VTqtNs8hOLG6wWSiYEDnrAUKTrSwaQEDopdiyi8GPkJyY9Wb9BSjKgxM7BkSb
	6U4n6N8NqdYNiRJAwkdVKh5KPiOCk2RnbrTzBAM6HanwPJgoNZqw8tOCGG836T/PhFqfZc338YiKS
	yYUlQAxQrDgSaLNu0efQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Vsh-0006d3-3w; Mon, 25 Mar 2019 20:07:39 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Vsd-0006bc-7q
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 20:07:37 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8VsY-000567-Jo; Mon, 25 Mar 2019 21:07:30 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8VsY-0003z4-39; Mon, 25 Mar 2019 21:07:30 +0100
Date: Mon, 25 Mar 2019 21:07:30 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
Message-ID: <20190325200730.cx73jgxfexz6ybzq@pengutronix.de>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
 <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_130735_454482_54D8EE86 
X-CRM114-Status: GOOD (  35.77  )
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

Hello Martin,

On Mon, Mar 25, 2019 at 06:41:57PM +0100, Martin Blumenstingl wrote:
> On Mon, Mar 25, 2019 at 9:41 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Sun, Mar 24, 2019 at 11:02:16PM +0100, Martin Blumenstingl wrote:
> > > Analyzing this issue helped me understand the pwm-meson driver better.
> > > My plan is to send some cleanups (with the goal of re-using more of t=
he
> > > goodies from the PWM core in the pwm-meson driver) after this single =
fix
> > > is merged (they can be found here: [1]).
> >
> > I didn't look over these in detail, but I see an issue that according
> > to the shortlogs isn't addressed: In the .apply callback there is
> > (simplified):
> >
> >         if (!state->enabled) {
> >                 meson_pwm_disable(meson, pwm->hwpwm);
> >                 return;
> >         }
> >
> > This results in the wrong output after:
> >
> >         pwm_apply_state(pwm, { .enabled =3D true, .polarity =3D PWM_POL=
ARITY_NORMAL, ...});
> >         pwm_apply_state(pwm, { .enabled =3D false, .polarity =3D PWM_PO=
LARITY_INVERTED, ...});
> >
> > because the polarity isn't checked.
> let me rephrase this to make sure I understand this correctly:
> - applying a PWM state with .enabled =3D true and PWM_POLARITY_NORMAL
> will enable the PWM output
> - applying a PWM state with .enabled =3D false and PWM_POLARITY_NORMAL
> will disable the PWM output
> - applying a PWM state with .enabled =3D true and PWM_POLARITY_INVERTED
> will disable the PWM output
> - applying a PWM state with .enabled =3D false and PWM_POLARITY_INVERTED
> will enable the PWM output
> =

> in other words: the polarity doesn't only apply to period and
> duty_cycle but also to the enabled state.

You're wrong (I think):

 - if .enabled =3D true, you should configure the output to repeat the
   following pattern: be active for $duty_cycle ns and then inactive for
   the rest of $period ns.

 - if .enabled =3D false, you should configure the output to be constant
   inactive.

 - if .polarity =3D PWM_POLARITY_NORMAL we have: inactive =3D low, active =
=3D
   high

 - if .polarity =3D PWM_POLARITY_INVERTED we have: inactive =3D high, activ=
e =3D
   low

So after the two pwm_apply_state above the expectation is that the
output is constant high. But as the meson driver's apply function
doesn't check for .polarity when .enabled =3D false is requested the
result is probably constant low. (Unless the driver is still more broken
and doesn't ensure the output gets inactive on .disable().)

> > If you want to implement further cleanups, my questions and propositions
> > are:
> >
> >  - Is there a publicly available manual for this hardware? If yes, you
> >    can add a link to it in the header of the driver.
> yes, it's documented in the public S912 datasheet [0] page 542 and follow=
ing
> I'll add a patch which adds the link to the driver
> =

> >  - Why do you handle reparenting of the PWM's clk in .request? Wouldn't
> >    this be more suitable in .apply?
> Jerome's answer (not long after yours) basically covers this:
> - the assigned-clock-parents property could have been used but it wasn't
> - the driver could automatically set the correct parent, but this
> isn't implemented
> =

> (I assume this was done to keep it short and simple to for the first
> version of the driver)

I don't know how assigned-clock-parents works, but maybe it is even
simpler to use than the hardcoding that currently is used in the driver?
 =

> >  - Does stopping the PWM (i.e. clearing MISC_{A,B}_EN in the MISC_AB
> >    register) freeze the output, or is the currently running period
> >    completed first? (The latter is the right behaviour.)
> I don't know, I would have to measure this with a logic analyzer.

In practise you can do this with a multimeter, too. Just do something
like:

	pwm_apply_state({ .enabled =3D true, .period =3D 5s, .duty_cycle =3D 5s, .=
polarity =3D PWM_POLARITY_NORMAL });
	pwm_apply_state({ .enabled =3D false, .period =3D 5s, .duty_cycle =3D 5s, =
.polarity =3D PWM_POLARITY_NORMAL });

(assuming the PWM supports periods that long). The expectation is that
the last command takes nearly 5 s to complete and while it waits the
output is high and on return it's low. If that isn't the case, there is
a bug somewhere.

> can you please explain why this is important?

Well, that's the semantic that the PWM API promises to its users.
Up to now this is poorly documented, there is an RFC patch waiting for
review that improves the situation.

> >  - Please point out in the header that for changing period/duty
> >    cycle/polarity the hardware must be stopped. (I suggest to apply the
> >    style used in https://www.spinics.net/lists/linux-pwm/msg09262.html
> >    for some consistency.)
> I'm not sure about this. Amlogic's vendor kernel uses a modified
> version of this driver [1] which has an explicit comment not to
> disable the PWM output when changing the period/duty cycle.

That would be better as stopping the driver also violates the API's
requirements. If this is not a hardware imposed limit, it would be great
to fix the driver accordingly.

> the PWM is configured with two separate registers (PWM_MISC_REG_AB
> contains the divider and PWM_PWM_A contains the high/low count).
> there's a short timeframe where the PWM output signal is neither the
> "old setting" nor the "new setting" (but rather a mix of both). what
> do other PWM drivers do in this case (if this is a common thing)?

If this cannot be prevented in hardware, I think this should be
documented clearly at the top of the driver. Up to now this kind of
problem isn't (TTBOMK) well tracked and questions like "How many drivers
suffer from $problem" cannot be easily answered.
(A bit unrelated: I think the violation that disabling a PWM doesn't
complete the currently running period is a common one. But because the
corresponding questions where not asked for new driver submissions until
recently, this is untracked and probably driver authors are not even
aware of this requirement.)

> > Another thing I just noted: The .get_state callback only sets .enabled
> > but nothing of the remaining information is provided.
> as far as I can see the PWM core uses .get_state only during registration:
> this means we should read (and calculate) .duty_cycle and .period from
> the register values. polarity always has to be "normal" since there's
> no information about it in the registers.

So you can change the polarity, but you cannot read that information
back? That's another item for the list of limitations.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
