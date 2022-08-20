Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BC0C25B08
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Aug 2022 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ffgyk6tr43NWbFZRknXHPNoS6rd2eHIxHX2pcXGT0Y=; b=BkQWxbHSx3LTUP
	XhQe0n716SoF4B+idhIQw70JpJHaEvKv62xjmbBpSEcVquuCavuDEDe7PRagMdRs3MxRXvafjsLZk
	9U2p0E/JMOtCnrXO1xKOr2Ex/fBreeqp9L8Y1Zh1U1NYtxnL3l73uAcrKnw15IDlgn7J3Wor/zV41
	WFf7KY/SrG7QsxdRF89NDyPtv9AcfXfDTzd3Voe8Ix091LT4cIGlDI/aK6BRdIbORrefEkWcfB9z0
	bWwDB6keinOiHQX/DzCtAO2eU/FG97jx8K2KmFIh4X+mY+rfXNaZ42wCb1c3naTB7EpnO2NyMr/ub
	vlVBXQ2EyiQjPhbBBVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSBp-00BEkr-IS; Sat, 20 Aug 2022 17:23:17 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSBd-00BEfy-Re; Sat, 20 Aug 2022 17:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8BklGePlOGzlIbyB2AgDUWEPfUhqmEkqZKMYHVCAb3o=; b=N/8vyFTCNC0NQfLmopwfofzrMI
	cxEchZwTKKEv3rOttPBJkoH3/az9oOr+CeJG2ofTnEKJBK4cTDNGj+5xWzB2Sp2I8HmKkoHZhMe6M
	sbw5MdTw7QL2H6KTDimKuwPJsfTQM4vgCYA6U0HJdmnjP5gno5KQdcwR+uCvarfxd1kBAI1ydLdn6
	O+uKEhq+KmwB0qKN+WjHHZxzCS4Gnp4j4HuHKP4AO4y/cZUwXAqi8Y4LjrpE8fmjtNRfZxAsoKwOF
	L6c/nh1rdlDkw/ecDnLLBpRKG29oFbgNu/ilORvV+04iF7sdVDASM0SPQo9bW+jHsIKt1nvxVJuKp
	KjU9Fxqg==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=55975)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oPSBU-0001ci-DT; Sat, 20 Aug 2022 19:22:56 +0200
Message-ID: <0255f7c6-0484-6456-350d-cf24f3fee5d6@tronnes.org>
Date: Sat, 20 Aug 2022 19:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 23/35] drm/vc4: vec: Convert to the new TV mode
 property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dom Cobley <dom@raspberrypi.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-23-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-23-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_102305_964972_248839AE 
X-CRM114-Status: GOOD (  11.71  )
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



Den 29.07.2022 18.35, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the vc4
> VEC driver to leverage those new features.
> 
> We've added some backward compatibility to support the old TV mode property
> and translate it into the new TV norm property.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c

>  static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct drm_connector_state *state = connector->state;
>  	struct drm_display_mode *mode;
>  
> -	mode = drm_mode_duplicate(connector->dev,
> -				  vc4_vec_tv_modes[state->tv.mode].mode);
> +	mode = drm_mode_duplicate(connector->dev, &drm_mode_480i);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
> +	}
> +
> +	drm_mode_probed_add(connector, mode);
> +
> +	mode = drm_mode_duplicate(connector->dev, &drm_mode_576i);

Maybe the mode that matches tv.norm should be marked as preferred so
userspace knows which one to pick?

Noralf.

>  	if (!mode) {
>  		DRM_ERROR("Failed to create a new display mode\n");
>  		return -ENOMEM;
> @@ -277,21 +313,95 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
>  	return 1;
>  }

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
