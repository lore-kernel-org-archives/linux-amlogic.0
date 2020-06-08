Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D907AC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 11:41:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFAE2074B
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 11:41:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQjldu1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIRuyu7H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAFAE2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YPyOE4g6+ibaZl1PWz5hNkgRTdwkHabBTstvHijq13M=; b=sQjldu1aUWuXhxUzF9+2dh6Oi
	rtMLRwae8q/cdVT+HTMOfzFeRUFTJrORrc3tid5Zpyy+AshqvXZ7SPGUKHS4mK/P0vDkUMh4zs7uj
	nSNZZi0WcwPUtbotg0yWtWd0ba1upIMRniVhGxS9TUqGrASZg5exh7mWLVsk++y+qkzyxNeW+ie5C
	FzQLO2j3SPFr9MySGkxjy9g/5AszFrVZXoVb7YmBK8OaPhEfFLpPCG/i0m607ZRvoC5udksDaEc8w
	cdKdAwlh2PSwo8MtDAmM5eM3EG1R/LfZJ8p1TWIH8pyjIF2Fm+6PQ/xBsX2GnfB0rmXnIGXXE8uEp
	2bsKXtJ0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiG99-0005UN-LX; Mon, 08 Jun 2020 11:40:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiG97-0005Tw-4y
 for linux-amlogic@lists.infradead.org; Mon, 08 Jun 2020 11:40:54 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57A152074B;
 Mon,  8 Jun 2020 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591616452;
 bh=x4taCFMl1JSd2Q5eNsTgPag9K1UCnAlZgI2Ug8F0LTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIRuyu7HoF2N+aUEjIce4hAevgRqJwI+BsLOC3XtBOVLmgs9MWQKZAT5QGmDr5GKf
 fu7pg5IOce3RteJB6v7iXvzw0IRjCT8RWz4XrueqXh2wC5nzznCETcsHW8GeosgrBS
 MxsLKGoQ6TbwarH19XC95Pu9353pbL+po/cfNqx0=
Date: Mon, 8 Jun 2020 12:40:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
Message-ID: <20200608114050.GD4593@sirena.org.uk>
References: <20200606153103.GA17905@amd>
MIME-Version: 1.0
In-Reply-To: <20200606153103.GA17905@amd>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_044053_213460_25A303DE 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, trivial@kernel.org, lgirdwood@gmail.com,
 khilman@baylibre.com, tiwai@suse.com, perex@perex.cz,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============3183550986303555235=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3183550986303555235==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline


--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 06, 2020 at 05:31:03PM +0200, Pavel Machek wrote:
> free_irq() is missing in case of error, fix that.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7eI8EACgkQJNaLcl1U
h9D2oAf+L+75A6sm74wpOyUZsv7DPH8rJApbMWamWaaL7Zq0ZrwKsFecGUq4jP37
FvyBa8xpKWuEbPQuvtG8XwFUMjy/VBn0FgKhjbetB7+sUrQg+erx4XzY81Nq5VcG
Ov+61cWUPIKpY8Ysnj+xH1W+b5nY5EOsBfFvjNNsE3g1JadihgZrcAGdOBK3cy/7
aS/RStZcQedRmxpIIQvKhwr4j0Am1X8D2lPjFqs7hVl+g9I3t1bvKYdW/Y679FBz
HgwoXfEOkrODZtQsuMLGAqYRbyGjYKzAesmp892xPWqM07MchsB5JaMl4I81bwkO
WndnmsoTH4bOw+HPhgwcIRVT/FOqtQ==
=yNKv
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--


--===============3183550986303555235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3183550986303555235==--

