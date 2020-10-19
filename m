Return-Path: <SRS0=NVL0=D2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68BE6C433E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 14:48:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38EE2224D
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Oct 2020 14:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmoTLEZj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B0exkIpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B38EE2224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gfXB+j8l1l0tMvPjVrEB+JE/Nsbcs2Wg3DiL3YyeAD0=; b=AmoTLEZjvbvsaikNyOGW4cRERo
	cCuF1jwoj6EfHyc7b/RCTjpSWDNIYwkiyvWX3k9f50cms0nsMcKaXrBqKFa/4RLAeFqKlGELBuu66
	8DvesXYLKbDVn9eZwmreZF5zEfM4ouombaqMgXfhUyZBBXbXqkV9/OQVhmOlPjYnk3MlZ+qA/w96g
	rvb4BlW5nVqmWlL6bSJwYrw2+XpqlaMiThiBMbfv+mPeXCNdGNcMM2FoA8BCswgSSxx3nBEDGvkJZ
	kZFB4GKSRLIHqLNIE/xXgRRSzEVfqFxV/HdcFgd5koYFx1zVHUmHBo0CiJpAatUWWjy1UCJAMSTwI
	PfTCjA0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUWSb-0005sr-1t; Mon, 19 Oct 2020 14:48:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUWSO-0005ng-BP
 for linux-amlogic@lists.infradead.org; Mon, 19 Oct 2020 14:48:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so48783wrl.3
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Oct 2020 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IByM6fAwfV36/UB3A2tjIml0N5VQ5jxPxkeC7coc2Zo=;
 b=B0exkIpg0jMlPZlUstcDD5IUDvafjKZ0dLq9ENV4r1ik//YotB6f5RDT3Zlsrq3ksL
 Cy0Ah3L2cdAUA/f7e0k39eR40fAnLIkY6l5PzanT45X0tYhCkVaN1YtmcnsYMP3XAs7c
 mSxsP7lSE/RsvWRc3LjojkCUZXMUNqvOwLD0YVyG7neHJz1HSKSD9dFdN8xE1k//L63T
 ckutiqsTzwdREsi+ewYourmbEmfPMLTc2n3lKA+xiTH8Z4fP8V7Z3SovGtrd31G4I1gH
 K2EiQxzBLgl7qUUWMrq8wN6A5/8nuazOrZ4hkwUPhoNyFrgx/DiMTClXCwTsRK+6NFq5
 2WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IByM6fAwfV36/UB3A2tjIml0N5VQ5jxPxkeC7coc2Zo=;
 b=fHbzmN44u041oU9TlMHrRlXQxPJXWOXGMvOQ0NTTYYCsyw2KpJ4NP1L7mHJ6RnMXrs
 zQ5U+RPMtbnIIVoR9DtJIPJ9Kh5E7WldnWqmYT1P8g4ky+j4/J41f5i1jw3O4pePgSYJ
 SaT369inxFfHihrkH8G67pOVO+t92DLHa2yo6akF7MPy7MQzd1iwTUkIRlEyKYPUHppU
 jMfJzLgYzOnQ9J+wbi+btqlqyAMFlxgvNr3jMuSCysjSlaBWm2b9HU97m975emsR4/KU
 aNkXtKhFs3GyEFgEEAYL8lKmNfbZ89v0270f9QPz3xCx0iN287L0v+BIthQuzqd8GD4u
 4wCQ==
X-Gm-Message-State: AOAM530nQPpd9Q87Jj+tl9Vf9vyHbpzaYJOXDLMyb+U1h9i12QxF8APo
 iX2QgNjJ6Nl2idzEhoPK1dfS+w==
X-Google-Smtp-Source: ABdhPJyV1Y3VAHw8VVM4EZvMv63AARzDLXjLHn4YWRX67f3y+tTQEujcWlBoxLgd5gIIkgCKnNmQbg==
X-Received: by 2002:a5d:4c4b:: with SMTP id n11mr19735303wrt.171.1603118894402; 
 Mon, 19 Oct 2020 07:48:14 -0700 (PDT)
Received: from bojack.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v6sm334971wmj.6.2020.10.19.07.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:48:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: p.zabel@pengutronix.de
Subject: [PATCH v2] reset: meson: make it possible to build as a module
Date: Mon, 19 Oct 2020 16:48:09 +0200
Message-Id: <20201019144809.943608-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_104816_443410_77C81CAA 
X-CRM114-Status: GOOD (  16.57  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the reset controller driver as a module.

This partially reverts 8290924e ("reset: meson: make it explicitly non-modular")

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
Changes since v1 at [1]:
- Fix Kconfig depends
- Add missing MODULE_DEVICE_TABLE
- Add kevin's review & test tags

[1] http://lore.kernel.org/r/20201013133943.412119-1-narmstrong@baylibre.com

 drivers/reset/Kconfig       | 3 ++-
 drivers/reset/reset-meson.c | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d9efbfd29646..9a36111cfd2c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -94,7 +94,8 @@ config RESET_LPC18XX
 	  This enables the reset controller driver for NXP LPC18xx/43xx SoCs.
 
 config RESET_MESON
-	bool "Meson Reset Driver" if COMPILE_TEST
+	tristate "Meson Reset Driver"
+	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 94d7ba88d7d2..c9bc325ad65a 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -104,6 +105,7 @@ static const struct of_device_id meson_reset_dt_ids[] = {
 	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
 	 { /* sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
 
 static int meson_reset_probe(struct platform_device *pdev)
 {
@@ -142,4 +144,8 @@ static struct platform_driver meson_reset_driver = {
 		.of_match_table	= meson_reset_dt_ids,
 	},
 };
-builtin_platform_driver(meson_reset_driver);
+module_platform_driver(meson_reset_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
