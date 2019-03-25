Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512A1C10F11
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BBDE2084D
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ba+CgabQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r5HIdwck"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BBDE2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2q0dtU7QDL/VRKnn66bIF/EVDeFHbPNj8GAluNcxzQ=; b=ba+CgabQH/Eezz
	Y0K75IFMZrUwWlPOxULXwdG7JwNRY1inx7j7TxYjp9Kv6UK+Kq3RQvoOrrSgUEAdM+CxjLZH4xMMZ
	aybzwBYqxg4ez8nKWNgAgUJ1Wz+b4tLflvF19iXFGAXpFiMx/vkMTWobMSNfyujY3f0x6VdLyui0X
	6e6EPWW7gll5SrXW48Jr1yl4M+YB9f512A2VKZMtmHGZPLbDI9Nl550BjfXewhgJIXXkkgJa9Qyt0
	xJpvdSeVTRef11KqCYNMSAjlc5KP3Dn/sgNap9RGMXzGUsoszC5QiUp8XR/G2L0rzI/VEC93uAFiW
	2b8KT/ECFbcP58TvRxIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QR6-0007nr-JY; Mon, 25 Mar 2019 14:18:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQv-0007gI-Qv
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id z11so9194149wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NjvvI6xxrMvbgreZkI/znNtsX+wD5ky2vWfW/YYRc4=;
 b=r5HIdwckPHedjpTgqQ/mk55L3fBP8SbOrjd+A/cfm+BK4jT7uX3yUGFY+g713wzBuU
 62ZwbLnQ8knAxGrfa9hFMrQa8qQO/FP8Cdn4Tzkd6PG8eLQ7oZ/RTKb7Te+AOVxxKz6B
 0EcTNB30UgPqQQacQ1NLoed/ijDJUnlLxAQSoLvsQ0iqai/dSXwLom794jjSwX8PE24P
 6hod2cQQ+IVlNcPUlK4+o60ewaxUYtF5X2nilbv3Cvfi3tyc0YH/oA1mNfhF1P50slDa
 9RES3t39mTlVCnP7ZEGvbnKU44A6czHASOfpjRhT3xN8u/KwzcMjt5kr1aJ8BU3diItx
 I6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NjvvI6xxrMvbgreZkI/znNtsX+wD5ky2vWfW/YYRc4=;
 b=L+CZhLdWr+0MldcH44oKJXg4RytuVqeZEuiLwDezUMQQTBhPsaQtikyUGhfLvVLmCp
 FwsTRTCmiiyqJ8+dAPgnOZxXqEagHX1odZuk8WwcVwXV5j4QM9fSINJM22cOvNe5YZtC
 2pBkf+hKf+O5QjTgjtUprk0wNjUzGHv5wB9116dEr28dBawX/ZX0v4UWvj/iQn4vLAd5
 SM2KBqZC4D2V+yKWJYXcjtduIcm2UwCTXdQu7mFHM0QhqKKCMy86pfR3zbBvpO8tATyD
 4hIEA9nwasCUhmVkGzaijQ3TdBCJ6fSmnwrIdlSie345EaRmFk9JNFwPg1K4NwZeZGHm
 na6w==
X-Gm-Message-State: APjAAAXxWWflcbJYunfXvnnbr6I9x+XE0FGRlBvn/JsT3BB+B1TENCDe
 BmffNlj+ZJh3tqhdHOi+QfbrmhzQby94Qg==
X-Google-Smtp-Source: APXvYqycLSLO6xaeAbRCJdfz7W+lVg6wVYIQTncbJK27nigm5eGkdADSWULi+QLlHfecFQ0lEwasdg==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr11386367wmc.76.1553523515408; 
 Mon, 25 Mar 2019 07:18:35 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/meson: Add G12A Support for the Overlay video plane
Date: Mon, 25 Mar 2019 15:18:19 +0100
Message-Id: <20190325141824.21259-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071837_867415_39CFEB00 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A SoC supports the same set of Video Planes, but now
are handled by the new OSD plane blender module.

This patch uses the same VD1 plane for G12A, using the exact same scaler
and VD11 setup registers, except using the new blender register to
disable the plane.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index b54a22e483b9..bdbf925ff3e8 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -516,8 +516,14 @@ static void meson_overlay_atomic_disable(struct drm_plane *plane,
 	priv->viu.vd1_enabled = false;
 
 	/* Disable VD1 */
-	writel_bits_relaxed(VPP_VD1_POSTBLEND | VPP_VD1_PREBLEND, 0,
-			    priv->io_base + _REG(VPP_MISC));
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		writel_relaxed(0, priv->io_base + _REG(VD1_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD2_BLEND_SRC_CTRL));
+		writel_relaxed(0, priv->io_base + _REG(VD1_IF0_GEN_REG + 0x17b0));
+		writel_relaxed(0, priv->io_base + _REG(VD2_IF0_GEN_REG + 0x17b0));
+	} else
+		writel_bits_relaxed(VPP_VD1_POSTBLEND | VPP_VD1_PREBLEND, 0,
+				    priv->io_base + _REG(VPP_MISC));
 
 }
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
