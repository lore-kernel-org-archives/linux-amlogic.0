Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EF0C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 08:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C672087E
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 08:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="plFvuyXo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44C672087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3cn98wVHFGZrvb0FeM/BrnN8Bwr52hggXxixIvnKbM=; b=plFvuyXoaNnvhG
	LcZm6QjUf8GpDTGtylffdgYAhyDWbTm053koUOxphvnNVgEtDkGg1+bXGAy9CuX/9+lABXgVLqiii
	vlfV4hX99rW1a7ROc9yU4DGqVfiuIILviTkAp6wzqMATyTdMTx8sDOwm1ObqEfDgEXCB5JVGLodNY
	b8PMVlaU0Nl6jpex/B9VswCExk4SyBYq5Hl+bM9YPLsnBUuujcjtNraV9vrJthhphx7TbRCaAgvsr
	Cq/Eutp5mrSpOkXnnGsQearyVUM30bNUEcA2NO+wR8rGSBTYd01s3NKK1dmOX36sGi5bcLsKHXJL6
	v/HnLtbdEMNypXlXio3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8LBE-0000Pd-9h; Mon, 25 Mar 2019 08:42:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8LBA-0000Nm-Qp
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 08:42:03 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8LB4-0000Dm-Ks; Mon, 25 Mar 2019 09:41:54 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h8LB3-0005Ss-Rx; Mon, 25 Mar 2019 09:41:53 +0100
Date: Mon, 25 Mar 2019 09:41:53 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
Message-ID: <20190325084153.l44pzfewcqlkoaoe@pengutronix.de>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_014201_035077_C2208F45 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: linux-pwm@vger.kernel.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Martin,

On Sun, Mar 24, 2019 at 11:02:16PM +0100, Martin Blumenstingl wrote:
> Back in January a "BUG: scheduling while atomic" error showed up during
> boot on my Meson8b Odroid-C1 (which uses a PWM regulator as CPU supply).
> The call trace comes down to:
>   __mutex_lock
>   clk_prepare_lock
>   clk_core_get_rate
>   meson_pwm_apply
>   ..
>   dev_pm_opp_set_rate
>   ..
> =

> Jerome has also seen the same problem but from pwm-leds (instead of a
> pwm-regulator). He posted a patch which replaces the spinlock with a
> mutex. That works. I believe we can optimize this by reducing the time
> where the lock is held - that also allows to keep the spin-lock.
> =

> Analyzing this issue helped me understand the pwm-meson driver better.
> My plan is to send some cleanups (with the goal of re-using more of the
> goodies from the PWM core in the pwm-meson driver) after this single fix
> is merged (they can be found here: [1]).

I didn't look over these in detail, but I see an issue that according
to the shortlogs isn't addressed: In the .apply callback there is
(simplified):

	if (!state->enabled) {
		meson_pwm_disable(meson, pwm->hwpwm);
		return;
	}

This results in the wrong output after:

	pwm_apply_state(pwm, { .enabled =3D true, .polarity =3D PWM_POLARITY_NORMA=
L, ...});
	pwm_apply_state(pwm, { .enabled =3D false, .polarity =3D PWM_POLARITY_INVE=
RTED, ...});

because the polarity isn't checked.

If you want to implement further cleanups, my questions and propositions
are:

 - Is there a publicly available manual for this hardware? If yes, you
   can add a link to it in the header of the driver.

 - Why do you handle reparenting of the PWM's clk in .request? Wouldn't
   this be more suitable in .apply?

 - Does stopping the PWM (i.e. clearing MISC_{A,B}_EN in the MISC_AB
   register) freeze the output, or is the currently running period
   completed first? (The latter is the right behaviour.)

 - Please point out in the header that for changing period/duty
   cycle/polarity the hardware must be stopped. (I suggest to apply the
   style used in https://www.spinics.net/lists/linux-pwm/msg09262.html
   for some consistency.)

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
