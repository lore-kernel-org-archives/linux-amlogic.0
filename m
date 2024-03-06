Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6EFC54E55
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2024 03:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xU8gsZU546XQrzMmcf7uOL3RsQuJN3hAcxRoyC+nOp0=; b=SYFb79QaEVirI9
	yzAJ7YftsjoBXi9+xkvBMJE+f8xnmjWUjxvX7CO9UbzYuTUAttH7bDuhSXPhV1GiEfNLVgP3dQ87e
	B1KpNMcOSUjv6W6b1oLtWTQeySjTS2aBYR0dcTJOq5j2nJklfN4wsjRlSmRFKw2aRoGJGCRMSHyuA
	fq5BsuvAOBgn0uhr0ILoVwPWIIZmHFiPxmwvTZIOZA3sjLEZWlcnXUmOBr1OTw0RT4TwgQt/o7mgE
	Hcqn3hIl1ovodqv4yqnUSW9u2bCbzjsIOt2tTo2gs3T/0eMgnjRzUKhDV+b3orfNVBLtu3m+7hS7Y
	qDaDXpiLun4kILGR+Cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdS-0000000G4yS-0Qjb;
	Wed, 06 Mar 2024 03:08:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhhdO-0000000G4wR-47ZX;
	Wed, 06 Mar 2024 03:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709694477;
	bh=z7xJjE61GnyWSNcNF8ZFUk0qdTWAw1hMjcJXN6mVxsc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1qXVWDIFRXArMYA5uaa0HzLEQSJOhpAC77xz8dvu6oxyhBgKQzdWPKJ36C9rrzck/
	 NMezOalMH9hTTLQ0rw9x80xKPeqtiLmXQ0uQ2JKRd0w0nlUToz3mXuqi7pIB7JGyT8
	 SLkt6mw0azWlp9j3+pM/IvqykI6oVp6Lg79JL9Wn0pplFoAoUMr/rMWkq0r1C++miA
	 wW5WpeHxmApNkflZPtMEr5TyfH6G5zzfij/QWEu+3592ygukGKozjgtFoIYfpUnZJ/
	 xcQxf72qrJ7ZzEjk/4JZjphkGfNwz0iPE2BXpUV8CoqbVPehDJQPkWEwRrBV9MJpDd
	 n21VAx2it+5pg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D39CD37820BB;
	Wed,  6 Mar 2024 03:07:53 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	mairacanal@riseup.net,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/11] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Wed,  6 Mar 2024 08:36:39 +0530
Message-Id: <20240306030649.60269-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306030649.60269-1-vignesh.raman@collabora.com>
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_190759_203061_9A7AD1E2 
X-CRM114-Status: UNSURE (   7.49  )
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

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 8dbce9919a57..37d23fd7a367 100644
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
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
