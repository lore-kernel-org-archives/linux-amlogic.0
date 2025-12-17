Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C70D65530
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 10:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B16D4NcPz+dc+KuG8sLgP+2dEXN3dqaIx2A/+yoyNLg=; b=yfyvq6xpoW30nb
	AfqVwZTiejyU5oLY1uOlOamQbnXZYs2DdkURV6ZarKARArsBNMTj3H4r6q0o8vke2Gm3hVgTdS1k0
	jaZcrDQFo4Kmcu4YJeYyRq7FUf21IuiF7zLqmoA0fA2vJW9aw5ntjLxL5jXSStC1CocKmRJtVTd7a
	4AMMoptzi747pfX/xEZTFRLWZ0f59Qcwq+ZFpN61bOd0PxFkSEEOFfwbQwHrJRZr3hqm6x2xm87pp
	Ckuhlz3Y/3Y5SiicOPME6ZLGDpt5sKgkhez48uuF0/Xfw5PdTqnmTbXGgm/3yMZSpKwNTY2CiafUE
	lmIKNgYLdqO57Ey69MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoeB-00000006cE3-0mo2;
	Wed, 17 Dec 2025 10:20:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodl-00000006bnD-2Ttx;
	Wed, 17 Dec 2025 10:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C59AE60555;
	Wed, 17 Dec 2025 10:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F227FC116B1;
	Wed, 17 Dec 2025 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966816;
	bh=uJcpfVPMB5gnCFhr0GcBKgfEw4ZGLD1pSQ+VPptDnGA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=fWTsxN7hsVbEvFoHdM6FW8j9okypSLWVz4W+Thu9wMM85IQfe2/WjcxyGZdvVTO8E
	 p/okodvwcbtKo+t9xQw4ARUx93vm5VZCuXD5CucY9HkDBc22WjJFHVTepCCs79M8MK
	 lac76+FdHwSrHTregOjA7q4jZjIzZCJl7OcB+38XgVVjAHePMdeLej+Ppksd1NqQjq
	 PiBLkLZ3qgP1x/4u0Loq8WswRoO+SIVHu+8XLWZ4ecn3Fw70JwMH8+q/rex5V5pKQK
	 iIQZTA4QTqoqeBnO2pNWrd28eBBgfZLtjoZWfWnQ0WDquBqA3ald1dm9uphm3D0HlJ
	 woHzxM1OGr8IQ==
Message-ID: <8c0e9399c1f8bb388eb3f0ee2cf37089@kernel.org>
Date: Wed, 17 Dec 2025 10:20:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 15/22] drm/bridge: imx8qxp-pxl2dpi:
 imx8qxp_pxl2dpi_find_next_bridge: return int, not ERR_PTR
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-15-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:48 +0100, Luca Ceresoli wrote:
> In preparation for using bridge->next_bridge, we need to ensure that it
> will never contain anything but NULL or a valid bridge pointer. Current
> code stores an ERR_PTR when imx8qxp_pxl2dpi_find_next_bridge() errors
> out. Instead of fixing that after the facts in the caller, change the
> function to internally set the next_pointer and just return an int error
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
