Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E9C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 May 2023 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JIDz3/D+93NfrnNUB36Cb5SzVuA1/O/G5fdbzooQpc=; b=CaDBQtJZAfTbhLi9wZb6Ixnw1Q
	LT4lyrxOTLUsVeWkqNxp0bmic2fyUZExO4v7dvNWTZmiWagVKXohgvJi7dMiDJyoLt92dbKyIqtNN
	qnEHuBf1cofQ6JdsU1NbWMPeFnN3y+EQO8qqQ1N7dleVxO5vVf9ptElFpYLK7Uj6GVpucRVWQsv0a
	6DMeu8j7twFeId7qeVlEkIRs9pj7leA1TZpyZM4vzinRS9QdhwYP+H97g9THVXZyNzO9sK6PNCInV
	3SJVBJ17Z7EbBDI3uuHv4Tyj0dNnOqSXVXkrlEpU+YwV/ke3fVOZGCk+BznfnQXGLsqdPspH2idU4
	uM2GMBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puVUF-007JJx-2q;
	Thu, 04 May 2023 09:42:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puVUD-007JIp-1g
	for linux-amlogic@lists.infradead.org;
	Thu, 04 May 2023 09:42:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1puVUA-0005MH-8V; Thu, 04 May 2023 11:42:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puVU9-0011wz-7Z; Thu, 04 May 2023 11:42:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1puVU8-001Bl7-JV; Thu, 04 May 2023 11:42:48 +0200
Date: Thu, 4 May 2023 11:42:48 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH] pwm: pwm-meson: remove not needed check in meson_pwm_calc
Message-ID: <20230504094248.vz3z4ulvnvczsmwp@pengutronix.de>
References: <d2aa9fa6-4513-c3e8-493a-3a34d5a1143b@gmail.com>
 <20230504064730.gaguyecx4q7duatk@pengutronix.de>
 <ZFN2yNr5GwVwwcHI@orome>
MIME-Version: 1.0
In-Reply-To: <ZFN2yNr5GwVwwcHI@orome>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_024253_556934_EA785B78 
X-CRM114-Status: GOOD (  21.16  )
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
Content-Type: multipart/mixed; boundary="===============7732145323272853432=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7732145323272853432==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrenycmbqljfs5t5"
Content-Disposition: inline


--vrenycmbqljfs5t5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Thu, May 04, 2023 at 11:11:36AM +0200, Thierry Reding wrote:
> On Thu, May 04, 2023 at 08:47:30AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, May 04, 2023 at 07:35:55AM +0200, Heiner Kallweit wrote:
> > > duty <=3D period implies that duty_cnt <=3D cnt. We verified before
> > > that cnt <=3D 0xffff, therefore we can omit the check here.
> > >=20
> > > Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > > ---
> > > Note: Applies only after "pwm: pwm-meson: fix handling of period/duty=
 if greater than UINT_MAX"
> >=20
> > Do you know there is git magic to express this that (at least some of)
> > the build bots understand? Look at git format-patch's --base option.
>=20
> I think --base is really only applicable if the base patch is applied to
> a well-known tree, otherwise the commit is unknown.

Yes, "base" should be something like v6.3. On a tree that has the patch
under discussion applied on top of "pwm: pwm-meson: fix handling of
period/duty if greater than UINT_MAX" on top of v6.3,=20

	git format-patch --base v6.3 -1

results in the footers:

	base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
	prerequisite-patch-id: 76d61171becf4a80716637610b6f33d9617eb9b9

Where 457391b0380335d5e9a5babdec90ac53928b23b4 is v6.3 and
76d61171becf4a80716637610b6f33d9617eb9b9 is the patch-id[1] of the
UINT_MAX patch. While this doesn't replace some human readable hints,
this is the machine-parsable information that this patch is supposed to
be applied on top of that UINT patch. This doesn't help finding that
patch, but at least it stops reports about broken stuff in v6.3 + this
patch without the prerequisite patch. So if used in the right way, this
is helpful also in Heiner's case here.

Best regards
Uwe

[1] git show @^{/"pwm: pwm-meson: fix handling of period/duty if greater th=
an UINT_MAX"} | git patch-id

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--vrenycmbqljfs5t5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRTfhcACgkQj4D7WH0S
/k5aiggAkmQQATuPO7EMqNNPVG2uTiS1L/LjlSAUK9SjFiLVURryM0P5OT27B0R6
B+UK5SInViexREumYbAiQLuCK0TNTcNhPxILB5Ow8Y3WlhwVlvXqFTd0d7iyuNkR
6x2MAo8wuBXFar3XB058J4jI5wjbOVFm2xF9oHi4WZiPE0oHBgq75SZBAB5aCWnp
AX7G+xQiPmau0SuiGafnlyuk0yX8baGhRUGx/JLXSoDdlaiar1KXQ9f7//5zs1JR
LuKUIcTEY+wK/23OjarTiCLd8Do96GE/NlvUrs0wktmua3NdO2vNP/ODWZaprd2V
ZxSl7kCt6V7usAN73dgre6gRm/Hy0w==
=AljC
-----END PGP SIGNATURE-----

--vrenycmbqljfs5t5--


--===============7732145323272853432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7732145323272853432==--

