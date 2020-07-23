Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D23BEC433EC
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 09:06:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A8D20714
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 09:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1+o0cAc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dh+hv/l6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A8D20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUkcBEgTYvsoWtsulJ+gekhG29CAa9IjBKM5aQ5Wy1Y=; b=q1+o0cAcmjbG+qz8TWqeMKVH8o
	JncEWx8oCYHgcRlg4r9EPAutajzeycdlogNGFE0G9Wz4YfaC2DK7CSI6ReV9v/B5ZvopS9JvLdO0z
	gBsAL63AAm4TgTh03Vz+g7NolYioHGY7rpagluQebFEdDl4GXERk8tJEpqciPlmNxqI6KT/HXh5Ap
	exslugIErMIqbHjJebfA7vpCX6qvIwP7IEm7nM4YuBuRBXZ0ro7HSE2N0gx8XYFmU6wTT4ACirlDM
	c8O2Em4TtZzOsfhUrC0Ngf1varFEwO9x5H/jw4xoyVFZXcooUB6E+UPV4fPesMZ39V/rhAf9Wig9I
	qYdg20ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXAt-000207-Sw; Thu, 23 Jul 2020 09:05:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXAr-0001ys-EF
 for linux-amlogic@lists.infradead.org; Thu, 23 Jul 2020 09:05:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id x5so3698096wmi.2
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Jul 2020 02:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YwVwYWTqndxCbsk2H38cWSsg3v3dA5HnwhfyPRdygY=;
 b=Dh+hv/l6NQ3KPAUwJ3pGLveCtOWhIrkufkmB1J+B6iIB43BdLXWcJxxEw2kn1aV+//
 2JduwiOcZylMNxNHMcbMG9ZbOIEHlqKi3fhxPOpIxh10qbgq5XYcYr81SyFIWCdzFHd4
 15yPWQewJKf/16Bt+3N4M4eDj6wXOH2/RBv+0qs8XhfvzmcTQR74kceTWo/9YQOhHdlF
 O7P8bR3q3iUqAML7xw5WsywjG3nrGqFPLPvCJ/RvXDzoddRmu6iIgmgrJk3xL3Lx9OL+
 3Vynunr/OK7U/oZLr+jaCT+zxs/+6mBxrJajTs7hC+4/Ls4HRMdvH9wOOkaPBsOIxr6a
 LgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YwVwYWTqndxCbsk2H38cWSsg3v3dA5HnwhfyPRdygY=;
 b=L66o3RWh/cFUj6P53NOZ+hGMw0Nko3qSNHQutSnx5JTXQXwWtxjBeV98lTCu/Jj6pa
 YpJ0XuZJtOcRSTTyB1dcA2aq8Oo7bI4Of34ymYMf06rCjC6wT6zOg9ZGJNFvPPh5rKKz
 oSSSnwmK/MgBodFHP1evXCzqkGH++am/CzskhVdJXV+9RaUX3jxe26891Ole1nd9kWGf
 uMdAV+I+UbaCRakdvbSehNnIYe2+ShVwgGCPiv93LXo5I7Dvx4zhMfCjgKg/I4u1vbE0
 p1RFep+99H6Pw8bC7g0LivZj+mLgWWHydNjTkuT346OoZXO7mVftEeOvqMa75fxAf4kl
 k4/w==
X-Gm-Message-State: AOAM530qQ4DlvSseo1GNW9Zbx4h0p64w7uuoJ3t+WF0ygWvE8EMhwRCi
 oj11XZR0VJWQS7WOgfSsn9ptCw==
X-Google-Smtp-Source: ABdhPJzM4ikkmRW1tN1fO+N5OIpr1/NNankXN3WMB2rYpcK0NBtOI2uo45JomMLql69t8i0N0TZePQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr3176646wmf.103.1595495155216; 
 Thu, 23 Jul 2020 02:05:55 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id 62sm2947397wrq.31.2020.07.23.02.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 02:05:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 1/2] drm/fourcc: fix Amlogic Video Framebuffer Compression
 macro
Date: Thu, 23 Jul 2020 11:05:50 +0200
Message-Id: <20200723090551.27529-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050557_583929_23FDF3CC 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the Amlogic Video Framebuffer Compression modifier macro to
correctly add the layout options, a pair of parenthesis was missing.

Fixes: d6528ec88309 ("drm/fourcc: Add modifier definitions for describing Amlogic Video Framebuffer Compression")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/uapi/drm/drm_fourcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 4bee7de5f306..82f327801267 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1004,7 +1004,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
 	fourcc_mod_code(AMLOGIC, \
 			((__layout) & __fourcc_mod_amlogic_layout_mask) | \
-			((__options) & __fourcc_mod_amlogic_options_mask \
+			(((__options) & __fourcc_mod_amlogic_options_mask) \
 			 << __fourcc_mod_amlogic_options_shift))
 
 /* Amlogic FBC Layouts */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
