Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D176FC25B0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 11:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfc9tjolGYmqhvJ714Y3yZ9wBTOxXp+N5/hxSkfZ0CM=; b=TDL0PdjBidPeB3cBNi8GhlSuNQ
	he1l8hwgi8NfbIVkC1fHZvhHx26RSRjGknOwFZkrnX6gSdsLHyirzK+zxNOySrnNhhX7O3+SfNAda
	2AliKND3H38xOyk8Tpf+B/En2RVi2+OEkRH9owJH495GS3tHhDV1SeVlb0HGqRwHc0Wn0jBqxjwJL
	w3+pjJncj7XwSZJETxLwTmnUAdTYzjg/3sNQ3Z5vmHW8yrA/328GxjPeo475qp0a0+q/RmoRZYSDx
	cPVUzCUc/pgGumQ7jbTQBTG+FREUQK3ibr3GCfEYtQJSALgfHYI144mQDgo5VipKE/u0jKU9aLLf4
	NqBadYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvDE-001nY6-CS; Tue, 16 Aug 2022 11:58:24 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNvDB-001nX2-Ch; Tue, 16 Aug 2022 11:58:22 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.west.internal (Postfix) with ESMTP id 9EA072B05A10;
	Tue, 16 Aug 2022 07:58:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660651098; x=1660658298; bh=6Jh4QYGMoH
	o8Uic4iv978KBBZgS0XFbP7zpUkCqVKX4=; b=FCrHz4tyUrvT59ofQy8bv49daB
	b9ddhsClYCYaznQxsUbhQCBUVKiiky2iMysH4vDNk6e/iUUqYXKbv8IkDNRaXAIM
	HoxDQS2e2jZ2q5Fnraf/cMcYro+04SDBbA14KFWtOsBHwUqyilR4L/9EDqy6PF4h
	f0oacHQB+zDQc3tsBJIZx2zTRocB4RsdHhchVFcesQqKz8DpAbZxsLcECP1o7mz9
	QFsjVo8VF8a9QvEvR+sVrTSwuyM8V+4I3Asm+F26jbXoYHGOjEAkcflOxALaJ9Ls
	45R78V68i1ecrqap0yNf+VPtI3gUiE+9O5/ozmGhldRUMQ47DnTxTNYNDcrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660651098; x=1660658298; bh=6Jh4QYGMoHo8Uic4iv978KBBZgS0
	XFbP7zpUkCqVKX4=; b=CqM3xPr+nc9UfN/4WjR3csBYhFI33bC+6TTBegRKLKcc
	k1gQyrqVDgN/Utvni23YWLg8U+C05A+hVUFMlE94Pu2IhF5laKmajz9DIlCvw0oQ
	HpLXdEpaYJVQDtdfsk/25eEmkI+jcHsRZoEgfoblF06oTC6wj6uiHchXWbrCFtm9
	GddW4Dfb5eZQ29viAglGOF4HjtErtdM8zwZ5SmNwDlTD/EQq9/Or0K9kwlXhfTEb
	9GGhfL3t6S19YUhq81BnHH+jivbY3fvzeDlWMyN6+99vtQy90UjBjwfU1ZzPqapa
	Yy3B5sxKVpO5lBEtlvfaiNtSu0Hp04SikV1+0pKtzw==
X-ME-Sender: <xms:WIb7Ys_VI-WF_64BjUsMRp6hgkJNR386LYoRDrsWVDOydiVoAknNbQ>
    <xme:WIb7YksfJKc1NBRiYwiqx8p7Zkr1gQrrt8vsxOxYaZh009HDH9a_GVPLE6dABlzAK
    KUmJko9Jc09fVFBFnE>
X-ME-Received: <xmr:WIb7YiANA3mQm-BFej2TzDFNkaWjr0CsDS-wAkZX8QZ6KLwlFArAVjtz68U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WIb7YsfCemL9tFFy8sGs_JIhBOlptgZwVEiwGRrbOFKQCZZTZqPr6w>
    <xmx:WIb7YhN9-5Y4ca-TLP1ARLg_vMZNpontCTAM940_DRUP1V-YhQKdhw>
    <xmx:WIb7Ymnv3YP06kW34I4-5iHoU4P-vrIvnk-oAyXsL2eZiDoQcFJ2nA>
    <xmx:Wob7YsOQ2TYfwUPyuJVNCV4wNBlRMmm2-WxTvl83YbKdwr7UETeCpp9IDaw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:58:15 -0400 (EDT)
Date: Tue, 16 Aug 2022 13:58:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Phil Elwell <phil@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220816115814.gtdymzjsutu4am7z@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
 <8735eeg31e.fsf@intel.com>
 <46871a84-3b17-5474-9608-cfbe7e6f4c7f@suse.de>
MIME-Version: 1.0
In-Reply-To: <46871a84-3b17-5474-9608-cfbe7e6f4c7f@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_045821_524570_F27347BD 
X-CRM114-Status: GOOD (  18.42  )
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
Content-Type: multipart/mixed; boundary="===============6198466983622125715=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6198466983622125715==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="awchg3pjflohp76k"
Content-Disposition: inline


--awchg3pjflohp76k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 02, 2022 at 04:16:29PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 02.08.22 um 15:58 schrieb Jani Nikula:
> > On Fri, 29 Jul 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> > > Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-=
lines
> > > modes in the drivers.
> > >=20
> > > Since those modes are fairly standards, and that we'll need to use th=
em in
> > > more places in the future, let's move the meson definition into the
> > > framework.
> >=20
> > I think you should always expose interfaces, not data. Data is not an
> > interface, and I think this sets a bad example that will be cargo
> > culted.
>=20
> Although I wrote the opposite wrt patch 8, I agree with Jani here when it
> comes to 'official' interfaces. The cases I've seen of exported data
> structures often lead to intransparent code.

Ack. The improvement Geert suggested would involve that change anyway,
so this should be fixed for the next iteration.

Maxime

--awchg3pjflohp76k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvuGVgAKCRDj7w1vZxhR
xS0WAP47XlF53evVNWhich0B1ptAwy/AePOsskAxEmgx3yqrNQD9E0bjZfOAyvz/
e3gbsh9/yRHjOZuY9N1BqkC04K6VFQE=
=ezHC
-----END PGP SIGNATURE-----

--awchg3pjflohp76k--


--===============6198466983622125715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6198466983622125715==--

