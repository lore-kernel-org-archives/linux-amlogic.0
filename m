Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A4C00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 14:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=etQ7FiGboSezXUOqs7Mt6TfoQtlEG0asOLw1D1qcPv8=; b=olTny+tctk0wFiNdCcOiM7oV4q
	ieGASnlDnvSWTH7qDtcdagbkY5499YabKAVvoPZMP7OBRDo39oj45dIL4FiYNb41R511PB3XsyDaU
	PlSmshajLayMw468MN04pV9spcNk2wOcnfmAW48ZonBvohEmM+cpWgQREDda+nOTfRVKpqiWEx46U
	ZEJh4tRV3auojiF6oO+kdtOf/6GrsRAKQFsGka/CBDNHG0QS/x2JhvMfIrPegsgneyA82Pc8M0nP+
	oKYqHBg20m5PxkdGCvbPqAPS68WdMXK7h8kECM1UqXZmdS8KmkA/E7NWNOvRfVbUZNTGkqilf2aMu
	SrhlkQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmkh-00CJeu-Pg; Wed, 10 Aug 2022 14:32:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLmkf-00CJdZ-Er; Wed, 10 Aug 2022 14:32:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABA0E614C0;
	Wed, 10 Aug 2022 14:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1488CC433C1;
	Wed, 10 Aug 2022 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660141924;
	bh=XP7o0LqW4ri+tvBAJ6DfVBQ+7ISFbLgZEwquRdB528k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOOqLTx3irxJuXHiFn1x/As+urVyIjJLwJ0kZh7MRjVEOzk1HOrbpCJKqM23T08z/
	 BDVdaEdyq839+KXhhP90/qtIzq1iuFTIVvg07ZVWfcxY05UEaM1zn2bIKyCkQEZZAu
	 axdKHUl4J2Fqx5QAIugZiKPwRedE9UtOKFZJqBGC/V4mvgCU7t2mZdaza21GXzX3zd
	 3SuvUZK+BP59iZ/+aZ0PHppRLHVTFUVqr1URngKnStUvNylmaa/Hu9TgZs8eZA1pvS
	 bENV5m0pSKcrZe4JnxqKSGFplvqaklXdfOOHwlVbOnNcg3u6ow3f2QHZNnBY9CxipE
	 4WNKredHSqT2w==
Date: Wed, 10 Aug 2022 15:31:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Message-ID: <YvPBX7zJ72RXnrpk@sirena.org.uk>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
 <YvOmnDJA+ov49chC@sirena.org.uk>
 <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
X-Cookie: First pull up, then pull down.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_073205_627022_E3FD27CD 
X-CRM114-Status: GOOD (  20.18  )
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
Content-Type: multipart/mixed; boundary="===============4463112744565449615=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4463112744565449615==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WEqUYi41ANWCpin/"
Content-Disposition: inline


--WEqUYi41ANWCpin/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 04:01:33PM +0200, Neil Armstrong wrote:
> On 10/08/2022 14:37, Mark Brown wrote:

> > Sure, but that doesn't really address the concern - is this something
> > that the clk driver programmed or is this the driver forgetting to
> > restore a register that it programmed itself?  The commit message sounds
> > like the former which is a much bigger problem.

> It's what is programmed by the Clock Framework yes, it was designed as-is
> so the Clock Framework takes the most accurate clock path but the reset case
> wasn't taken in account.

This seems like a bad idea, we shouldn't have two different drivers
managing the same register without explicit and visible coordination
with each other, this is at best asking for trouble as you've found
here.  I've not looked in detail but I think if you want to use the
clock framework here then this driver should register a clock provider
for the clock hardware in the IP block.

How does this work with runtime PM, what happens if the clock driver
decides to change something while the device is powered down?

--WEqUYi41ANWCpin/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzwV8ACgkQJNaLcl1U
h9CRwgf+K7WOMvAJpCDDJzGeEDnvO60A4KqWEROJNwU9pzFD/oES6Slzi83SHzvp
lHZWpvuJRnofLap5EVCebAtxNtqVJzX00q+MB25XxtFgLICY+MHghQ6g9+/C3BkV
NuexPyuLn6Q5EAXthFBx/ZKKkg2wDxBtygX5uHpMuFggSpduJ+X5Gm8fu8idcG6o
m+tr8K+ChscFOhMkLy/6yMdXjU8sMt46egyYYhasKbKFT7oSjlMb383OBIp4WVFw
vusuEWjSoy0xK2LmHEOD23/jxjkB2Lr7mtFe5QPkE/L9hGG4pvdU4hqaVAlSQrpZ
aJ/9Oaoi0ApclyH8g3naLiygsa7Amw==
=e05v
-----END PGP SIGNATURE-----

--WEqUYi41ANWCpin/--


--===============4463112744565449615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4463112744565449615==--

