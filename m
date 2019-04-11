Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7981FC10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ADB62083E
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 08:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ai1mlB8e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hcXgs/Us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ADB62083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R25vMPqucVdxApar760/8t2IFEoTi30Zq1S916TIn+U=; b=ai1mlB8ep66vOB
	FRQNjfllHWWFxpO2O7mLCDOgiO3qMsgMoIXkC7wjbyr1ZJpnms8QsqpklfW1RqSj6zK4sg+l9aAA1
	dcH6ZDooATCHqr/KrUkNssmV6xB7ORMdRAhCBkl9i4mEKuAtOxFIkNJ7koSgSuKhiFcDn3TshBv0h
	85enUNtfrFweK2GUxQacVzl4fhJr3HKOA5nwags6I1pzXXdJGMWT1q0I/wuH79B1Ehd0uh3dxv/4P
	Uf6c7ksVT41kie9Jmg+ByEqd0YeV2iHkxUxZRNVHVOKz1NInPlFhblm/sB3vidLoBkxywuPJgBeX5
	Z0asdTqOSA8nuvisMflQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVLS-00035w-E9; Thu, 11 Apr 2019 08:46:06 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVL5-0002bB-3J
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 08:45:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id j9so6192384wrn.6
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=uZ7qqews2O7XucznXFEO2bWGmRBz91rjfUznQYaR+AU=;
 b=hcXgs/Us2i1LqiCpownxWKZxx3I0JEedLl7VZ0y48hDAtgCzhSb/I09gP2H4m0nw+2
 NkpeFsk6niKChc3wbjXiDxYbI3w7HWN5i29s+9bKj7sn/U92jLTk6//qc/bm2J7TNmF9
 mL5/HIgHEf8+p/rGagIfcVnuJmHOu2UfS2ryG490lGsCXjEzTqvouiIKdhdfmt8YGbiB
 iz5H9O+HJ85SpBaqRE5iLArDPmjVycGOY5jw0YNvwGjF43lp5LlY2CWozbKlX7tzU+LG
 7vLeBoNpBS8I39/RZJQ1oGJJ+nGf+N4g7jBtAI5ZMwYgcicuJuogiejVD/LURDOIk0Fd
 F7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=uZ7qqews2O7XucznXFEO2bWGmRBz91rjfUznQYaR+AU=;
 b=MbPZjN79C1gqJoCpVDsm9bqXBPtNPVm1IMturnL9NlBTylXBmPxrb0ky8pT1EpKP7t
 dvz93/U9yZk1xNy7SgEnatBqlHhzUFSMi6Di062BG/GzufHBk71O62wG6uc5xpw94psH
 9OQTasw6uATfluKr8xVYpNUe3Cm2rqt5+BP0/arc76+w4oTLiZE3ZjS8M1cjdEsGvcbz
 Ws7GNmw20QBkv2dKOFyEdWpGQPB+tN0qAERMH5XzQeb7fEMRoSbhMBQjH1DDnZv2vhrV
 GlOmxFy3Z5/K5KUy/VUwOql8YA8Rla8AvlTTmAOb+SttvPsiYLZ+YAPybFYRFN+QN4ZL
 rTrw==
X-Gm-Message-State: APjAAAVtptR0uo2YmWuLOLyxlU07DnQ7nwfPTRpFq/rfi5BTdHiruSNb
 BHhXMgZJng9jGeJ6N7M1+pxjXw==
X-Google-Smtp-Source: APXvYqwyTjtvyg5KjtWDh44Yy0fg/y31wD+PxhUHgzWO+R7B19HFHB0yjhjcu9qJ+ovfQ+AEjhN8+g==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr30498225wru.160.1554972341885; 
 Thu, 11 Apr 2019 01:45:41 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 7sm128602876wrc.81.2019.04.11.01.45.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:45:41 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: meson-g12a: Add Temperature Sensor clock
Date: Thu, 11 Apr 2019 10:45:37 +0200
Message-Id: <20190411084537.30299-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190411084537.30299-1-glaroque@baylibre.com>
References: <20190411084537.30299-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014543_137515_75C6C2C4 
X-CRM114-Status: GOOD (  10.27  )
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
index 3a3134976534..e6d2af6ee8ea 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2335,6 +2335,33 @@ static struct clk_regmap g12a_mali = {
 	},
 };
 
+static struct clk_regmap g12a_ts_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_TS_CLK_CNTL,
+		.shift = 0,
+		.width = 7,
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
