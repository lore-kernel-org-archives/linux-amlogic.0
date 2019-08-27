Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B529C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 09:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BCB217F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 09:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mrj98jA8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ugl/8zro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BCB217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzPvgZJqV002W6wgo+J21kLlfPgEPc11Tb6dR+Upgc0=; b=Mrj98jA8aPAzPb
	yMHhdkGer+yKNETTlcipz6iLkLMO27zX70ClM+6yNyyhharRQEWvpQdFOwjbZJ5JNUNBfQNPedluG
	7+Y7O/f/gcH8/PP+Ry7jdyL/kC+ZctlOq7z+cOjU+Kb/dFiKa6DB20oXDUCwkJGD7LYElqnAQ9Kok
	JoIsKn4ZuuM2WVuInE/1+pReMdSBZKdA+acZZ/KCBGt/8h+rcUMhSPbF+k2X/z0C/qRfCS0J/gx95
	BDSAX9FBIYojNti2HmxJJir8Wzm93GvaKLs4igRlJ5vm/uV+QEv3wdKU8oZgwsVbITBey3E7RAWYP
	rhG7aZ3/tsqG8AeXQVvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2YFt-0001Q9-Hp; Tue, 27 Aug 2019 09:59:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YFC-0000wv-Dj
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 09:58:32 +0000
Received: by mail-wr1-x442.google.com with SMTP id u16so18156732wrr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 02:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3MX6dJTEQsQ89HsRB1zdZlcheUaoM7pF8lBBmIX570=;
 b=Ugl/8zrolmxov83L5GM9xV8mmhNk/xvoT9Qx80voxCM0e8fyHjKUfK9EPT9dzOC14H
 hDRkEM8GqCtOPBom0oTAthFAT/kEh2l/myItSPKeMeNTkl/qfNLQ/lIvkyxw4YvUBcom
 LaMQoNUJEJ+bdvvurb05C58eDEp2KNhjg9m46jQoNSAYu+zFKVgBhKQHPKp1+fSHpp9P
 7obFgm0tdMoEyEKKO10dgDvTaWnz2rUrvbU0EDVHVaNwJoLLfSHFCwM/dvDk113dUAP7
 Q5czgoZ3XfZXqGwFrWn/2hJjvjMMeYoj7TgAu5ru27WSD46DDJpRCHBZ2Pbsd2BIlHhK
 nJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3MX6dJTEQsQ89HsRB1zdZlcheUaoM7pF8lBBmIX570=;
 b=CT5Vf7Tr3OwEGzuA4zsC4LV55IAr1naqMrRkG0o/IP1doIFtAHYk6w/XErpS9zoZHL
 MSwgDLQNPjqrR8X2S8s8zWmC2GsZbjhkurZwV+iPxnu4wrxyA5Sqtv8TcfAalv2jqsDs
 dZRTF3Acg2lE2Cd0UlrpKX2U0Q2m6uh1ZF7OLR5LtFENA54qQ/9X3FYM4HQT6I1fAeHu
 xFnPEoY97gvKcxbdzbk/+YXQyIaMeGFW6ehn4Asvc070aS2J+yzGzhznncXhLNH10tzg
 Wqz0ORA5jjKNZO9y/HPAccwB0pG1Wh6Bt8DOjdoQk0OGyE1SHYjQSCxV4yvOP7CVz0xr
 IEGQ==
X-Gm-Message-State: APjAAAXRYOfHai3d7MEeXU+eoC0PXIlgUrFK9R3j8tbDrorlZmvDLXMu
 d8tXHaoKY4WzCPZUWHDdTlYEHdsrdZXweA==
X-Google-Smtp-Source: APXvYqy4ZYB2/q/DqDVQb0WL+EPpli8OSFxCaqbkjlDMpmc/cnWWUqiSdxK0DJT+0XlCte2VBKjc4Q==
X-Received: by 2002:a5d:66c8:: with SMTP id k8mr28230101wrw.7.1566899908606;
 Tue, 27 Aug 2019 02:58:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m6sm10862084wrq.95.2019.08.27.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 02:58:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/meson: dw_hdmi: add resume/suspend hooks
Date: Tue, 27 Aug 2019 11:58:24 +0200
Message-Id: <20190827095825.21015-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_025830_460648_9A335F5A 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the suspens and resume hooks to:
- reset the whole HDMI glue and HDMI controller on suspend
- re-init the HDMI glue and HDMI controller on resume

The HDMI glue init is refactored to be re-used from the resume hook.

It makes usage of dw_hdmi_resume() to recover a functionnal DDC bus.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 110 ++++++++++++++++++--------
 1 file changed, 76 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index df3f9ddd2234..a722ddbfbede 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -799,6 +799,47 @@ static bool meson_hdmi_connector_is_available(struct device *dev)
 	return false;
 }
 
+static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
+{
+	struct meson_drm *priv = meson_dw_hdmi->priv;
+
+	/* Enable clocks */
+	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
+
+	/* Bring HDMITX MEM output of power down */
+	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
+
+	/* Reset HDMITX APB & TX & PHY */
+	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+
+	/* Enable APB3 fail on error */
+	if (!meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		writel_bits_relaxed(BIT(15), BIT(15),
+				    meson_dw_hdmi->hdmitx + HDMITX_TOP_CTRL_REG);
+		writel_bits_relaxed(BIT(15), BIT(15),
+				    meson_dw_hdmi->hdmitx + HDMITX_DWC_CTRL_REG);
+	}
+
+	/* Bring out of reset */
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
+				       HDMITX_TOP_SW_RESET,  0);
+
+	msleep(20);
+
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
+				       HDMITX_TOP_CLK_CNTL, 0xff);
+
+	/* Enable HDMI-TX Interrupt */
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
+				       HDMITX_TOP_INTR_CORE);
+
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_MASKN,
+				       HDMITX_TOP_INTR_CORE);
+
+}
+
 static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 				void *data)
 {
@@ -922,40 +963,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 
 	DRM_DEBUG_DRIVER("encoder initialized\n");
 
-	/* Enable clocks */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
-
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
-	/* Reset HDMITX APB & TX & PHY */
-	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
-	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
-	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
-
-	/* Enable APB3 fail on error */
-	if (!meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
-		writel_bits_relaxed(BIT(15), BIT(15),
-				    meson_dw_hdmi->hdmitx + HDMITX_TOP_CTRL_REG);
-		writel_bits_relaxed(BIT(15), BIT(15),
-				    meson_dw_hdmi->hdmitx + HDMITX_DWC_CTRL_REG);
-	}
-
-	/* Bring out of reset */
-	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
-				       HDMITX_TOP_SW_RESET,  0);
-
-	msleep(20);
-
-	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
-				       HDMITX_TOP_CLK_CNTL, 0xff);
-
-	/* Enable HDMI-TX Interrupt */
-	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_STAT_CLR,
-				       HDMITX_TOP_INTR_CORE);
-
-	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_MASKN,
-				       HDMITX_TOP_INTR_CORE);
+	meson_dw_hdmi_init(meson_dw_hdmi);
 
 	/* Bridge / Connector */
 
@@ -991,6 +999,34 @@ static const struct component_ops meson_dw_hdmi_ops = {
 	.unbind	= meson_dw_hdmi_unbind,
 };
 
+static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
+{
+	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+
+	if (!meson_dw_hdmi)
+		return 0;
+
+	/* Reset TOP */
+	meson_dw_hdmi->data->top_write(meson_dw_hdmi,
+				       HDMITX_TOP_SW_RESET, 0);
+
+	return 0;
+}
+
+static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
+{
+	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+
+	if (!meson_dw_hdmi)
+		return 0;
+
+	meson_dw_hdmi_init(meson_dw_hdmi);
+
+	dw_hdmi_resume(meson_dw_hdmi->hdmi);
+
+	return 0;
+}
+
 static int meson_dw_hdmi_probe(struct platform_device *pdev)
 {
 	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
@@ -1003,6 +1039,11 @@ static int meson_dw_hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct dev_pm_ops meson_dw_hdmi_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(meson_dw_hdmi_pm_suspend,
+				meson_dw_hdmi_pm_resume)
+};
+
 static const struct of_device_id meson_dw_hdmi_of_table[] = {
 	{ .compatible = "amlogic,meson-gxbb-dw-hdmi",
 	  .data = &meson_dw_hdmi_gx_data },
@@ -1022,6 +1063,7 @@ static struct platform_driver meson_dw_hdmi_platform_driver = {
 	.driver		= {
 		.name		= DRIVER_NAME,
 		.of_match_table	= meson_dw_hdmi_of_table,
+		.pm = &meson_dw_hdmi_pm_ops,
 	},
 };
 module_platform_driver(meson_dw_hdmi_platform_driver);
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
