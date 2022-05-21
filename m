Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D429C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 May 2022 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFkZu0jNOOxRtoJvDvztVwdEYWmi6IQztEo6CSSVyII=; b=2RdUmovEZVlM0i/sI8EUXz+JeY
	VHrDqdKgQu2r5SLblyj9hF9m+FLZFBi6xfLUt0vldeD+isatY27J49qAhEp1cW5fPwr33sG8QvQZb
	hl/t7DCY9QmpxBZ/hveBWxtMTz0rXoMIhrxee0KGQNKgbsZf5K237Y9jW2XOdevDg5IclaozIIcYW
	C50BwAfXWOA5stcoP5p3TfgEZ9VY0/CxphehE4qUNIICt/bfdKvVHp1kdHOaKOe0/nRW2jegPWpgc
	un3kn/yXPsca/UjoZpQNxR3ibbWRXoO4q4syD6ITIXjt1tLxn72bAkAnGzhvFD7+uh40ks/QX4MuL
	6T5QIC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsNMj-00GOlF-W3; Sat, 21 May 2022 11:33:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsNMh-00GOkP-Gz; Sat, 21 May 2022 11:33:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF52961361;
 Sat, 21 May 2022 11:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83905C385A9;
 Sat, 21 May 2022 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653132826;
 bh=l9by86nw6iePCzOmDkZQU5SCVcvIjg3rIH78FcJrxnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vPBjUecgsVVV+Rur5PY4bm1PRiEojRK9gCAXChl0pEH0hJWeZmRyT3qqPCpz+F06W
 zatZylozBgQY8aDCI9OmrH6IhfKNry2gjURTt1yfKqaVGvmYiDQbt1/g3kCx/1l+UL
 DKryVlwuLKerKaa0GTpbevegruq4iHjs01lcyUwV7Jz2pqu0c9bzVmRdXGmwwJoRyU
 yzl4pVSKJOhlHR+W+GANr0K6QrL+gQHSY4w5jI18DjEpwadJHgJxCBqujzqmghupO2
 SzN6U+ywJBfMPyAVnmNw9kZ2Q24yLgWg+HhkDE6yrlDqrdEwJutbYxRVDPsbMBXrS5
 JRAeXkua22QSQ==
Date: Sat, 21 May 2022 13:33:42 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: meson: fix typo in comment
Message-ID: <YojOFtmzkQ9IH8UE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220521111145.81697-53-Julia.Lawall@inria.fr>
MIME-Version: 1.0
In-Reply-To: <20220521111145.81697-53-Julia.Lawall@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_043347_637000_2D1D07F1 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: multipart/mixed; boundary="===============4839289893052958847=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4839289893052958847==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fYqSdqxjDeDE3M9G"
Content-Disposition: inline


--fYqSdqxjDeDE3M9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 21, 2022 at 01:11:03PM +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20

Applied to for-next, thanks!


--fYqSdqxjDeDE3M9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKIzhYACgkQFA3kzBSg
KbZP+Q/+M2eKB9fBFm0ki/BdRKVvwXbqZBQHMvjPeORijOnWqLSUqY8b/bGmFxaP
Bzjii2CgLl059ir58BeYWUCawy9uRK3aeHONPD1ZtiN8XQRiJ3dAgHZSFUOYc6YX
pZwftv7y3c1XmSCZtsZy3liAwbKrk9RK2s8lLpEl3IrI1+Za3PpMX3jbO0WJILpl
LAD7X9dEsJ+HkjwvSs1trMwn3Xfun2wQBV84R/1ZqhrCxPnmroomfI3YJUrF6L78
yVvc4x/rJ0dLFKzy/FnHBu01ifUm3BwGxwWnntT3jOwfUufy4E65gsHiC+qf9xU6
q4XEqqZPC5lXyL5c0uelcQn9KxrNwHqoNkRR32xputrN5B4TPzDmaVUphg6XVTme
1v6ykpneJOkb6LYwHHx9mw1386C14hUQHH82ByFLMggVmbOOrXbYbqh3zuala8bN
X1sPNYJKSo6oyKiWYzIj3mODcftyqV+Dn9Rn1MpsFK1nzHu6rR6dT+XyKK6zOTa5
5oxp2Bd9qWSAZ/WH9N2LJm1qRJDX1Hk+6oG0cqbqkQSCFbqnIi6bEYnOKSstI06E
lEwCNheKDK6HpMAIkzIRWYbwqkkTVF2UDzOQSY7Ojhy9dGwzwbAlmuUk3ABn2Fbr
MywuhDhGO68vdD3e2tpgg7X9k5/qMHbXs+G16G4TPbvKDYCYQqM=
=YTwd
-----END PGP SIGNATURE-----

--fYqSdqxjDeDE3M9G--


--===============4839289893052958847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4839289893052958847==--

