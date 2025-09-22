Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C3CAC5AC
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Sep 2025 09:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGtojdDRYWll3N9YDJLpHQSz3Ji7i/kV/VQQ/nvuQWk=; b=gqCy2V8dRmRSSdITw82gDDv2m1
	qE543wjE41LndJIvK96WbrfcPYMLs342D8s01nJ4vcDC4tYWFG9G8osk0CJVpuhXm1LOQt2FA0A4O
	8K8oN6HzP9A9qvDyoQdA9ZS11XmR0HwwYYXK37PojAaDIDsR97+L/nMjYvtv4dfd5zZHhBhB8PBPT
	MEvs2TxeIoDIubJQ9vJiSxX1n8/bXw6DaAhBpfNEKj41Lz8r/2EQ5KVvLNLwvXat2LTCXRspJVpuX
	nkhcaykZvuG0mDe/YuTUbfHQNqd5uQtWl0d43H+TYdBtp0Oo+JCB/P0vGFCWa6/9DXcO4vZQn6bhn
	6hZL2iNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0d1k-00000009ufR-1BC4;
	Mon, 22 Sep 2025 09:40:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0d1j-00000009ufL-3PsB
	for linux-amlogic@lists.infradead.org;
	Mon, 22 Sep 2025 09:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45F88601E3;
	Mon, 22 Sep 2025 09:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508C6C4CEF0;
	Mon, 22 Sep 2025 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758534007;
	bh=o6odwIioUUT77Fg9yWNjDxSm+/A6LvZVTlgfH/VUWHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uvJMnWa95WX7LGlP5Qwi5rMwaTkQLQEnbAPQPlQi5MnOLwUWQP0Cem/BfsL5FnPwP
	 s0+24oBlDBbThQdNOAJqz2TFXDBqBpAUd8pBLNoNFYpRKupxsYkgR99Kesmf8QlBEp
	 Abew5J0sC6fj7BEDGH/ubfk7J+pTeykPX2kfE+4evvvjnEay/K3nqZGAevS8TXr02E
	 eaaCaeNBMf347EVeA7Xlj0V2sFe5M9f+/SNoB/PJC2ubIz3mGN+Rx4XrcIOrbYBa15
	 qGOkoL6Wq1FvSX3+XjLKucG/ZEFLO6BY6PD3u2c6Ziksgkol8G8I7EOcnjYITiiUrp
	 +E805szz6HQhg==
Date: Mon, 22 Sep 2025 10:40:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/26] clk: amlogic: clock controllers clean-up and
 factorisation
Message-ID: <aNEZcNbSfJlkP7Ra@finisterre.sirena.org.uk>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <b88a947c-7074-4fed-8283-c278b573a7ca@sirena.org.uk>
 <CAFBinCBe3LhN+3beovFVuWPpe3pDF5P1wSt7nPjm=ykRAx4zzQ@mail.gmail.com>
 <1jldm855cd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jldm855cd.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Filmed before a live audience.
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
Content-Type: multipart/mixed; boundary="===============1616938246016118251=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1616938246016118251==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0U/sTuh5QZlkIMvs"
Content-Disposition: inline


--0U/sTuh5QZlkIMvs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 21, 2025 at 02:59:30PM +0200, Jerome Brunet wrote:
> On Sun 21 Sep 2025 at 14:21, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> > A few days ago Marek reported problems on an Odroid-N2 and provided a fix: [0]
> > It's not queued up for -next yet.
> >
> > Please give Marek's patch a try

> Being on the A311D as well, it is likely to be the same issue.
> I suspect you would not see the crash it without earlycon indeed.

> The fix is in clk-next already so linux-next should get it soon.
> Sorry for the inconvenience and thanks for the report.

If it's supposed to turn up in -next it's probably easier for me to pick
it up from there given the firmware issues with the board, though there
may not be one until Thursday.

--0U/sTuh5QZlkIMvs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRGW8ACgkQJNaLcl1U
h9DDQggAgiEc2INRax0E+QPt6OLJRhJ0izyMuuq9C4NNk9FZ6uxptjkqn3vIr8ke
A5QqfhxdGYJyNatPT2Z0nwLuAcpOzJ9sX2Ry0FNLmIgo06wTfuAEokP+eDpqbe5G
HRfbJ2ss0g8Wg3Dc/ONwinFAP5QUkmU/Z257CtQ8tyyCHlRvaIIa5ClmEBHIN1RS
p1wO3tDt1UEMtH2i9naLEfZ8OlDSI+oiLFyEu1HKEIYq64yjXcDESxLS/Bzc3YoS
XYsLaby29vMQX6WPwzEq+ou7ZcOQF8UfJ/Bfr6dgLGaj3rDFx6zEAFSGpJM26ZmM
5+vVO9dMOj09VxweqK/PXARB+G8VqQ==
=BAPN
-----END PGP SIGNATURE-----

--0U/sTuh5QZlkIMvs--


--===============1616938246016118251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1616938246016118251==--

