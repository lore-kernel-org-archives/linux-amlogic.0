Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B8C74A44
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 21:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLkUdKxrALtCM/Y1MVzuj9wHjsFe4xwc+orYpdiY+lI=; b=r81Yo5ZTknS+zEekMLdfQX3jGp
	07afjMrhr2DJCmsmOpbqoXlCLqomGsO5U7t3ltdy6MtvTXpNIR+ot3zGSVN2jqxur9XL6x2beUCtP
	UDy5wJ6WnNvMP4+lLigl70DUsRikppTD8ZAg54MaJYGgbnfznefAmt+kXgVNbd7pjebbXBXEetIKW
	o9nhAFodLVvqP9ggDtRlbKbHOSQxzv04QUGoTkLE9iBEJ2r6yHJEMnbl5dIahDMDBPSIdjWmJwAfu
	DzvyHtjwBasj4slde8uvhiEAOCPQr7C9KT/fluP7FlkYYV3LtUpNiNiheYQ3uaKbr5cSU1ZvoWGNS
	HByNNyhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb71P-001Ip4-DG; Sat, 11 Mar 2023 21:44:59 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb71F-001Imk-Kk
	for linux-amlogic@lists.infradead.org; Sat, 11 Mar 2023 21:44:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb719-0003cW-2j; Sat, 11 Mar 2023 22:44:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb717-003U6Q-Sq; Sat, 11 Mar 2023 22:44:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pb717-0048R8-8k; Sat, 11 Mar 2023 22:44:41 +0100
Date: Sat, 11 Mar 2023 22:44:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Munehisa Kamata <kamatam@amazon.com>,
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Explicitly set .polarity in .get_state()
Message-ID: <20230311214437.tdv5wl5a6qgsewd4@pengutronix.de>
References: <20230310191405.2606296-1-u.kleine-koenig@pengutronix.de>
 <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCCfqgBkHq2fFy=d+8C6nwq=wehu9nzePfwuY5ndfLMWoQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_134449_706948_3F738347 
X-CRM114-Status: GOOD (  23.95  )
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
Content-Type: multipart/mixed; boundary="===============4075049753157695585=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4075049753157695585==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4maj6yxo5akufdgw"
Content-Disposition: inline


--4maj6yxo5akufdgw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2023 at 10:00:50PM +0100, Martin Blumenstingl wrote:
> Hi Uwe,
>=20
> On Fri, Mar 10, 2023 at 8:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> [...]
> > There is a complicating fact, that the .apply() callback fakes support
> > for inversed polarity. This is not (and cannot) be matched by
> > .get_state(). As fixing this isn't easy, only point it out in a comment
> > to prevent authors of other drivers from copying that approach.
> If you have any suggestions on how to fix this then please let us know.
> I don't recall any board needing support for inverted PWM - but they
> may be out there somewhere...

And that's the problem. As the hardware doesn't support inverted
polarity there is no way to implement it correctly. The only right way
would be to return -EINVAL in this case, but this might break some
consumers.

I have an idea how to evolve the PWM API. That's by introducing an
=2Eoffset parameter to struct pwm_state. This would describe the following
PWM signal:


   ___________/=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF\_____=
__________/=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF=C2=AF\____
   ^                         ^                         ^                   =
      ^                         ^
   <------ period ---------->
   <- offset->
              <--------> duty_cycle

This is more general than polarity: It can describe normal polarity
(.offset =3D 0) and inversed polarity (.offset =3D .period - .duty_cycle).

Then the policy to implement a pwm_state like that would probably be:

 - Pick the biggest period not bigger than requested
 - for that period pick the biggest duty cycle not bigger than requested
 - for that period and duty_cycle pick the biggest offset not bigger
   than requested.

With these rules in place it would be allowed to configure normal
polarity for a request with inverted polarity, but not the other way
around. Then the algorithm currently implemented in the meson driver
would be allowed.

A consumer that doesn't care about the offset (i.e. most drivers) could
just pass .offset =3D .period - 1.

To be practical for consumers who care about polarity, we first would
need a way to test the capabilities of a PWM though. I have an idea for
that, too, but today this is still vapourware.

> > Fixes: c375bcbaabdb ("pwm: meson: Read the full hardware state in meson=
_pwm_get_state()")
> > Reported-by: Munehisa Kamata <kamatam@amazon.com>
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4maj6yxo5akufdgw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQM9kIACgkQwfwUeK3K
7AnKNwf5AVcvzbbovW0B1iiKTDldySSke8ms11GNKQux6cCmeUcLwXa7FJ2RfD4P
c6Wwxsk6/+myN0n0p4+0mwncIq60RIngX7MiB8Ym0oC07Ivlftg+IFfjAA7VSGNK
daGc0+d0DyHiZ4sCbSzRCLUDyZ+Y0r4i0QYOqTcftnQ0TzgcTs5YXxBKf9DLqHeM
rRWCmnL7xz88zrqO7gPYM6oFX8EjHm3a9P0aJA8gK6CFMopUaphkeTfkIp3rqeY2
l5gALAF2lvBPmorufiMPqyBUOe2vLwabnVMt7M1/PNFf5FL5A8Emws92RXhWhotX
+oYNgg3LYHPBJ5wZjhPTcbJQ0xoFOQ==
=9noi
-----END PGP SIGNATURE-----

--4maj6yxo5akufdgw--


--===============4075049753157695585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4075049753157695585==--

