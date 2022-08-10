Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C4EC00140
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhMNMa4A17uIKrfm8jv99UUfteW8Jaldz2EyqVR1+QI=; b=p9m+7mpyFktEedc1+exOzDvajk
	05EqgriA9+Cnlin5MR/8N0wvuSDsUz4GeTxzgwvlwmYkvttjS3ws6clT2k50u2nUQHgmlPJk6xf7R
	wwC2fDPQibx73pOkYN2XjZbEws+yISPY1l20DNQ4Gf36ugIoioaKVMJmgpEXyyh5galo0jLDynpfs
	PetyKNkYkfg0LDgQGM1d6U2C8zm5J9z9B+zVMjhp1ubnzzENzXn/JRgqgu/c3sk4VCkk8HHY4TtHR
	A0Yids0Pr5UY/ebhpfNcSeZgqxirP5Yfh8VG9cbklq9zTQqlu+6OYSoy4N1qULwFk9ZwOnXJY14Ub
	UkegM5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLkyE-00Bo8I-2j; Wed, 10 Aug 2022 12:37:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLkyB-00Bo79-NP; Wed, 10 Aug 2022 12:37:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A12161363;
	Wed, 10 Aug 2022 12:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B5C433D6;
	Wed, 10 Aug 2022 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660135073;
	bh=ROHaIZk75ZgJisF7nTMLDJS9o0AxLi1V/y+T67/KwWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qg7V+bjI7lf3dzSN62yYr9g4pSgwDtQDJWcjI3dRgZRvMIoOD/bbKegaOJMO2MzWN
	 SE+A3aKfjpe80HoF1s2lo5xVS6gIkpmA1DpXIUnW2aHmkkpf3RJ/y8dJotPeQecNET
	 e5qc36Vnk3SFh2ixHl5EoVsn2FhJ3CmaaVXyK9sh5fVsJqfdHGFcit844ItnozYVb6
	 CGZ4Ma5LOKbVbJtmpUwe4+JSb49OOdw677rfq2XdN3V5GeorsO5RJZw/LAVbThEAK4
	 woyx4cJp5ybMTB/NJtCaI8FBAu4HmfiRtObEhNrpbt1GgSGGFejKux81LEpIDva+n8
	 xCEk6z1CseItQ==
Date: Wed, 10 Aug 2022 13:37:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Message-ID: <YvOmnDJA+ov49chC@sirena.org.uk>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
X-Cookie: First pull up, then pull down.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_053755_824429_A09FA8AD 
X-CRM114-Status: GOOD (  19.16  )
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
Content-Type: multipart/mixed; boundary="===============9020771252473592881=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9020771252473592881==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2hd26sDiWQtv5ujx"
Content-Disposition: inline


--2hd26sDiWQtv5ujx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 11:17:14AM +0200, Neil Armstrong wrote:
> On 09/08/2022 17:27, Mark Brown wrote:
> > On Tue, Aug 09, 2022 at 05:20:19PM +0200, Neil Armstrong wrote:

> > When you say the value set by the clock framework does that mean that
> > the clock driver is adjusting hardware inside the SPI controller IP
> > block which is then getting reset by the SPI driver without the SPI
> > driver knowing about it?  That seems like a bad idea as you're finding
> > here.

> The SPI driver is explicitely triggering a reset at the end of each message
> to get back to a clean HW state, but it does reset the content of the "legacy"
> registers containing the power of 2 divider value, the new registers configuring
> the new clock divider path (only on newer SoCs) doesn't get cleared.

Sure, but that doesn't really address the concern - is this something
that the clk driver programmed or is this the driver forgetting to
restore a register that it programmed itself?  The commit message sounds
like the former which is a much bigger problem.

--2hd26sDiWQtv5ujx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzppwACgkQJNaLcl1U
h9CP8Qf/cMQYM72jnQkNExfj6dskX5IIOlwCnAVUEnsbYrFpv3QL6BNLxgKx4eqx
cjDy+gszIhOd4rr7/ayE4siN6fjOo/hWNIuydrrCsRWKrjvKTUInWB16AnVv5NrK
JAjl3RZ9vrkKp2UcN/dsaU11B5Xce59ko2nuniDhKYZhubO9F2uYxOPiBLvufQyU
Q20TDeHIgYaClQvbbnVnIBpjkeOYaZxhkpAjZmw/Btip07mzspkcC4ASnTbTKs2j
cCeDY+xkSNPqT+Pie+GxbV0bOeAjLdUOwP7QoXIsrP4BJRzuoHk/aXWC8GzXo13a
3baxwuQr/bFzHeoJRT+a3zrpms9mLA==
=yOBS
-----END PGP SIGNATURE-----

--2hd26sDiWQtv5ujx--


--===============9020771252473592881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9020771252473592881==--

