Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301A3C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2263217F9
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 21:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DgfkEjuW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="oX2nR8K0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2263217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbOHerbGLCDFqYmijaVoczBInwlxG6xHvDlYhLLZ9Pc=; b=DgfkEjuW6kOekV
	NKxgQ57CEY1iZLvgBnj9urWS63uTqomKn9/qEr5YP1Ei2SO1HwPEYt23Oq4c4fxvmlYHadco/zKs0
	qdb4Ah1yU1IOTsJ3xKJPf62rfw8lPw+PMiX1eQ8NP41dLjKm8oqo1bMC19/0HLS/K/Wg/erhNta+I
	lBhCwaTzX/GXICYAS28IWDNXOPbUG+TRJQOuq/UtsXlarzECJX7tQtMEt6ylgdVm571um9CYaFps/
	5Z9XaQkmhWGszTl1Bh3Usf5D0+g4JuNbaQRJvctL8Sj0D4lSCQlYSKZRMG20FWplClZpUlTCtSeBc
	odotoHR+AFEeGJrWb7Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Meq-0000lD-PO; Tue, 19 Mar 2019 21:52:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6MeT-0000Du-UZ; Tue, 19 Mar 2019 21:52:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id h18so9619349wml.1;
 Tue, 19 Mar 2019 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GZojoNzAlcbGl8fHjoNsnhIbGqEAojM71YZRXsvbN/s=;
 b=oX2nR8K02oy813R++d7xdIIKjkjXX4fX7XwtTSmh6E46KH/NeeTB+d0W5lf8UQIaGt
 6xPkd9hk9VNbAR7i5AIcps1PyzOWRy5G2wMUELls+KnrRckZVWnXvUG6nF97zWlfD7z3
 WjU0lkMAsA3ojHVIOAabfZtqbiBlsSUCCvBCCm9kU0MyRB1isuMbvNT1k01gbPadDYRs
 2hMYCaItzE8F3EGBdBGgVuzhHxumYVrCxFCd76PjLehqNXcveoCvqdvpq1UyqWwoQTUa
 bbYkgBtCaGTDuOIJZ/5ijO7CJunWcOEfN2n/Wf+t1EueqG100/jom/xVSLqbB2cZpixP
 O5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GZojoNzAlcbGl8fHjoNsnhIbGqEAojM71YZRXsvbN/s=;
 b=VHiSKVvTjp6xoUSRYbUSHsOCrh+apuzFGTIf682HJe+Yz4SEWsAnAgHk3ACnzoVx3j
 WKhm6PyYsjbt4nWZ7b7Vy2EW9pQq/K3VUU7bVh46JSLGKxstXnokebuC8FGWpzQ2amSM
 /VDLbnc9vMcMez7qaRl5T6nRKb+g74Tl5/5lqzNluJFjYlWYCwrYjV1rAvmcw9/OGSlB
 S+hNJnWwcUNV0wxXtbuIduoQZcgHr3WH4A9ULu14CXKQmaubEgmBMQmd0to25FGrsioR
 yykh/X6CVNfQPEmIeUrJ3nSpOouG+y7nIVUXqCkUPVeVWvixBCm6Hy+ZkZEqkQkg/1v+
 1svA==
X-Gm-Message-State: APjAAAVtXXXxl2j6bovyp7HBpdjjNWs8UjbHQplFPIv+V1ZqEAWSTsaV
 bNemqTOjayWXUc9opFcLyWQ=
X-Google-Smtp-Source: APXvYqyJnrozWxcQ4hOs3D+ZQ5sbgpg+Fs5ZxNC63GBqouuwdxKZNOKkKZoFqZkQuuySDEpG0tmjUw==
X-Received: by 2002:a1c:99d2:: with SMTP id b201mr5285665wme.90.1553032324145; 
 Tue, 19 Mar 2019 14:52:04 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD739990039EE738515149D3E.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:39ee:7385:1514:9d3e])
 by smtp.googlemail.com with ESMTPSA id c8sm56050wrx.6.2019.03.19.14.52.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 14:52:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 3/4] clk: meson: meson8b: add support for the GP_PLL clock on
 Meson8m2
Date: Tue, 19 Mar 2019 22:51:20 +0100
Message-Id: <20190319215121.29340-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
References: <20190319215121.29340-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_145206_139315_1F897523 
X-CRM114-Status: GOOD (  14.84  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson8m2 has a GP_PLL clock (similar to GP0_PLL on GXBB/GXL/GXM) which
is used as input for the VPU clocks.
The only supported frequency (based on Amlogic's vendor kernel sources)
is 364MHz which is achieved using the following parameters:
- input: XTAL (24MHz)
- M = 182
- N = 3
- OD = 2 ^ 2

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 62 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h |  5 ++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index c9e6ec67d649..0d08f1ef7af8 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1703,6 +1703,64 @@ static struct clk_regmap meson8b_mali = {
 	},
 };
 
+static const struct pll_params_table meson8m2_gp_pll_params_table[] = {
+	PLL_PARAMS(182, 3),
+	{ /* sentinel */ },
+};
+
+static struct clk_regmap meson8m2_gp_pll_dco = {
+	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HHI_GP_PLL_CNTL,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = HHI_GP_PLL_CNTL,
+			.shift   = 9,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = HHI_GP_PLL_CNTL,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HHI_GP_PLL_CNTL,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.table = meson8m2_gp_pll_params_table,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gp_pll_dco",
+		.ops = &meson_clk_pll_ops,
+		.parent_names = (const char *[]){ "xtal" },
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap meson8m2_gp_pll = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_GP_PLL_CNTL,
+		.shift = 16,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "gp_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "gp_pll_dco" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -2338,6 +2396,8 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_MALI_1_DIV]	    = &meson8b_mali_1_div.hw,
 		[CLKID_MALI_1]		    = &meson8b_mali_1.hw,
 		[CLKID_MALI]		    = &meson8b_mali.hw,
+		[CLKID_GP_PLL_DCO]	    = &meson8m2_gp_pll_dco.hw,
+		[CLKID_GP_PLL]		    = &meson8m2_gp_pll.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2500,6 +2560,8 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_mali_1_div,
 	&meson8b_mali_1,
 	&meson8b_mali,
+	&meson8m2_gp_pll_dco,
+	&meson8m2_gp_pll,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b8c58faeae52..a45f7102c558 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -19,6 +19,7 @@
  *
  * [0] http://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf
  */
+#define HHI_GP_PLL_CNTL			0x40  /* 0x10 offset in data sheet */
 #define HHI_VIID_CLK_DIV		0x128 /* 0x4a offset in data sheet */
 #define HHI_VIID_CLK_CNTL		0x12c /* 0x4b offset in data sheet */
 #define HHI_GCLK_MPEG0			0x140 /* 0x50 offset in data sheet */
@@ -146,8 +147,10 @@
 #define CLKID_MALI_1_SEL	178
 #define CLKID_MALI_1_DIV	179
 #define CLKID_MALI_1		180
+#define CLKID_GP_PLL_DCO	181
+#define CLKID_GP_PLL		182
 
-#define CLK_NR_CLKS		181
+#define CLK_NR_CLKS		183
 
 /*
  * include the CLKID and RESETID that have
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
