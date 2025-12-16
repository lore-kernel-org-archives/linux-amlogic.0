Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADA1D609D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwI+R5mJTB0bPhLhYNQqQEpakkfFvt2NUdUb9AhEiPw=; b=SUmN9ZZu9hDsRg
	lrAN2ozTzYayzGaxOTqDToNbPxbvun0z3kJ1Nf+fRZQKakWk5m5uCHelieJ0D4YCAIycUEy6rCS+K
	kgXZGS0K7VNi37F71SQeR/aR32xn+UJyAEwNZ0fk0/jMf3Xppje+LmVvG0O5e3M9D7QtI1pnnWCCf
	dobXTgmzZvSEYQrBew5hbiK4P39owZGTdj2Gs+04NlHqmfrA8kmZs+UsYoGl1SGhqPZ36F3lIRa4O
	UGrPb2crbbOEF5zlLFxHX8xvhnqLFsfbhuhOdoxajXYkPyILOp059vP21eB/Yam9Hcq94YDCiT0T8
	bAXmq2cGF/wv5Z89q5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZMJ-00000005fYN-0uR2;
	Tue, 16 Dec 2025 18:01:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZM7-00000005fI5-049a
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 18:01:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6C40DC1A582;
	Tue, 16 Dec 2025 18:00:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D42A56071C;
	Tue, 16 Dec 2025 18:01:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1ADD6119A9811;
	Tue, 16 Dec 2025 19:00:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vphgdK3fv94n1zonuUG7zDk53Na3mW4h7l4BRt8Xt1M=;
	b=rZPXmq3RtPX/5ScJ+KjOqb+0dehOnxx5Ww5McS0CngQLq1HGvBFTli4zqUVQcgqJ4eeFtc
	XWH8dcmTk5TMxeiPjnH/9NuKqFJ7SwIsTsLB27rYhtepxUDXmyHtQJevFCnmCqKmPaxtaK
	6iofmkwfXXijRzWuiWfV/hQ74s7FsDyzCTdW+5Ub2Z3zvxLDOsXVYPL7aBv4Ax+Orr05CV
	yYGvU2R3SY2Z/TaO/k0Dgm9GyIqRDGlKdzCpFFZEJ5y0PHQeoY4dJGnr+VKgJ5AumWpdJV
	+LG9sQLB4wbnNibGxLpaO/hdA4+twpf4UJNUGz/eJH4avxnLwS2EGWPOU66/EQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:53 +0100
Subject: [PATCH v3 20/22] drm/bridge: imx8qxp-pixel-link: remove excess
 error message
MIME-Version: 1.0
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
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
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_100105_018714_71C8057F 
X-CRM114-Status: GOOD (  10.47  )
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

imx8qxp_pixel_link_find_next_bridge() already emits a DRM_DEV_ERROR() on
error except for -EPROBE_DEFER. The caller emits another one, which is
redundant. Remove the message in the caller and keep the one in
imx8qxp_pixel_link_find_next_bridge() as it is more informative about the
error cause.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 2ecc3c1051e5..0c5ed06eee1b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -369,13 +369,8 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 		return ret;
 
 	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge)) {
-		ret = PTR_ERR(pl->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(pl->next_bridge))
+		return PTR_ERR(pl->next_bridge);
 
 	platform_set_drvdata(pdev, pl);
 

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
