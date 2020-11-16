Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E6EC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F1021D7E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 20:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I0GckRXr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7dQGVT6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F1021D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eTE2HKYNHYKD967jFtFDJurWp12IFYjoqCaisUrz3AM=; b=I0GckRXr3xNimqMS9d7ZLWghS
	vcAUo6IeZOXatK/6fkiPjhm9S6MhEYB/NT853tguDrGrhF7+91/K9RvmPwcMzW50tOr+F63c3PAd9
	zhg//+PkAqA0pf8FiNNV3toWdW4hWSj0SP8kzpyZZkvbHvnlyHbSQ+b93JIf5egGJocVCw6p/PVVj
	/eFpfqbPIfoE2Qsak5Dvy3z/SoMcLXwIq9IllCAH67LlfR3+wJkoLsOHXv7mu64Pt3MY2zNIDHbxs
	u3zgRPMvsHySubncG39MDWrB/mJ3mclVIpyUcLbenZWkec71HK0cum3fQyG1nk0GL4aaPJdoluJj2
	1hpXS7Mjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keknT-0003B8-I4; Mon, 16 Nov 2020 20:08:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keknP-00038E-8Q; Mon, 16 Nov 2020 20:08:16 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F5D721D7E;
 Mon, 16 Nov 2020 20:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605557294;
 bh=2VOb7XIOrKIllCFHjvzwsMuOV/VdeyMcE2EElW6nZBU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B7dQGVT6lyVgTubKShhcdlUpeuwqIj9iz7z72/jyEsxV7BQjxR1AdztCjK8vlHVqO
 FMpQUJNSs8+MogDADDpQnCVR4p/h+cRTfJso0aYb/fOgtWVWQqta118lTs37QMXV/w
 vIoKQrZVYh7IsoTvbuZZtppjVQghNjl00BTQd8fk=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1keknM-00B7cF-Gf; Mon, 16 Nov 2020 20:08:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/4] drm/meson: Unbind all connectors on module removal
Date: Mon, 16 Nov 2020 20:07:42 +0000
Message-Id: <20201116200744.495826-3-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20201116_150815_490807_F6249621 
X-CRM114-Status: GOOD (  13.79  )
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

Removing the meson DRM module results in the following splats:

[   42.689228] WARNING: CPU: 0 PID: 572 at drivers/gpu/drm/drm_irq.c:192 drm_irq_uninstall+0x130/0x160 [drm]
[...]
[   42.812820] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
[   42.819723] pstate: 80400089 (Nzcv daIf +PAN -UAO -TCO BTYPE=--)
[   42.825737] pc : drm_irq_uninstall+0x130/0x160 [drm]
[   42.830647] lr : drm_irq_uninstall+0xc4/0x160 [drm]
[...]
[   42.917614] Call trace:
[   42.920086]  drm_irq_uninstall+0x130/0x160 [drm]
[   42.924612]  meson_drv_unbind+0x68/0xa4 [meson_drm]
[   42.929436]  component_del+0xc0/0x180
[   42.933058]  meson_dw_hdmi_remove+0x28/0x40 [meson_dw_hdmi]
[   42.938576]  platform_drv_remove+0x38/0x60
[   42.942628]  __device_release_driver+0x190/0x23c
[   42.947198]  driver_detach+0xcc/0x160
[   42.950822]  bus_remove_driver+0x68/0xe0
[   42.954702]  driver_unregister+0x3c/0x6c
[   42.958583]  platform_driver_unregister+0x20/0x2c
[   42.963243]  meson_dw_hdmi_platform_driver_exit+0x18/0x4a8 [meson_dw_hdmi]
[   42.970057]  __arm64_sys_delete_module+0x1bc/0x294
[   42.974801]  el0_svc_common.constprop.0+0x80/0x240
[   42.979542]  do_el0_svc+0x30/0xa0
[   42.982821]  el0_svc+0x18/0x50
[   42.985839]  el0_sync_handler+0x198/0x404
[   42.989806]  el0_sync+0x158/0x180

immediatelly followed by

[   43.002296] WARNING: CPU: 0 PID: 572 at drivers/gpu/drm/drm_mode_config.c:504 drm_mode_config_cleanup+0x2a8/0x304 [drm]
[...]
[   43.128150] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
[   43.135052] pstate: 80400009 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   43.141062] pc : drm_mode_config_cleanup+0x2a8/0x304 [drm]
[   43.146492] lr : drm_mode_config_cleanup+0xac/0x304 [drm]
[...]
[   43.233979] Call trace:
[   43.236451]  drm_mode_config_cleanup+0x2a8/0x304 [drm]
[   43.241538]  drm_mode_config_init_release+0x1c/0x2c [drm]
[   43.246886]  drm_managed_release+0xa8/0x120 [drm]
[   43.251543]  drm_dev_put+0x94/0xc0 [drm]
[   43.255380]  meson_drv_unbind+0x78/0xa4 [meson_drm]
[   43.260204]  component_del+0xc0/0x180
[   43.263829]  meson_dw_hdmi_remove+0x28/0x40 [meson_dw_hdmi]
[   43.269344]  platform_drv_remove+0x38/0x60
[   43.273398]  __device_release_driver+0x190/0x23c
[   43.277967]  driver_detach+0xcc/0x160
[   43.281590]  bus_remove_driver+0x68/0xe0
[   43.285471]  driver_unregister+0x3c/0x6c
[   43.289352]  platform_driver_unregister+0x20/0x2c
[   43.294011]  meson_dw_hdmi_platform_driver_exit+0x18/0x4a8 [meson_dw_hdmi]
[   43.300826]  __arm64_sys_delete_module+0x1bc/0x294
[   43.305570]  el0_svc_common.constprop.0+0x80/0x240
[   43.310312]  do_el0_svc+0x30/0xa0
[   43.313590]  el0_svc+0x18/0x50
[   43.316608]  el0_sync_handler+0x198/0x404
[   43.320574]  el0_sync+0x158/0x180
[   43.323852] ---[ end trace d796a3072dab01da ]---
[   43.328561] [drm:drm_mode_config_cleanup [drm]] *ERROR* connector HDMI-A-1 leaked!

both triggered by the fact that the HDMI subsystem is still active,
and the DRM removal doesn't result in the connectors being torn down.

Call drm_atomic_helper_shutdown() and component_unbind_all() to safely
tear the module down.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 324fa489f1c4..3d1de9cbb1c8 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -390,8 +390,10 @@ static void meson_drv_unbind(struct device *dev)
 	}
 
 	drm_dev_unregister(drm);
-	drm_irq_uninstall(drm);
 	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
+	component_unbind_all(dev, drm);
+	drm_irq_uninstall(drm);
 	drm_dev_put(drm);
 
 	if (priv->afbcd.ops) {
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
