Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24853C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2F7061372
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2F7061372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOrOSbK+5xdJ2JGHl+57+YxaPZYdycFFk1cjxNfgibo=; b=HtB9Zj62HikWGX
	WU4xgAtR9jxHboQ6RyOxWg70CjK2cpYG6MrJkANemwIIAUISkPNGNNOM44btccK4RGPsX39GxHqwC
	l5FBbE0phJFMHadW3c8Nf1OJP+sWJD8CnnmMmcqSoNJBJ1Z+GW/JfAyKUJa18o4HounIXceVtLo9x
	dki0W5K5JX8sHereQd/g+3+9nsEs2lILdpEh5YgAL2QZBsCCfT4ke7sDSr1JpVaoj3xVrf1rrjYFt
	b761257+XA7M82xD8stdIjM6gK5TSSZlYcSwtSDj9VOR8HlBbPxjRnMuUB58u95Gd+MFfM6QvPfpm
	DRfJxh4qDAZ94C364tJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdAtO-004V4C-Ls; Wed, 20 Oct 2021 12:40:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdAsr-004Uny-Mq
 for linux-amlogic@lists.infradead.org; Wed, 20 Oct 2021 12:39:56 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 u8-20020a05600c440800b0030d90076dabso4917673wmn.1
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Oct 2021 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrIMbe0cgeUgVskjVfxjc1cVVmfypfzeebevv5kx8mA=;
 b=Pr+dAUu/mCPN3ilMBfuPs7ptSAUMXt4BI+qeV09Iz2k7tIuYTum21jbIoYwZ6u8Inh
 4F55yX2JqRgcxu5ICOWiLuVt0mIHSOj6NCBB7Vz14sR2vOUhWRxiN9K2RNbIxG3PXl53
 qLWNetxF3ND0aAgWBfbS7lXorjHyXLAuKCYhfycmjEDhsgbXA3add3r3ZC777/JZo+EO
 7zLvCizmox2FVdnJXKvjnN24f+3Lehb6Nc2bqbs0qmZ2E0q+yhl7Bw1fDW0mmtb7AzhT
 J60ReiHtGiNG19/06agfLC+UaACu4sGFSmlaqfzD89Zpb4VykuCDnTPzNPhZ9618edIR
 ePCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrIMbe0cgeUgVskjVfxjc1cVVmfypfzeebevv5kx8mA=;
 b=sqZ/nr4VhgC9tozDtEF7bOHNacXCI+Nemkeqp+E6QXQAVZZxIPGKJlayxmxAFGfyhI
 QZ0omQuxj2Q44f/hxGI46IYwG1eUkc1e94Lh5sm2eqjCbAZfmPwfhAXgr6Lw+njdenkG
 7oAQhS6CP4Mw8TwSiz7IiQCXX44nE+ZRNCqniqvykTvr4JStvnNw3fiMjpuiYcYtu0NP
 BztE4IYzzx6GHpjFiJ0EFndM8mkCb1m2JJS+57s+lcXm/m38MhX0QMpcFV8p0TWWxrFZ
 D7tbopl6ajAX3SD7Z+/I67agSpUYDPC9ht6N5v3vkaFoa3VyrdrbOhjh+MaPvhHSj9Qk
 bCjw==
X-Gm-Message-State: AOAM532LHAO1eeImUAQYH/ZE8Bf/yI9i0iqVHVtFC6wOjXF+c4odcEBs
 +jnuGOmP8A/Hr+U0dB0o5lG9Yg==
X-Google-Smtp-Source: ABdhPJw0ShkRNi7rCxTUF0MorfZe7tSZ4dB3eodpanL/TUpOCwYs0O8C7f3sSF9eQweH3me9fwjScA==
X-Received: by 2002:a05:600c:3584:: with SMTP id
 p4mr13080991wmq.168.1634733592440; 
 Wed, 20 Oct 2021 05:39:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/6] drm/meson: remove useless recursive components matching
Date: Wed, 20 Oct 2021 14:39:43 +0200
Message-Id: <20211020123947.2585572-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211020123947.2585572-1-narmstrong@baylibre.com>
References: <20211020123947.2585572-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3222; h=from:subject;
 bh=CN3FLP6iVU76e0yAYMgWdH+jRNt14KgdTlQZc0OHMOE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA34OiTZV2ZFtMy96i9yZnB9GrMijV1zFNrHEcyb
 umLfJSqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN+AAKCRB33NvayMhJ0ZzyD/
 4lhR8faDJpilegWriDDzuq5KGRjumsjn/WlbNZjCPoOqaj+pn5KXfsZzw9R7Eeup7ZqYyCAQOcIvcs
 oQmvtld62wlHcTSHBs8/6Z3xpYnDKqOsIO/94wSJss0kEwrNAr6JHKn/wtboC7Qsnj+46QaOdCQF4v
 mOK6oirD8VIkza0RIJhQeu/QvEE6Rl5e6pEhGBO4eCO8eJy3sgyxaDT6Q3qzCc88F9LBZ67X+KkWdV
 S9MRl29/bLsI/x6KXJqWirHBBS2gCn5HhicMfbUnQ2NAYE4BWL2QKpXAj0N1FQnd5XCE1vR3Znm4no
 tdYmAuvLL6TsdSCI7SB5FKe0fCRjczKHFwUcD4zUZ2UlsnUhGoemIYk2nCZ6UjUbpPPwkg8eN0DjJA
 wu3fAkTt8pVC9fXPDxRh0v+MwLMQUoz3KmruRkZrnm6b7hUDGtj11YQTnk2iHwijm3+HYl8T3tBumY
 7gT6EUrp67O+/H/0sq5qZMc4q3xAX+1yqyQfdvnyaI2qUfvRhwDdiXLthxrZE80YL3vG3W9UN3yk+V
 I7Gwl8sJpzKTevNhBIYUvvQh8a1BMyiAFUKT20Zu1YRAAK4YJA4yo/RYmnazb7L2J9wwPFNRaMQD2e
 yJf218RosAh/v0ryiddosAwhMw0/Pp5jshuGAwJG5SKTO2uOXh6eNmshvxRg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_053953_770869_CA11E624 
X-CRM114-Status: GOOD (  15.22  )
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

The initial design was recursive to cover all port/endpoints, but only the first layer
of endpoints should be covered by the components list.
This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
first endpoints instead of recursing.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
 1 file changed, 21 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 7f41a33592c8..97ebc07357bb 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -426,46 +426,6 @@ static int compare_of(struct device *dev, void *data)
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
 static void meson_drv_shutdown(struct platform_device *pdev)
 {
 	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
@@ -477,6 +437,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(priv->drm);
 }
 
+/* Possible connectors nodes to ignore */
+static const struct of_device_id connectors_match[] = {
+	{ .compatible = "composite-video-connector" },
+	{ .compatible = "svideo-connector" },
+	{}
+};
+
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -491,8 +458,21 @@ static int meson_drv_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		count += meson_probe_remote(pdev, &match, np, remote);
+		/* If an analog connector is detected, count it as an output */
+		if (of_match_node(connectors_match, remote)) {
+			++count;
+			of_node_put(remote);
+			continue;
+		}
+
+		dev_dbg(&pdev->dev, "parent %pOF remote match add %pOF parent %s\n",
+			np, remote, dev_name(&pdev->dev));
+
+		component_match_add(&pdev->dev, &match, compare_of, remote);
+
 		of_node_put(remote);
+
+		++count;
 	}
 
 	if (count && !match)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
