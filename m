Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB85C00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 13:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpUjhkIqTp8rguLE4MIVNwxcJdzkZkaEmnoaAC2GdRk=; b=PpOSvypmzQKX/L
	InmN08ykWaR/CsKBaDPWvE3HrZPF2VPV4Sd+3b9ItDKlos1nYFSvtInMURQ6jH5F9kPbkrcgD/U7D
	U0HpD97g6eZuBzIpDt9/X/JcWO4bMPJoVoOrAC7JRaeFYVYZSy3eQkLZIGYqFDmhvngSa9WHeHxlj
	0XEU0HegzSMUdRH6DP+vMtEPJo/wB7Mg7+X73sb2r9rr5id7555d0wgGLfhlDGf3Pfm2q9EzlD18D
	5FyqZ0n/rZxQaKTw54cLQ7byiVuIjwkoy8D0v5DaNkhWs83//0zji9yBvjDH2VdPylSpp8fCDvRFS
	btlF3nn523ABVK9DbBvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUl0-0084N8-R5; Fri, 12 Aug 2022 13:31:22 +0000
Received: from mail-qk1-f171.google.com ([209.85.222.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUkT-00840i-Pw; Fri, 12 Aug 2022 13:30:52 +0000
Received: by mail-qk1-f171.google.com with SMTP id f28so739458qkl.7;
        Fri, 12 Aug 2022 06:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=aTZUDWioyW00G3FP5HrhAR/urlDDduygUMh7slAg+gU=;
        b=Jep4gWxpkU71vUdQS/ThV2B2jp2YvVOvbeg5X9IDLjKY2tvdnFtmcbUMutMlGtDsoW
         bFtI14fB+oSQPpqUk/pYiW0iFMM8q1wGY+ILKsRnNHxswNvDAoxZJR/LynyRB/nLXJrx
         CdqbhIqCG/xhs6B/vQwdkCMGYellZu/O4Mu3ShoVP2c2DraZarKRupHulWczilRUwVbz
         s5W2c2shkhC1hLxUnj5UZvCTxXrL7tThr0C1Z6Pz3Ys9+SawcX2OsTDjShCEDwTuRULK
         qhgdh7Cu+vQGIIJWpM8W47TvCh83aPafMv3za6MvGPgEbZC09BYKUDC0yGWZwNZC0ABk
         0xIQ==
X-Gm-Message-State: ACgBeo2/oJ0cK38V4o+d3gLAZDeQxzuS0vV2Yr2+pHs3EH8Vkbi11lkB
	vJkYV/gfCUmhUFjp96+MyEcCGYhpEoz/5g==
X-Google-Smtp-Source: AA6agR4sj4S7NBPihRTKQO1OM/Z2X/DAma6ri60NAyBki+L18QJnuNvOcBqsDBil2+Sz+MYZzEbtGA==
X-Received: by 2002:a05:620a:4807:b0:6b9:2b9b:85b0 with SMTP id eb7-20020a05620a480700b006b92b9b85b0mr2849655qkb.655.1660311046444;
        Fri, 12 Aug 2022 06:30:46 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id 199-20020a3704d0000000b006b5cb0c512asm1894830qke.101.2022.08.12.06.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:30:46 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id g5so1458830ybg.11;
        Fri, 12 Aug 2022 06:30:46 -0700 (PDT)
X-Received: by 2002:a81:b812:0:b0:328:68e4:c886 with SMTP id
 v18-20020a81b812000000b0032868e4c886mr3592742ywe.502.1660310729490; Fri, 12
 Aug 2022 06:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:25:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
Message-ID: <CAMuHMdWYo7M44uLNhTmJenGDreGALBZ9E48oyBDEeAuL=0h=dw@mail.gmail.com>
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
	Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phil Elwell <phil@raspberrypi.com>, 
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, Dom Cobley <dom@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_063049_861281_47B46233 
X-CRM114-Status: GOOD (  29.24  )
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

Hi Maxime,

On Fri, Jul 29, 2022 at 6:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> The TV mode property has been around for a while now to select and get the
> current TV mode output on an analog TV connector.
>
> Despite that property name being generic, its content isn't and has been
> driver-specific which makes it hard to build any generic behaviour on top
> of it, both in kernel and user-space.
>
> Let's create a new bitmask tv norm property, that can contain any of the
> analog TV standards currently supported by kernel drivers. Each driver can
> then pass in a bitmask of the modes it supports.
>
> We'll then be able to phase out the older tv mode property.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1649,11 +1650,40 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_properties);
>   * 0 on success or a negative error code on failure.
>   */
>  int drm_mode_create_tv_properties(struct drm_device *dev,
> +                                 unsigned int supported_tv_norms,
>                                   unsigned int num_modes,
>                                   const char * const modes[])
>  {
> +       static const struct drm_prop_enum_list tv_norm_values[] = {
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_443) - 1, "NTSC-443" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_J) - 1, "NTSC-J" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_NTSC_M) - 1, "NTSC-M" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_60) - 1, "PAL-60" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_B) - 1, "PAL-B" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_D) - 1, "PAL-D" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_G) - 1, "PAL-G" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_H) - 1, "PAL-H" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_I) - 1, "PAL-I" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_M) - 1, "PAL-M" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_N) - 1, "PAL-N" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_PAL_NC) - 1, "PAL-Nc" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_60) - 1, "SECAM-60" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_B) - 1, "SECAM-B" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_D) - 1, "SECAM-D" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_G) - 1, "SECAM-G" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K) - 1, "SECAM-K" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_K1) - 1, "SECAM-K1" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_SECAM_L) - 1, "SECAM-L" },

The above are analog standards, with a variable horizontal resolution.

> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480I) - 1, "hd480i" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD480P) - 1, "hd480p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576I) - 1, "hd576i" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD576P) - 1, "hd576p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD720P) - 1, "hd720p" },
> +               { __builtin_ffs(DRM_MODE_TV_NORM_HD1080I) - 1, "hd1080i" },

The above are digital standards, with a fixed resolution.

You seem to have missed "hd1080p"?

In addition, "hd720p", "hd080i", and "hd1080p" are available in both 50
and 60 (actually 59.94) Hz, while "hd1080p" can also use 24 or 25 Hz.
Either you have to add them here (e.g. "hd720p50" and "hd720p60"), or
handle them through "@<refresh>".  The latter would impact "[PATCH v1
09/35] drm/modes: Move named modes parsing to a separate function", as
currently a named mode and a refresh rate can't be specified both.

As "[PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
command-line option" uses a separate "tv_mode" option, and not the main
mode name, I think you want to add them here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
