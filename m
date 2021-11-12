Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA2AC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE5560F55
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAE5560F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcEfF8A+p4pI8CxO3sCCw1HnpL6UdeGWpRg86xbbZLA=; b=hJo9K5OS4dMEtu
	Y9+pK1mjMUjhL/FIqFGnKTIugRdTg8UdguISCooEGUaJ2q4tj2pWnVCX/viSYMnmyQi5w0dorAWgS
	nwzGKsXuH+obwATnNlnF5KDO5YXlDgIwj0I7FQbAJVwQnWwXQYyXtwWYFrdfJz6/mFCwpzYD+/49J
	ChNifiJ0fk8mvo8L71/PkWW5Kh00hc2Sf65r9xuYc6wAUWF9yFyMJl3gTdmATvEMi4mNmS61Nxtn8
	rV+Ouh1w0NZuIxuaDfFBjaLqiZgXQZh2fAJwvgnELLuKIv/TANPVGYS3newU31UIA/U9BI5XpnJWc
	+9HXGOBZmBgb29pq0SBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZU3-00BEjW-3v; Fri, 12 Nov 2021 16:32:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZTy-00BEhT-Mv
 for linux-amlogic@lists.infradead.org; Fri, 12 Nov 2021 16:32:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id i5so16553654wrb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Nov 2021 08:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+QipG3moXrpkh2YURj9JhExl3AcdSIwqw5E1yOYJddA=;
 b=JyorvgXBmxmsNhnms+ripo7aB4EgWROWWCo5bRvkc2vYFxbb2a8lcg33YB9Wiq+ZEK
 MUyRDOmb+EUl3MMc6XH1vmzi2T5Csgw4z1Yj1bdgbc3Nh9iJTXUAMaNK6hqMa+CplPsi
 pnFsD+wT6bQGzyiB/YBU1INtBZuOiVJ2g6i30kSXsuWIfj1b4SNd8mb5OlPBExUi2pdh
 7/+MhkcIMt38KZQGhGSYeR3YwSWURpof8pOm3d2PbQtcl8bKvOIXOST69MgDmbc+Km1Y
 CDMyp02bUAEGW1nS4xoOXS5U+8yZu7W72QCo7gC62hlTGw5imn+v+sfnuj3FGfoHlIb8
 Q9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+QipG3moXrpkh2YURj9JhExl3AcdSIwqw5E1yOYJddA=;
 b=xZlAZC4FKpEr1zvb2fkaMQTlj5KmvgOc4Lys/Up26W2+Q+bBCJswxLqBnDKTSb/HOM
 vUGjYMapr72WeWDcgxm6Yc/mR69TgbzsnkV8KHEtawD11uiNlNplDj8Qh6KzRQ2UMvN9
 jFyRRUjs7wTw4HCb8DLidokP+MLqQCnAYY0LStkdN9/1Fye/o3l9jeL8LyF7O7OxfwhB
 +/2Za0+n96cuctkNqvMGHuoSN4VAyH2IHl4uo9D5iJc2KhJnuh+xUrktAyLVpzlXvuhc
 laLrT/whOzSFKVf7mmR4bWg92pgUzvnNWusd60tpNanFVDOWZe1ns9dzS/oxB3m+FGLB
 6sSQ==
X-Gm-Message-State: AOAM533YJMfIEg+b6gXizcO/sq0GfTWtTJp1oN4ZNRfpgRgLJQu1bUTM
 A02nP9GyfIVvWPtNOs5zU2IG7EPSGOnp5Q==
X-Google-Smtp-Source: ABdhPJwYAIW2CGWwtrkZv6a8wia60Ojdm2EmkVQMST/tv2MCGtp0hNMsNM5xPzPDhgP95OsxghTNkQ==
X-Received: by 2002:a5d:5888:: with SMTP id n8mr20121587wrf.234.1636734773433; 
 Fri, 12 Nov 2021 08:32:53 -0800 (PST)
Received: from amjad.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm6253796wml.9.2021.11.12.08.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:32:53 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: balbi@kernel.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 khilman@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] usb: dwc3: meson-g12a: fix shared reset control use
Date: Fri, 12 Nov 2021 17:28:26 +0100
Message-Id: <20211112162827.128319-3-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_083254_770302_D8388CEC 
X-CRM114-Status: GOOD (  13.09  )
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
 drivers/usb/dwc3/dwc3-meson-g12a.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index d0f9b7c296b0..bd814df3bf8b 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -755,16 +755,16 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 
 	ret = dwc3_meson_g12a_get_phys(priv);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	ret = priv->drvdata->setup_regmaps(priv, base);
 	if (ret)
-		goto err_disable_clks;
+		goto err_rearm;
 
 	if (priv->vbus) {
 		ret = regulator_enable(priv->vbus);
 		if (ret)
-			goto err_disable_clks;
+			goto err_rearm;
 	}
 
 	/* Get dr_mode */
@@ -825,6 +825,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
 	if (priv->vbus)
 		regulator_disable(priv->vbus);
 
+err_rearm:
+	reset_control_rearm(priv->reset);
+
 err_disable_clks:
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
@@ -852,6 +855,8 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	reset_control_rearm(priv->reset);
+
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
 				   priv->drvdata->clks);
 
@@ -892,7 +897,7 @@ static int __maybe_unused dwc3_meson_g12a_suspend(struct device *dev)
 		phy_exit(priv->phys[i]);
 	}
 
-	reset_control_assert(priv->reset);
+	reset_control_rearm(priv->reset);
 
 	return 0;
 }
@@ -902,7 +907,9 @@ static int __maybe_unused dwc3_meson_g12a_resume(struct device *dev)
 	struct dwc3_meson_g12a *priv = dev_get_drvdata(dev);
 	int i, ret;
 
-	reset_control_deassert(priv->reset);
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
 
 	ret = priv->drvdata->usb_init(priv);
 	if (ret)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
