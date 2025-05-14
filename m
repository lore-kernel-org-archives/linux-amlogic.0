Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3EAC3ABD9
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 May 2025 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=eOLCxdWGSUuWCIACFEN+GMVaNnEuM8NxufCVf6KZJ2U=; b=io+
	S62MLTGrF0i1m0wHMgobB3oIj9x9bgn2R4XGxJPBgdQ0L/5txrZh0e//v6p4rai7R6GN2/as91RWW
	BK5GtMb11bvXOVFdxWvfQI/xxqCP05uDj5b6Ih5yl7SH161wVSK9HvNCAmO8I/D56naqcCP4MJsPE
	OlrTYVCvZDmwqRftQxP7K8Vj4cFJeo73r61LS7Ax+vkeUf3AxAqG+kULL9gNEZC/tgOoBoYtwZtUI
	CFDdgcacjjstQsOEJrMMJ7uTkjiiZI7+Yw0bdSuSvtVp+rguQXiKl1jon/42wZrosJI5CQ2v23zY1
	4zXTqdX5zIMWFByz9ZcSkg5dC/ApC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7mu-0000000EYlx-0Pfe;
	Wed, 14 May 2025 08:48:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7F9-0000000ESQS-35nw;
	Wed, 14 May 2025 08:13:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A9844A43E;
	Wed, 14 May 2025 08:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D783FC4CEE9;
	Wed, 14 May 2025 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747210414;
	bh=aa6ErbpQZd4N6d4pHb8YQ7Wyxys8UhTCD0KXQ1FzgV0=;
	h=Date:From:To:Cc:Subject:From;
	b=tSWQHZRO7AzDioSY4aJ9TvpYP//FKh/Lkcg3+HtaEi5WqqK5QWunKrU0/sJI3v6ol
	 4ThBlUK2EzQ35yTI7R6nyjbKJAgqyPkdQzaKK/DGVj/ELh8EqAC/tEgC6WLQ6O1yFW
	 2vUbG32AuFRLCbh/crVq0pYJP505FQDLgT3WxM/T04itLm5kAy9y6+ZXM4C9F6zlJf
	 Gffzx1TDF/kRGAmY4nv0hnFS8Zmnuo9zaY7EhOS0Wpe4rstKvwE1bdG65BtYNlTOKa
	 tY5QVpSdl6dwW3fv/NASU6LsW9qXVhPqGY0g/E/PQxKOwV8S2OxmWHQtZUGS6Z167b
	 agUIzfzVE0jig==
Date: Wed, 14 May 2025 10:13:29 +0200
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Devices not instantiating on Alta
Message-ID: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011335_800154_8ED244F1 
X-CRM114-Status: UNSURE (   8.29  )
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
Content-Type: multipart/mixed; boundary="===============2820135671306492443=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2820135671306492443==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hYqKCfYGFRfWt38h"
Content-Disposition: inline


--hYqKCfYGFRfWt38h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

For the past few days in -next I've been seeing the reset controller and
audio subsystem failing to probe on Alta, I *think* the audio is a knock
on effect of the reset controller.  I didn't spot a smoking gun in the
log:

     https://lava.sirena.org.uk/scheduler/job/1388164#L4875

and unfortunately I didn't manage to get a pluasible bisect for the
issue (trying again at the minute).

Thanks,
Mark

--hYqKCfYGFRfWt38h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgkUKkACgkQJNaLcl1U
h9AWIAf/bF2Kz3KsmH90uJ5oB2AlBj63gaRhqB/XdMGJDeZ5Y0KXIp/YZeE8M9ML
v/ahjfUpi9ZIr47RsOoMMxJsv+/dm4hFJUDeZ/XKkWERkSDVEhI6bf7Zi3uUjJbb
R4ROJTsgqWtBz0QB8jI9JayDn4/mGAta6rRv+rGyb0BJNB4t8xB/6OxZDzCCE2K+
WXq+ptaxbK+fJdfnvAMaYXLM6jgE0kXgi1Qaw/KUWNZinRk82oTmxmP8t3Zdt7kM
cjsXgauvwomKXRIq3yT/CDRMX9/7WUecI4ek9+/g9MY3YxMLOUSh/X7Dq+kjKTkF
UFzhwERrG9QubnQd122zg/EeVI+FDg==
=Hv7B
-----END PGP SIGNATURE-----

--hYqKCfYGFRfWt38h--


--===============2820135671306492443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2820135671306492443==--

