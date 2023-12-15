Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37971C46CA2
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Dec 2023 15:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLeGg1RfRDtNFpAV0kcvGCrI7SRaHY7PtMM9064TSp4=; b=OfxWHc/QiakAUZo2rffXKa2JeN
	qof2Wn+RSGMn6i0Q9uWQ85Kl+mUM/zh0OTa/E1n8wSwPbPYSboCUxsQ7zMoGGq5ZOoHP2xukswS0S
	mc+/iwY0QvhnjmccSFWhqS376BDlhHWVbcpP5q0foRnh8m/E3YtrHv75Vl4yweFo4i4v+s66pkn93
	uMCrRzM2P4fBzjnQI09OrPrDpOsnXXlkdHVp93Q7Rx7aLu7fOiBHzssz3941ifGuWx43ljzbBPCAk
	addf1COSmYFNkO2p8A4zASzvglu4ByaU7XmcUhnp5/Ev2SbNy4l5F23fDkSbEhmk5SQ3H3JPh+fzj
	fcx3DuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9vT-003hOi-12;
	Fri, 15 Dec 2023 15:16:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9vP-003hMT-2o
	for linux-amlogic@lists.infradead.org;
	Fri, 15 Dec 2023 15:16:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE9up-0002dd-7g; Fri, 15 Dec 2023 16:15:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE9um-00G3bn-Ay; Fri, 15 Dec 2023 16:15:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rE9um-003ekE-0W; Fri, 15 Dec 2023 16:15:48 +0100
Date: Fri, 15 Dec 2023 16:15:47 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
	linux-sunxi@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-pm@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@pengutronix.de, Johan Hovold <johan+linaro@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>, Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Message-ID: <20231215151547.y23fgs6hskng5izg@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
 <20231213110829.bjaxjjiyy4ug7o67@pengutronix.de>
 <6wnsxbi27xdxjtaqaaaq5wtwwilp4jfw4mg5y2ctdl7xrs44ry@ns6y36pf7hge>
 <20231213155252.eq6cdzk2vuwllzdu@pengutronix.de>
 <nsa54fwu4ewmcaehesuqefoo5r7z3tuvj76hjb4ngtkaygxwxx@h73ihjon5gby>
MIME-Version: 1.0
In-Reply-To: <nsa54fwu4ewmcaehesuqefoo5r7z3tuvj76hjb4ngtkaygxwxx@h73ihjon5gby>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_071628_066743_7459753B 
X-CRM114-Status: GOOD (  53.56  )
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
Content-Type: multipart/mixed; boundary="===============2426138551284618029=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2426138551284618029==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2dztccxgltw7uqlb"
Content-Disposition: inline


--2dztccxgltw7uqlb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Dec 15, 2023 at 01:34:26PM +0100, Maxime Ripard wrote:
> On Wed, Dec 13, 2023 at 04:52:52PM +0100, Uwe Kleine-K=F6nig wrote:
> > On Wed, Dec 13, 2023 at 12:54:14PM +0100, Maxime Ripard wrote:
> > > On Wed, Dec 13, 2023 at 12:08:29PM +0100, Uwe Kleine-K=F6nig wrote:
> > > > On Wed, Dec 13, 2023 at 09:36:49AM +0100, Maxime Ripard wrote:
> > > > > On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-K=F6nig wrot=
e:
> > > > > > On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
> > > > > > > On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-K=F6nig =
wrote:
> > > > > > > > clk_rate_exclusive_get() returns zero unconditionally. Most=
 users "know"
> > > > > > > > that and don't check the return value. This series fixes th=
e four users
> > > > > > > > that do error checking on the returned value and then makes=
 function
> > > > > > > > return void.
> > > > > > > >=20
> > > > > > > > Given that the changes to the drivers are simple and so mer=
ge conflicts
> > > > > > > > (if any) should be easy to handle, I suggest to merge this =
complete
> > > > > > > > series via the clk tree.
> > > > > > >=20
> > > > > > > I don't think it's the right way to go about it.
> > > > > > >=20
> > > > > > > clk_rate_exclusive_get() should be expected to fail. For exam=
ple if
> > > > > > > there's another user getting an exclusive rate on the same cl=
ock.
> > > > > > >=20
> > > > > > > If we're not checking for it right now, then it should probab=
ly be
> > > > > > > fixed, but the callers checking for the error are right to do=
 so if they
> > > > > > > rely on an exclusive rate. It's the ones that don't that shou=
ld be
> > > > > > > modified.
> > > > > >=20
> > > > > > If some other consumer has already "locked" a clock that I call
> > > > > > clk_rate_exclusive_get() for, this isn't an error. In my bubble=
 I call
> > > > > > this function because I don't want the rate to change e.g. beca=
use I
> > > > > > setup some registers in the consuming device to provide a fixed=
 UART
> > > > > > baud rate or i2c bus frequency (and that works as expected).
> > > > >=20
> > > > > [a long text of mostly right things (Uwe's interpretation) that a=
re
> > > > > however totally unrelated to the patches under discussion.]
> > >=20
> > > I'm glad you consider it "mostly" right.
> >=20
> > there was no offense intended. I didn't agree to all points, but didn't
> > think it was helpful to discuss that given that I considered them
> > orthogonal to my suggested modifications.
> > =20
> > > > The clk API works with and without my patches in exactly the same w=
ay.
> > > > It just makes more explicit that clk_rate_exclusive_get() cannot fa=
il
> > > > today and removes the error handling from consumers that is never u=
sed.
> > >=20
> > > Not really, no.
> >=20
> > What exactly do you oppose here? Both of my sentences are correct?!
>=20
> That the API works in the exact same way.

Yeah ok, if you call clk_rate_exclusive_get() and want to check the
return code you always got 0 before and now you get a compiler error. So
there is a difference. What I meant is: Calling clk_rate_exclusive_get()
with my patches has the exact same effects as before (apart from setting
the register used to transport the return value to zero).
=20
> > > Can you fail to get the exclusivity? Yes. On a theoretical basis, you
> > > can, and the function was explicitly documented as such.
> >=20
> > Sure, you could modify the clk internals such that
> > clk_rate_exclusive_get() needs to allocate memory. Or that it fails if
> > another consumer already has called it. At least the latter is a change
> > in semantics that requires to review (and maybe fix) all users. Also
> > note that calling clk_rate_exclusive_get() essentially locks all parent
> > clocks up to the root clock. So if clk_rate_exclusive_get() fails in the
> > presence of another locker, you can only have one locker per clock
> > hierarchy because it's impossible that both grab the lock on the root
> > clock.
>=20
> We're not discussing the same thing. You're talking about from a
> technical point of view, I'm talking about it from an abstraction point
> of view.

In your abstract argumentation clk_rate_exclusive_get() has a
different and stronger semantic than it has today. This stronger
semantic indeed will make this function not succeed in every case. It
should return an error indication and users should check it.

But as your clk_rate_exclusive_get() is a different function than
today's clk_rate_exclusive_get(), I still think our argument isn't
helpful. I want to do something with apples and you're arguing against
that by only talking about oranges.

> Let's use another example: kmalloc cannot fail.

Oh really?

=2E.. [a few greps later] ...

While the memory allocation stuff is sufficiently complex that I don't
claim to have grokked it, I think it can (and should) fail. Either I
missed something, or I just burned some more time to convince myself
that kmalloc is just another orange :-\

> Are we going to remove every possible check for a null pointer in the
> kernel?

If you were right with your claim that kmalloc() cannot fail, we should
IMHO consider that. Or maybe better make it robust (in the sense that a
caller of kmalloc() can indeed use the memory returned by it) which
enforces that it might fail at times as even on big machines there is
only a finite amount of memory.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2dztccxgltw7uqlb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV8baIACgkQj4D7WH0S
/k574Af+N2CJpUlfOzeu0Ie59AWgqwUJO8RgmZG7ynlUPdOq+yqygCn7OuG54h66
klHRjMgofoNzO9F7Yikj18FMsGWtxtpS2bcDkeSA2NATIYBdPFH7PhSqmKmvCVPW
2GpNaqjaV7OMKEXnwzW5oexC2jYFKefUv1qhDk2WXnga1x19Tz+kZqcH8JQWaCz1
wAxb5L/CsAtZh5MMsSbz/vMXXy/qwzprpsBsU1cfMZLYH9qUtyavOy5CNaBhZow1
U5EH5dzuzN0srHzapLG9kKOnZpXRljVjhe2f4mCmC953cX1iO9ikjuGbcojvPFkK
9lfT1JY71pcZtjZOSYsvGZ/9IYU3hg==
=vfQ4
-----END PGP SIGNATURE-----

--2dztccxgltw7uqlb--


--===============2426138551284618029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2426138551284618029==--

