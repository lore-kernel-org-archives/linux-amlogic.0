Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452FFC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2247620863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pX7QnA7U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KJFzMSWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2247620863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxMla9FH4/Cx26u/HZGG7ZNIRPIfDKBgocdX75bcziQ=; b=pX7QnA7UF7P0UV
	+Cd98OufjU5wGKoMSAghqsupAJb8Cqttlnm/ycqgrQjPVjmf4x7YjruXTXf4KNtT5EvFh2/t/pSWw
	L79OQx3zN2fjkx0x8PS5/n44cuk0S2f6vB6PqobpZtd2Wh0/T0qeIJc6saUKswfobl3OZ4a+7ylLb
	U1hAX8AVD4lri7TZMPzjBqmlyGOZ82oahmM9PDRp2FUAp5GsgUu48qiCEsHZ43vGJAxSvnkFpcB/b
	WsIqD8zffSRJusfgVPX3XgemMu+uBSn/KCG1Aoxo86boNJ50gH1oJ0Fa6jVA9yYAv9/q8yjlZa6uf
	fZzvl9HZ623VqnLMrJWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoW2-0002My-Nb; Mon, 20 May 2019 20:04:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoVR-0001Yr-HG; Mon, 20 May 2019 20:03:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id e15so15993932wrs.4;
 Mon, 20 May 2019 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQEWFaKOfrbORxHzOKdVjgIQUsHfT25oNZs4Yqx/FkM=;
 b=KJFzMSWh2cIQNFSJdUCU0nuU+/GUgdCA6sEdeqwMvanTcXc/REVb/x6G5Xr4pdMvkx
 7eGo5ipth/sUOzLEjza7zN9g7BAPGqnoyMUDe3MGRqDM/yhgM5Wn/pZYWwi82ncTWe2v
 1z5ccZQfrGfCHBS0nMcQCfpugx4FwLTs55ja3DjQaN3QHB0Y8q+rIdD9cyVhGoNfCv94
 G73nqG8x3FqKmKtvokPJmDtsbdYa24Fq9qC2b+JPnkLdCxVuHEd9gHgzr7LLeHSwTWuI
 LHamhvFmxCMsQ/MdOHV6vtTeVb/vESyaKmV/7npOSNYf7hyr1PicWNGuzd2/2FJah4/9
 bGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QQEWFaKOfrbORxHzOKdVjgIQUsHfT25oNZs4Yqx/FkM=;
 b=f7g8GPOy0De8KlYhDVLnGBj/FxzSEXulUl7Mz0BjIRd4ErvLzcOVPjw9b4ZiOw30xk
 nVwbbHzLbe7qmbSS21KGVkCajs79Zi5TXYPRKkuP/7wyaOzN4XYDlEzHZBXe1634Dieb
 J9ctcY9wOsMkNkWCJON/ONmwhFfaScPsR0gtKTsqZHZlOJcTx3xawU6IJ4mjyl7x+tcU
 I2WtpCQp9cjj0fhHlJ+2VsNPzMQzsFwHbbxus5CKMVirs9gSJ1i4xZVRKbYMGhCHHPkE
 LAP0HPa+4gvF3ngNp9qckbdVdNvda0mkR/RUbUv239wMIKIyXxSM/JgR4Fv4nHKKuW51
 omVw==
X-Gm-Message-State: APjAAAUxNM4ezVDZek3AKHvzCg9+WC3TWwWOZLFdMldZjFyLslIju7r/
 Foc7woBG7yUwQUlXfbuEvSI=
X-Google-Smtp-Source: APXvYqyvZjwm7oAgYaaB/R0+9iOVDbGrMUs0Madc7vxHYanOE9pqG4mpy2xeBDW9DZL7JLwGOLn4sQ==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr9569827wru.35.1558382611949; 
 Mon, 20 May 2019 13:03:31 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id t7sm23583379wrq.76.2019.05.20.13.03.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:03:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 3/4] clk: meson: meson8b: add the cts_mclk_i958 clocks
Date: Mon, 20 May 2019 22:03:18 +0200
Message-Id: <20190520200319.9265-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
References: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130333_748049_C08D72B7 
X-CRM114-Status: GOOD (  14.27  )
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
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the SPDIF master clock also referred as cts_mclk_i958. The setup for
this clock is identical to GXBB, so this ports commit 3c277c247eabeb
("clk: meson: gxbb: add cts_mclk_i958") to the Meson8/Meson8b/Meson8m2
clock driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 65 +++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h |  5 ++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e00f42e7fc46..13ce1783eead 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2206,6 +2206,59 @@ static struct clk_regmap meson8b_cts_amclk = {
 	},
 };
 
+/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
+static const char * const meson8b_cts_mclk_i958_parent_names[] = {
+	"mpll0", "mpll1", "mpll2"
+};
+
+static u32 meson8b_cts_mclk_i958_mux_table[] = { 1, 2, 3 };
+
+static struct clk_regmap meson8b_cts_mclk_i958_sel = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_AUD_CLK_CNTL2,
+		.mask = 0x3,
+		.shift = 25,
+		.table = meson8b_cts_mclk_i958_mux_table,
+		.flags = CLK_MUX_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_mclk_i958_sel",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = meson8b_cts_mclk_i958_parent_names,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_names),
+	},
+};
+
+static struct clk_regmap meson8b_cts_mclk_i958_div = {
+	.data = &(struct clk_regmap_div_data){
+		.offset = HHI_AUD_CLK_CNTL2,
+		.shift = 16,
+		.width = 8,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "cts_mclk_i958_div",
+		.ops = &clk_regmap_divider_ops,
+		.parent_names = (const char *[]){ "cts_mclk_i958_sel" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap meson8b_cts_mclk_i958 = {
+	.data = &(struct clk_regmap_gate_data){
+		.offset = HHI_AUD_CLK_CNTL2,
+		.bit_idx = 24,
+	},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_mclk_i958",
+		.ops = &clk_regmap_gate_ops,
+		.parent_names = (const char *[]){ "cts_mclk_i958_div" },
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -2488,6 +2541,9 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_CTS_AMCLK_SEL]	    = &meson8b_cts_amclk_sel.hw,
 		[CLKID_CTS_AMCLK_DIV]	    = &meson8b_cts_amclk_div.hw,
 		[CLKID_CTS_AMCLK]	    = &meson8b_cts_amclk.hw,
+		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
+		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
+		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2700,6 +2756,9 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CTS_AMCLK_SEL]	    = &meson8b_cts_amclk_sel.hw,
 		[CLKID_CTS_AMCLK_DIV]	    = &meson8b_cts_amclk_div.hw,
 		[CLKID_CTS_AMCLK]	    = &meson8b_cts_amclk.hw,
+		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
+		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
+		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2914,6 +2973,9 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_CTS_AMCLK_SEL]	    = &meson8b_cts_amclk_sel.hw,
 		[CLKID_CTS_AMCLK_DIV]	    = &meson8b_cts_amclk_div.hw,
 		[CLKID_CTS_AMCLK]	    = &meson8b_cts_amclk.hw,
+		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
+		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
+		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3106,6 +3168,9 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_cts_amclk,
 	&meson8b_cts_amclk_sel,
 	&meson8b_cts_amclk_div,
+	&meson8b_cts_mclk_i958_sel,
+	&meson8b_cts_mclk_i958_div,
+	&meson8b_cts_mclk_i958,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index 03efa47e800f..c3787418088e 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -32,6 +32,7 @@
 #define HHI_MPEG_CLK_CNTL		0x174 /* 0x5d offset in data sheet */
 #define HHI_AUD_CLK_CNTL		0x178 /* 0x5e offset in data sheet */
 #define HHI_VID_CLK_CNTL		0x17c /* 0x5f offset in data sheet */
+#define HHI_AUD_CLK_CNTL2		0x190 /* 0x64 offset in data sheet */
 #define HHI_VID_CLK_CNTL2		0x194 /* 0x65 offset in data sheet */
 #define HHI_VID_DIVIDER_CNTL		0x198 /* 0x66 offset in data sheet */
 #define HHI_SYS_CPU_CLK_CNTL0		0x19c /* 0x67 offset in data sheet */
@@ -174,8 +175,10 @@
 #define CLKID_VDEC_HEVC_EN	205
 #define CLKID_CTS_AMCLK_SEL	207
 #define CLKID_CTS_AMCLK_DIV	208
+#define CLKID_CTS_MCLK_I958_SEL	210
+#define CLKID_CTS_MCLK_I958_DIV	211
 
-#define CLK_NR_CLKS		210
+#define CLK_NR_CLKS		213
 
 /*
  * include the CLKID and RESETID that have
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
