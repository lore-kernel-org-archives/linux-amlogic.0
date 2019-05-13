Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25BEC46460
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A45462147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3CvOmkP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FTChcYwy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A45462147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGKMrwcGIuLJ682sygx1gXNP6nnNE8JKy8bdWJqIrQc=; b=f3CvOmkP6TUiV6
	l6D502W8OkMweK/L8yy7JudJgWb9D+FOkOkB9Sk2nS4Xi9OZkDD+xVjkTeRkH/tUiajSJ02LU3HIP
	OVZWwkfvMr6gCMgLmPrn4xSD5sjAnbX71MwzuTYqE4hyLBAg1g6/8OWsAGqbTqWv86YNYdL2Ts1I7
	a063ibUr5DQATQejdJ/xlwJc3qescyhsHtTs+ugPIz66r9n1IQmpNFhox5Kl7lsATqSkYu6pIYf3E
	KPeslij82Cu8BjGXv1Z0AisSLLA0PENzk/jMB4oSfSDdiWGl2XCGgANEouqGNajVxpKH+It8viiPw
	tBUbdRUok2ToCZZEeN+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA7I-0007cQ-22; Mon, 13 May 2019 12:31:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA7A-0007PZ-A7
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:36 +0000
Received: by mail-wm1-x342.google.com with SMTP id h11so13448756wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDWoUB9bcp7o6UKFktF9ACZ04OzawQuwNyVSxDs2oGM=;
 b=FTChcYwy/64XxJA+Qdoi5SQTOLGXNUXjv+nlh1tRXwcJ5wHIr4YXrKpPSAYujuyCzp
 nijO6vpU+0BTOBu0M8rH69Fy/BcRNzMsb9+QsY4mgYef5o5Py4Er/BU6A4UPldUHIUwm
 3N1VBhSmqFk12ex6lkH7nZ7A1wkbMpbp1wKpzXPxwEDHpUroEI1zCpg1SeMKQmrJ7goz
 QVgAUjDQTPtot79cCw6omTqisZOw9lWoYiGfS0N3V6ax1/grApmnole0AFlAcoL9OJMk
 k1xLXdk/GNS3KbD325KPkAfuHONMfgCR0ZXh4mu7cIH8/tJI20Q5P7EPet0TDqsWy1Jv
 Dx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDWoUB9bcp7o6UKFktF9ACZ04OzawQuwNyVSxDs2oGM=;
 b=B7n3p0nc7sjqXN1eLLgaOLzNA4I+GmBrMMM4gbEHTbe5/8HFTzWWK1XDyEb0rdq8BX
 wsz7LM8K+p+y4S6rGW2/9OxISZyo5NK0VTQY1117cgvVShd4HWgPk0KvWFRKLxShoN77
 s61ll4w41Q1OBE1twZsuz7hV1RWDmD0QkZ0VXoDY7IlIVKLvqe50md3Fgrak4FPg2tWE
 8jjd5ZaEZv2BZVtEmsfXGNfLg8RzAPzCJpzU/WUfZZMzyfMTiNJbsq/Sms85I/cgebw6
 nA0WhIP+knP/vdXs7iWoyf/wuyU4nWC8XLE+Vw268XpRRvZyP92LssOSOLCqijGpYd/S
 6NIw==
X-Gm-Message-State: APjAAAUiPZKr4TuWDnvRMb2TSGQMEkSWEVNQ7LIhmohPlf1RirpLeiL1
 tHXe6H8l9sL8h5+06Y1j4G3mAw==
X-Google-Smtp-Source: APXvYqzS/G2YjzdOEaicaTu5qFCKLfkduSgGOTIkrGT+2VPcKPiv3XEJKguO/PiftHRHyxFE9Kutnw==
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr16339134wmb.76.1557750690506; 
 Mon, 13 May 2019 05:31:30 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 7/7] clk: meson: g12a: add controller register init
Date: Mon, 13 May 2019 14:31:15 +0200
Message-Id: <20190513123115.18145-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053132_633118_8DCB5E19 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the MPLL common register initial setting

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ef1d2e4c8fd2..d5aceb79a91a 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2992,10 +2992,16 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_vdec_hevcf,
 };
 
+static const struct reg_sequence g12a_init_regs[] = {
+	{ .reg = HHI_MPLL_CNTL0,	.def = 0x00000543 },
+};
+
 static const struct meson_eeclkc_data g12a_clkc_data = {
 	.regmap_clks = g12a_clk_regmaps,
 	.regmap_clk_num = ARRAY_SIZE(g12a_clk_regmaps),
-	.hw_onecell_data = &g12a_hw_onecell_data
+	.hw_onecell_data = &g12a_hw_onecell_data,
+	.init_regs = g12a_init_regs,
+	.init_count = ARRAY_SIZE(g12a_init_regs),
 };
 
 static const struct of_device_id clkc_match_table[] = {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
