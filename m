Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CC6C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jun 2022 03:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQRoY06WqDnsz22bS0khSacWmf6gwjOQ9Kd50nMnFLs=; b=GhwBVQD9xdSCah
	jLRyuggtMvoT9MhCqjtbywxKVbPbQweDUe3PYdrHy+0eLL5wEnhzFn/3FZOJr981vD9y3HgjEmW8s
	jgZt5/Qj/MEIErWL1EFMcygAhCDbtBCkr5IyMQgjgzmU5nfig6X8P7IkHPtWEpnBBZRewSGvP2Bo2
	f4E+pi0cxpaNE/Vbo2LGy4Dvmzt3aVjL6W3/ERFfSmo5jklIflzdDZEfQrQ5/8or+lqnNCnIu94FV
	ggNZo8t0QkvbI2A0jWoFkuregb5Oo9C5zPePVgk2kKncF/1Qv+0ITDUWm9Wi81cKdHq4CHeJK2H5l
	M1H1KgypCTdDsO73gHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFDi-00DgxG-Qt; Wed, 01 Jun 2022 03:40:30 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwFDO-00Dglz-Dn; Wed, 01 Jun 2022 03:40:11 +0000
Received: by mail-pg1-x534.google.com with SMTP id 137so695133pgb.5;
        Tue, 31 May 2022 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5mfO6LDCxvPgKYka8jk5OyHXRXc0q1t4jWcU47/N1fE=;
        b=ZmjqddQ3/TmHRhoFCiYRGDBVmexjqsYn/xpzktYFjtQbhCliZhc2Fo2Kem/7VqXdet
         wx8ZN9pcaCrJxBj1ICSqf3hm2Cha9vh+PIIqXQW2OT6+hpSYeQMEyBbj1abdvp7DP1Uv
         yKuIprZ6YV1f1nI+39tAs0URrBpNXauRUL+iDRG5idR/R0qx2BuRQqWl9VlJdp8Owv6r
         zgesTyoa4BjdC03XSI8eIyz5MVoJQzWPoQjc/So+mLQYHV2OzND0AYd+7x1YGPB3GwBD
         bT2QosR2IrQjlurZrVmpVWpicmDeb8q3UuSrAbzp2KdHFcTwPPrpbYwZL8FiYG25fu3n
         +53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5mfO6LDCxvPgKYka8jk5OyHXRXc0q1t4jWcU47/N1fE=;
        b=Ddc6np7PBCAT/TdyCfy3qWrT6EGjAmEyPFvnqGRVGNQYSAJijuXH8JrcQqD3Hfyb9n
         Mih+BtbBtf3Wdq50ZcHtMR30fJ2dJmHoXyW/9u7g4SF+BondEb5Dirf7/aYxV12u9Siz
         dTV2ijsO6m2wKRqQLvJVwq+rZ2+Cw54uZ8aRywnMYucWBv5o4qsyNMh0Cy7/cXkAlJvB
         Tg51zEB7MdzYxcfbnrO0o6po2E/c6OYQ5/qKp31aFxfkYivZEU88U/ORhMtQTnwoxqHk
         NiVdG0ggzm7g2FfvollES2m6Oovlr6OGDQhJxUEvQ4lApgB/Qy55O/yv/9T459XT1VOC
         35Pw==
X-Gm-Message-State: AOAM533TfV5ErjY5ZVUZgERRzGP5xMwEttCGdBbLNNRZrXelAfQLdy3r
	FV8a+eqQSh5lHIcKdFqcXmQNMMJooj6OhO6Y
X-Google-Smtp-Source: ABdhPJycr/phEanwFwmpfw4hc6pHiRMgRyg56Yj4FnBPh+sXAB7aZxKJJxZAr5MysBkhTPDTMd6V+w==
X-Received: by 2002:a63:6901:0:b0:3f9:caa5:cffc with SMTP id e1-20020a636901000000b003f9caa5cffcmr47846682pgc.324.1654054808681;
        Tue, 31 May 2022 20:40:08 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 20:40:08 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miaoqian Lin <linmq006@gmail.com>
Subject: [PATCH v2 2/2] drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init
Date: Wed,  1 Jun 2022 07:39:27 +0400
Message-Id: <20220601033927.47814-3-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601033927.47814-1-linmq006@gmail.com>
References: <20220601033927.47814-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_204010_538950_DA20FCC1 
X-CRM114-Status: GOOD (  13.59  )
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

of_graph_get_remote_node() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: e67f6037ae1b ("drm/meson: split out encoder from meson_dw_hdmi")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- call of_node_put() after of_find_device_by_node() and error paths
before of_find_device_by_node();
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..0d532e8e8cca 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -365,7 +365,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->next_bridge = of_drm_find_bridge(remote);
 	if (!meson_encoder_hdmi->next_bridge) {
 		dev_err(priv->dev, "Failed to find HDMI transceiver bridge\n");
-		return -EPROBE_DEFER;
+		ret = -EPROBE_DEFER;
+		goto err_put_node;
 	}
 
 	/* HDMI Encoder Bridge */
@@ -383,7 +384,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 				      DRM_MODE_ENCODER_TMDS);
 	if (ret) {
 		dev_err(priv->dev, "Failed to init HDMI encoder: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	meson_encoder_hdmi->encoder.possible_crtcs = BIT(0);
@@ -393,7 +394,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret) {
 		dev_err(priv->dev, "Failed to attach bridge: %d\n", ret);
-		return ret;
+		goto err_put_node;
 	}
 
 	/* Initialize & attach Bridge Connector */
@@ -401,7 +402,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 							&meson_encoder_hdmi->encoder);
 	if (IS_ERR(meson_encoder_hdmi->connector)) {
 		dev_err(priv->dev, "Unable to create HDMI bridge connector\n");
-		return PTR_ERR(meson_encoder_hdmi->connector);
+		ret = PTR_ERR(meson_encoder_hdmi->connector);
+		goto err_put_node;
 	}
 	drm_connector_attach_encoder(meson_encoder_hdmi->connector,
 				     &meson_encoder_hdmi->encoder);
@@ -428,6 +430,7 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	meson_encoder_hdmi->connector->ycbcr_420_allowed = true;
 
 	pdev = of_find_device_by_node(remote);
+	of_node_put(remote);
 	if (pdev) {
 		struct cec_connector_info conn_info;
 		struct cec_notifier *notifier;
@@ -444,4 +447,8 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
 	dev_dbg(priv->dev, "HDMI encoder initialized\n");
 
 	return 0;
+
+err_put_node:
+	of_node_put(remote);
+	return ret;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
