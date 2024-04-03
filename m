Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C1ACD1297
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkBacYueycYH7PMmpTV8AaCbMc+wBRlZJNVZSsR36h0=; b=hyzitaA4MfERWLwdIlyAtreHSu
	qTYdkEdePr1x5Z5r0tnkcaZlTx8RF5uuZrnaIy5gMoOUSHz5sIATDOhqNCGaHMuwqj7nTeyXRUPVg
	nFNLsux9jOcYW7nT9v0vs0Lv7oGwe83EvTLYfGCQV+ZBGySgYahggE5zn4RC4AeXD2d1iPehMHwbV
	8vX3g6ovGkbTmO5zmKuhJKDaDnD/CPWGNQImF0fobeEBnfSrcoHlpPm+5ynDpGUMuDvpRa5JxKXQD
	WPJSfyS4ilmUEnUKx8qiFd4HDRWBG3vwxtBHUlftg1rBxt+ZWqXxH+OKWsAeHc0Fny1zRQwFeq4qG
	4f16OR8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxMn-0000000FKm2-10HU;
	Wed, 03 Apr 2024 09:57:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxMk-0000000FKkI-2rJf;
	Wed, 03 Apr 2024 09:57:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F117CE211E;
	Wed,  3 Apr 2024 09:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE2BC433C7;
	Wed,  3 Apr 2024 09:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712138227;
	bh=yZYytTinisqpzLNXxsyWEElac0TTqo3wIB7P02Fmsjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H52yBD/o59I6Zxhl+3rrnoywYTWel7t/9YLYSciyj2ErL7IVQC1V5Is0Bbxo/OX+r
	 RUcLBn1uWiu0tNOVCpkvrFtSUwGoNZvBEkILPOC66VaXBj/pM8VA/LQEAVwmGuEqQk
	 TncUvP+kMrwGV1Ef2vM8FTC6QE9yKSVntpaWoMXDW6YDd+Im1mSe+Xy549sCuJOxRJ
	 uSLeyEAS72Z4LesyS+H9p+m59Xi7ui7Jzeup2LyItvxjIRh250MVBEWvRe5mhLrUqn
	 jh10tgLHEx8GNaJCZCY9WURAJ7HV1AmdTD/TDrtCYydX5LRteC+D82AQ+u+oeU428S
	 GXO9o5SFrVfnw==
Date: Wed, 3 Apr 2024 10:56:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Li Zetao <lizetao1@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rob Herring <robh@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Luis de Arquer <luis.dearquer@inertim.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Jaewon Kim <jaewon02.kim@samsung.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 31/34] spi: remove incorrect of_match_ptr annotations
Message-ID: <b4418ac1-10ba-4932-be6e-93282707024f@sirena.org.uk>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-32-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240403080702.3509288-32-arnd@kernel.org>
X-Cookie: Knowledge is power.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_025711_172080_223D6288 
X-CRM114-Status: GOOD (  14.63  )
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
Content-Type: multipart/mixed; boundary="===============4000895655602368852=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4000895655602368852==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+6uAnWE1dyHfAv+S"
Content-Disposition: inline


--+6uAnWE1dyHfAv+S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 03, 2024 at 10:06:49AM +0200, Arnd Bergmann wrote:

> These appear to all be copied from the same original driver, so fix them at the
> same time by removing the unnecessary of_match_ptr() annotation. As far as I
> can tell, all these drivers are only actually used on configurations that
> have CONFIG_OF enabled.

Why are we not fixing of_match_ptr() here, or at least adding the ifdefs
in case someone does end up wanting to run without OF?

Just as a general thing for something like this where the patches aren't
expected to get merged together it makes life much easier to not send as
a series - pulling individual patches out of a series causes issues with
things like b4, especially if you have to apply them to multiple places,
and there's limited benefit.

--+6uAnWE1dyHfAv+S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYNJ+kACgkQJNaLcl1U
h9BrIgf+KtKoHOuMwPZ/0TAaTDSHlNChGQoUvbI8FkIcWUSbFcdmddBluNJsBwf9
vG9Z055MnGBd2N5UEcbqyUYg7FV/Gw5zAnpUf7Uw3hRVNoeKYIBo3YbxjiVdNSPB
QLev8bG5eM480xbTSKBU+/sD0GDux5FXgUVuSlScuOpm3lsfaP4yKmpM728DTVXq
8HW0wQRYPH8UY2HHR9FFNkWBW2kqr765cMEKV71YPNrbCNm3OZSBtRPOZR3TrB2W
AQYdrobav7Rzvkgi/ipXtP7qi0SqyO+EmYrpZ+gYnZeLWM88diZubUXpK706D/jZ
zZRjPxohDdn5nVmaw8mYraHIFXciuQ==
=qYyn
-----END PGP SIGNATURE-----

--+6uAnWE1dyHfAv+S--


--===============4000895655602368852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4000895655602368852==--

