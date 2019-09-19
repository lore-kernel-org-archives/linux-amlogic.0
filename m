Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BA4C49ED7
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 09:37:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB20321907
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 09:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urGNXvbe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oNG10dYr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB20321907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PrNu0r+Yahy2qYKTGMQqL1euokAHzth4lZhPBb/IA+4=; b=urGNXvbeZTswKr
	7zbcqDAa2XGjWZMWdMwDS1K1MHh6pP/8Bg62tF+VamDgm0URB0kKBhUF87ZrgVR3r/xQdEP2rj/uR
	8Yp8TtdmIoP7IgxS+AcTmhGXM/AFaBESHVqyOY3Y7Zxq9qHAC/hNMaHhjtPwawBUkp9PUj5xFwKCE
	oWukIhbvJKU1rE62m+DzcrRfclc7Qw8k4ogA9riDz9VOfcsSzm5ePHKvLq9p8U9C3tM+ni0IwMKUa
	Nqc6bUtg8mEJoOC2eIeIN15fMq7Paqksg7aOViKZ8M8V/kPsYHf0GYpcpEGfvQV3TZhmLKnsS8rll
	qxhmzpqWaXrYVeWyJK4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAssW-0006e3-Ld; Thu, 19 Sep 2019 09:37:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAsra-0005qg-7P
 for linux-amlogic@lists.infradead.org; Thu, 19 Sep 2019 09:36:37 +0000
Received: by mail-wm1-x341.google.com with SMTP id i16so3586469wmd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Sep 2019 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ve+wzZh8jIbj36VSXYKI7yL2XeCKd4lhGJ7BfZhWHhk=;
 b=oNG10dYrCbn1pG2d0FdlS4/80H49wI5hR3HIWwCnhqqjA62jSItQNspBjzxvSMedTr
 4q8EAzYaQHcdosVIBhH6EkIz97rHE3T2imgWxPw+AJbGfy+/3bFQWAssrFRGNQyZZxws
 BqcbL59e6P+hICngHdTLTNZQJxf+Kigt4Arc8y+Zy41JmjnfhoGqIfb0KaDnvFaZc1te
 7zkGKrqNzp10j43LIeTAazbGfmtTUShsFgb11nRienzG70jNMu2lh/L0WmRaiY+zrNQC
 cECvYUo+1KTMaRsTURjUfLEAVXk7x+cvMRG9mqFeUaTb4mCSQrwEBkE0bVLHhhe+9x3Z
 Xk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ve+wzZh8jIbj36VSXYKI7yL2XeCKd4lhGJ7BfZhWHhk=;
 b=sbgaLssWY96NGqiVi2AiCePTRh66eWJj4NtYL1+i4+0LCYreEIhFATmbekmSk4lqu5
 RHvkwB2sAeRjmV5/JFJ14gR86GrjCzJVVuohplZtDvc9UCC1Er0ZEi9O9TqGR0yrg7Bk
 RbJl3GAr5I2vAoDx3PfQfiVrYTiJyG8aJu+n6vpKERV+OUQFhmULde1BqmQk07R6FM1p
 5wa6sXwNB/KPWXX/q1IpNW8ajI0CxqiKvWO7h/MRo68KcZLoqII2uDWHpLxMmYJ4O1uW
 ce62BtLjnWmw9n1Py+I/O39y99HUW4Fgk8P9cRLE4KmnO2UaCls/ZFwJRA7ydNAtaZ6F
 STeg==
X-Gm-Message-State: APjAAAWFI0Wo+TGgjKqww3zt5XK4+sKnQzFAZyUGyUyrwJno+UFNLcVv
 P748lPaxS0OeoEZ/j3jb3uytbA==
X-Google-Smtp-Source: APXvYqz9sp/AaYazMI2H4L0eBMS1cnM6EY4+65T2+0n8IFCg9CSZgaPu7/ywo3hsKzx2hiNglBB29A==
X-Received: by 2002:a1c:c589:: with SMTP id v131mr1915621wmf.163.1568885790845; 
 Thu, 19 Sep 2019 02:36:30 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id q19sm16701186wra.89.2019.09.19.02.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 02:36:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 2/3] clk: meson: g12a: set CLK_MUX_ROUND_CLOSEST on the cpu
 clock muxes
Date: Thu, 19 Sep 2019 11:36:26 +0200
Message-Id: <20190919093627.21245-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919093627.21245-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_023634_268556_A02DC7EF 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When setting the 100MHz, 500MHz, 666MHz and 1GHz rate for CPU clocks,
CCF will use the SYS_PLL to handle these frequencies, but:
- using FIXED_PLL derived FCLK_DIV2/DIV3 clocks is more precise
- the Amlogic G12A/G12B/SM1 Suspend handling in firmware doesn't
  handle entering suspend using SYS_PLL for these frequencies

Adding CLK_MUX_ROUND_CLOSEST on all the muxes of the non-SYS_PLL
cpu clock tree helps CCF always selecting the FCLK_DIV2/DIV3 as source
for these frequencies.

Fixes: ffae8475b90c ("clk: meson: g12a: add notifiers to handle cpu clock change")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 33c7e04b4a82..b3af61cc6fb9 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -343,6 +343,7 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x3,
 		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0_sel",
@@ -409,6 +410,7 @@ static struct clk_regmap g12a_cpu_clk_postmux0 = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn0",
@@ -465,6 +467,7 @@ static struct clk_regmap g12a_cpu_clk_dyn = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_dyn",
@@ -484,6 +487,7 @@ static struct clk_regmap g12a_cpu_clk = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
@@ -503,6 +507,7 @@ static struct clk_regmap g12b_cpu_clk = {
 		.offset = HHI_SYS_CPU_CLK_CNTL0,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk",
@@ -522,6 +527,7 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 0,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0_sel",
@@ -567,6 +573,7 @@ static struct clk_regmap g12b_cpub_clk_postmux0 = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 2,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn0",
@@ -644,6 +651,7 @@ static struct clk_regmap g12b_cpub_clk_dyn = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 10,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk_dyn",
@@ -663,6 +671,7 @@ static struct clk_regmap g12b_cpub_clk = {
 		.offset = HHI_SYS_CPUB_CLK_CNTL,
 		.mask = 0x1,
 		.shift = 11,
+		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cpub_clk",
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
