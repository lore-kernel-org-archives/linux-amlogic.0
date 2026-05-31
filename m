Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62885CD6E51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 May 2026 07:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo/XD4u97nHU/aREKebZeSAtkJcHMLSUaOmWKLIVeV4=; b=OyoDG9MIkuBzEX
	cDkWzmm2rl36bSkiiPS4tkdoQJPx+sqVSRHySEb+7YbZrRZjZtlTwTiZdXTj7rAb+0KbJzDN/kkPU
	1gG1kMNp3T40g4G7fTfKgEiWCrR2TZEqhbzhiEkxNPrD6mxN1THk+famzd7u1fCYRIgYgvQUo6/zb
	wVkyqOcxHaxu5/xO9g082sLliTn8v39Fws6l/qv52VlT34X7VK+WNZPfRF60Q4SNOXAWb6eTUN52C
	jX/O9IuYRuZDiIubf7keEyWnoTlTpuXAepS7qAavdc2b2kiOc1ekFX8KTRmhWpDMPjPuA9ZZ/k0Ek
	a3ZBEA7hHpdZiXNWFb8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajR-00000009KYp-315X;
	Sun, 31 May 2026 07:37:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajP-00000009KXd-2PRQ
	for linux-amlogic@lists.infradead.org;
	Sun, 31 May 2026 07:37:12 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8422f148dfcso319120b3a.3
        for <linux-amlogic@lists.infradead.org>; Sun, 31 May 2026 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213031; x=1780817831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRd0rxdsonje9jnyvzmzGfqu89ZUVs4w1wFb8uxr/rs=;
        b=h6zTjafgRKn3+StvrZm0qrhSNK+jAMD9tPKJ06QbNcaCbx8cPW2rPjgawbIlUVj0A1
         1mBlTx5ECVIoYs7qwqCXzw+m7fZxukzjLShiWYKaZfrmFbL4BKuhRxLIRP/HtJpdsrb4
         aLzj1Li7iwh8UQ4H01TKlP+kkXT9iR/osyZPm1/FFUs22NPnhuHFi/xxwVa0SMaTqdpY
         TNqy3KpG0Ln+rbY0j02FPDNAdeWGMEp8vKrmheSu1Tu76fKnpPl8R6PH3bxCQtt2Xp8k
         1v76iHfuOQREo/qYhmuK0TASwRbWYk5Zy9nRRcvkG+8r3ZUqv12HvTxUz+P1iTkVqd+s
         2eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213031; x=1780817831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRd0rxdsonje9jnyvzmzGfqu89ZUVs4w1wFb8uxr/rs=;
        b=pkO8oUoqzGiacQXWXo9uvuyMceYr2TXao3kHYH4k4dJ8f/+uhI9j6+z//E3oX/31SA
         qVAQsT69V51ZM6DygRiTrnFhRaYKwEc9SsDTaXEusdreMyjdAZ9lvgXj0kX1+/T5etDD
         nsraro5i796LHVWd7QVwwZQ6NfamguuAr9pCLYcB4rEfWlV+bTogp73MLmeb2qAQ8UkJ
         Zm/B9PHzcnXqZ+aCYSTaHCx/QYLYTi1CdnRpv0SL097tzK/6Bzl0qWdpfKydxW/yxgUD
         tFuFpE/sIpvVUdVMIIHHwJB93R0cuJLSmM//GTZv7Ei5+SSzu8wB6y08i376wydsLjD4
         Nwjg==
X-Forwarded-Encrypted: i=1; AFNElJ+eF2Wi49aHYZ0MysT7sR6OOMDFZ4dgVbuYHLYhqlc37h54PecKBdl7lsRhykbnZsExU0QCb04BgU7DuhKs@lists.infradead.org
X-Gm-Message-State: AOJu0YzYpx/QdBW4HpEKqZfoYDfWTIWLxe7mOECA0WW5dK6UAjd3zTGM
	XOMr0f828gw99zJ77UeOwDLR8nhrw/PWdpboGOTH1pghiP8/xu+F0TyL
X-Gm-Gg: Acq92OG3eIcIyqCAj8etU9faWNuavp6LdKPxfLeynIbNui2fxyU2IVTSgP6/6bxeeJC
	hT/YzbcoMT/vNn2hWLfhNN2bbyV5S6YnLZ5PAkPFig0U+6VunfGvr/4LhtCcDiTi+C4XKn7MieU
	bcnAmBm3XYEROVes6ObcWckvjSv7I4khBLxNwgR8AV17IlyCZPz+7GjyU60GOmAMFj+MkjBFvEV
	tALxdSvMWSTKT1ibWC8+dSuTVpxeQzoxa5etY4uqyn6whCRs/aOCu8I2ymviyFSQquf3o1km5S1
	8PWMDIZ53aGVhZ3QoDdyxiNfbCyVmPOTo/FyUEC4+6xvLTgicMdsAQDeZM/R/CZgEsqYYl6058d
	f9Z+JNJGuH4rnIoiV9aPIZ/1LFOQq2jA2ohzk0oYzOLihUZk2Nn3OkJcQAWlM8k1vRWwk4BpjdO
	CLw7auLgYoOQNaf3rzVghPeNmzji0uU+OLHrRjVCp03A==
X-Received: by 2002:a05:6a00:408f:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-842253a671fmr5468493b3a.20.1780213030642;
        Sun, 31 May 2026 00:37:10 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:37:10 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 2/6] drm/tidss: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:28 +0530
Message-Id: <20260531073532.8609-3-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003711_615345_AE2CDD30 
X-CRM114-Status: GOOD (  10.44  )
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
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 81a04f767..4d73a271c 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -13,7 +13,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +80,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +98,9 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_drm_encoder_funcs,
+			       encoder_type, NULL);
 	if (ret)
 		return ret;
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
