Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCAFC3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA45222CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 08:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ya/Ar2my";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dh96VTcd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA45222CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TH9XBIkqH2QJH60p8pgXBzW/5FSUziUVFHeCOXndjus=; b=Ya/Ar2myb9p/hx
	WA+KX9oiHXFRtV6V9qFU5eeTno24C0rFxJoVIX9Jrd5RyjLVyEuQqCATqt56uypeC/1BWxDbRIMsP
	aK8SSFeWsRnBAMEVtemickuUIGp8icE8VVK8WdZHURb2ub6O5mSMGKOlM5WEd4U5BCzwjSDfi5bsn
	9es1/E0RNlAYUTmL6Uj7wG+R0txe3EV9f9CQbjotBnIv4SD0s7xH99SpGW63j4ZnEZyl2uVYkpAIf
	gfsLZAdbjWh6bLJ0HZWNj6G6Ii5iIyXWBcJ8vHtJg87E8oM7WS5aaUTDVh5yjDSWvbDDloyXwvO4/
	ZmOH92q4uvFAcdHC2Zyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzzht-00059a-TY; Tue, 20 Aug 2019 08:41:34 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzzhe-0004pJ-Ok
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 08:41:20 +0000
Received: by mail-wr1-x442.google.com with SMTP id r3so11486676wrt.3
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 01:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/P7EPY/5dFnAu48qok6WuTbpIx9NhM57Lx/BDC712I=;
 b=Dh96VTcdKSYsPtHoUVhk6WnhZCKFnnDXqYAmwZcjUGC7ZNgCjOEf2Nw6MfwCRFKwP7
 eyvQ1yz5Zo+b0UQ7cK3D0IK4GkzB2LcfCQAePhADH80JV2GfPBqHV3B+gosFO/mAZHlp
 n0S/fS5KDLYrxB3iqYsm9BIKpoUOYeOkIvetgOsmBqRPGIKiaFewZ1/2jiHQH16tX6Vr
 QodWkgcNycOgk5PpYLSJ9evdkceGKQ16vZi8PUrbGjvLORS/Zv4ONO6QOpsXEmqPiKBM
 mu+VcXUnTQkKGhOtVXwZUfy+msoASCTetYn4dFpELiaHzaa8ZtQ5VHFUgwP5bDbmfDw8
 nleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v/P7EPY/5dFnAu48qok6WuTbpIx9NhM57Lx/BDC712I=;
 b=dMYdJWMc0VG94IqASnTP1mK4tftkESk0FSsXhFamOPDld4yy6q4NoB1uch0c8a6TR1
 Qvory1hAGAd3pl2RLR6yUBDtOyg/c7csSKznA09i5hC/UBGDB4MC726WiU8GKTgzVpyC
 1lrMkuamaUfb48ZiqBSnCHnDGJhZXA/dKBEF9nLN0tAysX3PETPw+S1fYKL6LjPxhWBb
 +PQ57FLSagawAH9YSkb66K5b//rOitNqG/U+hiZ+wjT0j/EX0HDSQLuipnGoZ8ZFTxW4
 +u/vHHUq1oApTWqsk9lDHGbsGdaSAukNXkKTNh6ptnYLZoWCdMH3YtMWC0uQRLEBCsII
 YHQQ==
X-Gm-Message-State: APjAAAVJH7yG8qM9fUZO3h0UsbIMVvpe6KBRNsz2eS7j+CckBss+SWbA
 gVEmQUGYSMYj6mvHQo8p9PN9yQ==
X-Google-Smtp-Source: APXvYqyMi9fjn35RKMqKCT0Cl9gAsZF/NvpZhgd2Tspcloatig8wnB73W94dlxJXp3kNJjco7rN/Gw==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr25270321wrr.55.1566290477062; 
 Tue, 20 Aug 2019 01:41:17 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:16 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 04/11] drm/bridge: synopsys: dw-hdmi: add basic
 bridge_atomic_check
Date: Tue, 20 Aug 2019 10:41:02 +0200
Message-Id: <20190820084109.24616-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_014118_810418_D1ABB7C2 
X-CRM114-Status: UNSURE (   9.95  )
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

Add all the supported input and output formats to the bridge
input_bus_caps and output_bus_caps, and add a very simple atomic check
implementation to negociate output and input bus formats.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 53 +++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b4901b174a90..121c2167ee20 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -91,6 +91,24 @@ static const u16 csc_coeff_rgb_in_eitu709[3][4] = {
 	{ 0x6756, 0x78ab, 0x2000, 0x0200 }
 };
 
+static const u32 dw_hdmi_bus_fmts[] = {
+	MEDIA_BUS_FMT_RGB888_1X24,
+	MEDIA_BUS_FMT_RGB101010_1X30,
+	MEDIA_BUS_FMT_RGB121212_1X36,
+	MEDIA_BUS_FMT_RGB161616_1X48,
+	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_YUV10_1X30,
+	MEDIA_BUS_FMT_YUV12_1X36,
+	MEDIA_BUS_FMT_YUV16_1X48,
+	MEDIA_BUS_FMT_UYVY8_1X16,
+	MEDIA_BUS_FMT_UYVY10_1X20,
+	MEDIA_BUS_FMT_UYVY12_1X24,
+	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
+	MEDIA_BUS_FMT_UYYVYY10_0_5X30,
+	MEDIA_BUS_FMT_UYYVYY12_0_5X36,
+	MEDIA_BUS_FMT_UYYVYY16_0_5X48,
+};
+
 struct hdmi_vmode {
 	bool mdataenablepolarity;
 
@@ -2190,6 +2208,33 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 	.get_modes = dw_hdmi_connector_get_modes,
 };
 
+static int dw_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+	int ret;
+
+	ret = drm_atomic_bridge_choose_output_bus_cfg(bridge_state, crtc_state,
+						      conn_state);
+	if (ret)
+		return ret;
+
+	dev_dbg(hdmi->dev, "selected output format %x\n",
+			bridge_state->output_bus_cfg.fmt);
+
+	ret = drm_atomic_bridge_choose_input_bus_cfg(bridge_state, crtc_state,
+						      conn_state);
+	if (ret)
+		return ret;
+
+	dev_dbg(hdmi->dev, "selected input format %x\n",
+			bridge_state->input_bus_cfg.fmt);
+
+	return 0;
+}
+
 static int dw_hdmi_bridge_attach(struct drm_bridge *bridge)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
@@ -2267,6 +2312,7 @@ static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
 
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.attach = dw_hdmi_bridge_attach,
+	.atomic_check = dw_hdmi_bridge_atomic_check,
 	.enable = dw_hdmi_bridge_enable,
 	.disable = dw_hdmi_bridge_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
@@ -2733,6 +2779,13 @@ __dw_hdmi_probe(struct platform_device *pdev,
 
 	hdmi->bridge.driver_private = hdmi;
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
+	hdmi->bridge.input_bus_caps.supported_fmts = dw_hdmi_bus_fmts;
+	hdmi->bridge.input_bus_caps.num_supported_fmts =
+					ARRAY_SIZE(dw_hdmi_bus_fmts);
+	hdmi->bridge.output_bus_caps.supported_fmts = dw_hdmi_bus_fmts;
+	hdmi->bridge.output_bus_caps.num_supported_fmts =
+					ARRAY_SIZE(dw_hdmi_bus_fmts);
+
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
