Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0D2C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 17:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STAirSoUOA7sHGLAxugxoFkoHjIlRFhKALAjZw/+OwI=; b=uaXEDeQ3GM1Rv5DtiJX2K6nqSl
	zXEgCd5kqbK50cF6/mO6i4g9HdEEXdW6dmrAOPP0g5qWP6N9iuIN34E8f84ihGeCGPIOt4nP+/26v
	iQex8DWfFHjca8oR642GdMQvEpn0l3ckYhDfUI4QXOQGIq5y9FFy9dAFclw2F+tFLNCNUHhtQgVSh
	i6/XBmYNKWVB/W/j7KZ/gJXt3Z6VN8947qKcOUip1otPrHSqANQVJ6r6gFOZNXd4xSF6DAAdkzbCE
	RLRzQFHFOdd5zrkgcUPEdbAwHu2MzJ06ZGdltar0nbJxY7PlDODYP0u2/QkCOK5r9Q9pizGnQ5pd6
	lP+rNidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhaUR-00ESZW-MD; Thu, 21 Apr 2022 17:21:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhaUL-00ESXy-AA; Thu, 21 Apr 2022 17:21:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD933B827C0;
 Thu, 21 Apr 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE7C385A1;
 Thu, 21 Apr 2022 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561662;
 bh=WuG3mEg/8lhQCajKRUfY5lcdr1UBJIgbvl5qAQTm+EY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgU9T0yPDN+B9ndtK6XGBtJz7BOCT2pQGzZtRilym1TB1fF1H4OfAvk8ixGMBldhD
 86IQupGzW9mQTW+UVdMOlzVM7RmIPhHD0b6dv+3KPDS40b9sfIjHGVbzKSzJ9EdANb
 fLYYUIP0IaXf/QvH2/ldBkPA5M0Gs5/d8L5iuiSArtxtls3b0yrQFhAOzFk68CFvLl
 Dk3+HdS8UhgbFXkXTmrlo6etqzcQw/WWk9PmRKH34oE0inbVTSJpxCSJ38tPxsmvDO
 d/jiuaRtBv5NGu31Cb2qpMvODgvEE/uhTA5++8pGrHhoAKqytXxixnsX8z4l/lrqGi
 p9huEZboOlSLQ==
Date: Thu, 21 Apr 2022 18:20:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jbrunet@baylibre.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Shmidt <dimitrysh@google.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-ID: <YmGSeVbwWtyHP/Tz@sirena.org.uk>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
X-Cookie: Two percent of zero is almost nothing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_102105_551328_D451FBBD 
X-CRM114-Status: GOOD (  12.87  )
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
Content-Type: multipart/mixed; boundary="===============6154022524324389787=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6154022524324389787==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrsbsSdYKQuD+rKo"
Content-Disposition: inline


--IrsbsSdYKQuD+rKo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68

One other thing - these should be Fixes: tags, that helps tooling figure
out things like backports.

Also:

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--IrsbsSdYKQuD+rKo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhkngACgkQJNaLcl1U
h9C8Fgf/VidmSJ2cMNCtprev2dZXNKdvl5hp5ru5Oetxz+eMGSCdPjKGw4OW35Dc
mj7OuaoYqZ6+1sHDdYhwtY5rpDGBpxXsRrLLun3ddBp6SrgFIFVZH4hUWAljayN4
eLXEOdvmlTixcnKoGgvEnl7FxldrV3Ojvi6VixOhXWTpDPo3dlj1BoJvHKvU5rsr
A3Iip2GOibnZvUxLfzblfBzGs6jg7kAdUF19GflvFDoSNtCMJ2O/lAULE6QUA8CC
+dkIBIWWJCHsGgwtaRPfridNv0z1gHS+gWQOxb1F8MM7zWcoVqHg3FQBNm+pRVIX
DL2OPncZcm5/LpBtB0O7NM88PFr70Q==
=JmF7
-----END PGP SIGNATURE-----

--IrsbsSdYKQuD+rKo--


--===============6154022524324389787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6154022524324389787==--

