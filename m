Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DBFC3DA5D
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 09:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72T/YOY/a3fuvzLKOcfPZvPBLA8t3HI/rVh9K595mtA=; b=Tmq7lsjbk2o+l2
	99/a6kSe6k4VoCwL91BqUt51/09mVWIZvX7b30r6ivRkjI3vwh/N0XWcytuhS4jixP1qtRlCzlFz8
	cl40NQDo6TymVWnmUl2Ee9WBxM/h/0MJAyrVfoELCtPal554rtFyKURpq64P0ZhNzlUQBgPSMI1gt
	sbVDIAchXtgiEhFXKi7Z6pyRu0PB4WFdj8UFNyqGoRI4IQj+LXwfcolTGW3vlJpHoyqz+QSL2GLrE
	8aFet8s3Lle1bC7XOD25HylMsPpM8/1S17E+HhaqXIQE0AGkxWB92LpmNWfG/Y9lUt7QcMp0HyAh/
	FCyTF6eVuOxLVBaWDd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5l-00000002Gfq-10PP;
	Fri, 19 Jul 2024 09:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5j-00000002GfJ-2X24
	for linux-amlogic@bombadil.infradead.org;
	Fri, 19 Jul 2024 09:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eMpk3y2xmBZCQPaJCy/EfgttwiP6OCjkgxpc1ntR5zI=; b=dvgaBRXwI9vpvlK8K4pQJsk87G
	SJ9mQ+7sfS6nLw/U8rfsajssciv3RLEpfUtATTas53KmKeIox/DtQVr5eQlFJLQ6sJ5F53rlcJHFE
	1nHrzbpQENI3ZgB90Z+u8UL6+5mCniDtv1qWPeN8tIP0y6HbrgiM2vhXp1qn43on8is7/MD2KLxKh
	GENqHm2nK9obuX1NObCdyyRGr+cYYJQlClgHK/z+ajjUgIiZyodoEoQ6if0nN8sfttfbA+pC9QVPF
	aLS8wXPlGS0MWEoqlfvYd6xxvFbTCZuv4bZzP5llHguYqmJh+xUPiAIJlg7JHzqOtyrSuy42Im7K0
	YQCIXsSg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5f-00000002m4B-3vi0
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:39:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4267300145eso11579905e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381988; x=1721986788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMpk3y2xmBZCQPaJCy/EfgttwiP6OCjkgxpc1ntR5zI=;
        b=p/ntt6whtcOommW3yC1r1IDE0wayP7lVRT7lLUymyVoS59iME/yDj9uS74riwjw8nC
         1G7qqpxyP1ZbXL7hXEpCThQi/xiwW1KrRmff8GjKUHq4wrL7cNjrDfGvx8nIFOFmejny
         soItHY7SvbbNzXFcZ7qO7qcdieNnYPYPfyQLWwb+f1bNT+TwNt/2VVHQ00Adp9MW1LIJ
         X0wWLOY6qz/RVF7/gMEPkUPJAMXGWSCEjO0Zu+XpsfhH3MB9GdWobL6XVZvxPXuL94xf
         WfMt08oWaXz/H76L68imULM1HJ3y9iTZs8gOsyyfo4hswnkOyvEpmcEsUrpcrJmgMAC/
         8nDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381988; x=1721986788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMpk3y2xmBZCQPaJCy/EfgttwiP6OCjkgxpc1ntR5zI=;
        b=DxHJ4FnWPJTgGIubTCSfFel0E+XAnK10x1hGoqg4Ymf0ephFEo2W25HOg/MFrDxMxb
         f7vCmVXsIW/5ZFCWNiqT6QIaQwfxiQ76fRvimd84pYU9ZMjtWjifDnWQn1OBkjjF5Dku
         lppuWMd0DMQvvchC0SzJgL6LOGdAp7U8cvU+DVPfUToImAIDsmAAbOpe8BBLNDy4kueQ
         9nfVOjTg3rNn5rkBtIXS9ytNC4pZMgw0AQOcGruL1tDMAM50MZ2l3mZ+oMJPFzfUcFxb
         DgEZy9BoQrJcyGS/f102OG1HOOIfhdUcSSN0kc4409fYH9vmSYbjPr5sxBTE6NAnbYg5
         X6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJB6WyDGnYrhiKtN9O2YbA+Ug/YKY7j38XrR11MU7FsDAkmXciqjtrjKdQNgKj9efmRcrPQuK2OKY5n/FCj93I+MlB0gS5SWDw4vIjcD5T4A=
X-Gm-Message-State: AOJu0Yx6/Dezcn7VADJNAJZ4ZeaXUQ8UF2Qi5jDxIFwK8N7U7B5NTJQA
	cNC8G6bSWn9JCQ0kQid35o/DnGZpsVsijMjNB/brPrnwYeCbHo2vP9P9HGkFo0M=
X-Google-Smtp-Source: AGHT+IHkI5bQ3THfbu9n+W7E481AfDPpqx7RjnI9aZPldPP6vcT4yhD2GCn82GpZhRHfUSF7NbJPvA==
X-Received: by 2002:a05:600c:4f96:b0:426:6fd2:e14b with SMTP id 5b1f17b1804b1-427c2cb87a5mr62481585e9.11.1721381988244;
        Fri, 19 Jul 2024 02:39:48 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 3/3] clk: meson: axg-audio: add sm1 earcrx clocks
Date: Fri, 19 Jul 2024 11:39:32 +0200
Message-ID: <20240719093934.3985139-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_103952_399248_83521864 
X-CRM114-Status: GOOD (  11.55  )
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

Add CMDC, DMAC and peripheral clocks for the eARC RX device found on the
sm1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 32 +++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg-audio.h |  2 ++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 2426f3dbb7a2..06dc1e1f45e5 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -753,6 +753,9 @@ static struct clk_regmap toddr_d =
 	AUD_PCLK_GATE(toddr_d, AUDIO_CLK_GATE_EN1, 1);
 static struct clk_regmap loopback_b =
 	AUD_PCLK_GATE(loopback_b, AUDIO_CLK_GATE_EN1, 2);
+static struct clk_regmap earcrx =
+	AUD_PCLK_GATE(earcrx, AUDIO_CLK_GATE_EN1, 6);
+
 
 static struct clk_regmap sm1_mst_a_mclk_sel =
 	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
@@ -766,6 +769,10 @@ static struct clk_regmap sm1_mst_e_mclk_sel =
 	AUD_MST_MCLK_MUX(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
 static struct clk_regmap sm1_mst_f_mclk_sel =
 	AUD_MST_MCLK_MUX(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
+static struct clk_regmap sm1_earcrx_cmdc_clk_sel =
+	AUD_MST_MCLK_MUX(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
+static struct clk_regmap sm1_earcrx_dmac_clk_sel =
+	AUD_MST_MCLK_MUX(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
 
 static struct clk_regmap sm1_mst_a_mclk_div =
 	AUD_MST_MCLK_DIV(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
@@ -779,6 +786,11 @@ static struct clk_regmap sm1_mst_e_mclk_div =
 	AUD_MST_MCLK_DIV(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
 static struct clk_regmap sm1_mst_f_mclk_div =
 	AUD_MST_MCLK_DIV(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
+static struct clk_regmap sm1_earcrx_cmdc_clk_div =
+	AUD_MST_MCLK_DIV(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
+static struct clk_regmap sm1_earcrx_dmac_clk_div =
+	AUD_MST_MCLK_DIV(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
+
 
 static struct clk_regmap sm1_mst_a_mclk =
 	AUD_MST_MCLK_GATE(mst_a_mclk, AUDIO_SM1_MCLK_A_CTRL);
@@ -792,6 +804,10 @@ static struct clk_regmap sm1_mst_e_mclk =
 	AUD_MST_MCLK_GATE(mst_e_mclk, AUDIO_SM1_MCLK_E_CTRL);
 static struct clk_regmap sm1_mst_f_mclk =
 	AUD_MST_MCLK_GATE(mst_f_mclk, AUDIO_SM1_MCLK_F_CTRL);
+static struct clk_regmap sm1_earcrx_cmdc_clk =
+	AUD_MST_MCLK_GATE(earcrx_cmdc_clk, AUDIO_EARCRX_CMDC_CLK_CTRL);
+static struct clk_regmap sm1_earcrx_dmac_clk =
+	AUD_MST_MCLK_GATE(earcrx_dmac_clk, AUDIO_EARCRX_DMAC_CLK_CTRL);
 
 static struct clk_regmap sm1_tdm_mclk_pad_0 = AUD_TDM_PAD_CTRL(
 	tdm_mclk_pad_0, AUDIO_SM1_MST_PAD_CTRL0, 0, mclk_pad_ctrl_parent_data);
@@ -1232,6 +1248,13 @@ static struct clk_hw *sm1_audio_hw_clks[] = {
 	[AUD_CLKID_SYSCLK_A_EN]		= &sm1_sysclk_a_en.hw,
 	[AUD_CLKID_SYSCLK_B_DIV]	= &sm1_sysclk_b_div.hw,
 	[AUD_CLKID_SYSCLK_B_EN]		= &sm1_sysclk_b_en.hw,
+	[AUD_CLKID_EARCRX]		= &earcrx.hw,
+	[AUD_CLKID_EARCRX_CMDC_SEL]	= &sm1_earcrx_cmdc_clk_sel.hw,
+	[AUD_CLKID_EARCRX_CMDC_DIV]	= &sm1_earcrx_cmdc_clk_div.hw,
+	[AUD_CLKID_EARCRX_CMDC]		= &sm1_earcrx_cmdc_clk.hw,
+	[AUD_CLKID_EARCRX_DMAC_SEL]	= &sm1_earcrx_dmac_clk_sel.hw,
+	[AUD_CLKID_EARCRX_DMAC_DIV]	= &sm1_earcrx_dmac_clk_div.hw,
+	[AUD_CLKID_EARCRX_DMAC]		= &sm1_earcrx_dmac_clk.hw,
 };
 
 
@@ -1646,6 +1669,13 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_sysclk_a_en,
 	&sm1_sysclk_b_div,
 	&sm1_sysclk_b_en,
+	&earcrx,
+	&sm1_earcrx_cmdc_clk_sel,
+	&sm1_earcrx_cmdc_clk_div,
+	&sm1_earcrx_cmdc_clk,
+	&sm1_earcrx_dmac_clk_sel,
+	&sm1_earcrx_dmac_clk_div,
+	&sm1_earcrx_dmac_clk,
 };
 
 struct axg_audio_reset_data {
@@ -1853,7 +1883,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 	},
 	.reset_offset = AUDIO_SM1_SW_RESET0,
 	.reset_num = 39,
-	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
+	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
 };
 
 static const struct of_device_id clkc_match_table[] = {
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index 01a3da19933e..9e7765b630c9 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -64,5 +64,7 @@
 #define AUDIO_SM1_SW_RESET1	0x02C
 #define AUDIO_CLK81_CTRL	0x030
 #define AUDIO_CLK81_EN		0x034
+#define AUDIO_EARCRX_CMDC_CLK_CTRL	0x0D0
+#define AUDIO_EARCRX_DMAC_CLK_CTRL	0x0D4
 
 #endif /*__AXG_AUDIO_CLKC_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
