Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54671C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s94x/Lm/WTjtc7KWtc0Tcx222Ebm9BDvRV4XgoWWWPg=; b=Luug9A91j6gYm+urdgkwqSX6l0
	49wzZdpBIDi5beS959BCYEhObpiXQiQ3r42/NTYRD9bLYUvF6peLJl6xxKgAQZhvrc00aUZEltMlp
	5Ygxq6wllt6A7gTg1Bgqo8fuqJ2ga6B8ZwQZzb5E4iMKVpFfxIalLB7lZmCxL+tNnu46RblZF6JJU
	+Bp+uFKEU793W4xZP+YikcpcSwdEbCYCvfPNa8Rv370MPakqoHYLGxJ5DeQI0+t8Q8ZTJoYZzr7/g
	UawVXaMSEbGEo4tvCfPGNYAIrFboDOqdp/2NNfWp+YOahERRR+WWgntIsIWko5D980gFmHAVaWjq/
	3MaqKXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Xm-0051HV-KG; Fri, 18 Nov 2022 15:44:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Xj-0051FM-IY; Fri, 18 Nov 2022 15:44:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4C433B8244E;
	Fri, 18 Nov 2022 15:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D62CC433D6;
	Fri, 18 Nov 2022 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668786277;
	bh=lv3Ir6hqjWLfpj3JgMlunLddNrdnY2PDByb5xwuja2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iznHYNViEZbwr2lnpESQWX8uHtsVjn4Jt1zlsrs+3aV5nwHAPVKwwrM/dLos7JdaZ
	 BjH6T8H5sJXbOKtZFK64UqLjW7SOpDP7qu6pAQoBNrsg6JCo5N6/UhCGFGSgSVi6+1
	 ZMwRUL4L4zXNJN21VljHkYflhgMvHvkQvQbUOMCFgTFJalMgr3QhZTMs48NGu6TA03
	 SwlhqVXP4+G0Mafp0OY8RW6cAHytuAnvjQf0CZYWiUpYE5lEDd7QbwfUuYsR2dPCjz
	 WqDDdbEjq4y++xLS2WhjL6xoBIzWHbCxE2GiO4NcjcPpMDFNAGZy7nSzaT7Vg0QR8S
	 5jLXbt5JFCRDQ==
Date: Fri, 18 Nov 2022 15:44:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <carlo@caione.org>
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
Message-ID: <Y3eoYTZRyRJnze1z@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-2-630401cb62d5@baylibre.com>
 <Y3YWdeTLfmDh7UyB@sirena.org.uk>
 <cd2d4d1e-f42a-da5b-e498-fbb32f792094@baylibre.com>
 <Y3ZMT4F3+3bjNXKo@sirena.org.uk>
 <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <e36142ec-6b7f-e667-7d6b-48234318c8cd@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_074439_776060_6FE50F25 
X-CRM114-Status: GOOD (  19.84  )
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
Content-Type: multipart/mixed; boundary="===============3612907037696473760=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3612907037696473760==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="REJnauToDoQdDoiz"
Content-Disposition: inline


--REJnauToDoQdDoiz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 11:36:27AM +0100, Carlo Caione wrote:
> On 17/11/2022 15:59, Mark Brown wrote:

> > So this is an issue in the MIPI DBI code where the interpretation of the
> > buffer passed in depends on both the a caller parameter and the
> > capabilities of the underlying SPI controller, meaning that a driver can
> > suddenly become buggy when used with a new controller?

> The MIPI DBI code is fine, in fact it is doing the correct thing in the
> mipi_dbi_typec3_command() function. The problem is that the ILI9486
> driver is hijacking that function installing its own hook that is wrong.

Ah, I see - it's causing confusion because it peers into the
internals of the underlying code.

> The problem arrives when your controller does support 16-bits, so your
> data is not swapped, but you still put the data on the bus with 8-bit
> transfers.

Why would you need to use 8 bit transfers if the controller
supports 16 bits?

--REJnauToDoQdDoiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN3qGAACgkQJNaLcl1U
h9D2lAf+Ps2YiMRv04FkRIpnqcdeeVJ5f9fygu+kakEWfMNpqzc+qEbwovF9SZp6
gU8YaTS6ipuPAbf5Zv8ziwDe4wgbRcBHnmegTOmSHj451Oc3q0TBvKkganCwxHFd
K1bB0cJYMmmpt4Y4OR+pyLTLoOMxJ3ADQ+yxqAZTGF5llQXxHw0/8UPhGIXLCAn3
0bTaruYqx9EATK199CVVj/oHzU31Ryj+H9pJOie8PoDBPO1eaykOAC5wiJHjU4M6
qgT29nXAt6XJw/gHnWZoKVLP0uJnJJQDEdL9Mp4y5yWoIFIXLTow1Lg+ZyadiLCm
/DtnT4366TwxKlbjqYPYdT28DOAmBA==
=URfB
-----END PGP SIGNATURE-----

--REJnauToDoQdDoiz--


--===============3612907037696473760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3612907037696473760==--

