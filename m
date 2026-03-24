Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCAEE9A776
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZDi8aIyL66vDUGJvnCmzcXgB5oP2jsZUxiN9N87ZBo=; b=jsQCnA3tjDwbtU
	1CLeAjSSvh3iAYLv5MX9NZyPX9bE+qNLWwpMIAARN8eZqIlbFkH3lefJPIC9HfgpJ8wgTmy6J3Jij
	hT9iU4LTzPDzp1FQc/I5pX+pM8F1uGn8gcel2GmAnUeYRf0k8NtbTjz6QpTM3P3xvjHB+f0t6duLF
	axoGtizOgJJXmnee+4LLN5TB7ONeVR0WUF/7Ws7Gt7mZ7oae3ljwTTM+rjwKqnVtiGn/UwG+zb2CG
	cHFEV+2/49JoMQ8OLvQH1660tf1uGyzz8s5IsCfDlq1CLPCyZKYpgBdOXLVqDu6poE4JNtMJ+h8pz
	w0wm07ZxgKyd6Disj2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FD-00000001J2E-3WWk;
	Tue, 24 Mar 2026 11:48:23 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FB-00000001J0L-2Wpi;
	Tue, 24 Mar 2026 11:48:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352897; x=1774612097;
	bh=dD/BPKC5aT9eeNrRI4lDwbK6ytFidptagGuSLLMES4o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VSi97/XKzyknr6pKLMO8PCBs/Epej648nUMYbEv4763G4GWoh6ut/ZBaIFDoVAFnX
	 jvrvY2SDqjUvmbC0MTkGFGs5PpvPdrI9yaOgy++nsyK7Ao0qTw4KP1Ngl6KBdxwb+n
	 ZsJJne7rMRCxuudjzj5CeOd7Rj7pPNmgRxnlGNAYkMYAviQi29Xl9SczqV1PoYA1j4
	 QyG/Y6rChOU7lkWwNltMNZRQetMC7TAnwxgnjTlCh7ytRQ2rRnVpO67M8VpflU2iLH
	 kyn7nBWnYBJO9aD4o18xWY+winb6EB41R/YhTT3TLYb/DTdfbgd4RxYPQUnsh6TeGt
	 lPASGEVSaxZjg==
Date: Tue, 24 Mar 2026 11:48:09 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 1/5] drm/mipi-dsi: add RGB101010 pixel format
Message-ID: <20260324-dsi-rgb101010-support-v5-1-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 480ba65b63d0fe3f5e4b245ea6887b6232cd3b75
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044821_782141_A5F5AB89 
X-CRM114-Status: UNSURE (   5.85  )
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

Add MIPI_DSI_FMT_RGB101010 for 30 bit (10,10,10 RGB) pixel format,
corresponding to the packed 30 bit pixel stream defined in MIPI DSI
v1.3 Section 8.8.17.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 include/drm/drm_mipi_dsi.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..a822e9e876af 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -140,6 +140,7 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
 #define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
 
 enum mipi_dsi_pixel_format {
+	MIPI_DSI_FMT_RGB101010,
 	MIPI_DSI_FMT_RGB888,
 	MIPI_DSI_FMT_RGB666,
 	MIPI_DSI_FMT_RGB666_PACKED,
@@ -235,6 +236,9 @@ extern const struct bus_type mipi_dsi_bus_type;
 static inline int mipi_dsi_pixel_format_to_bpp(enum mipi_dsi_pixel_format fmt)
 {
 	switch (fmt) {
+	case MIPI_DSI_FMT_RGB101010:
+		return 30;
+
 	case MIPI_DSI_FMT_RGB888:
 	case MIPI_DSI_FMT_RGB666:
 		return 24;

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
