Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB9CC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpfEK+80ooPWnF19DPKyndUZIltu4Dgdg9WxmB1zUXA=; b=ay+Tg53kv9AchQ+PorrcoZwdez
	84FU9nLdyK6IVQyU2A5s3XUVayrhywjkqIk3lJ73fFA1I5TazRHjI8iIa+o0u1s6XVIp2c2BIoz62
	69SccSr22cLDqj42YE1M16bW6z+wRWg0+D22hgtlX6NYN84ahid1b/ynkml1NEhrJNl0B9wI+bOXc
	9v8Y8zYs2OwvzN3iPo6v3hnE+n2OcKs0Ta80660Yt3bgpVDSLjJg9jAiYR2nVJVSQkUCCgyJZtv6U
	P/5M1UwU2BJ3B96f81znvSoD34+0LngCkvAQ4ylKziFwm/rg4rrN6u+a/ILgmxe8QWM3gnBHkvm0n
	Eraj81yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhX2M-00DajD-Um; Thu, 21 Apr 2022 13:39:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhX2J-00Daib-Ib
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 13:39:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0178E61D23;
 Thu, 21 Apr 2022 13:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC244C385A1;
 Thu, 21 Apr 2022 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650548392;
 bh=nWbtXgK7/CVegeW2Yp7MomHizbpndd2rroiTXzZgDXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jiDzyyT8qU+iZA6jW32vAyVa9E2jxCWbxPzyGK7LCNFZC38nkUT1TrmKkqx8v7IDq
 r65/vpafLxmncUa4Re6PmvU4of4ifUIAPqiv4NpHlumxPK1bD6sFiJP5GFu21bZo8n
 gMg1TMIvmca/vHbW8vdohgirEcIc3IwsmoZKPnPK/jEWIbhY8r2/81Adtie6AybWzl
 EKYyxnDZuLNX1LurLOPpC9qECNk40uB8yKuuHWtG6Oni93WygbjHalxK7pmIZUvWq8
 PifXauKBZAI45K8m9uJ+o3NkO8ldohaX8qWfRSNHmbv2t0N4Ov0CyPOjq7kZ2K2UaX
 9tYsLgA5XV+Qw==
Date: Thu, 21 Apr 2022 14:39:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Message-ID: <YmFeo7Hv3esVrBiY@sirena.org.uk>
References: <20220421123803.292063-1-broonie@kernel.org>
 <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Two percent of zero is almost nothing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_063955_692821_C5EC6339 
X-CRM114-Status: GOOD (  26.14  )
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
Content-Type: multipart/mixed; boundary="===============7473871020313854802=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7473871020313854802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IRsXJuFlEl6v5jNa"
Content-Disposition: inline


--IRsXJuFlEl6v5jNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 03:02:54PM +0200, Jerome Brunet wrote:
> On Thu 21 Apr 2022 at 13:38, Mark Brown <broonie@kernel.org> wrote:

> > I'm also seeing other failures due to these
> > controls having invalid values, eg:

> > # # AIU ACODEC SRC.0 value 3 more than item count 3

> > but without documentation I'm not sure how to interpret/fix these -
> > either the value should be fixed up on startup or there should be an
> > extra value there (disconnected possibly?).

> Value 3 is an I2S input from a block we don't support.
> If we did support it, it would be an hostless DPCM BE to BE link
> I'm not sure how I would represent this in ASoC TBH :/

> At the time, I thought it would be easier (for the users) to leave this
> value out and not give the false impression that the path was somehow
> supported.

> I did not realize it was the reset value nor that it would be a problem.

> I can add a element to the enum if you think it is better have it
> regardless of the actual path support. What do you think ?

I don't have strong feelings TBH - your argument for not supporting it
for now makes sense to me and we generally try to avoid changing the
hardware defaults.  Probably I'd go with changing the default but since
it's a valid value in the hardware it's most likely not too bad to leave
things as they are for now, though there might be some applications that
get confused and explode.

--IRsXJuFlEl6v5jNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhXqIACgkQJNaLcl1U
h9AI+wf+O/j6H4Bh5gXdaKnAexY6uJMSHxus/ShhK7Siy1vAUIPIPhuc3vfSkR5+
+MdsaSQ+8itIG6S7RgQU9WKwHyy1tYWfNHlGPhNx3qUbYpSWtmygstYqvR1oOe3s
mqrGFxDatfT6ZWkTbTnMIvLYftVW7vx3sZl5bdxLSPOXC0O3O++RA5vESItn2pJd
eyyWYOfOH0q4QUgONEWvg3bw9j9vJFojCwafYY645X1gnYItWVBHf827ymCPaCQY
CWm2P8UwbLxoIlCqj9iCd8VHbnzyOBcAmjBeilFpjT28fpH+NLWMS3j7tw+Srcgi
FTVZtXP62Hq0P5ZWWXfcn/4OHG3JJQ==
=fjbl
-----END PGP SIGNATURE-----

--IRsXJuFlEl6v5jNa--


--===============7473871020313854802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7473871020313854802==--

