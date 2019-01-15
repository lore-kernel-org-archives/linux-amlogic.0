Return-Path: <SRS0=K5c1=PX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BC7C43444
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5329120657
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Jan 2019 12:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofgtdzaY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pNLYa2k8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5329120657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHLKzJuMkQR833+gxJC5GacQ43OQPnKMzi0qgqpV1S0=; b=ofgtdzaYVUiQP1
	kZn0FIAKrqherKukHfgnvSQ8G6s+p+gFVMRbieJgv+fQZ8k74kMMiJw8xVvbECmGLtq5iXh8mUbp7
	qp99Ben2zuecnMDsF9MM+wB/hhHEXRTDuW/aoBiHSyvVW8f7eZgl4TP5RYLgflY0Ggkpwdifpcwla
	e2khFtqSTlgG/mRH0tZrQQXp2xh97sHyo0G26DTTg2kYb45DR5Tde0XtWfmm33c6C594EFvxv9Fyr
	6MFv4yjRIVqQkwl/fSLDpI17Zyw6SeoxXeHjsNC/jC8wt+WvF8HCmtmemavRI+f+bhfBXzgfAybjf
	4ClwyQMIDIMQoN16fDvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjNuK-0006i5-As; Tue, 15 Jan 2019 12:33:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjNuG-0006f7-FM
 for linux-amlogic@lists.infradead.org; Tue, 15 Jan 2019 12:33:25 +0000
Received: by mail-wr1-x441.google.com with SMTP id p4so2751396wrt.7
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Jan 2019 04:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZoSJXtrtyktFuA6EDyaYkMwS7WZFT2t11rt0gb5clag=;
 b=pNLYa2k8DzaJ5bRo4yOsTJ+BpalhSUM0Z1/CQwVkR+BvknyK2/I5Hczdw02rfzmJU9
 Wk8X7PJFzc5POBSHyYbNZLBgmTzIshTwognX4AgIlD6bKON9QMZiTeEy3O/WxVb/x9we
 abx2936dNB/tfYeKU0C6F7UJzMsmS+N5u8I4rczT6A3ZjM2sReA+9LmGrjcVz5LDBhSY
 AIgkTSGXEMLJp7+yns7Knau8b38v4x/lrvZBT/FtkDm6FXiiTeACqygljG8e24FdadZX
 TJ3h/l1Dj5QV2A3EppaCtWsipWWJM1EMNTQtTTXBfIEskkV9Jgw5QaVqvKpv2+GEmWSF
 Sfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZoSJXtrtyktFuA6EDyaYkMwS7WZFT2t11rt0gb5clag=;
 b=mvj5A7f61fqCnJyS5sR2XF3MagoOhFjjqOrY51DZ/izkpV5gWZNi+hzCYt12Fb/64e
 1xsNuvKHXQfoWO+yqUlq3rir+lkm6mG3U6wGBoDLrBBZ1SyrWU2LDsiQbZ0o3d8nPSha
 4Ls5+PEl9rESRfor3VrRhJ+IoqLmP71nwJ5jE1nyeadO53LZbeNv4MIEjoZL+2dXXWvO
 TDPdeWT5yu9uF5yCSVRXuijm7ejG20BWWIyU3JBRJNOMqr8e6wGgbMfp7hdo5sBsMeeC
 9ytgPKxV//y4MWYRMsIr0IrCXPh/qmJHf0pSeMtx45vl8PQZhdwUYes9Owhp5MxdOU2f
 Ag8A==
X-Gm-Message-State: AJcUukd1nPlcvSFAmoJQ5lTziaDFJGiPlJZrJ0YxOV+yvUyGFcN+QGUd
 g81VZdnLV0WiS3AhY1g6Gwbpfw==
X-Google-Smtp-Source: ALg8bN4i58w4bkRUz3m3QOvTSyG+ZrKKVWiERMufXp0oy/32IQn5WJ/MmaVQihAG0Y3ZHnTEqBEjZw==
X-Received: by 2002:adf:8484:: with SMTP id 4mr2943238wrg.249.1547555602625;
 Tue, 15 Jan 2019 04:33:22 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x15sm75658842wrs.27.2019.01.15.04.33.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 15 Jan 2019 04:33:21 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH 2/8] drm/meson: add HDMI div40 TMDS mode
Date: Tue, 15 Jan 2019 13:33:09 +0100
Message-Id: <20190115123315.11069-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115123315.11069-1-narmstrong@baylibre.com>
References: <20190115123315.11069-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_043324_509172_C8E6B9AC 
X-CRM114-Status: GOOD (  13.22  )
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for TMDS Clock > 3.4GHz for HDMI2.0 display modes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 807111ebfdd9..3d8decb77019 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -365,7 +365,8 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	unsigned int wr_clk =
 		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
 
-	DRM_DEBUG_DRIVER("%d:\"%s\"\n", mode->base.id, mode->name);
+	DRM_DEBUG_DRIVER("%d:\"%s\" div%d\n", mode->base.id, mode->name,
+			 mode->clock > 340000 ? 40 : 10);
 
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
@@ -385,9 +386,17 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	/* Enable normal output to PHY */
 	dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_BIST_CNTL, BIT(12));
 
-	/* TMDS pattern setup (TOFIX pattern for 4k2k scrambling) */
-	dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01, 0x001f001f);
-	dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23, 0x001f001f);
+	/* TMDS pattern setup (TOFIX Handle the YUV420 case) */
+	if (mode->clock > 340000) {
+		dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01, 0);
+		dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
+				  0x03ff03ff);
+	} else {
+		dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_01,
+				  0x001f001f);
+		dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_23,
+				  0x001f001f);
+	}
 
 	/* Load TMDS pattern */
 	dw_hdmi_top_write(dw_hdmi, HDMITX_TOP_TMDS_CLK_PTTN_CNTL, 0x1);
@@ -413,6 +422,8 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	/* Disable clock, fifo, fifo_wr */
 	regmap_update_bits(priv->hhi, HHI_HDMI_PHY_CNTL1, 0xf, 0);
 
+	dw_hdmi_set_high_tmds_clock_ratio(hdmi);
+
 	msleep(100);
 
 	/* Reset PHY 3 times in a row */
@@ -562,6 +573,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 		mode->vdisplay, mode->vsync_start,
 		mode->vsync_end, mode->vtotal, mode->type, mode->flags);
 
+	/* If sink max TMDS clock, we reject the mode */
+	if (mode->clock > connector->display_info.max_tmds_clock)
+		return MODE_BAD;
+
 	/* Check against non-VIC supported modes */
 	if (!vic) {
 		status = meson_venc_hdmi_supported_mode(mode);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
