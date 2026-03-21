Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1641094463
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Mar 2026 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Qjpqc580wY5EgCSdkI6UvojQVBA+T4drEfrpBTXb1k=; b=vKdmt4+JlnpTbS
	rqhLQPE/MzI4wlrPDbACHUo/rORTTFWFFnY5V/gNR5YfvWwwq6IxXI4Aro2noCycKfVjq9slc2i0M
	Ce7w5KABiPeAhWFpLgmsh1EqyK3R3zwwgTN0By7jquYm4mhZbq97hd3qUSN7NHxB2rZRowa0F8xAh
	CE+ieKGm9gbgfQoUwAO5Z7AtiZjk772mLB3L4OOoqTnW9mdfqvlbvwxJvEKY15sLdQLNF/5Xjp9hP
	04qOuMNHt6pjN4o414sGw+E1awNp3vNjLlzm2ftES2nd9YK2YBMDCsUr7tF9tSUJtvgeWsmM6Gv08
	FTgdHNJ7mvmtPzDQpMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8t-0000000EDWu-2Kdp;
	Sat, 21 Mar 2026 07:53:07 +0000
Received: from mail-10630.protonmail.ch ([79.135.106.30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3r8q-0000000EDTR-21s6;
	Sat, 21 Mar 2026 07:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774079581; x=1774338781;
	bh=VIjFEoU5kuSs8on1xHPBMp4W/LcZNwtBH4t9BMnjpcM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=i7rnNbQhaPSKpF1d6rSWnhEXzbgrw/1jVTnJrwVzN3jy9f+6SqCdWm3jNcbNJOc+2
	 gm0DX4CRW2kPVdS7DnVmP4QcVibodGzYstXHgGrjH4Z5TnCy7jWkowmI8hhkPFpbBt
	 Dzlx8lluTxgzhepENH6nfYVo2d6sT5B38YUyEb8964Q+/phBxFBpSJ3hEBprFOLb/o
	 VD+L5bYRLT0RQZvYg780FIYCglhuGdh9B3tDRufMsMSZWuqY8JYsEtSf2T5JUWd48Y
	 RwGBIjUFDsnT+Y+anr8bWOguuS3StbobyFKbW7SmhxoZz7bcT+c5rLY7wwJ2+9PnKm
	 p9LfqeokhT0nA==
Date: Sat, 21 Mar 2026 07:52:55 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 74e88428093f1c2459eaaeb3576114a45fa4c3bd
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_005304_692498_D6E43CC7 
X-CRM114-Status: UNSURE (   8.07  )
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

Required for 10 bit panels such as the BOE BF068MWM-TD0.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 10 ++++++++++
 drivers/gpu/drm/msm/registers/display/dsi.xml |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b55ffe2fdec3..67b33f46a93c 100644
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
@@ -1706,6 +1708,14 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->lanes > msm_host->num_data_lanes)
 		return -EINVAL;
 
+	if (dsi->format == MIPI_DSI_FMT_RGB101010 &&
+	    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+				     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev,
+			      "RGB101010 not supported on this DSI controller\n");
+		return -EINVAL;
+	}
+
 	msm_host->channel = dsi->channel;
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
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
