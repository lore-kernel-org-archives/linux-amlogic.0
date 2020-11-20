Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0815C63798
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5366A223B0
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvNp2o9y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ezrj4Dbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5366A223B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pj7/bPf9IgWvOV1PSpw0ciL29rnp0iXh5zR5Hxgg+AA=; b=rvNp2o9yfWUbZuPYmiDv0GL68
	rR+pZEE+/09GMoqHt5/w2FPHx5khOEHIw34ir+nmfBDCmcLx57J1jZ7MDA1EJOMHFeOf/jaFEAGEd
	q7OEr9sO2Z5o2lPmVb4f8nn9rVAMzjFPljUlZ6ixFMjZy0vmuxwuZ+/A5Um7TmfMQnxcXLSdWibVh
	nNscnPKrTNbp76AughtohdLGfPpGs8zv14qrwgcA+84DsVBF76GBKcNm8UjJK5nHVxPcq4mmuV96h
	/Sz05B5WEAMZMU1b47FHSxwUFKA/Y+Y/isGFWoWvb9eBmSxN+6/W4D16mHxzu3//aCoAbC7kv+SA0
	OgN5Bk7Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2vq-0004IT-IW; Fri, 20 Nov 2020 09:42:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2vk-0004Fl-J7; Fri, 20 Nov 2020 09:42:14 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90CF922404;
 Fri, 20 Nov 2020 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605865331;
 bh=S+wE9QoVUo+/NGuaJNIMv0SkfSy9gzrpeluikKZydfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ezrj4DbhHlbAjzVH/o1uRfz51aDcm4hQB9vH8gVL6j/wK/SLh2tLAkrMsxJ2inwy6
 TWe6t5s2AgZslMdtShWW2+KzMtYiJiCnaLCqlr5Wq/jSEZybwss01Jdadyv5q7WfwB
 FrbJM0VypjRQJ0GQE2kbeAW0JiY1j573wxTzg5Eo=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg2vh-00CDFB-No; Fri, 20 Nov 2020 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
Date: Fri, 20 Nov 2020 09:42:04 +0000
Message-Id: <20201120094205.525228-2-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201120094205.525228-1-maz@kernel.org>
References: <20201120094205.525228-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_044212_880956_418D908E 
X-CRM114-Status: GOOD (  17.86  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The HDMI driver request clocks early, but never disable them, leaving
the clocks on even when the driver is removed.

Fix it by slightly refactoring the clock code, and register a devm
action that will eventually disable/unprepare the enabled clocks.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 ++++++++++++++++++---------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 7f8eea494147..29623b309cb1 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -145,8 +145,6 @@ struct meson_dw_hdmi {
 	struct reset_control *hdmitx_apb;
 	struct reset_control *hdmitx_ctrl;
 	struct reset_control *hdmitx_phy;
-	struct clk *hdmi_pclk;
-	struct clk *venci_clk;
 	struct regulator *hdmi_supply;
 	u32 irq_stat;
 	struct dw_hdmi *hdmi;
@@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
 	regulator_disable(data);
 }
 
+static void meson_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static int meson_enable_clk(struct device *dev, char *name)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get(dev, name);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "Unable to get %s pclk\n", name);
+		return PTR_ERR(clk);
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (!ret)
+		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
+
+	return ret;
+}
+
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -1026,19 +1047,13 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmitx))
 		return PTR_ERR(meson_dw_hdmi->hdmitx);
 
-	meson_dw_hdmi->hdmi_pclk = devm_clk_get(dev, "isfr");
-	if (IS_ERR(meson_dw_hdmi->hdmi_pclk)) {
-		dev_err(dev, "Unable to get HDMI pclk\n");
-		return PTR_ERR(meson_dw_hdmi->hdmi_pclk);
-	}
-	clk_prepare_enable(meson_dw_hdmi->hdmi_pclk);
+	ret = meson_enable_clk(dev, "isfr");
+	if (ret)
+		return ret;
 
-	meson_dw_hdmi->venci_clk = devm_clk_get(dev, "venci");
-	if (IS_ERR(meson_dw_hdmi->venci_clk)) {
-		dev_err(dev, "Unable to get venci clk\n");
-		return PTR_ERR(meson_dw_hdmi->venci_clk);
-	}
-	clk_prepare_enable(meson_dw_hdmi->venci_clk);
+	ret = meson_enable_clk(dev, "venci");
+	if (ret)
+		return ret;
 
 	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
 					      &meson_dw_hdmi_regmap_config);
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
