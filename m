Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1FAC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28EB207E8
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 15:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0vdniiZk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Eo+0w9c4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28EB207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FhkQW5tG/BF5kvkiWyHsJvCzWRObPEXRX5lWhHvM1NM=; b=0vdniiZkVeAnbZ683ve+CbLAv
	LK9j1P3W9whtUDz10zb8tdBhfmuA6HbmExpSBVu0aL5sJ9hojjsQjeumswvWFph8OqIxpB8dM2VOa
	NMAbjeIQx9JgETo/1G/7Pz+lla/M1tna2Fa92E1W62sc/zLroEgElK8r5fUTKO9DhCY3J9FHK4tUy
	OgaOV4KUFHi6r6nFOru8bof9qK86gryhd95wV6QQbGrBE3vVYYHOHtXZzMEAFdF5FKAamb3fJvtR6
	MoU/ZrVe0MT4YOTbsKI0mqPHILgVcGmApzthBmo8mfP+h0qEeHGFUMHT+ZaeQvgWJT5QTbH0y1pKG
	xMQG8mzKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0oFY-0002vH-Vy; Wed, 29 Jul 2020 15:44:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0oFV-0002tc-Ua
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 15:44:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id r4so19129958wrx.9
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQIn+VEpnEWmSg9hS5AE3VgFC5CX71fT+x9MqwA/nSI=;
 b=Eo+0w9c4wPP7x+MiwaxTzJX484Ai6UmktMd8hl2Q5Eu7JdW4RcKGROLAIeJ5MoIQV7
 SZcw9L4eFS3ufCY7FdWL6qdbbUhqqMv6kq8e+lMtk0B8HsVV1NzGj9IQHgXOVNmfbF0M
 OUJ/zIkQq+hDQd4iUqTxiwsL5SAiAApARsYsD74qqaC4Y+obzj0AoV4o1diNM3v7SLv4
 BVSrUDX06j9FXxvYq2WM+PBBHSvDwOYZZcNy67cs4+O7DWffIQ0YR4FXK/eGvUPdkjEu
 PtXZLqU9kaZ+ojo7qYMIcESGpKDoKrMkwi3d7AcS3h+7Fho57bOiamNQkQVRChsYf6p5
 JI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CQIn+VEpnEWmSg9hS5AE3VgFC5CX71fT+x9MqwA/nSI=;
 b=kf6Fvgnt2dpalOPLhIDM7CGWnuogvE2vWMARQmwLOJaVPUx9qzywH0NbhGqRh9Elr8
 PtzgHhFprwJ9JwQSjr5Te114tntZCWWWBRj+tWYBOOFAKRe8x9l00Ic6L2+xz+hDt6cp
 JznGBf73+CwDItlXnYCbWASydJH3U1JUgIhxUd+CvcwDLuRGyQNdwJ9afKhRaBxoj92U
 qLpvLWpGyTdFDe91RRb7fmJDEDCVQp1vYST1IdXfAAXnzD6TqvRZS4kCX8+nWf1cxYPs
 bdtURhOFtzVhtc65Fj6KIFSDdS+Yb5tmxRTRnXcxJiDpoQ2GbXErAN3ZLSnY2vZheo51
 K7tw==
X-Gm-Message-State: AOAM530wSruDtrd0NrnSFkM9yAvqTLDz7RNPIhwZTVTr6mprp/AjJgV0
 PzKl/G723GH7QcauXDChniIqLQ==
X-Google-Smtp-Source: ABdhPJyA5nUpAfKxBwT5CUr30zbViSnYuF9A6uKhawAchbArA6W9CY8esvozk1vQl5v9DuoiBTeTiA==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr29665660wrl.129.1596037447519; 
 Wed, 29 Jul 2020 08:44:07 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a134sm6526030wmd.17.2020.07.29.08.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: meson: add sclk-ws driver
Date: Wed, 29 Jul 2020 17:43:57 +0200
Message-Id: <20200729154359.1983085-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729154359.1983085-1-jbrunet@baylibre.com>
References: <20200729154359.1983085-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_114410_028734_9B0722A4 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is yet another simple but odd driver for the audio block of the g12a
and sm1 SoC families.

For TDMOUT's sclk to be properly inverted, bit 29 of
AUDIO_CLK_TDMOUT_x_CTRL should be the inverse of bit 28.
IOW bit28 == !bit29 at all times

This setting is automatically applied on axg and the manual setting was
added on g12a.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-phase.c | 56 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clk-phase.h |  6 ++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index fe22e171121a..a6763439f7d2 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -125,6 +125,62 @@ const struct clk_ops meson_clk_triphase_ops = {
 };
 EXPORT_SYMBOL_GPL(meson_clk_triphase_ops);
 
+/*
+ * This is a special clock for the audio controller.
+ * This drive a bit clock inverter for which the
+ * opposite value of the inverter bit needs to be manually
+ * set into another bit
+ */
+static inline struct meson_sclk_ws_inv_data *
+meson_sclk_ws_inv_data(struct clk_regmap *clk)
+{
+	return (struct meson_sclk_ws_inv_data *)clk->data;
+}
+
+static int meson_sclk_ws_inv_sync(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
+	unsigned int val;
+
+	/* Get phase and sync the inverted value to ws */
+	val = meson_parm_read(clk->map, &tph->ph);
+	meson_parm_write(clk->map, &tph->ws, val ? 0 : 1);
+
+	return 0;
+}
+
+static int meson_sclk_ws_inv_get_phase(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
+	unsigned int val;
+
+	val = meson_parm_read(clk->map, &tph->ph);
+
+	return meson_clk_degrees_from_val(val, tph->ph.width);
+}
+
+static int meson_sclk_ws_inv_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
+	unsigned int val;
+
+	val = meson_clk_degrees_to_val(degrees, tph->ph.width);
+	meson_parm_write(clk->map, &tph->ph, val);
+	meson_parm_write(clk->map, &tph->ws, val ? 0 : 1);
+	return 0;
+}
+
+const struct clk_ops meson_sclk_ws_inv_ops = {
+	.init		= meson_sclk_ws_inv_sync,
+	.get_phase	= meson_sclk_ws_inv_get_phase,
+	.set_phase	= meson_sclk_ws_inv_set_phase,
+};
+EXPORT_SYMBOL_GPL(meson_sclk_ws_inv_ops);
+
+
 MODULE_DESCRIPTION("Amlogic phase driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/clk-phase.h b/drivers/clk/meson/clk-phase.h
index 5579f9ced142..b637b9b227bc 100644
--- a/drivers/clk/meson/clk-phase.h
+++ b/drivers/clk/meson/clk-phase.h
@@ -20,7 +20,13 @@ struct meson_clk_triphase_data {
 	struct parm ph2;
 };
 
+struct meson_sclk_ws_inv_data {
+	struct parm ph;
+	struct parm ws;
+};
+
 extern const struct clk_ops meson_clk_phase_ops;
 extern const struct clk_ops meson_clk_triphase_ops;
+extern const struct clk_ops meson_sclk_ws_inv_ops;
 
 #endif /* __MESON_CLK_PHASE_H */
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
