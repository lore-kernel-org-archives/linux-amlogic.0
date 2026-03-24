Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F4AE9A776
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sp0O/WkoHrQOucqGLYzE9FKJtbaPOd0nGqLPJ4UlmRE=; b=205UEOjhMBN/Kr
	V8qEUjtwS/FJnhw8FfcWNObS3CpvplzXt+6fBc02EIQlbvW+dhzUQGAnxVN9/CpDR07hesUFB7BSN
	yBHVPV9TfWSfa5cpOO079R1xTbxYXJq9uwHngYkPFlg7xFckE6XzGgNQzArE99bhgXfKG9Xm5cnbm
	8zu/Fp0TE0dAmypPOWVPSBfhUoFsk1Z46eMCOG/gX9PWP5TcdUvcAfaSHbuxSoahKrgQlluc8N8cM
	SnNrX9aSzCzs0+kCcs2GIHX+dfTaIH+24ZdPUAhVfpLUAmky0akeq2l2hfBHwgm6dfbVNN6h1qljp
	k5UwZZ2WFhtn8pe6ewPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fs-00000001JTt-0liX;
	Tue, 24 Mar 2026 11:49:04 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fo-00000001JQc-0xGl;
	Tue, 24 Mar 2026 11:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352937; x=1774612137;
	bh=Fy41l+CjiLxNPt1yzWCa9yREYcMW6OvI12kT5kkLAYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TtcY3tm4izlAS15nSq8Hs6ZPAm56+k3IEtsZ2JHiqlwUaD+TeYISztpIeXE651GGo
	 xbkwQLOhTTVg46bz1aq2Nm+pNV0UK6t5MOGv6DFk67sHiLJrwFfdxXwwZrdXlKlh8y
	 j0BMl8r8kHlKj3i3WoIBifCNCNU0VJN6JnN+pbN6U2yMi77HwgXPUblgExuMcdR4RW
	 Pw9qf42iRZDDgUnLbuNbOXkCNDKdIj2pFbVaIdUhTl7AwXO6Q3Y/9pn9HZSWYrNcJM
	 /v+b8mBvZ2uBieKZIhgutpsfX4Ad3ZoNL0IVeU8Crs/h74GcjEHe1hITPk7UOWiyym
	 bRfgSWumsvrgA==
Date: Tue, 24 Mar 2026 11:48:49 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-5-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 28fd0706425e97bd489645195d5853b55e9e1c64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044900_427989_982056A8 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Add video and command mode destination format mappings for RGB101010,
and extend the VID_CFG0 DST_FORMAT bitfield to 3 bits to accommodate
the new format value.

Make sure this is guarded behind MSM_DSI_6G_VER >= V2.1.0 as anything
older does not support this.

Required for 10 bit panels such as the BOE BF068MWM-TD0 found on the
Nothing Phone (3a).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 22 ++++++++++++++++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b55ffe2fdec3..992407bbea84 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -757,6 +757,7 @@ static inline enum dsi_vid_dst_format
 dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
+	case MIPI_DSI_FMT_RGB101010:	return VID_DST_FORMAT_RGB101010;
 	case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
 	case MIPI_DSI_FMT_RGB666:	return VID_DST_FORMAT_RGB666_LOOSE;
 	case MIPI_DSI_FMT_RGB666_PACKED:	return VID_DST_FORMAT_RGB666;
@@ -769,6 +770,7 @@ static inline enum dsi_cmd_dst_format
 dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
+	case MIPI_DSI_FMT_RGB101010:	return CMD_DST_FORMAT_RGB101010;
 	case MIPI_DSI_FMT_RGB888:	return CMD_DST_FORMAT_RGB888;
 	case MIPI_DSI_FMT_RGB666_PACKED:
 	case MIPI_DSI_FMT_RGB666:	return CMD_DST_FORMAT_RGB666;
@@ -1713,6 +1715,26 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->dsc)
 		msm_host->dsc = dsi->dsc;
 
+	if (msm_host->format == MIPI_DSI_FMT_RGB101010) {
+		if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+					      MSM_DSI_6G_VER_MINOR_V2_1_0)) {
+			DRM_DEV_ERROR(&msm_host->pdev->dev,
+				      "RGB101010 not supported on this DSI controller\n");
+			return -EINVAL;
+		}
+
+		/*
+		 * Downstream overrides RGB101010 back to RGB888 when DSC is enabled
+		 * but widebus is not. Using RGB101010 in this case may require some
+		 * extra changes.
+		 */
+		if (msm_host->dsc &&
+		    !msm_dsi_host_is_wide_bus_enabled(&msm_host->base)) {
+			dev_warn(&msm_host->pdev->dev,
+				 "RGB101010 with DSC but without widebus, may need extra changes\n");
+		}
+	}
+
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/registers/display/dsi.xml b/drivers/gpu/drm/msm/registers/display/dsi.xml
index c7a7b633d747..e40125f75175 100644
--- a/drivers/gpu/drm/msm/registers/display/dsi.xml
+++ b/drivers/gpu/drm/msm/registers/display/dsi.xml
@@ -15,6 +15,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<value name="VID_DST_FORMAT_RGB666" value="1"/>
 		<value name="VID_DST_FORMAT_RGB666_LOOSE" value="2"/>
 		<value name="VID_DST_FORMAT_RGB888" value="3"/>
+		<value name="VID_DST_FORMAT_RGB101010" value="4"/>
 	</enum>
 	<enum name="dsi_rgb_swap">
 		<value name="SWAP_RGB" value="0"/>
@@ -39,6 +40,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<value name="CMD_DST_FORMAT_RGB565" value="6"/>
 		<value name="CMD_DST_FORMAT_RGB666" value="7"/>
 		<value name="CMD_DST_FORMAT_RGB888" value="8"/>
+		<value name="CMD_DST_FORMAT_RGB101010" value="9"/>
 	</enum>
 	<enum name="dsi_lane_swap">
 		<value name="LANE_SWAP_0123" value="0"/>
@@ -142,7 +144,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	</reg32>
 	<reg32 offset="0x0000c" name="VID_CFG0">
 		<bitfield name="VIRT_CHANNEL" low="0" high="1" type="uint"/>  <!-- always zero? -->
-		<bitfield name="DST_FORMAT" low="4" high="5" type="dsi_vid_dst_format"/>
+		<!-- high was 5 before DSI 6G 2.1.0 -->
+		<bitfield name="DST_FORMAT" low="4" high="6" type="dsi_vid_dst_format"/>
 		<bitfield name="TRAFFIC_MODE" low="8" high="9" type="dsi_traffic_mode"/>
 		<bitfield name="BLLP_POWER_STOP" pos="12" type="boolean"/>
 		<bitfield name="EOF_BLLP_POWER_STOP" pos="15" type="boolean"/>

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
