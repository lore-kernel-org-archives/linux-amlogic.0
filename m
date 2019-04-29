Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2A8C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02812087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKHoGKuW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yQrh7BIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02812087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IHS+TmHovxgjr9Y73DjA2OVoSIQeOqDLvsqrshk0U+M=; b=MKHoGKuWdoPLUO
	Mz8KwtQ/m2Kiibjgu4cV8B07jRvx71tqB4GqlinyFpXEcU0YVriP7bqbLr0+qfFQX4CqpM66y13xT
	dlyKiD0a8krCTYUzJ+vCMgMiOEgYEIurWHZ888uVOv/I1m2vaFo4YsF/DrGN2rTWNataZ5G/Qtb1c
	BZd5a70u/nCL5RJ7CAL43jzs7igcNoEVSOiuQe/uzcYbDCbkqsZjbGwzQOnkMCgDW7O2vDfkZpfg9
	ZH1z3T8emtRFv6NS9b5ASTX18UDskeGaIZpDUlU93TAXg7p1yLylibfthbAD1r/JewFVxJ9uiaCUJ
	cJvymy/v5n9d9YokK/Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL163-0006ff-Oe; Mon, 29 Apr 2019 07:53:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL15n-0006By-9I
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 07:52:54 +0000
Received: by mail-wr1-x442.google.com with SMTP id s18so14581998wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/mDQvnk0IIQmAZwrlmB/+Qs1VqQjgXmR4mQ6Zr5vLM=;
 b=yQrh7BIMJoH3/0jqWWCbu4c5tIODo9kRVw4r/nYa/1whLzbcUc1wNYNh1Tp2htcv15
 N1OCNf+l5RfcKPlwwPFnMuFCNCFZEnBOZ/f49lmWKh+Q+SL4alibk2iIwd9mf1qnG8DH
 /FdnrIWiZMalpBQA95V51+ih2cs2YrnTuEQwcMQZjDQjTfqTfmrZ7iNPdu5s0l672Nlz
 r62AxhqskACBze3lX6TT5TsGeaO93NfHqDpLR7XSZvy6nyXr2TaWJROc5Y7+9Im6M4gU
 kE7azJ1NPScSgDQqUiv2w2KNaq3DAOS4hl4chBYZY5rtytIKxkP7I/YbJL4mV2Yi2l6z
 Nqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/mDQvnk0IIQmAZwrlmB/+Qs1VqQjgXmR4mQ6Zr5vLM=;
 b=a9yGwxlDtlBfgYl6QQ7O8oL1NZPss81mntNKMwj7uNZXui+puBKQjQztkP/a+zOCdP
 N3nIGA5ZX37JBREBDO9REvAwTKU4y58BgxEukcBzjirC+3pJbJdMYl1JaA0hRX/mxsSk
 Wy9nwbt5X1KMR/pb2LtndIujxtrlJO/oCaXz896cPyXu3usPMtlBhJmb1WKV3ClWcdWE
 ExjkstSUNnlcWpL8x8kGYMecMTiUULhq3j4OcrEdFqnfAefhqnUC92xqHDKa2be9rw+x
 FQ7T+M7tfLtk2rxmd2YTz0ItwxgxSXWKuto3i9uZbnAiKus9CA+R26HT0aGnomr96Yht
 fCCA==
X-Gm-Message-State: APjAAAUmjm1oieOTEcl0a1CDR6sZYknzS+XOzq5RjnWlZwes8/5LQSqJ
 1dWPxKkLiI8rub9yXDn8VOGTsQ==
X-Google-Smtp-Source: APXvYqxK8h9fP1diY34GCvdYZ01wJZXC1DSL1FPL3mMAddWYdgRZE3NVRKvJYj+rs35MKDeUPkEHfA==
X-Received: by 2002:adf:fd45:: with SMTP id h5mr7015881wrs.52.1556524369379;
 Mon, 29 Apr 2019 00:52:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x84sm40099073wmg.13.2019.04.29.00.52.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 29 Apr 2019 00:52:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: Add zpos immutable property to planes
Date: Mon, 29 Apr 2019 09:52:47 +0200
Message-Id: <20190429075247.7946-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_005251_868946_E0DB4942 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add immutable zpos property to primary and overlay planes to specify
the current fixed zpos position.

Fixes: f9a2348196d1 ("drm/meson: Support Overlay plane for video rendering")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_overlay.c | 3 +++
 drivers/gpu/drm/meson/meson_plane.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index bdbf925ff3e8..dceb3df5e652 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -578,6 +578,9 @@ int meson_overlay_create(struct meson_drm *priv)
 
 	drm_plane_helper_add(plane, &meson_overlay_helper_funcs);
 
+	/* For now, VD Overlay plane is always on the back */
+	drm_plane_create_zpos_immutable_property(plane, 0);
+
 	priv->overlay_plane = plane;
 
 	DRM_DEBUG_DRIVER("\n");
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b8f6b08a89a6..2f7f4dfce45b 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -399,6 +399,9 @@ int meson_plane_create(struct meson_drm *priv)
 
 	drm_plane_helper_add(plane, &meson_plane_helper_funcs);
 
+	/* For now, OSD Primary plane is always on the front */
+	drm_plane_create_zpos_immutable_property(plane, 1);
+
 	priv->primary_plane = plane;
 
 	return 0;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
