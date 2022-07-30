Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0394EC04A68
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZeLqkToKEtAlA5eIKm1hdGFoP2GvKXkNWcCQ/f7hd8=; b=qKlp8huJu7/dhM
	9kWqAYyeo8c80XnuDYyPPl29dg7oPkt7i9S4iUKcEtEGHv6x0baylGdsnJ84CsWXmVGH0Fw/2HDKI
	8VMWYGkoNBbhesKJzwvSMFIHzxRq1smIMbq/CyRNUg8tWECoEaTtS/gNZiKwGfkxn1ztuH6vP7bQu
	8JaTVgWa1hGwK9ny8t/SXRGMOxUVMThk+LfcCdCiEw8PQ8FlsgIjMaArbboD0Sv5v0RPRaJc6LdRz
	7OaFGCZOq7eYcZhfPKKLtgLpvvJ7Fa2VGY5/WfCM6Lm/rca3Gi/A6GMOfnP8jsE+rET2LoSduqBY4
	H9nrorUsAsKdMSbgXAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiXD-00Gtan-RI; Sat, 30 Jul 2022 09:13:23 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiX0-00GtRW-AE; Sat, 30 Jul 2022 09:13:11 +0000
Received: by mail-ej1-x632.google.com with SMTP id gk3so77597ejb.8;
        Sat, 30 Jul 2022 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F8fhUxE3x4wOe3m4a14najZDDA734PpdZ0zvY9IBgdA=;
        b=ZG2IrV2r1EWLt75BM97iRoI2Fc0pagt70o4R2poxmBf1kaPFF05otKfuGf7gXtlNu+
         /dCPH7viH0STK8OcySYRw+QBBy73BSHjr+CT0al1b+vpb2imlIe74RmeRrf9pQqUJaH5
         TmBS8LD7rue5YdqAeAFvd+htM27uzgkRJKkN/kfIiTlXZVxmf1bjlsTP2BM0P0T1kNv7
         XoxF9QpD+8/TlHICB89Z2XN/1dNWdNao5r8EoIVdL+YOvRB+TDYnU99NpmticLyjn5B1
         8h1LYPxQE/lZczOWieZs/hZZCk2VgzErcnMC5xg6qLsBux25HfhSNtlgrJRdhFhQT/L2
         aydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F8fhUxE3x4wOe3m4a14najZDDA734PpdZ0zvY9IBgdA=;
        b=C1a/ZHzShjjAzMzZGBAv1uWl0IvYPNpx9HXI+7vM13yhFjDXf5oFtopOG3+/cS1CeI
         vFtw7/syW6uQiIcgb3zPGhSAyCX/++a2HiJSaxflCwLDIEFLVwhH9x8ucVy0eBHTc/VD
         JuSDYfn/eBeTHVWUprUTH7gc473XUAxrFyXRZbGuRtd1bkbtqh31BBY4u6p0fBW42F+x
         Xj0HKECY5yiX/5KnlePfUV7jB8l3Zyrfc2BvM/F3Qh5jwvCS3wl4OgbVGHFfP0l6MEhS
         zl+tDUyW96qSKD/Op3+G2S9z49PTK9XETbGP3/NtwkUNrEy7jxO3LLZ4UegQVy23qzB1
         QdSA==
X-Gm-Message-State: AJIora92l0nUrEIth9WDfyjSSR3+XT0onXFWxkxrMeOTsJrJ+pkQxrW3
	h0JUOnypPzdK2rdTJzItp+o=
X-Google-Smtp-Source: AGRyM1vnGZx3SWdOvFK05YcUTuAQpbJMQBq6meu894/eIUroxXOHiUFMsPL5aHg++vyEFuUAzaEVrw==
X-Received: by 2002:a17:907:948e:b0:72d:3fd2:5da0 with SMTP id dm14-20020a170907948e00b0072d3fd25da0mr5613928ejc.225.1659172387794;
        Sat, 30 Jul 2022 02:13:07 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id j10-20020a17090623ea00b0072b616ade26sm1344215ejg.216.2022.07.30.02.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:13:07 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 25/35] drm/sun4i: tv: Remove unused mode_valid
Date: Sat, 30 Jul 2022 11:13:05 +0200
Message-ID: <5587265.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-25-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-25-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021310_398002_449803FF 
X-CRM114-Status: GOOD (  12.21  )
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

Dne petek, 29. julij 2022 ob 18:35:08 CEST je Maxime Ripard napisal(a):
> The mode_valid implementation is pretty much a nop, let's remove it.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 94883abe0dfd..53152d77c392 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -497,16 +497,8 @@ static int sun4i_tv_comp_get_modes(struct drm_connector
> *connector) return i;
>  }
> 
> -static int sun4i_tv_comp_mode_valid(struct drm_connector *connector,
> -				    struct drm_display_mode 
*mode)
> -{
> -	/* TODO */
> -	return MODE_OK;
> -}
> -
>  static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_funcs = { .get_modes	=
> sun4i_tv_comp_get_modes,
> -	.mode_valid	= sun4i_tv_comp_mode_valid,
>  };
> 
>  static void





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
