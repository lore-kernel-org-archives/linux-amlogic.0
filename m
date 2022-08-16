Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7818AC2BB41
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 10:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn3VPvZVAUZaIVBRMnm9NnsYywBwlc+9iMeIZOpma98=; b=iaPMluUjbKm58W0V95Os4GTG9d
	xMpfEB8Sb5s1D8lKPTKalYuBzhVcMwDC+awM3aztfEaE5zBdYZNcJEmyhDhFbfn/IT7bCSYKWiA7Q
	adAjmpffhZGuwRrmdGdBaoMxAWTm0RoOMRG5dGxqJZ/dWk9TfpQtxHYmHbUPUEYL7Ls+paV6nqGUT
	fauqu8vUod/p6gfmQEcI7QvcGVZAuj4sOaiPSAz0xIo1J3gJRiZYsuVm7ngVZ/Cb0QHSEMtgS9+Kt
	IA92l6pGQpT/jBw2UTjOM5JOlKZhXVNvFIZ/QOT1Q6ME2Qf/F7mJMF54SSbQQzkoBubw0r0q9aR4D
	nN+Rfpug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtwD-0018yL-Ex; Tue, 16 Aug 2022 10:36:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNtw8-0018uj-PM; Tue, 16 Aug 2022 10:36:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AE231CE16D9;
	Tue, 16 Aug 2022 10:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61562C433C1;
	Tue, 16 Aug 2022 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660646195;
	bh=iOXSGtGGb7/LTwG0TCouGLbcXIpY5jR5zxVoRU1xG64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lUUOABwqNtfygdSbxVtRwiQcHdpC24YKzgZXj+DWz2eF1D/evnVSS/Hql8X4SdZ4L
	 WQQurTRAs+dB9imN/fIDHYslwtDrMHA/aTWmV+YgQy8OCApUny7L+zJ26fr/xB9NY+
	 BMghYD2aIx7nvS3FuCpENUJPvqy9djR3RCN/sUQqlRr+tw/RFZdWVtAmwngvEPnnJy
	 b7u6tPu0fiawHefOc7mUDgKaohbk7S1fNy5qwX0xIodIgMfgb8z81pEnRtw03EH2VN
	 jK2ekE0Cg1LOSL0u+FvR7jEsvnhly8YoYa9gDopXUFJLo399tuM0DdsIDu1am9P/gb
	 /YaPwx1XnpXSg==
Date: Tue, 16 Aug 2022 11:36:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	dri-devel@lists.freedesktop.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, linux-amlogic@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
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
	linux-hwmon@vger.kernel.org, linux-clk@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Robert Foss <robert.foss@linaro.org>,
	Aswath Govindraju <a-govindraju@ti.com>,
	David Airlie <airlied@linux.ie>, linux-iio@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvtzJw3jmocM0JFi@sirena.org.uk>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
 <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
X-Cookie: A bachelor is an unaltared male.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_033642_753462_899077D2 
X-CRM114-Status: GOOD (  35.28  )
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
Content-Type: multipart/mixed; boundary="===============0530308760062156377=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0530308760062156377==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MVZ75Zz0qn0/IYvJ"
Content-Disposition: inline


--MVZ75Zz0qn0/IYvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2022 at 07:56:06AM +0300, Matti Vaittinen wrote:
> On 8/16/22 01:55, Mark Brown wrote:
> > On Tue, Aug 16, 2022 at 12:17:17AM +0300, Laurent Pinchart wrote:

> > > These devres helpers give
> > > a false sense of security to driver authors and they will end up
> > > introducing problems, the same way that devm_kzalloc() makes it
> > > outrageously easy to crash the kernel by disconnecting a device that is
> > > in use.

> I think this is going a bit "off-topic" but I'd like to understand what is
> behind this statement? From device-writer's perspective - I don't know much
> better alternatives to free up the memory. I don't see how freeing stuff at
> .remove would be any better? As far as I understand - if someone is using
> driver's resources after the device has gone and the driver is detached,
> then there is not much the driver could do to free-up the stuff be it devm
> or not? This sounds like fundamentally different problem (to me).

If a driver has done something like create a file that's accessible to
userspace then that file may be held open by userspace even after the
device goes away, the driver that created the file needs to ensure that
any storage that's used by the file remains allocated until the file is
also freed (typically this is data specific to the file rather than the
full device data).  Similar situations can exist elsewhere, that's just
the common case.  There'll be a deletion callback on whatever other
object causes the problem, the allocation needs to be reference counted
against both the the device and whatever other users there might be.

> > That's a different conversation, and a totally
> > valid one especially when you start looking at things like implementing
> > userspace APIs which need to cope with hardware going away while still
> > visible to userspace.

> This is interesting. It's not easy for me to spot how devm changes things
> here? If we consider some removable device - then I guess also the .remove()
> is ran only after HW has already gone? Yes, devm might make the time window
> when userspace can see hardware that has gone longer but does it bring any
> new problem there? It seems to me devm can make hitting the spot more likely
> - but I don't think it brings completely new issues? (Well, I may be wrong
> here - wouldn't be the first time :])

See above, something can still know the device was there even after it's
gone.

--MVZ75Zz0qn0/IYvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmL7cycACgkQJNaLcl1U
h9CzyQf/bDMqScPGw8MQIW6yZaN+9P25oNyQJTQ0X6hRYgasG5lC1b2j2/0LCuJQ
0Flnz8b/wQI5LbmpExV6c8/Kt/xKopO8No6Af3gUUtkUNPQYHn0CJoB9HDQmSBe+
uVrf5bEH9+GCi7WumAXuvFxT73bF4jt4WVbhNzBAGDD4hnxAF9hpyhSJ9uWS+b2z
f+b77s+ubFb6gbYAqAVnq06cStPvi8aZrAT3UjDUVe3vF8LGQiz7VIdeFA0m0nVl
eQNPvf5a0fCYw0M93B570wvMMPiX1lmfNt6iAWHwq9rKryHWKxB3Ntj5z+5EKDep
0DAfDf7LZH1UUNZzCXclRPka0Fd9kw==
=RD3o
-----END PGP SIGNATURE-----

--MVZ75Zz0qn0/IYvJ--


--===============0530308760062156377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0530308760062156377==--

