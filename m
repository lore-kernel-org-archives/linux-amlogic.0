Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA98CF34AD
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Nov 2025 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ImXnwbsZWGUzDWr9Jalqqvj0P5nPdxtQMT+D+nHr9A=; b=hG7aAabLCBUpFj
	JtV8gJywx9FDY31Z/EF0IzJK2epAKNVfZqgWKNTBEFR5ZqcC4qI7x1nJIBYm7564mGV+b32Qh2tD8
	LnVnjoBgQi9yHNrweZKBW0AUORXH4N+k1vVKFt16UwnP3h/Ka0nt51VZQ4ohHhXB5DgArh5HFfcdF
	f3VH5TtxT426aIlcBJ1wMk3IGTfgW0o5c2CAZo5fLd2t9AdlG877Pr3Icbqqw7IQNMO8dW0qHsyGg
	YhHGnvEzJQjwsdPZfyIj3JuI3mhbfkrQncXM/bP6q8kt4hnjXR51J9MT3d4aaVPD7bYZp9EMMs5CJ
	32tbVAq4oqpYKwAuGtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLj4x-00000003Mo9-2bv8;
	Wed, 19 Nov 2025 14:22:39 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLj4u-00000003Mmw-1Pd9
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Nov 2025 14:22:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98C4D4E4179D;
	Wed, 19 Nov 2025 14:22:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 594C360699;
	Wed, 19 Nov 2025 14:22:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 468BE10371A62;
	Wed, 19 Nov 2025 15:22:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763562149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KHIHzROR0vP9n7dvMFHoM55Ssw0KAKH53cQfe48RG2o=;
	b=UfR7xwnXYFcxt7dwYb9ZZ2eHN7rcQflUmmRbY6KpW0kfgQmHCUslJp41eFjRD7JVEUwKJZ
	S0oXT5p7TaoydFUvfXkgYXy2hBwhCbLh0hTZ9oWYkqCt/tCI/K1Dik6InPGVCplhxx20wG
	jBAFgm9Fp8hHkx89EpTboOzrEJyAyR0UxrgcfQigI3YyMTbWTXKDX9o5np5l95zrqxzp+5
	DnhkYQIm688Fn7PEOgNjQK5V7V7kSk65KKWVjPvAcYMqGom1O1QKFrIjeFzcaazJJ/4nQY
	BeP/9Xy2sVRjpilf746wFLr/iSKL71kXFK/see/F8PNIt2le3RaEWTWBwZD28Q==
Message-ID: <35bda203-8c15-4219-a231-1379f909229f@bootlin.com>
Date: Wed, 19 Nov 2025 14:22:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/26] drm/bridge: add drm_of_find_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
 <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-1-0db98a7fe474@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_062236_518722_19F0FA9B 
X-CRM114-Status: GOOD (  27.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 11/19/25 13:05, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the refcount for the returned
> bridge, but that is required now. However converting it and all its users
> is not realistically doable at once given the large amount of (direct and
> indirect) callers and the complexity of some. Also, "of_drm_find_bridge is
> oddly named according to our convention and it would make more sense to be
> called drm_of_find_bridge()" (quoted from Link: below).
> 
> Solve both issues by creating a new drm_of_find_bridge() that is identical
> to of_drm_find_bridge() except it takes a reference. Then
> of_drm_find_bridge() will be deprecated to be eventually removed.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Note: a simple implementation would just be
>    { return drm_bridge_get(of_drm_find_bridge(np)); }
> but it would release the mutex before getting the reference, so it is
> not safe. Make things simple by duplicating the code. A later patch will
> make instead the (to be deprecated) of_drm_find_bridge() become a wrapper
> of the new drm_of_find_bridge()
> ---
>   drivers/gpu/drm/drm_bridge.c | 29 +++++++++++++++++++++++++++++
>   include/drm/drm_bridge.h     |  5 +++++
>   2 files changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 8f355df883d8..d98a7b4a83c0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1417,6 +1417,35 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>   EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
>   
>   #ifdef CONFIG_OF
> +/**
> + * drm_of_find_bridge - find the bridge corresponding to the device node in
> + *			the global bridge list
> + * @np: device node
> + *
> + * The refcount of the returned bridge is incremented. Use drm_bridge_put()
> + * when done with it.
> + *
> + * RETURNS:
> + * drm_bridge control struct on success, NULL on failure
> + */
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np)
> +{
> +	struct drm_bridge *bridge;
> +
> +	mutex_lock(&bridge_lock);
> +
> +	list_for_each_entry(bridge, &bridge_list, list) {
> +		if (bridge->of_node == np) {
> +			mutex_unlock(&bridge_lock);

It seems a bit strange to unlock the mutex just before the 
drm_bridge_get, is it expected?

If no, I think you can use scoped_guard(mutex, &bridge_lock) to avoid 
messing with mutex_unlock, IIRC, scoped_guard will unlock the mutex just 
after the return, so in your case, just after the drm_bridge_get.

> +			return drm_bridge_get(bridge);
> +		}
> +	}
> +
> +	mutex_unlock(&bridge_lock);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_of_find_bridge);
> +
>   /**
>    * of_drm_find_bridge - find the bridge corresponding to the device node in
>    *			the global bridge list
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 0ff7ab4aa868..e74e91004c48 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -1313,8 +1313,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>   		      enum drm_bridge_attach_flags flags);
>   
>   #ifdef CONFIG_OF
> +struct drm_bridge *drm_of_find_bridge(struct device_node *np);
>   struct drm_bridge *of_drm_find_bridge(struct device_node *np);
>   #else
> +static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
> +{
> +	return NULL;
> +}
>   static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>   {
>   	return NULL;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
