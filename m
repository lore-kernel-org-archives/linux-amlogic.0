Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE723CA6015
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5G+m7qh1I91i72d79QvBYqrmAZLsDMZdVbG979DUxqI=; b=XCsagG20n6ZUW7
	hae876CFBQG2hTpyMUB0yupXwDyGS/AxUlonDPjJ/GI7JYXUrY7RKXZ+2SG/IpbI4qPOxEMd8Hiqp
	7hsf/eylz8LwBNeFpySfjm5I3iaqJF0LCvHVT06Uk8TJLXp+j3oZ5tu1PUsRqIgWQt4lbL8A3oLjp
	RZagvXFLwH551ng5qUJZ+05MIvNcTRfdA1of0jNxyubW/8V+oHunMV9gzVBulM9mXi6L29Q+5kHub
	PgAqpT47MEwtjHTIG32+Cnryov2xPEJQD59YHuj/IQwObaoLYsOctE2yH09ZIFH957aW9VTI0Ii/6
	swEJ+IcfT7oS6SejY9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18w-00000005LBl-3GOB;
	Fri, 09 Oct 2026 03:19:34 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18t-00000005Kot-3LQj
	for linux-amlogic@lists.infradead.org;
	Fri, 09 Oct 2026 03:19:33 +0000
X-QQ-mid: zesmtpip2t1791515886ta7242542
X-QQ-Originating-IP: l+W6hRlVtBHQfDWT8V5zz4miNkGZI0SAE1TvYswxTT0=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:18:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9731896443966331316
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:08 +0800
Subject: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
MIME-Version: 1.0
Message-Id: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5080; i=sophon@radxa.com;
 h=from:subject:message-id; bh=UjFIXijNr1pzmNLWjNFf1sbanjbBvQlfCd9rr2qiLaU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlZVBVVpuU+p3cWf4v31vXBZ2o2ZVZOu5KW/T5Lf2
 Kllzvu6o5SFQYyLQVZMkUUhnmEue2XutadipXowc1iZQIYwcHEKwEQezGBkuNjxsdN1b9v61IvP
 p8347R0Z2LJhgUqx5G7G5T+e2LCuqWH4Zx+yY1LK+o/czg7rD5ikq+X4mXud4tH/Gu8eftVm1vp
 ENgA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MN7J+qOXnZ1LDH2Nj3Cy8EmdqsBlYTKsQ30UcFhZ9dD8ZxYdG4lCGiQL
	AkEDrVv5lQOTiGvLBmKCBNmIXiDWg+PawGqzwAEK1ZJcHUwjjmuIGCNDCK/cWpcFaua/hwZ
	PnW/qsM1BxgpXUSd1J5WM8bPvTX6pV1wPOcNXGoSLKkXkdS6mp/1Fgp2Oqa8GtzKqRngNfc
	Bp5u8bTkziOIvTF/9YfOiE5yj01Fonre1FEBlrSZCQ2glEybwSFqpJPKFs/HZkep47wx6al
	xfQnh02Gt1/o+TaokaAaGF3rbzRLiQz8jTVDhEqnOh3NurJd0hMMAFWeI97lksE0ex+Q3Z+
	H6iFGVDLh3O4UdM/mkPDp9u/5cx+hPDPc8RH+9tqnX1DjJiRQOW0Ae+uDOKfTovD9pHbWBm
	5KyRI8DSb6sX8voL/Ia7hSwLfDYjIE+DwuOrxUDSsDTzzJpEKtcE5ThM5vvr+gRIuF+6Llv
	jvwQvLzZX8E5G5A3lL73MgrwILKBroNcbyTfYZydYaDZyA4txfC9kDDFv9W+ebPHjpLpuuU
	UtEwl4p5LAZXrzl5lHeOFYrVLJU5JMNamEwPLx39vUOQG9gpu33pnib+pwUeLvqvd/KRyEx
	IB1YFpRZdareiRrBKYXhEx+KsEb1WA+jGCIXI/mON2/tKFWjOuAUZOXLvpddONbbqJRwJFk
	PS6+yttkjmA4vLL8Syln9mNUTuU99deN7TlAfK7tGLG1oaf2mC+HoU40A+uv/837BRrcig2
	BIVvAZ1u4DtqXC2uUuRRKUgrVswGgTOjp4VWHNVoQXQynmJ8mC9l/CAY0SZa8c/2yomtU7t
	TB9txQjJEhkVKrFZM3vnYCkZBk3heunNIez07p46oCtGbZkV7Y+q1ZlQusiAEbbL8YpzgWr
	iBX2UBqAGruooa1l1OyQ/5wrhZZpJz2m46lcLJU/Eq1sICRZEHfdwOI7F7f6yVUi91Fg77A
	EBil8LIbkm77/ZfxhhwbKh0L638EjJcWquDFu3XYF3ii9sBH5u/6u8s0iCQT2wwQWmryhtV
	jhk5YQQ97cFRH+h3OL5QD8Am32A7iA08R4PPMCxUGFggSY+ReCmDR3z2gnJE+mT1ejPe1Tk
	q1g/RrBdT8l
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_201932_381029_B12405D9 
X-CRM114-Status: GOOD (  13.87  )
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

YUV420 uses colorimetry VSC packets, which cannot share the automatic
PSR packet generator. Do not advertise self-refresh eligibility for
these streams while disabling PSR in the controller and sink.

Compute eligibility after the common atomic check and reject an
incompatible self-refresh entry. Clear the automatic VSC generation bit
for YUV420 and restore PSR configuration when returning to RGB.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 783cafb22374..82ef8e405543 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -411,7 +411,7 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
 
 	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
 
-	if (msm_dp_panel->psr_cap.version)
+	if (msm_dp_panel->psr_cap.version && !msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
 	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
@@ -1914,7 +1914,7 @@ static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 }
 
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
-			    struct msm_dp_panel *panel)
+			    struct msm_dp_panel *panel, bool enable)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
@@ -1923,15 +1923,20 @@ void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (!panel->psr_cap.version)
 		return;
 
-	/* enable PSR1 function */
+	/* Colorimetry VSC packets cannot share the PSR packet generator. */
 	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
-	cfg |= PSR1_SUPPORTED;
+	if (enable)
+		cfg |= PSR1_SUPPORTED;
+	else
+		cfg &= ~PSR1_SUPPORTED;
 	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
 
-	msm_dp_ctrl_config_psr_interrupt(ctrl);
-	msm_dp_ctrl_enable_sdp(ctrl);
+	if (enable) {
+		msm_dp_ctrl_config_psr_interrupt(ctrl);
+		msm_dp_ctrl_enable_sdp(ctrl);
+	}
 
-	cfg = DP_PSR_ENABLE;
+	cfg = enable ? DP_PSR_ENABLE : 0;
 	drm_dp_dpcd_write(ctrl->aux, DP_PSR_EN_CFG, &cfg, 1);
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 42c5f847cb02..4dd604ef9f1b 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -46,7 +46,7 @@ void msm_dp_ctrl_irq_phy_exit(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl,
 			 struct msm_dp_panel *panel, bool enable);
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl,
-			    struct msm_dp_panel *panel);
+			    struct msm_dp_panel *panel, bool enable);
 
 int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 486348113b8a..234cb2373451 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -822,7 +822,8 @@ static int msm_dp_display_post_enable(struct msm_dp *msm_dp_display)
 	msm_dp_display_handle_plugged_change(msm_dp_display, true);
 
 	if (msm_dp_display->psr_supported)
-		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel);
+		msm_dp_ctrl_config_psr(dp->ctrl, dp->panel,
+				       !dp->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 9f1aa87a3687..6b01eeeb1aef 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -204,19 +204,27 @@ static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 				   struct drm_connector_state *conn_state)
 {
 	struct msm_dp *dp = to_dp_bridge(drm_bridge)->msm_dp_display;
+	int ret;
 
 	if (WARN_ON(!conn_state))
 		return -ENODEV;
 
-	conn_state->self_refresh_aware = dp->psr_supported;
-
+	conn_state->self_refresh_aware = false;
 	if (!conn_state->crtc || !crtc_state)
 		return 0;
 
-	if (crtc_state->self_refresh_active && !dp->psr_supported)
+	ret = msm_dp_bridge_atomic_check(drm_bridge, bridge_state, crtc_state, conn_state);
+	if (ret)
+		return ret;
+
+	/* Match the PSR configuration applied when enabling this stream. */
+	conn_state->self_refresh_aware = dp->psr_supported &&
+		!drm_mode_is_420_only(&conn_state->connector->display_info,
+				    &crtc_state->adjusted_mode);
+	if (crtc_state->self_refresh_active && !conn_state->self_refresh_aware)
 		return -EINVAL;
 
-	return msm_dp_bridge_atomic_check(drm_bridge, bridge_state, crtc_state, conn_state);
+	return 0;
 }
 
 static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
