Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A188C25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09wmJ55JPc3yEFTcJC/azqfGBJar1ruF957XQ89p+OM=; b=FGsfDsgVZX3/MjGz5eIxG0p77k
	CHhZiRn50Mx/gs3n9RHDfmchvBSMuFLyCTv1POuPZthY+FuoNdtShpTNilgCd8kPPs5/YgEQoF22A
	khRzhjSYhFyg9RhANIhKEks67kfMGqK6aYfFuqxT0jeobZ7tKG53jMnX+xyxyw7Ro659Vi+Xza2Ke
	6k189/nWgKNQCsdKNzDORwA7cyIEf4rXmcIAQ7KHqoYrXwj1c+HAdUo+SIFauysbDWOZdoQNDge7d
	H0BFp/GduTX28y7mToHAM1jkReYZPYhOVvtZ8X/dKUMQUW/bt98IBm4M4fSvCgWKAPLzA1K3FF45i
	9POpI14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNunc-001auV-Sg; Tue, 16 Aug 2022 11:31:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNunY-001aoj-OB; Tue, 16 Aug 2022 11:31:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A4779CE17B9;
	Tue, 16 Aug 2022 11:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9B8C433C1;
	Tue, 16 Aug 2022 11:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660649502;
	bh=DNGxZGCzNE/W9SNa3AOcpRXwEUSzLHawjI4GPUOozEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ibyaO5o/Nr/cFFgJEL7PPVekFs+0Q3USPuDu3QwvW87IXj9cmqYanCsbSmFkhICCI
	 /bS/xCmD23/cb+FBxGnzpVz3kjeVAkO2lYjT75WQKNF5axNhVAwouihZTg6FbLvEAY
	 J4D9uKaJlitqM9D4ZYgx+VikKjvj7peGJBkuhBXKCVwCi46fJVtOhi63JN8hMrZFCH
	 UkfZ0SYPO3LlM1dZqhAEgMC/gX42n3x6mQYJi/OWry/0M9xvDVAnxC5iuOOswm5mZI
	 QOIIYWVpSbd9EF5OhCbydJMADpl7C+bCAHQspCqNHYt9riKK17LZaBtj0TiuX1S5h2
	 kfxfjwbz6D43A==
Date: Tue, 16 Aug 2022 12:31:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Hilman <khilman@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Turq uette <mturquette@baylibre.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Robert Foss <robert.foss@linaro.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	David Airlie <airlied@linux.ie>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvuAE0Y3QbAf9Zh/@sirena.org.uk>
References: <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
 <YvtzJw3jmocM0JFi@sirena.org.uk>
 <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
MIME-Version: 1.0
In-Reply-To: <bb590e14-f99b-5bfb-414b-a45ca77045c2@fi.rohmeurope.com>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_043153_896557_F45D6BB9 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============1622645979597086434=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1622645979597086434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GRi4H55EvexP+ViS"
Content-Disposition: inline


--GRi4H55EvexP+ViS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 11:06:21AM +0000, Vaittinen, Matti wrote:

> I wonder if writing such 'release callbacks' is compulsory? I mean, if I=
=20
> was writing a driver to some new (to me) subsystem and was required to=20
> write an explicit release-callback for a resource - then it'd surely=20
> rang a bell about potentially double freeing stuff with devm. Especially=
=20
> if the doc stated the callback can be called after the driver has been=20
> detached.

Generally yes, thoguh people can and do leave them blank and it's easy
enough to do some cleanup in there that assumes that the device is still
present and not think the device might've gone away especially if the
hardware isn't practically hotpluggable.

--GRi4H55EvexP+ViS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7gBIACgkQJNaLcl1U
h9AzDwf9HyzkouCr6DLxGa2jy+krXW2whkKczGUewYVjLonIovCKJI3OKOOMeqaZ
rggHFUZDlyHpe4f23sQn190TBdngSGLYf1nrOt1WMUf3vCkLA05c7RcsGPCZdlGm
TaL1HglUSxZ6Mce97JyRZ3k3Uw28ImBl0LWx3nunXvOqv6UUjs0cc0NdiGSD3JEA
q7cLUiSYA4BzPVJg8bAXNNgXRdqY08D9aqih79uT+vgmcurosxM9InLGjKWb4xRw
UlVPhgqtHOGKTfgLfNuPG7s+nSv91LUEf43AMjI0HE92IutdyHoYhleNfB5V7kAU
vbqH3vEZToSso212DUSGKfURUbqHBg==
=2bTO
-----END PGP SIGNATURE-----

--GRi4H55EvexP+ViS--


--===============1622645979597086434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1622645979597086434==--

