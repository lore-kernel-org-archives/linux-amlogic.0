Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE0E9A777
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKNe1pwcYEJqSBTC0LTPkXDWLh0Zgex6P3za2vl3/bQ=; b=OL5L+I/v3FMqhU
	qQvCGl2kcWTSLsQRF+kBfZuaVjQUUyT2PgZMcn5ApfWcbMLvJ0slNrOCka+oOVUYHxkYfFPF91uuG
	EwEPs2WeLw1crKHYQ1NWwQ3+dRn3Br+i40CIZlklK4PjVZhdL6ZACn7MGh5PlcySQemqbTGu5XCq/
	sm8Mm74+j153gUP6l9SY6YfxpvVmXsny7veDWIeQYbgpl87B2DfwCSwCOyz3QH/or+BvjkGSj4Bft
	lHqdQmb5so9kHtvv00kZ7xG+4YXs6wN517Jxr7nwBP2d1DUHaVP3j2ZKHyH0c5YQm3D3yKwDHbkk4
	cmEdedW2zZeFAbSkhp2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fd-00000001JKU-1lmF;
	Tue, 24 Mar 2026 11:48:49 +0000
Received: from mail-43100.protonmail.ch ([185.70.43.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Fa-00000001JGj-0d1M
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 11:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774352923; x=1774612123;
	bh=GXIrZ2JeBYt7lvRrjXt7T5FwWusy32QKCFn/6PrHSYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DjD6K1IVe91Wnpkv7CRsxDl7ZH+inPEkt2TQtmAOT6B9aG7I23tzSxfQbHGXB/OqJ
	 wVEPdaUK/wWs95EN0ZdnLkpJVp5ApCIUI6SkLVWwTciCg3k8Yv28+PUd8gv8RW5AsU
	 KjdYl7/j0cwB9W+njdecWXN7SNlrpj5SsHLbUrazieszpOtHqyiuzNWKYs7F4ugHxT
	 LIFdb8Pj7Njt5hQ1R8pDrnh+atEc/5KuPcUwxLttTS3FGx82fPPYdRbvPQe3q4D+j2
	 3o4w4Jv1tBmC3YJgHdJY6xfM50q7+mRL5WEj8GAgVDUEKIPFvzRFKPbc7qgHaeBUCq
	 6w0DCTLJZj8Pg==
Date: Tue, 24 Mar 2026 11:48:38 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 4/5] drm/msm/dsi: add DSI version >= comparison helper
Message-ID: <20260324-dsi-rgb101010-support-v5-4-ff6afc904115@pm.me>
In-Reply-To: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
References: <20260324-dsi-rgb101010-support-v5-0-ff6afc904115@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 674c0e4769b4771254328c607482c756aba46263
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044846_335909_99E84663 
X-CRM114-Status: UNSURE (   6.70  )
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

Add a helper for checking if the DSI hardware version is greater
than or equal to a given version, for use in a future change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index db6da99375a1..b55ffe2fdec3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -782,13 +782,21 @@ static void dsi_ctrl_disable(struct msm_dsi_host *msm_host)
 	dsi_write(msm_host, REG_DSI_CTRL, 0);
 }
 
+static bool msm_dsi_host_version_geq(struct msm_dsi_host *msm_host,
+				    u32 major, u32 minor)
+{
+	return msm_host->cfg_hnd->major > major ||
+	       (msm_host->cfg_hnd->major == major &&
+	       msm_host->cfg_hnd->minor >= minor);
+}
+
 bool msm_dsi_host_is_wide_bus_enabled(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	return msm_host->dsc &&
-		(msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
-		 msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_5_0);
+		msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
+					MSM_DSI_6G_VER_MINOR_V2_5_0);
 }
 
 static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
