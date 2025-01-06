Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00859E77198
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8YWvu6FZn4yb0a9feU1j9EPqLlvvBS21puc/s6gBJRo=; b=0GxFiMop19QGOfY4bQsIQF55rS
	z52dXSecHDKuSibViI37A0mzxcvr+yGo/V07MiGUUVqaXujmvNC6JY66MAa+ziDlW6Oo2IGBlHEzu
	By9Ch008qfxkVRNtdudOmOQZjGq+ewzDXeh6W8zs/8PAwduIMvmuteNPg7hZYBn8tx13dGdCMOgP8
	OPxdImk/e8stNlh9dFnejdJ+IcTRy3Gv2apTaortD2Zg9awYQ6pc3HRnsF8+yGFVmyqTT7lq6Mt87
	QPssoiU4aopg8JY9wQyLOLBojO50eVqORXDVhAJT7JD3phVJkSft1zKlJdq0TdP9M7hv5v5nbyfSQ
	miBuslNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUozA-00000001lBl-009Z;
	Mon, 06 Jan 2025 15:25:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoz6-00000001l9g-434R
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 15:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47AA3A41A11;
	Mon,  6 Jan 2025 15:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523D1C4CED6;
	Mon,  6 Jan 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736177139;
	bh=5MTxjH/SM24JNYUfp0qfCiE1zR7AphxEZdpS37+3+HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmRunV99/VzqhvUq0E6k85NEfOZ38k7bfVmNInDqcBPM9Tk/zDT4HDAbMopIqQSJl
	 zt0X+cXzc3EGbtbDUAj+lmtNQ1zx208IXnS/pfICpOmsZiMLV7FiHvXb+En4t2xlKa
	 z892MKSVGC61234PJ3RSMKG+PyX3/iOc8x7oM+FtajpZO8VYmcPinvr/KDv6dTiwMw
	 mlWW1sFy2VYncsQv09NzQxIgsEY1ld348m7M2kyMEi/vSVd9AEujQfcpPJQmHH23M4
	 sacJ7inTL6Kn+7kgk8Ggae138DlXKIAUALBPldZnZazLQ3Zg+SwpAp+qP6LDwwedfk
	 KUUjsaQGtqi9Q==
Date: Mon, 6 Jan 2025 15:25:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org, linux-amlogic@lists.infradead.org,
	s.nawrocki@samsung.com, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
Message-ID: <8379a6ef-f141-408d-bed2-e34fa3850a65@sirena.org.uk>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
 <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
 <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
 <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jsepw9fl2.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Do not pick the flowers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_072541_071789_F2228FFB 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============7876223181748079460=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7876223181748079460==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gE/NcOytn1JDk3Y"
Content-Disposition: inline


--8gE/NcOytn1JDk3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 06, 2025 at 03:34:01PM +0100, Jerome Brunet wrote:
> On Mon 06 Jan 2025 at 15:28, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> >>  	case SND_SOC_DAPM_POST_PMU:
> >> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
> >> +			sink = path->sink->priv;
> >> +
> >> +			snd_soc_dai_prepare(sink, substream);

> I initially missed it but I think you should do that on the source path
> too

> On Amlogic, the cpu side of the link does not have a .prepare() callback
> but it would be incorrect to do the codec side only if it did.

Yes, symmetry seems sensible.

--8gE/NcOytn1JDk3Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd79e4ACgkQJNaLcl1U
h9AmuAf/UVLGHmvnOThQYVduJMDR1fc714AbpK5gXiZfnzN7JkxU61CGg5mxRt+2
fF/iFIe9sKqfxlTr6EUJTjxTtXrCyzoEJTj61yvkrAK5VI2HqSbUO/Tcx/d8yzHA
/6Y9YdbVnIoBBkouC6CAjvqwNJV5Ss6yKoVg1wQfyScjKD+GIWMxpT1Po0NRb54V
SeLJ4I6dsBliqgrUUL72Jde8g6mMkDIIY+crVH0fCRlRdZZfvHgrDG2uEAAtmSF1
pY4i2Qeleje9/cjtmqWwIjv32FVIFKYu1m65w0Y+oZ0UsfpkrfrzoQQFVKvbOsDr
zTpo4OfnJ/Ih2qgZSnU4RP8MIiXeOA==
=avAq
-----END PGP SIGNATURE-----

--8gE/NcOytn1JDk3Y--


--===============7876223181748079460==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7876223181748079460==--

