Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFCCC18E5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D9E6206F8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 08:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ao2ErWG6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tYYkl7w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D9E6206F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tO90TkzfwGtcQmnjtStSZfU77FRdJrNKPHJ4u4YWVMc=; b=Ao2ErWG6xv5Kej
	Bmn7M0qzJ4u26EMT8VhTWWwwLr6fZbZwrBSBybrOEDidbGt5I0xHzTzaH5LpZuziUwckibbrs+JcP
	JpTyuxx/sqgvKhXzTcnREjODVziTpydV8fs30vNuNJhjCQ9IxrvizRcdaajg7O3NqhqEX3tDQk03h
	8JOFGbjbbERUIlfd8ehThONmnFCQCUgHgi52twHF9XcR2Y9++M4OBn+5kG8o1Af1ykCnaalk0Sf9P
	8BZCPvww6kzM46bZkNbLpXZ75jnB/I7O87BVLTMik22fQA3m36W+pXuo/gKscFkMelEso+mwzbe9F
	czsw86wbq/zY1I2jwklg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1mP-0005QP-D9; Wed, 25 Mar 2020 08:52:53 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1kI-0002vN-77
 for linux-amlogic@lists.infradead.org; Wed, 25 Mar 2020 08:50:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id w10so1832919wrm.4
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Mar 2020 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7NBuU6BQz6Obl4bQL5kVXb4i/CiUVxXf3T2A6sy18g=;
 b=tYYkl7w2rkDL5ykaeimrPutSRwZHQ7iS+8kB1dUyydbsaydxVK4EY7ovdjecPrIWV6
 fCFrWdQKHfxHPezznmFrw+ujsYrqvjiHFIhrwak7CJuT6eSobyVh+eURDrS4zr7U7PZB
 Yc3oDiR511B/zVsLh/akZpKlEVlQmuU4L94xCTqrXS/QZxDnXNHZp2UVL8E04eOEsFy5
 J44RA9ejyor0TWODhxoRURdiZqSEVw3BG9uvO9+se9eB1duPcCb+MqXZBHAorsrvny4B
 ePR7M7E7oRNp3niOZ9M+xUyR02XEYgtvJIl5uHwOYYnDXxat3cOsS6dMf6rAaXA9LzKs
 KhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7NBuU6BQz6Obl4bQL5kVXb4i/CiUVxXf3T2A6sy18g=;
 b=r2tkEHU8Wj6AoZby5ALfDWfbqc3TTNnZLKc69WHeFreSrG8T2H0UlAXP3KdOcVY7Xz
 VWQ4B5sQ5ZKxtS5FNkoCfkOj/pkxPJnq09Vd8oXlmNl4+EQFzR/zyRa7MpBfFtHdJKoq
 pyHKRU3lzCkHfM0kl3GeTCcT59ykqbXBoghmy2OEQnxCpL8QdSbOd47v1/sP9QvvqQvh
 kzPZm0KFvh7ZO144NPnRILgkOUTnuE6yiF99s3mDVILY3V2O0zirSCO++O6Dg2vNoV8x
 NCwnhzXXll3JnBeoM3adL3zA0MW5Mj8l6g8f/EC+hX27VE83j7dtBMHrbJQfkIx5Dob6
 P/iw==
X-Gm-Message-State: ANhLgQ3XjrR0yiwn8X28F214QfexWOhIScd1+F5aSCDXvFsU5iSMSwEL
 M40RHFLeLgxC1cUmtzNee3lb+Q==
X-Google-Smtp-Source: ADFU+vuou5X1eDZ972N84Mwzuo/ljyXvfQFfABfKOKpCvwoCetTua86kkxSrWVNvCj18ZaTj49gujg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr2095608wrp.23.1585126239909;
 Wed, 25 Mar 2020 01:50:39 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id o16sm33892229wrs.44.2020.03.25.01.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 01:50:39 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 8/8] drm/meson: overlay: setup overlay for Amlogic FBC
 Scatter Memory layout
Date: Wed, 25 Mar 2020 09:50:25 +0100
Message-Id: <20200325085025.30631-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200325085025.30631-1-narmstrong@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_015042_301163_7BC2949D 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: mjourdan@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, linux-amlogic@lists.infradead.org, brian.starkey@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Setup the Amlogic FBC decoder for the VD1 video overlay plane to use
read the FBC header as Scatter Memory layout reference.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 48 +++++++++++++++++----------
 1 file changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 8b9d4984b2a7..3c54135f53a0 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -487,6 +487,9 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 					  AFBC_HOLD_LINE_NUM(8) |
 					  AFBC_BURST_LEN(2);
 
+		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER)
+			priv->viu.vd1_afbc_mode |= AFBC_SCATTER_MODE;
+
 		if (fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING)
 			priv->viu.vd1_afbc_mode |= AFBC_BLK_MEM_MODE;
 
@@ -675,23 +678,32 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	}
 
 	if (priv->viu.vd1_afbc) {
-		/* Default mode is 4k per superblock */
-		unsigned long block_size = 4096;
-		unsigned long body_size;
-
-		/* 8bit mem saving mode is 3072bytes per superblock */
-		if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
-			block_size = 3072;
-
-		body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
-			    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
-			    block_size;
-
-		priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
-
-		/* Header is after body content */
-		priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
-						body_size) >> 4;
+		if (priv->viu.vd1_afbc_mode & AFBC_SCATTER_MODE) {
+			/*
+			 * In Scatter mode, the header contains the physical
+			 * body content layout, thus the body content
+			 * size isn't needed.
+			 */
+			priv->viu.vd1_afbc_head_addr = priv->viu.vd1_addr0 >> 4;
+			priv->viu.vd1_afbc_body_addr = 0;
+		} else {
+			/* Default mode is 4k per superblock */
+			unsigned long block_size = 4096;
+			unsigned long body_size;
+
+			/* 8bit mem saving mode is 3072bytes per superblock */
+			if (priv->viu.vd1_afbc_mode & AFBC_BLK_MEM_MODE)
+				block_size = 3072;
+
+			body_size = (ALIGN(priv->viu.vd1_stride0, 64) / 64) *
+				    (ALIGN(priv->viu.vd1_height0, 32) / 32) *
+				    block_size;
+
+			priv->viu.vd1_afbc_body_addr = priv->viu.vd1_addr0 >> 4;
+			/* Header is after body content */
+			priv->viu.vd1_afbc_head_addr = (priv->viu.vd1_addr0 +
+							body_size) >> 4;
+		}
 	}
 
 	priv->viu.vd1_enabled = true;
@@ -771,6 +783,8 @@ static const uint32_t supported_drm_formats[] = {
 };
 
 static const uint64_t format_modifiers[] = {
+	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER |
+				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC |
 				   DRM_FORMAT_MOD_AMLOGIC_FBC_MEM_SAVING),
 	DRM_FORMAT_MOD_AMLOGIC_FBC(DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_BASIC),
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
