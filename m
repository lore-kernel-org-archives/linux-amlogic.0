Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E30D6552C
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Dec 2025 10:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:References:In-Reply-To:
	Subject:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/9rsTuYHUUIK/QLqVwZkoLhuOidRpNE0WkTevVPoAY=; b=S3R34a0/vNjS55
	H+SnwOY4jTgf2Gbmu6zKDn30MsFxPVs9rLpqUA0uAGZeTv0/gSpJcwfhB9jJ73rEy5KgL6XDOxiIG
	ckElMyQhFHDaUyGMLmuY24MT7AyWle6KNdJ6Vq9uguhG+0Pp7m9R4NBfahapFc+INYsBnO3gCS52m
	8LR/ClTvVUqb//Gq9DJo3QBnDOaM7YmBWgZojKXeNYUkhBXK3y2Yv8RLgWELkdKpl8v0VLsCQM0Xq
	LYwwXJ+SojUM0Q2UCtVL0UpLMOGAFXiVnhJyr43ojUawFr8IAQlxlLrPlJoLl/kKnVXtBe2g2tI9b
	Di6AKfQaPy32kv8D74fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoa0-00000006a2I-41Xp;
	Wed, 17 Dec 2025 10:16:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoZz-00000006a1L-2pol;
	Wed, 17 Dec 2025 10:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BF966055B;
	Wed, 17 Dec 2025 10:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DA0C4CEF5;
	Wed, 17 Dec 2025 10:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966582;
	bh=14N7+pYy72kfKgLZ+eBjOCn+SrYbkirrM1jMUhs1cHQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=aO4cKOOVeefvLNc7CIcIB6uIcGA3BuF9GQzoKy8YZd8b2Y4g5nJG7VGIYtYX1RgJl
	 JtCo8irlnMdjj//V1tJESEEtgcwreO/bhOOE84u8Ntu9XqZw92P5hPXukEJKxtiLAv
	 oqyivM4O3SUfDmtimYCyNzvkYi/LxQrGOK/Wt4Vl+DOtQGKylSV3oiCYtzz4GU7V1B
	 aHi4qtO8bodJ7FZa7y1cSasyLx7CbX2x6gEmyA0QSXJzandD7d1JdaL5z0LQb+ReSx
	 6iMnJVp+NV9mw+hyfHBdymKVubU/pQ8ljPbc8lS/nTiWokbnOqar3D3bq0e+DMzan4
	 sZwiYbbCTfCCQ==
Message-ID: <bf2654046433c0f580bac440c3e72299@kernel.org>
Date: Wed, 17 Dec 2025 10:16:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 04/22] drm/bridge: make of_drm_find_bridge() a
 wrapper of of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:37 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is identical to of_drm_find_and_get_bridge() except it
> does not increment the refcount. Rewrite it as a wrapper and put the bridge
> being returned so the behaviour is still the same.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
