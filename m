Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DAFC4740C
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF62620C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ceCAjWcQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cH05sPvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF62620C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhiG1wvP/KClyHQRZeMI3n4F0N1USmBOMeQrp6nFdZ4=; b=ceCAjWcQZy4O0E
	Lk0eN6nbePbMVKc4lPoe1GxKS4IFUd3PZFKbmctkjr1hwtI4JxRdY0oi7PxYfgRW/H1S7m/4OmAei
	lUV6LoFHdhj+ClD2NiYvls8Nef9IiHRogMDpVzg6rYlpDqQOxE9Dyr1csvqHmOoMLczWrEkvkEHZq
	ns3+LsJ1BXoeyTxVjXUIaKc6NbMEkM/tABRHdhgcSlmM4bPofvT2I3qnDJ0h0Fuct3TGyUY+Ytnfg
	Y9jhmdmm/SpAGa958uRGxO/pQ7eNOt3Nll/mbA8pxxOe6Y7MflunEm+dmAWBabFlxr9CpG0mXRrLK
	vCKkgnqNrrnAAQAxpN+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhAg-0002lV-JB; Sat, 21 Sep 2019 15:19:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh9x-00027T-Ll; Sat, 21 Sep 2019 15:18:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id o18so9569493wrv.13;
 Sat, 21 Sep 2019 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MgeOWr52J0AbeRdfS/blsOSLs4diI31K6bmRntAvmGc=;
 b=cH05sPvRnyjjP4kqZ62tz5buGh4I6wiRdSZ73thccq3BH6hMZ/efZjpv/k0ukN1j6o
 I7ZPU9kRKbOMbsE3D6vjGOKpngSxeRVR8P+HTYqmPZXOIQO4Yfl95X3gNhQk7hvYghRY
 0YG09bEXuXWi4js1VASxO8rD+1pHiB7L4da3a56wWljAt0HIpN00+zwF2zg+YSTq8r+U
 IjmZZs6AcM5nQ8IS4k1D/ZvwCObfssmRcIgxSmNPTcn28/WxpNQBe0/mlluLGd10wXrF
 41YzrSpx6DKRfthRXUurdMqNtq+g9wzy2rgIVSnjyrkV2S3fh8BudveJtu5+9jce4TO3
 akpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MgeOWr52J0AbeRdfS/blsOSLs4diI31K6bmRntAvmGc=;
 b=pUaXhzje4nIYbHr5vrgQD1eexs1fIbeOliFEyQ5HPGAufpIk8LAtJ+R6mIBugbjbAg
 glp+w57DS2eE8+GyCUxxkvd8Cj3O/OzZ0jb8wcdZ9iX2tAR6F6b6cLr5E9pAk7Vn+kKJ
 VJKyXbABzugT2u+TqPfCXMru+0hnflHSX9WlwrivgVWYCZdq1aCJl3q1gIiw7Zh7SDkF
 x7UGhj+uCBX7Juy9nuRYhxqRWxw6rEMmqcgjlbiLbCHO7ypkh2bE5cqpqminxffj00Gd
 uDIa5BgLUT5llgUEXWS0Ij617Y/cklVbUIMkDGCr1e+ncO3OmSCYcz6tAIC4dm2tUOwf
 TfEA==
X-Gm-Message-State: APjAAAVq8Scdw4pgLiMkWAizkOVuVATtUQO+nSP89fmt7RbdtryA8kqK
 2WtXqJJJZ+l3pNHXyUZXNBA=
X-Google-Smtp-Source: APXvYqzFKXhBjZTODvaRaYjnssgMU/qh93dWuwrlF1daSaR72oohtXpNNgFalCsExTd4cIdV4rv50A==
X-Received: by 2002:adf:f44e:: with SMTP id f14mr15047963wrp.290.1569079132443; 
 Sat, 21 Sep 2019 08:18:52 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id c6sm6003120wrb.60.2019.09.21.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:18:51 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 4/6] clk: meson: meson8b: add the ddr_pll input for the audio
 clocks
Date: Sat, 21 Sep 2019 17:18:33 +0200
Message-Id: <20190921151835.770263-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081853_863864_4CDAEEA2 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The two audio muxes cts_amclk_sel and cts_mclk_i958_sel use ddr_pll as
input at index 0. Update the muxes to use clk_parent_data and add
"ddr_pll" as input using clk_parent_data.fw_name because the DDR clock
controller is actually separate from the main clock controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index fefb4b7185d0..3987f4ea7378 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2429,28 +2429,25 @@ static struct clk_regmap meson8b_vdec_hevc = {
 	},
 };
 
-/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_amclk_parent_hws[] = {
-	&meson8b_mpll0.hw,
-	&meson8b_mpll1.hw,
-	&meson8b_mpll2.hw
+static const struct clk_parent_data meson8b_cts_amclk_parent_data[] = {
+	{ .fw_name = "ddr_pll", },
+	{ .hw = &meson8b_mpll0.hw, },
+	{ .hw = &meson8b_mpll1.hw, },
+	{ .hw = &meson8b_mpll2.hw, },
 };
 
-static u32 meson8b_cts_amclk_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_amclk_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL,
 		.mask = 0x3,
 		.shift = 9,
-		.table = meson8b_cts_amclk_mux_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "cts_amclk_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_amclk_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_hws),
+		.parent_data = meson8b_cts_amclk_parent_data,
+		.num_parents = ARRAY_SIZE(meson8b_cts_amclk_parent_data),
 	},
 };
 
@@ -2488,28 +2485,25 @@ static struct clk_regmap meson8b_cts_amclk = {
 	},
 };
 
-/* TODO: the clock at index 0 is "DDR_PLL" which we don't support yet */
-static const struct clk_hw *meson8b_cts_mclk_i958_parent_hws[] = {
-	&meson8b_mpll0.hw,
-	&meson8b_mpll1.hw,
-	&meson8b_mpll2.hw
+static const struct clk_parent_data meson8b_cts_mclk_i958_parent_data[] = {
+	{ .fw_name = "ddr_pll", },
+	{ .hw = &meson8b_mpll0.hw, },
+	{ .hw = &meson8b_mpll1.hw, },
+	{ .hw = &meson8b_mpll2.hw, },
 };
 
-static u32 meson8b_cts_mclk_i958_mux_table[] = { 1, 2, 3 };
-
 static struct clk_regmap meson8b_cts_mclk_i958_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_AUD_CLK_CNTL2,
 		.mask = 0x3,
 		.shift = 25,
-		.table = meson8b_cts_mclk_i958_mux_table,
 		.flags = CLK_MUX_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data) {
 		.name = "cts_mclk_i958_sel",
 		.ops = &clk_regmap_mux_ops,
-		.parent_hws = meson8b_cts_mclk_i958_parent_hws,
-		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_hws),
+		.parent_data = meson8b_cts_mclk_i958_parent_data,
+		.num_parents = ARRAY_SIZE(meson8b_cts_mclk_i958_parent_data),
 	},
 };
 
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
