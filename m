Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C432C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jun 2022 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VXQfcYIscvfpyOlB4hFHDAXWHDB+DHZnzYAOQtU3Jzs=; b=K8r4TaEJi0w6Pgo92kI03Lyk7I
	5q+2NvWmWcqO1UbOYxOdH31zWsE2EOtGPBYuHWC6MCON3b5py8+TUxb/DPvLUK3gTMWiWGnODbNFb
	mjVvlRiRBHTCpNHNkXSuIIzXzxGQ+9qRG4LQcz5TBoi9gxZ3CwdZH2rWbp8e1hX0/x0dprA6t87Ah
	YROa0n5+nL3u9626S2ClQH+I06k5B8qCNJJmP3cNsBziElmLF4ys+vBU/au6fBC1GBEbwQqUktgq7
	nxfI7OPj+eB9IUUIL07Fd01UFyRmSxP3Kg/rlEvp7YMd4AUm+DSm4+r0GZQbOjivBFKEk6vIkGiG+
	vZkpSLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyX4T-006wks-C2; Tue, 07 Jun 2022 11:08:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyX4Q-006wjY-LM
	for linux-amlogic@lists.infradead.org; Tue, 07 Jun 2022 11:08:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyX4M-0000Nc-D8; Tue, 07 Jun 2022 13:08:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyX4M-006ySL-DU; Tue, 07 Jun 2022 13:08:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nyX4K-00EkYc-Ai; Tue, 07 Jun 2022 13:08:16 +0200
Date: Tue, 7 Jun 2022 13:08:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Russell King <linux@armlinux.org.uk>, Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Alexandru Ardelean <aardelean@deviqon.com>, kernel@pengutronix.de,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v9 0/4] clk: provide new devm helpers for prepared and
 enabled clocks
Message-ID: <20220607110816.hjacgojgmf2p7xdq@pengutronix.de>
References: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220520075737.758761-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_040822_753431_30B25BBF 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Type: multipart/mixed; boundary="===============2341362131441672082=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2341362131441672082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="khx3ydxphtqwbrvl"
Content-Disposition: inline


--khx3ydxphtqwbrvl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, May 20, 2022 at 09:57:33AM +0200, Uwe Kleine-K=F6nig wrote:
> after Stephen signaled to accept the idea, this is a rework of v8[1] with
> the following changes:
>=20
>  - Drop the follow up conversions. I will resend them individually per
>    subsystem once the preconditions from this v9 are in. I only kept one
>    clk patch that will go in via the clk tree anyhow. I trimmed the Cc:
>    list accordingly.
>=20
>  - (trivially) rebased to v5.18-rc1
>=20
>  - Introduce a new commit that first improves the documention of
>    devm_clk_get() and devm_clk_get_optional() before (mostly)
>    duplicating these for the new functions.
>=20
>  - Make the new functions use a GPL export. (Note the existing functions
>    use a plain export, I didn't change that.)
>=20
>  - Drop a bogus empty line that was cut-n-pasted into several functions.
>=20
> Thanks for feedback by Stephen and Jonathan.
>=20
> @Russell: Stephen wrote in v8: "I'm largely waiting for Russell to ack
> the clk.h change [...]". Would be great if you looked at the series and
> tell us your thoughts.

That didn't happen :-\

> @Stephen: You asked to add the acks from v8. There were however only
> acks for the followup conversions. So no changes here.
> (Andy Shevchenko replied to patch 0, but his Reviewed-by: only affected
> the patch "iio: Make use of devm_clk_get_enabled()".)

Hmm, I somehow expected this series to go into v5.19-rc1, but it didn't
:-\. Is there anything still needed from my side?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--khx3ydxphtqwbrvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKfMZ0ACgkQwfwUeK3K
7AmI7Qf7BpHyH7NQYdAbsyxMDtr5lbVKJvPPCve9JQxjjfil9E/JZWGZ+IHDCfXR
ajjVz+wK22Oby5H4YY7lRqqz7X8bB+lQampjulr/UhdN2jSfVC3HQ7Faregv3ZBb
vahwcrMYutKKsgFN4SzHUvTvfsoaIZVx9MvcmBgoO7nnPlKhuJdbxKWhzHZwwk8F
czMDQh6KUmPMurtPK0R+5dEJNXBGQi+XqYCgTYQhiRaxJ4eGY/Z6gXXq1Y80FYj+
JxkoVOb9rPbT5zWUNL9E8cssKgL4aS725+sRxmwIuYhhoIV66xtkS5xTV5vGr2Gi
4WR8JNY8bELBna5K0ZXi3hie9QQv2A==
=ooR/
-----END PGP SIGNATURE-----

--khx3ydxphtqwbrvl--


--===============2341362131441672082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2341362131441672082==--

