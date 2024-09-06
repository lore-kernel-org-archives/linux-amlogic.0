Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB18ACE7B0A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3sVLyse9rojagaWyyn7ZCQbmefAYES4WN0GaH7YiQk=; b=ns+U1eZt4dwcpE
	QYSdLa5Qm9tY0SGaGnxD5G51I5u2JJ2Mk/20hHLWDyAnzRIJk6zgfzmuFxBZMTDyHuVFb7xwIC9/s
	JjxEIm+rJ+GzYecLCqA4+SbP1XrDrLDg6tnQmGcpnevbpvt+Z/tAQazVkvhxQZQqYZYhWuev1peiX
	yci/fyADOfyGs80seYdSg4WZzB2rtPKB2UPhMhZungi4HL9A+xuIjQ+kTwWcrXioIWowqwJkTBUD4
	JIm8MXI3trOfYYosYHbvAYtHvBsTp6sv3cUqrlgmMcpXg+tZuonvyd0J0g6HxcMgy1i2ck1K55mv8
	IwfvBg1n8MfRhVsuxsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYqv-0000000CJXt-2GN7;
	Fri, 06 Sep 2024 13:18:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYqt-0000000CJXJ-0mgx
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:18:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-375e5c12042so1042428f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725628693; x=1726233493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbMVGb74aYuXdDMhEKUAktIeq8z3Kw9sE/mcJ8f3Io0=;
        b=Be27I/c8xR5uFme5tajL8WTws1umcVHG7nykr9psynhk2lKGPwXZSZGcs7FKd3OfDg
         kmytzM+hx7LwMJUxLumKp4caBbjmKAKScf5MVxgCK9J07sun6TQfzH+TFRR251ZeasbJ
         T90+3srBJ3aJhdNhitU6DeaqQCrKQ/a1Zem7C7o8pqoJ8lBmvwl+UnJpUGv0PwTiDXdf
         bTySICMTAscrwLD4e0CYn3jnps/8NzXWfVdYuyT4710mwW8FXQBTSSD9I1LwXndgKT/K
         synBP2QVjoP+IaGjthc3TK7884Qwiv7RJGLOL7KOkfddAp7iMr4207jTzGxJVAiZS1eS
         9GFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725628693; x=1726233493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbMVGb74aYuXdDMhEKUAktIeq8z3Kw9sE/mcJ8f3Io0=;
        b=qJrJE6G52o9956e2b01Hf/SzG7d+NZhPB1WBrdaOo8tUl56/W+wT6KgV0U7Ebn2R2j
         7I0/XBM3XeIhvqXEeKCHdFfMBPzKGLH27D9mTYCWxyLxUzBOrDQ/tkDenGXbjdrfSIjU
         B3k9nWg7W/ugGiRXVtvwMT3ocHHovCX/KZp9HrPsr0sunOVFYDKPURx51S2ezNjIOaRg
         rXjpweLTJ1yGPhA1HOzapMxF8GuTMS6n6jHbjEGT8+aC6mQY4xHCIrrnFLOQNRBKumMl
         d3U6XOvn9JyyrfbGJ3cfmAdN0Nm/zpcj53wkKvvQzRKarMO23qA6yCTITxyhdXrWBT5E
         4CkA==
X-Gm-Message-State: AOJu0YzUYVDhw5wWtmrWoxL1PsdmTrTazcbW7asZ5p+8i0f0Fp0vESmy
	Mqm1Mpy79ytkcyT6wZ8F9nwDAeXFBPLoQbWMz/sdFE7Ko4l5OoK/n9DSRfeT
X-Google-Smtp-Source: AGHT+IGQqyuuD0wZChp8oAhKSGbQbTNi4172Pezmn1FNUoXSkz6SqKxMTenrD7XgHTDqp+GOzB7rHQ==
X-Received: by 2002:adf:f88c:0:b0:36b:a2bb:b374 with SMTP id ffacd0b85a97d-378896c81bfmr1773957f8f.52.1725628692525;
        Fri, 06 Sep 2024 06:18:12 -0700 (PDT)
Received: from voyager.localdomain (178-118-65-79.access.telenet.be. [178.118.65.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cd205ab0sm12138830f8f.87.2024.09.06.06.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:18:11 -0700 (PDT)
From: Theo Debrouwere <theo.debrouwere@gmail.com>
X-Google-Original-From: Theo Debrouwere <theo.debrouwere@faytech.de>
Received: from tdebrouw by voyager.localdomain with local (Exim 4.97)
	(envelope-from <theo.debrouwere@gmail.com>)
	id 1smYqo-00000002e1w-3xUp;
	Fri, 06 Sep 2024 15:18:10 +0200
To: linux-amlogic@lists.infradead.org
Cc: Theo Debrouwere <theo.debrouwere@faytech.de>
Subject: [PATCH 2/2] clk: meson: axg-audio: fix sm1 mclk_pad support
Date: Fri,  6 Sep 2024 15:18:02 +0200
Message-ID: <20240906131802.630513-2-theo.debrouwere@faytech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240906131802.630513-1-theo.debrouwere@faytech.de>
References: <20240906131802.630513-1-theo.debrouwere@faytech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_061815_246360_FBE18EBC 
X-CRM114-Status: GOOD (  11.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix the mclk_pad_0/1 of the sm1 family.
The pads have an additional divider & gate.

Signed-off-by: Theo Debrouwere <theo.debrouwere@faytech.de>
---
 drivers/clk/meson/axg-audio.c | 36 +++++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..838281218e71 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -323,6 +323,16 @@ static const struct clk_parent_data lrclk_pad_ctrl_parent_data[] = {
 	AUD_MUX(_name, _reg, 0x7, _shift, 0, _parents,		\
 		CLK_SET_RATE_NO_REPARENT)
 
+#define AUD_TDM_PAD_MUX(_name, _reg, _shift, _parents)			\
+	AUD_MUX(_name##_sel, _reg, 0x7, _shift, 0, _parents,		\
+		CLK_SET_RATE_NO_REPARENT)
+#define AUD_TDM_PAD_DIV(_name, _reg, _shift)				\
+	AUD_DIV(_name##_div, _reg, _shift, 8, CLK_DIVIDER_ROUND_CLOSEST,\
+		aud_##_name##_sel, CLK_SET_RATE_PARENT)
+#define AUD_TDM_PAD_GATE(_name, _reg, _bit)				\
+	AUD_GATE(_name, _reg, _bit, aud_##_name##_div,			\
+		 CLK_SET_RATE_PARENT)
+
 /* Common Clocks */
 static struct clk_regmap ddr_arb =
 	AUD_PCLK_GATE(ddr_arb, AUDIO_CLK_GATE_EN, 0);
@@ -793,10 +803,20 @@ static struct clk_regmap sm1_mst_e_mclk =
 static struct clk_regmap sm1_mst_f_mclk =
 	AUD_MST_MCLK_GATE(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
 
-static struct clk_regmap sm1_tdm_mclk_pad_0 = AUD_TDM_PAD_CTRL(
-	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 0, mclk_pad_ctrl_parent_data);
-static struct clk_regmap sm1_tdm_mclk_pad_1 = AUD_TDM_PAD_CTRL(
-	tdm_mclk_pad_1, AUDIO_SM1_MST_PAD_CTRL0, 4, mclk_pad_ctrl_parent_data);
+static struct clk_regmap sm1_tdm_mclk_pad_0_sel = AUD_TDM_PAD_MUX(
+	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 8, mclk_pad_ctrl_parent_data);
+static struct clk_regmap sm1_tdm_mclk_pad_0_div = AUD_TDM_PAD_DIV(
+	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 0);
+static struct clk_regmap sm1_tdm_mclk_pad_0 = AUD_TDM_PAD_GATE(
+	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 15);
+
+static struct clk_regmap sm1_tdm_mclk_pad_1_sel = AUD_TDM_PAD_MUX(
+	tdm_mclk_pad_1, AUDIO_SM1_MST_PAD_CTRL0, 24, mclk_pad_ctrl_parent_data);
+static struct clk_regmap sm1_tdm_mclk_pad_1_div = AUD_TDM_PAD_DIV(
+	tdm_mclk_pad_1, AUDIO_SM1_MST_PAD_CTRL0, 16);
+static struct clk_regmap sm1_tdm_mclk_pad_1 = AUD_TDM_PAD_GATE(
+	tdm_mclk_pad_1, AUDIO_SM1_MST_PAD_CTRL0, 31);
+
 static struct clk_regmap sm1_tdm_lrclk_pad_0 = AUD_TDM_PAD_CTRL(
 	tdm_lrclk_pad_0, AUDIO_SM1_MST_PAD_CTRL1, 16, lrclk_pad_ctrl_parent_data);
 static struct clk_regmap sm1_tdm_lrclk_pad_1 = AUD_TDM_PAD_CTRL(
@@ -1232,6 +1252,10 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
 	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
 	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
 	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
+	[AUD_CLKID_TDM_MCLK_PAD0_SEL]	= &sm1_tdm_mclk_pad_0_sel.hw,
+	[AUD_CLKID_TDM_MCLK_PAD0_DIV]	= &sm1_tdm_mclk_pad_0_div.hw,
+	[AUD_CLKID_TDM_MCLK_PAD1_SEL]	= &sm1_tdm_mclk_pad_1_sel.hw,
+	[AUD_CLKID_TDM_MCLK_PAD1_DIV]	= &sm1_tdm_mclk_pad_1_div.hw,
 };
 
 
@@ -1646,6 +1670,10 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_sysclk_a_en,
 	&sm1_sysclk_b_div,
 	&sm1_sysclk_b_en,
+	&sm1_tdm_mclk_pad_0_sel,
+	&sm1_tdm_mclk_pad_0_div,
+	&sm1_tdm_mclk_pad_1_sel,
+	&sm1_tdm_mclk_pad_1_div,
 };
 
 struct axg_audio_reset_data {
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
