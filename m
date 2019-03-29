Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B885C4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFB921773
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="adjexrOb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oi+vNi0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFB921773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMxTY2CuuBQ6Zy2xwo3bAjprXdnVyi/9InJx9FKw0P8=; b=adjexrOb41ksgd
	SlrWvc+ZyK+cS2jmOxD35kL800pONOuUbEiYI5092aIvDSa75kNn+SUl2giGJuxLYU/qtxyPrEBRq
	2oaqNCy5kAhmI4zp/8//i1AY7ol0UO4ns7oD1m64fHA0ajnH+ZrRcMriaHOUDlzOvUXA8P21gnn8n
	Zm1Le2XWIFfAeDNeDPBQyra81i+vLY/KHR1bhetkr7LDOGI5MCIPYLxRWOOx4rMIySketrquCUqGl
	uILJVy/S5R8mt2zBQKCqcXjra1dpRSV9UoFM/nVkLxMoIIO7v4fWl94LY69+lebRvWmvqoCPYxKl+
	5oaM+d5Udd7rtmbuLZFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9oyP-0004Aa-0B; Fri, 29 Mar 2019 10:42:57 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9oyF-0003vu-0m
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 10:42:51 +0000
Received: by mail-wm1-x343.google.com with SMTP id a184so2004745wma.2
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVVZM+F4bg9NburQNjeHoxpSPD/FS5oVjjumPmHKkFw=;
 b=oi+vNi0JHgy+MUNw6O7ROBazXPwy92e57mnf/YfCFF1H3aecRoAJ0zdwFUoyOTrHfH
 irzEzzn2o3el3fmhiIQia6H55YbYPuAb26HpSUMRhqZcTKZscMov+PUgOFr9R6q7CRto
 MgGeBX9xvXOfUo8ToK3rEneAEXXo9E+TarBNhFcOAwn7MPIKTiMpId7usnrA6UF5YUoS
 S8UzVGCuqjKz+5GJuUTU5ypsVCDMip/pIxgnC45QVBz4jZk8HTDZSmyzbuYq5h6icxgP
 cJrdSw7WHu7NUYToKggnKZjUqj2Ts0vbvsBAhg6H3hVUGNlb67RFYeiG/sngW19xDI69
 Sajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVVZM+F4bg9NburQNjeHoxpSPD/FS5oVjjumPmHKkFw=;
 b=XdaH4CoZV4wpGCtoFvj/PNS5FWIBmxcX+yUrqUtFF3eHEx1eiXHkVQJg1FpmQSNhg3
 Vx6VTldoyyjvBBsXtfZjiHWYK0T5RkEjrqZJHSHRXU3NOOW5IHhTDIo/N437nUDk9zOE
 dMLCZfMecSOWZEgeLPplm2ZEhlLdfh0+qXQFl7yPQ6ey8adkk7nNBb2cCV6qwKooxtNS
 Q5RJz3Kqn3w5amjZluHmcw6bQFmoVTcmiwtg2SqXQrICQqeW706keQu040HKdv8F/VgQ
 fdKFJKaIOlqNJDPGYI7Y04ixpe4BE28hpXNxlOtriWzdam19HYShah3NPC/o+0ZWpbXX
 RK9Q==
X-Gm-Message-State: APjAAAV8ORY3AEn6WiFAGI25BQnZE+XsRBc8lko9OdlQjnOdwvw6zmtV
 dmoEdItumgYBTw3QoI5IzXa9eg==
X-Google-Smtp-Source: APXvYqwOpYWG7/gxs6bSfdwHPwUiRszaTTdlpJxrzPKo79MbNEMLNsDIrRkg2I781r4ymOVU+vKVmQ==
X-Received: by 2002:a1c:f204:: with SMTP id s4mr3198480wmc.51.1553856165258;
 Fri, 29 Mar 2019 03:42:45 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o15sm1632826wrj.59.2019.03.29.03.42.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 29 Mar 2019 03:42:44 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH RFC 2/5] drm/bridge: add encoder support to specify bridge
 input format
Date: Fri, 29 Mar 2019 11:42:37 +0100
Message-Id: <20190329104240.29585-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190329104240.29585-1-narmstrong@baylibre.com>
References: <20190329104240.29585-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_034247_224815_D02FDD8D 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds a new format_set() callback to the bridge ops permitting
the encoder to specify the new input format and encoding.

This allows supporting the very specific HDMI2.0 YUV420 output mode
when the bridge cannot convert from RGB or YUV444 to YUV420.

In this case, the encode must downsample before the bridge and must
specify the bridge the new input bus format differs.

This will also help supporting the YUV420 mode where the bridge cannot
downsample, and also support 10bit, 12bit and 16bit output modes
when the bridge cannot convert between different bit depths.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/drm_bridge.c | 35 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 19 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 138b2711d389..b2ce2d3d070e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -307,6 +307,41 @@ void drm_bridge_mode_set(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL(drm_bridge_mode_set);
 
+/**
+ * drm_bridge_format_set - setup with proposed input format and encoding for
+ *			   all bridges in the encoder chain
+ * @bridge: bridge control structure
+ * @input_bus_format: proposed input bus format for the bridge
+ * @input_encoding: proposed input encoding for this bridge
+ *
+ * Calls &drm_bridge_funcs.format_set op for all the bridges in the
+ * encoder chain, starting from the first bridge to the last.
+ *
+ * Note: the bridge passed should be the one closest to the encoder
+ *
+ * RETURNS:
+ * true on success, false if one of the bridge cannot handle the format
+ */
+bool drm_bridge_format_set(struct drm_bridge *bridge,
+			   const u32 input_bus_format,
+			   const u32 input_encoding)
+{
+	bool ret = true;
+
+	if (!bridge)
+		return true;
+
+	if (bridge->funcs->format_set)
+		ret = bridge->funcs->format_set(bridge, input_bus_format,
+						input_encoding);
+	if (ret)
+		return ret;
+
+	return drm_bridge_format_set(bridge->next, input_bus_format,
+				     input_encoding);
+}
+EXPORT_SYMBOL(drm_bridge_format_set);
+
 /**
  * drm_bridge_pre_enable - prepares for enabling all
  *			   bridges in the encoder chain
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 9da8c93f7976..223253b15763 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -198,6 +198,22 @@ struct drm_bridge_funcs {
 	void (*mode_set)(struct drm_bridge *bridge,
 			 const struct drm_display_mode *mode,
 			 const struct drm_display_mode *adjusted_mode);
+
+	/**
+	 * @format_set:
+	 *
+	 * This callback should configure the bridge for the given input bus
+	 * format and encoding. It is called after the @format_set callback
+	 * for the preceding element in the display pipeline has been called
+	 * already. If the bridge is the first element then this would be
+	 * &drm_encoder_helper_funcs.format_set. The display pipe (i.e.
+	 * clocks and timing signals) is off when this function is called.
+	 *
+	 * @returns: true in success, false is a bridge refuses the format
+	 */
+	bool (*format_set)(struct drm_bridge *bridge,
+			   const u32 input_bus_format,
+			   const u32 input_encoding);
 	/**
 	 * @pre_enable:
 	 *
@@ -312,6 +328,9 @@ void drm_bridge_post_disable(struct drm_bridge *bridge);
 void drm_bridge_mode_set(struct drm_bridge *bridge,
 			 const struct drm_display_mode *mode,
 			 const struct drm_display_mode *adjusted_mode);
+bool drm_bridge_format_set(struct drm_bridge *bridge,
+			   const u32 input_bus_format,
+			   const u32 input_encoding);
 void drm_bridge_pre_enable(struct drm_bridge *bridge);
 void drm_bridge_enable(struct drm_bridge *bridge);
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
