Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAB2C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD29223BD
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdDjFQ4w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mX/+Fs7f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD29223BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vs0idn1Asoa0LAeSx0C5W6fXjX0EdOTLl4dQYoS+qts=; b=WdDjFQ4w6x6oVJLYCBYlSS47i
	DH8bGIPNjsn5fgawPcavWIWbKC1QY/LssjyA+rIMv3Ibb4VCJSU6iT/NafHMWmxSHoUeK1TpGO9pP
	2wHUlDh5/l3UfD0N5ODJtNZhVWs1CMXUk8echCpBkhO1MN7ih/rlbSRTFG2okvuM9yPIofdMeOvFP
	dcpm0bn0yuNc0reucNaoX9g/7ThrvV6iyvIunacYDqOFp9vQX8kO72EwEzaHIdXsf7wVp39uR8JuR
	ilD4LHB3XJBBhCNNtFWNHs2Oc2gDDgbwjLoGSnNbzoVgYztV9rWrt7PYvYlp4LC9I0PdT1lykEqZE
	tXMNYpqZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kekne-0003FD-CN; Mon, 16 Nov 2020 20:08:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keknP-00037w-9q; Mon, 16 Nov 2020 20:08:17 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1AA320A8B;
 Mon, 16 Nov 2020 20:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557293;
 bh=c8VgzEkqwERkRAY+dkH9SFt/xXBqPaGtdhqo1tB0QKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mX/+Fs7fntpGEjdyn3BXW3M3Ifm0j2MBT5dXO9ckfqXrVZiP32zsiFmHeEqnNwmLc
 4ynDNObF+192IVStFtv4tWCIUK1LIkhpzO0AXi5KNQg2xZOUREg4dbd4tK5H9ksabX
 8bhVF1DklWQ1NIuaVepVLqZaSiyLlE7RKj/fjKl0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknL-00B7cF-RX; Mon, 16 Nov 2020 20:08:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] drm/meson: Free RDMA resources after tearing down DRM
Date: Mon, 16 Nov 2020 20:07:41 +0000
Message-Id: <20201116200744.495826-2-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116200744.495826-1-maz@kernel.org>
References: <20201116200744.495826-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel-team@android.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_150815_564110_1B4DE8F4 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Removing the meson DRM module results in the following splat:

[ 2179.451346] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
[ 2179.458316] Workqueue: events drm_mode_rmfb_work_fn [drm]
[ 2179.463597] pstate: 80c00009 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
[ 2179.469558] pc : meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
[ 2179.475243] lr : meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
[ 2179.480930] sp : ffffffc01212bb70
[ 2179.484207] x29: ffffffc01212bb70 x28: ffffff8044f66f00
[ 2179.489469] x27: ffffff8045b13800 x26: 0000000000000001
[ 2179.494730] x25: 0000000000000000 x24: 0000000000000001
[ 2179.499991] x23: 0000000000000000 x22: 0000000000000000
[ 2179.505252] x21: 0000000000280000 x20: 0000000000001a01
[ 2179.510513] x19: ffffff8046029480 x18: 0000000000000000
[ 2179.515775] x17: 0000000000000000 x16: 0000000000000000
[ 2179.521036] x15: 0000000000000000 x14: 0000000000000000
[ 2179.526297] x13: 0040000000000326 x12: 0309030303260300
[ 2179.531558] x11: 03000000054004a0 x10: 0418054004000400
[ 2179.536820] x9 : ffffffc008fe4914 x8 : ffffff8040a1adc0
[ 2179.542081] x7 : 0000000000000000 x6 : ffffff8042aa0080
[ 2179.547342] x5 : ffffff8044f66f00 x4 : ffffffc008fe5bc8
[ 2179.552603] x3 : 0000000000010101 x2 : 0000000000000001
[ 2179.557865] x1 : 0000000000000000 x0 : 0000000000000000
[ 2179.563127] Call trace:
[ 2179.565548]  meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
[ 2179.570894]  meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
[ 2179.576241]  meson_plane_atomic_disable+0x38/0xb0 [meson_drm]
[ 2179.581966]  drm_atomic_helper_commit_planes+0x1e0/0x21c [drm_kms_helper]
[ 2179.588684]  drm_atomic_helper_commit_tail_rpm+0x68/0xb0 [drm_kms_helper]
[ 2179.595410]  commit_tail+0xac/0x190 [drm_kms_helper]
[ 2179.600326]  drm_atomic_helper_commit+0x16c/0x390 [drm_kms_helper]
[ 2179.606484]  drm_atomic_commit+0x58/0x70 [drm]
[ 2179.610880]  drm_framebuffer_remove+0x398/0x434 [drm]
[ 2179.615881]  drm_mode_rmfb_work_fn+0x68/0x8c [drm]
[ 2179.620575]  process_one_work+0x1cc/0x49c
[ 2179.624538]  worker_thread+0x200/0x444
[ 2179.628246]  kthread+0x14c/0x160
[ 2179.631439]  ret_from_fork+0x10/0x38

caused by the fact that the RDMA buffer has already been freed,
resulting in meson_rdma_writel_sync() getting a NULL pointer.

Move the afbcd reset and meson_rdma_free calls after the DRM
unregistration is complete so that the teardown can safely complete.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 8b9c8dd788c4..324fa489f1c4 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -389,15 +389,15 @@ static void meson_drv_unbind(struct device *dev)
 		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
 	}
 
-	if (priv->afbcd.ops) {
-		priv->afbcd.ops->reset(priv);
-		meson_rdma_free(priv);
-	}
-
 	drm_dev_unregister(drm);
 	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_dev_put(drm);
+
+	if (priv->afbcd.ops) {
+		priv->afbcd.ops->reset(priv);
+		meson_rdma_free(priv);
+	}
 }
 
 static const struct component_master_ops meson_drv_master_ops = {
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
