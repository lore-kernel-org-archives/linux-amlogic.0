Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEB8C4320A
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 09:16:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E620B60F42
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 09:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E620B60F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9nRS+HCuqxK8lJLbWChYvfBJd8MVpzgHoTdHhdKKhAI=; b=UxMejtZEm4uFqsQEqi5ZvZxjAl
	eOKpExNUUL47UtIJk3Gq7Ziu75gtC2pjPj+bPFYAe7R45az0c7V7AA2XC5MIsA4YiPjGZAeBzsbA7
	92XN6wsdLjsZgfsHIWeAkw1vqlPB/Y1bgKeXAeWHzBgK2/8i5yDJEJ0O99vSAHzer93MRsOXGSREJ
	j5bcly7uSUwKfm8TyI4dSHPbwKJ+BYhYaWWsqLhXr+YmTiv5O3eqbEsG7BLln4Re2ii9jfJ047QIb
	POTzvswAZOFNwgUDZg0AHmLjPOswT8ybxvPsm0pT4ILFZH5xklLQNbZqAgqzPRnEg3HQ2HqKSZ9R+
	5XSGA1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLip6-0093VG-Aq; Thu, 02 Sep 2021 09:15:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLiot-0093TQ-0O
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 09:15:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i3so763998wmq.3
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 02:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vg7ZILCVm0WdsNJvBlIPNdvE0ye3V6BoSn4aucYNsYo=;
 b=qx6i39KsnL1YOrTEyVFio/UqtD2QgLh0GGQl23rNMuoI5Nj6C1yPFhcvoaWilGSKrk
 kWGuXFYR4HWCLk7XlVd6jKK/NancaLBRWmjJKJXgrILY9e3UPSQE/qUEwibGRpGtPuzH
 7SoYYh65Yy2VbeX7+WXONmwTLfGnE/K1Ua/SrTILgEI8aWhQ8T8Mh17rvcumgSpb4Gr3
 t/uS4RLZ5/KeWRsYGCG+fOOU8PxIoN6k5nNVE2q9fcedrd3XGfqEi/s6T6gpmxY/6YYi
 0Vj3rS/kGH0AbAy3d7nqNhvKbDLyWg+MZIQr8FREbYKBUwlpg8TL8cGtjAcCn5Y4i6mD
 qWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vg7ZILCVm0WdsNJvBlIPNdvE0ye3V6BoSn4aucYNsYo=;
 b=NkvKSIYs3Tq7HAaq2GxgdRtTQBXJyUfo1GwYBtxACIlmwBk4fKp7eiMIrUQ55tdCaE
 4wNmVkQNgbSYqd5a4u+MhqRT8DkmNbwhrXExLPsxBEoHUF48TaNX8gYs61oZXJ6WKky+
 WRdz20P04HuPg4dGjvWbYYrCnFNo3cXCIBa3nnjZQzD6zCs6VZio9cyVTwVXbPeuzz/4
 /rEu+WYV6FRrN327UNIS0OYPL0+xTlI8vcZoyjWzAk0m1g4gEmEc7hOH/kve3dNMyv6T
 FiWH44nFprVPtmShYitSWtd7dx+1HnflYJIQ/mKKpKhr4SzlgkyeLkLhhrRbtNzOQtNY
 vfuA==
X-Gm-Message-State: AOAM532stsoGSv1CSRSZNTuOUFYIjL5G76VaXJHH+D92kE3MJ+khHXpV
 yrlD+kncA+ay+UWa0VlT0RftR3qn/t5Tp51L
X-Google-Smtp-Source: ABdhPJwfmc55TO0xRjie2C+BXLjFqLlXdgClBA9xOJkgqfYhXJeBZbLjk+pZkXtVtnHwraRH2m/78Q==
X-Received: by 2002:a1c:4a:: with SMTP id 71mr2113921wma.87.1630574135690;
 Thu, 02 Sep 2021 02:15:35 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:98:6312:3c8:6531?
 ([2001:861:44c0:66c0:98:6312:3c8:6531])
 by smtp.gmail.com with ESMTPSA id o12sm1112263wmr.2.2021.09.02.02.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 02:15:35 -0700 (PDT)
Subject: Re: [PATCH 2/5] drm/meson: Use common drm_fixed_16_16 helper
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko@sntech.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20210901175431.14060-1-alyssa@rosenzweig.io>
 <20210901175431.14060-2-alyssa@rosenzweig.io>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <32207beb-3d28-c858-4997-74725729e5a1@baylibre.com>
Date: Thu, 2 Sep 2021 11:15:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901175431.14060-2-alyssa@rosenzweig.io>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_021539_088721_75D447A5 
X-CRM114-Status: GOOD (  17.33  )
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

On 01/09/2021 19:54, Alyssa Rosenzweig wrote:
> Replace our open-coded FRAC_16_16 with the common drm_fixed_16_16
> helper to reduce code duplication between drivers.
> 
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: linux-amlogic@lists.infradead.org
> ---
>  drivers/gpu/drm/meson/meson_overlay.c | 7 +++----
>  drivers/gpu/drm/meson/meson_plane.c   | 5 ++---
>  2 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
> index dfef8afcc245..d8fc6bbb332f 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fixed.h>
>  
>  #include "meson_overlay.h"
>  #include "meson_registers.h"
> @@ -162,8 +163,6 @@ struct meson_overlay {
>  };
>  #define to_meson_overlay(x) container_of(x, struct meson_overlay, base)
>  
> -#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
> -
>  static int meson_overlay_atomic_check(struct drm_plane *plane,
>  				      struct drm_atomic_state *state)
>  {
> @@ -181,8 +180,8 @@ static int meson_overlay_atomic_check(struct drm_plane *plane,
>  
>  	return drm_atomic_helper_check_plane_state(new_plane_state,
>  						   crtc_state,
> -						   FRAC_16_16(1, 5),
> -						   FRAC_16_16(5, 1),
> +						   drm_fixed_16_16(1, 5),
> +						   drm_fixed_16_16(5, 1),
>  						   true, true);
>  }
>  
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 8640a8a8a469..4fae9ebbf178 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_fixed.h>
>  
>  #include "meson_plane.h"
>  #include "meson_registers.h"
> @@ -68,8 +69,6 @@ struct meson_plane {
>  };
>  #define to_meson_plane(x) container_of(x, struct meson_plane, base)
>  
> -#define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
> -
>  static int meson_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_atomic_state *state)
>  {
> @@ -92,7 +91,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  	 */
>  	return drm_atomic_helper_check_plane_state(new_plane_state,
>  						   crtc_state,
> -						   FRAC_16_16(1, 5),
> +						   drm_fixed_16_16(1, 5),
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   false, true);
>  }
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
