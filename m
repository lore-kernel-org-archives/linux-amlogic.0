Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF61EC04A68
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jul 2022 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRzogTzL5f4hlWGmbF2st4UP/GrQLgl7eXmZZoXoDPw=; b=rOdJBxAufI3DP2
	pRgo4zOkmkUgpNfBrUhXokGKQzlYHQmwyLmQwoyJ4B8XkJz6eJC0a7IRot4lI5vaoPOaZOfZgg8Wx
	Mqzh7FUYI4l+4zG3hdJu0o9ocR6ytv+2qXeHFDHUQPgDg0K0HuGjpuuPRC8KGHF7vbtOjHAZdn5Y6
	SKboSJvgjGa3XyykKUUZUoYeR6T6MT42WP5T3bJqQ9BKL5P/1GAdZhjWtteJ3Owg750qdahAC7yBy
	7k59m2QWZdCM5pQYYR1yfXAjLPIMnERP3+MB+vwiGAUJZebkXW8kDqrOiLB4ElNHbk2ku3kAPrbFz
	boSOanQ4Lp7gOBbqql9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHT7k-006Yg0-SW; Fri, 29 Jul 2022 16:46:04 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHSyG-006SI9-Ts; Fri, 29 Jul 2022 16:36:18 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailnew.nyi.internal (Postfix) with ESMTP id 3B6D7580949;
	Fri, 29 Jul 2022 12:36:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 29 Jul 2022 12:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1659112576; x=
	1659119776; bh=WMi8XIOWER3wpbQVpH8wVwWCJ4/RYaQCGvT7XxQHSyU=; b=B
	4ax9evUCqBTSCfQ8ar7yIeQHl3UM16fH/2o6nETKuuy2NmyD6v3Wrpph5P1ZZaeb
	MtbuVsTcUNG6rcxG30bubxvvx72kc7K49DiiMtlux2ntypCfzwhxfuRvtFta+yuN
	rYTRSj76sCU34Q43lrFjvnki0FYA0Y6EqCf1C7vYbWE3PATjLn2gnKZvl8qibdwk
	nwE45B22ZyG/Wbc0SYVXBq/19F6XlH4xibfy7US3WUlsp17UlpHXgo2igPDWf4Dp
	+Mh6GrrFuDPLliK8xDSYMmomHWntA2hDMFC4mSNO/qhdwCFYve1PjXXr8fOoEZ9t
	4WguQ8bMboufRrGCanvvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659112576; x=
	1659119776; bh=WMi8XIOWER3wpbQVpH8wVwWCJ4/RYaQCGvT7XxQHSyU=; b=p
	yPkT9S1MUihXebCXbRkPEvGjTAm8sR4/ddY/iDVvmnOxzIECrYeHuy1BF94le/+i
	ZO7BUdL2XKnabBofH1/H8LU9YJfnFJAFrOGjgsQYQfrl23qwTFt7v36Q5CvjTilL
	5j18dDTKcc2AdrV3TYOByblmnuW4B+rnWH9qxcCkZVOMxPdp3z5/p3yoL1s9uplf
	kjrrFYhf9cPnqK7JvS22pVPdkSNO6dRGZV4q3SjAB9PSvbqbgf5HP0BZtFSVZY6f
	bp7zx1qfEcCIMDGoTWMRfyw2/PlJe5HDa0tDGOpE/EV2nX9hAgud0xRPcADTl2Um
	hiB1oVIG+mxJjUMYCnL5Q==
X-ME-Sender: <xms:gAzkYnGtxVV6xj3qrPqoKkLS19YwY6_C6E8LyrB2pzhfVqrxteFQEg>
    <xme:gAzkYkV7IEm0NIqOsJjEiBST66lMy1ant8cn6dwsLuASU5Ybf_TLcZLxdANFXL5wG
    AGSyTRCegx2-BNvzKU>
X-ME-Received: <xmr:gAzkYpLSkMLCnkuvXbhWZvRyWybv6PpZ_ILue6qKFPnBmR9VJ7sG_jrQN1BsWjZ15fZlUJMRW06eCAKSOJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefo
    rgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecugg
    ftrfgrthhtvghrnhepgfffgfetffduudelhfevieffffduleevgfegkeeutefgffejheel
    leekjeefhfejnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrh
    homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gAzkYlFAVPQG2LETkJdbc5AD2RS6XP1Za6DJd22fiTYnlZvzTS3Zbg>
    <xmx:gAzkYtXsl37Siabpt1y6ywMloLehH0BVGFeV_VVqXeFLm0bG6-vrqQ>
    <xmx:gAzkYgPRufCWkiumoUbhJH-QhuXWXBkuvepBUDWBIqePvk4G6Yos_g>
    <xmx:gAzkYrllfsj4Nji758Gd0v3zAuxlRk47LyCDYvTk6J3eqsSPNXoPNA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Jul 2022 12:36:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel@ffwll.ch>,
	Emma Anholt <emma@anholt.net>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v1 14/35] drm/atomic-helper: Add an analog TV atomic_check implementation
Date: Fri, 29 Jul 2022 18:34:57 +0200
Message-Id: <20220728-rpi-analog-tv-properties-v1-14-3d53ae722097@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-49460
X-Developer-Signature: v=1; a=openpgp-sha256; l=4069; i=maxime@cerno.tech; h=from:subject:message-id; bh=mddk/xQKK35DXd7zEHlpZoAU4iNlEj6U3dcQfuJB3RU=; b=owGbwMvMwCHc4XzqmfnC7acZT6slMSQ94VG6v/WYqwCDxI1bU1PN5rbfZLfvjkkO/f6U6XJLl8vr d9lMHaUsDMIcDLJiiizXBd/a8YVFuUXwfNgMM4eVCWQIAxenAEzEchLDP6uu70V5Ag/e7xSon+sfZ2 Ud6rkpOuPgnymT73NmqLxQY2X4w1O++uWVZOX93Mfnl4sxyP95ZbKjtpFhrkjyytA3BlNikwE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp; fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_093617_090439_6CC4F841 
X-CRM114-Status: GOOD (  11.44  )
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

The analog TV connector drivers share some atomic_check logic, and the new
TV standard property have created a bunch of new constraints that needs to
be shared across drivers too.

Let's create an atomic_check helper for those use cases.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 6d14cb0c64b1..fce5569bd66a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -552,6 +552,93 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * @drm_atomic_helper_connector_tv_check: Validate an analog TV connector state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Checks the state object to see if the requested state is valid for an
+ * analog TV connector.
+ *
+ * Returns:
+ * Zero for success, a negative error code on error.
+ */
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state)
+{
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_connector_state *new_conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+
+	crtc = new_conn_state->crtc;
+	if (!crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	if (!crtc_state)
+		return -EINVAL;
+
+	switch (new_conn_state->tv.norm) {
+	case DRM_MODE_TV_NORM_NTSC_443:
+		fallthrough;
+	case DRM_MODE_TV_NORM_NTSC_J:
+		fallthrough;
+	case DRM_MODE_TV_NORM_NTSC_M:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_M:
+		mode = &drm_mode_480i;
+		break;
+
+	case DRM_MODE_TV_NORM_PAL_60:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_B:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_D:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_G:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_H:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_I:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_N:
+		fallthrough;
+	case DRM_MODE_TV_NORM_PAL_NC:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_60:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_B:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_D:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_G:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_K:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_K1:
+		fallthrough;
+	case DRM_MODE_TV_NORM_SECAM_L:
+		mode = &drm_mode_576i;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	if (!drm_mode_equal(mode, &crtc_state->mode))
+		return -EINVAL;
+
+	if (old_conn_state->tv.norm != new_conn_state->tv.norm)
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index c8fbce795ee7..b9740edb2658 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -26,6 +26,7 @@
 
 #include <linux/types.h>
 
+struct drm_atomic_state;
 struct drm_bridge;
 struct drm_bridge_state;
 struct drm_crtc;
@@ -71,6 +72,8 @@ void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
+					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector,

-- 
b4 0.10.0-dev-49460

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
