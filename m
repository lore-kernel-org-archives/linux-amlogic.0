Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07699C5478C
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3kvErxge5U7EaW2Q6YqEGaYi1GE9Yi/vUM2nDMX88nY=; b=vqiscMFe1UxgpJTQ/pe58eNfNh
	H0iGWykureGo1s1JMGhjvBaujMjGPAm05WGhBnNUpqd5pJ3jWc/+/W9aK2yJli6IfH3F4tSVpk2AB
	D1uAMjqnH1q41EwshEYaWLMfn0z46nJnnyftrLTar0H1qtQObmHS2Rg7mrBCGP5x1rn/In/f3sY65
	B4sGzAjZq9JM7Xv+ocfXgeqHJ2+wUVNK3uwPENPMVwbeRS4xl1+ri6WkAyz84xaRLs8qoxmPyvpt/
	w4w7DYAACCTRm0ynVDjXzwXbT6y5wElsuWw7fiKlAHiSpDlUDLFHGnjpXEaCDnXnYLo0AzZ12VuLe
	Oq2JjZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refcT-00000002A1I-1LiT;
	Mon, 26 Feb 2024 18:22:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refcQ-00000002A0X-1ZGO
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 18:22:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ACE33CE0228;
	Mon, 26 Feb 2024 18:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CAEC433F1;
	Mon, 26 Feb 2024 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708971743;
	bh=4HJ7QZmEzbiNDw8RgLII/RxxXuOFtD7S2+44xweOYmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZ3F9cbzquR4xcLD4TKdKi4927TF5ehMsNCkIqhYOPGGwQVrRbAMPobMeas7b2wNH
	 LQMLxJ0hlg4PmegcHtr+Hn+cLJGKrIQhGg3FDPXt2HUOrlxCDGDp/czNj7v3OezWNY
	 AFSmaPintXCFy5TLf5GKEvn/5cYT/FYdn5WFCIk8HPsGtm6c86odb82poAA0rfn7VG
	 oricTtk4K/kYGJ55NRWPYdjwVr56KErmzQAQ/C5/vY4H2FSTdlfJYPKR4dcBU3EqLj
	 9Z796+S9Sq74IDc4vXs84uLUHPbCAKZkkSemf+rKTLO/2kiJKhlso38WM3XiXB28Qf
	 njW8zL+z6mCqA==
Date: Mon, 26 Feb 2024 18:22:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Message-ID: <33629de8-df96-43d6-864c-a5a3f022edae@sirena.org.uk>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
 <20240223175116.2005407-7-jbrunet@baylibre.com>
 <a828b4f7-282b-4b83-9a64-04557edf9b6a@sirena.org.uk>
 <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j4jdvdr5l.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Walk softly and carry a BFG-9000.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_102226_623171_949BE250 
X-CRM114-Status: GOOD (  12.66  )
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
Content-Type: multipart/mixed; boundary="===============4982919527865607245=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4982919527865607245==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q+5S/qvXOwv2kElV"
Content-Disposition: inline


--q+5S/qvXOwv2kElV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 07:15:41PM +0100, Jerome Brunet wrote:
> On Mon 26 Feb 2024 at 15:42, Mark Brown <broonie@kernel.org> wrote:

> > /build/stage/linux/sound/soc/meson/axg-fifo.c:207:18: error: implicit d=
eclaratio
> > n of function =E2=80=98FIELD_GET=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
> >   207 |         status =3D FIELD_GET(STATUS1_INT_STS, status);
> >       |                  ^~~~~~~~~
> > cc1: all warnings being treated as errors

> Ah, I forgot to include <linux/bitfield.h>. Thanks for letting me know.
> I'll fix it

> It was fine when I tested with ARCH=3Darm64 and the default defconfig so
> most likely it got indirectly included.

> Could you tell me which ARCH/defconfig triggered this ?

Probably an x86 allmodconfig.

--q+5S/qvXOwv2kElV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXc1tsACgkQJNaLcl1U
h9BbIwf+JQ2bGsvMg1TLmjMB3qUfEiDX/uoTzuiHGbK9XfKSLd4AHucb1y6162Ex
ukDAHzN22nW0mAffn+iCmWGhOsbi+omeXSurpDUhBprtLom8EdU/XW1sR0jZTyDm
p/o08Ymm7Hi1ZkqkBcEZUPbeWQNJJZ2nCkJ36CRYZsn4Ewu+k4sJgyQqeIEXL3aR
DB5mYXLFGggpOhMtboCw/YaDJew7Vv43z5zdx26jiBpb9RN7GBRrlZ+7qW8te6t7
qmKPnN81WszZRoS36MkLArodIeUwbbxPDZg2g8RLUPbUmLFF2EuYVNejbCHxyuy5
OUseW/HQKoPkQfWc9v9ZFR/QNmtYBg==
=bRmR
-----END PGP SIGNATURE-----

--q+5S/qvXOwv2kElV--


--===============4982919527865607245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4982919527865607245==--

