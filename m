Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81A9C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56912148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b9Ov/4Z7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UNS3dypv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56912148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiO9bo/nbFRmg6685V0nY5TpgnUuspaGyfx5Ybmtre0=; b=b9Ov/4Z70VSVNU
	y7n4RfdxK4wvI3SgU8l4XtHWLBE5ug8c9/dPr4P+BFUzw/nx2ca50TFFgxqgT1ZAcvj/FyhEcsV1P
	l4npjCmHhcUPint9/ov5oa3AcM/sL7cIw72KDH3IHVXSpk7/VHHIINgcqeEApLZaygAzUyA6BDp0o
	6deP6OyOSyLLjk0jgcZjB7iiINwpUOajJx7nZwQrNnXj5ld1MzeKPHg4ySnpeq9Vzp+RoSZiJfiTT
	1z+LfZUffguHNbBG/R/ET3dqtraoWrJ3oC0dJGQfzX9N0D6cSPS9lfMC2KtNd3bY2Rd2yp5ObtaAj
	K66/2V/7v05Fps/qz4YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBJZ-00072s-BM; Mon, 28 Jan 2019 18:07:21 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBHB-0003kb-Hv
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:05:11 +0000
Received: by mail-wm1-x344.google.com with SMTP id d15so15019987wmb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOU9VANN01oYzixQ2SqSDGpNeAWTMaXr29IPiC4ltR8=;
 b=UNS3dypviQhzKGAyIux4UBVegpH8d7NnTH48r9ub3dKe9mRrUo+mRzH4sNRPwL6uK4
 6DSUHtr+GsMJymI6ZORqhsVF9P1vbBgdqSCge4pF+ucLmwH2YPlv5/z4TtVPXc5mDeGa
 iz1m6RQaZblm5tpS0L6syaeQ9TwMpNVNQUyWPVKdHv5LHfp33X3Y8z8AA4OcMZHID5Vl
 zDiJK2qKneL+X/wsE6ecETzast5Su5MvCi9kuBxgvQaSTlznO9TvcLpNT4cExn9iMa85
 9+nHj3JEHn9U31H3kkjbc+FEFbyhIS7Q0nuNf/eaZMIUA8ajQLF3NbJjOmbxbk2/t5KH
 ZxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QOU9VANN01oYzixQ2SqSDGpNeAWTMaXr29IPiC4ltR8=;
 b=PJXzPyUBnKhEV7sv87CEZKWaCTOa4nJaACub1Qt6TOfnW6Zhcm8DF7k7F/xqqOXSQ3
 Er9zixtZ9gyZSkWQdRBGFuL0MPE5SfRYdB9wZgmhD47gFVNFE4XPE4hiBIpwFn1cgD51
 EfzSgk5o8cgefyvtiVibDrkDQhoOURYulLpChkajYchVFwGYnScilvJ05ftKzU8Uo3Pd
 qA+zbrtCyBV8hrQraifx+72FIqwNlvP8GD3Cp8slqeacQ4kIXXJMbCBDwqM3R4LJNJSw
 Xu38sIJjcioqVKEPdKJD7HmMvl4BnCdnhjpBSIAjbSvC2iC/+LPN7RR8A0yIUQSybLAu
 0QQA==
X-Gm-Message-State: AJcUukfCH1AOZodzX7XMJ/n9YXcQU0GdHmyok+1t4ZmBc67jp0/82kKp
 R0vskZ+CTVh7pcVmyHIW7G7dSQ==
X-Google-Smtp-Source: ALg8bN6h3EwqtJR6x17PMVrJ85/8l7BNCc5PY79he82dxcUyVCCBRReX+tqR/ulVAdlmpVEeBcQHLg==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr18991607wmg.53.1548698691559; 
 Mon, 28 Jan 2019 10:04:51 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:04:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 06/14] clk: meson: take the pll driver out of clkc
Date: Mon, 28 Jan 2019 19:04:22 +0100
Message-Id: <20190128180430.28689-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_100454_071755_493CB700 
X-CRM114-Status: GOOD (  15.20  )
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
 drivers/clk/meson/axg.c     |  1 +
 drivers/clk/meson/clk-pll.c | 13 +++++++----
 drivers/clk/meson/clk-pll.h | 43 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h    | 30 --------------------------
 drivers/clk/meson/gxbb.c    |  1 +
 drivers/clk/meson/meson8b.c |  1 +
 6 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 drivers/clk/meson/clk-pll.h

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 474412234633..8a3896fa343f 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -19,6 +19,7 @@
 
 #include "clkc.h"
 #include "clk-regmap.h"
+#include "clk-pll.h"
 #include "axg.h"
 
 #define IN_PREFIX "ee-in-"
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index afffc1547e20..4a8c68ae8801 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -32,11 +32,9 @@
 #include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
-#include <linux/string.h>
 
-#include "clkc.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
 
 static inline struct meson_clk_pll_data *
 meson_clk_pll_data(struct clk_regmap *clk)
@@ -309,8 +307,15 @@ const struct clk_ops meson_clk_pll_ops = {
 	.enable		= meson_clk_pll_enable,
 	.disable	= meson_clk_pll_disable
 };
+EXPORT_SYMBOL_GPL(meson_clk_pll_ops);
 
 const struct clk_ops meson_clk_pll_ro_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
+EXPORT_SYMBOL_GPL(meson_clk_pll_ro_ops);
+
+MODULE_DESCRIPTION("Amlogic PLL driver");
+MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
new file mode 100644
index 000000000000..5ccf0854d932
--- /dev/null
+++ b/drivers/clk/meson/clk-pll.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_CLK_PLL_H
+#define __MESON_CLK_PLL_H
+
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include "parm.h"
+
+struct pll_params_table {
+	u16		m;
+	u16		n;
+};
+
+#define PLL_PARAMS(_m, _n)						\
+	{								\
+		.m		= (_m),					\
+		.n		= (_n),					\
+	}
+
+#define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
+
+struct meson_clk_pll_data {
+	struct parm en;
+	struct parm m;
+	struct parm n;
+	struct parm frac;
+	struct parm l;
+	struct parm rst;
+	const struct reg_sequence *init_regs;
+	unsigned int init_count;
+	const struct pll_params_table *table;
+	u8 flags;
+};
+
+extern const struct clk_ops meson_clk_pll_ro_ops;
+extern const struct clk_ops meson_clk_pll_ops;
+
+#endif /* __MESON_CLK_PLL_H */
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 58a343fa94e6..4857c8fa1ac4 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -11,34 +11,6 @@
 #include "clk-regmap.h"
 #include "parm.h"
 
-struct pll_params_table {
-	u16		m;
-	u16		n;
-};
-
-#define PLL_PARAMS(_m, _n)						\
-	{								\
-		.m		= (_m),					\
-		.n		= (_n),					\
-	}
-
-#define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
-
-struct meson_clk_pll_data {
-	struct parm en;
-	struct parm m;
-	struct parm n;
-	struct parm frac;
-	struct parm l;
-	struct parm rst;
-	const struct reg_sequence *init_regs;
-	unsigned int init_count;
-	const struct pll_params_table *table;
-	u8 flags;
-};
-
-#define to_meson_clk_pll(_hw) container_of(_hw, struct meson_clk_pll, hw)
-
 struct meson_clk_mpll_data {
 	struct parm sdm;
 	struct parm sdm_en;
@@ -81,8 +53,6 @@ struct meson_clk_dualdiv_data {
 };
 
 /* clk_ops */
-extern const struct clk_ops meson_clk_pll_ro_ops;
-extern const struct clk_ops meson_clk_pll_ops;
 extern const struct clk_ops meson_clk_cpu_ops;
 extern const struct clk_ops meson_clk_mpll_ro_ops;
 extern const struct clk_ops meson_clk_mpll_ops;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index ecf9a8f6281c..813822ec5f57 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -15,6 +15,7 @@
 #include "clkc.h"
 #include "gxbb.h"
 #include "clk-regmap.h"
+#include "clk-pll.h"
 
 #define IN_PREFIX "ee-in-"
 
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 748552c5f6c8..9b35d5e08378 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -19,6 +19,7 @@
 #include "clkc.h"
 #include "meson8b.h"
 #include "clk-regmap.h"
+#include "clk-pll.h"
 
 static DEFINE_SPINLOCK(meson_clk_lock);
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
