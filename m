Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66CFEC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Nov 2021 08:49:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29903611C1
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Nov 2021 08:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29903611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpcjmjCn083xO8VqCJApXv6jDWO7ZwvIPYCHJBIeEe4=; b=EZwzpZ0Ths9clVAWZgXIhIv5As
	zlPD9Hdd787ut8RWL3kfPMnApGYweVGHCJ9sliZYScwSAuBBHODEbH8mdCUD6PR5SWqgftKHxp/ur
	xBVvN/+J8N+RtUWuqvyndHIVpvuAasMrheYYxM7nki334Vrm5Eb1cLhayEtkTREMk36rnmB2ImxDy
	fuGuLDaFlxttY0s/Wm+7cVKqKx6FiYG/cFT9oOLH00hJqkKp2ooV5XJkDyMuw1JkEZl4Rua2s/B7t
	rPspNuHm8LZpkpxKVOKImmGgj0LkhFb4+TSmxMudnT3xxjmVS5McFvzVk0mEeh9HcVg7pyOQ4WSYK
	7x4EH/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miYQZ-008MO6-8J; Thu, 04 Nov 2021 08:48:55 +0000
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miYQX-008MLv-21; Thu, 04 Nov 2021 08:48:54 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D585580876;
 Thu,  4 Nov 2021 04:48:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 04 Nov 2021 04:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=trsPLTuX5eN1+6357zkP5w+4wv/
 ep/5Bf7nUaNCCfvk=; b=N6qNGXwP4tfhBg/RWUGBNA1sWDjOx7qLK/hiogyEOQv
 Jj1b+xa3+cboDAo7kVwCYkf3pyYcnPo+VEeZJRtjLBNiqQ+TGV53dj5uqoYgTbOO
 o1x17aLxL2gPcbxCkkf+ffuY+3GXKZwDiJK9NSzcnHhJdmrDCBD4cxq9DO6pVdZM
 EAg76+zQ4ysijBUxJNowIojZ7HmrxIpedGACWqdBXfiieZSZK6Sbyk6EnHhcNjDK
 I149cd67WwCrX6OCnf4oYORCa2lJGOueYeQB5o6/it1nXWTi0s/7lHJYZbaOnQEl
 fyhIYUE+PMxiBkdVpv2YihTmCKgwkwD5x1SJv1mSDLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=trsPLT
 uX5eN1+6357zkP5w+4wv/ep/5Bf7nUaNCCfvk=; b=ECmjANenJrnyee/dKXXG1k
 rFFMtu6U9KJ/jnEqf+3TIoPRUyvBrP9QAMyWxLtAaWCUjI0zMlmYMSxox9TJMv9z
 3IpcFsVxQ2DfHxXNTfZRufbmgEL9vV6zGu8aYTGD0/yjG6VeGv0H/cjmACoLEs//
 cOMRM8mGs3g7n1i+xHK9IgEH/yqOpSW+EFvRcUThlyVqDEWKVk5QeS0ms5eg+uT4
 VN+LNwIh0tbZlWXSCSDKMi7V6Gn45Rd8K22xSsTQIgqr7cJkkKsLHFWkNd1b2+DT
 DXWG3SaWQQBdV1Q6tfEzFBswqUbJ/W64O4hEftRAOp1bcqzp7V1a7wqTMfQC6uXA
 ==
X-ME-Sender: <xms:ap6DYWBNnUrK0DttOvLMBq6bVTj8lRIKO_7wsMAY-7ScoyjxTM8yFA>
 <xme:ap6DYQhO9PQCfa22jTUW4ydwUHTmJ6Lj2jDgrVhRkrfLjEvBt2quEiuMKwgaZYkLk
 UP5lFKWfgjxGEKbfwQ>
X-ME-Received: <xmr:ap6DYZnB4KDcIbQ2m_dgDt7el6TPmeluFpYpIeXHGvy-Yf4Il-XuXbPRzv-F3R6SpXG-TfUQZ3GGPm-Fe85sc6_0nrXa7Fcs22S5xe-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdefgdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ap6DYUxQkdnWKHij88goigB1gNaPih8O-SV_9Clra1AVcSQczOBqWA>
 <xmx:ap6DYbQ8V1so-0Gf2rnVuCVkRspOHmiNxWrQSd2sWQUNc6b1qSBxuA>
 <xmx:ap6DYfYshdOufsOktbkss3UCz9o-gJ4qY_5vKX972e28nu6r4Ghnbw>
 <xmx:bJ6DYfK0uiuzUY798_6Z0VnOIXii53fYN6IzaJwXXo3GHZ5xhlOr-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Nov 2021 04:48:42 -0400 (EDT)
Date: Thu, 4 Nov 2021 09:48:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,	amd-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,	Jerome Brunet <jbrunet@baylibre.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,	Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 intel-gfx@lists.freedesktop.org,	Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org,	linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,	Dom Cobley <dom@raspberrypi.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,	Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <20211104084841.mjnennxgelacleaj@gilmour>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
 <YYJsM6/hZ43b1tm9@intel.com> <YYLPXJoC7TZcwejb@intel.com>
MIME-Version: 1.0
In-Reply-To: <YYLPXJoC7TZcwejb@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_014853_223367_17D35926 
X-CRM114-Status: GOOD (  21.28  )
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
Content-Type: multipart/mixed; boundary="===============4279950705687464334=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4279950705687464334==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxndx3anvyrc7z43"
Content-Disposition: inline


--pxndx3anvyrc7z43
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville,

On Wed, Nov 03, 2021 at 08:05:16PM +0200, Ville Syrj=E4l=E4 wrote:
> On Wed, Nov 03, 2021 at 01:02:11PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> > > --- a/drivers/gpu/drm/drm_edid.c
> > > +++ b/drivers/gpu/drm/drm_edid.c
> > > @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct dr=
m_connector *connector,
> > >  		u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
> > >  		struct drm_scdc *scdc =3D &hdmi->scdc;
> > > =20
> > > -		if (max_tmds_clock > 340000) {
> > > +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > >  			display->max_tmds_clock =3D max_tmds_clock;
> > >  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> > >  				display->max_tmds_clock);
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/=
drm/i915/display/intel_hdmi.c
> > > index d2e61f6c6e08..0666203d52b7 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > > @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_enco=
der *encoder,
> > >  		if (scdc->scrambling.low_rates)
> > >  			pipe_config->hdmi_scrambling =3D true;
> > > =20
> > > -		if (pipe_config->port_clock > 340000) {
> > > +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> > >  			pipe_config->hdmi_scrambling =3D true;
> > >  			pipe_config->hdmi_high_tmds_clock_ratio =3D true;
> > >  		}
> >=20
> > All of that is HDMI 2.0 stuff. So this just makes it all super
> > confusing IMO. Nak.
>=20
> So reading throgh HDMI 1.4 again it does specify 340 MHz as some kind
> of upper limit for the physical cable. But nowhere else is that number
> really mentioned AFAICS. HDMI 2.0 does talk quite a bit about the 340
> Mcsc limit in various places.
>=20
> I wonder what people would think of a couple of helpers like:
> - drm_hdmi_{can,must}_use_scrambling()
> - drm_hdmi_is_high_tmds_clock_ratio()
> or something along those lines? At least with those the code would
> read decently and I wouldn't have to wonder what this HDMI 1.4 TMDS
> clock limit really is.

Patch 2 introduces something along those lines.

It doesn't cover everything though, we're using this define in vc4 to
limit the available modes in mode_valid on HDMI controllers not
4k-capable

We could probably do better on the name, but I still believe a define
like this would be valuable.

Maxime

--pxndx3anvyrc7z43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYOeaAAKCRDj7w1vZxhR
xW31AP9ZrW1GZ894aQ+2PZr6HfCImm0k5/+iLzGrkzoNuAj3BwD/fm55lGcssQw+
lhcuuMOafgTMwGbj7Dw+tHaTcMYN7w4=
=8Jzs
-----END PGP SIGNATURE-----

--pxndx3anvyrc7z43--


--===============4279950705687464334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4279950705687464334==--

