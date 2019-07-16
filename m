Return-Path: <SRS0=7EgU=VN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C275C76188
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2019 14:03:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E15A320880
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2019 14:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TybVXVxq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxQDQOM0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E15A320880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TWzKePfJevBGpXyniSlWE/+k1j4WmFV17lkVHB67Bo=; b=TybVXVxqbu/SBB
	uMMMHkttCnvIqTdguCFsjY0dr2eOmMkjk5Fqog9OqD0GQKTogGWcKCDcZJzZgkfp5OUPJsHAnHiuy
	6TR8RK2IBctkkhhqYa/bGqXNBmhbhjf+2oppAj24ghAdMgLFhOgGmUSB0NjshScGZSbgypBVH7viX
	UAnTSNoJ7izjADFmY8H0pDsBlO8K5e282IQweS6W16VUBV0qb8zeKqfr/kCUldiRg10dlQ62V6bT0
	i9kdCXsWyjMlx7MBqbZpo+xPZYlrPqXW/p7Bb29Ph5tZ+p2P/SekfDjG21LaTYY6py9fsZxd8drf5
	GSellwhUiIB/qDhOXHqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnO3R-00066r-Od; Tue, 16 Jul 2019 14:03:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnO3L-000622-Vm; Tue, 16 Jul 2019 14:03:39 +0000
Received: by mail-wr1-x443.google.com with SMTP id g17so21109825wrr.5;
 Tue, 16 Jul 2019 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=egNdOOP6KVgyEzt1FouAmKCcGnnd1K3UxZVF8r1p0Ak=;
 b=VxQDQOM0shhUpgnt4pdjhLTCEhIlAc5Gr5m3xlULq8R7NzwESkJAY5B1lga5gzr0kS
 JKi9XDy0U0w1IoMpqFTTSgqsvbaFehi6iex8hgz++BRJC4CVhxxWbh1+vYLK9+tSd52U
 Y7NhScpkqPiyxZ8pJ2zfckMi/7fpGb4EhKISX36wgbR20DADKcxDDzlX+MYy/7hTDELX
 OhIfoEL6DH42pps9drdUqM65LlzK90iJO6/jDkgmyjXVrwlv+Tfgl4pQpXe1aU1JsJ5h
 Q5OhA9rJEbEcyF9C6N/oLI+FSYr2hPcP+5tq+KHA8c1fKDzuW4XAVUUJA+lfG6z1Oo6Z
 y5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egNdOOP6KVgyEzt1FouAmKCcGnnd1K3UxZVF8r1p0Ak=;
 b=JY2xeXmj641Qp1qB4BK2vna9IDIA6RU1vQ40eBgtPY1MbOEQPe91z63F6cdSmfZHdP
 gCT4e3n1JZQ60RUCqFMHV6sHW6FujKVP/1n5BZZ3nkZcM/ifpv+g/LbilFVSp6IJJFqU
 VdBdidzpHu0WMwgFtY2yZ4MkEXf5doFxpaojcorufBB9NElJR1EtY8l9B4WdCf9cm3yo
 9hFOFYExiSn+ZE51yVKPrVv0M53N+EYoEMNR5hRfzSi5Jez21Hsvp0IDOeR2+A3aPoFi
 vGeE1bn7bOFydS1xiLjKvvzllA8cx1bMTQtWIrH5Lx/seQQ5bOS4dTaimjOAaDdrCCIj
 Jleg==
X-Gm-Message-State: APjAAAUXqgPXfHzCzEJsh2Cs73cyXMTTVTV8KAhXgXnil7jZmZO/Ue5D
 sfTnrJ/khRHNf5vjLLwB1UqRxCPHKCwDgN9tw1c=
X-Google-Smtp-Source: APXvYqyKixBc0KQl1v4nl4cLG+ubR3W9+NIYZbU2n3iJ78jU5IAAdilB+B/q+a6xcYT7J5YC7qnO/2TwcA2JNOLBkc0=
X-Received: by 2002:adf:f94a:: with SMTP id q10mr16288485wrr.341.1563285814159; 
 Tue, 16 Jul 2019 07:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190716064220.18157-1-sam@ravnborg.org>
 <20190716064220.18157-2-sam@ravnborg.org>
In-Reply-To: <20190716064220.18157-2-sam@ravnborg.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jul 2019 10:03:21 -0400
Message-ID: <CADnq5_PD+88gd8fBaLDaOcKecYo8qaagU_WJs4bv+_3s+d0bZQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] drm/meson: drop use of drmP.h
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190716_070336_666431_398C98D1 
X-CRM114-Status: GOOD (  13.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jul 16, 2019 at 2:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Drop use of the deprecated drmP.h header.
> While doing so used the opportunity
> to clean up a little so includes are now
> sorted and removed unused include files.
> In a few cases added some forwards to allow header
> files to built in different include order.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Emil Velikov <emil.velikov@collabora.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Maxime Jourdan <mjourdan@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/meson/meson_crtc.c       | 16 ++++++--------
>  drivers/gpu/drm/meson/meson_drv.c        | 27 ++++++++++--------------
>  drivers/gpu/drm/meson/meson_drv.h        | 11 ++++++----
>  drivers/gpu/drm/meson/meson_dw_hdmi.c    | 19 +++++++++--------
>  drivers/gpu/drm/meson/meson_overlay.c    | 13 +++++-------
>  drivers/gpu/drm/meson/meson_plane.c      | 16 ++++++--------
>  drivers/gpu/drm/meson/meson_registers.h  |  2 ++
>  drivers/gpu/drm/meson/meson_vclk.c       |  7 +++---
>  drivers/gpu/drm/meson/meson_vclk.h       |  4 ++++
>  drivers/gpu/drm/meson/meson_venc.c       | 10 ++++-----
>  drivers/gpu/drm/meson/meson_venc.h       |  2 ++
>  drivers/gpu/drm/meson/meson_venc_cvbs.c  | 11 +++++-----
>  drivers/gpu/drm/meson/meson_viu.c        |  7 ++----
>  drivers/gpu/drm/meson/meson_vpp.c        |  7 +++---
>  drivers/gpu/drm/meson/meson_vpp.h        |  3 +++
>  include/linux/soc/amlogic/meson-canvas.h |  1 +
>  16 files changed, 77 insertions(+), 79 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
> index aa8ea107524e..3320a74e67fa 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -9,23 +9,21 @@
>   *     Jasper St. Pierre <jstpierre@mecheye.net>
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/platform_device.h>
>  #include <linux/bitfield.h>
> -#include <drm/drmP.h>
> -#include <drm/drm_atomic.h>
> +#include <linux/soc/amlogic/meson-canvas.h>
> +
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_flip_work.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_vblank.h>
>
>  #include "meson_crtc.h"
>  #include "meson_plane.h"
> +#include "meson_registers.h"
>  #include "meson_venc.h"
> -#include "meson_vpp.h"
>  #include "meson_viu.h"
> -#include "meson_registers.h"
> +#include "meson_vpp.h"
>
>  #define MESON_G12A_VIU_OFFSET  0x5ec0
>
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 37dca83d6eb1..42af49afdd75 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -8,35 +8,30 @@
>   *     Jasper St. Pierre <jstpierre@mecheye.net>
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/platform_device.h>
>  #include <linux/component.h>
> +#include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/soc/amlogic/meson-canvas.h>
>
> -#include <drm/drmP.h>
> -#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
> -#include <drm/drm_flip_work.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_plane_helper.h>
> +#include <drm/drm_irq.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_rect.h>
> +#include <drm/drm_vblank.h>
>
> +#include "meson_crtc.h"
>  #include "meson_drv.h"
> -#include "meson_plane.h"
>  #include "meson_overlay.h"
> -#include "meson_crtc.h"
> +#include "meson_plane.h"
> +#include "meson_registers.h"
>  #include "meson_venc_cvbs.h"
> -
> -#include "meson_vpp.h"
>  #include "meson_viu.h"
> -#include "meson_venc.h"
> -#include "meson_registers.h"
> +#include "meson_vpp.h"
>
>  #define DRIVER_NAME "meson"
>  #define DRIVER_DESC "Amlogic Meson DRM driver"
> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
> index 7b6593f33dfe..c9aaec1a846e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -7,11 +7,14 @@
>  #ifndef __MESON_DRV_H
>  #define __MESON_DRV_H
>
> -#include <linux/platform_device.h>
> -#include <linux/regmap.h>
> +#include <linux/device.h>
>  #include <linux/of.h>
> -#include <linux/soc/amlogic/meson-canvas.h>
> -#include <drm/drmP.h>
> +#include <linux/regmap.h>
> +
> +struct drm_crtc;
> +struct drm_device;
> +struct drm_plane;
> +struct meson_drm;
>
>  struct meson_drm {
>         struct device *dev;
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index df3f9ddd2234..9f0b08eaf003 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -5,29 +5,30 @@
>   * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>   */
>
> +#include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/component.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> -#include <linux/reset.h>
> -#include <linux/clk.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>
> -#include <drm/drmP.h>
> +#include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_print.h>
>
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
>
>  #include "meson_drv.h"
> -#include "meson_venc.h"
> -#include "meson_vclk.h"
>  #include "meson_dw_hdmi.h"
>  #include "meson_registers.h"
> +#include "meson_vclk.h"
> +#include "meson_venc.h"
>
>  #define DRIVER_NAME "meson-dw-hdmi"
>  #define DRIVER_DESC "Amlogic Meson HDMI-TX DRM driver"
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index cc7c6ae3013d..5aa9dcb4b35e 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -5,24 +5,21 @@
>   * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
>  #include <linux/bitfield.h>
> -#include <linux/platform_device.h>
> -#include <drm/drmP.h>
> +
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_rect.h>
>
>  #include "meson_overlay.h"
> -#include "meson_vpp.h"
> -#include "meson_viu.h"
>  #include "meson_registers.h"
> +#include "meson_viu.h"
> +#include "meson_vpp.h"
>
>  /* VD1_IF0_GEN_REG */
>  #define VD_URGENT_CHROMA               BIT(28)
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 7a7e88dadd0b..80b8d70c4d75 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -9,24 +9,20 @@
>   *     Jasper St. Pierre <jstpierre@mecheye.net>
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
>  #include <linux/bitfield.h>
> -#include <linux/platform_device.h>
> -#include <drm/drmP.h>
> +
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_plane_helper.h>
> -#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_rect.h>
> +#include <drm/drm_plane_helper.h>
>
>  #include "meson_plane.h"
> -#include "meson_vpp.h"
> -#include "meson_viu.h"
>  #include "meson_registers.h"
> +#include "meson_viu.h"
>
>  /* OSD_SCI_WH_M1 */
>  #define SCI_WH_M1_W(w)                 FIELD_PREP(GENMASK(28, 16), w)
> diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
> index 410e324d6f93..057453ce027c 100644
> --- a/drivers/gpu/drm/meson/meson_registers.h
> +++ b/drivers/gpu/drm/meson/meson_registers.h
> @@ -6,6 +6,8 @@
>  #ifndef __MESON_REGISTERS_H
>  #define __MESON_REGISTERS_H
>
> +#include <linux/io.h>
> +
>  /* Shift all registers by 2 */
>  #define _REG(reg)      ((reg) << 2)
>
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 26732f038d19..8abff51f937d 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -5,9 +5,10 @@
>   * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <drm/drmP.h>
> +#include <linux/export.h>
> +
> +#include <drm/drm_print.h>
> +
>  #include "meson_drv.h"
>  #include "meson_vclk.h"
>
> diff --git a/drivers/gpu/drm/meson/meson_vclk.h b/drivers/gpu/drm/meson/meson_vclk.h
> index ed993d20abda..b62125540aef 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.h
> +++ b/drivers/gpu/drm/meson/meson_vclk.h
> @@ -9,6 +9,10 @@
>  #ifndef __MESON_VCLK_H
>  #define __MESON_VCLK_H
>
> +#include <drm/drm_modes.h>
> +
> +struct meson_drm;
> +
>  enum {
>         MESON_VCLK_TARGET_CVBS = 0,
>         MESON_VCLK_TARGET_HDMI = 1,
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 7b7a0d8d737c..3d4791798ae0 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -5,14 +5,14 @@
>   * Copyright (C) 2015 Amlogic, Inc. All rights reserved.
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <drm/drmP.h>
> +#include <linux/export.h>
> +
> +#include <drm/drm_modes.h>
> +
>  #include "meson_drv.h"
> +#include "meson_registers.h"
>  #include "meson_venc.h"
>  #include "meson_vpp.h"
> -#include "meson_vclk.h"
> -#include "meson_registers.h"
>
>  /**
>   * DOC: Video Encoder
> diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
> index 985642a1678e..576768bdd08d 100644
> --- a/drivers/gpu/drm/meson/meson_venc.h
> +++ b/drivers/gpu/drm/meson/meson_venc.h
> @@ -14,6 +14,8 @@
>  #ifndef __MESON_VENC_H
>  #define __MESON_VENC_H
>
> +struct drm_display_mode;
> +
>  enum {
>         MESON_VENC_MODE_NONE = 0,
>         MESON_VENC_MODE_CVBS_PAL,
> diff --git a/drivers/gpu/drm/meson/meson_venc_cvbs.c b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> index 6313a519f257..45a467f10b9b 100644
> --- a/drivers/gpu/drm/meson/meson_venc_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_venc_cvbs.c
> @@ -9,19 +9,18 @@
>   *     Jasper St. Pierre <jstpierre@mecheye.net>
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> +#include <linux/export.h>
>  #include <linux/of_graph.h>
>
> -#include <drm/drmP.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_device.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_print.h>
>
> -#include "meson_venc_cvbs.h"
> -#include "meson_venc.h"
> -#include "meson_vclk.h"
>  #include "meson_registers.h"
> +#include "meson_vclk.h"
> +#include "meson_venc_cvbs.h"
>
>  /* HHI VDAC Registers */
>  #define HHI_VDAC_CNTL0         0x2F4 /* 0xbd offset in data sheet */
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 4b2b3024d371..9f8a450d50d5 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -6,13 +6,10 @@
>   * Copyright (C) 2014 Endless Mobile
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <drm/drmP.h>
> +#include <linux/export.h>
> +
>  #include "meson_drv.h"
>  #include "meson_viu.h"
> -#include "meson_vpp.h"
> -#include "meson_venc.h"
>  #include "meson_registers.h"
>
>  /**
> diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
> index bfee30fa6e34..cbe6cf46e541 100644
> --- a/drivers/gpu/drm/meson/meson_vpp.c
> +++ b/drivers/gpu/drm/meson/meson_vpp.c
> @@ -6,12 +6,11 @@
>   * Copyright (C) 2014 Endless Mobile
>   */
>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <drm/drmP.h>
> +#include <linux/export.h>
> +
>  #include "meson_drv.h"
> -#include "meson_vpp.h"
>  #include "meson_registers.h"
> +#include "meson_vpp.h"
>
>  /**
>   * DOC: Video Post Processing
> diff --git a/drivers/gpu/drm/meson/meson_vpp.h b/drivers/gpu/drm/meson/meson_vpp.h
> index 9fc82db8a12d..afc9553ed8d3 100644
> --- a/drivers/gpu/drm/meson/meson_vpp.h
> +++ b/drivers/gpu/drm/meson/meson_vpp.h
> @@ -9,6 +9,9 @@
>  #ifndef __MESON_VPP_H
>  #define __MESON_VPP_H
>
> +struct drm_rect;
> +struct meson_drm;
> +
>  /* Mux VIU/VPP to ENCI */
>  #define MESON_VIU_VPP_MUX_ENCI 0x5
>  /* Mux VIU/VPP to ENCP */
> diff --git a/include/linux/soc/amlogic/meson-canvas.h b/include/linux/soc/amlogic/meson-canvas.h
> index b4dde2fbeb3f..0cb2a6050d1f 100644
> --- a/include/linux/soc/amlogic/meson-canvas.h
> +++ b/include/linux/soc/amlogic/meson-canvas.h
> @@ -20,6 +20,7 @@
>  #define MESON_CANVAS_ENDIAN_SWAP64     0x7
>  #define MESON_CANVAS_ENDIAN_SWAP128    0xf
>
> +struct device;
>  struct meson_canvas;
>
>  /**
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
