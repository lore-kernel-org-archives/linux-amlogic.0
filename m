Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C2AD5B16E
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Dec 2025 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HD5pS0b/85dV2Jypayeku95ZSdEwRNj7YMLXVxyFhjI=; b=JoOICHMPM3LDkt
	1p6OPY8IK76mCP3YnnpiwAc1GJXylTCNOaaelG3wFq4foaCdUUD1JN3wUX3I3e95+tWR5NjzVUsYo
	/9rsv+XU6KHUob8PJ/B4AqH8VxsMzh86JPaxtCK64AqyLhGK7puejShogDTCdNg1oal/kGODdUYAv
	AVvrqqF6UadM2EaGzQ1WgJoOZoDhZLf5XeNpzieHrLGMEolfhbOr2xcEQnnlOm2JR1GKeP8hqUd2i
	BGXZhvhJOs5NunzwhZbBB/CBn7wdKi0rD7AwlghBxONzq3Z1SakUtl96bR2D5uWOYC0MYV0IskUZb
	x31WYd/J9OzGSXc+4MJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aP-00000003nf3-38Vb;
	Mon, 15 Dec 2025 14:30:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9aO-00000003ned-0nAR;
	Mon, 15 Dec 2025 14:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E560C60133;
	Mon, 15 Dec 2025 14:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE6C9C4CEF5;
	Mon, 15 Dec 2025 14:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809002;
	bh=d/qPch42wTytcUVZpnvLFzPzkHT+2Te29Yve88Y7qvk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=pzSvaA1tzUfFX90Bpv7uTWgOJvjpUreVk5QSuq+ylzfpRBLaffXCIftWhmRtgcwHn
	 WqHHYi/n/LJNXU0xFMhdAxMNl30qsNJgW5AopWO/V+nhjnnrRjZksJ37KJc7wpSLuc
	 XqOT9au/7pIpkRdGOi9b1As4P3b1bXRZTV49Z+pjSY735aCfnlOeZXtj9CY/dJk91c
	 sTbeDasJ8Ce/N/YpYqXJpJHhbvqKQS7yolYAx1vDOGX4tHTY09mNAgi2eYRSwmRiCK
	 k8sq0J3hT7j1Ell8suet00MB4TSsecGkYIYGjkVPcnHwbhrllGCVXkpB3JIZTqa7gG
	 /aof8tGnhNvZQ==
Message-ID: <ed313451e1a08a9e8e976d81a19d2c1a@kernel.org>
Date: Mon, 15 Dec 2025 14:29:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 02/26] drm/bridge: deprecate of_drm_find_bridge()
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-2-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-2-88f8a107eca2@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Alexey Brodkin" <abrodkin@synopsys.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Anitha Chrisanthus" <anitha.chrisanthus@intel.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>, "Hui
 Pu" <Hui.Pu@gehealthcare.com>, "Inki Dae" <inki.dae@samsung.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Seung-Woo
 Kim" <sw0312.kim@samsung.com>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Tomi Valkeinen" <tomi.valkeinen+renesas@ideasonboard.com>
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

On Fri, 28 Nov 2025 17:50:12 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() does not increment the returned bridge
> refcount. of_drm_get_bridge() is to be used as a replacement.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
