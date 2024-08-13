Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89412C52D7B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 17:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AC7B53gmcPJ3GkHmQhYxVTQvP8BHNGJ0/uMx/s1W1xM=; b=RndC6foPoXZmFugi316NlDj3gW
	TxL9AAcUIRbaLJCIkJmDTzba6MTDsouJtB4R/TOluvHQutuO/LljL9n54vxnPbdQXG2qGw1MaaoL2
	xuDIPuesiYjhZBgSGQK6UsbbNLV+/oLRqTtVyITlFpZF5L8p6ltg2REzDLKVRfNfY6TVpN3mUZA8Q
	QpvZ1Cxv4njoQNl5GrRzAeX1sGoTxcpFT8s/qFWVGoaxXgYEY9js/oVzFT3Jc6LwwoEgn5JOyvNg6
	FMk8KiV8vVSHAuMlz034CJnC51oTbO5QBPlTnwe/fqIZcpAPKTSR+eYKWT6bIBSPQw0tN0psjsy7R
	vmNYSP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduvb-00000004Rx4-3bLk;
	Tue, 13 Aug 2024 17:03:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduvY-00000004RwF-3qmA
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 17:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 362CFCE13A3;
	Tue, 13 Aug 2024 17:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9836AC4AF09;
	Tue, 13 Aug 2024 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723568598;
	bh=zjXhHY/dyo+ZEmSXQqKLQj5vnsg6JIFP0iMe4ldIFIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFSoJQXRBWHFY/t9qO7LZe9yyZD/OwS4UJdsAZo/Kyirre/FEGxZslCtSnnBcef18
	 Z0KkcJtCZZ0L3ddz3rTC3HwpuSxPeALCA0yrI2VqNiXKJXy6Gby4XiWspY5kea2Gt9
	 Ru1oH5UshfYe3fhIpRdDTCquzm0QxRY3i7WahYjenmsRxmZZfpshvSvuwaofIMS/bq
	 qp9RWfN8NV3NsSaCFf3G4tx48myrvttlh5//zYtTSoXi0eTL4ds02aDFnzUvZlTEAw
	 tKEo8Yi8deDA3PuLASXhslYnwTv522lbUGSCS1Y8J8IiA//iCtg5PY7LIpedC8VKlh
	 4ummdmGG7jIUA==
Date: Tue, 13 Aug 2024 18:03:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <1ce67190-0905-4895-af42-13f44b4b638d@sirena.org.uk>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
 <172356023429.57695.4053614993109219592.b4-ty@kernel.org>
 <20240813152243.2H3-mnx5@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20240813152243.2H3-mnx5@linutronix.de>
X-Cookie: Say no, then negotiate.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_100321_165068_4C84B56D 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4644290773664145669=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4644290773664145669==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vlnUGC53pdqRsVmq"
Content-Disposition: inline


--vlnUGC53pdqRsVmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2024 at 05:22:43PM +0200, Sebastian Andrzej Siewior wrote:
> On 2024-08-13 15:43:54 [+0100], Mark Brown wrote:

> > [1/1] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
> >       commit: 5003d0ce5c7da3a02c0aff771f516f99731e7390

> Didn't you already apply v2 of this?

Perhaps?  There's a decent chance my copy of b4 just didn't spot a
difference between the two versions and acked both.

--vlnUGC53pdqRsVmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma7kdAACgkQJNaLcl1U
h9AdDwf/RPJNLc/NcopRgM8Ry8xsd9sWTOlXjL62AnYXLeXm9YANI8w3jGiKg1Iz
UvOL9uVAXVGLOxR/WWODaD5j6n0gfEhvI25Bh+f+zoXMPamj0nB4VtlD22tMUCJH
TmS/9VN4V2ndNXYOD+jBQ84bnzurUPyBRysJC2NAPRyHAGTIaV58rBTXiJfMgKMx
z0FwHxXoZy6g6XgzgCTfaegSSe1q2P0b8Jx3EstoRcS/Zk2oepb3FFWzwId2LjKz
gHiaI5NYH1UP1YyQFAPJV0vjqF0EzhcXB/03k6B9KKCxMdqZtETNppmDUH3YGH6j
I3baEoGjJxxkw51mRhHxsqinYZ/NKA==
=1J0B
-----END PGP SIGNATURE-----

--vlnUGC53pdqRsVmq--


--===============4644290773664145669==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4644290773664145669==--

