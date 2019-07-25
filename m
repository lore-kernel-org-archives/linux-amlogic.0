Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1F6C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 13:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C242721951
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 13:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/jaH5gg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="ntrHtbgT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C242721951
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wugr+9NkL2fM3PVyc0IsoqFxyl2m7VT1AA0/ovK5gds=; b=k/jaH5ggj+aexY7aJ8XAzdJnZ
	zVh1S36yDEilQzZfZ6Th0AMwVFxIpDyBTWhO7bVxgUaMcYGjuHG/QK7ZnsyfyT1pOG7JWgLiGldHV
	KzdfYhFWYvTdSzbyG4SB+HFUM+r+fup3YiB6JyjpkwL6INk+EEFEkBFxbXnqs2yq8Bq/B4OKKTVLO
	QprnThT/FuOt//glJdFMJlLW2fU0mQYmJcSVv66NesG52jgsVYk71givY6xYSRTVvtLB32np2c1Qb
	iYgLzXojIOkQanULcmcwA7uIJRx2Nzn4kBpigxgtg2Cc74eDdtN91xhMl4jF4sMAtreIe2Q08vFQ/
	ixblTxEYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqdM6-0006aY-4c; Thu, 25 Jul 2019 13:00:22 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqdM3-0006Zj-K1
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 13:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cwFiHQ+8lVnRhkC8EwJXQy9RvFDx6GKVTnbtr172hKw=; b=ntrHtbgTrK5RrFAcAKNPtbEk3
 hmGXUqTzSj2WgIAxbRXdUcV+DuGJBu9t7rYLai2X11kbG5uggytpi7YflTWu8UsY3LqosdntXd3Wu
 1u8GqHV3tp6ykZ/SPq7OJ41vTJZnTEClmjCK8dyUsirsOJOYox59O+WG+UEWLn9xVTTzs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdM1-0002p8-II; Thu, 25 Jul 2019 13:00:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 06E062742B52; Thu, 25 Jul 2019 14:00:16 +0100 (BST)
Date: Thu, 25 Jul 2019 14:00:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/6] ASoC: codec2codec: run callbacks in order
Message-ID: <20190725130016.GC4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-2-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20190724162405.6574-2-jbrunet@baylibre.com>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_060019_659771_355FFBCE 
X-CRM114-Status: UNSURE (   7.21  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5982303578678471289=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5982303578678471289==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline


--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 06:24:00PM +0200, Jerome Brunet wrote:
> When handling dai_link events on codec to codec links, run all .startup()
> callbacks on sinks and sources before running any .hw_params(). Same goes
> for hw_free() and shutdown(). This is closer to the behavior of regular
> dai links

This looks good but needs rebasing against -next due to Morimoto-san's
recent DAI changes:

  CC      sound/soc/soc-dapm.o
sound/soc/soc-dapm.c: In function =E2=80=98snd_soc_dai_link_event=E2=80=99:
sound/soc/soc-dapm.c:3857:10: error: implicit declaration of function =E2=
=80=98soc_dai_hw_params=E2=80=99; did you mean =E2=80=98snd_soc_dai_hw_para=
ms=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    ret =3D soc_dai_hw_params(&substream, params, source);
          ^~~~~~~~~~~~~~~~~
          snd_soc_dai_hw_params

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05p+AACgkQJNaLcl1U
h9AP+gf+KYWXJgB5nW6jPKjIT4VghTppSU3QuuCdZrhY/sNBJSzzMz6wo1IPyz97
fyMJDcDemoa6wbn2EdzxffFQKt7DlKNs8fNe1TSu6SaQaITcI5iGYaeeQ0U+t1ps
bydYObp41RlNN66PWCqoObTjwrtmbT4KjZt6VVD/rpUA+TYVaT4lAlC43lYdGOwS
s1U3cqK0UhnJ2tl7ijvp1GbohlH7hG+STTgSwMVHjnqTvDAnLJrQ7aXO4U39m4mc
GKQ2VtknUOXH4SmQ/HCyLdKOHXSv2fWdEMSeD65MBUxRnfW9ivMoQabStIA39rk9
m1xUbylnxDjw8hciPEbmbsQapqiavg==
=HgG8
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--


--===============5982303578678471289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5982303578678471289==--

