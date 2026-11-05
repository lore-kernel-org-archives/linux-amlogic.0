Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11C0606A31B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=owF17fBS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4U44gSD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Tz0TufJ3/A6on+lAVsf715wg+BWwik9NUYpsQMQVSFg=; b=owF17fBS9c9/h2feljqK2nDMet
	ehEI4oDbcJfIEkhHMGGZt+hEglTPD/BxTc8Ex/OhRLGBmQRTyHq9rpwrgPzkBu69V3iEg7vTvZYPW
	7JpT7T8QqPlbl+g34eBT2oi32taRor+Plkre/DDn4qIpcHrZixcc+rsqE8yBWpiONk+svJ33gTPi3
	xYQVZhXku/Ycj89N4RTJ2oRxbmF94YK39lzVcQDm0txJUzma0gxTNlQquCJg2yZH7QBVj11Ap2Gfg
	pXSq/tpn5+4M08nuz8S5F45zFbZ9A23/FrXLeVb+FpyIv9kU1ZhABSwsQuwArRHdZNV0NBiS4eMbk
	O71GwKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzRN-00000009PcQ-2s68;
	Thu, 05 Nov 2026 15:31:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzRM-00000009PcD-2NW1
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 15:31:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D58242B1E;
	Thu,  5 Nov 2026 15:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618081F0093A;
	Thu,  5 Nov 2026 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892707;
	bh=Vhrzh9uVSsxK/QEM0A/OExVSfLi+mHZOJUJOKuzlAJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R4U44gSDqlGRpbueWsRDU9KZFQ/ODspvv38KWUuEE0hnNs46LH3VFBB34CLTu2uNT
	 G27/ABQWlBI1Rqevwp0PGDCSlGmkKotZS9/d/u/zS1Y2hJQ8vBWSxrjTAgHiJt5P8a
	 RTEdBMtK7QlVy/ZOEDyM4AFK7gcCcj/A1/D23JvCreSpKSbCDF6+DwWyllkCDfZan+
	 Tjul2+EYMl7WqrE7HV3pVtn/jwXGoztIMc74YO0I37Dgh8PV+RR5OrcAj2uSmYV56Q
	 SZWRCMeJ732OZUbwExNTDNg9Cq/3IxYfHnenrv3JJncP3H1imjTyimtloOTp3xhn3y
	 qeCpgJ+7e1H1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Nov 2026 16:29:35 +0100
Subject: [PATCH RESEND 26/83] drm/meson: Switch to
 drm_mode_config_create_initial_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-drm-no-more-config-reset-v1-26-1f58d1e33380@kernel.org>
References: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
In-Reply-To: <20261105-drm-no-more-config-reset-v1-0-1f58d1e33380@kernel.org>
To: David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Kd0V2S7TqFaJ/xhzHTLla+COz/NLMYco+UxWD75X7Kg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlvFrx4oJlc9PF/5Ivfd90kTu5/IdqpKSL4PnnTzIoIr
 YeuRz+XdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJnDZirNOSz/CQ/xDr+cL5
 dfyJvDssT8XrjppIZZrai2n+LdiRx/Rp2s4VYSGRt2vFq/2FeCynMtaKi6nsPPVb7NIbxZACiU0
 JTvsZ5d9Ge7NsDIj9mHRhAb/8zUiWW3+0NbsX/f07YaLuTwkA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

drm_mode_config_reset() has a dual role: it creates the initial KMS
state at probe time, and resets hardware and software state during
suspend/resume cycles.

Since the two roles need different behaviors (notably for objects like
drm_private_obj that must persist across suspend/resume),
drm_mode_config_create_initial_state() was introduced to handle only
the initial state creation at probe time.

Switch to drm_mode_config_create_initial_state().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
---
 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d3..dda2dc2d5b00 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -345,5 +345,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 		goto exit_afbcd;
 
-	drm_mode_config_reset(drm);
+	ret = drm_mode_config_create_initial_state(drm);
+	if (ret)
+		goto uninstall_irq;
 
 	drm_kms_helper_poll_init(drm);

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
