Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10141C05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4rTzWBYI5nvbTRVlVVP5+o5y9CPi0OH/sk3YPTrzLM=; b=A6YdV3SjsBd+pu++Hoa/bELR7s
	i48r4aH1v6uLEe8EkK3sL0ZULfbpcCuEVP1i9+CwRpEwJWG5CPWQsbsnmu8dGxoaS2+QG/beczhg5
	wG3bNZteehqupGHKiLU5bR4UIshAXbcPjo+SPu1YkUBBDlQ4OXkQ0okOPt+KrmDJrFhszj1P5JMwm
	Chd4U1xYcF3dDzif3hVhYZpYaEb6sGlnY6TwqiWArm+H/JlR7sbjmVMMTH93FzcVxWb2QfT+PnMFA
	NJ0Ho2ziY7Ggi4ZTxFvXLwEoIwo4zMdKWn21qXTqkxGQpzCASbZO9iz9jd41kfZv+ntH2iFImRsFA
	YCBlHXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxHE-007lbV-7H; Mon, 06 Feb 2023 08:55:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOxHB-007laG-An
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 08:55:02 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOxGz-00035S-1S; Mon, 06 Feb 2023 09:54:49 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOxGw-0031Jx-N4; Mon, 06 Feb 2023 09:54:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pOxGw-001Exq-V6; Mon, 06 Feb 2023 09:54:46 +0100
Date: Mon, 6 Feb 2023 09:54:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Message-ID: <20230206085446.rf3rqgaoktwrnr2e@pengutronix.de>
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_005501_394234_C9BACAA3 
X-CRM114-Status: GOOD (  12.53  )
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
Content-Type: multipart/mixed; boundary="===============6046517970976227340=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6046517970976227340==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqcbke23quziawtk"
Content-Disposition: inline


--pqcbke23quziawtk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 01, 2023 at 09:00:21PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
>=20
> Reviewed-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
this is effectively v4 of

	https://lore.kernel.org/linux-pwm/c92b9e51-bb69-0712-0b29-3db3c9a29f8b@gma=
il.com

and the ony change compared to v3 is that you dropped "items:" (and
reindented). I'll mark above v3 as superseeded in our patchwork, please
scream if I got that wrong.

Other than that:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pqcbke23quziawtk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPgwFQACgkQwfwUeK3K
7Ak7Twf/Yk3+SICeBOjvdNeJZ8KDEJlLmf7bUz16JZE5bEIgjYM2SxDI1+n/g6ap
orITRLE+vI0KaUcZYOpx/aTQ3Hh3Tzn9i1odaVCUTs11GFJcP/9unu6KlibqEjYi
fbt6ZuLYVepmhn6RZexmWCHzOZdepljJZwZfpP3VgyYs1rwBbBZzEx27L1P+UcHb
Kbt9XQjSoQoddq+jdTk0ldnAxNeXKTCKRym5mtObYgY3oUUAHpuVQzgbmN2n7RSr
vbDUpRmlnIlbcjenWnlknjg7Cqb4YgBygkgX/ihptNAhgPCnUk7JevJ2HkoHDKmd
j4Ji4gCm71X+k02/efApnitsOkajBw==
=WWKj
-----END PGP SIGNATURE-----

--pqcbke23quziawtk--


--===============6046517970976227340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6046517970976227340==--

