Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EC5C3DA7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 02:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aBEKyvrT/bAGgGPSHLdVbjKUSmVgwRdEfVp3r9UwI7Q=; b=Qmq3h2/0HTOCtX
	7QwS1aobKQa6d3xEtC7W/HV61O2M5t908jC6ucTYd9D70OS7mYRBsGE+jaxHVayp02jfdxzacIJYF
	DW2Gh5WoDcR4yHWbnrqqJCHU5/3/YLyQaFTHD4IZDmLX/EQ9evXDsvc9hT1MxzkLa8D4VCtPYUovi
	qq6zjkV54FkAuLuhHXsT2TBBpsBvnr4C0xhEuUC5SIMEyexLdXveOCd+nrOfKetEpByOQKlkJqB+1
	gjyiUcPKghzgvewugB0V4FqHzYmgg86aPK4SGX8EFO+Muc1Tkl6xzG3WHsF+WjXDxLQl9wShACwjT
	8RgCPJhJI0dCgXT6T8RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcQ5-0000000DKBv-0nct;
	Tue, 30 Jul 2024 02:16:57 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYcPs-0000000DK4P-0V9x;
	Tue, 30 Jul 2024 02:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722305802;
	bh=FTBCIN5481nBICjxsybknMLehNLjeJEbBou3lS+mdEQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qZ3QC/PlX7tWusyRZwOyD+8ofspInKbLEBp4SBYPqdDuKD6duA1jbLMjF6aW4Jxhg
	 c0K3JGV6KcLAGnECS1CkyIvS5sUIDp7lrU+bj+q7hZHv8h9ZrwJQYEjrA5AgVSRuEF
	 w4zT+TjWFXHdYpq/R31VyNo7cSJq1/xwFvmMDiNtysnHmpDDpwfZC6qOfDvu5TdEr6
	 jO7O/6FPwDGbnRkYP9Yxycv6tBBA7wxayZYB7bhH0tGtHF1cOq2VBd0syUJBrVha14
	 WnTzqBaqlSZI1E3XOxAXwtKqE4oXdam8TnN1rJ/bh+N19Tzi2l0MBpKf2zHpe1bn+U
	 sg68oG1iI8YlA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BAE4A3782109;
	Tue, 30 Jul 2024 02:16:37 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	dmitry.baryshkov@linaro.org,
	mcanal@igalia.com,
	melissa.srw@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/6] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Tue, 30 Jul 2024 07:45:36 +0530
Message-ID: <20240730021545.912271-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730021545.912271-1-vignesh.raman@collabora.com>
References: <20240730021545.912271-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_191644_306485_AD357D43 
X-CRM114-Status: UNSURE (   8.04  )
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

Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
display driver probed on the mt8183-kukui-jacuzzi-juniper machine.

arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
but drm-ci don't have initrd with modules, so add
CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes

v7:
  - No changes

v8:
  - No changes

v9:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 4140303d6260..66e70ced796f 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
+CONFIG_DRM_ANALOGIX_ANX7625=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
