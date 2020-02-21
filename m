Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09FCC35647
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A13FE222C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XxR/bCaL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CS/oR3AB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A13FE222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zo8HGxvyJa53Msa50njG9lpEhxmtnwBAsDgVJs413eo=; b=XxR/bCaLsBQCyV
	fxcEkssbJCbq5Tnl/VD8AbLIb06gKrjxHwlST6QfoZJJsFdhn0xZ076CYL5+IeHZeAwrCAIpqkXCA
	vlVZejbYs8U+QxKNdfqf0eh9Jgm63wWzvhUQh6wGCMWtuFU0grQ35HGPxVnaQx38P0SfYzf97pRox
	x2ZeMkgPTU/mPOzZOdy4fijZqYyPn3HCHXGgRno/lvOZKB3L/wCMhDROFVTqBb7cotsrixjJV4S/P
	wL55U2Ro7cyDdTC8CJeSvVofNB18HQaAe2xdPEYWNt68aXksU+gyi/AL7/S8565sEOSKU8lUZJ/KX
	gJoqHU0SYIOFlsEaXJ9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j57A5-00032k-4y; Fri, 21 Feb 2020 12:12:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j57A1-0002zj-4e
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 12:12:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id g3so1764130wrs.12
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
 b=CS/oR3ABVm90GOGwxlesbU5UaRDqDi4937vJIZTYLNgqFuONm21aZHfScF1yfn5sAO
 xdxwA0HkcqUqTryI/sndrYYXkvoPVOAFhEEC3AzBENzt3TA3GfZ5pbXcjskloGHkCTpZ
 a77kpInQpoS3R/nE1wh7iy1tE7R+PB8uZsyNSP/TNDZLndcmcCGV83fW63VZdCSbFDkb
 dGQ/VBQeP6CBnmYAGuZN5H+5VLNTKx9sdLzMAjP/uMS0dgHQej5Z7MhJVnrhhgiIJJ78
 QTReeJZnSZTQJRREy+l5X1Q9RwN4MNBQQw37iC78fTKYq6khyXtgU9FsErbddnK5PQ2+
 ZUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hS96wgt/ER0zqCa5SCOVpu61bVnBbfmDRQTyUX2IrAg=;
 b=aIEAZZ19G0HNVYqhoPPBuFLqd6otP5zUFMMaWWGeqiffziCDOUIvGWEVk47WntHgHE
 6DypC5RGlFnhcpdOiwMTKePKhRFh7bNuh5ZF6qDcjJuHz6XyULqmqCF4pSlpyXE8E0vC
 /nJIFHOmv8WQ9Dqe7veHbL3/1PnrjN6Jw5InoGtkdEEpr9tjmo7luhtykIusAhYw2LHR
 24HX0jBuwiisMsWWxIg/IDC6GAuIsfFyke1YSwuLNk0lqq5k9x1JfK+02p6jbf+HDeck
 CuW88ZCfzjyueE9z8XnYw3aErhD2sB/CbjPDoNun6pTmXDgflJt80mzmro0OSqu6Al8c
 k+Yw==
X-Gm-Message-State: APjAAAXQ1Uf9KAt8yOcAV831kdplaCYOiUxwhgH4mk6jr+DPImUpQgmA
 j42ItpSij4prY7j9ta26C5UGlg==
X-Google-Smtp-Source: APXvYqwYh4N7wz2XscGcCwMNShVzzwC6C2HoeJjKHoDg8DxmO/DkVmrmpDieYviHEdy0nbFzFz8hSg==
X-Received: by 2002:a05:6000:108b:: with SMTP id
 y11mr49634195wrw.187.1582287119261; 
 Fri, 21 Feb 2020 04:11:59 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w22sm3553127wmk.34.2020.02.21.04.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:11:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: g12a: add tohdmitx reset
Date: Fri, 21 Feb 2020 13:11:46 +0100
Message-Id: <20200221121146.1498427-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_041201_231812_43717AB2 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index f8853f2fba08..9b2b59536ced 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <sound/pcm_params.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
@@ -245,6 +246,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	void __iomem *regs;
 	struct regmap *map;
+	int ret;
+
+	ret = device_reset(dev);
+	if (ret)
+		return ret;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
