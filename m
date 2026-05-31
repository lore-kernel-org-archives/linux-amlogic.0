Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3CACD6E51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noTxsh8VwKOrTNWXd50hf/mRlemampdK0uI0B9TDmw4=; b=hebi/VqKnCJUHk
	oEbUK2zu04DPYRwabBpnDtGo68sNgV1f0jSnz6E8LBBYx5/lIGfJhGcCEM9w2qFe7C9jWxrcnvUKl
	ZPDkhHng/2Y6asCLc/DFn1hedFR46soaR8F6CwXl6LK2VZ4/ul4+ts6goeR9+qfDXj1+Ox8/NCpaN
	PJ4fxrcPJsESAoW1gBEKhdaU/mczo6Mw9Wa10/7x57ikXySuKfvzM9ChnnSV57d2gCsGUrk1Wfy2K
	IHcsUpXwu/fdmzSAmwv8ITk9tZ1OIczH+pOxw2iAnrBfGjxvdwZFZuHMrPdSqrIA8bnVIeV/HEpEs
	UPkrNDbVm4Crxr2OAWFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTat0-00000009LIE-0lsd;
	Sun, 31 May 2026 07:47:06 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTasy-00000009LGN-0GkT
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:47:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so727410a12.1
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213623; x=1780818423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ904ivttfHdS60TN1sr5eWp6rmZB5uxbrG2ujQs++w=;
        b=d9KAH8dK+x69Gn5kCzc5CB8ed0cY/GwC5XsgCrs1YElnG3X/8CYNBQQsheb/YfGpZS
         YzvYiBcW9YlE0P90kpn9bF0MamnEU0psEZ48CYvwFn004YWf/4Hfgbq5dWDYyr+ZqUrd
         UMAbZjZOVCcS/ds96/tjYQcXskul9yW3saPoUBwYwQf6J4A78cMdXe3aK4sMxGEo4iq6
         65zq6aDqzMkqzz9u+C7i5+0UV61j4ZiCDZHywAfuBgLHy21ZPIAX0d3hHv4lFzy0sUrx
         W++8vtmz8+PXABbCVXs7GN/2d+rNlbBy2t7A3ICpSmkXAa/wuopeQxlo39s8NUVUPzvG
         jafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213623; x=1780818423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZZ904ivttfHdS60TN1sr5eWp6rmZB5uxbrG2ujQs++w=;
        b=loqgurEr15fZM/4r7efoJJBhtq5GqF2iZ85tz+FyGN80u7Hgorq6XYTDzyJAhg9uFF
         a5iBbGbJeh0hfzGMqGiVkIYYBIH2EqEw9Z3P5J0Muy2voseO+Z2Wb9nSaQyYzElgzwPv
         j2ScBzCmUjO0s5alRqKBrp8Me9OyUsm0axpNfZO59N3wVne9BLwpIjh5iiYsj/GfIl0o
         eJs7k8Vgr1q1i6l5q1DIZKAsCtaAv6AQJa8PrXKbCseqWURiwt3+RzQv6xSNkDJjbUPE
         rTJY+vv9tlaF52rRPQutVzWObJLlEGR6pJR0Xjd+JdLkhjF3egHTAa+8phj9aVgUi8BQ
         n+nw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZPUXidwdpoDEWkrVpnCXOeybOpQ+FdFWcOsPQpjeD95bqNmQbK/ekU2ePzxYgP15zDZngYSWkU1pxfGZY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtkfmc9Vg3cu68L+SHRCrKk5+FIk9/CzOPFWHrhEF1N/GSokrG
	9s14QXxFlyolIuFwm8nBg5Wyu/Vxk8+sGoUjZawLnr2XU601tNlzyo84
X-Gm-Gg: Acq92OH1wDnnRS0Z/O8NNsHTlv7/bUTkMQt3PJ35r1zJcS9VmIvJOyPtfcQxZ0Rq6E2
	EJo809pzHQQVECCHIbMsU0ycgL4sfEYqUyUfOCUusyf0A6VIb+B0Lvp+hwX0y+002uF0Y0S9QxT
	ElJv5ErlmVp9Y/pMIaBVeJ1m6/NqbC0XIuLXycH24bD4ltzJZeHYj7n/fy9ZzcOGxYk+nmRgK9l
	g8+FmS/pUFHeOpqdaTq1wKj6ef8oz9NZpx1czF+kE1NAVU95hsBu8zQ1s/oU+yFvdq24tHnAQGt
	VgtVwUEOfdOt/nfVNug9eK4zwI51mfT3SU9nmWDtuEwE8gtQF6syn1EqfXNQywL9qM6plf/Dw47
	1HcVgI1/xQ/NjPYFKp9M0ShNIvqxKm5AsmpvuHljD1QwSYC0XZ5AcYxXKapN71lc1KDu0c5C5uh
	pzpi33UVMYxkerGx3OyhsjF1yh2BskQxeF+DWw3Y1uzA==
X-Received: by 2002:a05:6a00:a211:b0:82d:162c:581f with SMTP id d2e1a72fcca58-84225a087c4mr5251686b3a.48.1780213623224;
        Sun, 31 May 2026 00:47:03 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84246844780sm933636b3a.30.2026.05.31.00.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:47:02 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 6/6] drm/meson: Open-code drm_simple_encoder_init() in encoder_dsi
Date: Sun, 31 May 2026 13:16:27 +0530
Message-Id: <20260531074627.8936-3-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531074627.8936-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
 <20260531074627.8936-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_004704_105542_D4AE6229 
X-CRM114-Status: GOOD (  10.67  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_dsi.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
index eba246791..e14da1f71 100644
--- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
@@ -10,7 +10,6 @@
 #include <linux/of_graph.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_device.h>
@@ -99,6 +98,10 @@ static const struct drm_bridge_funcs meson_encoder_dsi_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
+static const struct drm_encoder_funcs meson_encoder_dsi_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int meson_encoder_dsi_probe(struct meson_drm *priv)
 {
 	struct meson_encoder_dsi *meson_encoder_dsi;
@@ -133,8 +136,9 @@ int meson_encoder_dsi_probe(struct meson_drm *priv)
 	meson_encoder_dsi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
-				      DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_dsi->encoder,
+			       &meson_encoder_dsi_drm_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret)
 		return dev_err_probe(priv->dev, ret,
 				     "Failed to init DSI encoder\n");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
