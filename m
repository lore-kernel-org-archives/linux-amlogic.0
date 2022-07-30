Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFD3C19F29
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Jul 2022 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T41zdWnZrb5Vl6iOabZ96LLii9mU5GORp4hT1Rk6NBc=; b=KHnQsPNQvgamlG
	YZcOoiCN2QFIrd7NBrRnR5s5mHJ4JP+2IvlOjM9V0cvRxhwspOFX5XLPvoynTTbgARauRkaf8snFU
	FXFtXd11UO82lGL+cwx13aNFeCV4IVuabDPwzsmsDhk+rAb+BGRgzOZO4hrE0ZLJATCBZxvKWGfBY
	fVvTAEe5bbIz30kSgBd/zdbtCaWLRJkjIWlnFI7OaU813n70nF80lyHXTX4q3BM5RUDBmlFqR84pk
	t9HfoxuI/hkNAosczN2ySRIOvx3VWLSW7oEIDpPRPh7LD5PEDj2gEpEPwa2NcPvVKX/khFWKyoUqj
	JkMIpizz5YeVvLtaCHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiYo-00GuLD-4G; Sat, 30 Jul 2022 09:15:02 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHiYZ-00GuEQ-Vn; Sat, 30 Jul 2022 09:14:49 +0000
Received: by mail-ej1-x62f.google.com with SMTP id os14so12179970ejb.4;
        Sat, 30 Jul 2022 02:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
        b=I463grYfVol0JRUlt+Ar+SpcJUB4ZO9pNGMk3/6nbERWzXNnIlibdYQ9cGLRUwcdn0
         7fPs1V3TsdNGHjKKB5BGN45EUyF7Wugi7wwhUJ/7OxSNvgtsEo1A8biJVgtzfbXFqgfK
         I2oOZ6oRwBoo7JEE1aAnCwt43GepXKPWGHhnUmmM6ZV+wrcdgIu5wwhgd1X934R+b+PS
         N+pb9eFkY8TnaObP8ZIpEJwsPFxFwSNi9+uy+Ucj9ofrw7BTQe8qYLQRsn56BEQmQhkc
         4Rl8DvXCRHTHsdydiNGH8CZ0PJtM3lIFi7IlIKiKUDGDHkYi4jP9KdDTDjAxBLxSVhck
         XRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+7O6hms/hqLnG44y9CuXX+hyQPYHHY40QX+YQRZrcQ=;
        b=YYTUUspaULPdtkwdvJQv+NhFypzlH668bUAyaojHxMmMqwlbkobnuZkH6u+JcCYeHu
         KC7CdWXpuW5ZDRzfhC5MVpqG3NqzBZTFOnYqvn3QQN8HXpSdYR0Lzac2ijCy9FwO6cXs
         /LYXOMMrHl6W3kdMZExH+z968lxPVWKrYm9gfPFN2eM0TkqrVpLxT9DlyPWTBPh48Z+/
         /vCv6IeubLoIZ2x+O/hH4e0pmvf5EqLRsCPAX3Me1DuFm71E5oBf8yO7QUcdymuWyYwq
         9X0COpO0XqHQHT7OayEayeOcS56jjmY2SMPoEY420BSyX1gwOakmukbDUA9JWke1y0YB
         ZK2Q==
X-Gm-Message-State: ACgBeo0/JhuK4m22skyZHVAFIdvtTwyF8ydKld0aRQ/mp12y5ydY2Tmw
	rgAkBwBfnGi/EQropCSJYGs=
X-Google-Smtp-Source: AA6agR4VYJrXZiOXIvhb8G1HuoD3AuMr4cbsju8RIBJv//kfsMPN/cLW/Y0CDv/M1HP7A2m0gTyCfw==
X-Received: by 2002:a17:907:75f7:b0:730:5b01:56b0 with SMTP id jz23-20020a17090775f700b007305b0156b0mr145624ejc.689.1659172485555;
        Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net. [194.152.27.124])
        by smtp.gmail.com with ESMTPSA id p3-20020a17090653c300b00730223dc5c0sm2204354ejo.206.2022.07.30.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 02:14:45 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>
Subject: Re: [PATCH v1 29/35] drm/sun4i: tv: Remove useless destroy function
Date: Sat, 30 Jul 2022 11:14:43 +0200
Message-ID: <4754901.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech> <20220728-rpi-analog-tv-properties-v1-29-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_021448_063636_EA65F7AA 
X-CRM114-Status: GOOD (  11.59  )
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

Dne petek, 29. julij 2022 ob 18:35:12 CEST je Maxime Ripard napisal(a):
> Our destroy implementation is just calling the generic helper, so let's
> just remove our function and directly use the helper.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 52bbba8f19dc..6d7e1d51569a 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -491,15 +491,9 @@ static const struct drm_connector_helper_funcs
> sun4i_tv_comp_connector_helper_fu .get_modes	= sun4i_tv_comp_get_modes,
>  };
> 
> -static void
> -sun4i_tv_comp_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -}
> -
>  static const struct drm_connector_funcs sun4i_tv_comp_connector_funcs = {
>  	.fill_modes		= drm_helper_probe_single_connector_modes,
> -	.destroy		= sun4i_tv_comp_connector_destroy,
> +	.destroy		= drm_connector_cleanup,
>  	.reset			= 
drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state	= 
drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	= 
drm_atomic_helper_connector_destroy_state,





_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
