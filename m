Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FC5C54798
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4jtCEm9HRQQpP1iFvNL2MB3FEcBhIGzPG3WFijSV38=; b=RrbST2WIbBf+YA
	fsPEXIgl6xGo4O7E8XEmlpTUN+0Vr3qU51fVnp8POxHVrNg0Rr90Oy96u+cLcaaaVS//ocx/fYfPp
	8W5dw+gxw79tb9o15Hbw9lI05pHgWxgsThavEB09OzJ+VlwcB6Do1dPwaK3Lx3nrMNzzTql3Dl65w
	1UBunFuXIVxU0rna5H4GRvIyMgPFyiboWesbeqV6pdMKvNGRiyV5TZWn701Gu78ECwAiGlMZwIpM7
	kERAYCD9bwzHUg7FPXD5xLpBXrS0kw/Q404VZ0EaGA6lOzdwtMhYBfWQeME74UN7+dPYNaymb2ay5
	6oQWYk0cYpoB+F6IWYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZ6x-0000000APqZ-2jrf;
	Fri, 23 Feb 2024 17:13:27 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV49l-00000001gDT-2kmB
	for linux-amlogic@lists.infradead.org;
	Wed, 31 Jan 2024 06:33:12 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dc6bae46ec2so341919276.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jan 2024 22:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706682787; x=1707287587; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
        b=Y3OeJwDF9qe61xqh66xjX/Dd8PwcCZMwZ3+kxln28Pcyhd0Ta3Oj+GbsxL8snhsgLg
         WFOHofRFEjAqYCLTMlmqvlk8Oj3HmOVnDn95zm8C5GvE7aMeMn21ZIWkTauPoK0/thkA
         SA/IsLNK9yr/ChjPV1HEUUkHiGWpaWsrarYi7USXjOdusuWO5HC/COYDaiFNGeBvLp+X
         7PVbaNPS8jIzxGsxUzIjtrwHm7H+5BDkDV8QaJpUs4wwO2iwD1Q7eAdruP8OjaZ6oE2I
         Ds6+o+TVUAsXnYavo3N7WoO4yU9ahE2h8VgHE+6bWw8pRU+ma1Dt3GPx0vpa8XI0rauI
         X5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706682787; x=1707287587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+0UrfFLZxByUhAQTRyALxC5TYXU+3QlMDreZkniP6Y=;
        b=f/gGpqfVz+EWZ7yfvAhfMbibEuOuAl1CyT4Zd4PFLSweW9AXVkKoA34xKJwezVtW0o
         R+2HQNh/qyhg/UuidYpfzrkwFJyX7z+00QYraFgJzNbhVjmIljyiAqgHAwrCbC+i6qfi
         8GGqyip3X8pPVMLQLRHAZL2RfeNek4F2URvvFbAtUvbczBoZ5xtYRI4mMrpEzRy2Cg+M
         Cvhb/MnepV3AWbBTwJx/1pml+H24FAjGuEFEhYcymfXEnu+5K9q+FO+LdfQpkH6VamLD
         rNGi0H+gyZGy9PWV1vbMINl6yCo+KvHKiNhDbCSCeJp84wxA5trAz3ckGe0ExPxgcVsX
         7EHA==
X-Gm-Message-State: AOJu0YwqmaoNINfCWeFwDIpuAoThJ69g5Y8foLzNwdzrV9Tx9zYzOhc5
	i20Q32JA1JHg6/gmM1jXHzKAZyBcivwNiJLESFQe4sFA9GeVVxr4rAMJDHZVTjmiodEWKRKRbk1
	d4/JOdS7q0KMqAxr2NOV8xMwSCk54+lh3Alwjpg==
X-Google-Smtp-Source: AGHT+IFxRXwNP5PRj+1YvzHjYbCYITU/P5nsMmG4/Z+5FnhpEGiUV21GZeIbWwZE5W49t+z2Do1jj0wx+tXggTPULI4=
X-Received: by 2002:a5b:582:0:b0:dc2:1c77:ca7 with SMTP id l2-20020a5b0582000000b00dc21c770ca7mr757962ybp.36.1706682786826;
 Tue, 30 Jan 2024 22:33:06 -0800 (PST)
MIME-Version: 1.0
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com> <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eddy6qjf.wl-kuninori.morimoto.gx@renesas.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 08:32:56 +0200
Message-ID: <CAA8EJpq79tOCH3vK+Hh_XD4mtj1GVgVvwehQF4BfxTjwPi_fHQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/24] gpu: drm: switch to use of_graph_get_next_device_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, =?UTF-8?Q?Niklas_S=C3=83=C2=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, =?UTF-8?B?VXdlIEtsZWluZS1Lw4PCtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexey Brodkin <abrodkin@synopsys.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Bjorn Andersson <andersson@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>, Eugen Hristev <eugen.hristev@collabora.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Frank Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Jacopo Mondi <jacopo@jmondi.org>, James Clark <james.clark@arm.com>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, Liu Ying <victor.liu@nxp.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>, Philippe Cornu <philippe.cornu@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, Saravana Kannan <saravanak@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>, Stefan Agner <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Yannick Fertre <yannick.fertre@foss.st.com>, Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>, Leo Yan <leo.yan@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mike Leach <mike.leach@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>, coresight@lists.linaro.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_223309_738334_B5C68666 
X-CRM114-Status: GOOD (  12.95  )
X-Mailman-Approved-At: Fri, 23 Feb 2024 09:11:35 -0800
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

On Wed, 31 Jan 2024 at 07:05, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/gpu/drm/armada/armada_drv.c                   | 2 +-
>  drivers/gpu/drm/bridge/tc358767.c                     | 2 +-
>  drivers/gpu/drm/drm_of.c                              | 6 +++---
>  drivers/gpu/drm/meson/meson_drv.c                     | 4 ++--
>  drivers/gpu/drm/msm/msm_drv.c                         | 2 +-
>  drivers/gpu/drm/mxsfb/lcdif_drv.c                     | 2 +-
>  drivers/gpu/drm/omapdrm/dss/base.c                    | 2 +-
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c                     | 2 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c         | 2 +-
>  drivers/gpu/drm/stm/ltdc.c                            | 4 ++--
>  drivers/gpu/drm/tiny/arcpgu.c                         | 2 +-
>  12 files changed, 16 insertions(+), 16 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
