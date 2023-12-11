Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5810C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8Wk08sFf5nn5+FPlNSRZ4NT3RP415KZMdvEUYTvZy8=; b=QllsEJU2CTbb8CIXBjZ7FJVc3m
	EGBJphJi9/WH4rsiXO/pY2Yg/90D79qYhSC9TvQxbFbgVBmjCeK8vviOrnkty8y5MsD6bQpbLfRym
	GCUZJdLuF8DxoFbjbfY++o1aHXSkpMMJ+CFwWzDbyekVC5/s4TxZZdgUWfTt0Yq3jSW5kMeei7Gy0
	SJ1juvc2H1XcqiXjH6Vkd4njXQTpINRAM0fFv05P1mkAeHbOAQfX2eNVEBxMBR9CyrrBSlvAYh7IT
	EnDbyAiJDhm/1hZThp990bvZUD/l9mR4kvvkpDTmPmX90y1BEIa4z4L3TPkmSYVkDimRZcSwA7W+P
	w90k/TKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjOq-005w5Y-0y;
	Mon, 11 Dec 2023 16:44:56 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjOl-005w2R-27
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 16:44:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjOg-0007i0-JM; Mon, 11 Dec 2023 17:44:46 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjOf-00F8sZ-TC; Mon, 11 Dec 2023 17:44:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCjOf-0012Ta-Jq; Mon, 11 Dec 2023 17:44:45 +0100
Date: Mon, 11 Dec 2023 17:44:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] pwm: meson: Simplify using dev_err_probe()
Message-ID: <20231211164445.cklnwuc3jni7wvji@pengutronix.de>
References: <20231206214817.1783227-2-u.kleine-koenig@pengutronix.de>
 <ZXM72QYBbb32Q_aL@orome.fritz.box>
 <20231208190620.5qobgtyii2wt7tfa@pengutronix.de>
 <ZXbsDRslZNKCeJF9@orome.fritz.box>
 <20231211141900.x6tpyctch5fv3uqf@pengutronix.de>
 <ZXcpswXxb1oQldp5@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZXcpswXxb1oQldp5@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_084451_721740_4684510D 
X-CRM114-Status: GOOD (  47.73  )
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
Content-Type: multipart/mixed; boundary="===============3574804897941846844=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3574804897941846844==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="56xsskwnamuv7jv5"
Content-Disposition: inline


--56xsskwnamuv7jv5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 04:24:35PM +0100, Thierry Reding wrote:
> On Mon, Dec 11, 2023 at 03:19:00PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Mon, Dec 11, 2023 at 12:01:33PM +0100, Thierry Reding wrote:
> > > On Fri, Dec 08, 2023 at 08:06:20PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Fri, Dec 08, 2023 at 04:52:57PM +0100, Thierry Reding wrote:
> > > > > This is a lot of churn for very little gain.
> > > >=20
> > > > We seem to have different conceptions of churn. Each hunk here is an
> > > > improvement for both SLOC count and usefulness of the generated err=
or
> > > > message.
> > > >=20
> > > > 	failed to register somename: -5
> > > >=20
> > > > is worse than
> > > >=20
> > > > 	error EIO: failed to register somename
> > > >=20
> > > > , isn't it?
> > >=20
> > > That's entirely subjective.
> >=20
> > It's not. You and me both know that -5 is EIO. But there are quite a few
> > people who don't.
>=20
> So it is, in fact, subjective.

For some individuals it's an improvement and for others it doesn't make
things worse. So in sum it's an objective improvement.
=20
> >                   And for other error codes I'm not that fluent. (Do you
> > know -2 and -19?) Also some constants are architecture specific, so e.g.
> > -11 is -35 on alpha.
>=20
> I didn't know about -11 and -35 on Alpha. Looks like %pe would handle
> those properly, so yeah, I suppose one could count that as a benefit.
> Not sure if we have PWM drivers that run on Alpha, and Meson in
> particular probably doesn't.

So using a symbolic error number (e.g. by using dev_err_probe) makes it
unnecessary to think about which arch the given driver runs on and if
the returned values might differ by architecture. One less problem to
think about, that's an advantage.

Also the next person to write a driver on alpha (or another platform
where the error codes differ from those on x86) will probably pick an
existing driver as a template. So the meson driver being robust to run
on alpha is a good thing.

> > > I think the first version is just fine. I,
> > > and I suspect most developers will, know what to do with either of th=
ose
> > > error messages.
> >=20
> > Error messages aren't only for (kernel) developers. If you don't know
> > that the kernel uses negative error numbers as return codes, the
> > translation of -5 to EIO is even further away than opening
> > /usr/include/errno.h.
>=20
> Actually, kernel developers are exactly who these error messages are
> for. Regular users that don't know how to decipher the error codes are
> typically not going to know what to do about the error anyway, so they
> are likely just going to copy/paste into some forum or bug tracker.

That seems to be a very cocky POV to me. But that explains a lot.
The kernel community has a very l33t reputation, lowering the bar for
newbies is a nice move IMHO.

Also EIO in a forum or bug tracker is more relevantly better, because
there are more readers that then all individually have to interpret the
-5 and know/research it's -EIO.

> > > > > None of these functions are ever going to return -EPROBE_DEFER. A=
nd
> > > > > yes, I know that function's doc says that it is "deemed acceptabl=
e to
> > > > > use" elsewhere. However, the existing error messages are just fin=
e, no
> > > > > need to churn just for the sake of it.
> > > >=20
> > > > We had this disagreement already before. Yes dev_err_probe() is use=
ful
> > > > for three reasons and this driver only benefits from two of these.
> > > > That's IMHO still one reason more than needed to justify such a cha=
nge.
> > >=20
> > > I disagree. There are certainly cases where dev_err_probe() can be a
> > > significant improvement, but there are others where the improvement is
> > > very minor (if there's any at all) and in my opinion the churn isn't
> > > justified.
> >=20
> > What is churn for you? Many changes? Big changes? For me churn is only a
> > big amount of changes where a considerable part cancels out if it was
> > squashed together. For you this concept seems to be broader.
>=20
> Churn for me is really any kind of change and it's not bad per se. What
> I don't like are changes that are basically done just for the sake of
> changing something.

That's not my motivation.

> I don't have any strict rules for this, so I apply
> common sense. If you want to rewrite an error message because it
> contains typos or bad grammar, or is generally hard to understand,
> that's what I'd consider fine and an improvement.

I'd count "-5" as "generally hard to understand".
=20
> But this patch exchanges one format of the error message by another. It
> doesn't change the error message or the information content in any way,
> but instead just rearranges where the error is printed.
>=20
> On top of it not adding any benefit, this might cause somebody to get
> confused because some error message that they were looking out for is
> now different. They may have to adjust a script or something.

Yeah sure, xkcd#1172.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--56xsskwnamuv7jv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV3PHwACgkQj4D7WH0S
/k7W6gf/T2bEFCGG6JuwZp2HFr6tDna7V2JmltY7ojGkmQ7xBQmmX+lwGBnvZPa8
GN+4DfRwmGqW0DbREg4VzKqZvU024VZ00MVqbfxOszJXHXygWoopGHSp+7HwzGQg
ZGB9hi9Nkp3oXrBBJ8ce35ZbmeHdfG1mcHBs8tO/TzvBa8UusgdSfflnf/fBFaXF
3AgKXkotv0nR9Mb2fmaVfEe8w4ZjDos+W1RDvk1rM4dqEsmKzx+0uybS7IdSZ9qe
/RJM+8q77J0ip05mxl86Yts6sxP+iqw0ssCB9iKCIx5r02nGYUvYeuwASaczoYyg
TPUrELPqq9U++JCcW1/T0oxI5bklnQ==
=mB0+
-----END PGP SIGNATURE-----

--56xsskwnamuv7jv5--


--===============3574804897941846844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3574804897941846844==--

