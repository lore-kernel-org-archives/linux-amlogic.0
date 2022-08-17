Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44528C25B08
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Aug 2022 11:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2DyN86ycX/CwSgE7FBd0e3cOzL6jbHCGGYIU/4DnY8=; b=lMeo3fYHYpKbiSa/3gM0HbK6s9
	B1DsFZ653H65NICKNHhfQcPQSKZhyLVmtLe+V7h0H8ogdgFXGz6fKjt8SJfAhbpgHfmf1fdDppt4j
	Go2zOaEpAjeac67o268AGZwX9wMldHbmwNBtE1Bt1mJtitjpKGQO5yofZ397I95n0d/oovZLM2ZjP
	sJB2UsL+MgwOKkLqTac3GiDEryiQ7IR4VLpOpYRRwWORkSq2VMCUapalcy5KuA+lCQ/2KRS4/VVxb
	Nks/CBk1A72ffhVthF4xGBelBa4MR4ZVeygyHJxw8bLnIYR+QqcgxelaCXM/uqR4CUUHBL/93TQpV
	VH1VdL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOHV6-001bsI-GO; Wed, 17 Aug 2022 11:46:20 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOHV2-001bkR-HD; Wed, 17 Aug 2022 11:46:18 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 4F1152B06406;
	Wed, 17 Aug 2022 07:46:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 17 Aug 2022 07:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1660736768; x=1660743968; bh=lUH/6UgCMW
	ECcvdrSrFSpz1gNDkIIpOrqzpmSxHmlQo=; b=k5bJNLyLM5pDagUtc7MW21WdhX
	4KEluTlxo34sQoPto6jW4E6lNQBoZ0yX8HtDywj3Y+jjciX3OccGOsX7XklakhZ3
	E2BVN0GZUjcu1zpfvPoazXdLOLZvnPWpUglfEbULcn/QdIm0sKQwCp+yi9t5bxqh
	xBm+BQuqUxKN76PQJgUeuDZr0mg8bTAkp8c4gxohrpleyRMgswENdh3VxsANWsYg
	sPTb5immdvMuzrPFhiHX2WoP+9dHoAR8GBfPXI7Z25hHrac0NE9yTwRTu2H4a26d
	SWGx6eGihA7T6UboSJf9bJ1SsCA/SuVUYWlnl4dtKxGoGI4GeSsRhEHegz7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1660736768; x=1660743968; bh=lUH/6UgCMWECcvdrSrFSpz1gNDkI
	IpOrqzpmSxHmlQo=; b=TtYOmTWfik5H82ZvdUxTfDwW+oad2YxPVtBamul4Akri
	4ZT8EnQAONWpWgTIDBGkANXYyv4YJmmkbHOnTOO03JEPBAezwkDzlJlGHnk5jFrS
	++Mwn3fr98+rpdPxPdbo9abs1GVvwlfNfoIUjv2WDGNXF/aIim02m3xp4D2+6GMV
	P/lkT/dGb9CTKHrM2CKWYoNxK9KC6cby5d3Q9vFbXilAdBnePauBMaCwYiLEqyc+
	6EPl8/IluLiNq7dZCiXvk8qzKzF40S0U5VwGPEhR5HppmQ4Om8eNcPN6MqIJ34S6
	iQgWkKanH7ieDQVfXAlgTx9RbuV3IrWeRJf9meVcXw==
X-ME-Sender: <xms:ANX8YqZ6GCsp05N_ZOQV8TbelC46VbTPDRPRFgTUCaNEe_sH3T1P7A>
    <xme:ANX8YtZ4m6Qe98LxIWD9kWOX84iFwapUQTnv6Xp23u89HAw59nq2G6c8DQdf_fjbE
    0Wd1yfLoG4kozL5HxE>
X-ME-Received: <xmr:ANX8Yk8Pa7VMvsVhma5BRAQffhdG-eEffvVh6MXKIJa7mFWDU9nheWtOpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehiedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedukeevvdehheeuhefhhfefteeiffefgeffuefgkeetffevgeevgeejteei
    gffghfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhn
    ohdrthgvtghh
X-ME-Proxy: <xmx:ANX8YsrqDVLKwjBT9wMSx86sZmqgMbulwVaMD6MccZggHG_aWRoHzw>
    <xmx:ANX8Ylo4Wkvi_p49TeLnj7TZda07cy2MaPONaaY8oLcyi0zmIOFizg>
    <xmx:ANX8YqR26aOF3wmmwnhNwo1XcnVGuYO5zF1kwybHjXXsMqNbESvayw>
    <xmx:ANX8YubfjbQvH87Kp37hyOJ-C5O2pUu9HwQzMfrXg0oCONzbZLXVZa85pGk>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 07:46:07 -0400 (EDT)
Date: Wed, 17 Aug 2022 13:46:05 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
Message-ID: <20220817114605.jpb3tlnoseyvf65d@houat>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
 <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_044616_887858_FABC9209 
X-CRM114-Status: GOOD (  49.39  )
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
Content-Type: multipart/mixed; boundary="===============0757549449693313327=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0757549449693313327==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="czkluqawi3ha2o5u"
Content-Disposition: inline


--czkluqawi3ha2o5u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2022 at 09:35:24PM +0200, Noralf Tr=F8nnes wrote:
> Den 16.08.2022 11.49, skrev Maxime Ripard:
> > On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Tr=F8nnes wrote:
> >> Den 16.08.2022 10.26, skrev Maxime Ripard:
> >>> Hi,
> >>>
> >>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Tr=F8nnes wrote:
> >>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
> >>>>> The TV mode property has been around for a while now to select and =
get the
> >>>>> current TV mode output on an analog TV connector.
> >>>>>
> >>>>> Despite that property name being generic, its content isn't and has=
 been
> >>>>> driver-specific which makes it hard to build any generic behaviour =
on top
> >>>>> of it, both in kernel and user-space.
> >>>>>
> >>>>> Let's create a new bitmask tv norm property, that can contain any o=
f the
> >>>>> analog TV standards currently supported by kernel drivers. Each dri=
ver can
> >>>>> then pass in a bitmask of the modes it supports.
> >>>>>
> >>>>> We'll then be able to phase out the older tv mode property.
> >>>>>
> >>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >>>>>
> >>>>
> >>>> Please also update Documentation/gpu/kms-properties.csv
> >>>>
> >>>> Requirements for adding a new property is found in
> >>>> Documentation/gpu/drm-kms.rst
> >>>
> >>> I knew this was going to be raised at some point, so I'm glad it's th=
at
> >>> early :)
> >>>
> >>> I really don't know what to do there. If we stick by our usual rules,
> >>> then we can't have any of that work merged.
> >>>
> >>> However, I think the status quo is not really satisfactory either.
> >>> Indeed, we have a property, that doesn't follow those requirements
> >>> either, with a driver-specific content, and that stands in the way of
> >>> fixes and further improvements at both the core framework and driver
> >>> levels.
> >>>
> >>> So having that new property still seems like a net improvement at the
> >>> driver, framework and uAPI levels, even if it's not entirely following
> >>> the requirements we have in place.
> >>>
> >>> Even more so since, realistically, those kind of interfaces will never
> >>> get any new development on the user-space side of things, it's
> >>> considered by everyone as legacy.
> >>>
> >>> This also is something we need to support at some point if we want to
> >>> completely deprecate the fbdev drivers and provide decent alternatives
> >>> in KMS.
> >>>
> >>> So yeah, strictly speaking, we would not qualify for our requirements
> >>> there. I still think we have a strong case for an exception though.
> >>
> >> Which requirements would that be? The only one I can see is the
> >> documentation and maybe an IGT test.
> >=20
> > This is the one I had in mind
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-user=
space-requirements
> >=20
>=20
> Oh right, I had forgotten about that one.
>=20
> One benefit of having a userspace implementation is that it increases
> the chance of widespread adoption having a working implementation to
> look at. I don't think the reason tv.mode is not used anywhere (that I
> know of) is because the driver picks the enum values resulting in no
> standard names.

It probably doesn't help, but it's not what I was implying.

> It's a niche thing and way down on the todo list. nouveau and ch7006
> has a tv_norm module parameter which certainly doesn't help in moving
> people/projects over to the DRM property (downstream rpi also has it
> now).

Yeah, the RPi version is part of the reason I started working on this.
We should also consider the named modes used by vc4 and sun4i. All these
ad-hoc solutions are limited and (I think) come from the fact that we
don't have a solution easy enough to use for drivers (and to discover).

nouveau, ch7006, i915 and vc4 are using the tv.mode property for
example, but sun4i and meson don't.

sun4i relies on named modes to reimplement TV modes, but meson doesn't
at all.

And then nouveau has that extra command line parameter to set it up at
boot time.

It doesn't really make much sense to me, when all drivers have very
similar needs, that none of them behave in the same way. And I think the
non-standard property is partly to blame for this, since without some
generic content we can't share code.

This is what this series is about: every driver having similar
capabilities and as trivially as possible.

> mpv[1] is a commandline media player that after a quick look might be a
> candidate for implementing the property without too much effort.

Kodi might be another one. I can try to hack something around, but I'm
really skeptical about whether a PR would be merged or not.

> How do you test the property? I've used modetest but I can only change
> to a tv.mode that matches the current display mode. I can't switch from
> ntsc to pal for instance.

Yep, if you want to change from PAL to NTSC, it will require a new mode.

> I have tried changing mode on rpi-5.15 (which I will switch to for the
> gud gadget), but I always end up with flip timeouts when changing the val=
ue:
>=20
> $ cat /proc/cpuinfo | grep Model
> Model           : Raspberry Pi 4 Model B Rev 1.1
> $ uname -a
> Linux pi4t 5.15.56-v7l+ #1575 SMP Fri Jul 22 20:29:46 BST 2022 armv7l
> GNU/Linux
> $ sudo dmesg -C
> $ modetest -M vc4 -s 45:720x480i -w 45:mode:1
> setting mode 720x480i-29.97Hz on connectors 45, crtc 73
> failed to set gamma: Function not implemented
>=20
> $ dmesg
> $ modetest -M vc4 -s 45:720x480i -w 45:mode:0
> setting mode 720x480i-29.97Hz on connectors 45, crtc 73
> failed to set gamma: Function not implemented
>=20
> $ dmesg
> [   95.193059] [drm:drm_atomic_helper_wait_for_flip_done
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out
> [  105.433112] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  105.433519] [drm:drm_atomic_helper_wait_for_dependencies
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] commit wait timed out
> [  115.673095] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  115.673498] [drm:drm_atomic_helper_wait_for_dependencies
> [drm_kms_helper]] *ERROR* [PLANE:63:plane-1] commit wait timed out
> [  125.913106] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed o=
ut
> [  125.913510] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
> [  136.153411] [drm:drm_atomic_helper_wait_for_flip_done
> [drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out

So I haven't tested with 5.15, but I tested it with this series and it
was working well, both with the compat layer and the new property.

Maxime

--czkluqawi3ha2o5u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvzU/QAKCRDj7w1vZxhR
xS08AP9NeNCOAupd5XSF/H7nXearx83tEnIfYGr1rThuL9TcCAD/QTdia92C4K8J
7zspmuJTy2qJsfCJ88kCd5IetNDNOwU=
=cF9j
-----END PGP SIGNATURE-----

--czkluqawi3ha2o5u--


--===============0757549449693313327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0757549449693313327==--

