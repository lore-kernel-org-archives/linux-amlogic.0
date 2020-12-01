Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6926C64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B6F21741
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 19:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GGZuRzxn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="k3zSsZ2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B6F21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHIIxlYxZke2JcJrDG7lMEK4pqyagX6mnj9XSOG8iA8=; b=GGZuRzxnYdSNY1P70SKY+fW3zK
	F79QIJLiTC81l+p2heSOuej/jW4IdjKkl2D2ieGzkfcJrJQbiTMLM/NS66IbKM8ZlBAaTrVXVIklJ
	OIBCQdPZTYaAYsVheOhcK6cOIIazE9OL4gGev4OlvtwB937BDvlm3ZTr2fSOJahPTh5QQ/E6y9VfH
	uVALdK7zZmEdCvX1BxlzHfymWm3NOxeDbLtD/guzw2FLURhy4zYWX6nJSvl0LCf7uP9x3qZeoNUEu
	yDNgN4sqmNKKUVRxTuGdn7yhFN6RE58pbIA85EYPXVxUG7+ll+tsO7Mo5RZyBn8GwUCsdpPkXIGtX
	InTnhOQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkAu1-00018u-8D; Tue, 01 Dec 2020 19:01:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkAtz-00018F-40
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 19:01:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id l1so4359315wrb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 11:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1dEJUDuhS7iOpzRVv86r79ENM/jPrgw7u7JsYCWkYfU=;
 b=k3zSsZ2YWE86WW2dJvbafkB+cKYCqj+/dXRMk6wSEbaAMzM17lWDFS6pKZw3wW/ZkT
 IApg1a77UrpF1g+dFfOv4VaGH6r2bM+qt34+ZnvEAridm3NFwuFVC79jILvR2m52/Rdj
 xH2s5y+bq76LkLZKL5JgWE00QArs6sKwTYW4HavqlMxeAMprz9Q9MEu60WwI/TDRCDJG
 UJzC3PHE3mJrcR5nMy8V/eZSUnjKQpDa/y1UVtina4mzbdKoCsks1WTfXfsU7Hp9Y8np
 u+HiKvx3bb+k29/W6sq2tg8D34uU0+X/BEf+exjDTt7mUlYqx1gAClQTUvzVdlcjwbpV
 VM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1dEJUDuhS7iOpzRVv86r79ENM/jPrgw7u7JsYCWkYfU=;
 b=H+8oCH28s6aTHIq2FRB2Tg1GC9u0zNta9pXcC+4UQzwflsEjk8moMTyXhKskQi5IZG
 lwbpRT/nXL65XFIna1otdp5n8aLT0fPsEJQ8IyE4hmtGv8HGGVAe+orkTx44f/4SRiWv
 uVwJZDhDY+C1TVbOMIrcIRCG2yRL9Ab8xqtTj2rrF8BXH6N9Dbdpfhu7oDPicj6rPn5+
 zBBgSE5Vs05teSHgCvvmAVyKggiSoTVQH/OE70pFjIfyjX9J9IQSkyzgs3c2X68vbNeD
 AtBHXsFCeVJc5ILzlV2G5jqd7KBSkQwNxaTXaLpGE2QVj+5vnXvnQgU861lUgi6emZea
 UgtQ==
X-Gm-Message-State: AOAM530IePFDPkrDrkXKrKyiZxvYnu380xQJgYrH4ZrarBflmpLxqWyR
 Z01FxDi/w/aXHlgU6QP5OjAIDrK3x1f49Q==
X-Google-Smtp-Source: ABdhPJwVIic5SLd7j1ro/o0Nph5ICWIcaGxb0s8+eZQnKPwDgH3dWds5cFeB8K26G+y69nIC9lCztw==
X-Received: by 2002:adf:902d:: with SMTP id h42mr5643737wrh.175.1606849286085; 
 Tue, 01 Dec 2020 11:01:26 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:40a4:a590:1da6:9599])
 by smtp.googlemail.com with ESMTPSA id 138sm887733wma.41.2020.12.01.11.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:01:25 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Felipe Balbi <balbi@kernel.org>
Subject: [PATCH v2 2/3] usb: dwc3: meson-g12a: fix shared reset control use
Date: Tue,  1 Dec 2020 20:00:59 +0100
Message-Id: <20201201190100.17831-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201201190100.17831-1-aouledameur@baylibre.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140127_208490_41F69BB5 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

reset_control_(de)assert() calls are called on a shared reset line when
reset_control_reset has been used. This is not allowed by the reset
framework.

Use reset_control_rearm() call in suspend() and remove() as a way to state
that the resource is no longer used, hence the shared reset line
may be triggered again by other devices. Use reset_control_rearm() also in
case probe fails after reset() has been called.

reset_control_rearm() keeps use of triggered_count sane in the reset
framework, use of reset_control_reset() on shared reset line should be
balanced with reset_control_rearm().

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
changes since v1: [1]
* None for this driver

IMPORTANT:
This patchset depends on this patch [2], it adds reset_control_rearm() call
to the reset framework API, it has been approved by the maintainer, and
will be applied to reset/next

There is currently an immutable branch with it [3]

[1]: https://lore.kernel.org/lkml/20201113000508.14702-1-aouledameur@baylibre.com/
[2]: https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylibre.com/
[3]: git://git.pengutronix.de/git/pza/linux.git reset/shared-retrigger

 drivers/usb/dwc3/dwc3-meson-g12a.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 417e05381b5d..3fec8f591c93 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -750,7 +750,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
@@ -759,7 +759,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_disable_clks;
+			goto err_rearm;
 	}
 
 	/* Get dr_mode */
@@ -772,13 +772,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	/* Init PHYs */
 	for (i = 0 ; i < PHY_COUNT ; ++i) {
 		ret = phy_init(priv->phys[i]);
 		if (ret)
-			goto err_disable_clks;
+			goto err_rearm;
 	}
 
 	/* Set PHY Power */
@@ -816,6 +816,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	for (i = 0 ; i < PHY_COUNT ; ++i)
 		phy_exit(priv->phys[i]);
 
+err_rearm:
+	reset_control_rearm(priv->reset);
+
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
@@ -843,6 +846,8 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	reset_control_rearm(priv->reset);
+
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
 
@@ -883,7 +888,7 @@ static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
 		phy_exit(priv->phys[i]);
 	}
 
-	reset_control_assert(priv->reset);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
@@ -893,7 +898,9 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 	struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
 	int i, ret;
 
-	reset_control_deassert(priv->reset);
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
