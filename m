Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89228C55184
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Aug 2026 12:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdZ701gR0Ry61aziqcykxfoMNRFcqRn9hq3Q+Fgtc2o=; b=ER2Gwv7SHXlUS8
	AeHg22wAU5QuPJruNpiYWmHaNoZuhlzkHBDlUaHUFomCecdm7xnaVYwTLTNIGW/yaq2JKTInmGk5k
	srS/jLNbsQ36UJnqA9+rFo8iNEMIj3pVqIsU08ROCK92yFF0u/MorQZ0yDXhJzdGOKEey1q1frZb8
	KkjIurYoG39q1YHJTlkKnWCUj/jqj1LGWy1i7ENfjT8USqj6gxo+3AilIX6IP/LiUnO8ApoTpoY40
	bLrg8pyKa7Hp94B70RhA4pIh/6rDaO35EnQLcRhDKW2eCej/SLgqBq9Kwd58fQGCCj4fBSxiLH60a
	BYGeWvHmp1z1CDVU7jrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsC6-0000000H5Ro-1Ja3;
	Mon, 03 Aug 2026 12:55:02 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsC3-0000000H5Qt-35mO
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Aug 2026 12:55:00 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c276bd3692so2304037e0c.3
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Aug 2026 05:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761698; x=1786366498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=N1VO2sq7C3okIECTw39t7OyE4NJhWEztyL8Jt30sQh609jUUOTf66FoeoUVZqxINWB
         3fNl7faal69uf4KDSUhjcldPfJYn06POcrBPviixwYae9AZ8zprVqQle5ZhgB3mdJSNh
         x/D06WnP+3gPVwJYJ0fCoUxLcVWmbKB5qhJC2clz554ySVnJvHMsW7syjHcUjIrLWlmY
         J9iGsjIAav84rVIgtaZEbp2JkHVpgdjYSDAeSOimj61kjfYjgdaixtLhpRPjSdku4PCx
         AOxgUnw2gbdrX2AioffrmltadAtPD2uQT1GTHzM1hqlVBhcrccb5K3kV0xMNu1/19Yjm
         KpQw==
X-Forwarded-Encrypted: i=1; AHgh+RrtIFLjEQFpwhnWUcVLdhA8g1R8//C5W8bUSYtGePmbfm88LWpEXgiajDv+2WipnrNuEcezy3X+GTNjNhod@lists.infradead.org
X-Gm-Message-State: AOJu0YwuwtCC8V+Ww7ExIa9nTI9qX0VdGyXrq48QxggJjYhPdeauPEiI
	vrIHlw1WpmoLztBBGZ5gxejB6lP2S5++daEUQNgtZedduP+pHjlwGewMomWiMez+
X-Gm-Gg: AR+sD139dK69begfbQkXLd4pkd1yd7ELyt4a+3lAidOg0dlg4Ry8h1ScwykVAhIcNOx
	wVIEJ1MYuroAABqwoetadQxaQovvx3G1ymvjr8cCuHSnTguRU2n8OkzQ3WJY9UfI1/xbn59+/33
	TjPXzThpYfmRtBXliy6KxPiUzruTn572qemizsZ3soAA7jlPebWil6pA24TIUrfCoPTLGacuouc
	Q2j83lldLV4TvzRGSvAoVf2dY2Oc2JCDtXYFZrzncJMYAeuqDt5WmCyG753CGCNaCIQJ7BsUHYP
	jJJA/Uh8RY9G8+j4o4D+XtZxPEY2ZvWK6fad5AlGlxohLFz/ghPtpGASe4PcR9kXzHA1Xuh3jpD
	PVcigBLqMNTllRHlOYmrYjtxnhJeHgtWJey2wk6ogJYmpPAV9kGn4XbY7xs5AdFoSp1ud/wvE2E
	Jvw10sCS35IG/JBKhDtB7vAW0ND06qY8/wanL1GjvJXlo+TD+tuPLWIiJ+SkgvgUjHUvOFjZMK4
	PEXrVOnP8qBL76Yfo0p4WEfGw==
X-Received: by 2002:a05:6122:1309:b0:5bd:fc23:c9d1 with SMTP id 71dfb90a1353d-5c38777161cmr3299628e0c.6.1785761698335;
        Mon, 03 Aug 2026 05:54:58 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c37eb2a833sm8667946e0c.6.2026.08.03.05.54.58
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:54:58 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97727c2064fso2193302241.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Aug 2026 05:54:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0kx1j78fYyVv9WIylmc/Cd+tD9GK2hedwuwoPFmqW0eGWt0HdeC4BBhUUftghMVtsLoh51rY5lRPSYdeE@lists.infradead.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_055459_799406_834E20FA 
X-CRM114-Status: GOOD (  20.82  )
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

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
