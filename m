Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F51C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F10208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 08:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZEoGBz0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xpy/MF7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F10208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cSotftZr7v0CUtaXtgWbemdp+Sm7ecBY7kVzziJM+iA=; b=AZEoGBz0+cty/aWzoiLwe60yr
	Gbif8FgaGFTGVwf+5iGAua3m+2/7FmqzqVT8PhVV5A6kS1O2igiNrzC09s/cs3Y66WbeM53IJ5tJL
	hieWh3r8W8US1q8fzV16YlYyEzMgPchxVm6jPhxFzo+x5GHl7D1FX07GVADwUWugcbNQRCuYLK+33
	dhHFXxkndtiw2qR+QoIIakHGpYiVsfaUc9NvNQ4jMhLm2vIf22j+Hb/zBIOhQDaSm0ocV+i3fwaAp
	lRtaOm9zbWGNfFFk7vjkYVMcBsimKE3AaknAaveFolmvSNajqu9QbHi7iI2SGYz81NhdaRMR7DGT3
	l9jI+rRQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFCMR-00018h-4k; Mon, 07 Sep 2020 08:18:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFCMI-000138-KW
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 08:18:42 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so14773875wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 01:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bX1s4xMuL5vY2ccVWkeVsR98TkYqApy3vJM/yyJ0UUI=;
 b=xpy/MF7WlNAaepdnXSosFHddhAhU/jmZO82o8zHY6wCRvPW51p6Du1L3QdA5hyh+ik
 hFGY+o5OV8lzi1QtZ4416DJ5yxkukQtNxwePe5bCqdSgWTcYi4FxrxzelPJktF6SpTiM
 f4ZIHH72qSZyKypnocTiV0dUTgiuNzUcW5t71r64Laq0WZzwW00OJyZyW0HEV9tIaa7Y
 GTC7joGdyUaJWKSaMj7BqNXlSqVhhIPfZGbR0B8J8PiSw/ZWrJSK6WKzom3T+7XwWNPk
 V7KKJh8S0Nq0h0/loU+TzSIruF6bhgiYmKYdMS9us3aNOWCcqLn/QZz67/sXQOGWCqbM
 QmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bX1s4xMuL5vY2ccVWkeVsR98TkYqApy3vJM/yyJ0UUI=;
 b=tcutjbnhR6qvwHKHgT/a4dfF8JEONM54ClU/nKXi7zd662h315tYri2y79sPblcz4Q
 ujNfqS2Zux4sJ96wGlQn62UEEXH3oKjnF7uz1qcik9BvVbClXSVRRYrCyBbR7d696m0k
 2oIeyx56Yw5SW+WqTUDw74fECiXKlpM/LyTBSoDi8Lt0SrUkU0iepsJwQJuwBQJ4Ey5a
 UDssZjSS6C7X/lzxJPZejG5VHwOJpLGCHdFsSAtKZlQyCneqMSQOh5whIgIhfTP8P2mq
 Cwph+OY3EqAoi5YdFGrojPF9lIduBkfKvc9RL+sabW4hRI4QWBseRqE2rlVu0DuGlcV8
 tFTg==
X-Gm-Message-State: AOAM533aBRKZ0tL8wtRsgViNs5gbg+qgmg941IAPeEuN07WXwl+sJKqD
 Zpkgrb57gRQfm3X+iflMD+eQag==
X-Google-Smtp-Source: ABdhPJx37EVAY06BMAZdNUlhN9PbcXqw4hXGyZnhzv+klLTi6jqFy02Q485CkAsqiiMLG71JIu+hlg==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr13292808wrv.141.1599466717335; 
 Mon, 07 Sep 2020 01:18:37 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id q186sm28032205wma.45.2020.09.07.01.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 01:18:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch
Subject: [PATCH 5/6] drm/meson: remove useless recursive components matching
Date: Mon,  7 Sep 2020 10:18:24 +0200
Message-Id: <20200907081825.1654-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907081825.1654-1-narmstrong@baylibre.com>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_041838_709286_19D64D58 
X-CRM114-Status: GOOD (  14.75  )
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

The initial design was recursive to cover all port/endpoints, but only the first layer
of endpoints should be covered by the components list.
This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
first endpoints instead of recursing.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 48 +++++--------------------------
 1 file changed, 7 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 92346653223f..1a4cf910c6a0 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -449,46 +449,6 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-/* Possible connectors nodes to ignore */
-static const struct of_device_id connectors_match[] = {
-	{ .compatible = "composite-video-connector" },
-	{ .compatible = "svideo-connector" },
-	{ .compatible = "hdmi-connector" },
-	{ .compatible = "dvi-connector" },
-	{}
-};
-
-static int meson_probe_remote(struct platform_device *pdev,
-			      struct component_match **match,
-			      struct device_node *parent,
-			      struct device_node *remote)
-{
-	struct device_node *ep, *remote_node;
-	int count = 1;
-
-	/* If node is a connector, return and do not add to match table */
-	if (of_match_node(connectors_match, remote))
-		return 1;
-
-	component_match_add(&pdev->dev, match, compare_of, remote);
-
-	for_each_endpoint_of_node(remote, ep) {
-		remote_node = of_graph_get_remote_port_parent(ep);
-		if (!remote_node ||
-		    remote_node == parent || /* Ignore parent endpoint */
-		    !of_device_is_available(remote_node)) {
-			of_node_put(remote_node);
-			continue;
-		}
-
-		count += meson_probe_remote(pdev, match, remote, remote_node);
-
-		of_node_put(remote_node);
-	}
-
-	return count;
-}
-
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -503,8 +463,14 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		count += meson_probe_remote(pdev, &match, np, remote);
+		DRM_DEBUG_DRIVER("parent %pOF remote %pOF\n", np, remote);
+
+		DRM_DEBUG_DRIVER("match add %pOF parent %s\n", remote, dev_name(&pdev->dev));
+		component_match_add(&pdev->dev, &match, compare_of, remote);
+
 		of_node_put(remote);
+
+		++count;
 	}
 
 	if (count && !match)
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
