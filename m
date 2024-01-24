Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37D9C46CD2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azPmQABGamhnjkw3T5yS+r1f/FXsCxnx2xPr6wCwpN4=; b=SsrbLjN/talSgG0MGUZ7VxNOiy
	GMV9dQkCVWYdztxSCaTPGs/8eSaHCPlo387OW0qardb/KuX7WgnjfxgFdeAJfx3RkuhPRg7rF5SHA
	FRjFDJkDtqQDwt/pCe4RxQ0aeIyMvy02/CKRRQmPoCStoOhWSaDiFuemWO5E/Mbbo0CzyDMY3XvKg
	mXyZ9uLrfi+YBy2OZT8+rd87amlo3ggqcSRFn9jl5Zvk61LOxUd+Dro6QyhTDo2ibonrzOtrUhXyS
	r1+GN2Ht3iHHL6aFhRqdia4vBNZR0hlTgPvFz+0Wye//QGe3plTSmZELxcT6Pej7qna4D2xhak7YT
	RXF9PGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZma-002J8V-12;
	Wed, 24 Jan 2024 09:42:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZmW-002J52-0Q
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:42:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZmM-0003ht-Lz; Wed, 24 Jan 2024 10:42:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZmL-0021gA-J6; Wed, 24 Jan 2024 10:42:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSZmL-0071nX-1a;
	Wed, 24 Jan 2024 10:42:41 +0100
Date: Wed, 24 Jan 2024 10:42:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 3/6] pwm: meson: generalize 4 inputs clock on meson8
 pwm type
Message-ID: <oyayapgrwaetyhuu6ua2nejcpgydmkijqdgtdlfqvq5jvc6nzp@xgvnwvjja3im>
References: <20231222111658.832167-1-jbrunet@baylibre.com>
 <20231222111658.832167-4-jbrunet@baylibre.com>
 <4kcbh4dezgpic2dpgdi2swtx2puqiq74w2tungmxipf4nznpn7@u4g4f3cimps4>
 <1jy1cfw0qa.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jy1cfw0qa.fsf@starbuckisacylon.baylibre.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_014252_172666_9C7DEAA0 
X-CRM114-Status: GOOD (  17.69  )
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
Content-Type: multipart/mixed; boundary="===============0924799583651465537=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0924799583651465537==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a3xdp7xgdzkgzofk"
Content-Disposition: inline


--a3xdp7xgdzkgzofk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:11:59AM +0100, Jerome Brunet wrote:
> On Wed 24 Jan 2024 at 10:08, Uwe Kleine-K=F6nig <u.kleine-koenig@pengutro=
nix.de> wrote:
> > I suggest to make this
> >
> > 	const char *parent_names[MESON_NUM_MUX_PARENTS];
>=20
> Ok.
>=20
> >
> > to make it more explicit that really four entries are needed here. This
> > also makes is unnecessary to add the additional NULL entries to
> > pwm_gxbb_ao_parent_names and the other arrays.
>=20
> I would normally agree but I'd prefer to be explicit.
>=20
> There are some instance where the NULL is in the middle, this can't go
> away. I think it looks if some inputs are explicitly NULL while the
> other are implicit.

Adding soem NULLs explicitly is fine for me. Using an array of fixed length
still (somewhat) ensures that later no shorter arrays are added which
result in surprises.

Best reagrds
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--a3xdp7xgdzkgzofk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWw25AACgkQj4D7WH0S
/k5e0wf7BlbmFsY4+YWO4iLdNo0BVoOnMnfSSNw2yPZA+YdUvXeulZDQTshMRkgQ
xNmIvXbYDeBBIUFQ64FzQQ89VyKcwTX459zycaNAg06N51FSdCM1EQO1F/Y6fqy1
g4+9fH3mHi+UJkcekm0st27G0uTvfiJ7RtkyQYK2KMD1OBmYr2ADURGmMppLzvLX
6XMsShbScQdqNKMGa2MGjB4plt3IzjyX5ZMRYaMdZABnZJsKJGXWfcr9p3fLZ3I+
Dvkti+CdMw7zHXAelVFD2EMKCMbV33PjedcIzBe9TTOQM5SPtoZHy3QIbQ+WdqNK
sbr4C8C10SJBSSUbB1NJfIJfQUTNhw==
=ENZk
-----END PGP SIGNATURE-----

--a3xdp7xgdzkgzofk--


--===============0924799583651465537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0924799583651465537==--

