Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6DCECAAD5
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 Aug 2022 17:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULGmX0E0x5n7HLs5VpchH/d6al4jg8GLAAYKd7njThk=; b=zTsvfkCp/r+lKI
	za1byJ4VDjgWktFtpNxlH4v8sp5gnpM6mUaifrKvl7Qt2CDvihKh/CqIinRQqjs/g5Fk96i86Adiv
	ycEr21qFuXziKsUL9AJO3WV7ioaxm2K171HHXtfrAWsCMnBFgRpyPX37YJPwsdLrLWhdTLTowibug
	dj6NKFvxFooARzZkizN3hRpK7jHjQmwyA0thX1m8oNxFFKNAdNAT9ETMSuQkjtOaeKXavpijqgDah
	Spg5ZxlhnjTYAz8+8n8DhYzA8u6StOh6plICgHmJU6TxpczADjsGqEjcAjtFW7uc95b1fB31IeO9Q
	BPjgZp+sPJO+bcZCfbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSM49-000oNZ-2S; Sun, 28 Aug 2022 17:27:21 +0000
Received: from smtp.domeneshop.no ([2a01:5b40:0:3005::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSLpa-000jaq-4P; Sun, 28 Aug 2022 17:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hUHwNV0Eqbp5+kyWPg3hdOExuH1sZ2s4LMJ069EmR+Q=; b=o7UwfkwgYp36t92og3iHfkSouB
	YESi0tfVO5wQICewKkSIRbnr2KQipFWbED5nxDMlPC6qob1lkztp3GWsGFlwmo57QQBexIlYLG5QA
	0N1jODHJj2leBFYzx8UPKqX7Z4Anid1HmiyoYemZSvmN1c91xkAfeNNe7XImj/sm5cH680dxftoNP
	o6B3Qx4dYIa1MEyo+dCXkTnJoat7p46foI6y5CJaeHVq8jgEl0xLshfAP7yf4PwFRWFZPTKR9U/WH
	k/qJOtNdlEV2tqDF0EFUFOZsGDHd58w18s33QoT3CDvL7rsKMHZmGvGIT8EWk7DLfdVADiXHqLwu/
	mD0kle2g==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=60629)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1oSLpX-000560-9b; Sun, 28 Aug 2022 19:12:15 +0200
Message-ID: <011bcfa3-b655-0851-cfd4-560504efd8b1@tronnes.org>
Date: Sun, 28 Aug 2022 19:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 32/35] drm/sun4i: tv: Convert to the new TV mode
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
 <20220728-rpi-analog-tv-properties-v1-32-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-32-3d53ae722097@cerno.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_101220_604638_0F9215A4 
X-CRM114-Status: GOOD (  10.13  )
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
> Now that the core can deal fine with analog TV modes, let's convert the
> sun4i TV driver to leverage those new features.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c
> index 74ff5ad6a8b9..bed52423776e 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c

> @@ -586,8 +524,17 @@ static int sun4i_tv_bind(struct device *dev, struct device *master,
>  
>  	drm_connector_attach_encoder(&tv->connector, &tv->encoder);
>  
> +	ret = drm_mode_create_tv_properties(drm,
> +					    DRM_MODE_TV_NORM_NTSC_M |
> +					    DRM_MODE_TV_NORM_PAL_B,
> +					    0, NULL);
> +	if (ret)
> +		goto err_cleanup_connector;
> +

Looks like you have forgotten to attach the property?

Noralf.

>  	return 0;
>  
> +err_cleanup_connector:
> +	drm_connector_cleanup(&tv->connector);
>  err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
