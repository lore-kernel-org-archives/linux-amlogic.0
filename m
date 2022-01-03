Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B011C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZmCiufUzKL87l2ensYc6JcsdhOix1KZeqLubdI67h7s=; b=rDsWe1sgB5vVbWyphJRREiPMLV
	3Lp3iFs5DE4i2E3pEqEW0+0P6rjPtkqtLG039mqnlskbOMVKcbnkZov+LstXwuNwgUlQxK76XSfD3
	4oRdVW37dau7qNQ2Q5rUibLcPa4DKae6egix7rW1EhTZRISVnAFY/g0bkUfb5FfYHWxKFRmK/ZLJR
	UjM02NiRqJdiB1SI9CrQzYIXf+g5YcNJGzFDwubowbvhD345TRNqhoiVVPoVF0j3GoNueBoFqw0IK
	GFsJglgG8kygP2mGjaaqHbwSlpaKjmQ9C1e7ezkJieTdQ0JN5+7f0lh2BVcy0Jfs7C5P5PkhlUAwB
	QCZ7riyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4LQK-008r2h-10; Mon, 03 Jan 2022 11:22:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4LQ6-008qxy-23
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 11:22:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id v7so69148457wrv.12
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 03:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BNbTKpjbmWU2ee+fIXH6oE6o9ijvgMX48fYdOT45X/Q=;
 b=b3llH14P0tfs30LgRrpzXrfr0/n+TkaCFTaW3eqCfql3dGHMmzBmYbjldPk30kJtFq
 VeHKftyBKTQ4mXPxNBDGjuani4Inopixvs9yPJcxoJY02+glRC+806t5RC2nMMTxUMG7
 h7Ilc2xD1NY6yvaZLZSjJNO2DIjEB4KSoRDc8qnE3avLo1LlXmpZptmS7qfYmd0yPrV5
 oL2Aq71fYpe2+MCYZqyFIRInof5FoFR4DDY1XQCaI0HhVIb17K982XRxtz4jHHy44xqQ
 4Nn33FcnMU0VgVxLl2d0MkPjmJXvYo92PDEMo8UXpVIN2rydjDUSe06mDYsIwEKaMAWd
 mo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BNbTKpjbmWU2ee+fIXH6oE6o9ijvgMX48fYdOT45X/Q=;
 b=s1UKfiyFxypHySigphusBOTtNouZcsOLkN41jnfgifUQi0jnHXdaGNhmgEiNjC7UKA
 lxYfbMd6QMcITvmrMku2ZedTwOagMr8saYrXefan5KC980fgM/6ap6A6Dwf++jZPH82w
 7KCLhKtoRSLz5YE79lcu/WslNX7t8+4zyaEYZ4NIyoHh0r/qwOOHFOS4vwdDARmu7mn0
 v3XaehkfmMtth6Kn1lgV8oQuTn9Setu0tgB+zqF4+FLPEgft3AwaCasKEIeDK9kTQXH/
 BLnQbf+3rvktkKH3YpI8nDPrqj9YkUzhnDHvH758FNpVHbK/1c7vA+cm6I1D811IJBet
 /oEg==
X-Gm-Message-State: AOAM532FMfJ+iytpHLsJE90A+o+63khwhv2rmTVYqzT34ZwXf3sBge5E
 QJIt13A34iP3JuCGuqFMCW4Upg==
X-Google-Smtp-Source: ABdhPJwlW5bTY0c+ncM+C9gmKuAqCov9E4Zx3krZ9I9IaDZkpiD+J1KC4iz71QV3+92ok2Ll7laMnQ==
X-Received: by 2002:adf:e0ce:: with SMTP id m14mr20370362wri.630.1641208948255; 
 Mon, 03 Jan 2022 03:22:28 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id b2sm38209160wrd.35.2022.01.03.03.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:22:27 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/meson: Fix error handling when afbcd.ops->init
 fails
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
 <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <386f5be4-eca0-6117-82f5-317b82ee66a7@baylibre.com>
Date: Mon, 3 Jan 2022 12:22:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211230235515.1627522-3-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_032230_143933_9DC8CABF 
X-CRM114-Status: GOOD (  19.55  )
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

On 31/12/2021 00:55, Martin Blumenstingl wrote:
> When afbcd.ops->init fails we need to free the struct drm_device. Also
> all errors which come after afbcd.ops->init was successful need to exit
> the AFBCD, just like meson_drv_unbind() does.
> 
> Fixes: d1b5e41e13a7e9 ("drm/meson: Add AFBCD module driver")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index b919271a6e50..26aeaf0ab86e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -302,42 +302,42 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	if (priv->afbcd.ops) {
>  		ret = priv->afbcd.ops->init(priv);
>  		if (ret)
> -			return ret;
> +			goto free_drm;
>  	}
>  
>  	/* Encoder Initialization */
>  
>  	ret = meson_encoder_cvbs_init(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	if (has_components) {
>  		ret = component_bind_all(drm->dev, drm);
>  		if (ret) {
>  			dev_err(drm->dev, "Couldn't bind all components\n");
> -			goto free_drm;
> +			goto exit_afbcd;
>  		}
>  	}
>  
>  	ret = meson_encoder_hdmi_init(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_plane_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_overlay_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = meson_crtc_create(priv);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
>  	if (ret)
> -		goto free_drm;
> +		goto exit_afbcd;
>  
>  	drm_mode_config_reset(drm);
>  
> @@ -355,6 +355,9 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  
>  uninstall_irq:
>  	free_irq(priv->vsync_irq, drm);
> +exit_afbcd:
> +	if (priv->afbcd.ops)
> +		priv->afbcd.ops->exit(priv);
>  free_drm:
>  	drm_dev_put(drm);
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,

But this depends on patch 1, so I'll add the same Fixes tag on patch 1 and add to drm-misc-next so it won't pollute -fixes but will still be eventually be backported when landing on linus master.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
