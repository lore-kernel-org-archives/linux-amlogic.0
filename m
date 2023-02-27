Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2C5C7EE23
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Feb 2023 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EK1p/nlG0/QIPOcmtyiVkhYITFx/2rnQbFKNCvcjug=; b=RCDfMOlXpCmpof3IRuUVFv5NzE
	MHn+7TapDcbRicV2hnUWV2IFBu9JmUzO5/INREH/OyJhF0iOAYDrrAMSSLZqHTMbr9AQTXZGJ79kR
	W74a2Mx74I9BItNqGRIk/l52En11mkR2RZQTfTrTPaquzF0l8faSEclMXiYHZQDY7/OnNV/Csxce6
	JIzWSMmanu/Af9RA10Y48699u6LWYUtOSVryP7gaCQ3Pg63J3Xxf2N5RNSMmtqCfjTc7yq/0YqkvH
	mWvvZzJBgcvWoFLnuassqZfBvke1n0WX93fobOkqKD4IMv8vu2XI+CWzJz1GLKC7srkUamwAFdWCL
	Sb/p2WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdD4-009gFF-U8; Mon, 27 Feb 2023 13:06:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdCz-009gDF-D1; Mon, 27 Feb 2023 13:06:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 344FF60DFB;
	Mon, 27 Feb 2023 13:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C8FC433D2;
	Mon, 27 Feb 2023 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677503179;
	bh=+TZvd92l9qjnJ46cOT5L9UcQe7CKFe0gXGAYlHM+pn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MBZPUuouC2wHJXTMDns2HmltZ/Am3KtGB6qtPlCrb3/MBdH12QLCyQ124jkJwejTj
	 /9jv3pfgL9kql6Rp3/Mq2/oP7T0TD+IVY2I/dEo4N2srigsxf9hH5lZRHbih9dWDwj
	 bKmH5HuGP7y3RcKuUDughHTcAD0HLkjvOCAa0YLQU63I5krx7OlxqjLjJRKRa5iMW1
	 1WqULk3QoqzkYDvk171oAv6DocJ1wuNnQRljHqnVaZ3QnM0+BZNRt9FqYD6ukaYhF9
	 4YfWL+ENcpjdEgqhggrilecv9D1A/jzeAWs5nQjTAv+W3u/OFvR0OfJHKMWv/o+m+N
	 5kgeZLeLoTRXw==
Date: Mon, 27 Feb 2023 13:06:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>, Heiner Kallweit <hkallweit1@gmail.com>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Arun.Ramadoss@microchip.com,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Jose Abreu <joabreu@synopsys.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Subject: Re: [PATCH net-next v8 5/9] net: phy: add
 genphy_c45_ethtool_get/set_eee() support
Message-ID: <Y/yqwifeQBC3sSaD@sirena.org.uk>
References: <20230211074113.2782508-1-o.rempel@pengutronix.de>
 <20230211074113.2782508-6-o.rempel@pengutronix.de>
 <Y/ufuLJdMcxc6f47@sirena.org.uk>
 <20230227055241.GC8437@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230227055241.GC8437@pengutronix.de>
X-Cookie: On the eighth day, God created FORTRAN.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_050625_559994_B615CDFE 
X-CRM114-Status: GOOD (  17.73  )
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
Content-Type: multipart/mixed; boundary="===============6673271184802428518=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6673271184802428518==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="18YmcFoX2FMeA9qB"
Content-Disposition: inline


--18YmcFoX2FMeA9qB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 27, 2023 at 06:52:41AM +0100, Oleksij Rempel wrote:
> On Sun, Feb 26, 2023 at 06:06:48PM +0000, Mark Brown wrote:

> > Currently mainline is failing to bring up networking on the Libre
> > Computer AML-S905X-CC, with a bisect pointing at this commit,
> > 022c3f87f88 upstream (although I'm not 100% sure I trust the bisect it
> > seems to be in roughly the right place).  I've not dug into what's going
> > on more than running the bisect yet.

> Can you please test following fixes:
> https://lore.kernel.org/all/167715661799.11159.2057121677394149658.git-patchwork-notify@kernel.org/
> https://lore.kernel.org/all/20230225071644.2754893-1-o.rempel@pengutronix.de/

They seem to work, thanks!  I had found and tried the second patch but
it doesn't apply without the first series.  Will those patches be going
to Linus for -rc1?  It's pretty disruptive to a bunch of the test
infrastructure to not be able to NFS boot.

--18YmcFoX2FMeA9qB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP8qsIACgkQJNaLcl1U
h9Bl6Qf+Kb7ZKOT7CiUaam7FNIgjrgALxbl+vEoK4Jd449ZZ8D4wKW/ZCeFYsMtX
jDz4FdBm3yWIycYw0aDgBv+Rx5022ewQlSidOoHLtqJFyn4C8anRLgge2fCwGXRt
87RUPWhKsqyl7wpZaQirbjkkS5e2eJnXYg7qRUIkNYwjO4IGBxdx4Y05qCGI90vD
d5orhnfGEb5O5rf9JpGlz6X6FuoTaNF+QE8PJWaYve86GxFeZ45r2LA2mwO5KXK2
lR9TEJAspu738yEXGCxU4J6pZn/PAH6MdaAL3nz5SonmmQ4xcPZxveXbYEI2amK+
qUGMfJEdqtVeKb0reNsl0z2pPn1Lwg==
=p/hg
-----END PGP SIGNATURE-----

--18YmcFoX2FMeA9qB--


--===============6673271184802428518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6673271184802428518==--

