Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6567DC7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:47:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3816B21951
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 16:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ta5NGIqs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Is62LuGc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3816B21951
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2cL/r6AAnH4EuVaMUayeqrRJ9KcusHLgF8baShquabY=; b=ta5NGIqs5uZiYcRwT+r8PzHvBf
	QJ0Yfkv7f3ZP2WPVdecNy5d0xbHq4elrFYEO5DjKITsuxDtnGzVliVV0MG2sTBBfQXz94A+ESZb9i
	zG5s2Kix2epw5CTz6pnSv2dsca5Zj3LlZSEqc2nk2P/wS8FIloEm99mdWSBaBUOR49O5IbGspV2li
	vDNl9XeLEQBS2LwC7s8JTH+ayR25G0fcv6wbqgoJZUyDU/L2I36SiccTacbT0QGq6Yujdgf3yZfQV
	3X9mtrsGTnqT0Yte4RlnemnMC0ed5oajEiYvNQbpnXJlgLnRmTk30NDTfF796TX0+YqkYzwqjbqTl
	J8fkX41A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqgtc-0008EM-HX; Thu, 25 Jul 2019 16:47:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqgpf-0004Mk-Cv
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:43:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id 207so45606398wma.1
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mMLWTpRyQOIhO2zBKiwG8296jQFE+BtYZV6zzvxEPl0=;
 b=Is62LuGc0BmnvvmbpBU+xVb6noxFfGphUlBMiZveEOXCmAKXoPdXIPTSEssvRQ34s1
 QzU5bh9h8J55jfMBytlBPFy6Iqc6MwejQtZ+qDEsWEVgrhjwyruTWyYleHwZ4anoiAPq
 KzhnbK4frlZITLBbh5jK7NjEi8keSvszPpxuSh6l82rNgg3nDQqDFaJGWdADwEOIGM4Y
 rV4zRxC6aokyakx2qnP2Cii0goc72HfCbc8CDJRLwFRIplm0FypPvRidpk/HZw/w32wP
 HECv44Cs94gzVylVj3/0vTt7HgUnAyh4mkYHAdIdiVoerE3cCj+JP7jFNp52DVD0oyWU
 6t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mMLWTpRyQOIhO2zBKiwG8296jQFE+BtYZV6zzvxEPl0=;
 b=L0qy2x5RIRior3xzrLceI0aewP9BQ3oe9RqZblC8OQadc2Iu+sQyuNjHBD12vqXH5H
 qhenWbuzgwMxB/G3Gq8ooLmTxT4uuKOO+CU+JlgsxVlXcYu2d8C2BCBdeDJmKb1awk/i
 98UK5iqO9PErra/VukiK8a26jNsKEhejk4FS3xPEOljmY2AZGVhKFIJU8jzVxkEhodLr
 M8Nx3TuDRVHTMidQwO7xKUG4aWSrVpOaMMj/w6WBcmdArslubbEyd66lwCAHVZ46/DGG
 R5CHFUOh0f1fYa6ljauwPcmBZGSWbHxOnN/XMffKcqiDy+KuUGPD/0w2T+8EHi+eXfRM
 1aTQ==
X-Gm-Message-State: APjAAAXCn0Eenz3AK+CTAMcselTNd1p2rFDQ8gwD0nTrjRDwHonTJRjW
 TjjkzAbuAvgmBmAhG98ubuEEkg==
X-Google-Smtp-Source: APXvYqy/hW7JIa1298EywLJf5h0MYenaQL09q4MVqbon6wyDqqejH9zoPdH9EExeziayAgzU00wSDw==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr82333298wmf.111.1564072985966; 
 Thu, 25 Jul 2019 09:43:05 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
 by smtp.googlemail.com with ESMTPSA id 91sm103031727wrp.3.2019.07.25.09.43.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:43:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH v2 7/8] clk: meson: remove ee input bypass clocks
Date: Thu, 25 Jul 2019 18:42:37 +0200
Message-Id: <20190725164238.27991-8-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725164238.27991-1-amergnat@baylibre.com>
References: <20190725164238.27991-1-amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_094307_656750_AAB70711 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

During probe, bypass clocks (i.e. ee-in-xtal) are made from device-tree
inputs to provide input clocks which can be access through global name.
The cons of this method are the duplicated clocks, means more string
comparison.

Specify parent directly with device-tree clock name.

Remove the bypass clock registration from the ee probe function.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/meson/Kconfig       |  1 -
 drivers/clk/meson/meson-eeclk.c | 10 ----------
 drivers/clk/meson/meson-eeclk.h |  2 --
 3 files changed, 13 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 178ee72ba4bc..72a37572501f 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -38,7 +38,6 @@ config COMMON_CLK_MESON_AO_CLKC
 config COMMON_CLK_MESON_EE_CLKC
 	tristate
 	select COMMON_CLK_MESON_REGMAP
-	select COMMON_CLK_MESON_INPUT
 
 config COMMON_CLK_MESON8B
 	bool
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 6ba2094be257..a7cb1e7aedc4 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -10,7 +10,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 
-#include "clk-input.h"
 #include "clk-regmap.h"
 #include "meson-eeclk.h"
 
@@ -18,7 +17,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 {
 	const struct meson_eeclkc_data *data;
 	struct device *dev = &pdev->dev;
-	struct clk_hw *input;
 	struct regmap *map;
 	int ret, i;
 
@@ -37,14 +35,6 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	if (data->init_count)
 		regmap_multi_reg_write(map, data->init_regs, data->init_count);
 
-	input = meson_clk_hw_register_input(dev, "xtal", IN_PREFIX "xtal", 0);
-	if (IS_ERR(input)) {
-		ret = PTR_ERR(input);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get input clock");
-		return ret;
-	}
-
 	/* Populate regmap for the regmap backed clocks */
 	for (i = 0; i < data->regmap_clk_num; i++)
 		data->regmap_clks[i]->map = map;
diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
index 9ab5d6fa7ccb..77316207bde1 100644
--- a/drivers/clk/meson/meson-eeclk.h
+++ b/drivers/clk/meson/meson-eeclk.h
@@ -10,8 +10,6 @@
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
 
-#define IN_PREFIX "ee-in-"
-
 struct platform_device;
 
 struct meson_eeclkc_data {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
