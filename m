Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE47C04A68
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 09:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avKjSVa3q/KoITALpo1wlrcHKUtDz8IL86RxusKFJ5o=; b=wEuAB2PJut+OEL
	m8Aj2WHQyDcDb1dU5m3ronpGhmFvDyTw/B+Dq9d4CJS7uPFJe+8b1g3w3xhXu+46oOuhtg/xfbL8K
	yu4LGuqGg9Ea08wVh+xFQhwK5XCObuBF1C6ChRXJanXRnt6v+6yrjXHsEnwdPFwxWfXXiJ+Kk1Amb
	rzbsHAwQHSWCiGCPgZKAzl5NKSuDY5LoF+uhHyjz/sDgvik5bW4JZFiZcIjMtxLc183qSfd1RI8ve
	5utlgw5Vj14NHrWMBzCNn9K8EHVKAylRvUF4FNKz+BBJWpDQ5lMiDSUc8fInmt2Dbex4SWgK3UCs5
	LZNDptc/LOOQCei+m2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiWY-00GtGW-Rc; Sat, 30 Jul 2022 09:12:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiWM-00GtAC-EI; Sat, 30 Jul 2022 09:12:32 +0000
Received: by mail-ed1-x532.google.com with SMTP id r4so567609edi.8;
        Sat, 30 Jul 2022 02:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hll3ibUAqwWMG/OtKvhLlM3Hjch+TNh/bFfU6jv+6g4=;
        b=UIvlOiZjgq7+FWhOckuO00o7AIlyQZ2vDqbOSmqJnIrmhVs3J56EiTFct5I279Lkqf
         +eXwGIIecQdAbHOb+l2dJWwK/lr4IWvn2nDdgucESnOsZS3WLnG5r++kWrEXnIqL6t2b
         yElo8+B3x0fX7dLh4mMQabuoB0PE5PO1XMK0gYrC8qDyYujV8TAHQoCZmLn6j1f9azUc
         YzVJhvTOSMTX0zI6cAaIxHiY3BP2ybwCILXOVPqgwxt77MANU1iyXgpXCb3NvDHNJTTv
         yxUakWjvKPdk7KDgqdeB9DGPej6EBT8/T7FmJtCr7c9E7l+2NpQKxRwl65Ts+1XWrk52
         tsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hll3ibUAqwWMG/OtKvhLlM3Hjch+TNh/bFfU6jv+6g4=;
        b=t0fixayDijU7zZMO0ti49LXRzcAT4pe+ICUWvjoFaPs/poy5BfcQgQd468RHcvNPoa
         kSn9JYxvi0x2MHMan39WtXFvDBrmEThQF8487ocfGjoyhMd/7N+nyCNtsUfpW3K6gHHB
         /OO/Wy+8Fd3uraUXCGqSbnVy9UcendHKRLhchOJvYMvUNvIrxatkYhp3OwnlZSAB9LNa
         xVIOJ9LliEWp1u43OuV/9hM7AsL0p6KWdEOGu0WolmYUdxDVkaBXJy4Ul9t+E0s0yw54
         GOHmV3OlTBLXVDcD61DmOSVx8OtHCnx5TVPPKkKHpbdvGVpxwQVp2osJAP4m+er0yJab
         ppFg==
X-Gm-Message-State: AJIora9ZgSzLEvn1zXpGSIqCGd6wcQk3owdBxcnpoAedeWUPmfsDSQ8C
	jd4xuau71B7KkEQpO+goThc=
X-Google-Smtp-Source: AGRyM1s0xAfvYSqaUCZnsf6TarPfFgDLdgevrEr1is/O1hRHAi0uogjW59OUmgXy0aJbO16CWW7UwQ==
X-Received: by 2002:a05:6402:51d1:b0:43b:f89e:a751 with SMTP id r17-20020a05640251d100b0043bf89ea751mr6943326edd.391.1659172347045;
        Sat, 30 Jul 2022 02:12:27 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906200100b0072b40cb28a8sm2706263ejo.29.2022.07.30.02.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:12:26 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 26/35] drm/sun4i: tv: Convert to atomic hooks
Date: Sat, 30 Jul 2022 11:12:24 +0200
Message-ID: <2638619.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-26-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021230_531136_72EC361B 
X-CRM114-Status: GOOD (  12.63  )
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

Dne petek, 29. julij 2022 ob 18:35:09 CEST je Maxime Ripard napisal(a):
> The VC4 VEC driver still uses legacy enable and disable hook

s/VC4 VEC/sun4i tv/

Best regards,
Jernej

> implementation. Let's convert to the atomic variants.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 53152d77c392..f7aad995ab5b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -339,7 +339,8 @@ static void sun4i_tv_mode_to_drm_mode(const struct
> tv_mode *tv_mode, mode->vtotal = mode->vsync_end  + tv_mode->vback_porch;
>  }
> 
> -static void sun4i_tv_disable(struct drm_encoder *encoder)
> +static void sun4i_tv_disable(struct drm_encoder *encoder,
> +			    struct drm_atomic_state *state)
>  {
>  	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
> @@ -353,7 +354,8 @@ static void sun4i_tv_disable(struct drm_encoder
> *encoder) sunxi_engine_disable_color_correction(crtc->engine);
>  }
> 
> -static void sun4i_tv_enable(struct drm_encoder *encoder)
> +static void sun4i_tv_enable(struct drm_encoder *encoder,
> +			    struct drm_atomic_state *state)
>  {
>  	struct sun4i_tv *tv = drm_encoder_to_sun4i_tv(encoder);
>  	struct sun4i_crtc *crtc = drm_crtc_to_sun4i_crtc(encoder->crtc);
> @@ -469,8 +471,8 @@ static void sun4i_tv_mode_set(struct drm_encoder
> *encoder, }
> 
>  static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
> -	.disable	= sun4i_tv_disable,
> -	.enable		= sun4i_tv_enable,
> +	.atomic_disable	= sun4i_tv_disable,
> +	.atomic_enable	= sun4i_tv_enable,
>  	.mode_set	= sun4i_tv_mode_set,
>  };





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
