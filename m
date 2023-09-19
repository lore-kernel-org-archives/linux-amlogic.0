Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57706CE79A8
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Sep 2023 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYQlC9qWfy3/gUhx7cQhEjpl+vYt/7I/zahiTMMARQQ=; b=0SGZd27G1c8yiA
	GcXgzr2L2pSpA5N8Lfa/I8GEw4rHErTYj0mU6u1vnMaRIRW7dSp4EhMOZNwg4WxC/JgvmWyxWx5Xr
	T3hMsSXYFIASUkQmT7WFiyrn114chh2nW0LjFDY/+t0pLJaKKOCtK/DA6eYQkqjfjHJFJDviX4ym3
	k0T5CM8HPT1igEDViIb4fmBTTRh0s2eN+IMm1EV1pm2YexEMVzJXJoxo0Ta4fiUWgMQX0+vz8DO9P
	SsR5fsuzNDssD/OE6QZ1cQqeFESfjQavHz3NMJ/PcywhzBqw9J7NvWvCQ12Wno8mD/Zv0+aBoJf7z
	YFXIFDjXlNSzGSg+72Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qifNZ-0013zH-2Y;
	Tue, 19 Sep 2023 18:23:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifNW-0013y9-32;
	Tue, 19 Sep 2023 18:23:20 +0000
Received: from ginger.. (unknown [191.33.115.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C75A5660319E;
	Tue, 19 Sep 2023 19:23:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695147794;
	bh=MIhVHMuMS8iI5c/lxHJyWBy4zZOfp/8Z+Dcp2sjs9HE=;
	h=From:To:Cc:Subject:Date:From;
	b=iuLqsyfB8fSIgvACmga4IETDB20ZBCSv6kG9g0vdiSY90VLIoO5vB+mCeuaQ797AG
	 deeVUmA7lrgGv9vjb8L+n9ivv+BYXlQ97hOgJAcc8oUfPQUvVg0rqJy7YT2p0ropxM
	 2B/0usnIHgzo7dCz5jDoNqOyNoRd5QY2SEUV0+MMsYIJjLCwuMy/JEwmEh8EMfcZfM
	 bNg/j+rwyOlY8WCVavlnK0ME2MfX5iaG6KDEMfbzUN94thOpuwPGD2Fezw7ILuMv23
	 b49RvWTo0OYFhrlHd/RwJEkbQuRt/xr2bn62owJXsXY4flp6K4/13XbOBBK0T9zRSM
	 O2mMc1ScM99kw==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: robdclark@gmail.com,
	linux-arm-msm@vger.kernel.org,
	neil.armstrong@linaro.org,
	linux-amlogic@lists.infradead.org,
	p.zabel@pengutronix.de,
	linux-mediatek@lists.infradead.org,
	heiko@sntech.de,
	jani.nikula@linux.intel.com,
	intel-gfx@lists.freedesktop.org,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch,
	mripard@kernel.org,
	michel.daenzer@mailbox.org,
	daniel@fooishbar.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: drm/ci: add entries for xfail files
Date: Tue, 19 Sep 2023 15:22:49 -0300
Message-Id: <20230919182249.153499-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_112319_162568_5AF19189 
X-CRM114-Status: UNSURE (   8.58  )
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

DRM CI keeps track of which tests are failing, flaking or being skipped
by the ci in the expectations files. Add entries for those files to the
corresponding driver maintainer, so they can be notified when they
change.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

For reference: https://www.mail-archive.com/dri-devel@lists.freedesktop.org/msg463165.html

 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90f13281d297..740a2ce2689c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6614,6 +6614,7 @@ S:	Maintained
 B:	https://gitlab.freedesktop.org/drm/msm/-/issues
 T:	git https://gitlab.freedesktop.org/drm/msm.git
 F:	Documentation/devicetree/bindings/display/msm/
+F:	drivers/gpu/drm/ci/xfails/msm*
 F:	drivers/gpu/drm/msm/
 F:	include/uapi/drm/msm_drm.h
 
@@ -6886,6 +6887,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
 F:	Documentation/gpu/meson.rst
+F:	drivers/gpu/drm/ci/xfails/meson*
 F:	drivers/gpu/drm/meson/
 
 DRM DRIVERS FOR ATMEL HLCDC
@@ -6994,6 +6996,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/display/mediatek/
+F:	drivers/gpu/drm/ci/xfails/mediatek*
 F:	drivers/gpu/drm/mediatek/
 F:	drivers/phy/mediatek/phy-mtk-dp.c
 F:	drivers/phy/mediatek/phy-mtk-hdmi*
@@ -7034,6 +7037,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/rockchip/
+F:	drivers/gpu/drm/ci/xfails/rockchip*
 F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
@@ -10476,6 +10480,7 @@ C:	irc://irc.oftc.net/intel-gfx
 T:	git git://anongit.freedesktop.org/drm-intel
 F:	Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
 F:	Documentation/gpu/i915.rst
+F:	drivers/gpu/drm/ci/xfails/i915*
 F:	drivers/gpu/drm/i915/
 F:	include/drm/i915*
 F:	include/uapi/drm/i915_drm.h
@@ -17862,6 +17867,7 @@ C:	irc://irc.oftc.net/radeon
 T:	git https://gitlab.freedesktop.org/agd5f/linux.git
 F:	Documentation/gpu/amdgpu/
 F:	drivers/gpu/drm/amd/
+F:	drivers/gpu/drm/ci/xfails/amd*
 F:	drivers/gpu/drm/radeon/
 F:	include/uapi/drm/amdgpu_drm.h
 F:	include/uapi/drm/radeon_drm.h
@@ -22846,6 +22852,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/ci/xfails/virtio*
 F:	drivers/gpu/drm/virtio/
 F:	include/uapi/linux/virtio_gpu.h
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
