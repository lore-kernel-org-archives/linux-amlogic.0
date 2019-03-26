Return-Path: <SRS0=zyCZ=R5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F753C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 10:54:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F252084B
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2019 10:54:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8Vudi3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0F252084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZ4otPo7vVJ+4Il6wUfJln40yfyAiPhweA84TPziXQQ=; b=C8Vudi3OUpbHNh
	zcjnziRCfimCPShc9R399YMZq10GKzxeCGc74D2bhNNr3GcbhaJm2uuRxmmtsXln2Vkr6TwgdoHtJ
	AE2t7YN7lCaHokMNenxt51rFjyfPvrBtzclSwVEZ7f8b50M5bKIzv51Z1oSeH/ASnN2FzygRFZk1R
	7ew1X4m8zoSB6pBfFbD5y7pTcVTVbRC+eWVCS73REdWCbawD4Wu0X1cfznZg8paBNNGDoBTqaXSiC
	N4BIOC8A/dXIZV/QUXPD847uxWWucI6u3D9hlhkdbIEodOBf9NpH9lJjWBzxYrbYaNC4Wi04mc5pB
	AzkodakW2gC+G6zbDWQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8jiq-0004k7-MD; Tue, 26 Mar 2019 10:54:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8jie-0004d2-35
 for linux-amlogic@lists.infradead.org; Tue, 26 Mar 2019 10:54:17 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8jiY-0007ou-IS; Tue, 26 Mar 2019 11:54:06 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8jiY-0000yG-1I; Tue, 26 Mar 2019 11:54:06 +0100
Date: Tue, 26 Mar 2019 11:54:06 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
Message-ID: <20190326105405.p5appmjs2qdygkz3@pengutronix.de>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
 <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
 <CAFBinCAn-9oETMKMfSXoJOMBrQyrCFN7AyHG02bQaoxG1px3YA@mail.gmail.com>
 <ec428b82-f7d9-0f14-363c-a40d14ce4414@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec428b82-f7d9-0f14-363c-a40d14ce4414@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_035413_401286_B8E9C506 
X-CRM114-Status: GOOD (  25.11  )
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
Cc: linux-pwm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

On Tue, Mar 26, 2019 at 10:06:31AM +0100, Neil Armstrong wrote:
> On 25/03/2019 18:41, Martin Blumenstingl wrote:
> > On Mon, Mar 25, 2019 at 9:41 AM Uwe Kleine-K=F6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> >> On Sun, Mar 24, 2019 at 11:02:16PM +0100, Martin Blumenstingl wrote:
> >>> Back in January a "BUG: scheduling while atomic" error showed up duri=
ng
> >>> boot on my Meson8b Odroid-C1 (which uses a PWM regulator as CPU suppl=
y).
> >>> The call trace comes down to:
> >>>   __mutex_lock
> >>>   clk_prepare_lock
> >>>   clk_core_get_rate
> >>>   meson_pwm_apply
> >>>   ..
> >>>   dev_pm_opp_set_rate
> >>>   ..
> >>>
> >>> Jerome has also seen the same problem but from pwm-leds (instead of a
> >>> pwm-regulator). He posted a patch which replaces the spinlock with a
> >>> mutex. That works. I believe we can optimize this by reducing the time
> >>> where the lock is held - that also allows to keep the spin-lock.
> >>>
> >>> Analyzing this issue helped me understand the pwm-meson driver better.
> >>> My plan is to send some cleanups (with the goal of re-using more of t=
he
> >>> goodies from the PWM core in the pwm-meson driver) after this single =
fix
> >>> is merged (they can be found here: [1]).
> >>
> >> I didn't look over these in detail, but I see an issue that according
> >> to the shortlogs isn't addressed: In the .apply callback there is
> >> (simplified):
> >>
> >>         if (!state->enabled) {
> >>                 meson_pwm_disable(meson, pwm->hwpwm);
> >>                 return;
> >>         }
> >>
> >> This results in the wrong output after:
> >>
> >>         pwm_apply_state(pwm, { .enabled =3D true, .polarity =3D PWM_PO=
LARITY_NORMAL, ...});
> >>         pwm_apply_state(pwm, { .enabled =3D false, .polarity =3D PWM_P=
OLARITY_INVERTED, ...});
> >>
> >> because the polarity isn't checked.
> > let me rephrase this to make sure I understand this correctly:
> > - applying a PWM state with .enabled =3D true and PWM_POLARITY_NORMAL
> > will enable the PWM output
> > - applying a PWM state with .enabled =3D false and PWM_POLARITY_NORMAL
> > will disable the PWM output
> > - applying a PWM state with .enabled =3D true and PWM_POLARITY_INVERTED
> > will disable the PWM output
> > - applying a PWM state with .enabled =3D false and PWM_POLARITY_INVERTED
> > will enable the PWM output
> > =

> > in other words: the polarity doesn't only apply to period and
> > duty_cycle but also to the enabled state.
> =

> Sorry I don't understand your point.
> If the apply state is disable, well we disable the PWM output, I don't se=
e why
> the polarity changes the enable state.

Martin's summary was at least misleading, I didn't understand what he
meant.

The relevant point is: When the PWM is disabled (either by pwm_disable
or equivalent by pwm_apply_state(pwm, { .enabled =3D false, ... })) the
expectation is that the output becomes "inactive". That means "constant
low" for a normal PWM and "constant high" for an inverted PWM.

Then as meson_pwm_apply doesn't check for state->polarity if
state->enabled =3D=3D false there is a bug.

> I'd like to point out the architecture of the PWM.
> The PWM is only a set of Gates, Dividers and Counters.
> =

> We achieve a PWM output by calculating a clock that permits us to calcula=
te
> 2 periods (low and high) and we set the counter to switch after N cycles
> for the first half period.
> =

> We do not have an explicit "polarity" setting, we simply reverse the peri=
od
> cycles (the low length is inversed with the high length).
> =

> To apply the dividers and counters, we need to disable the PWM input clock
> gate, set the dividers and counter and release the input gate.
> =

> So yes, we should maybe stop disabling the PWM for a long period of time
> when we calculate the new settings, it can be fixed easily by calculating
> the settings and applying in a separate code path.

If the hardware supports it the counter should not be stopped---most
other PWMs in my bubble can at least change the duty cycle as required.
(That is, complete the currently running period and that without delay
start a new period with the new settings.)
 =

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
