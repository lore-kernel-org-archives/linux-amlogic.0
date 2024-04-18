Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDE1C4345F
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2024 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73b5HhrekaacSRSJFPJ6j8Eh7+/+JTCK4fP4ZyNzr2A=; b=Uzyb2oRCsbZu5w//gJeXhXWK+E
	RXadQv2YA01GruvIsS3vR457NAJLt26Z/8HKLO+yiZchT4eWb/e+sV96Cbi0rt1TbD/YysD0MZTcq
	++mrc1bFMUhz7C+Am9fRbB2pLRseblITTeM2/lYNUzu4uowyptnoWG2FnxVLJMQuK0WPINe7gkdtR
	/Su7RACIifUPmftqC9RBmg5dzmRGVJTzNxC48lt8joT7PZsAGf2wqc6JqC2+tfvAYTew75ql7aNo3
	nb+/Xf7FWD/Z63UJhWrx13+HmHzsEo92SnK/3rSnZ0Gz46Fjnyfzxec8AAg0LJUD/hL+7ndvNiFMD
	CzFaeOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUJu-00000002xOj-3Vs9;
	Thu, 18 Apr 2024 16:09:06 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxUJr-00000002xMk-3XD4
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Apr 2024 16:09:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxUJm-00030a-GI; Thu, 18 Apr 2024 18:08:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxUJl-00D0SV-Sv; Thu, 18 Apr 2024 18:08:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rxUJl-003YhR-2b;
	Thu, 18 Apr 2024 18:08:57 +0200
Date: Thu, 18 Apr 2024 18:08:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, 
	JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 5/5] pwm: meson: add generic compatible for meson8 to
 sm1
Message-ID: <4v5lhnjbfnjpj4k4rme6kfphurr56ae5ngup7pcsrxhs4f7qh5@jian42uepseu>
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <20240221151154.26452-6-jbrunet@baylibre.com>
 <24ec3iiudmfapiosygpsvgu7kmdqe6csbkpuzx3p3sa4oyodqu@hshmbpvzhufb>
 <1jplumc276.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jplumc276.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_090903_924593_B379E37D 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: multipart/mixed; boundary="===============2352738702270478565=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2352738702270478565==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ndkvbuldgxvpggvv"
Content-Disposition: inline


--ndkvbuldgxvpggvv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 01:57:03PM +0200, Jerome Brunet wrote:
> On Fri 12 Apr 2024 at 14:08, Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengu=
tronix.de> wrote:
> > b4 + git applied the patch just fine even without patch #4 of this
> > series. Would you be so kind to double check it works as intended?
>=20
> It does, Thx.

Thank you.
=20
> > BTW, b4 diagnosed:
> >
> > Checking attestation on all messages, may take a moment...
> > ---
> >   =E2=9C=97 [PATCH v5 5/5] pwm: meson: add generic compatible for meson=
8 to sm1
> >     + Link: https://lore.kernel.org/r/20240221151154.26452-6-jbrunet@ba=
ylibre.com
> >     + Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix=
=2Ede>
> >   ---
> >   =E2=9C=97 BADSIG: DKIM/baylibre-com.20230601.gappssmtp.com
> >
> > Is this only because it took me so long to reply, or is there a
> > configuration issue with the baylibre MTA?
>=20
> I have no idea. This is the first time this is reported

I just picked up a patch by one of your colleagues and there the DKIM
stuff was fine. I didn't debug that further.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ndkvbuldgxvpggvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYhRZgACgkQj4D7WH0S
/k7xqAf+JC9/vEi2vZ/sd2kemNl+UY2srTmHUzycRI7fzF/xLgHjol8DQZHtHJrw
zHW9PEr8n1sfrZqP0J9+rUoMpwmmD57MB/Ge/w2lHAm6pkQmyapVgMoMCivPO0aL
zMtD1psf1ytCd5KbGssRzQv74NyskNVUbQrBgEqPuOpnzeFRQswMY+o+WqajhnIE
9IdqU8EsdOejQoVVJY8uVnpEPPfp7agrp0rKKy/xKljb7HSKfW9CGLkvVMuL4JAv
QUC8Qa2Eqb/3kU2+4m0kzAxVzw/FmbDNWshQIMuBagLf220pmHBS+JmBJO06wXED
+uzDz1RL0zQxwox070ohIWmSOvn8Kw==
=i0GN
-----END PGP SIGNATURE-----

--ndkvbuldgxvpggvv--


--===============2352738702270478565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2352738702270478565==--

