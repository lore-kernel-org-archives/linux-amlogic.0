Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B806C25B07
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Aug 2022 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSaKucNmc3EXdvNg5YIyxL9I+SqfUyZmeaSZowyos7g=; b=h/TYNy5Rkm4k+rts02/SEnXDsY
	ZB9PWTX8jxoyQFXfy7ePI7jGd4YfenvBS0o6mNibn8OJR06rfXJH+vorErhpTshMlkjvvrNJaiX1q
	Ymg9a6RigzT6gOzETbbP9X7xrdumM4ECmOzjdPUdRAgbZoi+WZ4swRdLtQLkBQJjC2lXFJizfAR4/
	VleutPesf7+p4qS+FVSF+cQx/Ge0uP5zBHRlYN5arfK686HR3JgL7dCiFBYSMQm/89t+yQApPTubK
	hVFxIlfZ/yLdSnV8wBtyVvFYcxCEdrM5p/uvUPQkLJnVban6TuCK4TVrQyLl/zRY5Dotmt+k4f+km
	n8jve5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLn1T-00CPRF-1K; Wed, 10 Aug 2022 14:49:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLn1H-00CPOC-SJ; Wed, 10 Aug 2022 14:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F3BBF60B99;
	Wed, 10 Aug 2022 14:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3EBC433C1;
	Wed, 10 Aug 2022 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660142954;
	bh=UlnvNtS2PYfeiyYEh4WcIGFDpJnH7nyR5cNpKi8CjtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zl3CihL+cc0bTGDr0zwQW+ZxtIWVVPKGGYIHssAtI4F8BEqEFW3GZ1QDsy4LiJgcu
	 pQS8pZ44/jCO8laQgoeAB/z0Rl5EMylLq4BZ/7AWSnVo5ICeBOKS/xGvc8rp1tEboK
	 Z3br8a6X6buszDfU6MRpzsjARX/qygAQ5EeiNJMDg9BKS2rKJi80VOTH6ZHln1QxKn
	 N0S5JyJGGqgGO+vda1Ipocy/kKt6qjOq9xCiRAQ+zoL8DfMHrDhXP6hYDqy4O/8t2V
	 NhRF/n2unwqaf1vH5v2ZbjwHvijBzyfi8RZ+gNg/Bnnq5yXt5Cncn5N/OQmAj5376N
	 V+YcEYePjBHaA==
Date: Wed, 10 Aug 2022 15:49:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: Re: [PATCH] spi: meson-spicc: save pow2 datarate between messages
Message-ID: <YvPFZZ2HT2zK9XjQ@sirena.org.uk>
References: <20220809152019.461741-1-narmstrong@baylibre.com>
 <YvJ84qkuXdvVgXRm@sirena.org.uk>
 <39c2f53b-8f53-ceb1-ae0c-81e5e53d01aa@baylibre.com>
 <YvOmnDJA+ov49chC@sirena.org.uk>
 <518f22f4-1582-924c-9eaa-28ebbe53a632@baylibre.com>
 <YvPBX7zJ72RXnrpk@sirena.org.uk>
 <9dabe979-f6b5-329d-f017-a8f0c00adeca@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <9dabe979-f6b5-329d-f017-a8f0c00adeca@baylibre.com>
X-Cookie: First pull up, then pull down.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_074922_168220_A0341A24 
X-CRM114-Status: GOOD (  16.16  )
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
Content-Type: multipart/mixed; boundary="===============5099899325820831787=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5099899325820831787==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ueoh6h2+Qr1KrJd4"
Content-Disposition: inline


--ueoh6h2+Qr1KrJd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 04:40:04PM +0200, Neil Armstrong wrote:

> I don't think it's worth adding so much code for this since we already

I don't recall the code for clock providers being that hard?  They're
generally pretty small, some of the ASoC CODEC drivers did something
similar.

> had an open-coded function which perfectly worked before.

Except in the cases it didn't...

> I'm perfectly OK to remove the CCF driver for the legacy clock path
> and return back to the old open coded calculation since it perfectly
> worked and stop using the legacy clock path for new SoCs since it would
> never be selected anyway...

It does seem better to go the clock provider route TBH.

> ... but GX SoCs are broken so it would need an intermediate fix until
> I push the refactoring to cleanup all this.

I'm trying to figure out if this is actually fixing the problem or just
papering over one case where things happened to go badly.

--ueoh6h2+Qr1KrJd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzxWQACgkQJNaLcl1U
h9DYQQf/QZ4CbFLmTpm/v3VlaF0OZUMbkfJ+OzC3L2yQO8LFvsudGllwYcUAY0ks
Wgk3BuL7xPDkmstAgIoJulYomZKeUgP0vnpIfk6jlfzpdDQhfA/r2z/87nrQtjCw
9TrHXn5w9t6kDa5XIS0bE87+PHTqeuwmPcZJPNbU8faGXyJoegZPGBAb/HBpe4lz
m6fza4Zhx66dnbmQ3r9F5cW85yEeuD95BeW9FfN583uD87bzQAOaIqDJnvbMvDj4
gyu1xiiIw0QhxHLyNZZaMLMoaYWr4869eziFmcqNkwdejET11UqXwrnQusZzzUFs
JoOMpvNMSzkYCQo48Vy6CGJBsXtq8w==
=bPSm
-----END PGP SIGNATURE-----

--ueoh6h2+Qr1KrJd4--


--===============5099899325820831787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5099899325820831787==--

