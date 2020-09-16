Return-Path: <SRS0=Xszf=CZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCC9C43461
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:04:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6694D221F0
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2020 17:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQCdD2vA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6694D221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HeLJRR3JbMnl/vFFafvURpQaGh3rQU03lfqec6Upb5Y=; b=MQCdD2vAn+rFr7NJX0IEVp/Qe
	f9e6ok8s8w8NL1bLT5j1wdjIL5uURKPBEM7dpf6xeaEhseJVQ+TVr0d+DMEkPRuuPUJUvyh5LIUEW
	kdXvXNEreAWXGkIki4Hv8Ybk97Mbo+fYEQJCk3+k8iXpAmq3sxQWpw7wH4jd4p7fzWbphty/QvhKx
	u1F7ICUsFrxu1X47n2zRLxyQ8DSinixc6QoURK5+Q8ByUpXkPked2a9s+PPWX2jdGOD9fYOPll2Ht
	IqLECDnHFwmV//uIX2INZV5dWzpgYSnc5rjMCPy9//Q4VXRDLPmyJ1CaPmjm8g5WYr0b7YrZNHxJG
	TAumCUVYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIaqx-0004Rh-Hv; Wed, 16 Sep 2020 17:04:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIaqu-0004Qb-EA; Wed, 16 Sep 2020 17:04:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 981522711D2
Date: Wed, 16 Sep 2020 13:04:09 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
Message-ID: <20200916170409.GA2543@kevin>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_130416_569496_3E98202F 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, iommu@lists.linux-foundation.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============5101372965976559090=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5101372965976559090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> So I get a performance regression with the dma-coherent approach, even if it's
> clearly the cleaner.

That's bizarre -- this should really be the faster of the two.

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl9iRX8ACgkQ/v5QWgr1
WA0Fsg//Qy1ZMY68LHnG0Sv9WWMIPx28MJoZmed9VIQ5jMu951cNntKyVqqUVGJf
GAHSFPbAEPpbocf35MhRwm12dLx4SyomgpwavHF0Lkx9e/XkgCJz5n2yZBNvHikV
UP/R31ETfND5V4oRfLdHodJrNNyVabFk5PsWBVbgefRCxysLK+Pq1uXvsWeY5cUW
Nond4DUoQ48S+AMXUCaLFCjfNcqq3Jt1Juh1x2fW61pGdvCWoPHV9u2niQ3ylTiz
l6v105u/j4SvHALH2eW+mxfxNSBwS2kIkMTZdPzD8bTnh8N3DBokcwRpPw2LSR/O
UNPLxSfiTQVrvj5TX/VXBvK2B8eFph0lCMvtoUSt88WZ5xo+RZBkMZdXkOaXgMdt
eyhPLCXOWkLcyA/qPeElvCmRsJ3vrT1XSrfqZkq3Hx3XAedaFYEw2mXGVWRo8XAI
27zYwkyzvWweUR+QkC8HK4fpiXs8/x+rF/cGT3zfDU0VPpCOPLw8ZII/lGGKNazi
/0pocVSw+1IPg4OCdC26zjP9a1Drc5b5YIeLnnxwtb5+KcowkWG0sa4H5+CZ7zls
E4P2exzZCOeRAeqYZMzUWawGzkUCWKVnoxwYrWyyvbO/0eoreJ3kv50S+754JUOw
tAyaRpfGYLblm2cmC2xpckAtg1HekYaFIIphP1SZIm+iZTYv9+0=
=ZO+i
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--


--===============5101372965976559090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5101372965976559090==--

