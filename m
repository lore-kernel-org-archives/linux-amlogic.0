Return-Path: <SRS0=8dHl=YD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C234ECE58E
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F0A21929
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Oct 2019 09:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STeVyCrd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tRWbY5Zo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F0A21929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkTTzO1xhGPmPGD6aaxS+ePgkZRSKvvHrPgR+rBr9zA=; b=STeVyCrdARUhGc
	fh2iu6/OoRcZxYhhh1gckKFBg4JT47drX7pFT7VTGgTmLtdsJEiWYivsHIsuIt2zwapnMvXuHloEn
	VFSM3pavVUbSvPsrbiQCgMzoE6Mrf5V27W5MR4duChOFjJ36GU2VLH2rXHnFTBB4eAxsT8AtRoFww
	zMSnRI18vrQlV0LYUTDQwOG3MZqGqvLKFMmK+UznqUJsgXk1er7cIWYSdBSwyyCr77gpj9fj8ZIt0
	dbUGHXWRRa9PYEfkq+Fpputgn8qhMye2FlMJI0jH05SfxHI4kJ7MFyxcqkx0846NIjvb3ss1HciVa
	mKd9ffLUIgLNLxh1nhng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIUic-00079E-EW; Thu, 10 Oct 2019 09:26:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIUhS-0005zg-HI
 for linux-amlogic@lists.infradead.org; Thu, 10 Oct 2019 09:25:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id y19so6958498wrd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Oct 2019 02:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NpGaBOGMKyAB4Ohuci7O2fHoJMWm7VBJJx757ititKU=;
 b=tRWbY5ZoCA+9rVsCN1XkCwCjVsFOPhvmVoh16VtJVAOYE/sexaVXoLRfYLAyXlonfg
 Z50hDQ9X6tqY6bvc9pze8s7SRg9xFlqxdD5HNYMgvtjOmfG1dLsg2TU429hMRVH00T2+
 4kvdteaNWKl63O1+DToVeaoZlBP1+Lq8+QUgFJQsl/1crFfqH+mhmln/ajwNu53sfbyk
 O1rf/i3Q5AerWgSj2Malofn8SbCdMNHa23ENAKdcR5aluhM7HUfnSeX8wEOZiZzAS3qB
 fq+DMW7xBJPsapQWhiBrF+QL/VYCOOvhDmv6oY6o8Y4j72WFWeCPLJTXVAMOVw9BhWHG
 EFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NpGaBOGMKyAB4Ohuci7O2fHoJMWm7VBJJx757ititKU=;
 b=USrJ8ta9UB/1UvUzNZABilH9WZHl4HtJZzUqdmpMMsD6TxN19aL3aOC8Kq7qtmnBHr
 ck1fPZtPXpOPD9cbA9SKDDPZeNgPP2BNQN8mU9my5iu6eY7HaPF9gV4BdRckuvmJh+RT
 sE2vWB26r1AcWK79CqCSN70sxUGEFy80pCMPEhNKYeAEP0jE63nc8CoM3o0D7y6hk78C
 BouN5h+fBpXw9GgDlY/SwzqS7EITjTh3zWtfwVJR1VQEejxliSi5qBNKG679hKKGLbV4
 4u+LH9WZTArmvIdtrBOrD1G61zfXsTtw0eMJLY5YezeHdrrrQuES8fxE+L++uHVNVBpM
 9nDA==
X-Gm-Message-State: APjAAAWqkrxQIbNzgUEG+7Hjdi1DtjYIRJ7CmbkL82qVCna8ik8ei+pU
 zhrkI2rZuqKivSpYUZg12PXNww==
X-Google-Smtp-Source: APXvYqxaKkhImEXY4h60rg4IFjEADFfbAKFMUuKxjHR+5zY5ZvBAbCp70nq+WoLbJQMSeAcGi+9hlA==
X-Received: by 2002:a5d:4302:: with SMTP id h2mr7975471wrq.35.1570699533163;
 Thu, 10 Oct 2019 02:25:33 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/meson: viu: add AFBC modules routing functions
Date: Thu, 10 Oct 2019 11:25:24 +0200
Message-Id: <20191010092526.10419-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_022534_587395_4FC53451 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A AFBC Decoder pixel input need to be routed diferently
than the Amlogic GXM AFBC decoder, this adds support for routing the
VIU OSD1 pixel source to the AFBC "Mali Unpack" module.

This "Mali Unpack" module is also configured with a static RGBA mapping
for now until we support more pixel formats.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 52 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/meson/meson_viu.h |  4 +++
 2 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 68cf2c2eca5f..cdd4962484db 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/bitfield.h>
 
 #include "meson_drv.h"
 #include "meson_viu.h"
@@ -335,6 +336,57 @@ void meson_viu_osd1_reset(struct meson_drm *priv)
 	meson_viu_load_matrix(priv);
 }
 
+void meson_viu_g12a_enable_osd1_afbc(struct meson_drm *priv)
+{
+	/* Enable Mali AFBC Unpack */
+	writel_bits_relaxed(VIU_OSD1_MALI_UNPACK_EN,
+			    VIU_OSD1_MALI_UNPACK_EN,
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+
+	/* Setup RGBA Reordering */
+	writel_bits_relaxed(VIU_OSD1_MALI_AFBCD_A_REORDER |
+			    VIU_OSD1_MALI_AFBCD_B_REORDER |
+			    VIU_OSD1_MALI_AFBCD_G_REORDER |
+			    VIU_OSD1_MALI_AFBCD_R_REORDER,
+			    FIELD_PREP(VIU_OSD1_MALI_AFBCD_A_REORDER,
+				       VIU_OSD1_MALI_REORDER_A) |
+			    FIELD_PREP(VIU_OSD1_MALI_AFBCD_B_REORDER,
+				       VIU_OSD1_MALI_REORDER_B) |
+			    FIELD_PREP(VIU_OSD1_MALI_AFBCD_G_REORDER,
+				       VIU_OSD1_MALI_REORDER_G) |
+			    FIELD_PREP(VIU_OSD1_MALI_AFBCD_R_REORDER,
+				       VIU_OSD1_MALI_REORDER_R),
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+
+	/* Select AFBCD path for OSD1 */
+	writel_bits_relaxed(OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD,
+			    OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD,
+			    priv->io_base + _REG(OSD_PATH_MISC_CTRL));
+}
+
+void meson_viu_g12a_disable_osd1_afbc(struct meson_drm *priv)
+{
+	/* Disable AFBCD path for OSD1 */
+	writel_bits_relaxed(OSD_PATH_OSD_AXI_SEL_OSD1_AFBCD, 0,
+			    priv->io_base + _REG(OSD_PATH_MISC_CTRL));
+
+	/* Disable AFBCD unpack */
+	writel_bits_relaxed(VIU_OSD1_MALI_UNPACK_EN, 0,
+			    priv->io_base + _REG(VIU_OSD1_MALI_UNPACK_CTRL));
+}
+
+void meson_viu_gxm_enable_osd1_afbc(struct meson_drm *priv)
+{
+	writel_bits_relaxed(MALI_AFBC_MISC, FIELD_PREP(MALI_AFBC_MISC, 0x90),
+			    priv->io_base + _REG(VIU_MISC_CTRL1));
+}
+
+void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
+{
+	writel_bits_relaxed(MALI_AFBC_MISC, FIELD_PREP(MALI_AFBC_MISC, 0x00),
+			    priv->io_base + _REG(VIU_MISC_CTRL1));
+}
+
 static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
 {
 	uint32_t val = (((length & 0x80) % 24) / 12);
diff --git a/drivers/gpu/drm/meson/meson_viu.h b/drivers/gpu/drm/meson/meson_viu.h
index e297772d967f..e4a2f24d7c38 100644
--- a/drivers/gpu/drm/meson/meson_viu.h
+++ b/drivers/gpu/drm/meson/meson_viu.h
@@ -63,6 +63,10 @@
 #define OSD_PENDING_STAT_CLEAN	BIT(1)
 
 void meson_viu_osd1_reset(struct meson_drm *priv);
+void meson_viu_g12a_enable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_g12a_disable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_gxm_enable_osd1_afbc(struct meson_drm *priv);
+void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv);
 void meson_viu_init(struct meson_drm *priv);
 
 #endif /* __MESON_VIU_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
