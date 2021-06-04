Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AEDCC47082
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 03:33:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAB061402
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 03:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAB061402
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZwtSgU+7MN/aluxQFTrZA9IjvuCgWuCUN6IH5TwcHUI=; b=FdXBOUL03TVE1D
	PgaRWmatWyxU/mTPZIsIJy5x8PicWddGZBeo82gNPbeVL04xEXnh4eSgZNtX7k752zrTtgKdHCIpn
	9fHYv/QVvAtHMYh12E3j4OFC8nTeD4TbQ1ueSx2JmgtO3sUTFPWJ8hUx1uhE12ChXgq6mZ8BhEieA
	cTeRJzOe+38sgK23/ZwH8omeAhK4i86i7cS/j30eFWHsjTgMy5J/hlYDDZR0tmxVdcbS46HdZ8KGP
	3o+w1m8ljXjLzt81mdmwf073Jk+vdmGrm/GwvkkyuF2wKHozz/sgnPuhxFyIDFIFcCMiSahO8O1l6
	rV5XHbFj4T4zAGgoZCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp0a6-00BO7n-5r; Fri, 04 Jun 2021 03:33:10 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp0a3-00BMtB-Fi; Fri, 04 Jun 2021 03:33:08 +0000
Received: by mail-pj1-f51.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so6326611pjr.1; 
 Thu, 03 Jun 2021 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=icn8mgRDWXOjaY3g7V23n8mNEvlwuJBMtHS+GFwA3/g=;
 b=qYGonMOwk1vaLYuJYt+gYxeqPX10Cu+7L3mSe8vPIcvK54bSWxmMCnDgKuBDFJ+e/7
 FuAAr4uBvg9CgZ9iU3HMuDvhxMS0nNcbAHs6KwjZRHa/HvbM4qsAK6aQTjvIw7PLafmb
 3sieICe03yYs2BZtACMaeul9QYeBBvAmgfW3VIPoSLxN80hsgakyVQrpoM/d0o4Kgosj
 CH2lH/fD2FdRGLowzhULxWpTg9dnGSm7En4rk2z5j+e4Et3hd8MhzxGAkAH5//3tlueS
 AR+oTrDPLj4llMuvrcAbwsE4As/TM+5MHOE6Iw1WxR8cI1oy6XY4F1l19y9UErDcwIzm
 AQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=icn8mgRDWXOjaY3g7V23n8mNEvlwuJBMtHS+GFwA3/g=;
 b=Rq/9mdTtfx0vFdcksOq0Rr3cRmYSrQEJsuIkltYQURD2p9+Mhi1V6X4EqNtRqswhSb
 BWd4it3CGQAh1TvyNeNVAfXMdZ5AuxLN1s90JtFhfFckPfw+/rFJu8gcC9J/2R/MYmk0
 FxIfAFtdWHCbC5xytxCf1X6q+O++BiUCgqd+rzeADPdu8Idfldbe+gMJ46DBC02wnI8C
 qQIR9HvPNJFZnGyk5ekjUc0Talm6xohTiSuwRPuczhUtXSRVWD2GatooFSfdF7lyCgks
 65uOy61vsQmfWrQW4AeysdsYjI4wk22qkcuS2vOn3B8OTuTB8VWSCWG+7Lrc3qNXo5Ai
 a/EA==
X-Gm-Message-State: AOAM53191/aOfb5kGIjTlajgCW87Pwi2JZjvdR2X2fNBfOG+21DCo8cD
 VN+c/gfg2o9FgQr66Y6Hw7I=
X-Google-Smtp-Source: ABdhPJwOYyhjg/Et0l54LKe36aN/nUR4yR0VNdVU2+W2ETi4WUgUEb+bbsfQ3gbIFIBeiBhMjAjqag==
X-Received: by 2002:a17:902:8ec9:b029:ef:5a88:e7cf with SMTP id
 x9-20020a1709028ec9b02900ef5a88e7cfmr2252334plo.48.1622777404343; 
 Thu, 03 Jun 2021 20:30:04 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id a10sm3208680pjs.39.2021.06.03.20.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 20:30:04 -0700 (PDT)
From: xieqinick@gmail.com
To: narmstrong@baylibre.com, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
Date: Fri,  4 Jun 2021 11:29:57 +0800
Message-Id: <20210604032957.224496-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_203307_549632_2C50C8F1 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

From: Nick Xie <nick@khadas.com>

This adds the Neural Network Accelerator source clocks for g12b.

Initial support for sm1 already exist in
commit 2f1efa5340ef
("clk: meson: g12a: Add support for NNA CLK source clocks")

The sm1 and g12b share the same NNA source clocks.
This patch add missing NNA clocks for A311D (g12b).

Signed-off-by: Nick Xie <nick@khadas.com>
---
 drivers/clk/meson/g12a.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b080359b4645..6a1db16b126f 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4723,6 +4723,12 @@ static struct clk_hw_onecell_data g12b_hw_onecell_data = {
 		[CLKID_SPICC1_SCLK_SEL]		= &g12a_spicc1_sclk_sel.hw,
 		[CLKID_SPICC1_SCLK_DIV]		= &g12a_spicc1_sclk_div.hw,
 		[CLKID_SPICC1_SCLK]		= &g12a_spicc1_sclk.hw,
+		[CLKID_NNA_AXI_CLK_SEL]		= &sm1_nna_axi_clk_sel.hw,
+		[CLKID_NNA_AXI_CLK_DIV]		= &sm1_nna_axi_clk_div.hw,
+		[CLKID_NNA_AXI_CLK]		= &sm1_nna_axi_clk.hw,
+		[CLKID_NNA_CORE_CLK_SEL]	= &sm1_nna_core_clk_sel.hw,
+		[CLKID_NNA_CORE_CLK_DIV]	= &sm1_nna_core_clk_div.hw,
+		[CLKID_NNA_CORE_CLK]		= &sm1_nna_core_clk.hw,
 		[CLKID_MIPI_DSI_PXCLK_SEL]	= &g12a_mipi_dsi_pxclk_sel.hw,
 		[CLKID_MIPI_DSI_PXCLK_DIV]	= &g12a_mipi_dsi_pxclk_div.hw,
 		[CLKID_MIPI_DSI_PXCLK]		= &g12a_mipi_dsi_pxclk.hw,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
