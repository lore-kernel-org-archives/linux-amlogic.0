Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25F5C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9543E20684
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 15:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RgNIlLvD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HHYoHbnh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9543E20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CkT3wOdMEDSqG18uV8g20RSjOCXldPYftllXyCL4CNw=; b=RgNIlLvDRkbRvb
	91kOAL8l7uJ1Ssq8xkQyGW9MpS8YuvN26QIA2+ZvWsSQlXMNcVo6rIwTdHVEJLtcJQQR3My8cH6rZ
	/Eo5RsSCBCuBO1IUIeHHbSZijwJB2vw2r8W1FKhvWYA7TVQCU5ErMm7i9lEwknJn4rkiFPirC0E9G
	qFwQ7ISf+WvIhXW2EhQa7g5UVCl3krI0FVQpB4frOBcQcrFu/ly8/+PjbUGLjWNGmXhF1Y1RYdfWf
	8+BLYRgFARBfBORi/IydfPyyvWOsOLNaNqSrba0Hak6xoRBj9/yhbD/LOkiGuA6VIASBVkfY1Orl4
	MSFkBobb0FTAlvOXiRAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihbXM-0008Cs-Tv; Wed, 18 Dec 2019 15:46:56 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihbXC-000805-GF
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 15:46:48 +0000
Received: by mail-wm1-x341.google.com with SMTP id p17so2441016wmb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=HHYoHbnhUWLFFtVMUKXFDrSEywXbuf608rVEp57miIwEjlpxnsvNbm1u8VukondcRV
 9flKq3octdI14JuIpljxK99P8A6DckOYeaNUjPPleS+9+uaanNayErhrj30E+X2BnvQV
 /liqc6+Ayuz45jEXIcrRRX40LKqfDEtzL7VL3/qr91f5UsWU7pA5ck0tVzdRX0LZuuOE
 REf+UqGMpTVgTmvX3dsYnq1Uc4Ey5uvP7cGQrUFknZM/tKGsNGU8TvTt7wsX759bp77Z
 EDjl2ocu9PjPbSP2reodNoZ6Ju/FSLjVQlFV7ZeC8AW1GAp63Km+K0Qu58aL+MQpXjnC
 XD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYTni/YaBkgYSQUn7nXBaoqEYGtf4zrlvskOsHha/TE=;
 b=r/i0RqhGzbL32h7SKGCsQioVU58N3/WO7bP6ME4CyHjj0bSedIEpjpMuEvaIOYJRWL
 VKHDEtymI958flNN2qwkEyqnbHvpKMkDR6aQiGfB4+gpsXK0UL1YuQSeLeCIF1SxOh/d
 6Z4qO5ofrDrRoPCQw3cNShDipc8WVzYtjJTuR7LqzU7TrBWlcX2wyDMIUQ5F8HWaAEZ6
 FvUyvDNRZuykYEpn2dAZejmoYXoqThmf1WO0SJoEUN58z8484tm5dPoZYNBcCEp0hKpa
 X+//G7lxUyqhbRh+9Sjj8Lh9C66cwYcjsrkskad63pHbIp6I0KenK0tXGWOwXMp6N/qs
 +SPQ==
X-Gm-Message-State: APjAAAVPiXiVIsSYPxdf7NslrnsJD8+vsWV3YySgxEOrE0wUhctMb4kc
 805RtsQyxbutfeyrC+blaaVcRtbIWMcpcg==
X-Google-Smtp-Source: APXvYqxa+ljjpYhoTTPolZyT1O82GeyIErtwIxBIE6ffnaCrj6aZtlCicLWADM3U6oPJnQUwthrdUQ==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr3800521wme.133.1576684005160; 
 Wed, 18 Dec 2019 07:46:45 -0800 (PST)
Received: from bender.baylibre.local
 (lfbn-nic-1-505-157.w90-116.abo.wanadoo.fr. [90.116.92.157])
 by smtp.gmail.com with ESMTPSA id x1sm2891492wru.50.2019.12.18.07.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 07:46:44 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v3 05/10] drm/meson: venc: make drm_display_mode const
Date: Wed, 18 Dec 2019 16:46:32 +0100
Message-Id: <20191218154637.17509-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218154637.17509-1-narmstrong@baylibre.com>
References: <20191218154637.17509-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_074646_570251_7F910A79 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Before switching to bridge funcs, make sure drm_display_mode is passed
as const to the venc functions.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_venc.c | 2 +-
 drivers/gpu/drm/meson/meson_venc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 4efd7864d5bf..a9ab78970bfe 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -946,7 +946,7 @@ bool meson_venc_hdmi_venc_repeat(int vic)
 EXPORT_SYMBOL_GPL(meson_venc_hdmi_venc_repeat);
 
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode)
+			      const struct drm_display_mode *mode)
 {
 	union meson_hdmi_venc_mode *vmode = NULL;
 	union meson_hdmi_venc_mode vmode_dmt;
diff --git a/drivers/gpu/drm/meson/meson_venc.h b/drivers/gpu/drm/meson/meson_venc.h
index 576768bdd08d..1abdcbdf51c0 100644
--- a/drivers/gpu/drm/meson/meson_venc.h
+++ b/drivers/gpu/drm/meson/meson_venc.h
@@ -60,7 +60,7 @@ extern struct meson_cvbs_enci_mode meson_cvbs_enci_ntsc;
 void meson_venci_cvbs_mode_set(struct meson_drm *priv,
 			       struct meson_cvbs_enci_mode *mode);
 void meson_venc_hdmi_mode_set(struct meson_drm *priv, int vic,
-			      struct drm_display_mode *mode);
+			      const struct drm_display_mode *mode);
 unsigned int meson_venci_get_field(struct meson_drm *priv);
 
 void meson_venc_enable_vsync(struct meson_drm *priv);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
