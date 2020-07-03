Return-Path: <SRS0=oWvG=AO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2218FC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D712D206A1
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2020 08:08:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CcTN8NLm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xh3BFJRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D712D206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JbMaVpiJa9n24Us3Qgqq2C5lakACHhh4yYqk7zNdRs4=; b=CcTN8NLmgjb6bKzJyJDtM5TKe
	FzGVNx1hscGjngsnCNuHyJXTbGR5PGXjT3JRRRet3hgKzzgZjAZjkqf4vdxr3Mplf3sdT7u+dSQ0u
	mKxD+5ZGvt8rNv+Qv64G7fpwp/hZjNNBYL6YaPMsTG6G/fSSKZwhxnKP8ZCLf1V94mEfimg676d54
	RwmBrYRGt46mcRroyHl5uB4Olv2foLkSBYx+F3Vf41aCr55NdcLDos9OyOtKEmqTh44/kR/iOQydy
	E6CG7GHi7TTZWL+NoztK04vIBDpN3LzIccsnp6BVimIg0vAUsAyLcqBbDF3zH/g5dMbQRI6tJr5yU
	zD5h0Nfxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGk7-0002U3-I0; Fri, 03 Jul 2020 08:08:19 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGjX-0002Cs-BW
 for linux-amlogic@lists.infradead.org; Fri, 03 Jul 2020 08:07:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id w3so20649755wmi.4
 for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2020 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cfI2fKFM+p7RzrF1h3Pj2BcEge+YynySXbP1sh4lra4=;
 b=xh3BFJRHbw5TJYmGs2eTT5061u2Ef2D5i1hfRpl4Iht2kuvuGceS/SI1vjmLqI8psm
 ZfrwopWX8lX8iPAA+Ba2LtESDMzEJ0SQK6jFjLgBiwmD+L7SoZibU957Ywsy12GuZEk1
 33FCwrnts8hkObrP3j7U1cvhEuB46EK0Xp56cVpKZD1pU7FYRCS4XJk9rDRMyj2F2Usq
 xWSv0YBcgdvzR1BpJx95h85Kh5uQZGudaGD21l4Xf7HmsaynKXQo6l0AhF8gVC4bvxfT
 a8fw+FT++ulxaVoqOcXNVt7iUwFyfbyIwSkkW89dKhRRPeNPf3zXVRMxu0urdRFCZlhR
 Ep5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cfI2fKFM+p7RzrF1h3Pj2BcEge+YynySXbP1sh4lra4=;
 b=gbrdnl+4ijMjoc7wy/5kvTyxVY0KFbyOi5uKdn7QmxZ06aT8ZAEnUz7nsIpFoKDi4J
 cvFLma6ZHBS8koz4bGUgRa7QmFGP6R1WDI+hPeuMc9PgRD/Ly24DYCX6igC3Ot6mybe9
 CJOKZs+Ea4XghVs5yJyhPNkRvN6pKKbbTG4q6ZvkTV6w7O6JZQvCILmO4aVLLouHcVs3
 JbtN6bGtYTtixGJ9AHnhu4Z0m417z4ZdPhZwi7ojDthOYb6qFUov6MCZSGe+SXUQWKru
 YBbOKwE9PI/EtqaXxLbvXgIAB1nQZVxpng/boAEQ3lueIFjwK7Z8JK2Z+ByInRWi0ich
 wdbg==
X-Gm-Message-State: AOAM531v4WNjDhHvmNt7J+HCSXcF22Gr0f2wGzQ4yg/DQf4nQAcpPy6t
 ypGRpPAL8+jHiVie/bDOi2n2BA==
X-Google-Smtp-Source: ABdhPJzKEtHPQbE0g5aj/mAdPR2Glho6/ThkVNt9RuVu8z9w/s8eobdiuqj8YkjrKCER7BXbWHV8qg==
X-Received: by 2002:a1c:2e47:: with SMTP id u68mr36803790wmu.45.1593763662335; 
 Fri, 03 Jul 2020 01:07:42 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id 1sm12682403wmf.0.2020.07.03.01.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:07:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v9 3/6] drm/meson: overlay: setup overlay for Amlogic FBC
Date: Fri,  3 Jul 2020 10:07:25 +0200
Message-Id: <20200703080728.25207-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200703080728.25207-1-narmstrong@baylibre.com>
References: <20200703080728.25207-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_040743_615056_BB245A13 
X-CRM114-Status: GOOD (  18.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: jianxin.pan@amlogic.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setup the Amlogic FBC decoder for the VD1 video overlay plane.

The VD1 Amlogic FBC decoder is integrated in the pipeline like the
YUV pixel reading/formatter but used a direct memory address instead.

This adds support for the basic layout, and needs to calculate the content
body size since the header is allocated after.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.h     |  16 ++
 drivers/gpu/drm/meson/meson_overlay.c | 251 +++++++++++++++++++++++++-
 2 files changed, 259 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index 5b23704a80d6..177dac3ca3be 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -86,6 +86,7 @@ struct meson_drm {
 
 		bool vd1_enabled;
 		bool vd1_commit;
+		bool vd1_afbc;
 		unsigned int vd1_planes;
 		uint32_t vd1_if0_gen_reg;
 		uint32_t vd1_if0_luma_x0;
@@ -111,6 +112,21 @@ struct meson_drm {
 		uint32_t vd1_height0;
 		uint32_t vd1_height1;
 		uint32_t vd1_height2;
+		uint32_t vd1_afbc_mode;
+		uint32_t vd1_afbc_en;
+		uint32_t vd1_afbc_head_addr;
+		uint32_t vd1_afbc_body_addr;
+		uint32_t vd1_afbc_conv_ctrl;
+		uint32_t vd1_afbc_dec_def_color;
+		uint32_t vd1_afbc_vd_cfmt_ctrl;
+		uint32_t vd1_afbc_vd_cfmt_w;
+		uint32_t vd1_afbc_vd_cfmt_h;
+		uint32_t vd1_afbc_mif_hor_scope;
+		uint32_t vd1_afbc_mif_ver_scope;
+		uint32_t vd1_afbc_size_out;
+		uint32_t vd1_afbc_pixel_hor_scope;
+		uint32_t vd1_afbc_pixel_ver_scope;
+		uint32_t vd1_afbc_size_in;
 		uint32_t vpp_pic_in_height;
 		uint32_t vpp_postblend_vd1_h_start_end;
 		uint32_t vpp_postblend_vd1_v_start_end;
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 2468b0212d52..293f606ba164 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -76,6 +76,84 @@
 #define VD_REGION24_START(value)	FIELD_PREP(GENMASK(11, 0), value)
 #define VD_REGION13_END(value)		FIELD_PREP(GENMASK(27, 16), value)
 
+/* AFBC_ENABLE */
+#define AFBC_DEC_ENABLE			BIT(8)
+#define AFBC_FRM_START			BIT(0)
+
+/* AFBC_MODE */
+#define AFBC_HORZ_SKIP_UV(value)	FIELD_PREP(GENMASK(1, 0), value)
+#define AFBC_VERT_SKIP_UV(value)	FIELD_PREP(GENMASK(3, 2), value)
+#define AFBC_HORZ_SKIP_Y(value)		FIELD_PREP(GENMASK(5, 4), value)
+#define AFBC_VERT_SKIP_Y(value)		FIELD_PREP(GENMASK(7, 6), value)
+#define AFBC_COMPBITS_YUV(value)	FIELD_PREP(GENMASK(13, 8), value)
+#define AFBC_COMPBITS_8BIT		0
+#define AFBC_COMPBITS_10BIT		(2 | (2 << 2) | (2 << 4))
+#define AFBC_BURST_LEN(value)		FIELD_PREP(GENMASK(15, 14), value)
+#define AFBC_HOLD_LINE_NUM(value)	FIELD_PREP(GENMASK(22, 16), value)
+#define AFBC_MIF_URGENT(value)		FIELD_PREP(GENMASK(25, 24), value)
+#define AFBC_REV_MODE(value)		FIELD_PREP(GENMASK(27, 26), value)
+#define AFBC_BLK_MEM_MODE		BIT(28)
+#define AFBC_SCATTER_MODE		BIT(29)
+#define AFBC_SOFT_RESET			BIT(31)
+
+/* AFBC_SIZE_IN */
+#define AFBC_HSIZE_IN(value)		FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_VSIZE_IN(value)		FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_DEC_DEF_COLOR */
+#define AFBC_DEF_COLOR_Y(value)		FIELD_PREP(GENMASK(29, 20), value)
+#define AFBC_DEF_COLOR_U(value)		FIELD_PREP(GENMASK(19, 10), value)
+#define AFBC_DEF_COLOR_V(value)		FIELD_PREP(GENMASK(9, 0), value)
+
+/* AFBC_CONV_CTRL */
+#define AFBC_CONV_LBUF_LEN(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_LBUF_DEPTH */
+#define AFBC_DEC_LBUF_DEPTH(value)	FIELD_PREP(GENMASK(27, 16), value)
+#define AFBC_MIF_LBUF_DEPTH(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_OUT_XSCOPE/AFBC_SIZE_OUT */
+#define AFBC_HSIZE_OUT(value)		FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_VSIZE_OUT(value)		FIELD_PREP(GENMASK(12, 0), value)
+#define AFBC_OUT_HORZ_BGN(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_OUT_HORZ_END(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_OUT_YSCOPE */
+#define AFBC_OUT_VERT_BGN(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_OUT_VERT_END(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_VD_CFMT_CTRL */
+#define AFBC_HORZ_RPT_PIXEL0		BIT(23)
+#define AFBC_HORZ_Y_C_RATIO(value)	FIELD_PREP(GENMASK(22, 21), value)
+#define AFBC_HORZ_FMT_EN		BIT(20)
+#define AFBC_VERT_RPT_LINE0		BIT(16)
+#define AFBC_VERT_INITIAL_PHASE(value)	FIELD_PREP(GENMASK(11, 8), value)
+#define AFBC_VERT_PHASE_STEP(value)	FIELD_PREP(GENMASK(7, 1), value)
+#define AFBC_VERT_FMT_EN		BIT(0)
+
+/* AFBC_VD_CFMT_W */
+#define AFBC_VD_V_WIDTH(value)		FIELD_PREP(GENMASK(11, 0), value)
+#define AFBC_VD_H_WIDTH(value)		FIELD_PREP(GENMASK(27, 16), value)
+
+/* AFBC_MIF_HOR_SCOPE */
+#define AFBC_MIF_BLK_BGN_H(value)	FIELD_PREP(GENMASK(25, 16), value)
+#define AFBC_MIF_BLK_END_H(value)	FIELD_PREP(GENMASK(9, 0), value)
+
+/* AFBC_MIF_VER_SCOPE */
+#define AFBC_MIF_BLK_BGN_V(value)	FIELD_PREP(GENMASK(27, 16), value)
+#define AFBC_MIF_BLK_END_V(value)	FIELD_PREP(GENMASK(11, 0), value)
+
+/* AFBC_PIXEL_HOR_SCOPE */
+#define AFBC_DEC_PIXEL_BGN_H(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_DEC_PIXEL_END_H(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_PIXEL_VER_SCOPE */
+#define AFBC_DEC_PIXEL_BGN_V(value)	FIELD_PREP(GENMASK(28, 16), value)
+#define AFBC_DEC_PIXEL_END_V(value)	FIELD_PREP(GENMASK(12, 0), value)
+
+/* AFBC_VD_CFMT_H */
+#define AFBC_VD_HEIGHT(value)		FIELD_PREP(GENMASK(12, 0), value)
+
 struct meson_overlay {
 	struct drm_plane base;
 	struct meson_drm *priv;
@@ -157,6 +235,9 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	unsigned int ratio_x, ratio_y;
 	int temp_height, temp_width;
 	unsigned int w_in, h_in;
+	int afbc_left, afbc_right;
+	int afbc_top_src, afbc_bottom_src;
+	int afbc_top, afbc_bottom;
 	int temp, start, end;
 
 	if (!crtc_state) {
@@ -169,7 +250,7 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 
 	w_in = fixed16_to_int(state->src_w);
 	h_in = fixed16_to_int(state->src_h);
-	crop_top = fixed16_to_int(state->src_x);
+	crop_top = fixed16_to_int(state->src_y);
 	crop_left = fixed16_to_int(state->src_x);
 
 	video_top = state->crtc_y;
@@ -243,6 +324,14 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	DRM_DEBUG("vsc startp %d endp %d start_lines %d end_lines %d\n",
 		 vsc_startp, vsc_endp, vd_start_lines, vd_end_lines);
 
+	afbc_top = round_down(vd_start_lines, 4);
+	afbc_bottom = round_up(vd_end_lines + 1, 4);
+	afbc_top_src = 0;
+	afbc_bottom_src = round_up(h_in + 1, 4);
+
+	DRM_DEBUG("afbc top %d (src %d) bottom %d (src %d)\n",
+		  afbc_top, afbc_top_src, afbc_bottom, afbc_bottom_src);
+
 	/* Horizontal */
 
 	start = video_left + video_width / 2 - ((w_in << 17) / ratio_x);
@@ -278,6 +367,16 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 	DRM_DEBUG("hsc startp %d endp %d start_lines %d end_lines %d\n",
 		 hsc_startp, hsc_endp, hd_start_lines, hd_end_lines);
 
+	if (hd_start_lines > 0 || (hd_end_lines < w_in)) {
+		afbc_left = 0;
+		afbc_right = round_up(w_in, 32);
+	} else {
+		afbc_left = round_down(hd_start_lines, 32);
+		afbc_right = round_up(hd_end_lines + 1, 32);
+	}
+
+	DRM_DEBUG("afbc left %d right %d\n", afbc_left, afbc_right);
+
 	priv->viu.vpp_vsc_start_phase_step = ratio_y << 6;
 
 	priv->viu.vpp_vsc_ini_phase = vphase << 8;
@@ -293,6 +392,35 @@ static void meson_overlay_setup_scaler_params(struct meson_drm *priv,
 			VD_H_WIDTH(hd_end_lines - hd_start_lines + 1) |
 			VD_V_WIDTH(hd_end_lines/2 - hd_start_lines/2 + 1);
 
+	priv->viu.vd1_afbc_vd_cfmt_w =
+			AFBC_VD_H_WIDTH(afbc_right - afbc_left) |
+			AFBC_VD_V_WIDTH(afbc_right / 2 - afbc_left / 2);
+
+	priv->viu.vd1_afbc_vd_cfmt_h =
+			AFBC_VD_HEIGHT((afbc_bottom - afbc_top) / 2);
+
+	priv->viu.vd1_afbc_mif_hor_scope = AFBC_MIF_BLK_BGN_H(afbc_left / 32) |
+				AFBC_MIF_BLK_END_H((afbc_right / 32) - 1);
+
+	priv->viu.vd1_afbc_mif_ver_scope = AFBC_MIF_BLK_BGN_V(afbc_top / 4) |
+				AFBC_MIF_BLK_END_H((afbc_bottom / 4) - 1);
+
+	priv->viu.vd1_afbc_size_out =
+			AFBC_HSIZE_OUT(afbc_right - afbc_left) |
+			AFBC_VSIZE_OUT(afbc_bottom - afbc_top);
+
+	priv->viu.vd1_afbc_pixel_hor_scope =
+			AFBC_DEC_PIXEL_BGN_H(hd_start_lines - afbc_left) |
+			AFBC_DEC_PIXEL_END_H(hd_end_lines - afbc_left);
+
+	priv->viu.vd1_afbc_pixel_ver_scope =
+			AFBC_DEC_PIXEL_BGN_V(vd_start_lines - afbc_top) |
+			AFBC_DEC_PIXEL_END_V(vd_end_lines - afbc_top);
+
+	priv->viu.vd1_afbc_size_in =
+				AFBC_HSIZE_IN(afbc_right - afbc_left) |
+				AFBC_VSIZE_IN(afbc_bottom_src - afbc_top_src);
+
 	priv->viu.vd1_if0_luma_y0 = VD_Y_START(vd_start_lines) |
 				    VD_Y_END(vd_end_lines);
 
@@ -350,11 +478,57 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	spin_lock_irqsave(&priv->drm->event_lock, flags);
 
-	priv->viu.vd1_if0_gen_reg = VD_URGENT_CHROMA |
-				    VD_URGENT_LUMA |
-				    VD_HOLD_LINES(9) |
-				    VD_CHRO_RPT_LASTL_CTRL |
-				    VD_ENABLE;
+	if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
+			    DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
+		priv->viu.vd1_afbc = true;
+
+		priv->viu.vd1_afbc_mode = AFBC_MIF_URGENT(3) |
+					  AFBC_HOLD_LINE_NUM(8) |
+					  AFBC_BURST_LEN(2);
+
+		priv->viu.vd1_afbc_en = 0x1600 | AFBC_DEC_ENABLE;
+
+		priv->viu.vd1_afbc_conv_ctrl = AFBC_CONV_LBUF_LEN(256);
+
+		priv->viu.vd1_afbc_dec_def_color = AFBC_DEF_COLOR_Y(1023);
+
+		/* 420: horizontal / 2, vertical / 4 */
+		priv->viu.vd1_afbc_vd_cfmt_ctrl = AFBC_HORZ_RPT_PIXEL0 |
+						  AFBC_HORZ_Y_C_RATIO(1) |
+						  AFBC_HORZ_FMT_EN |
+						  AFBC_VERT_RPT_LINE0 |
+						  AFBC_VERT_INITIAL_PHASE(12) |
+						  AFBC_VERT_PHASE_STEP(8) |
+						  AFBC_VERT_FMT_EN;
+
+		switch (fb->format->format) {
+		/* AFBC Only formats */
+		case DRM_FORMAT_YUV420_10BIT:
+			priv->viu.vd1_afbc_mode |=
+				AFBC_COMPBITS_YUV(AFBC_COMPBITS_10BIT);
+			priv->viu.vd1_afbc_dec_def_color |=
+					AFBC_DEF_COLOR_U(512) |
+					AFBC_DEF_COLOR_V(512);
+			break;
+		case DRM_FORMAT_YUV420_8BIT:
+			priv->viu.vd1_afbc_dec_def_color |=
+					AFBC_DEF_COLOR_U(128) |
+					AFBC_DEF_COLOR_V(128);
+			break;
+		}
+
+		priv->viu.vd1_if0_gen_reg = 0;
+		priv->viu.vd1_if0_canvas0 = 0;
+		priv->viu.viu_vd1_fmt_ctrl = 0;
+	} else {
+		priv->viu.vd1_afbc = false;
+
+		priv->viu.vd1_if0_gen_reg = VD_URGENT_CHROMA |
+					    VD_URGENT_LUMA |
+					    VD_HOLD_LINES(9) |
+					    VD_CHRO_RPT_LASTL_CTRL |
+					    VD_ENABLE;
+	}
 
 	/* Setup scaler params */
 	meson_overlay_setup_scaler_params(priv, plane, interlace_mode);
@@ -370,6 +544,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	priv->viu.vd1_if0_gen_reg2 = 0;
 	priv->viu.viu_vd1_fmt_ctrl = 0;
 
+	/* None will match for AFBC Only formats */
 	switch (fb->format->format) {
 	/* TOFIX DRM_FORMAT_RGB888 should be supported */
 	case DRM_FORMAT_YUYV:
@@ -488,13 +663,28 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
 			drm_format_info_plane_height(fb->format,
-						fb->height, 0);
+						     fb->height, 0);
 		DRM_DEBUG("plane 0 addr 0x%x stride %d height %d\n",
 			 priv->viu.vd1_addr0,
 			 priv->viu.vd1_stride0,
 			 priv->viu.vd1_height0);
 	}
 
+	if (priv->viu.vd1_afbc) {
+		unsigned long body_size;
+
+		/* Default mode is 4k per superblock */
+		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
+			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
+			    4096;
+
+		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
+
+		/* Header is after body content */
+		priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
+						body_size) >> 4;
+	}
+
 	priv->viu.vd1_enabled = true;
 
 	spin_unlock_irqrestore(&priv->drm->event_lock, flags);
@@ -531,6 +721,42 @@ static const struct drm_plane_helper_funcs meson_overlay_helper_funcs = {
 	.prepare_fb	= drm_gem_fb_prepare_fb,
 };
 
+static bool meson_overlay_format_mod_supported(struct drm_plane *plane,
+					       u32 format, u64 modifier)
+{
+	if (modifier == DRM_FORMAT_MOD_LINEAR &&
+	    format != DRM_FORMAT_YUV420_8BIT &&
+	    format != DRM_FORMAT_YUV420_10BIT)
+		return true;
+
+	if ((modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) ==
+			DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
+		unsigned int layout = modifier &
+			DRM_FORMAT_MOD_AMLOGIC_FBC(
+				__fourcc_mod_amlogic_layout_mask, 0);
+
+		if (format != DRM_FORMAT_YUV420_8BIT &&
+		    format != DRM_FORMAT_YUV420_10BIT) {
+			DRM_DEBUG_KMS("%llx invalid format 0x%08x\n",
+				      modifier, format);
+			return false;
+		}
+
+		if (layout != AMLOGIC_FBC_LAYOUT_BASIC) {
+			DRM_DEBUG_KMS("%llx invalid layout %x\n",
+				      modifier, layout);
+			return false;
+		}
+
+		return true;
+	}
+
+	DRM_DEBUG_KMS("invalid modifier %llx for format 0x%08x\n",
+		      modifier, format);
+
+	return false;
+}
+
 static const struct drm_plane_funcs meson_overlay_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
@@ -538,6 +764,7 @@ static const struct drm_plane_funcs meson_overlay_funcs = {
 	.reset			= drm_atomic_helper_plane_reset,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.format_mod_supported   = meson_overlay_format_mod_supported,
 };
 
 static const uint32_t supported_drm_formats[] = {
@@ -549,6 +776,14 @@ static const uint32_t supported_drm_formats[] = {
 	DRM_FORMAT_YUV420,
 	DRM_FORMAT_YUV411,
 	DRM_FORMAT_YUV410,
+	DRM_FORMAT_YUV420_8BIT, /* Amlogic FBC Only */
+	DRM_FORMAT_YUV420_10BIT, /* Amlogic FBC Only */
+};
+
+static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(AMLOGIC_FBC_LAYOUT_BASIC, 0),
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
 };
 
 int meson_overlay_create(struct meson_drm *priv)
@@ -570,7 +805,7 @@ int meson_overlay_create(struct meson_drm *priv)
 				 &meson_overlay_funcs,
 				 supported_drm_formats,
 				 ARRAY_SIZE(supported_drm_formats),
-				 NULL,
+				 format_modifiers,
 				 DRM_PLANE_TYPE_OVERLAY, "meson_overlay_plane");
 
 	drm_plane_helper_add(plane, &meson_overlay_helper_funcs);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
