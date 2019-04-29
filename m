Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3FFC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 10:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACF72087B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 10:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kg2Oj7v9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sNu4hws/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACF72087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P57kC1shQG3WVOo+hDBZ8RJMJdhmXzCfIziT8QNZeAM=; b=kg2Oj7v9dRwead
	I0bIcLG41h+efaPUadRmsdEN1kFK96SzB81DL9ziOfV6m5KFvUHkAmNIKgT/0KjX0Adr43jWCb/IB
	OO3ggwxZ2rr36s7xGyiTKqGNyd++PHuR6o/4QZurRzdZTARWZcSN23c5vhzw2whFx0IJNWrv9dVOR
	Umt9lTJTQCWZrLA8i5OZsb/1/pd3PFRJHxl/v6neLu2ClNvrQsoGjm7iItySHRrWuRJBnAKIKoWMS
	ffO/9p8/nrNPeon6grZ+vjWt5QIaHyFYJr89TRXwHl88JHIfSpu2gIC/hPY+zGXoY33Cekg3V7xpV
	FiwmTU0tvnAQ6mGLLtyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL3Rn-0003EY-Gx; Mon, 29 Apr 2019 10:23:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL3Rk-0003EB-ML
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 10:23:42 +0000
Received: by mail-wm1-x342.google.com with SMTP id b10so645071wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 03:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9U654s0y3/OTSiMoK1+3nXkaUK985F53Lm18Cxpkwjw=;
 b=sNu4hws/TaY8GaFc8dyvmg+FW5/ryQH20TEta7WDZ6DNboRsaDEJ1G5g+3QodO80lz
 yWV2/U6H+LDyxFWVETn1tW+Yy/z5WDXiuFOmveVhzrLUwJJGcmABzlsUaDfMCXY6mhTn
 BJALXTC/JxKGC3cGGMd1rRALKsv1IUYXlqaFZ73NOVXK+AXa6w2tfgnkzQVirczoMYbJ
 l0tAobCAA5vMUdM9a9UFg9BW4e31Ychs932Icrlkj0pg/0xjUs66axoWRZP/1xTBUf75
 VCTq01XreUR2RV5J4OZxSdTg0HT1aU2Y6JpcsQdX3m1wOqAdeSDGfvjR/LhTYBxgiA8P
 W8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9U654s0y3/OTSiMoK1+3nXkaUK985F53Lm18Cxpkwjw=;
 b=tUEBjQgdlswWZNlZX/hieW/wXkJxFKl8BaTxx1h9C2FwYvos6h/EYZojLjRN+K7eex
 oaqeR6GDK3d56cMJnnVN3uqyjLr89E6dJyft2kPGxSoZ0q6MpS+xlWNIy44qYH8HUWDA
 9Ja6ac9req8l6zI2GKZU4S8tvp700pYSQvx62iEmXHFVhEw+rM5lesXEzCHGTRXE2mGW
 PVpsz/2IL0qK1gt6TIpjH7Y/uAfpmXhmISkMhvQZjtm36SYHC5gudrdawAxEYcUaDRwr
 pnIrFX+uQwrdAhXVWwipGWqDM7BIVS2FSSg19+MYXoRMZR8oklNd6jw/tKCBiV9K4pz0
 iNTQ==
X-Gm-Message-State: APjAAAUagoNMRpQ8X41/34UuE7crn8BRJXFKSUVVjjn1Kff2eGJjg3Q0
 TptskvQ72mJYkqu6pvA4ZO5nnLolRZg=
X-Google-Smtp-Source: APXvYqzuIr088WqVnUik2HpohJ2FvVRToR12zoB533mbajPOk1tDXuO2RvmDLe+JxMnff/DpTnJyIg==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr16865079wmc.148.1556533418772; 
 Mon, 29 Apr 2019 03:23:38 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m25sm1598874wmi.45.2019.04.29.03.23.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 03:23:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] drm/meson: imply dw-hdmi i2s audio for meson hdmi
Date: Mon, 29 Apr 2019 12:23:25 +0200
Message-Id: <20190429102325.29022-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_032340_731845_3AFD2932 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 dri-devel@lists.freedesktop.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Imply the i2s part of the Synopsys HDMI driver for Amlogic SoCs.
This will enable the i2s part by default when meson hdmi driver
is enable but let platforms not supported by the audio subsystem
disable it if necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
index c28b69f48555..a480e4a80bea 100644
--- a/drivers/gpu/drm/meson/Kconfig
+++ b/drivers/gpu/drm/meson/Kconfig
@@ -14,3 +14,4 @@ config DRM_MESON_DW_HDMI
 	depends on DRM_MESON
 	default y if DRM_MESON
 	select DRM_DW_HDMI
+	imply DRM_DW_HDMI_I2S_AUDIO
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
