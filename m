Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF1F483D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 18:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edXXpFdBtP9xjQFo2R1cIBjVHs4H9FBbAO4b+dtPnkI=; b=dPzQ9B12hesWtxoBpCUXef3WXJ
	uT2JL4HQw3fOepnNHJNJro00cB6MOc9Ya4C5O5Qc8N+bxSAgZR30QIHa5mzM6iPdN9HLDLi5LxHdV
	UO7xsfmCxce5E9cmNelUwLO7CuxyZcWuV+Ignv0KTboxQVJIHwcAEc84WPLrH4O2nqbuk9iHnvhsz
	vJjOpF1huILj2dnpJ0ZBEMtQ76WRFHKlShCsa85nGozmePwOVDO9JS4KwxdDAvgbg2nMsd5E66KNx
	AQYAjF70YIhf/SYqbAATGB+kFB5EqvK/QyPbnOh0CqTr6GLvdg+Ew6CsdR6H9/KR70G4Awm03vBj9
	mnNVB4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kJM-0000000HN6i-41hV;
	Mon, 23 Mar 2026 18:47:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kJJ-0000000HN5T-3Ocm;
	Mon, 23 Mar 2026 18:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED53B41892;
	Mon, 23 Mar 2026 18:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED47C2BCB0;
	Mon, 23 Mar 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774291652;
	bh=aGZT9X98YDjY8pqmFP7O2DzCiDdM3wiDh3Ke8SYfcAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPLPJpLXohqArS19d0Rsl9Tq2Rm0Cf5y8Ng2I5m2KFg7EtoZJdxNLwg/MTJl2W1Cw
	 2feB14MkLRFpbrXw84xdggi3fCpG0AMTwM3txAQ6rXC00YQRDOd4rGZyLjwmq+j25n
	 u+JskI+l2yddBgwBC4tkJLEE9HdAsXMRiFYNxMZadP+st927M7B+FBS2t24RShPfQ9
	 Gcs5ki9PsAov/Ojz3J882p9zKntofTzAYIC1FyDK/2g6rtbjqSAtCRhSwxs+s4AZn/
	 y9RPUlk7ZCKcje3XI/fanUrSacl6u/SSoVjkqn6W0BjckGDMsYUcFgvHV/X7xxDZkf
	 sm1UKd0Vm3Mrw==
Date: Mon, 23 Mar 2026 18:47:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Felix Gu <ustc.gu@gmail.com>, linux-spi@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Johan Hovold <johan@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: spi: meson-spicc: Fix double-put in remove path
Message-ID: <0313ea57-750c-4a2f-afa7-c6b2c8896968@sirena.org.uk>
References: <CAN4SLj0P1pAAMBbuWhbnjfwqd-5bwsNroeMzghv0P0Y_myUSqg@mail.gmail.com>
 <47bd50c8-28ce-45a5-ac88-2167b8ec2baf@web.de>
MIME-Version: 1.0
In-Reply-To: <47bd50c8-28ce-45a5-ac88-2167b8ec2baf@web.de>
X-Cookie: This is a good time to punt work.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_114733_872729_1665A821 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2224493413866661665=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2224493413866661665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZHNEvxJ+7aoee4pA"
Content-Disposition: inline


--ZHNEvxJ+7aoee4pA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 07:44:21PM +0100, Markus Elfring wrote:
> > Just code review, I have fixed a similar one before.
>=20
> Can such information mean also that any source code search approaches
> would be involved here?
> https://en.wikipedia.org/wiki/Code_review

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--ZHNEvxJ+7aoee4pA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBir4ACgkQJNaLcl1U
h9C57Af+NqjsImq0bxUPqDXWMASC25bPn1ol/sq+XmMMoLUcffzZ62sKcnKJ0Us1
ZH6Be/oVR+8pwi145jyzw4M3JF0147lCdgKJF2S3nJeYVxWWSrGHGy0gPrHlcLTu
Rvdvs2ULEcYR3ItAiuyux3MHha+x/ZOPyoi7fQDrXJIj0DJjVyqBdJnpt38Ix9kd
v6/+MMO4H3+tBEqUtwMRPYfll9TAPwvt2hVrU2ab5Azz3byqjtW9KGhjazOjCeCG
xc9fCHcH8Up/Gv6yhH519+t8QaAufDgbBFS07g7Qw/txCPHnOBJkGeef4BwUe9iC
j9a/WGJNXuE/GNCo3e1BmLGflUEaeg==
=nwlR
-----END PGP SIGNATURE-----

--ZHNEvxJ+7aoee4pA--


--===============2224493413866661665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2224493413866661665==--

