Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B646C00140
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Aug 2022 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4L8IYTkvR89cdcVXoybMVyOdCE0+xzg9cl7FRVuMNRs=; b=dcsIa9O5JDxm71
	uSJX08Rmafs2TT8w95cOprKV/JcPk6kXMu6emnOiQi+KP7jGxdle43nkwFi+WcwmHcG646jnZJr4d
	3786g3I6jwdbZT6Vsza1m0xjvwIu7tY1fNjs9UdE7f6xsiSXUvtyMhbwL7uHUfJ3rStV/IiDNfIkW
	LnlNEhUg562p2wZLiwM+n+iZerxj2bETay2OQcTWuQdIMdWnXMyTJitr5DPUu1YPth30MGDIFhror
	vN5NuZiKPoYDX0Eq86X4GwpBXNoGzBNO3aEpRDTDUvD48nanq7lyRSY+oxa7Cyv+GKGW+s3F+jYgu
	/GfGbzHQH+pR9WoECcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUn1-0085tv-FO; Fri, 12 Aug 2022 13:33:27 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUlH-0084Ws-5A; Fri, 12 Aug 2022 13:31:40 +0000
Received: by mail-qt1-f177.google.com with SMTP id e28so746367qts.1;
        Fri, 12 Aug 2022 06:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6vlKlfYZ8UUr42Z0Ey6Sidm4mVEyWELk9h2eYr+jvz0=;
        b=LWAJ9bFUhxTOtJtZ9UEzPiO80QRIZ0tFsEMPaEnnx+gOW+yM1huVv8+rYcQ3MglsWw
         K+REmehdRrO74aNWc+bo1TSJE6Kskzg0Ay6Mf4q/2TeXW12kcwdj9zbBaRvRwYf1Pioj
         7DtaNJSykfCZj9jQ6CH27Wj32/W0VyJoJMiJBZ53axR24GMjmExrzzRvjNfCBKTBqDG6
         UEh8k4toYWuXFKkRFk8nJ7WfuTSvfucRXq+9U5MxGvSMhSV8oYKwXDfc9i5nE3xnC7W3
         FP8KZyDNphpkfJZ64X6HLwCqc90i8MeWNeB61+8eedI0sFN0Q0gwUHSSoUkGfedIrwgb
         lc7w==
X-Gm-Message-State: ACgBeo2CUlD3/MjzxwF5VspvFwYHs+jUpEmxXag8ZRZvmhjOM3nupv46
	5zUEsPuRkigb6CB0EskQ1fN23VLuq78NSQ==
X-Google-Smtp-Source: AA6agR47XJrJZoqTwY3x6x5xiMxB1t4dRzjT6kMpo5UlBspFBefVwyo4463stYP7g+307+lRkbHH7A==
X-Received: by 2002:ac8:7d4e:0:b0:31f:33db:69bc with SMTP id h14-20020ac87d4e000000b0031f33db69bcmr3571722qtb.482.1660311094531;
        Fri, 12 Aug 2022 06:31:34 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id bj16-20020a05620a191000b006b93ef659c3sm1732085qkb.39.2022.08.12.06.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:31:32 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-3246910dac3so9804007b3.12;
        Fri, 12 Aug 2022 06:31:30 -0700 (PDT)
X-Received: by 2002:a81:1204:0:b0:322:7000:4ecb with SMTP id
 4-20020a811204000000b0032270004ecbmr3814535yws.47.1660311090509; Fri, 12 Aug
 2022 06:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-34-3d53ae722097@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 15:31:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Message-ID: <CAMuHMdXizN9OgXgxwdFc1gpnhZof-SZrCH8PczEiJrtYpB62Ow@mail.gmail.com>
Subject: Re: [PATCH v1 34/35] drm/modes: Introduce the tv_mode property as a
 command-line option
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
X-CRM114-CacheID: sfid-20220812_063139_261056_B7ABF4D4 
X-CRM114-Status: GOOD (  26.42  )
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

On Fri, Jul 29, 2022 at 6:37 PM Maxime Ripard <maxime@cerno.tech> wrote:
> Our new tv mode option allows to specify the TV mode from a property.
> However, it can still be useful, for example to avoid any boot time
> artifact, to set that property directly from the kernel command line.
>
> Let's add some code to allow it, and some unit tests to exercise that code.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for your patch!

> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1677,6 +1677,80 @@ static int drm_mode_parse_panel_orientation(const char *delim,
>         return 0;
>  }
>
> +#define TV_OPTION_EQUAL(value, len, option) \
> +       ((strlen(option) == len) && !strncmp(value, option, len))
> +
> +static int drm_mode_parse_tv_mode(const char *delim,
> +                                 struct drm_cmdline_mode *mode)
> +{
> +       const char *value;
> +       unsigned int len;
> +
> +       if (*delim != '=')
> +               return -EINVAL;
> +
> +       value = delim + 1;
> +       delim = strchr(value, ',');
> +       if (!delim)
> +               delim = value + strlen(value);
> +
> +       len = delim - value;
> +       if (TV_OPTION_EQUAL(value, len, "NTSC-443"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_443;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-J"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_J;
> +       else if (TV_OPTION_EQUAL(value, len, "NTSC-M"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_NTSC_M;

[...]

You already have the array tv_norm_values[] from "[PATCH v1 05/35]
drm/connector: Add TV standard property". Can't you export that, and
loop over that array instead?

> +       else if (TV_OPTION_EQUAL(value, len, "HD480I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD480P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD480P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576I;
> +       else if (TV_OPTION_EQUAL(value, len, "HD576P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD576P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD720P"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD720P;
> +       else if (TV_OPTION_EQUAL(value, len, "HD1080I"))
> +               mode->tv_mode = DRM_MODE_TV_NORM_HD1080I;

The names in tv_norm_values[] use lower-case, while you use upper-case
here.

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
