Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0A5C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Nov 2021 11:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A977560EFE
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Nov 2021 11:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A977560EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNyptvfFmMLM5f7GO9a/ou4G/Y1EW2OcYyjtjxfnyjw=; b=S/FnC+87ah55lk
	U8N72JVZl1aO8E+AA6K0nV2pXJiLzVpbAqIidZSTnyKiBxe6GK/9EFqyNclDI9KQCBMuaB+/pNxSq
	fgc9SlTX6dpwDoPgBH6Q2ZFVx+y2CISYUpEaMYVPK9GzminJ2uaOE/gTBEkrV3QLdwiw7wqDbOK6L
	N94jcEg910359lOTikFy5GLxCYxuKmVM4XdjB8or10fpDQw53m6zSMY1I+P5pgVGDXMK4Jqw337D6
	d3zBZWgmpYc2TdzHbzQzrZUnzBsjVWvAbKQA2OGfgUy82mSirasihUqFmNKqUXgkgKnfD/KuZC4bq
	tcXqF6t3fK6b1bfspbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miE2N-004u3D-CS; Wed, 03 Nov 2021 11:02:35 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miE2B-004u0g-0Q; Wed, 03 Nov 2021 11:02:24 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231425870"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="231425870"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 04:02:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="541655211"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 03 Nov 2021 04:02:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Nov 2021 13:02:11 +0200
Date: Wed, 3 Nov 2021 13:02:11 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Robert Foss <robert.foss@linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <YYJsM6/hZ43b1tm9@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211102145944.259181-2-maxime@cerno.tech>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_040223_139325_29099878 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_co=
nnector *connector,
>  		u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
>  		struct drm_scdc *scdc =3D &hdmi->scdc;
>  =

> -		if (max_tmds_clock > 340000) {
> +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>  			display->max_tmds_clock =3D max_tmds_clock;
>  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
>  				display->max_tmds_clock);
> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/=
i915/display/intel_hdmi.c
> index d2e61f6c6e08..0666203d52b7 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_encoder =
*encoder,
>  		if (scdc->scrambling.low_rates)
>  			pipe_config->hdmi_scrambling =3D true;
>  =

> -		if (pipe_config->port_clock > 340000) {
> +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
>  			pipe_config->hdmi_scrambling =3D true;
>  			pipe_config->hdmi_high_tmds_clock_ratio =3D true;
>  		}

All of that is HDMI 2.0 stuff. So this just makes it all super
confusing IMO. Nak.

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
