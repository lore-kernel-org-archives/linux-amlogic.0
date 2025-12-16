Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F0CD5E13D
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AsZjYxH2wh42sMN7cKJsTpxYoLjRsCfiks4QyabfEmc=; b=klrymkqyUq/2d9
	y1FL5jw++heoQtDB6hVlpCOva40+B1GAneEGFvvlKCsFRlvmN+53+Un/Pb9bBH18MJsw9pBpqLVSc
	ZCFPabQP+/rVoKrjgYIpt99dC28lHoWWhZm6oht8hbIkSmB+wvZR6O5Skso7L2Y9p+Gex2qULpFaM
	hYdCwBAVqL+kCkyHDOCwRhiW9Ns2eAiTLC49R6ZMVi7BkGCUXMhTzAOnf5frpKtDYxNXRjonBZMLF
	Iv6ke42MBeQNuQJ3Zy4SMSdhKojF0BXDG6UqowlvkkSm4I2FRwn8Z7HbnQ4XgUmbdE3agZZopSxP/
	8Poul4rilGT25PTz+W0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLk-00000005ews-2oyd;
	Tue, 16 Dec 2025 18:00:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVZLh-00000005err-1s6O
	for linux-amlogic@bombadil.infradead.org;
	Tue, 16 Dec 2025 18:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=; b=fFfA3/RVTxjt4k+HT239a4nOCH
	6Y+W3mE0DzVV3R7BiXpdsOFGu9gcG6qdO+YfqBF9I8fq+BtHIxBkAb1Wv5oVsygAzgZI0ggeTCYAk
	W1KnWEcb270E+ygfTC3ntG7n/fOomLNXk01600TzQsz3n6SCsS3DThxGq5npnMO+uQH/86KegR5Sv
	Yfolajdhle1peJWUJPYdpbK91zOxvPoxpDP9ryBpNuHCq5sUqGJEfLSHIXKcOMTFgdyN9jH1hGnSb
	l4yMoOaz1s5pgMes2PkagLTKOZhD4x9VaOV1/BLI2TRKOkagFyWu9cnf5UwKaQIiUl9ReQ7SbM74h
	MTfAKsYQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYUA-00000005Jkx-40F8
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 17:05:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7AF2F4E419EA;
	Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 478E56071C;
	Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA225119A97ED;
	Tue, 16 Dec 2025 19:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=;
	b=NygTx0D997iRzxX4qtg+VZtGBkAX4ReGEGGEaLIiiNKTHs3Vzk3M89rT7rbc0rJnJ1Dmj1
	52rUcQrPv1rOm7GPIOWBKd4pI0B9DDyKnOlKEBe90WxCmv2qI0Zf+SUIIj1sA4YEikR7mD
	ecNCEArXJbpCFtuEjPjEdlr9gOg+UBXCAMj0DcCoA1zro7RcF1TQBGrodtbrtoxDi6qfTo
	akNHRTJiRcgTqIiIElILj8M1X1+p4mY8YXgtWbG39sQFbfwG7YNDZFPfHuKvCtuIGYdd3C
	esQfeoLQ6zolJKA5r7nRKY7TJJ9lkR3SvqcQ3D98X/ascf4Y34QJb7BEuZvWKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:47 +0100
Subject: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess error
 message
MIME-Version: 1.0
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
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
X-CRM114-CacheID: sfid-20251216_170519_102765_325CEEF6 
X-CRM114-Status: GOOD (  10.40  )
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

imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
every error except -EPROBE_DEFER. The caller emits another one, which is
redundant. Remove the message in the caller and keep the two in
imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
error cause.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index a4941f39a2e6..e03a411cb9db 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -415,13 +415,8 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return PTR_ERR(p2d->next_bridge);
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)

-- 
2.52.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
