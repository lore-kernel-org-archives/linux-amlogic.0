Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB65C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwJx/m8y3RVyPDVpClKq/bZWG7HglBzp05NEo3Q0sNA=; b=sy/vFJ2kPa5o9M
	WmPMy+A4+Z9BlQXx+I9DTqznWJB3xJTX7BreaZtndDy5bvfHRr042wMORfbTh6JN30NtGMsTXvPuO
	MyEE6lOqbghNmcvi1sCY0mpmR8o4GrwJ7Ug5eetFdRWmsgDKuuQr/Nkj+IhMRq/FqgsXGkYxgzj0a
	lRK9nXnkIJLL8v1yazX0g80w5bGNZBadZElA125GCoDuVM14MJlub2SRCiHPLrpZFgc39N9SkPQoR
	YR5vgkAjVwl7Ixf2fPWmD6Oyh7Ptbr3Sgj13zjY0HdVzSk0meV/IJOR8b4lOVRN9YTvSEvmO+5k7S
	NFodBMKrzDfIRE9IeIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAYLR-00Bsp6-0V; Thu, 20 Jan 2022 14:23:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAYLE-00Bsis-Px
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 14:23:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id n10so13750736edv.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xggRvSFBLIaR/QgerZZVvbOSKVlz0ESTMXna4xv4wtg=;
 b=UVWwXEca8jRTa1C24yf6uJF8L5oLFawCy5YoRQZcpfrbTu8DAIME2gQO2XOeS2EE1r
 EKC9tCmInnyOI3di4DoIKAja4wQmu69WrWD0rCyGyhmQCBcHNeMM1bwI8MmuVsM3Tvkw
 mLSwUiGue+TuBK3Qtdg3+Tj7+LFjJNRW7wdMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xggRvSFBLIaR/QgerZZVvbOSKVlz0ESTMXna4xv4wtg=;
 b=OLAKqcZ44fw3PDlb2SoJIxsHikTe3kHqyWyT/z2BBVris6/UsIfjkbEpGKjYZ0mHYD
 lKnjzYVUO9akt4UJaPixRkWk9if9M5dSExHz6TsMxMbQkN0+dWgQ8vDQOPg9FYlvDvuP
 Zh60yjKeZzQXviozpHPdpJ55IBQh4qLni9rWQG4dXhyxLCpg1aTWvD3BxpanR3sEqNrq
 bMdzUBkdq60K/yxHWdNVfTRuIkEUyxG08iU7dUFezVVe1uM/76qImKLk27V+rmOTYI0l
 jaqwXa73f1bcv90LBK8smuZhkCbwwEIdYe8uwRIi2u2gYxbpKkYtXoHJVr1/qYOnRD3c
 hfNw==
X-Gm-Message-State: AOAM53239K1jcyTU1sWaCHfLI4AoXCPmmvP2iN3heIZyyL0SsRmo/AvR
 GAC1kcmZbqhzQa7EwTEvTifczG/wGySuP9W3psOHWg==
X-Google-Smtp-Source: ABdhPJxXb5ggNakazw/zxkr1Byl+dRjKm1t+zcMS3ZHqR1oeZFsp8eaiJm2LiwP+6JZkaT4X64tlhWnCmUHgXa6JRlc=
X-Received: by 2002:a17:906:7cc9:: with SMTP id
 h9mr29329294ejp.111.1642688585288; 
 Thu, 20 Jan 2022 06:23:05 -0800 (PST)
MIME-Version: 1.0
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-6-narmstrong@baylibre.com>
In-Reply-To: <20220120083357.1541262-6-narmstrong@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 19:52:54 +0530
Message-ID: <CAMty3ZCrcQchnne1KU1RQA6MfwRQS8dObJQcOF_H7fEQ57wa0w@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/meson: add DSI encoder
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, martin.blumenstingl@googlemail.com, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_062308_856370_C3C2AC2C 
X-CRM114-Status: GOOD (  26.57  )
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

On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This adds an encoder bridge designed to drive a MIPI-DSI display
> by using the ENCL encoder through the internal MIPI DSI transceiver
> connected to the output of the ENCL pixel encoder.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/Makefile            |   2 +-
>  drivers/gpu/drm/meson/meson_drv.c         |   7 +
>  drivers/gpu/drm/meson/meson_encoder_dsi.c | 160 ++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_encoder_dsi.h |  12 ++
>  4 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.c
>  create mode 100644 drivers/gpu/drm/meson/meson_encoder_dsi.h
>
> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
> index 3afa31bdc950..833e18c20603 100644
> --- a/drivers/gpu/drm/meson/Makefile
> +++ b/drivers/gpu/drm/meson/Makefile
> @@ -2,7 +2,7 @@
>  meson-drm-y := meson_drv.o meson_plane.o meson_crtc.o meson_encoder_cvbs.o
>  meson-drm-y += meson_viu.o meson_vpp.o meson_venc.o meson_vclk.o meson_overlay.o
>  meson-drm-y += meson_rdma.o meson_osd_afbcd.o
> -meson-drm-y += meson_encoder_hdmi.o
> +meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>
>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 26aeaf0ab86e..15344cf9f913 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -33,6 +33,7 @@
>  #include "meson_registers.h"
>  #include "meson_encoder_cvbs.h"
>  #include "meson_encoder_hdmi.h"
> +#include "meson_encoder_dsi.h"
>  #include "meson_viu.h"
>  #include "meson_vpp.h"
>  #include "meson_rdma.h"
> @@ -323,6 +324,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>         if (ret)
>                 goto exit_afbcd;
>
> +       if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> +               ret = meson_encoder_dsi_init(priv);
> +               if (ret)
> +                       goto free_drm;
> +       }
> +
>         ret = meson_plane_create(priv);
>         if (ret)
>                 goto exit_afbcd;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> new file mode 100644
> index 000000000000..12a586316183
> --- /dev/null
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2016 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_graph.h>
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "meson_drv.h"
> +#include "meson_encoder_dsi.h"
> +#include "meson_registers.h"
> +#include "meson_venc.h"
> +#include "meson_vclk.h"
> +
> +struct meson_encoder_dsi {
> +       struct drm_encoder encoder;
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct meson_drm *priv;
> +};
> +
> +#define bridge_to_meson_encoder_dsi(x) \
> +       container_of(x, struct meson_encoder_dsi, bridge)
> +
> +static int meson_encoder_dsi_attach(struct drm_bridge *bridge,
> +                                   enum drm_bridge_attach_flags flags)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, encoder_dsi->next_bridge,
> +                                &encoder_dsi->bridge, flags);
> +}
> +
> +static void meson_encoder_dsi_mode_set(struct drm_bridge *bridge,
> +                                      const struct drm_display_mode *mode,
> +                                      const struct drm_display_mode *adjusted_mode)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = encoder_dsi->priv;
> +
> +       meson_vclk_setup(priv, MESON_VCLK_TARGET_DSI, mode->clock, 0, 0, 0, false);
> +
> +       meson_venc_mipi_dsi_mode_set(priv, mode);
> +       meson_encl_load_gamma(priv);
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(ENCL_VIDEO_MODE_ADV_VFIFO_EN, ENCL_VIDEO_MODE_ADV_VFIFO_EN,
> +                           priv->io_base + _REG(ENCL_VIDEO_MODE_ADV));
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_TST_EN));
> +}
> +
> +static void meson_encoder_dsi_atomic_enable(struct drm_bridge *bridge,
> +                                           struct drm_bridge_state *bridge_state)
> +{
> +       struct meson_encoder_dsi *encoder_dsi = bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = encoder_dsi->priv;
> +
> +       writel_bits_relaxed(BIT(0), 0, priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
> +
> +       writel_relaxed(1, priv->io_base + _REG(ENCL_VIDEO_EN));
> +}
> +
> +static void meson_encoder_dsi_atomic_disable(struct drm_bridge *bridge,
> +                                            struct drm_bridge_state *bridge_state)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi =
> +                                       bridge_to_meson_encoder_dsi(bridge);
> +       struct meson_drm *priv = meson_encoder_dsi->priv;
> +
> +       writel_relaxed(0, priv->io_base + _REG(ENCL_VIDEO_EN));
> +
> +       writel_bits_relaxed(BIT(0), BIT(0), priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
> +}
> +
> +static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
> +       .attach = meson_encoder_dsi_attach,
> +       /*
> +        * TOFIX: remove when dw-mipi-dsi moves out of mode_set
> +        * We should get rid of mode_set, but until dw-mipi-dsi uses it
> +        * we need to setup the pixel clock before the following
> +        * bridge tries to setup the HW.
> +        */
> +       .mode_set = meson_encoder_dsi_mode_set,
> +       .atomic_enable = meson_encoder_dsi_atomic_enable,
> +       .atomic_disable = meson_encoder_dsi_atomic_disable,
> +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +       .atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +int meson_encoder_dsi_init(struct meson_drm *priv)
> +{
> +       struct meson_encoder_dsi *meson_encoder_dsi;
> +       struct device_node *remote;
> +       int ret;
> +
> +       meson_encoder_dsi = devm_kzalloc(priv->dev, sizeof(*meson_encoder_dsi), GFP_KERNEL);
> +       if (!meson_encoder_dsi)
> +               return -ENOMEM;
> +
> +       /* DSI Transceiver Bridge */
> +       remote = of_graph_get_remote_node(priv->dev->of_node, 2, 0);
> +       if (!remote) {
> +               dev_err(priv->dev, "DSI transceiver device is disabled");
> +               return 0;
> +       }
> +
> +       meson_encoder_dsi->next_bridge = of_drm_find_bridge(remote);
> +       if (!meson_encoder_dsi->next_bridge) {
> +               dev_dbg(priv->dev, "Failed to find DSI transceiver bridge: %d\n", ret);
> +               return -EPROBE_DEFER;
> +       }
> +
> +       /* DSI Encoder Bridge */
> +       meson_encoder_dsi->bridge.funcs = &meson_encoder_dsi_bridge_funcs;
> +       meson_encoder_dsi->bridge.of_node = priv->dev->of_node;
> +       meson_encoder_dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +       drm_bridge_add(&meson_encoder_dsi->bridge);
> +
> +       meson_encoder_dsi->priv = priv;
> +
> +       /* Encoder */
> +       ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
> +                                     DRM_MODE_ENCODER_DSI);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to init DSI encoder: %d\n", ret);
> +               return ret;
> +       }
> +
> +       meson_encoder_dsi->encoder.possible_crtcs = BIT(0);
> +
> +       /* Attach DSI Encoder Bridge to Encoder */
> +       ret = drm_bridge_attach(&meson_encoder_dsi->encoder, &meson_encoder_dsi->bridge, NULL, 0);
> +       if (ret) {
> +               dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /*
> +        * We should have now in place:
> +        * encoder->[dsi encoder bridge]->[dw-mipi-dsi bridge]->[panel bridge]->[panel]
> +        */

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
