Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672C7C04A68
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DJRJt/LxId22XM3qUO/ezAZbx5GxyJW2yRzia/ItdVY=; b=v8WdMf9/5G7+DP
	2y72TIGr8Q4OV1AGib6hI5G+iIFSzUQJsLsmwtMV2/VNCUxaYHzbXTiYCjMUPKUMEoiK5Sc5hofbW
	3nWVFahsNr71IpNZGjXtFI30UskYmtWrTAxNnbniVaPaWF9sp1a8IcSIQfIt8EzE60PSYEWIJq/fn
	N9CrqOGoPkvjVbrUtW7VosEncqy21j4yikFEPH0bq2jZyI81d4bIz0OuJxBIuuA2q0VnvaEIzbxJC
	7rNVPMsQ1ROzNaXOXV6Uu6TbUi5MqkwwTdOVciLxt+OlssxdRJw36TaUrbPG6V/ulhnbKLJG9KJnu
	fqsv32cqFvsMpm+QSUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiaX-00GvUK-4h; Sat, 30 Jul 2022 09:16:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiaB-00GvFD-S1; Sat, 30 Jul 2022 09:16:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z22so8299548edd.6;
        Sat, 30 Jul 2022 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
        b=ODVq1f1/LK9nGxTfjwXO4ssEzwk81G34edDpsOIHpHTuvnSmZevpPG/84UYDkXBv8U
         CLgbMgUZM8dS1bS1AyLYl9eEjgXp3UpwCxBos92t40mUCmBL3QUrK5RfTtU0vwM/AzDe
         gmM98LP8su2vSEdNxfnnqf5nFNmj1zOGilWCgwL/9zXisxjzzlMldbxrv42qo7OKN4nN
         27y9j7VR8dYZ9tQS/gG1Z4hMSlz1BdNwI7wotbL/IkpHLM3nNYdF72nwzeGiuQZSM/0c
         J5AvjWooDFx+mBcmo+4oeRfdmWr2nWcGaUn/UAI5dUv0Ma/OVWJCC+ckBWsKfufFtS+7
         xQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ikzYAjzqfaF+a4GkobxDatu0soZrTXVKMloqR9b6tU=;
        b=4MU4HG4mYJA7v6TMXCWonWqD1WUR3RL2+eavyOv+mrBM3W/3oBILzD+t8nxV5Rz6fR
         o6oBWzomGw0DC2uME5uy3ZPohsioibDCQDGrMXDypqvnrRacCBaZXRy6P7Uz0u6GL0JL
         Rbv292BxMZszDA21m3V7lXtLmlrXgMUvvzFZJYGM7U51YWLTTZXgbjeB0YOtwVcE9ezu
         2H4HTwobBHU3ldzn+5gV+Lq8lYprn8RVVcFHIRDRa+IrMgfVWhtvSqDoZ/v2pS65ecRz
         EWR2lHbRTzxPOo9c9zNao2VeEEl6Yw4xQ15q1AFEAZipcxJMVrdKmIDbtf4ftN5wtz6Y
         B4qQ==
X-Gm-Message-State: AJIora/D45dBeRvv4Rnb/55ScKi35fs42b1sKcOZ5oqpaaeqfqjXRvYz
	e08M6Y6HlPydWm4bsAAdw3U=
X-Google-Smtp-Source: AGRyM1vwibvRhtEPZaZcnZE0I3sovCWh/d2MGizGNAj8LqkgAI7GjPSEvzFNhCBH1UWn2jszQI2xYA==
X-Received: by 2002:a05:6402:40d2:b0:43c:5a4d:c3b4 with SMTP id z18-20020a05640240d200b0043c5a4dc3b4mr7329019edb.95.1659172585551;
        Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id p24-20020a17090653d800b0073045f26d41sm676395ejo.72.2022.07.30.02.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:16:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 31/35] drm/sun4i: tv: Add missing reset assertion
Date: Sat, 30 Jul 2022 11:16:23 +0200
Message-ID: <1822091.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-31-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021627_937409_159A212C 
X-CRM114-Status: GOOD (  10.75  )
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

Dne petek, 29. julij 2022 ob 18:35:14 CEST je Maxime Ripard napisal(a):
> The reset line is deasserted at bind, and asserted if we ever encounter an
> error there. However, it's never deasserted in unbind which will lead to a

s/deasserted/asserted/

Once fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> resource unbalance.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index ad6a3739bfa9..74ff5ad6a8b9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -605,6 +605,7 @@ static void sun4i_tv_unbind(struct device *dev, struct
> device *master, drm_connector_cleanup(&tv->connector);
>  	drm_encoder_cleanup(&tv->encoder);
>  	clk_disable_unprepare(tv->clk);
> +	reset_control_assert(tv->reset);
>  }
> 
>  static const struct component_ops sun4i_tv_ops = {





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
