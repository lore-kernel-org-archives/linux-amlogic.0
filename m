Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382FAC43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 03:51:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E49024676
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 03:51:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ki3h62UK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E49024676
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+LBDuZ6AKzCUu2z0OCGHcsZsqBXX1QIQb3QLLpOS0cE=; b=Ki3h62UKv0r0xt
	nzLj3p+MCxxrYyWrGkplPSEOE0zZEb2sp2DXvJNMlOO+LwzxBefXOr4jezPdgAtkVxob0um9ewO0c
	FrZn29sWPScYYMGNCJJ2m9vP83Bw+kuyAAMZvsxzi/AAKfwsvG7lfQ8My75pYBu8Fatb9drGP/Fm2
	nSCiWWyveNI9/NLXNMLBpqj6dpumzv+6eOHxNf+U37fvP9Msh6dqzIU0Yih4vIkXYLxKN1jTdLK6B
	iNBEA7i7T/2iXosZuJfbc6BjHW7FPaSdNNKM1azuMlzSZpbsRVsy8VXzDzlQV6abP5w6kp1EtvpCv
	2tcNbZ9n0tJsfacQs4FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ighPb-0008S2-SA; Mon, 16 Dec 2019 03:51:11 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ighPZ-0008RN-8J; Mon, 16 Dec 2019 03:51:10 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 234B35DFD79CB752036B;
 Mon, 16 Dec 2019 11:51:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
 11:50:59 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <narmstrong@baylibre.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm: meson: Remove unneeded semicolon
Date: Mon, 16 Dec 2019 11:58:21 +0800
Message-ID: <1576468701-69717-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_195109_475178_F1BC0A00 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fixes coccicheck warning:

drivers/gpu/drm/meson/meson_crtc.c:360:3-4: Unneeded semicolon
drivers/gpu/drm/meson/meson_plane.c:181:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/meson/meson_crtc.c  | 2 +-
 drivers/gpu/drm/meson/meson_plane.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_crtc.c b/drivers/gpu/drm/meson/meson_crtc.c
index 57ae1c1..eefefc4 100644
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@ -357,7 +357,7 @@ void meson_crtc_irq(struct meson_drm *priv)
 					    MESON_CANVAS_WRAP_NONE,
 					    MESON_CANVAS_BLKMODE_LINEAR,
 					    MESON_CANVAS_ENDIAN_SWAP64);
-		};
+		}

 		writel_relaxed(priv->viu.vd1_if0_gen_reg,
 				priv->io_base + meson_crtc->viu_offset +
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index ed54322..b96fa43 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -178,7 +178,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 		priv->viu.osd1_blk0_cfg[0] |= OSD_BLK_MODE_16 |
 					      OSD_COLOR_MATRIX_16_RGB565;
 		break;
-	};
+	}

 	/* Default scaler parameters */
 	vsc_bot_rcv_num = 0;
--
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
