Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81445C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Nov 2021 18:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500C96113B
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Nov 2021 18:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 500C96113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwsc9lvyl/SjTDCPSg2Qq32PIsbqUPlicLmBrM2FNk0=; b=NvL2jhrmARcJ8+
	AhQVpZ0YfZ/rmkLvewkAJTxd6uQ74ctoSlR4yp+owyJLHxhV4cJb5pNUHbj9CMJzkhwVynddUQQ3Y
	uIfS1+EgaMr4mVS3cJ560423f7IV1wz/T19PR7C3cKNs/xOszmtpWQSGKE3XrUYDljS/76tjpmVul
	IwL0EgVgbn53vYsDEfCrJm7vGXzmqIrowDFEbcFyncW0ddn3KEIZ++8a6IWA3Zu3YDXBkfOiun5Kk
	GCnqsN4Zpo/fbgMfumhT2IYxXJFR/wJFDt2gK8nCgRUI/lgV8kvUo9JadyxvsdndofGc3VIKXnXEO
	4rPy5bfviBJdIdo/cRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miKeB-0066ML-Ir; Wed, 03 Nov 2021 18:06:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miKdb-0066AL-8e; Wed, 03 Nov 2021 18:05:29 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="229014342"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="229014342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 11:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="501192085"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga008.jf.intel.com with SMTP; 03 Nov 2021 11:05:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Nov 2021 20:05:16 +0200
Date: Wed, 3 Nov 2021 20:05:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, amd-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 intel-gfx@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 01/13] drm/connector: Add define for HDMI 1.4 Maximum
 Pixel Rate
Message-ID: <YYLPXJoC7TZcwejb@intel.com>
References: <20211102145944.259181-1-maxime@cerno.tech>
 <20211102145944.259181-2-maxime@cerno.tech>
 <YYJsM6/hZ43b1tm9@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYJsM6/hZ43b1tm9@intel.com>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_110527_377230_8A20CDA8 
X-CRM114-Status: GOOD (  16.50  )
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

On Wed, Nov 03, 2021 at 01:02:11PM +0200, Ville Syrj=E4l=E4 wrote:
> On Tue, Nov 02, 2021 at 03:59:32PM +0100, Maxime Ripard wrote:
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4966,7 +4966,7 @@ static void drm_parse_hdmi_forum_vsdb(struct drm_=
connector *connector,
> >  		u32 max_tmds_clock =3D hf_vsdb[5] * 5000;
> >  		struct drm_scdc *scdc =3D &hdmi->scdc;
> >  =

> > -		if (max_tmds_clock > 340000) {
> > +		if (max_tmds_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> >  			display->max_tmds_clock =3D max_tmds_clock;
> >  			DRM_DEBUG_KMS("HF-VSDB: max TMDS clock %d kHz\n",
> >  				display->max_tmds_clock);
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/dr=
m/i915/display/intel_hdmi.c
> > index d2e61f6c6e08..0666203d52b7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
> > @@ -2226,7 +2226,7 @@ int intel_hdmi_compute_config(struct intel_encode=
r *encoder,
> >  		if (scdc->scrambling.low_rates)
> >  			pipe_config->hdmi_scrambling =3D true;
> >  =

> > -		if (pipe_config->port_clock > 340000) {
> > +		if (pipe_config->port_clock > DRM_HDMI_14_MAX_TMDS_CLK_KHZ) {
> >  			pipe_config->hdmi_scrambling =3D true;
> >  			pipe_config->hdmi_high_tmds_clock_ratio =3D true;
> >  		}
> =

> All of that is HDMI 2.0 stuff. So this just makes it all super
> confusing IMO. Nak.

So reading throgh HDMI 1.4 again it does specify 340 MHz as some kind
of upper limit for the physical cable. But nowhere else is that number
really mentioned AFAICS. HDMI 2.0 does talk quite a bit about the 340
Mcsc limit in various places.

I wonder what people would think of a couple of helpers like:
- drm_hdmi_{can,must}_use_scrambling()
- drm_hdmi_is_high_tmds_clock_ratio()
or something along those lines? At least with those the code would
read decently and I wouldn't have to wonder what this HDMI 1.4 TMDS
clock limit really is.

-- =

Ville Syrj=E4l=E4
Intel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
