Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6241AC00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5PKgCfymbWKD3KSnH/uwZsrYL+uc7gzlE3ddW9VLzk=; b=AAi7MHMfFv8pHs
	eZyaROPevDmfCJz7Z5kD6Xbkm4G/btSXbiSbPk6G+sHY4OjNMelVRARllMge5+O3+cUL9O07JoVVJ
	hqP4x4R+w6Ja0wkFDboiWCFAywn7lXe/OzIU2Qiop099ErLP/4hCNxvk6tDc+kGy0tT8qZI8d8+os
	tlixqaR/y/rRSmuf/00RgBWXikduJM1sRbxLMt5HPp19x7Enbr+afzTwCKFS5T8vgaArp79DBt7Li
	SqfqpsFpa8Ko7fqw24Q3YRDPeNWd8e/djfA1IADbFKKo1ltE6yILx5l1m3iJE8NTHkXVA+DNyZxtV
	rn9a4nGRbnD9gAAWW6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsQS-00EilO-Bc; Tue, 02 Aug 2022 13:59:12 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIsQP-00Eigw-3H; Tue, 02 Aug 2022 13:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659448749; x=1690984749;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=JXaQKy9UvN4RoNFqHuqgOiDf4e31ilcdvl1X5DNMf8k=;
  b=nHCneU7v0/hJdrE4rkmu22LDrgwyVLaUIbHlugtCW3r14N3V7SkceS5y
   e1XzRG3pFFaC6Q9RUPqUQhg7CC7C1g/m6DfI3GWCI3JaTEwQWsR0k51Qh
   V4nh9zQcCc8Gx81S+ZofKvkI7zVDJaulcxBWdn0GmGp6jUdL8ZpqEHaxJ
   qpbdrbJBnCEg0K0A6m4l/82j8/v5e4Q8NkMz2NjFZplZrUXjK+6dT3IXO
   Ev4dgSRv9WoP8Xcg3LfHuYZNDd65BHeZslXcbSVz8i49MYH7Bg+nc4j6E
   qMOWdT94WNnGtbSxbW9mj2jDmGpIzDYWCZIAnrMLWtN10lSy7EzY1RLr8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="351122543"
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="351122543"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 06:59:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,211,1654585200"; 
   d="scan'208";a="661633082"
Received: from llaviniu-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.60.134])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2022 06:58:55 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <maxime@cerno.tech>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet
 <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma
 Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?utf-8?Q?Tr=C3=B8n?=
 =?utf-8?Q?nes?=
 <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mateusz Kwiatkowski
 <kfyatek+publicgit@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-4-3d53ae722097@cerno.tech>
Date: Tue, 02 Aug 2022 16:58:53 +0300
Message-ID: <8735eeg31e.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_065909_245957_F4DCBAE6 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jul 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> Multiple drivers (meson, vc4) define the analog TV 525-lines and 625-lines
> modes in the drivers.
>
> Since those modes are fairly standards, and that we'll need to use them in
> more places in the future, let's move the meson definition into the
> framework.

I think you should always expose interfaces, not data. Data is not an
interface, and I think this sets a bad example that will be cargo
culted.


BR,
Jani.

>
> The meson one was chosen because vc4's isn't accurate and doesn't amount to
> 525 and 625 lines.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 304004fb80aa..a4c1bd688338 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -48,6 +48,24 @@
>  
>  #include "drm_crtc_internal.h"
>  
> +const struct drm_display_mode drm_mode_480i = {
> +	DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
> +		 720, 739, 801, 858, 0,
> +		 480, 488, 494, 525, 0,
> +		 DRM_MODE_FLAG_INTERLACE),
> +	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_480i);
> +
> +const struct drm_display_mode drm_mode_576i = {
> +	DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
> +		 720, 732, 795, 864, 0,
> +		 576, 580, 586, 625, 0,
> +		 DRM_MODE_FLAG_INTERLACE),
> +	.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> +};
> +EXPORT_SYMBOL_GPL(drm_mode_576i);
> +
>  /**
>   * drm_mode_debug_printmodeline - print a mode to dmesg
>   * @mode: mode to print
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 8110a6e39320..98ec3e563155 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -45,21 +45,11 @@ struct meson_encoder_cvbs {
>  struct meson_cvbs_mode meson_cvbs_modes[MESON_CVBS_MODES_COUNT] = {
>  	{ /* PAL */
>  		.enci = &meson_cvbs_enci_pal,
> -		.mode = {
> -			DRM_MODE("720x576i", DRM_MODE_TYPE_DRIVER, 13500,
> -				 720, 732, 795, 864, 0, 576, 580, 586, 625, 0,
> -				 DRM_MODE_FLAG_INTERLACE),
> -			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> -		},
> +		.mode = &drm_mode_576i,
>  	},
>  	{ /* NTSC */
>  		.enci = &meson_cvbs_enci_ntsc,
> -		.mode = {
> -			DRM_MODE("720x480i", DRM_MODE_TYPE_DRIVER, 13500,
> -				720, 739, 801, 858, 0, 480, 488, 494, 525, 0,
> -				DRM_MODE_FLAG_INTERLACE),
> -			.picture_aspect_ratio = HDMI_PICTURE_ASPECT_4_3,
> -		},
> +		.mode = &drm_mode_480i,
>  	},
>  };
>  
> @@ -71,7 +61,7 @@ meson_cvbs_get_mode(const struct drm_display_mode *req_mode)
>  	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
>  		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
>  
> -		if (drm_mode_match(req_mode, &meson_mode->mode,
> +		if (drm_mode_match(req_mode, meson_mode->mode,
>  				   DRM_MODE_MATCH_TIMINGS |
>  				   DRM_MODE_MATCH_CLOCK |
>  				   DRM_MODE_MATCH_FLAGS |
> @@ -104,7 +94,7 @@ static int meson_encoder_cvbs_get_modes(struct drm_bridge *bridge,
>  	for (i = 0; i < MESON_CVBS_MODES_COUNT; ++i) {
>  		struct meson_cvbs_mode *meson_mode = &meson_cvbs_modes[i];
>  
> -		mode = drm_mode_duplicate(priv->drm, &meson_mode->mode);
> +		mode = drm_mode_duplicate(priv->drm, meson_mode->mode);
>  		if (!mode) {
>  			dev_err(priv->dev, "Failed to create a new display mode\n");
>  			return 0;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.h b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> index 61d9d183ce7f..26cefb202924 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.h
> @@ -16,7 +16,7 @@
>  
>  struct meson_cvbs_mode {
>  	struct meson_cvbs_enci_mode *enci;
> -	struct drm_display_mode mode;
> +	const struct drm_display_mode *mode;
>  };
>  
>  #define MESON_CVBS_MODES_COUNT	2
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a80ae9639e96..b4a440e2688c 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -394,6 +394,9 @@ struct drm_display_mode {
>  
>  };
>  
> +extern const struct drm_display_mode drm_mode_480i;
> +extern const struct drm_display_mode drm_mode_576i;
> +
>  /**
>   * DRM_MODE_FMT - printf string for &struct drm_display_mode
>   */

-- 
Jani Nikula, Intel Open Source Graphics Center

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
