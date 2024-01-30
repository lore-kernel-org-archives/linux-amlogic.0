Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28EAC48286
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jan 2024 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ts8drKe8QmrkE+YR+fIJLDbbYSAjBL1MCiCzY0daxlY=; b=MdX7Ny6XFpGzX3
	RHJUu4/wDc1cI68yQkOLGEALd6c6xUUcqbEbx+htVwQrEyH/W4UWR2A5REUlQ75mkBtw4jlGelTBh
	MirqsjtdVRcESfoQ99We0VE3Htm9begAYjwG8p1/AQlE/Ctk1+baV4tBnMAXXuj/byrpxJZM/Tzjh
	4A0fXzcyLgZOFXXclOAwQRZIwtg3lTR8ACPJ8j1kvfi/jlNOJOBO3/kECpoWnPfw5tCCneMQx+GbA
	k2yiKOyUaBNGueMV0+k4Q/imzjSZMVjy6Oi2PX9H/NPLD+GuIQxmw1xQXa4OCzEUM3amcX133/RdW
	WGSaCM6oaz9Pjn8ZP5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfc-0000000H5J6-3w51;
	Tue, 30 Jan 2024 15:05:04 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpfZ-0000000H5HU-33FE;
	Tue, 30 Jan 2024 15:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706627100;
	bh=Kl6yFDA/A15PY0gUzrkPNTp3zRS8n6hwMIq/eK6dgX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1X3C+HkzNDbtP6LME1atyrCylDISIKQQD3ylVziKc00A9IjEowuu7umIky664byg/
	 BNNBe83FVmRWU7h+bduWiJqoB6WasXr/gCJFXd/16PTPinSg555PFmC4ruy54EU85w
	 gbxkP42eUs1e/BnPvB7zgjmqpM5CTi+S+53Kjb23n01RxZlU4pzsVkLYpbRBHsMr1L
	 yB34TRDZz0UMzoFoqGYTtVwHOeexHqoGDENEXIifgvtTg53q7MWvRW1Pk7Cy9zvPs4
	 WC6ItQIQ6mRsI7gkpjCqEZQ0C2s3fvi/KOJ/4gt9Y3aFrgN5USqMYf9WdgrCmwxqU9
	 oMX/0UiRYoRxA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 035B53781FC7;
	Tue, 30 Jan 2024 15:04:55 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Tue, 30 Jan 2024 20:33:32 +0530
Message-Id: <20240130150340.687871-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130150340.687871-1-vignesh.raman@collabora.com>
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_070501_916176_799C2746 
X-CRM114-Status: UNSURE (   8.37  )
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

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
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
