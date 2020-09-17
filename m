Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C829CC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 12:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64A162087D
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 12:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VPiSncUZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64A162087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hpOgi5vpvyPFw5LyYqaNtasUQxb/2/fFutKHaobFSTw=; b=VPiSncUZAoNVKqCTSnPHodoFb
	TA2j+I4C31fON4LvM+ljg/bzSqZyYfg/S6yFIWZc/G+Pko+q95lDlnyRE4WLxgaTdT8oqN/Uj44li
	124MuJ0/yxPGrbkpvv6cja6+71df9gkRTxCQ76xmXYsEHAl6H0KOBx4vDlua/xTx/3rVHPFpy+ygl
	vmslgL2pIJkyLk05069Oev0R3tIvYcQlpebMeR8/NaIOXIXUeNrGUWTey2WBl7Grp3lvWyOZn6G6N
	+cjiAXtljKaGnlI5OCp3I9D0RVD9jrFibvUeg9BXqsBDl4i5jeQ14bgOgI5KWID0oCZPFUM8a5w8k
	1S2uqp3Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIsdx-0008Ba-6q; Thu, 17 Sep 2020 12:04:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIsdu-0008B0-GZ; Thu, 17 Sep 2020 12:04:03 +0000
Received: from kevin (unknown [IPv6:2607:fea8:55f:a950::68f4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C9FB029AEF5;
 Thu, 17 Sep 2020 13:03:47 +0100 (BST)
Date: Thu, 17 Sep 2020 08:03:37 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
Message-ID: <20200917120337.GA1684@kevin>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
 <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
MIME-Version: 1.0
In-Reply-To: <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_080402_640781_CE02719B 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Will Deacon <will@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============8451867174972718077=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8451867174972718077==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> The DDK blob has the ability to mark only certain areas of memory as
> coherent for performance reasons. For simple things like kmscube I would
> expect that it's basically write-only from the CPU and almost all memory the
> GPU touches isn't touched by the CPU. I.e. coherency isn't helping and the
> coherency traffic is probably expensive. Whether the complexity is worth it
> for "real" content I don't know - it may just be silly benchmarks that
> benefit.

Right, Panfrost userspace specifically assumes GPU reads to be expensive
and treats GPU memory as write-only *except* for a few special cases
(compute-like workloads, glReadPixels, some blits, etc).

The vast majority of the GPU memory - everything used in kmscube - will be
write-only to the CPU and fed directly into the display zero-copy (or
read by the GPU later as a dmabuf).

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9jUJAACgkQ/v5QWgr1
WA2dWg/+OmkKrIz3I3zxUDFk1aW47mEA/JzLjdkrFq+J1K67FPajUIaqzgLjYq1b
wB3a51QSJoN70Aw9O9jrV/GkEbpSf8QWObN4NtZqYcD58fECprh5oXmEfgD0u5gZ
6Gkoijp15utLoOirt2LkEJpYAxrOjfA9n5+WQLn8qQY1QPwO2AjtNxXWlWNhYqvh
CQwDQGoO9FiWNSRPZpx1yHEYP/aDMTW8MqwQ8JsQu2G42TS6ErQUC9OMMZjJ/TYS
GLKA4ybkdSnlNwQH0h+7g6LX0Y3WGUUn1xxbd4P7OPFZapV+87+cQS8sottqH7tS
Rrja9cH4d7/DjKmn1xjT5ftnagxGkzoJ9eYf13DTedymUAQxMGV5TdZhCeUT0HFz
5es9SnkTjOFAQyKZbjiM5t5Sia0eUHLIKUwX6FFKnWxMTtLF4z8XGhizHQrZ8M5I
tQW8f7BzInUEGN5H3FV6spp+P5tL7AkdTEGJ4p87EnoyJfTq2mxWAfTxxN9R01FQ
3yDMyx9bUXif0CNnJjAyTN0WJt17twGKuqAnGu5+oLtK6BXuC5wv9yPyQZ5Zvwgv
HnXnb+s10WYXgdOHRNebUvFnDYsIZTp8/qFXiAdKaHT/r7aL/UKm2XQqwz48O40W
doi8CBItWk7+SxVkj3w5nxnyl9vhu0Md9HkBvGZEH3wfnPGu4/w=
=k8jL
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--


--===============8451867174972718077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8451867174972718077==--

