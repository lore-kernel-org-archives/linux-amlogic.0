Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB0CC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SLI6VoVxsUiMQR4r8YYAmD7SoaQEVUKXlOYe0cl5NhE=; b=jv3S6mjkZDBSDo
	p1AHzy/jCP+JeGFpegkBW1T8RTEhMnXVedrp+uIolou6kAl8yc27AsHPL9/5JfdC6uSLUyKfzY5eX
	fVWdho2NBi780X7e0WpDv5Q+lUHKv/PZE+66mv0HVU65py0R/WjPcJbm7Jxv9vlmXLxXiU/nrV6He
	ZhCHRiy3CeevVH7BJzbmKdIONVtV9y25ZH76bccc9N7OFwecWgaFrTeJHTqcIEh1XRB430B2njYok
	kM42cfTw4Ow/gqxoOm8tbAtCh6NTNrQfkThzF3oz2eoX8LmcBGxFkBsLvujxNgh92NqI7WjJuidj4
	KifHU41VbNGVCFCduYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovJW5-004ctU-Am; Wed, 16 Nov 2022 14:35:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovJW2-004cpg-Sb
	for linux-amlogic@lists.infradead.org; Wed, 16 Nov 2022 14:35:52 +0000
Received: by mail-wr1-x433.google.com with SMTP id w14so30218452wru.8
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Nov 2022 06:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
        b=WGzXTljvZSs2p0IjXnKub2fXvs+by26DaMNPHNseJK45SXzjN2mpHV2nhd5fKcEzUd
         FxuC7mCyzPTDLpcs9+NvZw/9f3yKf5aMMPfu8xZ0EooP3sadwjoKmJQIu4kflQL6CSHm
         3mmk+vdddaNM8D7JGuOalFOsbuiiNyj8JYnY6upvijkpjzOqH6D3L5M+I87kCYmwj6Qr
         PDHcRDHRBVD9EhBevRNBQXWcMgSIyBCz23/yjiEgPggheZs0hqVzZAVRSOxz++e8HEEe
         su8WM+SnpCoQWwhJnDVoUmTLsNLqMz2pBd+0Ixw/wVgwV1Dj+Mcpr39k4ZwAjv2ULZR0
         fVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8czfhSUs3mWHeIfFdLH5/G0a3Uk3RSmYGgvVFUZjxw=;
        b=rDbt7Nw3g7rczlRLBu6NG0s676TQb941/+OCbLXyqMGYgBFKkS9SYrcXisx0oEr2qs
         yOZTfALVwuC7Zw4enDoAu/aceq0l7+2ddNmCNajo5c+Krn9iXWipimPFOsShAGcB+28v
         0z0gIKjo7grTZgKHdAn7856qTvT4gx2VFz6W7cNF/Odcj6A+kq3p5t38FJr/MhEt7Swc
         pRF22ojfKtiQS+DA8xfVNL6G8s8VjNKmQ257brjXPAcqhjBJcqniItLXU8Am9S9krJlV
         vOBa+vYtpMeBKwawgq9eE7Ntb1c6pjfNTXqsvOCKxzXRf/9PhyQ+6gEQ3YRnpFI+o8+V
         wqAQ==
X-Gm-Message-State: ANoB5pnB3w3XXmAfj7oH8UGgiWJKyr1qGi8bkGy5EMk8+1iSHDR2BnIn
	iXz+7GVDg+FDvKg00D1tjE8=
X-Google-Smtp-Source: AA0mqf5598TxLDqy4tIWUpYjpY0aL3kt7HPLQgal2MvvcizUGXiBe1ztwx8Cofhygfbkrm1iEOsnCQ==
X-Received: by 2002:a5d:658b:0:b0:22e:3397:2e96 with SMTP id q11-20020a5d658b000000b0022e33972e96mr13714180wru.535.1668609345451;
        Wed, 16 Nov 2022 06:35:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:5da:d460:bf85:51f8:ca78:20c2])
        by smtp.googlemail.com with ESMTPSA id x11-20020a5d54cb000000b002415dd45320sm15152354wrv.112.2022.11.16.06.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 06:35:44 -0800 (PST)
From: Guillaume BRUN <the.cheaterman@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Guillaume BRUN <the.cheaterman@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over YUV420
Date: Wed, 16 Nov 2022 15:35:23 +0100
Message-Id: <20221116143523.2126-1-the.cheaterman@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_063550_965087_D9E4E9A9 
X-CRM114-Status: GOOD (  10.40  )
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

Cheap monitors sometimes advertise YUV modes they don't really have
(HDMI specification mandates YUV support so even monitors without actual
support will often wrongfully advertise it) which results in YUV matches
and user forum complaints of a red tint to light colour display areas in
common desktop environments.

Moving the default RGB fall-back before YUV selection results in RGB
mode matching in most cases, reducing complaints.

Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
Signed-off-by: Guillaume BRUN <the.cheaterman@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 40d8ca37f5bc..aa51c61a78c7 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2720,6 +2720,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	 * if supported. In any case the default RGB888 format is added
 	 */
 
+	/* Default 8bit RGB fallback */
+	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
+
 	if (max_bpc >= 16 && info->bpc == 16) {
 		if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 			output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
@@ -2753,9 +2756,6 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
 		output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
 
-	/* Default 8bit RGB fallback */
-	output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
-
 	*num_output_fmts = i;
 
 	return output_fmts;
-- 
2.37.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
