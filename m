Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D4FC54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xL6v+YoEGHBEkkix3D7YpmNuUvp2GuRoK1KPsM+vrT8=; b=PIW4vZvf4ydCsu
	ENOlAaKjb2QCRcvm2cwby99h6rRwlq0bZcCjtMAK/Oc2bEUVotZ7ymZjrkM/7+g7z4hbHxPdhGeBQ
	X2Z64vSqfM9cU2o72OD/qJHUIVt9G2coP7gSqYZ4tuBJ92nadPjHPP7whXwbp7UEuvue6Kn0/LTVq
	2Mvsue+dOH081UZKhdEAeSKqXMAgVYI3lQOguxW3Df0LTEIn2hEXMWJhO1YC5Nsw9P5ixDqDr99Ay
	1owiOyosWwu6fw4gRjgUxF7g80z9POsCeQVJwQ9RVk7jmMr06uRYsfno4/AwBSjzBCBpFP2YRnMIx
	EILq3ni+H/LDK/yruQyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJqX-005RVn-LD; Thu, 08 Sep 2022 15:53:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJoh-005QQN-F3
	for linux-amlogic@lists.infradead.org; Thu, 08 Sep 2022 15:51:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id bq9so13920381wrb.4
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Sep 2022 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mathembedded-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6i8sqpqzLDL8z1p82sBsuGzvlqg3wk/6sNqlm7SzWbg=;
        b=DK493E0OJVGhjk31WkmRNY3zFNxMDxWEfMSC0lGSw1w1dizFuuzBjjOrkF7rP2PDx9
         RR6ksCsR9ELKcDlJ9bqRTW/R8/iTlG0pDRDVQNvc461cv8WvFuPY8BGh59buTt4FiFvq
         Xqhdzhwzqk7VdPJwAEomB+xxG23EW3ztytKgbk4vAp/s/mNVgHBsQRPSM0GKHhoDHfJV
         HCmVcPvJpR7jKM/eDAbR4IdL564/dKG7glZJDiWHSwdw7D722fIilfUHGDz9V1JaQE7e
         2+9nuIYqeVwYD4mcRBCCRlT7z0gkfIrEoCGYedgX0FZM2I4/IjgRkr5QrI3avDqNfzAy
         tATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6i8sqpqzLDL8z1p82sBsuGzvlqg3wk/6sNqlm7SzWbg=;
        b=z87fYzA3zpnWU9mYtoasbrGiEHErApXFd8m4+g7bEvTBzSFHpM0SYsAm+wagN2w94e
         5DK/wfny/5YkRCKp8UB+oLsjNY9eMQiF1HjmCQMumm3SEQdl4Fo3F+IcgkMJ2CdOD6LP
         0bD3JWjszB5+AFOx8BrkL8p3Ze0yVnP79t92TFlhnM/ilIQXHxbxXGKjxqHSXFxpz+we
         7m+QxuzTbsvpWC7kN/YuLxcZkn9not+q2wTNQ75ggfM/l1PLy4uIb2ruBHxyl43ZrJTP
         yrIlIDJvBU6A+UEZTR4o9NkoRuIOL6F/TeSAlvZfauwIb3DWymk4pxUIJxrinDSAS3LD
         Fo8Q==
X-Gm-Message-State: ACgBeo3+zN5A4CPco6sdZD9qB9IdEpeCBo9gc+L00yjLFzRFskVs4yDy
	NaGeo4stMxKqqOVGX+V1ATufdg==
X-Google-Smtp-Source: AA6agR6bgnsCDBzOYU761DInMQ+pw4wgFXvohbx81dXRkLYwWXpge2AdJmnLw/yJL1zpFeg4JzyppQ==
X-Received: by 2002:adf:e383:0:b0:228:9a53:612b with SMTP id e3-20020adfe383000000b002289a53612bmr5696394wrm.651.1662652302327;
        Thu, 08 Sep 2022 08:51:42 -0700 (PDT)
Received: from opal.home ([2a00:23c6:200d:d301:4971:140c:41b9:e178])
        by smtp.gmail.com with ESMTPSA id f6-20020adff586000000b00228c375d81bsm14016761wro.2.2022.09.08.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:51:41 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@mathembedded.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH] drm/meson: Correct OSD1 global alpha value
Date: Thu,  8 Sep 2022 16:51:03 +0100
Message-Id: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_085147_759213_B724A417 
X-CRM114-Status: GOOD (  10.41  )
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

VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
value is 0x100 not 0xff.

This matches the vendor kernel.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/gpu/drm/meson/meson_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index d5cbc47..45088f0 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -163,7 +163,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 
 	/* Enable OSD and BLK0, set max global alpha */
 	priv->viu.osd1_ctrl_stat = OSD_ENABLE |
-				   (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
+				   (0x100 << OSD_GLOBAL_ALPHA_SHIFT) |
 				   OSD_BLK0_ENABLE;
 
 	priv->viu.osd1_ctrl_stat2 = readl(priv->io_base +
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
