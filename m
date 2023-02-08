Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948FAC05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Feb 2023 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX5EJWFZgEsvuGdqcj0h49KB5TWZc9fANR4AsGNT9jk=; b=XoACUZRvOn/hOsMQ+QnsRZtQ3t
	sYk7xZp0/SC06H+8sFHaNgGvm3+gPQ1XvmEyTiQ8U9wpsftwqAvSgxio/x96Hy/guoTm/vegFG57m
	1VD7kw9SJ213NjlZl4dmzOZd84trbREeOtIEk2wg1ET5aIZ+TfvqtKe9uj52UK28PV+jk1U8mgsQA
	yL3sTzIYhxOi2wy1V/syocdTqZeTkDuHLH4gHXpVreQTUeApehsAo70NPkvNDYsUmg7E84SRXvu69
	I6NOUIhk/12znIfcbuiU9uVEO+wMMAgoO0oUsBHjuzw560kQv5Dd1MDbpMUsiudvIuG5PMYaEphrW
	RbdQfMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPijr-00FVFh-Dv; Wed, 08 Feb 2023 11:35:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPijo-00FVEY-4H
	for linux-amlogic@lists.infradead.org; Wed, 08 Feb 2023 11:35:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 90E54B81BA2;
	Wed,  8 Feb 2023 11:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46498C433EF;
	Wed,  8 Feb 2023 11:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675856141;
	bh=AUKE6M5tMZuXDYA8IUjucWQolhmviuw2K6E1aGJS+5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFEGyQnI/ki1HjHQ5rj5yWlFqkyV3rxAZ1YZHYWsr7hIxiUdF4kXT0JCX7hyDXA4d
	 40nk9fJeyAoehXLh4GRdbjXvf1i6X7wfe4CUIH2AhGHxgJZh0LArOLEIdDqdhw1aU9
	 uAWbzeB5/NCYBasygh5zk4KGlKG81WC3Ux2pE7qSIKTODjSkiBxT+doOm3MC4pRMfk
	 DONTiocCp2uJ5V9D98tSiO5tXwr+8T470wIxlHmJM/RPQGJHRaBU8EOI9nBEdJVZUJ
	 5+g2uUHcRRQxVdcJEsY285sCBTLMhNWD+9UAMHWrZetEcDTdMwIoi8iCsaY4lYt+fc
	 Gmcef5nCWHCmA==
Date: Wed, 8 Feb 2023 11:35:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to
 schema
Message-ID: <Y+OJB7OPABnPfeq7@sirena.org.uk>
References: <20230208093520.52843-1-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20230208093520.52843-1-jbrunet@baylibre.com>
X-Cookie: Walk softly and carry a megawatt laser.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_033544_338791_3AF215D9 
X-CRM114-Status: GOOD (  12.25  )
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
Content-Type: multipart/mixed; boundary="===============7390751659872379723=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7390751659872379723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q8hUcRno+jxdc1xU"
Content-Disposition: inline


--q8hUcRno+jxdc1xU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 10:35:18AM +0100, Jerome Brunet wrote:
> Continue conversion of AXG audio dt-binding documentation to schema

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--q8hUcRno+jxdc1xU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPjiQcACgkQJNaLcl1U
h9BmoAf9EcajJ7S7A4aYay3TP8axqaTlV6e/par8YbD+TMjVAIn3rVhLP/tfYPzT
LUmutr/WdLwRIHyN4+1kB1sanVXRDq8EUHGgoJTsA+Z1RajZFS2ot8xWNLeoZO8b
EGBDTF7+8axEQCw1KG1JQMHoL4lErqeWzOJxwUQfbcmXjndfdUHAnQlS4i91USVA
qW/GQ3F93rXeyQPC/BCjvBBeYwmrf9X6s/flz4YEE24hFYi+qzeqy7cKtZsWEczy
qdU9I7SsK24zW5za4lgHw1QJcmSANztHgvoqte5on59EUhP08u5N2fuSi2Ek+m/T
iwn11JkoQnMg9u0sAq7uTjtq2EgYMg==
=T+/7
-----END PGP SIGNATURE-----

--q8hUcRno+jxdc1xU--


--===============7390751659872379723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7390751659872379723==--

