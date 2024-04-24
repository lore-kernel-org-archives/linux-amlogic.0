Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDBEC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kc/nOI1CwDncB/4i4AV3BcfvvsMHo/FzY/BPBe16Wy0=; b=U3nnIpiWmUNA7eBFtj2WiK9s4z
	4Pf8ErMgt7uVYHXSJLKs9N8v11Kr7DwkkLCumts3Se2cKMCCkRXgd98yfL7S92KOpRmH01j7QKASv
	Llok2pz9luVuUZ0VY667GlzPSNcWcP0mx9LIZjAPE6qEvSkvNegRTFjYc+AgGTL7GTEtKce52Dszj
	1e89a1QZ713DH09mJxY7pUe3KuwMKV/oxLk7vFeUSf0e2J+KVj/BV8lmdnJrmtSMdOV4FMu6Fw+J4
	iCBqBYBkVNQnXfOaiexobAEpCaguYyboV7zLZKlTHGE8U5NRCsYbtZiARRb6wnqV0ZONeGF82BrSb
	6prFptYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzd2J-00000004LmJ-3B4w;
	Wed, 24 Apr 2024 13:51:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzd2F-00000004Ll5-47DZ
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 13:51:45 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzd24-0006Wx-Ru; Wed, 24 Apr 2024 15:51:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzd23-00E5fI-OP; Wed, 24 Apr 2024 15:51:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rzd23-007pJV-27;
	Wed, 24 Apr 2024 15:51:31 +0200
Date: Wed, 24 Apr 2024 15:51:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: kelvin.zhang@amlogic.com, George Stark <gnstark@salutedevices.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
Message-ID: <ikwqq5veuad7fehk6qrpebevvn2ezuxwm3h7agloqeomxc5cbg@kj3be67luyxm>
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
 <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_065144_052423_4DBB644C 
X-CRM114-Status: GOOD (  12.92  )
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
Content-Type: multipart/mixed; boundary="===============2607972573169990473=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2607972573169990473==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iu54kaoqx4r57nc6"
Content-Disposition: inline


--iu54kaoqx4r57nc6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Apr 24, 2024 at 12:32:36PM +0200, Jerome Brunet wrote:
> > +err:
> > +	while (--i >=3D 0) {
> > +		channel =3D &meson->channels[i];
> > +		clk_put(channel->clk);
>=20
> Fine on error but leaks on module unload.
>=20
> Same as George,
>=20
> Add the devm variant of of_clk_get() if you must.

There shouldn't be a reason to still use of_clk_get(). I'd expect that
devm_clk_get() should do the job and if not that's a bug.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iu54kaoqx4r57nc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYpDmIACgkQj4D7WH0S
/k4DWwf7B/jLf47AuXBENtfvni8lWuon3Tt/DXDsPZRlEb9UoEXv4WxXlFZKVftO
l0q+KF0HHEML/dD9UUE4g8UNe2U7eUlEg7gyUjExBdfPlGM+j3lNOGZDwdqreNle
Gdoit31nRGG4IBuTHQDewkHDPOs92aw0EqeWayTuBlTXdl/F6Sm7qe8/HckfWumO
o9DdQi0o6HUdFpx6WLKRX3HiNebDQSVaWg9BSZeJyFt8uF3ppm6ZfWNKlyDJzxvE
lnQ+8aDWoPghdZFh4OBPg6KCRTd/hgs2jnkVq1py5jjxyoz68cQHxAh+fAho+9sX
EHf+41Kbc2RIW2j8/2JXauQz2hDXXA==
=LRdh
-----END PGP SIGNATURE-----

--iu54kaoqx4r57nc6--


--===============2607972573169990473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2607972573169990473==--

