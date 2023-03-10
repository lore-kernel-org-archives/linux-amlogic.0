Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC90C6FA99
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umwqgOOrbbAIUSys5lksOqGxUUf1IARcfJQqO92teA4=; b=MhWBQ3zxZsZeselCkTQJfdx0ia
	u1Bz0b3ZcXro0lvBWFNSKRQ+ZP5n3+ULZD8OTkHpLvz9DIlJLEUfEttVqmHtDE6PA2qKNQgrQo4o5
	xqhzcd0BXVVUhVhJlh0v4WvrSp3hjGY/UC9plmj/ZFYLPcfr+E82S3VsiIcWzoyrbAIq3/H8BRpJG
	jDUiR8+J2aBXtG07N7Um36EE+JuRkw1Kub7QoHTm5MCGHs/eKs9j0hRIbbHzkCyxiAlgLjYf/0N3E
	k/dxe0iV7JSks1OD77UTRrlRxoyKIGinog3T2MXJ4UpmYBAFbP6VGc7u2X/QJhpPj7viPtWLlD2fu
	A0ovL43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pahDZ-00Fj6V-Ub; Fri, 10 Mar 2023 18:11:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pahDX-00Fj5F-9G
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 18:11:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahDP-00049d-29; Fri, 10 Mar 2023 19:11:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahDO-003EVe-9j; Fri, 10 Mar 2023 19:11:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pahDM-003rYE-Vr; Fri, 10 Mar 2023 19:11:36 +0100
Date: Fri, 10 Mar 2023 19:11:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-pwm@vger.kernel.org,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND v4] dt-bindings: pwm: Convert Amlogic Meson PWM
 binding
Message-ID: <20230310181135.kiajexld3v655tph@pengutronix.de>
References: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_101147_340808_60339D67 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Type: multipart/mixed; boundary="===============2716495585153240149=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2716495585153240149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nvgxxjq7kdxf6a65"
Content-Disposition: inline


--nvgxxjq7kdxf6a65
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2023 at 10:19:30PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> Seems patch got lost over the question who takes it.
> Please apply through the pwm tree.

Hmm, I found
https://lore.kernel.org/linux-pwm/aaa73903-1837-d9c8-8c45-54b4473fd548@gmai=
l.com
which had no Reviewed-by tag where Krzysztof Kozlowski replied writing:
"You got here a tag and my comment was about minor issue, so please keep
that tag." I didn't find a thread where such a tag was given, though. I
only found a review reply on v3 where Krzysztof requested a change (and
didn't provide a tag).

The Reviewed-by tag for Rob probably originates from
https://lore.kernel.org/linux-pwm/20230130212121.GA3468100-robh@kernel.org/.

And there is another variant where this patch was part of a series at
https://lore.kernel.org/linux-pwm/5b83767e-c53d-316f-df10-45a39dbd9c88@gmai=
l.com
where it got an ack from me which wasn't included here.

To fix this:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

but please note that you can save some scarce maintainer time if you're
more careful here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nvgxxjq7kdxf6a65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQLctQACgkQwfwUeK3K
7AmWQQf+LoTwr1YY8aMCovUzX36/LqmoETYJ8knDwpvMibZ13lvsR0BLmB1kH0U8
YwkK5Ept9Ak+Y7+slFZDZ7L1gMSwcFl2n0HgX6JDv3pWfN80pbb2gyrztTo42msd
wN1tmMRCdKwoRAu+YBMily+Ab3WB0jS3KMGQkIGsgddlrE7OPJxoaCHTUJ7SPeei
9V/6ltHCpqgGoyeZG33+8gVps2OYPxWZILNJM50YRe/dFbWig4/KWCCNFa29YmRc
bjigzHSAbC2Ptu2JyaPsdxL0R/89FsYeTzeL6QFBnk4Lqzz9gLS51/0zaYeAmxB2
tM4nlB5zH4rDe4wLoTMEdFzn77mYDA==
=JzhO
-----END PGP SIGNATURE-----

--nvgxxjq7kdxf6a65--


--===============2716495585153240149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2716495585153240149==--

