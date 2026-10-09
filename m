Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6009CA6018
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zN0Gm5hE0HKg4YVAOhmSMlOKXJBrmW/YJr7WNmdiS3Q=; b=xARhRq+8qcXfyq
	PGf41/aWIyoAnKQWCKAX+vKVsYxzuLJ/75bGqlgarEhmgrKgtSibkwrJvQmytSPhpH6ET9DLQDGnH
	hiT2KN7iYBMfDItwJrqUB7AjP4/VOpHWMYnBZdJHn2PVppHQ0pGpazNcUwqhGmnjemsNYvXFknnvh
	NN3yuoEK3NI4hngh6P9+P6uLcw9ZZ3UmujJcpUUYW5qmHI9OOYF4hNAHMSgTJFSr56dNQGFQ3JICB
	yLU/EPlk4PnFABmRt4dFQI0o7CHX5ILAtGqbJdOFsPVVpgM8xHjzDyON5ttCrkcCEDboSyzrXfrzh
	IyXn3Gu6DT3F1Y1gn9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF196-00000005LKA-40wh;
	Fri, 09 Oct 2026 03:19:45 +0000
Received: from bg1.exmail.qq.com ([114.132.67.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF192-00000005LFz-42sL
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:19:43 +0000
X-QQ-mid: zesmtpip2t1791515894t20c7defa
X-QQ-Originating-IP: H7Kooy3yqBqiyxSuF7438iHYpJDCYTk8sfL6xx8MS0k=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:18:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8526450771588656954
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:10 +0800
Subject: [PATCH v2 18/20] drm/msm/dp: Signal BT.2020 RGB on DP and eDP
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-18-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5813; i=sophon@radxa.com;
 h=from:subject:message-id; bh=Oxlz9Sje4uCHtlqrFSjpgKTVSxpth0UV9V4v7U/5ggM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlYFJaxZuvn9xn17FT+/7BYqYzHMNM7tWP9nz+2fE
 //5LfHa1FHKwiDGxSArpsiiEM8wl70y99pTsVI9mDmsTCBDGLg4BWAiLh8Y/ocuinwSvsPO5te0
 vXaTM+LPNAv3pzV4+U4u92GPqZWMuszIsFXY4czPU9wHv98SMUx8+kdskqtC5uN7r+OuXy9ew7O
 jkhMA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MUe2PhP7Eq792DnaTkf4DSzdiwQo2uLfLHU0VCUcCbsGbz3XeARMvTRg
	i9IKyNJPeUgEosd357IT0QLAUSA9Yxqe3aI5XwWhUg5TvLPSf5Rmy/HeDO70io31KMqh2uE
	7kQ8dZXEYAuZFOSUvwUXM8yveFOwiCejkg/NK3MfxxxNZWDuXbWtNctwSVH8LNggbMvDDow
	YNKJcOIiWYj97S57Ao4WUdKrHfhB3hMeAnVXY6u6VVjrbe8KxxzjiLjreYYnUZW23TbHHUq
	sjHsuyy8usLwCuGnp0eumFiydRJThna6ZvO78CYw2OQPU2cUKzvVBEwu14f64v9O+qLFN0o
	jWumMo54X1ySgcyi/MmPNRk3tJD5wAeoSLLHpQfpus1ydVdWdZOhFsJtO3GADTnhzkzYEfc
	obS+udEEOSJqgcUku4LyIyg71O2oIXZu4HNhGVYp+mDDWoKojuIRgRWCr2AoGDmeXDaJ9T1
	f9fdY4kDpU5MQAIKSgwN5fSYy1Sq5L0hstk0AZXwBRHpiBvmdKED91tgrgcbpgTu5Ivsjoz
	XmZ8GQw4pv9pywHdmF10woj90bxEqgVPf2WYnxgzk7VqpACVSdHCJBQfmrV+7jVEgoRH2pm
	zSN+2PGzOcOS0+PLuUgew4GInEqL39jBpIdL8fgJMycUdsu2LZ+mwvuIS87bfOzfSczmZ0u
	Uo889As7gLtgEP5efx+Pe/CqFcb1OoThiWiz6rJOj73jSTHe8DHlND7FRUb7EeDXPTKtzwv
	0bhiQGCqQyvig9gEQrtF3LriW0AjW9HvL3teiGvfaNr3LqRT+qgtMRuYlRI6prq71AlqlrY
	0jqgoo8oXeMvIYluCjhyDsTcXgxXKzjnWmXEtlLwe4Iys7euSdysgZB+QhW3Yr7fzfs45s9
	gRd9C6NqsmxV9732ScQXQLyKLBVJsh405lQ48abFzQgBPfOYo5Popmex3evn0KIGyxKw8cH
	OgtpdZ+ufFXLpPDPhGRpBLE6TW6Eu5VtjYOoMvPjdawjCxW4DoHZ/jSl7g6OOuAr/Xy9vgi
	aal6bht+hj/yd0XhJ+XhGMDTM2dIlW1PExyap2piDkeYuvGwibV9Qxs1kI38whK/QAsiPw5
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201941_460429_5311B22A 
X-CRM114-Status: GOOD (  16.83  )
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

Expose the standard DP Colorspace property with BT2020_RGB support and
carry the selected colorspace in bridge atomic state. Force a modeset
when it changes so the stream receives the corresponding VSC packet.

Signal full-range RGB to match the existing pixel path and retain CTA
range for YUV420. Reject BT2020_RGB with a YUV420-only mode. Reuse the
preceding VSC state, update and PSR handling for the new colorimetry.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
 drivers/gpu/drm/msm/dp/dp_drm.c     |  9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_utils.c   | 12 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h   |  3 +++
 6 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 2fd8dd456852..a1a649c636c7 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2669,7 +2669,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 		/* Compliance tests may override the checked stream depth. */
 		if (panel->video_test) {
 			ret = msm_dp_utils_pack_vsc_sdp(&test_vsc_sdp,
-							DRM_MODE_COLORIMETRY_DEFAULT,
+							state->colorspace,
 							panel->msm_dp_mode.bpp / 3,
 							panel->msm_dp_mode.out_fmt_is_yuv_420);
 			if (ret)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5a9162712540..34e1c48cdd79 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -728,14 +728,16 @@ int msm_dp_display_atomic_check(struct msm_dp *msm_dp_display,
 		return bpp;
 
 	state->bpp = bpp;
-	state->vsc_enabled = drm_mode_is_420_only(info, mode);
+	state->colorspace = conn_state->colorspace;
+	state->vsc_enabled = drm_mode_is_420_only(info, mode) ||
+			     state->colorspace != DRM_MODE_COLORIMETRY_DEFAULT;
 	if (!state->vsc_enabled)
 		return 0;
 
 	if (dp->panel->link_caps_valid && !dp->panel->vsc_sdp_supported)
 		return -EINVAL;
 
-	return msm_dp_utils_pack_vsc_sdp(&state->vsc_sdp, DRM_MODE_COLORIMETRY_DEFAULT,
+	return msm_dp_utils_pack_vsc_sdp(&state->vsc_sdp, state->colorspace,
 					bpp / 3, drm_mode_is_420_only(info, mode));
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 808b6fe3d650..0d17536f02fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -171,7 +171,7 @@ static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	old_conn_state = drm_atomic_get_old_connector_state(conn_state->state,
 							    conn_state->connector);
-	if (old_conn_state->max_requested_bpc != conn_state->max_requested_bpc)
+	if (msm_dp_utils_needs_modeset(old_conn_state, conn_state))
 		crtc_state->mode_changed = true;
 
 	return 0;
@@ -456,11 +456,18 @@ struct drm_connector *msm_dp_drm_connector_init(struct msm_dp *msm_dp_display,
 					    struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = NULL;
+	int ret;
 
 	connector = drm_bridge_connector_init(msm_dp_display->drm_dev, encoder);
 	if (IS_ERR(connector))
 		return connector;
 
+	ret = drm_mode_create_dp_colorspace_property(connector,
+						     BIT(DRM_MODE_COLORIMETRY_BT2020_RGB));
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_attach_colorspace_property(connector);
+
 	if (!msm_dp_display->is_edp)
 		drm_connector_attach_dp_subconnector_property(connector);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 122150d95bbb..0e85a1a55c88 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -20,6 +20,7 @@ struct msm_dp_bridge {
 struct msm_dp_bridge_state {
 	struct drm_bridge_state base;
 	u32 bpp;
+	enum drm_colorspace colorspace;
 	bool vsc_enabled;
 	struct dp_sdp vsc_sdp;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index bde627a6701b..431c18aa2096 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -140,6 +140,11 @@ int msm_dp_utils_pack_vsc_sdp(struct dp_sdp *sdp, enum drm_colorspace colorspace
 	case DRM_MODE_COLORIMETRY_DEFAULT:
 		vsc.colorimetry = DP_COLORIMETRY_DEFAULT;
 		break;
+	case DRM_MODE_COLORIMETRY_BT2020_RGB:
+		if (yuv420)
+			return -EINVAL;
+		vsc.colorimetry = DP_COLORIMETRY_BT2020_RGB;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -148,6 +153,13 @@ int msm_dp_utils_pack_vsc_sdp(struct dp_sdp *sdp, enum drm_colorspace colorspace
 	return ret < 0 ? ret : 0;
 }
 
+bool msm_dp_utils_needs_modeset(struct drm_connector_state *old_state,
+				struct drm_connector_state *new_state)
+{
+	return old_state->max_requested_bpc != new_state->max_requested_bpc ||
+	       old_state->colorspace != new_state->colorspace;
+}
+
 bool msm_dp_utils_psr_needs_modeset(const struct drm_crtc_state *state)
 {
 	/* active_changed alone also describes a normal self-refresh exit. */
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index e916de2a5929..81773db75c60 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -46,6 +46,9 @@ int msm_dp_utils_select_bpp(unsigned int bpc, unsigned int max_bpc,
 int msm_dp_utils_pack_vsc_sdp(struct dp_sdp *sdp, enum drm_colorspace colorspace,
 			      unsigned int bpc, bool yuv420);
 
+bool msm_dp_utils_needs_modeset(struct drm_connector_state *old_state,
+				struct drm_connector_state *new_state);
+
 bool msm_dp_utils_psr_needs_modeset(const struct drm_crtc_state *state);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
