Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3BDC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwn9PGO9XU0eLXZekVagY0xccUA/q4TXGs+pBz2ULQs=; b=eHA7lAJ4uTwHFDGL4r7bChz3Ws
	gmQbZjqxcbc2GxM7cUem7i7WX7bMxjsykcvuZP3TapipMkpvxbGcpC+2y92qduf6otuI/Gd7FTa7x
	P4WrzhN6Iv0er43DEGS8NtJnub03eD6vO+/rNQL5/wGtpJXYkL7FvnIaRiPAxJND7AVa5fTIiEGMt
	w+yO0dTkEIlbb2T7jWbUqCxF4yUw7E5N35Wdko6JYob/R1ghp6xN/8W/YVZ8agiWJIxPa/uClMnaP
	qNYmgP8i9hnzdeuHd3SmRsSJAMnGBljjpZwJCnmfnrzgapZ7LWEbrwF9Szp87Yuyc+/kiYFhlku+H
	VKQR5SbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTzA-00EsEo-PI; Wed, 30 Mar 2022 08:47:24 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTz6-00EsDy-UK
 for linux-amlogic@lists.infradead.org; Wed, 30 Mar 2022 08:47:23 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 638E63201DA0;
 Wed, 30 Mar 2022 04:47:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 30 Mar 2022 04:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=V/oOQeBOInZ7Oofxs7jwQqcmGenqUxQ6zqWMIQ
 y2L2Q=; b=ksEFAGl0M7saf7/YJB7CEnpcJUCkPDfuFEvi1IGkCfTLwTE3MT6Mwn
 J4tNKSZHfSujzyVyaKqGpRIFeue07+NXQ4+x9Z+qNAqmyugtAEWdVfQ6YSwYAMlA
 JJfD3Tc8XekRQpNFlUFYEaphNVFxgWaKWpD87ilDOQs4G/n6gV6WyQFV3AznfXdf
 wjHheSAHH80fAhBUWfZBfjmqmhwAdq8TivOzZtF3EdwePNKm1m2O0rxw8NUiGbnd
 pRpI/UbYalsdUDn2adRdzALqBUV2uYrwkEW2B94Zm2QgMDHMWSTdT1kl8ovwBeQy
 Ak3oBYoGNmBeAvpJ+ZTortfKS/UfgEmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V/oOQeBOInZ7Oofxs
 7jwQqcmGenqUxQ6zqWMIQy2L2Q=; b=Ue7MRaHeSQRuA4ryjGfXa6ZpJlGVVQqG1
 l4CI7zyOAJZrM7XnhtDY7LsHSBXL2sSLtuj5k4cjdN/tTmjzR5JlsbqS+yVfK/oq
 dID1Wyx2Jn2QA1iFVpKh6vRhGTLNj/ZuzStOjjJgDb8ahp4fg66taNfJ1Ova+o+P
 6uvOdRYXQvBeC/+hhVTcW7UDqn9CRc9qIOwmGKRC8Uia5zj2njme3HDWLaQUAFnq
 GAdpUwzWKqK5EDtoGf1b/WuwotsZBQthkjr1608mmsBtb5hilldQLyuGGoEXBpl6
 FMQeMxOVdG07Hq+5AGIK23wEBVtDteKdXrq7iGn6yNKl1p2VrXUxg==
X-ME-Sender: <xms:ERlEYp65Om2DdH73iAliu_7VehOuxc7wOIxj84D4NeQzJdcslyhSng>
 <xme:ERlEYm4YY66PqVE7gh4m4Z5TWmXJ-g5v9SVJp5YUHzveatkC9j1aqHHlS_NvzvLQf
 aHGRpLx7F7YtSgk84w>
X-ME-Received: <xmr:ERlEYgeT7CjssWOpVPuom68z7fZBVwHIi7CkR_8ocfuGUiyfn08BgGLRWmOQJklet_6NusQeTlfDt7PsCLIhQuiveBX9Wqt7_E17HF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ERlEYiJQKtqlbh1-2gBXJ5ejmpSqOOsGEoNKGumNKlV-cZHgZ527PA>
 <xmx:ERlEYtJunn_q8Jj8a2gx-hAejv-3ZF2twby8kCr8r2hUcydxu3WSog>
 <xmx:ERlEYrx3hHQrl01xLX2PxrKJFtETfIL_vICZs-42yC9qbOrA9pmF2A>
 <xmx:EhlEYrhnPBQOi-grk7vA1YkBcyCVVPFDvVFEgy-6WBhQMo9qLNX-rw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 04:47:12 -0400 (EDT)
Date: Wed, 30 Mar 2022 10:47:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220330084710.3r6b5pjspz5hdmy6@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
MIME-Version: 1.0
In-Reply-To: <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_014722_058055_D68D0422 
X-CRM114-Status: GOOD (  20.87  )
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
Content-Type: multipart/mixed; boundary="===============5407608544896688083=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5407608544896688083==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eo7wiu6i2gufhyuc"
Content-Disposition: inline


--eo7wiu6i2gufhyuc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, Mar 30, 2022 at 10:06:13AM +0200, Marek Szyprowski wrote:
> On 25.03.2022 17:11, Maxime Ripard wrote:
> > While the current code will trigger a new clk_set_rate call whenever the
> > rate boundaries are changed through clk_set_rate_range, this doesn't
> > occur when clk_put() is called.
> >
> > However, this is essentially equivalent since, after clk_put()
> > completes, those boundaries won't be enforced anymore.
> >
> > Let's add a call to clk_set_rate_range in clk_put to make sure those
> > rate boundaries are dropped and the clock drivers can react.
> >
> > Let's also add a few tests to make sure this case is covered.
> >
> > Fixes: c80ac50cbb37 ("clk: Always set the rate on clk_set_range_rate")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> This patch landed recently in linux-next 20220328 as commit 7dabfa2bc480=
=20
> ("clk: Drop the rate range on clk_put()"). Sadly it breaks booting of=20
> the few of my test systems: Samsung ARM 32bit Exynos3250 based Rinato=20
> board and all Amlogic Meson G12B/SM1 based boards (Odroid C4, N2, Khadas=
=20
> VIM3/VIM3l). Rinato hangs always with the following oops:
>=20
> --->8---
>=20
> Kernel panic - not syncing: MCT hangs after writing 4 (offset:0x420)
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.17.0-rc1-00014-g7dabfa2bc480=
=20
> #11551
> Hardware name: Samsung Exynos (Flattened Device Tree)
>  =A0unwind_backtrace from show_stack+0x10/0x14
>  =A0show_stack from dump_stack_lvl+0x58/0x70
>  =A0dump_stack_lvl from panic+0x10c/0x328
>  =A0panic from exynos4_mct_tick_stop+0x0/0x2c
> ---[ end Kernel panic - not syncing: MCT hangs after writing 4=20
> (offset:0x420) ]---
>=20
> --->8---
>=20
> Amlogic boards hang randomly during early userspace init, usually just=20
> after loading the driver modules.
>=20
> Reverting $subject on top of linux-next fixes all those problems.
>=20
> I will try to analyze it a bit more and if possible provide some more=20
> useful/meaning full logs later.

I'm not sure what could go wrong there, but if you can figure out the
clock, if it tries to set a new rate and what rate it is, it would be
awesome :)

Maxime

--eo7wiu6i2gufhyuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQZDgAKCRDj7w1vZxhR
xcYBAP4h1E7t9klWCri6QEVyzOZMNpqFpFASqB9Cc492Lr7shgEA0jENd/w5eB/h
orlbRXRjxMHRoQZlqsNoJGwFAJqaow4=
=VsvF
-----END PGP SIGNATURE-----

--eo7wiu6i2gufhyuc--


--===============5407608544896688083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5407608544896688083==--

