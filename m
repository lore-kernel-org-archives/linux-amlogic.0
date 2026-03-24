Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D411E9A777
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1uC215bUzS/ZVye2Guxc3dbcrDlieF0162ufptxcyk=; b=Lk8sFV1MOdWGNX
	o1iHy3CfeRmzpfwmk1+lRO9YK93njSNm9034YlPR2tXC7tN2Pv5SpHGlhpYDddisbSuso5qn5jKXK
	yJRLhC/s06G6nAbQlg2PdZNQs8RNqsQTojZzmaRwGNkZQXfd3CNwACE+2s9Nn0+f/V/lvWTO6kz7x
	t+BQiEE5RZH+MwwPOMaRnOLFtHL74aGaau/4eE9t3q2ougBXicIEakyrrC/9s2ySvP9xYvrPa7aHQ
	DUSOBGo2GRbfU7r04pJLMKPzB/wL+aKLYEeoMuowqg6Ph+TGgHqJh+OZfscgH7Y7VD+IN67gAMg7c
	1FedkJeEyI+Et8idqNHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FS-00000001JBw-1G6A;
	Tue, 24 Mar 2026 11:48:38 +0000
Received: from mail-10628.protonmail.ch ([79.135.106.28])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50FP-00000001J9O-2ld9;
	Tue, 24 Mar 2026 11:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352913; x=1774612113;
	bh=mLm4IQklaR2CNzE4LbjmpJTUb6cmIq5AyTVgjPiZhVY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TAuFaoJXbFCt4FGG/aUXi3LdyncyEKNx/phaFiAhYwuzf2eYm9r4zDyoGzGvanKNJ
	 ynMgXkrVhwflE6LmqKGIOhPsavdTxEKiwmTlwbxSiFGdpxULPZ0VlMacHOc2/vrfd1
	 yK8j30nBaPbIaJ6sT+f6z2gzdYeP/OsfvhrMNVqpsmCD9GZQQdfQVYOF3addrl9eMY
	 CjLhIkaTsOI0haB2RidAVPKkp8v2MoIptDspJcqpTMzZqMOfzPaFFRDlpZozkItqvr
	 gBzZmsH6KbObx2eiL85OCk//ANvd9YJJXfKYotR36Xnv46vzdxHSPMpGJ8iXqitiA3
	 pcwEvrlbM68cA==
Date: Tue, 24 Mar 2026 11:48:27 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 3/5] drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
Message-ID: <20260324-dsi-rgb101010-support-v5-3-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: e1618d4fd2b5b0dccb180c20d1ef6e4586249b10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044835_852878_1512348C 
X-CRM114-Status: UNSURE (   9.46  )
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

The MSM8998 DSI controller is v2.0.0 as stated in commit 7b8c9e203039
("drm/msm/dsi: Add support for MSM8998 DSI controller"). The value was
always correct just the name was wrong.

Rename and reorder to maintain version sorting.

Fixes: 7b8c9e203039 ("drm/msm/dsi: Add support for MSM8998 DSI controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index bd3c51c350e7..da3fe6824495 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -317,10 +317,10 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_2,
 		&msm8976_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_0_0,
+		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_1_0,
 		&sdm660_dsi_cfg, &msm_dsi_6g_v2_host_ops},
-	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
-		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_3_0,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 5dc812028bd5..ccf06679608e 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -19,8 +19,8 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
 #define MSM_DSI_6G_VER_MINOR_V1_4_2	0x10040002
+#define MSM_DSI_6G_VER_MINOR_V2_0_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_1_0	0x20010000
-#define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
 #define MSM_DSI_6G_VER_MINOR_V2_3_1	0x20030001

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
