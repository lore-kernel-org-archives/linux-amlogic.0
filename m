Return-Path: <SRS0=EwLr=QI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A52C282DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52471218AC
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Feb 2019 12:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HHmsqHo8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mpu3V7TG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52471218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Msj5nA+Y+ekN1vH6tDVz5WbMfAjZdDvv/RrhHSBPoRA=; b=HHmsqHo8i/MIL+ZxrneW2RUKR6
	KnznP/TNOeZSZE9dWu0fJNckaIIljM5pZDsmQc8h+wK378490EjhMNrOpi4LibbK1YVfDbKXzJpkS
	SZVY14GZ+oj5WLgt630JvXCjMTG208IF50VYqk7PkQwZPyrN3j2iPvKlnf9CtarlkNaJrSogSH1Ze
	8CyzvnA65N7Bmk4FTtjzrLA2eQhPdnn85ty1fxh7EiXbFIyT7nOBt6mnmCj21PuF7PPG46fEdPi8R
	hadrCr1ER/F5JBlpWvY+Wvp76gJBTbaj7AImsIRbjCgmUpdlXVLnCjawF+CDLGfNVp1eoBIvLgwGa
	JX+ICV5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpXc6-0007Y8-53; Fri, 01 Feb 2019 12:08:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpXc0-0007TZ-7z
 for linux-amlogic@lists.infradead.org; Fri, 01 Feb 2019 12:08:04 +0000
Received: by mail-wm1-x341.google.com with SMTP id t200so6016390wmt.0
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Feb 2019 04:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6aa/GzlhP8ObDc4Qw7/JY3Cu5N8hkn77bsJ9zMHN4fU=;
 b=Mpu3V7TGaftA27EPpE0+ewC8WyoXuDFn/33ELQ2gB3NBMXE5jf9GuMH/bZIcMrnY6g
 8QLGZ/1MmOOGtXlsrLP5UpFg1wJBZbiUKrU40JS+QsPjK7s3xaSXrwld29tkHm14LX38
 n1HheEcauEyA05zCEV8DwsYfTrvSvqa0WwQwkcrewN9DUzD1XeF+kQFxenAkLp1lKpnQ
 iv7BRc72tMgGJ7nBwlPXed/qbMmfrOaBJysiEPG+4HjhAyJxjAMQTEqFGQuLzmk125LC
 VvZYsOzwTOHZ5qiIexWblc6JnYDpNi+siMjlKpn9nKODlHvOpno3mQI68IpnziyeTlA8
 f04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6aa/GzlhP8ObDc4Qw7/JY3Cu5N8hkn77bsJ9zMHN4fU=;
 b=OdVp2o4LyqonwNAjttRNoFMsmPRlDAQ+qIybhyhWuAon96i9GPiQdpfksjWuYiNdo+
 Ldbi++ds4riFXP2D6oUeIspkTy+xvC7hSiFgU6Xp1HqnxFqqPQE0bGlnxHoQqBC4P5wF
 gh0ieVX4uuNcRqcCQBgGGIdBi2vTCdRWuBvl5dY26Wk4OFqOZcBAFTMph5Ej5/9Z97K0
 h8GG0RNTLbQAGYVFYxzjH+pKmoMhDnvLw9yTUKg5i9RBtm3gX++obemYSdaKSZBKI+a5
 TV8Qqnutc8q2hz0M5erE623XfrZHMRFX9pAUCtQxaiYd97t+4LpY57sGFWss53+N+P4A
 DWGg==
X-Gm-Message-State: AHQUAub5wwalM+EWm+7mBr8MaKOpQNh5p6qdvBx8qY2UOG5dXnR/EB3J
 ppxY+oLf9BYXJAzLduAkNGlkEuPWIp8=
X-Google-Smtp-Source: AHgI3IbfRmqImr8JQ8pHCn8Xy7Vpo/mkQqVrp7SgDWw7dlc/Y7z857uEhNxS5lfmeAQuQB8jSwD0Iw==
X-Received: by 2002:a1c:c303:: with SMTP id t3mr2026891wmf.94.1549022878008;
 Fri, 01 Feb 2019 04:07:58 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.gmail.com with ESMTPSA id m13sm2577103wmd.6.2019.02.01.04.07.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Feb 2019 04:07:57 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 p.zabel@pengutronix.de, Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 maxime.ripard@bootlin.com
Subject: [PATCH v2 2/8] drm/meson: add HDMI div40 TMDS mode
Date: Fri,  1 Feb 2019 12:07:47 +0000
Message-Id: <1549022873-40549-3-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
References: <1549022873-40549-1-git-send-email-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_040800_281750_99E4B524 
X-CRM114-Status: GOOD (  13.21  )
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
MIME-Version: 1.0
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
index 83585b3..e28814f 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -365,7 +365,8 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
 	unsigned int wr_clk =
 		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
 
-	DRM_DEBUG_DRIVER("\"%s\"\n", mode->name);
+	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
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
@@ -557,6 +568,10 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
 
 	DRM_DEBUG_DRIVER("Modeline " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 
+	/* If sink max TMDS clock, we reject the mode */
+	if (mode->clock > connector->display_info.max_tmds_clock)
+		return MODE_BAD;
+
 	/* Check against non-VIC supported modes */
 	if (!vic) {
 		status = meson_venc_hdmi_supported_mode(mode);
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
