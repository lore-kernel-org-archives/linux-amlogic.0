Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61AC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg/HYIu5er3z626wR1RrKLFkcdR9sfG2mihMyvE4ovk=; b=iKwYsgc0QyGwq76Mk1gatnDDwF
	FWM3FXkL75335SHEi40E7r+/k08nJv0ra+BlHMj0qwJpDHBrEJDm62cmGvG+/r6aNKaRb6OE0d97U
	vscIVstL0kld3k77uj+amJy4E5AR7HRN1dQ02MF/KUgi96DF0bPR+wrwp+mjnrkwVOQga8c1XQlDm
	yBWiqg86BDQusTzLXV4GgyDmesFuLcpBQRKwWkXRkjAOF6NIGynE+ROY9Fq08IbgL8E5xoUwtgQ6q
	VCvA9rC6d9PxA/K5eQwrhZ3Z50Shhv7Go6CGQst/NBIUxcK9F/3If6nwpQouIs1Ghg9rx92N2o7dE
	qwpL6K7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeq6-0053Y4-Mg; Mon, 13 Mar 2023 09:51:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbeq3-0053Wn-G6
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 09:51:33 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbepv-0002sX-Ko; Mon, 13 Mar 2023 10:51:23 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbepu-003ol7-JR; Mon, 13 Mar 2023 10:51:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pbept-004VPx-In; Mon, 13 Mar 2023 10:51:21 +0100
Date: Mon, 13 Mar 2023 10:51:21 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-pwm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Munehisa Kamata <kamatam@amazon.com>,
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
Message-ID: <20230313095121.fsjw2gk3givwabvj@pengutronix.de>
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
 <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
 <1ja60h106q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1ja60h106q.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_025131_556036_96670828 
X-CRM114-Status: GOOD (  27.60  )
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
Content-Type: multipart/mixed; boundary="===============6719532572800529958=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6719532572800529958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j4ba3cki7g4uoqfv"
Content-Disposition: inline


--j4ba3cki7g4uoqfv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 10:07:48AM +0100, Jerome Brunet wrote:
>=20
> On Sat 11 Mar 2023 at 22:00, Martin Blumenstingl <martin.blumenstingl@goo=
glemail.com> wrote:
>=20
> > Hi Uwe,
> >
> > On Fri, Mar 10, 2023 at 8:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > [...]
> >> There is a complicating fact, that the .apply() callback fakes support
> >> for inversed polarity. This is not (and cannot) be matched by
> >> .get_state(). As fixing this isn't easy, only point it out in a comment
> >> to prevent authors of other drivers from copying that approach.
> > If you have any suggestions on how to fix this then please let us know.
> > I don't recall any board needing support for inverted PWM - but they
> > may be out there somewhere...
>=20
> AFAIK, PWM are essentially used for the SDIO 32k clock and voltage
> regulators. I don't recall seeing anything else.
>=20
> It should be safe to change polarity if necessary, except for the DVFS
> PWM regulators maybe ? I fear that if we change the PWM setting it might
> trigger a glitch on the supply and possibly stall the CPU.
>=20
> That being said, I don't think there is any particular care regarding
> that right now, so maybe it is fine.

Another option is to do something like that:

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 16d79ca5d8f5..25a177a3fa00 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -162,8 +162,10 @@ static int meson_pwm_calc(struct meson_pwm *meson, str=
uct pwm_device *pwm,
 	duty =3D state->duty_cycle;
 	period =3D state->period;
=20
-	if (state->polarity =3D=3D PWM_POLARITY_INVERSED)
+	if (state->polarity =3D=3D PWM_POLARITY_INVERSED) {
+		WARN_ONCE(1, "Wrongly trying to support inversed polarity. Please report=
 to linux-pwm@vger.kernel.org if you rely on this\n");
 		duty =3D period - duty;
+	}
=20
 	fin_freq =3D clk_get_rate(channel->clk);
 	if (fin_freq =3D=3D 0) {

and then drop that faked support in a year or so if nobody spoke up.

Disclaimer: I assume Thierry is not a fan of this approach, he opposed
similar warnings in the past.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--j4ba3cki7g4uoqfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQO8hYACgkQwfwUeK3K
7Amt3wgAi8g1pXQC12vtM0ypcynPIXTioc3iWUPlU/r6j3c+/ECmqOQqeUR5+Lbu
euJo2JHydT1KeVdUw0ohCtTz4DTpsO38IMFTsXW9a7ryLLO3XL97bbSqwGZB93Rq
6zXDKnCSsI42E5SjilxQWh/MGxd3ZrD2Sy1X+oANujPYdtNwm0PxkYj19ycadz7v
QRzDtZMrvbtyerSIjI/K/zJdBiq4HNb3xQs84gNBtB3i5gGcDeL3qq8WbMQmSoq+
JYtW8fArLWZhSWz4joYm2vSCcToi0jYk1bfmAJi8vznlg/XHXZ7c6a4/ia+JRdr/
B9ziSWsoo2SBA3GAAwT3b4FwMnJsPg==
=/5Tn
-----END PGP SIGNATURE-----

--j4ba3cki7g4uoqfv--


--===============6719532572800529958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6719532572800529958==--

