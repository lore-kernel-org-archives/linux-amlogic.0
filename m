Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0CCC3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF89D23777
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ehd7l55C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ASry5ZM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF89D23777
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HteGx7jmUMeEwo9bItoSBQL36Qga5kiH8dbv6t9GZSo=; b=Ehd7l55C5xO/hZ
	Vj5nxNCBeNKSXJ/TEiBrGvNxxM8eUG5aDRMHjTAjzgDOiQzb4aFSmWEahr8/4+/NlyUUlHKzg8kJy
	kg2TuEqM0UtD6Z5i+TtziLVsOZvXP01eG2EcmmSmi6MVhOpnGNaT3B9flekOC0FTzeBlDMvXtw1TJ
	QwH9HFjtoz6NSisD6lXSIWG9BGBin4+HPiplOI5pFBHpcW9+sXQ+CRhr/bHddjgka/D7aTVbD0tZ4
	8u7xvFPwTX3hTuTjSdLdgCC4TrFfPgQrHwtMxyX+UoU2y/Y3D9BOeJqtZKnorgAEpxTzNAWlQzdS/
	aiYnplGpaEe3loKjR3aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzhk-0004zA-VH; Tue, 20 Aug 2019 08:41:24 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhb-0004oQ-UX
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id b16so11461726wrq.9
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4Y3CFbjNwiB1B+iBEVNDBDAoCejxlfh6zI1Bb1qZiE=;
 b=ASry5ZM5cg4Mj7+Gov+BV86kT6tt0zwKyCPGbFJdX0/Lu8alE9juf83M9UoeBkkeMB
 7MOHArPNau4G6zacpVCwL6YanyGVnykHAo6AKLPTc6nr6Do11bWbvxXmz7gk+b0rRy1A
 057DmSveWUXIDbN+clUhL+CxZGzO02unnS1XjPema2TJsi+MLlS6Rre6rr6N5uQ6unfX
 i4BzCDk2w6HSnBrYZbXbEeF1XvwHq/9JvV9B/7TXjHWseEVbgJC98KycMoegfyn96+Aj
 R2GkIg5HbW+iLN6G0lfxavZCaKoKJACnK0IPZ59zh776aY5aGWBVMrGYzdZPl+t8Vs1m
 yEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4Y3CFbjNwiB1B+iBEVNDBDAoCejxlfh6zI1Bb1qZiE=;
 b=i08t0rK4fWP0OKldXsEm9vNylAE6LVWakTgAawG1puBYyYk/EY3IgB6Fqc1LvZqNxR
 w2YcBygZfBr/H3iTEK3qILZ8IzOjvSEWuwCXupt84xFbpgbnNl84XOY5cNCi0xZjggSJ
 amwkqB7KssjAfYbdGAOAGxmzUinnTM6rBPLk3rV3AxKj7S29wHQeUWjX0UwPZK0DGBBN
 oxbozJGnmuP7UtSnYdYE/074ohFRK8bLghOSTapK9Pvtuhnm9vsTCmundtIOZmcvJ9AK
 /GzaP5XfBUWFNlaZUNuhr3e6KDjRfvhcpcyRQmrkqDzeCxxbBrof0grDOFA/QDF9EzHf
 l/jQ==
X-Gm-Message-State: APjAAAWs2v1DiZwYF/SIAtvjcJVyWKFxvKHQp8oKT7+gPiTPrG/XzV0K
 /WzNcgMBBwhgmVxS2oxHrtSIhQ==
X-Google-Smtp-Source: APXvYqzVElNN6koqJa/MLyjtNn8tuQ5nmvel1gG2X/S1bupBdsBf82IjRZrX2thxmiDzXrm5ehO8tQ==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr32742170wro.337.1566290474464; 
 Tue, 20 Aug 2019 01:41:14 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 02/11] drm/meson: venc: make drm_display_mode const
Date: Tue, 20 Aug 2019 10:41:00 +0200
Message-Id: <20190820084109.24616-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014115_979267_BC000533 
X-CRM114-Status: UNSURE (   8.83  )
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
index 3d4791798ae0..c8e9840ad450 100644
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
