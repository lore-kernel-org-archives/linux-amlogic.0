Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4441DC25B7A
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2024 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn3eCFG6h5BFkL0nfhROzYfD5bc3WR/nW9xk5EawNQE=; b=0aZTp8vfZUZuWiwHP6cTKOCezG
	VrOv0t843zw8J1pwT9s3UNmWs0BP4ZA/IZQxoko1Jr7ggqbEucVYJw7S+RHigM0OlA30cvpylCAcl
	/9gR1jahOaFsxLHHQO2KehHqWjRlDusc/no8H3xn1iLVKplHCoVbVbZhRw0KIwxF542xw9viHfeup
	ZkcY80HSQbrXYjici/GXEOcGoz9sEzqA80gnQBrkOgTJdGZyY6W++ULdX7+1mcU6wxqv3/NlUC4QW
	kor47sL1DvKXyNvE7mb7+2jyMOimX4EmgKZj29JvT7PNzYR8ek2/PnKjdwiYCVyqbZ9zSoBEjf5Jy
	zb00G2JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoQN-0000000AjzZ-3KcK;
	Sat, 25 May 2024 10:14:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAoQK-0000000Ajyt-2dda
	for linux-amlogic@lists.infradead.org;
	Sat, 25 May 2024 10:14:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoQ8-0005j0-Sx; Sat, 25 May 2024 12:14:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoQ7-002ucj-4n; Sat, 25 May 2024 12:14:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1sAoQ7-00Bs96-0B;
	Sat, 25 May 2024 12:14:35 +0200
Date: Sat, 25 May 2024 12:14:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nishanth Menon <nm@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tero Kristo <kristo@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
	Santosh Shilimkar <ssantosh@kernel.org>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/3] reset: Convert to platform remove callback returning
 void
Message-ID: <3emqw7comsegnkso6o3srb3ebeoa7n2m5ckv2ycznu6muh7ydz@krrx33tn4vyv>
References: <cover.1709674157.git.u.kleine-koenig@pengutronix.de>
 <f35398925846addb282df9c8a6f09d24ecc5c6fc.camel@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <f35398925846addb282df9c8a6f09d24ecc5c6fc.camel@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_031448_696127_45D551BD 
X-CRM114-Status: GOOD (  17.58  )
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
Content-Type: multipart/mixed; boundary="===============0471664909363430624=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0471664909363430624==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iyy2kxqaffif7hoa"
Content-Disposition: inline


--iyy2kxqaffif7hoa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

On Tue, Mar 12, 2024 at 09:47:24AM +0100, Philipp Zabel wrote:
> On Di, 2024-03-05 at 22:32 +0100, Uwe Kleine-K=F6nig wrote:
> > this series converts all platform drivers below drivers/reset to struct
> > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform:
> > Provide a remove callback that returns no value") for an extended
> > explanation and the eventual goal.
> >=20
> > All conversations are trivial, because their .remove() callbacks
> > returned zero unconditionally.
> >=20
> > There are no interdependencies between these patches, so they could be
> > picked up individually. But I'd hope that they get picked up all
> > together by Philipp.
>=20
> Thank you, I'll pick them up.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

These patches made it into next (as v6.9-rc1..6d89df61650d), but not yet
into Linus's tree for v6.10-rc1. I intend to send a PR to Greg early
next week changing platform_driver::remove to match remove_new to cook
long in next for v6.11-rc1. If these reset commits don't make it in in time,
I'll be so bold and just include the commits from your for-next branch
in my PR.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iyy2kxqaffif7hoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZRugoACgkQj4D7WH0S
/k6A3wgAjRmgp8rQGY3fCinrKANP6demihtOLmhz5ruJuqwXt7ngOJE1/K58Caka
iuBBb9iemanBGqXfEb05ZjDakzK+UCQX2XxuP2uFUMl9SOm/dOG3K5G28OpkHZba
2eVybGlBFbcCAT6HG9RdMp6GnAY/AqNTwW6WD5CSPaOjYB08AwXTMw7eDAZ6ysv0
8kNd1+VrRAHtVZ+ua3OIrb7Dvw024vnp3+Kg4bV1oemz2ZrkshPX2YMd7NIKnzfV
QoHr8SHQRiz0Buo+QKJUzzhlvFdq/W2EtgpeHy0zo9GKTWufMyo0FLgKPVGQinCn
TJALA692czBe6XmnAWg3O49wqZtriQ==
=pHv1
-----END PGP SIGNATURE-----

--iyy2kxqaffif7hoa--


--===============0471664909363430624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0471664909363430624==--

