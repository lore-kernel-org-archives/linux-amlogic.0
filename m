Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C482D6552C
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 10:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=js/Xy6BBf3ZIMv6Dec197WPig3yxtqCM3/YsXqIt2Ys=; b=nfAvNTGVenojDV
	+uKmwljqPJ2aY7I/8buNyxicCabvrVhSt3xe7O3a6HJJztg4j0FnRadGd3lCHqcJGCQOze50pMaLE
	HGZlGyvFCs3YIl7/fwDNkEFIJoI9p2fkdvClDdisQkNAm4FvdnF6NLBBhX1B0dmb/pxhueK+7fE/a
	MN/IjS6gJ/1dJuGJMr+Lrdmhg3P3FxPJkqGT53hTuWbHwzThU/Zv+sH/ixZ2BWqsBrsx10JGBzKdW
	KT3Ou3et/bQ/2j2oUKr/k7XQKC92xXtvHl50y0vWLQA/eZLbJRV/qWTbebv1wgPyv4Dbb0P/Gynnx
	2EXYJJ9JjEqNLAIqCZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoeZ-00000006cfE-1gw4;
	Wed, 17 Dec 2025 10:21:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoeU-00000006cZQ-2UWA;
	Wed, 17 Dec 2025 10:21:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01D1C42DFC;
	Wed, 17 Dec 2025 10:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BBBC4CEF5;
	Wed, 17 Dec 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966861;
	bh=rm5sUUnmbJwOzq2saFlPKZTSMeSRpM0dRx2piIKaLKw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nZgS2GXHVXIFe4wp8/XqV/hzDEt8Vr+/31BzhaivrsIoCXgGdsvdRD3yPKWE3R16j
	 hxShUUXrw0wI9TFn/+3uzHhqbjagVam8Y/l9TLB/U/Vfn7HJE8mIOF/sfqiC5RFYie
	 BuJzNVDk0DrazlsUF//TJqVje23fBkmKDOZlOqOcJ8mjAz4QLx3hH289d6INLJglPL
	 6n5Tf8IORua5W++yo8AvWakkSLlODewrFY4KKZWxdByOpZMxteb1kYCN2c9jr1oh9R
	 sA9Rkw5+u2KO8N6ZbvRYPXjKf0lv2YMd3NRC3n9CWmBsokskpXw8tZjBj7ATmKGpjK
	 oqndz40PlCOmg==
Message-ID: <5a69eb5665e9f64d2e1773f834bc4921@kernel.org>
Date: Wed, 17 Dec 2025 10:20:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 20/22] drm/bridge: imx8qxp-pixel-link: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022102_710443_059D3CA6 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 16 Dec 2025 18:58:53 +0100, Luca Ceresoli wrote:
> imx8qxp_pixel_link_find_next_bridge() already emits a DRM_DEV_ERROR() on
> error except for -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the one in
> imx8qxp_pixel_link_find_next_bridge() as it is more informative about the
> error cause.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
