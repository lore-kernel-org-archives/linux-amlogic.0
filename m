Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D98FB44C8
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzqRwjXq7fSYKe0l1AqWqZ/j3jGr+B0se2oEAP2Vpig=; b=jS0gAEKpAJEGh5
	H/AeP3lIal5n4yZPflZkkW+y72O3T766jzWO7ckcMEbb1V4wi5S5KN1u4IiRRHqsO+8+nC1Bh08Jk
	FM36tgtw3QnNyC54qf8fpxHnKEhn2ABzLOEJsBoZj1jn2VOYsNlDQBEOc6TVYhRw/ULyoZaMrzAQf
	G0h7jc+Eri4YgsUGIYphzKq0Qz8xABq0n6yR6KIilh8T6mh+iWqlpEVOOzja8i5Rma+D/sDRZ6c0c
	T/LMvpGIexjvEnaD29a5IIf0vL+ylvBP4ywyFh7SUtcW0duOAaC88P8KUZIKBDhFtz2L1dxGOUZo1
	+3Dz4Xyi0a95YZhhFvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBPd-0000000Cps1-47wX;
	Fri, 24 Apr 2026 07:57:21 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBPa-0000000CprP-3Wdc
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 07:57:19 +0000
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4779b2497b4so4425246b6e.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 00:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017438; x=1777622238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=YypcQi/mMgtzirIpSiYvmIknpG4gHx2WY41U7hojC5LtwR3xuXurcMnzNjmoJRAwTg
         01FrsVmfM5t59n282ctJYPO1sgkuKn8Smw5ZUs53lbYAgUBsrUhBv+WNyVdWYJuc/wXS
         nhC9yJFCrq0W64gElkEY5C4OQ0nDsqFjF/uLQ1LP+3T3CFsUS7QJ6GfrCz6zT4H+J0Vh
         sGCyQTJ6bAcHsU3ztjSb/D1YmrB6Juh32zLI5iy74nVZTanNf+gqRswQlsgNI9boiiwQ
         JRgKfz8GNfa4jlzi4/54Q3SbC+KbfYcYhdSbFJEzbY6401c4oB8fNAMIcVP5tasX+b8G
         eCcQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DuhY9GaZPaSVwS3fPGm/HkWUzfcc5LVBaieTRkOU/pyve/QVYEjP0fHWg2u1avZM6IYvnZ7BkaO2l8f2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6pfbL5wTSYNN/VvlIwMLXjgL+NnQAop1GS3254B47IJnM74FB
	hNgVEfslGAAHQt+uSqG70StQEKozCqzK+PesAlZUvkXswy71NWARYDDfwYsFAGpDgyA=
X-Gm-Gg: AeBDiesMCHxhw3Q8bBPlb9h9gYXpcpCMwzxSvpngpXbKqA8mv7zJCsMlHkxkEkmBznr
	WwowefD7Nz0z9VpjGqwa2lvyl4ylQ7nQLWX0a1UhvvXUrI0TP6FY+dgPsSudOOfKtX8VOkG7/cE
	aOJEIEN+KneTgITIChibdAkRcBKgWrUSjAg1M/4k+uxFcmjWks2aLa+7FD1g3nQgXHvxvck08t4
	qveWL51xB/TKW9Jvhf7qA+Q4lx1n3bAvJami8oudHxZwfCNaAzwH72igV4uRzSWCGcT2O4W8tZw
	Qw/JR1ShbQq+OTmDTj83/bJTChJq8EOzhdH2QH4PmfKgjMeNZWWWtzeQVWm0gYcLNvLE+UWY/JA
	GQWDvaX/v5rVk+Iuef1/fskPI4CkPWnBH1GQSgizYTBshTWgn10JTwWdAYHHNVVedMWthRgN/Xv
	0DVlbDDYukEJ13QoztSfYdizzaX846b9cUoYNY4HUa0Iq0e0De2T/vemKuJ+ZiLtx2o6Cgn4JRp
	J8=
X-Received: by 2002:a05:6808:1927:b0:470:434b:aece with SMTP id 5614622812f47-4799ca6c8f4mr16248706b6e.40.1777017437680;
        Fri, 24 Apr 2026 00:57:17 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4799ff451d9sm14853586b6e.8.2026.04.24.00.57.17
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:57:17 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-464bba3a9easo3917093b6e.0
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 00:57:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8W/czy89jVQ9uM73oe6J87Lkpad68bLstkeDu2YVgj4npv1wA1FgUUc/a5/yC63VsN51gRFEHbo5WpS3cb@lists.infradead.org
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_005718_882104_4DA4D8CD 
X-CRM114-Status: GOOD (  21.98  )
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

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

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
