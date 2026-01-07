Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0524CD0D145
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jan 2026 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/kPu3312u2LJOvg4G0yQTMHAzqrq9MTYKptelApP+4=; b=111fPYSGbcqlqX
	J/ibHb9F+9E/sqAXuDS3i4AL8j4jjqePJXrtECuVjHaNCuYuL+RXeRzwMZvfD4sEId8BUKLwzqkyf
	Bp7oS1aWI3i7obYPUe9dp8olYoG2u9DzPFY0YSj2bnW4u52/dNtH5cO5rlbBnHAQ9BvTuKpw/LVo3
	xmSzweqrmztdhgdlSRwRR8xyVOXFELqieridsFeiQ2M3pfuIr/Umabh/8S1DhTtoiLCJwd8e3A3hq
	vmPzAqsTxKTbuV36RFzOqaWpD5nBR4bFUnjHT5rMm+OMzewYYk6HiuY2z14jZiWSgvBkSOcKVilCH
	OA51cX6jEhs6IBdpMX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWwY-0000000FLr5-3rlL;
	Wed, 07 Jan 2026 17:03:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWwV-0000000FLqN-1txw;
	Wed, 07 Jan 2026 17:03:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BC30FC1EC96;
	Wed,  7 Jan 2026 17:02:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6BA7606F8;
	Wed,  7 Jan 2026 17:03:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9A49103C821A;
	Wed,  7 Jan 2026 18:03:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767805397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vT259SsZbBCgS5jej5uTjBYNLE5xMiwzYalV9DvjFlw=;
	b=qjl+IH9e6WT/WJbluQMom7WhOSZz91qsguJk+YcCF1ezNfyjR88kSE3TKuk68Dg37xmHw6
	XCEK9Mppq0OQq3vc09h0WDsUQxgQoZKm+M/+U+3MgdY0Eb/MK9G6UG+ZlB8NXiAEBbZ6Pi
	xP9Oxci+bX3nmJSR9oU2MukZpebnHYoGLphjaIxE7AW3mpS/83hzxfcjIax6cip9cRD7lZ
	Uex/OGHArOy4i/tiS6i8OdbUklSoD4vZR2GIC0hRgcGA3SbizduiTm0dV2HMFCrUGQiGZt
	cUleZVAvrJ72aqzu/SfKPKbcZV9e9srbSuH73i8GFot6Kr2H131NFf/nJYQ26g==
Mime-Version: 1.0
Date: Wed, 07 Jan 2026 18:03:05 +0100
Message-Id: <DFIIPIQDRAXW.3FOJY73IY5UZ9@bootlin.com>
Subject: Re: [PATCH 3/6] drm/imx/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
To: "Philipp Zabel" <p.zabel@pengutronix.de>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Kevin Hilman"
 <khilman@baylibre.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Kyungmin
 Park" <kyungmin.park@samsung.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Laurent Pinchart"
 <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com> <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-3-ef48a517828e@bootlin.com> <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
In-Reply-To: <3e87a26d067de694273daaf011a50f1a2e7718f1.camel@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_090331_629526_F3AA10BD 
X-CRM114-Status: GOOD (  12.32  )
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

Hello Philipp,

On Wed Jan 7, 2026 at 5:34 PM CET, Philipp Zabel wrote:
> On Mi, 2026-01-07 at 17:22 +0100, Luca Ceresoli wrote:
>> of_drm_find_bridge() is deprecated. Move to its replacement
>> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
>> is put when done.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> index 07e5f96202d4..95f629d97bce 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/dw_hdmi-imx.c
>> @@ -241,7 +241,7 @@ static int dw_hdmi_imx_probe(struct platform_device *pdev)
>>  	if (IS_ERR(hdmi->hdmi))
>>  		return PTR_ERR(hdmi->hdmi);
>>
>> -	hdmi->bridge = of_drm_find_bridge(np);
>> +	hdmi->bridge = of_drm_find_and_get_bridge(np);
>>  	if (!hdmi->bridge) {
>>  		dev_err(hdmi->dev, "Unable to find bridge\n");
>>  		dw_hdmi_remove(hdmi->hdmi);
>
> The component_add() error path below this is missing a
> drm_bridge_put().

Right! Thanks for reviewing, fix queued for v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
