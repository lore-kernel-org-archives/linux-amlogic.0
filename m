Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F850C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Dec 2023 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JDxdn5qS39wRqeGoAxxROueTGaBYNE8ccstQ0brvcM=; b=mxSyDAkVQ9KfwtblsQo4Ur5P4l
	xoZlk93aWN/D9djcc2XG/YJ3+54fNdhXzuFBxGr5QISMAyvzDai8pbg5LMXp8K1an2FaGpJjiXWYv
	nA4D/xatYmWa7uZc/11Giij+CngHrgq6PasWFFj24onIICPCPS7tY8nO1/qhiApLT+7rFtoyXxsLH
	UKKFsDm4/Uo2V+hys/EKbpufoGYuo3CUmYxk/U92g3mtyU/qeZbvBXl4UWXMZiXPhHL/Ko42E5l5A
	ummpMpz+5mhfa5S+TL3wrpcOUCI513PKUI+yArky45rkHLcU5w1Kt1FY39jMzFpwiXDTF1svjj7PJ
	KNWDkkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDN7A-00ELtK-1X;
	Wed, 13 Dec 2023 11:09:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDN74-00ELoN-0n
	for linux-amlogic@lists.infradead.org;
	Wed, 13 Dec 2023 11:09:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDN6O-0002aF-Kp; Wed, 13 Dec 2023 12:08:32 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDN6M-00FYCV-Ag; Wed, 13 Dec 2023 12:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rDN6M-002FTL-0C; Wed, 13 Dec 2023 12:08:30 +0100
Date: Wed, 13 Dec 2023 12:08:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>,
	Michael Turquette <mturquette@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-sunxi@lists.linux.dev, kernel@pengutronix.de,
	linux-pm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
MIME-Version: 1.0
In-Reply-To: <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_030914_283561_17C0C13E 
X-CRM114-Status: GOOD (  36.56  )
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
Content-Type: multipart/mixed; boundary="===============2851679371322948042=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2851679371322948042==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kl2l3xgmnlmlkt4p"
Content-Disposition: inline


--kl2l3xgmnlmlkt4p
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Maxime,

On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > clk_rate_exclusive_get() returns zero unconditionally. Most users "=
know"
> > > > that and don't check the return value. This series fixes the four u=
sers
> > > > that do error checking on the returned value and then makes function
> > > > return void.
> > > >=20
> > > > Given that the changes to the drivers are simple and so merge confl=
icts
> > > > (if any) should be easy to handle, I suggest to merge this complete
> > > > series via the clk tree.
> > >=20
> > > I don't think it's the right way to go about it.
> > >=20
> > > clk_rate_exclusive_get() should be expected to fail. For example if
> > > there's another user getting an exclusive rate on the same clock.
> > >=20
> > > If we're not checking for it right now, then it should probably be
> > > fixed, but the callers checking for the error are right to do so if t=
hey
> > > rely on an exclusive rate. It's the ones that don't that should be
> > > modified.
> >=20
> > If some other consumer has already "locked" a clock that I call
> > clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
> > this function because I don't want the rate to change e.g. because I
> > setup some registers in the consuming device to provide a fixed UART
> > baud rate or i2c bus frequency (and that works as expected).
>=20
> [a long text of mostly right things (Uwe's interpretation) that are
> however totally unrelated to the patches under discussion.]

The clk API works with and without my patches in exactly the same way.
It just makes more explicit that clk_rate_exclusive_get() cannot fail
today and removes the error handling from consumers that is never used.

Yes, my series doesn't fix any race conditions that are there without
doubt in some consumers. It also doesn't make the situation any worse.
It also doesn't fix other problems that are orthogonal to the intention
of this patch series (neither makes it any of them any worse).

It's just dead code removal and making sure no new dead code of the same
type is introduced in the future.

Is there anyone working on improving the clk framework regarding how clk
rate exclusivity works? I'd probably not notice, but I guess there is
noone that I need to consider for. And if in the future someone
redesigns how all that works *and* clk_rate_exclusive_get() stays around
*and* that makes it possible that clk_rate_exclusive_get() fails (and
thus breaking all consumers that don't care for the actual clk rate and
only want it to not change), then they'll have to review all users
anyhow and reintroduce error handling. I can live with that and suggest
until then we're happy that we have a few drivers with less dead code
than before.

Cheers!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--kl2l3xgmnlmlkt4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV5kK0ACgkQj4D7WH0S
/k4Eugf/TStPMZiYghA+qeYfwNXsEudTquLXEPqhja/JKNv9WiKYrt43bIE6RaeZ
uqnkw/3MfPy9251IlDl8hjB/hahPAVFA1/FP1n1+q+G4fWTLeEHj8+SErxvfZyrv
QHRLnpLc5OFul0s5WRLBUR6S7Vnu22YiZ0fWFGsakm5CS/BsVxJ/IDsZdss7XBTp
Auy00X3wur3dEdwcVZin6favSPTHv/pLecde0Jh7GsTUmenaP74HE5jWnutVqPRh
D/YfxJz4FVfe8iaFR02v9z7oBlnGuZyCQU9vyebyVNVV6orHYSXgFN8WhdZ1WuBT
RxqsIej1c9x4ergK7wRTHJUz6ZP3Lg==
=b9cr
-----END PGP SIGNATURE-----

--kl2l3xgmnlmlkt4p--


--===============2851679371322948042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2851679371322948042==--

