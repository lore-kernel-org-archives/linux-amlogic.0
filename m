Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECB9C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jan 2022 02:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIp7ptQS3EYX7HN7LCjtWCyclCSZQkO22B/fPqHfESo=; b=bO49qMvFJku+5O
	T1HGC/StKz7DKCBeYhTeCmKZy4mujMZ9Hv4vqDthxbfSFcrZmtPPDMXJ1U6t3fe8xlV+eqR+64ggy
	oqN8BKEyeeiVHoemimlmzDQjs7ND4EqqX+5/IkIT/0n0nrnFuREinYlMySMPr5pYUak+hKaZgGVrj
	EsHnKY7ZQMT7SQ7sWhS1Pk1wyLmV+nWeVEQxl864zCoY7ERuajxdMYDxZtAd82YkyX9v2eZIYE4GO
	ZMtaPs/YZaQ/CXuz10HLEj9zOBhlHxh2npzkCWH7OFw+FRDIR1XzgZqQg04wVIUIE5ad29vwtT7NN
	eHRuA4KR5Y1JJ7641sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9eWl-00H6vh-SF; Tue, 18 Jan 2022 02:47:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eJE-00GzJn-Av; Tue, 18 Jan 2022 02:33:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFDC7611E2;
 Tue, 18 Jan 2022 02:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321EAC36AF6;
 Tue, 18 Jan 2022 02:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473199;
 bh=KuDx/9P+Wps9AtzStWZ2hI77/d8sYbhn6+5ghzmQjp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o0Fuj1sham3qpyeVs82YAoQqT1EkqxrScFRua84VhZgkZaE6xP7Rz7+ucXKVBZ/6X
 JyA0hpYTfyWodUm8bPMv5fBa9s8hHwpU8tZxZ74bl2I0CWtBBDIcZQozUqkhP8DHiL
 ecIF70C3+on5+66erC1bDRitIVgpg+bCqJqYRAiVYS4Tn+gSFzRuPjnGbVRoITamii
 ZSOex0OyNqKu9ITLhKhKz7Q/bxY076y6iPi3Am5rqS0p94SY18i5WZ3N2BbtZxdE3+
 0L97nDd/ppQZaBBDu8+lX6RRLH3HMXQkhfUaMweajno4Pk9E+KSmhrW/cVwiItmj6B
 kKLiSrPBRpDBQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, balbi@kernel.org, narmstrong@baylibre.com,
 khilman@baylibre.com, p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 023/188] usb: dwc3: meson-g12a: fix shared reset
 control use
Date: Mon, 17 Jan 2022 21:29:07 -0500
Message-Id: <20220118023152.1948105-23-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_183320_486197_894BC18E 
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
