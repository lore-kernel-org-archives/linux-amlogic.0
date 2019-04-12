Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E576C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9232084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HOC2KUeJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M/1p/3lU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q3siTrsX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9232084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10WDSjRvl0YJzz7PFX3bAk4c0NP2sA+d8KMRyEz8hpU=; b=HOC2KUeJu9a51h
	kr2+01Fv2GfmZ1QASPD/W+U/1yYczxKFNzC87GeqJITKRqUIS0IpODf1Ayt16zPzFVvnJ/9V8znXz
	bvu+UHXh+nT3jaZ3gPHtunBkgvkCGu9mz75EG5RjgPYU26LI7rEnniv8aYVLToIRdJ7KC+lXmFLEV
	dGIt10w9pYmSwJHKpqNL52dz8V+JxRbIJGn6tu26oH16UksqacoGiAn0zO9h580hVAx5EnbqOa5wk
	4p/LSWMOJc0YOU4B4+P7E92+iSnjCb3WIh4P8OS72xhV8Zevo6bdEdtAZVUmjr+H8e0eZY1TKox0z
	oeNtjj8rI4P2NqC9BVKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hErhd-0008Tt-9v; Fri, 12 Apr 2019 08:38:29 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErgp-0007Ot-69
 for linux-amlogic@bombadil.infradead.org; Fri, 12 Apr 2019 08:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sOiZF2RRECBO6RoEOo/1qBZdgN1RuY9lkXgyf0v0vnQ=; b=M/1p/3lUnbsNkcbZnaPSQUSAd
 AnUkBqhq14jagTdrNY6s6H7Rear4qWGXTKWaIo8h7sLVGhqauMyBJf2wo6DZtDC/u6cgz++hntUwt
 igbfqJ6y0G1ouarAUAO5cwSWJDtfxpTuLOL0+zvKHSXAc+gqD+zDInGCWC6hHFpfV71S6qb5GJyTZ
 HoT08CUqrBcDgJ5+GDkvzRVubggfJoqBaOz4R9FjzZq83dXiifeD4zdgPjuc/yMkaodVTmCOKZQzP
 DzaE5ha7fBwm5P6D10t/ejUyrQYwm/n9GU3zTQNlMdK3q0igKDqBO/brSm2taw2ke7WcfdHvvbCAw
 C0F9L3heA==;
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErgk-0000AR-Fr
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:37:36 +0000
Received: by mail-wr1-x444.google.com with SMTP id h4so10818282wre.7
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=sOiZF2RRECBO6RoEOo/1qBZdgN1RuY9lkXgyf0v0vnQ=;
 b=q3siTrsXSoQjcT4KL9ruKuXWDwVbStT+BhVHeTipGviXOe2TUE80YuwNOzYNQv7OFP
 EVypXJ4oUNAKTBFSLtuA6B3a4ngZUFOZZ8AhCrxmM5xpbvATbZ+S4jH+A4OeEtmEl1M9
 oc6xjfZ5dVbOvH3n3EytgGu+XFkro7oNoL2KGFkWS85H+hW4majuNBHl0+cOGzGTm+1u
 erggezpOtkcThY0b6eX6fxvsrRp46eavJe//IRTi+9REzQdfpXjEn70mdHoRrKsA9xAe
 4/eE2+8HNXHNiUJyyfEmSL3KqXU8U9ypn4c0uAhra5C9ji/l2nkIhsFl5pJB+vKrv4Kn
 d9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=sOiZF2RRECBO6RoEOo/1qBZdgN1RuY9lkXgyf0v0vnQ=;
 b=M98lKUNsETPS03BFeYd9D1tyrWoWq7sw96VawKOPRjEFL4Xe8EzqTM1n52merh/BEK
 0G/7jS8aPCBrDfYgm/vEDYfPwhSr4XdmF74B4eXxKIk8LK+Rcm+Lk7+ESvw1biC+3enW
 himBdQmxPZTY7TY6NShpmS8bNYL8iC3UreYYi9eZi3UuRTcy568MTA/cCp1NzbuaCfa6
 Wmdqps9FrwFI1ckVgHu1hnk+Mz5K2GOr6DxG4eMS1fkv3KKacQmvtnSVlo8z/9R9JD8D
 8DrzrVlaQHHYPXDMIYfMQYZJ/ubJOwjE/lGue2RUU8j1+3VQtP4L0qvVISrTX7f3DLDh
 0cvw==
X-Gm-Message-State: APjAAAXzaFYYnfuk7JrDXTC3Xc3Jt3Gy3sLCAyPDLxXOibh4HbWnwpqp
 1tEnryNsGHnLP/1dVBg44Dy/Mg==
X-Google-Smtp-Source: APXvYqySZxms+eMsBaAZl0h8nB3hNacE3Jj+YG+7tAhkOfSp7Hyiq9GE6YnFzGnywfXltJ2juNZ2Hg==
X-Received: by 2002:a05:6000:1152:: with SMTP id
 d18mr33488719wrx.32.1555058252138; 
 Fri, 12 Apr 2019 01:37:32 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y125sm12124318wmc.39.2019.04.12.01.37.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 01:37:31 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Fri, 12 Apr 2019 10:37:28 +0200
Message-Id: <20190412083728.21029-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190412083728.21029-1-glaroque@baylibre.com>
References: <20190412083728.21029-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_043734_613510_5FC2FF98 
X-CRM114-Status: GOOD (  12.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add TS clock used by two temperature sensor

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 drivers/clk/meson/g12a.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 3a3134976534..cbb4abc0311e 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
 	},
 };
 
+static struct clk_regmap g12a_ts_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.shift = 0,
+		.width = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts_div",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap g12a_ts = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.bit_idx = 8,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "ts",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "ts_div" },
+		.num_parents = 1,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 static MESON_GATE(g12a_ddr,			HHI_GCLK_MPEG0,	0);
 static MESON_GATE(g12a_dos,			HHI_GCLK_MPEG0,	1);
@@ -2615,6 +2642,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_PCIE_PLL_DCO_DIV2]	= &g12a_pcie_pll_dco_div2.hw,
 		[CLKID_PCIE_PLL_OD]		= &g12a_pcie_pll_od.hw,
 		[CLKID_PCIE_PLL]		= &g12a_pcie_pll.hw,
+		[CLKID_TS_DIV]			= &g12a_ts_div.hw,
+		[CLKID_TS]			= &g12a_ts.hw,
 		[NR_CLKS]			= NULL,
 	},
 	.num = NR_CLKS,
@@ -2803,6 +2832,8 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_cpu_clk_trace,
 	&g12a_pcie_pll_od,
 	&g12a_pcie_pll_dco,
+	&g12a_ts_div,
+	&g12a_ts,
 };
 
 static const struct meson_eeclkc_data g12a_clkc_data = {
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 1393a09730a6..5633c72e432d 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -189,8 +189,9 @@
 #define CLKID_PCIE_PLL_DCO			198
 #define CLKID_PCIE_PLL_DCO_DIV2			199
 #define CLKID_PCIE_PLL_OD			200
+#define CLKID_TS_DIV				202
 
-#define NR_CLKS					202
+#define NR_CLKS					204
 
 /* include the CLKIDs that have been made part of the DT binding */
 #include <dt-bindings/clock/g12a-clkc.h>
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
