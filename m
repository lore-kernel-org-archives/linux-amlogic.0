Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DF5C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qPoi3e8hqkztSd64e9iKt+X39i8CPeI5TzmOyL5sYM=; b=oADyV263e32jra9CKPV6AgjoWK
	K++HebF9oW5mOwrdHYfKTPYJnjS+1Ip6Zt5kV/UVJ2jqstaBQq9M7tizInDLPP1EhMdN0Yq+w5+/u
	MsN0liVGVzL46Go0QO+qSKHhZ8THUHBUERa8doT6lysORM/SRUFY8xCbH1/NgHS2qM+HZ0sVFgayy
	4XB2etZWETcygrJeWUjlnIByhzuy6OvLV14PkDfCWYcjcNXlvigtE0mcDFL2eDS2VS79sJsNC+hZw
	aPAAwGrWtA7JfPRtM0V55dFAdj8eE1ismpSfjDYKZfTa7CV8IDL8VJybHGTgnRtX25ncfFc2YN7gm
	N3vDT4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZwm2-002jDO-C1; Thu, 31 Mar 2022 15:31:46 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZwly-002jAb-I8; Thu, 31 Mar 2022 15:31:44 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AD7D5C01D1;
 Thu, 31 Mar 2022 11:31:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 31 Mar 2022 11:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=H69zcspglzceS1cVwdKFLct5oM6OAoqVhyVU52
 9lGKw=; b=isvk9oun3xx8tu3eJQVXeOINnwtOlaciGO5dO/VyxXo3DPN9jyM2B2
 GjLUcbHE1eqnPMjf4LJqk/bidYJibzTXu7J6cw6w2zSRiO66iRP6l3Rp2cTqjCrH
 Y8nlkM20zeFzyZDHjN72hesMZL5JoCCEvum6nhb0PdPowFOYSP6PsFbZJTIWf328
 NDCD5pJAQt9XyQUTL+QZEUOqwOuxZb8tishbIFdU+YDD6k8cZgRYUECmU7imsqrW
 p39hmjNsBTsIZXvsf7oNeBNyixNUsGOPAug3Qsk4lEVyV+n1yObQ8SJz3UaRZSHT
 2xeKYsfWNgeoCBHhooAB7YfLLWLQjjbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=H69zcspglzceS1cVw
 dKFLct5oM6OAoqVhyVU529lGKw=; b=M6RkpN8s58vhj2n1K1oprt5IaABjAWfLn
 Lu/UFxucBtOBzoxyYTX0sDjZ3NcDDNV6MAvyATUDGSegM7HzF2e9S3avjJK4Wk12
 9YPYaRdwOtgKGG0f8Caa1yQQjgldPtHr2zrVMFrFjBTu5m6StzHwtKvmWOWTCZn5
 /ANDPUohXDU7Zp8LcsUaif/lxKBYTgcJ6WI8GXfQ+a03TVuPAZZAwX/DPDCptv8a
 3JijgNY94eZsV1cd1tUg0dKz18wX1pcyHdH9FpLSaTgB+5Mkrcm7ZGOQFT8dlFAI
 qYQrwA0GFV4BBiMwRSBXUFp3quOFikV/MmrajV/1mVAsUxi3lGtxQ==
X-ME-Sender: <xms:WclFYoWlFcEjb8w7Z0JpiHFsI8uZwOERozhLeI1f30PwovkHWYDZDA>
 <xme:WclFYskTf91eCCwH8XOZ5khh_bs7T8Rez7eiX89cqaq0qnSyPlU8DDkJd8k8d_FV6
 bEAqyNnDlIGZ-dalJs>
X-ME-Received: <xmr:WclFYsZajv11ExEXP7zhWHCMiN9BCMgqxOpczLTMBeKaxfCGnvIGCIxpASyWjKtvQAqlapphS3BEmhBtESqNfz0TcNu7WCIgorsv2Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WclFYnX2lYIHqYKBdvJpNMpsTajvvZK7LpbUkKb5481D3faRPMAaHQ>
 <xmx:WclFYinSZjvusPjQA_J2-fMcugwd1dgk5MDRoKhU0tAZ8uDpmOFcFg>
 <xmx:WclFYsftSnjeeK1CYMtPRUE3DbaPNjAdxFo7eS9X9PqIMtqp7fQOAA>
 <xmx:W8lFYs6AQRc8lRlWYLoGk56LPY5LPd42KWtLhyLHUntf1ZVnt_mExg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 11:31:36 -0400 (EDT)
Date: Thu, 31 Mar 2022 17:31:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Tony Lindgren <tony@atomide.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
Message-ID: <20220331153134.h3alp24hzquajkly@houat>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat>
 <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat>
 <YkXCGlrok0niwlyg@atomide.com>
MIME-Version: 1.0
In-Reply-To: <YkXCGlrok0niwlyg@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_083142_713858_380FA1D5 
X-CRM114-Status: GOOD (  23.87  )
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
Content-Type: multipart/mixed; boundary="===============8323945475479671168=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8323945475479671168==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z4mxn2vo45xyajfv"
Content-Disposition: inline


--z4mxn2vo45xyajfv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > It seems the dts assigned-clock-parents no longer works now?
> >=20
> > That would make some kind of sense, __set_clk_parents calls clk_put on
> > both the assigned clock and its parent.
> >=20
> > Could you see what parent (and why?) it tries to enforce then?
>=20
> It picks the other option available for the mux clock that only has
> two options. No idea why, but if you have some debug patch in mind I
> can give it a try.
>=20
> > It looks like the gpt1_fck driver might favor another parent for that
> > rate, which, if it's an invalid configuration, shouldn't really happen?
>=20
> Hmm there's a gate clock and a mux clock, there's not really a rate
> selection available here for the sources.

If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
doing the heavy lifting, could you run your test with

-- >8 --

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 91f863b7a824..c2ab1be62f96 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -552,6 +552,12 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	unsigned long best =3D 0;
 	struct clk_rate_request parent_req =3D *req;

+	pr_crit("%s: requested rate %lu\n", __func__, req->rate);
+
+	parent =3D core->parent;
+	pr_crit("%s: current parent %s\n", __func__, parent->name);
+	pr_crit("%s: current parent rate %lu\n", __func__, clk_core_get_rate_nolo=
ck(parent));
+
 	/* if NO_REPARENT flag set, pass through to current parent */
 	if (core->flags & CLK_SET_RATE_NO_REPARENT) {
 		parent =3D core->parent;
@@ -578,6 +584,11 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 		if (!parent)
 			continue;

+		pr_crit("%s: Trying parent %s (%lu)\n",
+			__func__,
+			parent->name,
+			clk_core_get_rate_nolock(parent));
+
 		if (core->flags & CLK_SET_RATE_PARENT) {
 			parent_req =3D *req;
 			ret =3D __clk_determine_rate(parent->hw, &parent_req);
@@ -603,6 +614,11 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 	req->best_parent_rate =3D best;
 	req->rate =3D best;

+	pr_crit("%s: Best parent %s (%lu)\n",
+		__func__,
+		best_parent->name,
+		best);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
@@ -2201,8 +2217,12 @@ static int clk_core_set_rate_nolock(struct clk_core =
*core,
 	if (!core)
 		return 0;

+	pr_crit("%s: rate %lu\n", __func__, req_rate);
+
 	rate =3D clk_core_req_round_rate_nolock(core, req_rate);

+	pr_crit("%s: rounded rate %lu\n", __func__, req_rate);
+
 	/* bail early if nothing to do */
 	if (rate =3D=3D clk_core_get_rate_nolock(core))
 		return 0;
@@ -2367,6 +2387,8 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 		goto out;
 	}

+	pr_crit("%s: core req rate %lu\n", __func__, clk->core->req_rate);
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
@@ -2385,6 +2407,9 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 *   this corner case when determining the rate
 	 */
 	rate =3D clamp(clk->core->req_rate, min, max);
+
+	pr_crit("%s: clamped rate %lu\n", __func__, rate);
+
 	ret =3D clk_core_set_rate_nolock(clk->core, rate);
 	if (ret) {
 		/* rollback the changes */

-- >8 --

Thanks!
Maxime

--z4mxn2vo45xyajfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkXJVgAKCRDj7w1vZxhR
xdqnAQDirrptanVmylHQEVFZFVzQKa8JhZUcWB4BlXxx+N73dQD/SnfWqCS+ZkXX
HssIdrqzcr5LP0dnoNgDCIjJjktuvw4=
=jZiI
-----END PGP SIGNATURE-----

--z4mxn2vo45xyajfv--


--===============8323945475479671168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8323945475479671168==--

