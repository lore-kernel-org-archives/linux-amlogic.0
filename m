Return-Path: <SRS0=gMfs=CN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA55C43461
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 12:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0946A206A5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Sep 2020 12:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1a7NKeIb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d0c4e8pn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0946A206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jp547txwV3he4ayfr2ddtGRVjYSWBCY77p6KQhhaJ9E=; b=1a7NKeIbut7Hc8JoIv/q3C1Axi
	snqUXVsqj1tjSXW7gjD6AcplZ29nTuTGOBP/4qdFPnItsv0qzFTM6nNuDMz9MfdCsxJVcsqUoq/i6
	IUTNZEDFoyEfv+Mu4n/7Pq80NPOHp3THZO/1hA4gcQM+MpvCRiOgsZ6c38LG+e2oq3i3Hi2Aun5lD
	FLF+pzdwGEUIWVrfm2QFQYUYN1BDid11pd5QjAvWg4n6+MBoFKra0IcTi6kDRt6AZ+v5m1WKhNvo/
	Dl0GLzzk0aSGdEhPLn1r8jIc+0GrHOeU7AWlgxYaBH82ggMxuNuj812sNfPNsiSmzLAkQYIDTExI6
	r0tCDODQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEBFk-0000La-O9; Fri, 04 Sep 2020 12:55:40 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEBFh-0000L2-FT
 for linux-amlogic@lists.infradead.org; Fri, 04 Sep 2020 12:55:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so6645490wrx.7
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Sep 2020 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yv8vkjDQK6hcRmOjhA1B4LKV5dcNKUU+lKopTGFxDEk=;
 b=d0c4e8pnx/zw8L1LUX1IDKWgDaOOcFOwkGN7pDeTnRSV3HcfbvwR2pF65F33Qq2OrP
 x0L8nWU/KikfnXLm0ad7qfVo32XRlkxz7Z0eDlEsVHr+cfAv784G2m9LTVfLv+L0f7y/
 /N0KuRUbHfIOdbBvB07yBYVOSJDW1Zi5LWqy6KbFBa/6nwLkxkd9MKkd95bfh20BkAeN
 RRubpy7nee7IrN1eT3+dighUN7LxYPJNkUVJ30yLVmCThHcyJhG2YMk/uW+8O+9hXuxX
 T76cIDTMe6zOR1Ub9D9DCmA+3lE1EuogygFRlm3pCq0Ql2rw04CMAx81n9gC7E/XmE6j
 jONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yv8vkjDQK6hcRmOjhA1B4LKV5dcNKUU+lKopTGFxDEk=;
 b=aRVInkRkpzU1yujlTjlWvS8HCpJsGfKink932GBidiLcP3SSq64dnOQo17bgx9LHfc
 SlSCvVPk8oEOpnNeQzqteevW/IDc3kDf2VXEH6EiLtWwA+KokT3N9ylmSRovROPu+9Zx
 /Gm0I9ID9HHQljUJa2kYyeRZ/6fHly7OmDLTmOTViPesZYuWhYrWukhbk4J0qRR94Vsk
 VyRZvbFwgrDmvh6qI3w9xKs41Gy9Cq6ifJWf+p2OfqZMHDs/6KKCVLXzWzEqqUdhnlCk
 NUixwldjyn+q2fihxRteXcJwhTbYlFCTRsHQExN4xZvyia9Ug73KG+xaQnHiHujZNFKW
 uaeA==
X-Gm-Message-State: AOAM530/PjF+tnRrBR4RAhxmd+QpqNQZdPaEG74OCIVWC4s8AsC/i78B
 oOYq9SJocZ0CNMG5GaS9tLPc0Q==
X-Google-Smtp-Source: ABdhPJxv90v+tFBoZCB4HpM62W+SkjjqW7sPC+ACOuh5qlqbSlXgZD7YYB18yLvhWxSjJbc4yvEFNw==
X-Received: by 2002:a5d:5486:: with SMTP id h6mr7572543wrv.415.1599224134577; 
 Fri, 04 Sep 2020 05:55:34 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id z15sm11026236wrv.94.2020.09.04.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 05:55:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net
Subject: [PATCH] drm/bridge: dw-mipi-dsi: permit configuring the escape clock
 rate
Date: Fri,  4 Sep 2020 14:55:31 +0200
Message-Id: <20200904125531.15248-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_085537_672842_9E159228 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 heiko.stuebner@theobroma-systems.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@st.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic D-PHY in the Amlogic AXG SoC Family does support a frequency
higher than 10MHz for the TX Escape Clock, thus make the target rate
configurable.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 25 +++++++++++++++----
 include/drm/bridge/dw_mipi_dsi.h              |  1 +
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index d580b2aa4ce9..31fc965c66fd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -562,15 +562,30 @@ static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
 
 static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
 {
+	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
+	unsigned int esc_rate; /* in MHz */
+	u32 esc_clk_division;
+	int ret;
+
 	/*
 	 * The maximum permitted escape clock is 20MHz and it is derived from
-	 * lanebyteclk, which is running at "lane_mbps / 8".  Thus we want:
-	 *
-	 *     (lane_mbps >> 3) / esc_clk_division < 20
+	 * lanebyteclk, which is running at "lane_mbps / 8".
+	 */
+	if (phy_ops->get_esc_clk_rate) {
+		ret = phy_ops->get_esc_clk_rate(dsi->plat_data->priv_data,
+						&esc_rate);
+		if (ret)
+			DRM_DEBUG_DRIVER("Phy get_esc_clk_rate() failed\n");
+	} else
+		esc_rate = 20; /* Default to 20MHz */
+
+	/*
+	 * We want :
+	 *     (lane_mbps >> 3) / esc_clk_division < X
 	 * which is:
-	 *     (lane_mbps >> 3) / 20 > esc_clk_division
+	 *     (lane_mbps >> 3) / X > esc_clk_division
 	 */
-	u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;
+	esc_clk_division = (dsi->lane_mbps >> 3) / esc_rate + 1;
 
 	dsi_write(dsi, DSI_PWR_UP, RESET);
 
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index b0e390b3288e..bda8aa7c2280 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -36,6 +36,7 @@ struct dw_mipi_dsi_phy_ops {
 			     unsigned int *lane_mbps);
 	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
 			  struct dw_mipi_dsi_dphy_timing *timing);
+	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
 };
 
 struct dw_mipi_dsi_host_ops {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
