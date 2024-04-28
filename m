Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789D4C4345F
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Apr 2024 20:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oekJhd52mcaV0q8YZed8WffO51DhuIA+xEj1CM20yXk=; b=hxFtb+h9drjjt66pEVGeouJlVz
	aTiizhV+n7+zhkzyqZTGwq/KWz2GhLSpJw68Ck3x2y4z4KA9/YHA/6d15nj4UtGq+Rx6fBUVicHjl
	6O1AhRUm/+JVT5raccPhMF+hwzgZO96xrqALf1/Di1M5ir57g1h+8AmCVaez5YIAy5ERGgJnmAk6c
	f79wStfdB9Wt52tBj0L6BuasYx4d3rcnpeH+aDxkVQ1Bne8tDJCWbGznzv+q3rrafgKJNxxID5zHt
	EdWQeKJoqGQh5NY7Hjg6LSA637G1eTMOx0IFmdLhIojK8cRVVS0KgT55OSV0qJ6IYGYhvGHY5it44
	RKk+MbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1BYj-00000000h9F-2hGq;
	Sun, 28 Apr 2024 20:55:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1BYe-00000000h7V-1JwV
	for linux-amlogic@lists.infradead.org;
	Sun, 28 Apr 2024 20:55:38 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1BYW-0005hp-Dj; Sun, 28 Apr 2024 22:55:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1BYT-00ErFk-3y; Sun, 28 Apr 2024 22:55:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1BYT-00B0xP-05;
	Sun, 28 Apr 2024 22:55:25 +0200
Date: Sun, 28 Apr 2024 22:55:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: George Stark <gnstark@salutedevices.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, thierry.reding@gmail.com, hkallweit1@gmail.com, 
	linux-pwm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@salutedevices.com
Subject: Re: [PATCH v3 0/3] meson pwm small fixes
Message-ID: <5xyqm5qvidgx5iluewlrctcpmokvwwgwfw3nulow53yydycyi3@edbe7544qsel>
References: <20240425171253.2752877-1-gnstark@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20240425171253.2752877-1-gnstark@salutedevices.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_135536_384313_4ADA1538 
X-CRM114-Status: UNSURE (   9.04  )
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
Content-Type: multipart/mixed; boundary="===============8973594831494623851=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8973594831494623851==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jamwu7skoxjxq2a"
Content-Disposition: inline


--6jamwu7skoxjxq2a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 25, 2024 at 08:12:50PM +0300, George Stark wrote:
> Just some small fixes for meson pwm.

Applied the series to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6jamwu7skoxjxq2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYut7sACgkQj4D7WH0S
/k7Ukgf/beah6hAPqjbTYMo/Qb+qQXf8dkWEnrst2EjJ9QdJ+S5+X3UVU+nFy1QK
hEqkffXS83j7lsQjOd6ULf6p/hN4VA2xOGJGaiZkeTXr+evFWp87S4ZfZJNUCbAx
6QCKgth1K/uH4B185V0r21dRxP2D2d5UuWycbJTEA5MIQBKJjVmIbpnLTq0hs6LN
Ie8MvIhaDcBJSv2y6RTnlwn10vKalSiAcBLhE6QdZ9MM72vE1F1v5aQBZ9VFj98s
d3nfw/7wUi94Z+hdh89DezUgRWdMHHiu1molc4Wn2BuHHcUQKCxcpeQh0aqSS9Tf
qRCgiXwrtQ53EsBTeLZynJZHx3CrYw==
=LWsI
-----END PGP SIGNATURE-----

--6jamwu7skoxjxq2a--


--===============8973594831494623851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8973594831494623851==--

