Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6913CD4851
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2026 12:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1HuLGXiPqJSn2EJ/eUsEXTD1MiFl/0mgQ20t+QdtHQ=; b=KHGf4xohgyvMNJ
	OHf4khPUjeRCCWqal0BU7T68g6j7ifz4fhoTCsNRpdXGf9Dh35cT6wcbt+lPXdW1vn2aTBq40S9Rf
	MDyuRATiV3Q9ZIkZ2wh99Qo6cejZXAF5cc+A7zqiUh1r/l3OxEoaS1cbBLlh+RFpkAP2Ep1mNZtcX
	hHbSJAbupTWLmnnoAxA1A5jUxVVHXxGLTfgYcvRsGQIYCKzyyiHNGwxsLaTfnifoe/7lOnVWOlHuw
	8WQyzf7NVOxkQLUujQIVozKwSLuAp1YmVHHMhk4ssrhXXloRH6Y1Zrd/pEjh+EfCpqJUl6jjr6baT
	iW6QVfc2C68od3AkBkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJEO-00000001Q1F-2k6O;
	Tue, 19 May 2026 12:07:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJEK-00000001Px7-1dgh
	for linux-amlogic@lists.infradead.org;
	Tue, 19 May 2026 12:07:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 054D31A362B;
	Tue, 19 May 2026 12:07:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BE4DD5FFC8;
	Tue, 19 May 2026 12:07:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 417C4107E8B5B;
	Tue, 19 May 2026 14:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779192438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JTYht0YD317H5z8s11sE9p+sChcQcjLL5Rm+qvRnlWI=;
	b=Ymtu9AaIOAYtMzeHcJnz7kpZBVJR2o2INASsjHOQRVGEwpOtL4mMyHhwnV2iCRdBMgGl+c
	ClN6WzKjjHGx5f25xNG5nSqp0gr+yXcAYykptOBJ5wU0v5jOfci3mny1fyAK8eoZrrNn15
	ZtoKIrylwo2ctxoeNL0E5/0vwwC/clOWCSMv79Q4jj0i23p3/0xg4VxnPkWj1cbRfjeitu
	1xpuDnbu2s0w2jJRyKj/HGkp2kFUda6muU6uvzKDKskXVPtPUT+eFw+owoqiRF38q439yZ
	QXoI/RxTFfnEnDKHffzKuSB9z5QvKjKiTFAete010Ldbp9v0oQ/vkT7Yo75HWg==
MIME-Version: 1.0
Subject: Re: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until
 connector cleanup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260518180206.2480119-5-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-5-jonas@kwiboo.se>
Date: Tue, 19 May 2026 14:06:59 +0200
Message-Id: <177919241969.545972.18169905222569864569.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_050724_557700_6C365AB3 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: imx@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev, Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@kernel.org>, linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, Louis Chauvet <louis.chauvet@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andy Yan <andy.yan@rock-chips.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2026 18:01:40 +0000, Jonas Karlman <jonas@kwiboo.se> wrote:

Hello Jonas,

>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b7bfc0e9a6b2..9d795c550f8a 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>  
>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
>  
> -	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
> -				    &dw_hdmi_connector_funcs,
> -				    DRM_MODE_CONNECTOR_HDMIA,
> -				    hdmi->ddc);
> +	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
> +					  &dw_hdmi_connector_funcs,
> +					  DRM_MODE_CONNECTOR_HDMIA,
> +					  hdmi->ddc);
> +	if (ret)
> +		return ret;
> +
> +	drm_bridge_get(&hdmi->bridge);

I'm not fully following the code paths, but both the report and the fix
make sense to me. Only I'd move the drm_bridge_get() before
drm_connector_init_with_ddc(), to avoid a short window where no reference
is held and the bridge might be destroyed before drm_bridge_get() is
called. I'm not sure this can happen, but it's better to write the code in
a way that clearly makes it impossible.

Otherwise looks good.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
