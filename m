Return-Path: <SRS0=f0Vj=SY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0B1C282CE
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2019 19:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E6C21902
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2019 19:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GCh09nVg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2oFa5Ft2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E6C21902
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xtb4Ddy15JlEp3JCJPqmxrwFksC6LxvfXyWB6nO+rTM=; b=GCh09nVgTM3KZG
	APoX9eDMrZIvmxlKl4QR/4HRDLyH+MMNQiHyQn/dXtX9AQFwcJZvBqpJI4F73yk0OpewroCBeACUp
	ns66O9a3vojJR3dNx6wDIfyUAvHe1+Op9Sec6tzUVG/RJ6WB3afxXr/Xo2EjGo78I1A6p04bLjkOY
	awnI2QCDr+1TCtVUBaLpRbEWQewMizfz9AAhXpgkpPB4bHfo3jwecRmRl1wqHzs82TPeRHBoBNkXK
	7ozjJNSMfdo6WPbdSVxQTzw/5L7ncQCZwjQwKatO2x5n80Q7EwRuKttxGymEHOoI80Bupssv+CkiH
	pQjcEQgSDyVWfSQ2hwBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIetz-0003tT-8R; Mon, 22 Apr 2019 19:46:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIett-0003lA-Mq
 for linux-amlogic@lists.infradead.org; Mon, 22 Apr 2019 19:46:52 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 825ED21908;
 Mon, 22 Apr 2019 19:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555962409;
 bh=9/a6HhSKGbb15EAo6nsqJWLRiQ0p2SWOP1V6sqzh+ZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2oFa5Ft28EmH4SlXpALiFNhqZXTG1x5W5fQH/pw1Ljk06lOgRShBeC6Eyni/alPIh
 l6Kr5KiHMDKGihMU3hphtnU3wkt3AobELVAJ54CZ1X4/Z9yZRrhDxzgwZOcS/dzCJ0
 1qGVx2Ek2LiTWJEbkAVUDR/thBNGP+zuxEJwMSCQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 45/68] drm/meson: Fix invalid pointer in
 meson_drv_unbind()
Date: Mon, 22 Apr 2019 15:44:53 -0400
Message-Id: <20190422194516.11634-45-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190422194516.11634-1-sashal@kernel.org>
References: <20190422194516.11634-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_124650_202990_64093E6C 
X-CRM114-Status: GOOD (  11.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

[ Upstream commit 776e78677f514ecddd12dba48b9040958999bd5a ]

meson_drv_bind() registers a meson_drm struct as the device's privdata,
but meson_drv_unbind() tries to retrieve a drm_device. This may cause a
segfault on shutdown:

[ 5194.593429] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000197
 ...
[ 5194.788850] Call trace:
[ 5194.791349]  drm_dev_unregister+0x1c/0x118 [drm]
[ 5194.795848]  meson_drv_unbind+0x50/0x78 [meson_drm]

Retrieve the right pointer in meson_drv_unbind().

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20190322152657.13752-1-jean-philippe.brucker@arm.com
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 611ac340fb28..4a72fa53a1d5 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -317,8 +317,8 @@ static int meson_drv_bind(struct device *dev)
 
 static void meson_drv_unbind(struct device *dev)
 {
-	struct drm_device *drm = dev_get_drvdata(dev);
-	struct meson_drm *priv = drm->dev_private;
+	struct meson_drm *priv = dev_get_drvdata(dev);
+	struct drm_device *drm = priv->drm;
 
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
