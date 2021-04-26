Return-Path: <SRS0=Dvvs=JX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565FEC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 11:57:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD2B61027
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Apr 2021 11:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD2B61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=brejfeDB2ZxFK9s9wVXpKVr7MZslvcwtVIY/nfj36+g=; b=RHJ7ZelLY1MIgYQyeulECvQyL
	996P+r8wmUnGmWHoTaBKbBQ0KAt5smOFLm5xDCHN3tXiz0crRPtkaHFstBemAqxr9Uj7+gma7v7St
	0Jmrh4hbTnxrm6F2bmsWPLSkXjl9tjN0ewIkOKsBnkzVvetq4wZIK8CEytPpQE2SVKdphBzaVED7R
	yyoQoBlYRaZahRavkMgXZ4L6zuSXG1sSkLH3siuH+gFk5rV/6acFl70zLFZLAiM0fQD6LK/9ixPyr
	gepcjHd9sAsBdWY5ZoPZlqc5nxt36jPPjtgZ63ek5SqbDYjAsW0wmKwyPcI0n18DwC5IhIaHhrfUX
	XP6ZBk6Kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lazrc-007XsW-3N; Mon, 26 Apr 2021 11:57:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazra-007XsD-L6; Mon, 26 Apr 2021 11:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YAMGLDr484gnwUvmIKxfN/VOkDFd46Y2bk2JtoZTrxs=; b=amLIZN2ZPtE+bOOjZcMT/MNIxN
 1Mjyhp7emsE9bTBkvLg7z7LFdD6enNX0+YpWXuCn+8WynlyiO67K2kt5m845cHFUT398FE5CGjSsA
 E1KwvFYzN9gvh8I10uadr2PEABd3RM/mTgapKxYbTZvoV3ZUnqNu7z+5K/EHkEEbLTfQwKQCR1LRR
 wIQCLz7DeAP9QEvhJhspGN0U33GdlHKsXdsZCirp9tGACzLWVCGtCanUsqHvXTnvrhwJ2HVWTVBKa
 x9vv9COJLYZNarvOrKzB1jIA0NlcXpc3YK1ioATZnF9M7A03OuWrq+ZhpQIDRzbc9bOXF3KcpEsQJ
 h6jZzIpw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lazrY-00FwBF-9l; Mon, 26 Apr 2021 11:57:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C53A60FE6;
 Mon, 26 Apr 2021 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619438234;
 bh=YAMGLDr484gnwUvmIKxfN/VOkDFd46Y2bk2JtoZTrxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jY6inlmBl0DN2ZyWOs3VNzGPVKMDziPXKIzxbKn9SVs/bnRSAbA4RYJAEe+EsgI73
 f1apQg9KsOuPHn9HvDNeOu0EcKrwv5TDmXlXzpcl3xsOhyJJlOSH6bcm+pfHAdh3SL
 C4sC8hDQeVUz8RC6uRgc2AnfDvqudyLeNvG2blpWZnky0iliKU+QKnAgI8VQPJAzes
 9RJ/bH7BmIbweBhqwu1tMEtg8ZQn8ks8Rw8B7hnKlCZGwm2jDgGxlHway26jWxlUBH
 mUjm+KodlrjZXYBGEhPu766CVyTrspDe/y+GXlxt2e47xspeGAPvW7qRxqqw4E0tAa
 dBQYOXiTKueBg==
Date: Mon, 26 Apr 2021 12:56:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Art Nikpal <email2tema@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, jbrunet@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Artem Lapkin <art@khadas.com>, nick@khadas.com,
 Gouwa Wang <gouwa@khadas.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
Message-ID: <20210426115645.GB4590@sirena.org.uk>
References: <20210423034247.992052-1-art@khadas.com>
 <20210423114735.GA5507@sirena.org.uk>
 <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKaHn9+d5crmmG-aKyLuvyxk+A7aC9qqfX_3wuMXm50pg+pZ4w@mail.gmail.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_045716_409060_067BB71F 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: multipart/mixed; boundary="===============6110374476044524328=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6110374476044524328==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline


--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 24, 2021 at 07:57:19AM +0800, Art Nikpal wrote:

> > I would expect the driver to unregister the controller at the start of
> > the remove function, suspend doesn't really make sense here

> It's strange - But without spi_master_suspend i have randomly stucks when i
> try unload this module - as was written before
> i was test it (load/unload module in loop) and for me suspend make sense
> here

> If anybody has another solution - or real problem not here - please write
> to me the right way!

As I said above unregister the controller at the start of the remove
function.

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCGqnwACgkQJNaLcl1U
h9ChAQf6AzAWZAIxaf/Vi1T0miZmDkRpcCYrObYCduQZQzbR83zD+NtVRAQt5Hzd
3TMxWVBMUD6hChyKOe4xA6ZfZQ8jh8s3LPNwTwCnBtrmpNPoovMkjAtB3xcXY0Qw
vFonf9FoPRLLbjf63HL1qv4dHmxARdZZ4ZFS/fMx9670pPz1TlMwyVLzXw3iOycr
9S2Gzap9QFqXP83avoh2cbxEgNRGlmN4OyNPx0fWYkvwx5vpQJ8/TZ4X9mO1Zi/q
S7tS3jJW2UVtxHK3jXXSpqdr67o1+2YCRZwKReT0YPPQI9n689PAa1dmnxAMmoPg
BIADUKIHULSv9i/fb0MGMkpRtdSTuQ==
=kGPv
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--


--===============6110374476044524328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6110374476044524328==--

