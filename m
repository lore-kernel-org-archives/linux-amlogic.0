Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0ABC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3772961372
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3772961372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmN9DlbiAMHisFN/XWLuGEvxnCTVUI4LkjKhdqCAP9A=; b=uH6eakha86XKHr
	0GteqW1VFRTL4xDzRO3IIHpF0rM5uruMX8vYu0oDQz/1agJPIHxsypX6hN7bJHlJiZG9wc6IzCNZL
	TWg9OCMDgfShnmzpKh0DNMGzsw/g6HTr7PC+gqUP2XQqoAlsq57OUiMIt8b/UZk/iHGn5WRPgWyRm
	hpflnTJzvPLwTnftXbSyWJdOVy4qwYgLiT1E21Kl1keB2EFEiXYnDjHP81kfRkXRRNLVO/+5ZJIIu
	0mwOwouhPY0kkfyI+r7OKIjkZPUHZup+lrHVJcG08BQYITEL1S4XE1H3naNR84tVjnlZg/TdIBdH2
	/NVmnyZ7nzqbHwTOE7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAtN-004V3b-ND; Wed, 20 Oct 2021 12:40:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAsq-004UnG-R6
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 12:39:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 d198-20020a1c1dcf000000b00322f53b9b89so9943395wmd.0
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uNc+IrE+4SO33Ds9wqRQl0pqGwosqKnED8f9gFIZ4qQ=;
 b=sbcmiTisBHNPWCJCNj0ZEFL6T6yazKdDkenqxBK+vGcmvMPGyKGuEDdRczr5hN49G8
 iTuJGRGgV4mNoOOi9jvAhQ8muFgKizP3rPwNBDanoSJdLWjNybTypdX8ZvHTwi2QZWND
 hWDU88N5I1VvHg52AWu0k1q4RT+AsTnyKLY2s+IIVt0F8H338KChTYxU9eWHqH2ggL5f
 xtYpNiGUccgoVVFcAgPktyYBIarMDEVLshmCVXI/eQbWpviuGsJSc+aRf5PSnyiXmF5l
 LQ/WGg9nZkhXqqAlNbOqNSxPDP4UVtALg21uGLl7mK3/O4wfT9AKTX3aG2yR3WU3TGn9
 R0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uNc+IrE+4SO33Ds9wqRQl0pqGwosqKnED8f9gFIZ4qQ=;
 b=5zpKrmOVdBmJbRv1qTIufS+4gO8QfBCaNe2xln7ORAYQhNYDtSPMIQhpG++o2AB7YR
 tfjskd+x5vrWP82rvdtLBw/X3Izg8KFRhXRJk3WRES3ENZ7E+S+KcrPOnaSFwQGcoMvM
 EIKEEonCt/nvi77fbnlbH3ltA0V2cPzj2NiQOOdidoQVcXjFuivK3sQQ2MBMQF6mx1Gh
 KC60Or1mZUOcA2bg8kQt4Uzkc8AtY4FutbpDDIVn42HvkdFfROn0PH3tWypMwW0BI62e
 zGEsfeZYC9oHA3KrF+cixrgSjWklnQ33AE2LIKly7xGV8G4otZL8y4gzJX/naAtAEzUT
 Lxdw==
X-Gm-Message-State: AOAM530Xbr43IDa179fFuhXwrmxp8lpC9S3DqqvyljFKLI5+LAuYDFsx
 y112SpAmqgdgcPnrcpIpssFKjQ==
X-Google-Smtp-Source: ABdhPJyfZenXNQXewRr9MrYXS1oHuTUvJJDaaL3WIBEzrGcuL8a1CKoWn41lbZIItQcqXIisJs5d9g==
X-Received: by 2002:a5d:58ca:: with SMTP id o10mr52164130wrf.358.1634733591429; 
 Wed, 20 Oct 2021 05:39:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/6] drm/bridge: display-connector: implement bus fmts
 callbacks
Date: Wed, 20 Oct 2021 14:39:42 +0200
Message-Id: <20211020123947.2585572-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5053; h=from:subject;
 bh=ZaTrpeiEqqaaclH17vTiRNAhyUGCyF81N0KiKn9lflo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA34Cdfjx5c+XeC3VOSgmFhN4Wi6IIA5tNLXd6l9
 J94s5laJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN+AAKCRB33NvayMhJ0dRoEA
 DDbIoGBmTMHXzmDKf2phe1k3efBjyW65XCjnPlwIcdCalhqUuzI7/uGmbSAg2HlHb1wY50I8tdblcb
 klAd7dzufsoPB0EnPN0mtiR3SBlPkcluR9aC2M7lJHEvo4kIk5OfLiM76yNxdvUOxo2N3rccsxusnm
 ZZ8m8HOpTcbXjE/XYg450Drq6wLQFf4N/dNM60JkpRyM2fduZNxjuloL564R3rnOPbM/cB8o2JkYQG
 4xU4FdnQwfpxgNEPnE1pe3V8LFl+8yfBx0/4igtnbTFNwOukgtGUWjvY7GkeiDaTMaMKRLDJ/QAiXr
 cRsJ0tmF+wm3ayo+6dTpjCctypEB+SvUOoenlfvCJf6Jw86j42g2fkozV3xGMX2hsh0F/JrMkAbJqM
 mXkqUAO+nzA9Y4+sWHDRbTtqcqT/zLzrGC7oSF3wBjYk2TFTF0iSPnG0/t6gDLehk6N/28RzT3xhZB
 jC48h9zKJlTSwFhOrFK+37x+aZOdpuu+kABUJt6gAV/lrPULKdPa0iR6Oyw83JQqNJFnT/rB7geaX7
 Vgh8Pmmfz1G0Ap1G4kz9ZhEhAPORqsHwSXHaLkNut0fkWD0N6BSLRLUrbpm4TR2eGFkqxpSZ18nMA4
 VzlVm0oa2xAt0u4jKLUPBGhNj9B0vQ2HDnb04M9r5fFi9xB7m8yu/ILIwtuQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_053952_909755_3D2E5D89 
X-CRM114-Status: GOOD (  15.32  )
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

Since this bridge is tied to the connector, it acts like a passthrough,
so concerning the output & input bus formats, either pass the bus formats from the
previous bridge or return fallback data like done in the bridge function:
drm_atomic_bridge_chain_select_bus_fmts() & select_bus_fmt_recursive.

This permits avoiding skipping the negociation if the remaining bridge chain has
all the bits in place.

Without this bus fmt negociation breaks on drm/meson HDMI pipeline when attaching
dw-hdmi with DRM_BRIDGE_ATTACH_NO_CONNECTOR, because the last bridge of the
display-connector doesn't implement buf fmt callbacks and MEDIA_BUS_FMT_FIXED
is used leading to select an unsupported default bus format from dw-hdmi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/display-connector.c | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 847a0dce7f1d..d24f5b90feab 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -13,6 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 
@@ -87,10 +88,95 @@ static struct edid *display_connector_get_edid(struct drm_bridge *bridge,
 	return drm_get_edid(connector, conn->bridge.ddc);
 }
 
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the output bus formats, either pass the bus formats from the
+ * previous bridge or return fallback data like done in the bridge function:
+ * drm_atomic_bridge_chain_select_bus_fmts().
+ * This supports negotiation if the bridge chain has all bits in place.
+ */
+static u32 *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					unsigned int *num_output_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_output_bus_fmts) {
+		struct drm_connector *conn = conn_state->connector;
+		u32 *out_bus_fmts;
+
+		*num_output_fmts = 1;
+		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
+		if (!out_bus_fmts)
+			return NULL;
+
+		if (conn->display_info.num_bus_formats &&
+		    conn->display_info.bus_formats)
+			out_bus_fmts[0] = conn->display_info.bus_formats[0];
+		else
+			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return out_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_output_bus_fmts(prev_bridge, prev_bridge_state,
+							      crtc_state, conn_state,
+							      num_output_fmts);
+}
+
+/*
+ * Since this bridge is tied to the connector, it acts like a passthrough,
+ * so concerning the input bus formats, either pass the bus formats from the
+ * previous bridge or MEDIA_BUS_FMT_FIXED (like select_bus_fmt_recursive())
+ * when atomic_get_input_bus_fmts is not supported.
+ * This supports negotiation if the bridge chain has all bits in place.
+ */
+static u32 *display_connector_get_input_bus_fmts(struct drm_bridge *bridge,
+					struct drm_bridge_state *bridge_state,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state,
+					u32 output_fmt,
+					unsigned int *num_input_fmts)
+{
+	struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
+	struct drm_bridge_state *prev_bridge_state;
+
+	if (!prev_bridge || !prev_bridge->funcs->atomic_get_input_bus_fmts) {
+		u32 *in_bus_fmts;
+
+		*num_input_fmts = 1;
+		in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
+		if (!in_bus_fmts)
+			return NULL;
+
+		in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
+
+		return in_bus_fmts;
+	}
+
+	prev_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+							    prev_bridge);
+
+	return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge, prev_bridge_state,
+							     crtc_state, conn_state, output_fmt,
+							     num_input_fmts);
+}
+
 static const struct drm_bridge_funcs display_connector_bridge_funcs = {
 	.attach = display_connector_attach,
 	.detect = display_connector_detect,
 	.get_edid = display_connector_get_edid,
+	.atomic_get_output_bus_fmts = display_connector_get_output_bus_fmts,
+	.atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static irqreturn_t display_connector_hpd_irq(int irq, void *arg)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
