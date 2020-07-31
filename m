Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B05DC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 17:42:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DF112083B
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 17:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j0VDKxhK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1Gn+rYBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DF112083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mrbLPMtTJI468JkpVkGFTBLfi4RYnRpb5bKyPBo7WSg=; b=j0VDKxhKoy/A8Uc0rmVcfG0yB
	tLXSkUYsPFAqi6liKy+80uGDPh/KVElVxgrPXSYHusrwM7CMhGX24yHCpCoCnXqW8PRYCojBlGquI
	fPczTNqemYGx0fY6XdpYSKWjuqMyO9QMHmsNlxCr0aft9RFIr4B0S3kfI1SVThCF46LaZCBxmC/et
	BwGHK9L+aI+c5lvBEL9zM2ps+JOODbEEd7MIS8zbHWiwKLdyPWt6dJq4/urWbfYd6rX6MKqTOEyB5
	JyHeLjbmur5ERzff80/FC02kZx0feAxME7szQWxd7V/Nd9boW5UinXZImZnBB4oWRBd42BklDB1WB
	TnKgapr/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Z3C-0007Kq-6q; Fri, 31 Jul 2020 17:42:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Z38-0007Jj-BJ
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 17:42:31 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1620D2083B;
 Fri, 31 Jul 2020 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596217348;
 bh=1RBJrByuU1/4YwH7R7c4LoRXyjsSYMzkPBOWevrI01g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Gn+rYBxy/1RR7v0EzwvHkDTLU3XQqh+OPCnvh/csSGj/3+GWe+7hjTF+3qa4xilB
 Xy7aqJY5CtRnyLrJA6QcmvjxrgpO6op0Q2fVH0eaomPAFXnf0nsDUOQwnblR33tvTc
 CoAEdiePSFluw00g8kTPlbfIHXYbOWeXwcp1X1sk=
Date: Fri, 31 Jul 2020 18:42:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
Message-ID: <20200731174207.GC4510@sirena.org.uk>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
 <20200730185229.GH5055@sirena.org.uk>
 <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Some optional equipment shown.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_134230_460421_3E588036 
X-CRM114-Status: GOOD (  13.72  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============5816597515483379528=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5816597515483379528==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 02:16:43PM +0200, Jerome Brunet wrote:

> One last thing I'd like to understand. Is this behavior of throwing an
> error going to applied to the non-DPCM case as well ? so at least thing
> are consistent between both cases ?

> IOW:
>  * An error is now throw if dpcm_capture is set on the link and the CPU
>  DAI support playback_only

We should definitely complain about that.

>  * on non-DPCM links, will an error be thrown as well if playback_only
>  is not set and the CPU on the link happen to not support capture ?

I think we should move towards not needing to do that for DPCM.

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8kV+8ACgkQJNaLcl1U
h9B67Af+MxqJXiRcEr3b1wsfZYNzZAmN8zNYmZH8ubxUHrcXWUMDl5SAjY/+aEMq
JL+V4yKWh6qgn0fB5NoCNak05vKjZ12E3RpBZu7zN5q620XE3DXC45b+2pv91DCn
FBVrTazkRYfe2IOp2odw47F5Mfnd4x4yfiTuIgGgolmmC8uXeTIZ5TIUGzrPwKoX
aZESOyB5mglx21aMK4JqHah0Lo/fzYIxjdejoAG2yClR11CdHKgPxI6JQA6+/FQr
17Xx+Xd2pd4rhdOIJ91Shgmd5jIyroODzlU3k7PIiNPGeCMP7MlzwUv6ehBOPUGU
n+e6KyufvWAE7FCqi86jv6GQFhguPQ==
=9eeM
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--


--===============5816597515483379528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5816597515483379528==--

