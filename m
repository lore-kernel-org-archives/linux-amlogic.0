Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DACC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 02:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIp7ptQS3EYX7HN7LCjtWCyclCSZQkO22B/fPqHfESo=; b=rEuNw1vSgPQjj4
	nwj+Tti/xaOgwA3Px2Hb7qfMEWer7br5/1bFn1nKckNbYjUVVZ6j1dDkEZ4sQ4gi41zhESIb9s5M8
	lHRIYGKc8MSHnE0PMOrhRQMP123+zrTYy1P3w/ZtatVx0N50k0Q46L5Ej7zMLe3rIogtI/3ef1Re4
	06ncpsIG5uRoDF7AgaTm57FNDVABU4e2RbW2R0QznJ7Ce8uxlj2Ll2ZIAYy8qpa1W13DmPNn5fFk2
	WROv5VhD2EGic1aIi61Z2j1PHTHa90zV8eIg/aPck1MmCmu27aoR797/BLKPxsugyjGYRBPSPoaLI
	NHnIbS0gDwm03BPg62KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9e7n-00Gsio-MJ; Tue, 18 Jan 2022 02:21:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9e7k-00Gsgp-7z; Tue, 18 Jan 2022 02:21:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B62AE612DF;
 Tue, 18 Jan 2022 02:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9749C36AE3;
 Tue, 18 Jan 2022 02:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472487;
 bh=KuDx/9P+Wps9AtzStWZ2hI77/d8sYbhn6+5ghzmQjp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UWKdolORwwfQVXdJfYNLLmeAVgZ7i1HAwEUO3EfuT1EnALSjd+Whw2cZv3uBv/XQy
 LnDCS2ai1HRjFaj2RPlI91aPMStiCH5j7Ipf9FKCpo/u/jjEeFqGpptxabBgPOpIjv
 HUCGwZ9V/Bl+ZvAJtbIVbOGEl1ruc3m94GheNvcgpXyZEBnXQgBCz/JIS/BYKM49X+
 qx0xAxut7kNPs2Sdx/pyuUHGZvdBEYHAinD/onjL0KcVh4tooatsKWOIdvO8HjXmWM
 hbjOdN9Ke7Fto1h7uyxwyVznn0nJd6V2mlZHYNc0EjMdz4hUnxpKSt3NgXEe5JuiFD
 R9O/ysKyIbUZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, balbi@kernel.org, narmstrong@baylibre.com,
 khilman@baylibre.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 029/217] usb: dwc3: meson-g12a: fix shared reset
 control use
Date: Mon, 17 Jan 2022 21:16:32 -0500
Message-Id: <20220118021940.1942199-29-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_182128_391660_6E491FA8 
X-CRM114-Status: GOOD (  14.92  )
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

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

[ Upstream commit 4ce3b45704d5ef46fb4b28083c8aba6716fabf3b ]

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
Link: https://lore.kernel.org/r/20211112162827.128319-3-aouledameur@baylibre.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index d0f9b7c296b0d..bd814df3bf8b8 100644
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
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
