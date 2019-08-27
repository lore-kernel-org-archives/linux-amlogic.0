Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED04C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 09:59:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52CAD206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 09:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bP8AeU5d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mOB8HFsH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52CAD206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjLEN05TmNPoTQa7/DcmE4yn2SZT7wlYqoVkMdz0Ny0=; b=bP8AeU5dHnH/2R
	xLRWzyMSEoRbkTGOzitGLX65UOTTHNDSMjEgwF3Cj+FTkEwZnd9pZNP1cnaWZ17EGMy9a0GBvWX/i
	bIYTim/GhO3dI2tzf7kBJzHLdoqYQKp/0BvOCVzA30C0E7nAly2QeKLHgbBzSvidu4y07YKp0Y/Sy
	H233jZGL2NKwpNih7qllrFbR20PORMYWczdOMZq5nuSfLtxtT4Em7IasG+1ukyzKT3q/2cEtNfBPL
	WbUyafmTOe2/tPmZSs9C6g7SMXXr8ovkmdrfgzIaD6daxYec78jF+B45FbrQpjvg6qZPG5bKsLRXS
	FTxZAhC2NrNNyY12lwAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2YFx-0001TL-Kk; Tue, 27 Aug 2019 09:59:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YFD-0000xi-UF
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 09:58:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id c3so18127935wrd.7
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 02:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbdxbxYZcKVLdPE0Y/8WQgSXBgDUmbVqM2Rjtf0OVOI=;
 b=mOB8HFsHRuuCRYt9Kp+g2Vrx/KvyTnWXGglzhl804o2JfqJ/QDMeTgZoO+Ued+xtAJ
 TsIhTzlWDYZdbIWQcdYRQomzPGGDcnNvhXxY5ncQKWOpnCKWoaRWuZ8Vg/I7othlgGnc
 8UMoMLp1R1rWbJ9ya7spTIgvhPMIs0kwWyOxJYppM3Hc2stPXW/gJiRVeOGl9ICcfVOr
 JnOpENKyJyp37NeDesmyZP6FSvgqpY+YBz/ld3SmFp0pMHPad2BWgChIlhkMP3+ugTgm
 VyxwniLooNR/upSBilO/t4y9/bdbW2v+nwtyLjrOKOBljWrmUnAuJRfc+sCrxF07LpAq
 VulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbdxbxYZcKVLdPE0Y/8WQgSXBgDUmbVqM2Rjtf0OVOI=;
 b=CecblU4b2PBqfplhDdLLWxZwwbwAbNXTOVWCcsj8tGrSlBzDBCcyiDUK/ukzQ7ODh8
 EXJ53J2/1e+DbGePD2gitKuClSGMx6yzgIHPee4GsMplcuSY8cQGfep8b2tituyKh88x
 XbINGe6dsPESdu09PvwWDv6BW3X8fN+ayj3ug/+SZUj9kRnOA2dZpy3UzAF8IuDhiYpD
 YqNueMSr5yrpkwaRda2umcG/rII+qGUh9oDCTltt/UXbjGZNG+RF8i5zv426tYKS2sRL
 xJ+Opc95KnNtvP7/gX4K6q+CSsUyADStwf39BS6dSULwqynpYC/sluUSMD57KWpQh3oK
 gQgg==
X-Gm-Message-State: APjAAAUWxudwSHZC4JCs47paT3lvCjuOjkCufPd7BBTMziPH0me8u2eJ
 GcEZNWHD6HC7Cl6FAkSmyTmMmw==
X-Google-Smtp-Source: APXvYqzlJBCTaG+pE4o2jLBqQI6zVkgZsqDDyXOyYdI2n3XJFdcBqkqNW7xzsAxTdeooMlTarCQ78Q==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr2484026wrt.34.1566899910193; 
 Tue, 27 Aug 2019 02:58:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m6sm10862084wrq.95.2019.08.27.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 02:58:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/meson: add resume/suspend hooks
Date: Tue, 27 Aug 2019 11:58:25 +0200
Message-Id: <20190827095825.21015-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_025831_984807_AD680666 
X-CRM114-Status: GOOD (  10.14  )
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

Add the suspend and resume hooks to:
- save and disable the entire DRM driver on suspend
- re-init the entire VPU subsystem on resume, to recover CRTC and pixel
generator functionnal usage after DDR suspend, then recover DRM driver
state

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 2310c96fff46..dc573ffd1f4c 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -361,6 +361,33 @@ static const struct component_master_ops meson_drv_master_ops = {
 	.unbind	= meson_drv_unbind,
 };
 
+static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
+{
+	struct meson_drm *priv = dev_get_drvdata(dev);
+
+	if (!priv)
+		return 0;
+
+	return drm_mode_config_helper_suspend(priv->drm);
+}
+
+static int __maybe_unused meson_drv_pm_resume(struct device *dev)
+{
+	struct meson_drm *priv = dev_get_drvdata(dev);
+
+	if (!priv)
+		return 0;
+
+	meson_vpu_init(priv);
+	meson_venc_init(priv);
+	meson_vpp_init(priv);
+	meson_viu_init(priv);
+
+	drm_mode_config_helper_resume(priv->drm);
+
+	return 0;
+}
+
 static int compare_of(struct device *dev, void *data)
 {
 	DRM_DEBUG_DRIVER("Comparing of node %pOF with %pOF\n",
@@ -452,11 +479,16 @@ static const struct of_device_id dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, dt_match);
 
+static const struct dev_pm_ops meson_drv_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(meson_drv_pm_suspend, meson_drv_pm_resume)
+};
+
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
 	.driver     = {
 		.name	= "meson-drm",
 		.of_match_table = dt_match,
+		.pm = &meson_drv_pm_ops,
 	},
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
