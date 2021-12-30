Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3D0C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Dec 2021 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZproyQNSyCR9hL9j0iA0ztcIyx7HgDrNYAQByR5Wgbk=; b=DtBtAgdZ3C2Upe
	haY5pGwXgyATkdXdqXl3RCofoKuqX5x5UwY9y+RoZyq52j+gEE05GDZVtGunhP5v6Ksf70Ni355h7
	Sc+zogcNKkAdR2p1I3qrw1uWahq1sugxtr2mscVi/jaXR7YpndWecSg1eo4lde6r1kcn0pbDDttPT
	D/GwpwoFg/vWrWF/1260f8iux4Y/zCyWuLGNsakajFfAGx6HL3+0AxcLIjJJv5yz01jikc2yD83ht
	NYC+85Drj8I5958U43GtS5v63C0SmVlrn9FIQTm+EZPJ7l6rRSAOYKAspT1vT8NEpGoqx8TIe4AOt
	HK+lmMQQENR4XnOVyMNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n35Ha-005Qc2-7s; Thu, 30 Dec 2021 23:56:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n35HM-005QW0-Jg; Thu, 30 Dec 2021 23:56:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso10234986wml.0; 
 Thu, 30 Dec 2021 15:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFvL7pdJQp8AYfej671RZFZags7RQdaCXA8Avf0aczk=;
 b=WoQxQyHHNEuujtmRefYts9/eJvYCQLHQHjB5GUm+LIPKgtBu8tbq0hb9pwu6JW2x2p
 aBo/klSOksfErwIeTjmWA3cs0bKZyZBbIVVLm5QXOsvtDkmK03X1NK3HN1rdyugLFQNM
 stdiUoZ3oZMkJzzxu6NDLmY21Da5OTeKgqU+K+uDpGXVyCkU8nc31kdKMYv0rCSjnjSp
 9Lo2k7gPJh1REyQGsi6Cf6/jAMqqFCYhDW5jVfMGw6+TqI0iiqRVhn7LDtgBQgMynEMQ
 55AQFf724ym8bQLeuJBM05h3db/C7F0G5352ZMEFNc/14JrNjuL/wbNoEEh6sUfIVFyK
 1Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFvL7pdJQp8AYfej671RZFZags7RQdaCXA8Avf0aczk=;
 b=617ZKBgUYFhumiNb2B2QVqP+sV3xsijiGRxpMor7PZaq2ASUf1Vp5rpENA85aB9390
 +FIrooiJWJjYbvOuzMnRGeCmf2wXqG8mNcbRg7iT3/E5S8qRQM3l33z+c2vrtJqOEfbi
 hiHThJgqTTvysv4OdWKcVeHOILRmygVw6FOHpmkDvpBC0ecTktKygxOwclmE/fky7La1
 By8YCBErNY7p634gHMghJWSZCTZNTiu214+ZjqQuYEqhR/jPSws+WSQzT65yFTPkKAqb
 x1Tp3DXoxceaN7vzbH8Wogw2cuMK+SIsNl9oyPaU7IdHVMuiN5uO/vOybUMVWsGiTSu6
 MIxQ==
X-Gm-Message-State: AOAM532XguarYf3msopUSG1COqhh9yJrOxWC2SPC7yQkhjy3IGZhJ6iq
 TuUydDMC77N8+csw9oUtPG2wqdI5/2Y=
X-Google-Smtp-Source: ABdhPJxI/IQ7vUSEInzQPgR4Ojrd7saifRClJXyk6CmGxJ/+kfFq1nRZcPYQTz7DzXSB3+0RMGs1QQ==
X-Received: by 2002:a05:600c:1e12:: with SMTP id
 ay18mr27786824wmb.14.1640908574997; 
 Thu, 30 Dec 2021 15:56:14 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c015-2400-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c015:2400:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f16sm35137581wmg.27.2021.12.30.15.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 15:56:14 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] drm/meson: osd_afbcd: Add an exit callback to struct
 meson_afbcd_ops
Date: Fri, 31 Dec 2021 00:55:14 +0100
Message-Id: <20211230235515.1627522-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
References: <20211230235515.1627522-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_155616_670338_D0AD59A6 
X-CRM114-Status: GOOD (  14.77  )
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

Use this to simplify the driver shutdown. It will also come handy when
fixing the error handling in meson_drv_bind_master().

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c       |  6 ++--
 drivers/gpu/drm/meson/meson_osd_afbcd.c | 41 ++++++++++++++++---------
 drivers/gpu/drm/meson/meson_osd_afbcd.h |  1 +
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 80f1d439841a..b919271a6e50 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -385,10 +385,8 @@ static void meson_drv_unbind(struct device *dev)
 	free_irq(priv->vsync_irq, drm);
 	drm_dev_put(drm);
 
-	if (priv->afbcd.ops) {
-		priv->afbcd.ops->reset(priv);
-		meson_rdma_free(priv);
-	}
+	if (priv->afbcd.ops)
+		priv->afbcd.ops->exit(priv);
 }
 
 static const struct component_master_ops meson_drv_master_ops = {
diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.c b/drivers/gpu/drm/meson/meson_osd_afbcd.c
index ffc6b584dbf8..0cdbe899402f 100644
--- a/drivers/gpu/drm/meson/meson_osd_afbcd.c
+++ b/drivers/gpu/drm/meson/meson_osd_afbcd.c
@@ -79,11 +79,6 @@ static bool meson_gxm_afbcd_supported_fmt(u64 modifier, uint32_t format)
 	return meson_gxm_afbcd_pixel_fmt(modifier, format) >= 0;
 }
 
-static int meson_gxm_afbcd_init(struct meson_drm *priv)
-{
-	return 0;
-}
-
 static int meson_gxm_afbcd_reset(struct meson_drm *priv)
 {
 	writel_relaxed(VIU_SW_RESET_OSD1_AFBCD,
@@ -93,6 +88,16 @@ static int meson_gxm_afbcd_reset(struct meson_drm *priv)
 	return 0;
 }
 
+static int meson_gxm_afbcd_init(struct meson_drm *priv)
+{
+	return 0;
+}
+
+static void meson_gxm_afbcd_exit(struct meson_drm *priv)
+{
+	meson_gxm_afbcd_reset(priv);
+}
+
 static int meson_gxm_afbcd_enable(struct meson_drm *priv)
 {
 	writel_relaxed(FIELD_PREP(OSD1_AFBCD_ID_FIFO_THRD, 0x40) |
@@ -172,6 +177,7 @@ static int meson_gxm_afbcd_setup(struct meson_drm *priv)
 
 struct meson_afbcd_ops meson_afbcd_gxm_ops = {
 	.init = meson_gxm_afbcd_init,
+	.exit = meson_gxm_afbcd_exit,
 	.reset = meson_gxm_afbcd_reset,
 	.enable = meson_gxm_afbcd_enable,
 	.disable = meson_gxm_afbcd_disable,
@@ -269,6 +275,18 @@ static bool meson_g12a_afbcd_supported_fmt(u64 modifier, uint32_t format)
 	return meson_g12a_afbcd_pixel_fmt(modifier, format) >= 0;
 }
 
+static int meson_g12a_afbcd_reset(struct meson_drm *priv)
+{
+	meson_rdma_reset(priv);
+
+	meson_rdma_writel_sync(priv, VIU_SW_RESET_G12A_AFBC_ARB |
+			       VIU_SW_RESET_G12A_OSD1_AFBCD,
+			       VIU_SW_RESET);
+	meson_rdma_writel_sync(priv, 0, VIU_SW_RESET);
+
+	return 0;
+}
+
 static int meson_g12a_afbcd_init(struct meson_drm *priv)
 {
 	int ret;
@@ -286,16 +304,10 @@ static int meson_g12a_afbcd_init(struct meson_drm *priv)
 	return 0;
 }
 
-static int meson_g12a_afbcd_reset(struct meson_drm *priv)
+static void meson_g12a_afbcd_exit(struct meson_drm *priv)
 {
-	meson_rdma_reset(priv);
-
-	meson_rdma_writel_sync(priv, VIU_SW_RESET_G12A_AFBC_ARB |
-			       VIU_SW_RESET_G12A_OSD1_AFBCD,
-			       VIU_SW_RESET);
-	meson_rdma_writel_sync(priv, 0, VIU_SW_RESET);
-
-	return 0;
+	meson_g12a_afbcd_reset(priv);
+	meson_rdma_free(priv);
 }
 
 static int meson_g12a_afbcd_enable(struct meson_drm *priv)
@@ -380,6 +392,7 @@ static int meson_g12a_afbcd_setup(struct meson_drm *priv)
 
 struct meson_afbcd_ops meson_afbcd_g12a_ops = {
 	.init = meson_g12a_afbcd_init,
+	.exit = meson_g12a_afbcd_exit,
 	.reset = meson_g12a_afbcd_reset,
 	.enable = meson_g12a_afbcd_enable,
 	.disable = meson_g12a_afbcd_disable,
diff --git a/drivers/gpu/drm/meson/meson_osd_afbcd.h b/drivers/gpu/drm/meson/meson_osd_afbcd.h
index 5e5523304f42..e77ddeb6416f 100644
--- a/drivers/gpu/drm/meson/meson_osd_afbcd.h
+++ b/drivers/gpu/drm/meson/meson_osd_afbcd.h
@@ -14,6 +14,7 @@
 
 struct meson_afbcd_ops {
 	int (*init)(struct meson_drm *priv);
+	void (*exit)(struct meson_drm *priv);
 	int (*reset)(struct meson_drm *priv);
 	int (*enable)(struct meson_drm *priv);
 	int (*disable)(struct meson_drm *priv);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
