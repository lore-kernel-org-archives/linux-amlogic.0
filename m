Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F86FC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:47:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC3D2075B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3a3rg5FM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gI9bAnr5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC3D2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nh7r3WgGJRvhc9N9/UZKlSNJsRpuZ4OPwEfRjJ0Thds=; b=3a3rg5FMXUFuGS09ONEugyr16d
	fiOu+wo9Q6ywt9jX4UwLpmiMIgK8CyyUrAjLBBa/dvwmuNyc150uO4HqtjGlQNt/FepYashsVcVbz
	1I6zy8Q0UCOqyv40L0NhH8ZOQtbwW/51SU2c1BTtso5mMO7bmINy/uQOlMbizWmuBoeHiwTNuWwdL
	qWRrBUQ+TU/iW+RgsOGlpQJ6U1I+KbuBYxoHepkKWYBEIOw6NzfKWmarm8xwveSiWdreTREL28e7K
	zevsGE0GiZTGybKFfvY45vSn/pfvkt9vi2+LMl3tPgWGTwIiYLNNUqtFVG0GG3FKp5IFHtev62bM2
	IbLyzfug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBgbP-0005Wq-Mh; Fri, 28 Aug 2020 15:47:43 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBgbN-0005WL-7c
 for linux-amlogic@lists.infradead.org; Fri, 28 Aug 2020 15:47:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id q9so1374371wmj.2
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Aug 2020 08:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOjcUQAzjdKMUBQz9pCR37JmdK7LsMO1KAx1BuqAcUE=;
 b=gI9bAnr5JSfBRzzwqqeFQeZ+TmOK38nNFBQuIZSuzWnTnYJXoBTgAVen2uftuz8FEv
 ZjC0A7+hOfbC2b7mLHY1Qu/RAunI+aiI4BGFFlIQxrAZPfADnPQPAY7Zy4HScXQd//on
 m5vQgTPdOMuJ37l/5TnqUF32EQXXkNXeg4q0odzYqtEPmPm8lyONoJ+rhVImCRFP2ID+
 j/rFOjVBYWIEo15+8iYb0UYiUyIS69HOfYFBPrJmlOrZCvetbcBEl6ZwSSBtExKR+K+6
 99QIEWse2ti/ufQnkbYYRyi777IkFAWLnv+wCcLQH1yYcxBgObBqiXaHT11opun0faBO
 LMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOjcUQAzjdKMUBQz9pCR37JmdK7LsMO1KAx1BuqAcUE=;
 b=dxV7AJwV5gdR293XHLKn1JQwrpbAt4XxMjc1v8B+YPo+LmvMuBAKpE4IZ83qkiwh6o
 OPJe/nrjFg1OFS6RIiRc2NdvfNLxX7+wkfxRkJcEqKLqqLJVYdb5Pdh7UzMII/+BD4RV
 I5pAnijphm9zP3OTO8hyyJp8sKYNPZVrz7aceFtYt8AmlHR6ILKrn55FIu92bo/Iysdn
 SiGONvmEuapoJihYO36n/IVcgARtcNQcytun2Yqq0RLX2jpWQJCRwJaYKPeEMVe/9Trx
 AAbM8dmXKiakiQDxGB0n/z17yuXBqxWArQOXgWXrV/CiiP3KWdXoDC5v2x77hxGtMMfk
 5LiA==
X-Gm-Message-State: AOAM53395rCT+Cn9mUGTxVLHx/afWGlWzkVgvjyvsGYqQRgVG1gN8til
 6b0XzK+jC1LQ6BsQzlmRSJALsg==
X-Google-Smtp-Source: ABdhPJy5BerRgM4DpFWDQXDmijD30b0WFwUdB+Kqn2qC0AshshLhhAKK/GeM24eNPwjyGbElVhe2ew==
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr2127732wml.169.1598629660269; 
 Fri, 28 Aug 2020 08:47:40 -0700 (PDT)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id l1sm2921646wrb.12.2020.08.28.08.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 08:47:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: meson: make shipped controller configurable
Date: Fri, 28 Aug 2020 17:47:35 +0200
Message-Id: <20200828154735.435374-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_114741_283856_53AC6EE2 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the necessary so bits so unnecessary amlogic clock controllers can be
compiled out. This allows to save a few kB when necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index dabeb435d067..034da203e8e0 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "Clock support for Amlogic platforms"
+	depends on ARCH_MESON || COMPILE_TEST
+
 config COMMON_CLK_MESON_REGMAP
 	tristate
 	select REGMAP
@@ -41,8 +44,9 @@ config COMMON_CLK_MESON_CPU_DYNDIV
 	select COMMON_CLK_MESON_REGMAP
 
 config COMMON_CLK_MESON8B
-	bool
-	depends on ARCH_MESON
+	bool "Meson8 SoC Clock controller support"
+	depends on ARM
+	default y
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_MPLL
 	select COMMON_CLK_MESON_PLL
@@ -54,8 +58,9 @@ config COMMON_CLK_MESON8B
 	  want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_GXBB
-	bool
-	depends on ARCH_MESON
+	bool "GXBB and GXL SoC clock controllers support"
+	depends on ARM64
+	default y
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_VID_PLL_DIV
@@ -69,8 +74,9 @@ config COMMON_CLK_GXBB
 	  Say Y if you want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_AXG
-	bool
-	depends on ARCH_MESON
+	bool "AXG SoC clock controllers support"
+	depends on ARM64
+	default y
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -84,7 +90,7 @@ config COMMON_CLK_AXG
 
 config COMMON_CLK_AXG_AUDIO
 	tristate "Meson AXG Audio Clock Controller Driver"
-	depends on ARCH_MESON
+	depends on ARM64
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_PHASE
 	select COMMON_CLK_MESON_SCLK_DIV
@@ -94,8 +100,9 @@ config COMMON_CLK_AXG_AUDIO
 	  aka axg, Say Y if you want audio subsystem to work.
 
 config COMMON_CLK_G12A
-	bool
-	depends on ARCH_MESON
+	bool "G12 and SM1 SoC clock controllers support"
+	depends on ARM64
+	default y
 	select COMMON_CLK_MESON_REGMAP
 	select COMMON_CLK_MESON_DUALDIV
 	select COMMON_CLK_MESON_MPLL
@@ -107,3 +114,4 @@ config COMMON_CLK_G12A
 	help
 	  Support for the clock controller on Amlogic S905D2, S905X2 and S905Y2
 	  devices, aka g12a. Say Y if you want peripherals to work.
+endmenu
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
