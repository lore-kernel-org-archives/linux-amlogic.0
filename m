Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DBDC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 09:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD2321019
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 09:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHo7lzPW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fcid22Cr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD2321019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HD5bvHv1k031tZmX9Hmh9Yc5GjOFkdlQtPEPX5HaQg8=; b=UHo7lzPWQbwRWM
	nldfjRyFvoW3JqHnITJ+m3hABjre6MjPR/G2xEVT2LnNkWqx7LsgtaA3dz4IzzgHIV2ZReiex8VkV
	t8iouSK5zDtWgaxbmt56SfoFqz6Yc7DfwIKRzhjWf2sqJ0rYjhfJH/jjngZlLF0mqorN8lUYAPOe0
	x/avOfxdD3EqRQsghNw0/wu5WgJEVrtNii+bcj2L4Pizh0o1ZDx4D1u4eKhffKSbxnErTNwLuKQNZ
	A4yGp2lUFd00H8YuecXgrL/CBmZ5Wn6n4LlF5/zDsQ9Yr0OybwvzBqKDnTPn70SxKNSu5lNSFIeSh
	zLB1XcGUrc5/JQwBKAeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4jXh-0005kQ-ET; Fri, 15 Mar 2019 09:54:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4jXe-0005jO-2N
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 09:54:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id y15so5459402wma.0
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nMNxuBFkfxH/Pp2e0D/vuUTdP7DiCTna/TvHjdOEJW8=;
 b=Fcid22Crd69kN12+21PzsGaZiUWPHL/S7LQ+Q7zdeJQedXWw0GXjWDnDQodjY/epoY
 62EN2SZ2ZClyJ6PUCbOG3Onx2T18oolqENLp5T3DbXnxRW5G0SzBy6f1pyA1380ksDwm
 x6+imSAGVCUpATIpi68qxfiX4tYMHwou6gJgHO+eYGYvWpX6O1NhixeprfsJsB+CFMiV
 EKfsBAGjQ8FyR1KtZ6AuqbHAmU3BfA6fdvG5RppdvpCYrq6vFO/RhEDoDR57xzvo0PDS
 N3AqFxS+N7WAhCh0iMqsIogIkfbmiTT+hIf+hx436I1GwMq+Jgo+6kKhW4CbDswdHDCl
 3Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nMNxuBFkfxH/Pp2e0D/vuUTdP7DiCTna/TvHjdOEJW8=;
 b=OWCqY/rpjmPCDBLLykte2/ogaOVvoyQeqoBZzgxLUtoyRiYg4GKDLfyP1ue9Ikn5hY
 kdnJyvCgS23o9wIqwb7ZdQInbUoQ9uKcpnhUudkuDXN1HOGdwtq2KYWk04MH/ctobOzY
 hD3PSBREgNu2Om4A/6HAOMhUUqpVfbw1ejeYda9fBy2tc0ZoD3ydywVFgWCGbi1ZHWFz
 j1pwUdphcH0ECAgiweOZzuHe5LXrFQgQw461SPRbuPykawntDM32oL2YfLQ7tOCD0w+U
 WqoIzuNuAgRdXl0jXWQAXDRHjnR6AEBleesHKrgZNEBFpRbjVnUFrspF+8ix6lWhWX0J
 8dvA==
X-Gm-Message-State: APjAAAW68qRmTMQF9QmNIWkO3t3LpziQtuGP74XDxXFb0NnpawfnmbW4
 sCsLNOWwQKt418jWhwxriGHyBA==
X-Google-Smtp-Source: APXvYqzpk9rciGy4Ra3i/qZ/fk86Vn9cwD5fHgaNEEQyBoEC3t7vAj+buGrW4QGk/PwPpTxt4tEbEA==
X-Received: by 2002:a1c:eb1a:: with SMTP id j26mr1399768wmh.43.1552643656162; 
 Fri, 15 Mar 2019 02:54:16 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c202sm1683958wme.38.2019.03.15.02.54.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 15 Mar 2019 02:54:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, heiko@sntech.de,
 robh@kernel.org
Subject: [PATCH] drm/bridge: dw-hdmi: disable SCDC configuration for invalid
 setups
Date: Fri, 15 Mar 2019 10:54:14 +0100
Message-Id: <20190315095414.28520-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_025418_114344_93EAAA9D 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: jernej.skrabec@siol.net, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch is an attempt to limit HDMI 2.0 SCDC setup when :
- the SoC embeds an HDMI 1.4 only controller
- the EDID supports SCDC but not scrambling
- the EDID supports SCDC scrambling but not for low TMDS bit rates,
  while only supporting low TMDS bit rates

This to avoid communicating with the SCDC DDC slave uncessary, and
setting the DW-HDMI TMDS Scrambler setup when not supported by the
underlying hardware.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: 264fce6cc2c1 ("drm/bridge: dw-hdmi: Add SCDC and TMDS Scrambling support")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---

Rob,

this patch should also solve your issue with your 11' display, could you
test it ?
If this works, I will focus on the underlying issue where the RK3399 SoC
freezes in your setup.

Thanks,
Neil

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 34 ++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a63e5f0dae56..db761329a1e3 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1037,6 +1037,31 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_phy_i2c_write);
 
+/* Filter out invalid setups to avoid configuring SCDC and scrambling */
+static bool dw_hdmi_support_scdc(struct dw_hdmi *hdmi)
+{
+	struct drm_display_info *display = &hdmi->connector.display_info;
+
+	/* Completely disable SCDC support for older controllers */
+	if (hdmi->version < 0x200a)
+		return false;
+
+	/* Disable if SCDC is not supported, or if an HF-VSDB block is absent */
+	if (!display->hdmi.scdc.supported ||
+	    !display->hdmi.scdc.scrambling.supported)
+		return false;
+
+	/*
+	 * Disable if display only support low TMDS rates and scrambling
+	 * for low rates is not supported either
+	 */
+	if (!display->hdmi.scdc.scrambling.low_rates &&
+	    display->max_tmds_clock <= 340000)
+		return false;
+
+	return true;
+}
+
 /*
  * HDMI2.0 Specifies the following procedure for High TMDS Bit Rates:
  * - The Source shall suspend transmission of the TMDS clock and data
@@ -1055,7 +1080,7 @@ void dw_hdmi_set_high_tmds_clock_ratio(struct dw_hdmi *hdmi)
 	unsigned long mtmdsclock = hdmi->hdmi_data.video_mode.mtmdsclock;
 
 	/* Control for TMDS Bit Period/TMDS Clock-Period Ratio */
-	if (hdmi->connector.display_info.hdmi.scdc.supported) {
+	if (dw_hdmi_support_scdc(hdmi)) {
 		if (mtmdsclock > HDMI14_MAX_TMDSCLK)
 			drm_scdc_set_high_tmds_clock_ratio(hdmi->ddc, 1);
 		else
@@ -1579,8 +1604,9 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 
 	/* Set up HDMI_FC_INVIDCONF */
 	inv_val = (hdmi->hdmi_data.hdcp_enable ||
-		   vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
-		   hdmi_info->scdc.scrambling.low_rates ?
+		   (dw_hdmi_support_scdc(hdmi) &&
+		    (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
+		     hdmi_info->scdc.scrambling.low_rates)) ?
 		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_ACTIVE :
 		HDMI_FC_INVIDCONF_HDCP_KEEPOUT_INACTIVE);
 
@@ -1646,7 +1672,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 	}
 
 	/* Scrambling Control */
-	if (hdmi_info->scdc.supported) {
+	if (dw_hdmi_support_scdc(hdmi)) {
 		if (vmode->mtmdsclock > HDMI14_MAX_TMDSCLK ||
 		    hdmi_info->scdc.scrambling.low_rates) {
 			/*
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
