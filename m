Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8EC52D1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+yvJYG89OW6EQaKw5q8hgMo2CQlgXbciDpelXeJ0Zk=; b=Yq4UZ+2TfmtnV3
	vrXy/zm7wbKAIh5Y2BElFAo1FcPJPn9Ehh580XkOGf6wrd1nTPuil9aq2ZI/6l68f17miRoJk8fbz
	lgnujH9/YhhqebLvPlI/sOejuWhyUYKzIcsmyuA+ShjWJFYE1Mc0LlHV2hC9VDLuFIn99LzFaeiWa
	+x1OGc4v8lLaAxKF3DFvrQli75s5ov1lrm4OJeJXzi6ODmYGcxOtZgjWbB82XLj7lduRDbkDJs9WL
	Vvstz24SJxMUej7kZee7v/qv4SDT2qKMnuAfim1ue5KN74oBLfyQ0LDwtvrBjVBuwhejc4iRGixuL
	YfNzGeHNbLHNRT/2jmHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJN-0000000F9w9-1n3W;
	Tue, 30 Jul 2024 12:50:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJI-0000000F9se-36Jp
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so34181835e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343835; x=1722948635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+llf/AzXlKp78omF5xhKmy0SCTLK8xhdI8HSdAi9g1k=;
        b=zd32Crol3S2rYPGtPG7WLQFnCp92qqKlnEfbrb5940Oc5h7RM40yS06FJDhlC5STZ+
         41FjRRdAGUO/43aODnxwO3IKJdc8dEx2HX2qMQDb8iKqdz8iK1aN5RlaI8T9cu30FAb4
         pWmHqGGsz+V+FTnWs6DRiPa3hcPSVt1QkQewbMHGDIb5odo2Cn4wLfDc36Yegw8QpsyB
         Bf1GfujGl4VdvMn+zRzEW3pYANp+T7S1KpFWq3j7FlI1pJ3I9YrJPbTsG9CCXv23WJC5
         TOiIoioqp4jWU/3LLPYXsHxt0yHmuqtcRu4jgNGOystxA+haCXANr7WcN4zojbf8iY+/
         ZSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343835; x=1722948635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+llf/AzXlKp78omF5xhKmy0SCTLK8xhdI8HSdAi9g1k=;
        b=cNPZ+DdRB5yV8Lf9n8k0xn1dNQD9kUiV0Brj5WRELp550ecY4CYt5lN5b2jIwZbqO+
         /YjjKNWcNaB96iT6qIqqE3XWtK5BmI63GdQg2muTyJMmvoR2XvKBuqH0Yc8fVHUAyGIl
         mZmThNNaczVtk3VcZ4jH/Zrlw0v+M36gBPawhPnVitaG2qicRj0GAgl4cQVyFAoW46uC
         LKiJqza29uPl8fgyemZLu7qKCEH6/EIMEogOEKS6zU8tVLeAGhHebnEt7dlvLmtwB6VX
         w0QLtsExrVM9nWHvjtS9vpkh/KvR9UvPiZQ75pAEIgzf4Qj22ogez1y8WDi6QyNHxzRU
         iaKg==
X-Forwarded-Encrypted: i=1; AJvYcCVeQDM7pQL5i9fTqAqsDVjful06RmCjOrQIWS7hDp10Z1VuwVxcax92oH6RROT3e9kk7nCvYqUc/gymlWqqVTLEjuVX9a6dqj4wUb0Eom4B0iI=
X-Gm-Message-State: AOJu0YxYJQO27rY8RGTN9Xfq2nrWy4JBfiqgS/SS/YBISQ5qbE1QBKq/
	jThwztX67GMMaYuc1b6GixG3En3aKQAmliPsp6v16ccB0pi2dfwxhUzQut/aoec=
X-Google-Smtp-Source: AGHT+IHNrX2bheZchsP7m4fuUtkC/sP1H3A6/6koS/47y+kuPZKBI5FQcJ6s4Qb6HTNFzzD3vSexkg==
X-Received: by 2002:a05:600c:1c8f:b0:426:5269:982c with SMTP id 5b1f17b1804b1-42811dd3c2bmr85628895e9.28.1722343835329;
        Tue, 30 Jul 2024 05:50:35 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] drm/meson: hdmi: move encoder settings out of phy driver
Date: Tue, 30 Jul 2024 14:50:11 +0200
Message-ID: <20240730125023.710237-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055036_813629_8C807BB4 
X-CRM114-Status: GOOD (  14.60  )
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

This relocates register pokes of the HDMI VPU encoder out of the
HDMI phy driver. As far as HDMI is concerned, the sequence in which
the setup is done remains mostly the same.

This was tested with modetest, cycling through the following resolutions:
  #0 3840x2160 60.00
  #1 3840x2160 59.94
  #2 3840x2160 50.00
  #3 3840x2160 30.00
  #4 3840x2160 29.97
  #5 3840x2160 25.00
  #6 3840x2160 24.00
  #7 3840x2160 23.98
  #8 1920x1080 60.00
  #9 1920x1080 60.00
  #10 1920x1080 59.94
  #11 1920x1080i 30.00
  #12 1920x1080i 29.97
  #13 1920x1080 50.00
  #14 1920x1080i 25.00
  #15 1920x1080 30.00
  #16 1920x1080 29.97
  #17 1920x1080 25.00
  #18 1920x1080 24.00
  #19 1920x1080 23.98
  #20 1280x1024 60.02
  #21 1152x864 59.97
  #22 1280x720 60.00
  #23 1280x720 59.94
  #24 1280x720 50.00
  #25 1024x768 60.00
  #26 800x600 60.32
  #27 720x576 50.00
  #28 720x480 59.94

No regression to report.

This is part of an effort to clean up Amlogic HDMI related drivers which
should eventually allow to stop using the component API and HHI syscon.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c      | 38 ----------------------
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 16 +++++++++
 2 files changed, 16 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..bcf4f83582f2 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -115,12 +115,6 @@
 
 static DEFINE_SPINLOCK(reg_lock);
 
-enum meson_venc_source {
-	MESON_VENC_SOURCE_NONE = 0,
-	MESON_VENC_SOURCE_ENCI = 1,
-	MESON_VENC_SOURCE_ENCP = 2,
-};
-
 struct meson_dw_hdmi;
 
 struct meson_dw_hdmi_data {
@@ -376,8 +370,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
 	bool is_hdmi2_sink = display->hdmi.scdc.supported;
 	struct meson_drm *priv = dw_hdmi->priv;
-	unsigned int wr_clk =
-		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
 	bool mode_is_420 = false;
 
 	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
@@ -421,36 +413,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	meson_dw_hdmi_phy_reset(dw_hdmi);
 	meson_dw_hdmi_phy_reset(dw_hdmi);
 
-	/* Temporary Disable VENC video stream */
-	if (priv->venc.hdmi_use_enci)
-		writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
-	else
-		writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
-
-	/* Temporary Disable HDMI video stream to HDMI-TX */
-	writel_bits_relaxed(0x3, 0,
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-	writel_bits_relaxed(0xf << 8, 0,
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-
-	/* Re-Enable VENC video stream */
-	if (priv->venc.hdmi_use_enci)
-		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
-	else
-		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
-
-	/* Push back HDMI clock settings */
-	writel_bits_relaxed(0xf << 8, wr_clk & (0xf << 8),
-			    priv->io_base + _REG(VPU_HDMI_SETTING));
-
-	/* Enable and Select HDMI video source for HDMI-TX */
-	if (priv->venc.hdmi_use_enci)
-		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
-				    priv->io_base + _REG(VPU_HDMI_SETTING));
-	else
-		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
-				    priv->io_base + _REG(VPU_HDMI_SETTING));
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 0593a1cde906..1c3e3e5526eb 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -45,6 +45,12 @@ struct meson_encoder_hdmi {
 	struct cec_notifier *cec_notifier;
 };
 
+enum meson_venc_source {
+	MESON_VENC_SOURCE_NONE = 0,
+	MESON_VENC_SOURCE_ENCI = 1,
+	MESON_VENC_SOURCE_ENCP = 2,
+};
+
 #define bridge_to_meson_encoder_hdmi(x) \
 	container_of(x, struct meson_encoder_hdmi, bridge)
 
@@ -247,6 +253,14 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
 		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
 	else
 		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
+
+	/* Enable and Select HDMI video source for HDMI-TX */
+	if (priv->venc.hdmi_use_enci)
+		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
+				    priv->io_base + _REG(VPU_HDMI_SETTING));
+	else
+		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
+				    priv->io_base + _REG(VPU_HDMI_SETTING));
 }
 
 static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
@@ -257,6 +271,8 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
 
 	writel_bits_relaxed(0x3, 0,
 			    priv->io_base + _REG(VPU_HDMI_SETTING));
+	writel_bits_relaxed(0xf << 8, 0,
+			    priv->io_base + _REG(VPU_HDMI_SETTING));
 
 	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
 	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
