Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9847CC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 695AC2148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o0+/Gw6w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DZRohqHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 695AC2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqpDXS+P9GinPmVCOAQgNYY19rrBxasJ7q9ab9mFxZY=; b=o0+/Gw6w4A/KIl
	gUIWU2DOlOcvbW6vnLdZ84NP6rvjjim8JchlLmOaeZgP06cIB3uC8NECh7visZO9rLVRbiFYPrUWU
	zEq6m6snCUylfQBmfZmxkQsz6qRC8DwaljSbtPxoQeeSZUeVR49NndH2hUGxAZ6NixW6OPxJ4Mpi3
	a6gGq45xe/iCvXGMlBIkztLJoNMLAsF7JQnbSSqHLVVFKmIdP7bbJFc3aFPghzuS+GK1potjSMtTK
	uL4VYzMk2jthJnP8bg+UGGq2Cn1pkh+0RIU2d81vxt+K9XXNHYgIctRO3zgnkOXz46Bt/q2eKEbTk
	QOXK15k+DGxISqAOysgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBJk-0007Cc-3F; Mon, 28 Jan 2019 18:07:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBHI-0003sm-EM
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:05:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id l9so19066755wrt.13
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfZJrxviN2mrWGaw9zsAtuOhyPzZmaPcT+0QlJs+SzE=;
 b=DZRohqHnFjCPLcPusvGC1vo/rl6Xg8ExudFyc7H3YniqegXwjGo/28v+UVpx4Ei0Zx
 i3bs5HwV0B1UzqcXKi5hrawEFXt7NOuzQjrQTnDK9sdblOCmNHzO4JzAIngRzE93vwg/
 BYmzMhEzZkyC+o5b3YOdvkBGUU1gInfREiHApCmTUD8U0LBNwSr2QBxsxDFi3ysyZoV5
 yGBW1mWypPPlWqPZ34RaI9Lm/OpEDfSbgfM24fpZmnU9HbxpbA6hdElxtfJ2qCgbinen
 zVOALcJQ7m0j1rxuZREhPVqE0a/Jqv+lb6GYqLUYSlwlBIrIoiYZJIUVgf29gNpPuvTS
 J+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfZJrxviN2mrWGaw9zsAtuOhyPzZmaPcT+0QlJs+SzE=;
 b=lqKbkPDBpt4/lFrHXE+ltEuJ3+mgxxvK/g+wnlujSSfdBomQjoXTX8tarV056Z/rfG
 7SoGR9atxcAgXOWEdLNrI7SbGTN9FH37REqcvJp6Pnz0ko8ESrmKtG7tP3DJYSODS4oL
 AXzcx+EenvIEqxc5mNzeDkyJw3lKYHBdH3S0dmEnTiy59XoyULNEg4A4R5oBlDumdxNw
 83YwRBoihS4aMWAhZGfQxFFl5ePCSKWcEWoCoYXvCV0qcK1zMJAAvSKMiWuuJLHjmZIA
 8y+zsjjxsF3/GGURGh2VCey1zCgMsmIigWOPg5boKqinTERHfjkd7yOJSSLBr2yDq+BC
 4k0A==
X-Gm-Message-State: AJcUukczyVtJLXX4PJw0MdWtEiepOyVqAVi54txEAo4/vNZBV2+1ag99
 IDmyQmR2WmCVQTC5hfesKAUeow==
X-Google-Smtp-Source: ALg8bN7rc1FqBP6q7WHfC7vdI22OJgwmrgEzhl5DkIU0wmie8x73jzhGTOYrbqYrzK7s7AvEiSgiCA==
X-Received: by 2002:a5d:6487:: with SMTP id r7mr23494046wru.263.1548698698767; 
 Mon, 28 Jan 2019 10:04:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:04:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 10/14] clk: meson: take dualdiv out of clkc
Date: Mon, 28 Jan 2019 19:04:26 +0100
Message-Id: <20190128180430.28689-11-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_100501_343509_B3DBB283 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c   |  3 +++
 drivers/clk/meson/clk-dualdiv.c | 10 +++++++++-
 drivers/clk/meson/clk-dualdiv.h | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h        | 19 -------------------
 drivers/clk/meson/gxbb-aoclk.c  |  3 +++
 5 files changed, 48 insertions(+), 20 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.h

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 5701f5840b75..6b408edb1608 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -16,6 +16,9 @@
 #include "meson-aoclk.h"
 #include "axg-aoclk.h"
 
+#include "clk-regmap.h"
+#include "clk-dualdiv.h"
+
 #define IN_PREFIX "ao-in-"
 
 /*
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index 4d9e161de627..c5ca23a5e3e8 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -22,7 +22,10 @@
  */
 
 #include <linux/clk-provider.h>
-#include "clkc.h"
+#include <linux/module.h>
+
+#include "clk-regmap.h"
+#include "clk-dualdiv.h"
 
 static inline struct meson_clk_dualdiv_data *
 meson_clk_dualdiv_data(struct clk_regmap *clk)
@@ -128,3 +131,8 @@ const struct clk_ops meson_clk_dualdiv_ro_ops = {
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
 EXPORT_SYMBOL_GPL(meson_clk_dualdiv_ro_ops);
+
+MODULE_DESCRIPTION("Amlogic dual divider driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/clk-dualdiv.h b/drivers/clk/meson/clk-dualdiv.h
new file mode 100644
index 000000000000..4aa939018012
--- /dev/null
+++ b/drivers/clk/meson/clk-dualdiv.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_CLK_DUALDIV_H
+#define __MESON_CLK_DUALDIV_H
+
+#include <linux/clk-provider.h>
+#include "parm.h"
+
+struct meson_clk_dualdiv_param {
+	unsigned int n1;
+	unsigned int n2;
+	unsigned int m1;
+	unsigned int m2;
+	unsigned int dual;
+};
+
+struct meson_clk_dualdiv_data {
+	struct parm n1;
+	struct parm n2;
+	struct parm m1;
+	struct parm m2;
+	struct parm dual;
+	const struct meson_clk_dualdiv_param *table;
+};
+
+extern const struct clk_ops meson_clk_dualdiv_ops;
+extern const struct clk_ops meson_clk_dualdiv_ro_ops;
+
+#endif /* __MESON_CLK_DUALDIV_H */
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index ece8ed82b11c..24918cc5fa58 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -11,27 +11,8 @@
 #include "clk-regmap.h"
 #include "parm.h"
 
-struct meson_clk_dualdiv_param {
-	unsigned int n1;
-	unsigned int n2;
-	unsigned int m1;
-	unsigned int m2;
-	unsigned int dual;
-};
-
-struct meson_clk_dualdiv_data {
-	struct parm n1;
-	struct parm n2;
-	struct parm m1;
-	struct parm m2;
-	struct parm dual;
-	const struct meson_clk_dualdiv_param *table;
-};
-
 /* clk_ops */
 extern const struct clk_ops meson_clk_cpu_ops;
-extern const struct clk_ops meson_clk_dualdiv_ops;
-extern const struct clk_ops meson_clk_dualdiv_ro_ops;
 
 struct clk_hw *meson_clk_hw_register_input(struct device *dev,
 					   const char *of_name,
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 510b6a7d2f18..26578622fc91 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -9,6 +9,9 @@
 #include "meson-aoclk.h"
 #include "gxbb-aoclk.h"
 
+#include "clk-regmap.h"
+#include "clk-dualdiv.h"
+
 #define IN_PREFIX "ao-in-"
 
 /* AO Configuration Clock registers offsets */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
