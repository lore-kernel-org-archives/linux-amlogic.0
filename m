Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A52C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 11:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vhu/RktCSzY3q8Q/qFPpD24cqSg9BSdl/PnXZygUvoY=; b=j+t1F+zXcPoTvkrPjkE8XvvJ0X
	oSvcybrTtsN4UKT00CNufT8nUmZ3NJfQEm3g3cfWvLOmGvaIYKkwTeVcQEM2F0HE1cjlHjN8RsaTZ
	6tiF3POqQorzjvl0ijbVqM0bSeGBY/xsnmjf8jOVUSQaeZGc5IE8X0HGzEbSADXcaFtTto8KxpK8y
	2DCSmJJ8fB/40JCiMrq481d+Xg1nQlWSlrD76m3YPBBAQCcv8FYQIqfuapo+4t6rCzaVBRtZ28X7S
	KWY8ZFOPxGneJyyR+qaxcaeAI/eNCerl8JZIPrC1jqHwcQ3EHen0TzIHaVZ1bHE42o1IYdmWiJMBf
	CliAENkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcox-00D0or-0f; Thu, 17 Nov 2022 11:12:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovcm9-00CyZh-8N; Thu, 17 Nov 2022 11:09:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B396B60EAD;
	Thu, 17 Nov 2022 11:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A05C433D6;
	Thu, 17 Nov 2022 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668683384;
	bh=rlMFnUfQu8GJbpUZVcINUpGICn6p1+U5R0s89aqiluY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3x/iGCbNuMvys+UHPYxXfBNEAjRTHTA7o32s2r636M+YBziRU2SonABy/5UU1DnQ
	 3YSZBpbLlV16b0wTYkkbOka0EYaToulvwQQ6YLZf1ROtwkCUY/mYWSKCusjvL5vfl5
	 GtXRdaGwEu5jajg8VLb3TOuqu8rtnFdEm4Xr02tIqPUgI6oDOyw0ISkleOPBWQv1Uh
	 Q4l5z6Y53UO3FFCyK7OG8Af7IuGHk5lPUop3+BjBi3gh4Pw65qxsKsd9Ug2shYBllT
	 zLwERhd4dFhs4bctzw0za1HB8NQRl6Qh5d7eU+rxh+CyqFs4sAk8zNQCSfWflRXOXM
	 +GanqHZNquZlw==
Date: Thu, 17 Nov 2022 11:09:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	David Airlie <airlied@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/tiny: ili9486: Do not assume 8-bit only SPI
 controllers
Message-ID: <Y3YWdeTLfmDh7UyB@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_030945_388140_5BA3E4B7 
X-CRM114-Status: GOOD (  19.97  )
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
Content-Type: multipart/mixed; boundary="===============6034302491925940744=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6034302491925940744==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQcIBCJXd6N58uwP"
Content-Disposition: inline


--LQcIBCJXd6N58uwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 09:47:40AM +0100, Carlo Caione wrote:
> The ILI9486 driver is wrongly assuming that the SPI panel is interfaced
> only with 8-bit SPI controllers and consequently that the pixel data
> passed by the MIPI DBI subsystem are already swapped before being sent
> over SPI using 8 bits-per-word.
>=20
> This is not always true for all the SPI controllers.
>=20
> Make the command function more general to not only support 8-bit only
> SPI controllers and support sending un-swapped data over SPI using 16
> bits-per-word when dealing with pixel data.

I don't understand what the commit log is saying here.  The
meson-spicc driver advertises support for 8 bit words, if the
driver is sending data formatted as a byte stream everything
should be fine.  It may be that there is some optimisation
available from taking advantage of the hardware's ability to
handle larger word sizes but there should be no data corruption
issue.

> +	/*
> +	 * Check whether pixel data bytes needs to be swapped or not
> +	 */
> +	if (*cmd =3D=3D MIPI_DCS_WRITE_MEMORY_START && !mipi->swap_bytes)
> +		bpw =3D 16;
> +

You should check the SPI controller compatibility here.

--LQcIBCJXd6N58uwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2FnQACgkQJNaLcl1U
h9DkAQf/ZO81DRjufOHQCe4TT3YQX0I4BQbc6tjxpvEJsPkgTRL6r1vfxKJOjA6j
gBJqo8B7TdFYzqzWf4hJwieTLgUKdg4pWERfMQ5O/g9bHsc0BwLUTzg6asgynPqk
ZdxyCvC5QTA/b9ZIWdKPRN9com67mNQRrebpkwcRjFQ1alJxlLDi2P+yrsCE+WOj
Q77RLUtE3cVmxP1tFERDaS6TTTxc51nqK/HT0t6x3LURP6nnPdp5o8s2+AU88Vfv
QoJDmpltiUw2lUScF9jTJjc3ATKhvXAY2NuY1xpVOUMfd4noH1MX5L97UPVedrY2
24k3w5zahZP+JTUtK7epT6eO/eckVg==
=opWd
-----END PGP SIGNATURE-----

--LQcIBCJXd6N58uwP--


--===============6034302491925940744==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6034302491925940744==--

