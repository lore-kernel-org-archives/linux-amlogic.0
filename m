Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 570D7C10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249E420863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rn0aMptC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ql/x+8w0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249E420863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/uA8llBAishuLR7ttGeHlw2cscYkon28UbDjWHY8GM=; b=Rn0aMptCrLYywO
	ayqpOCFwxx/iB3RztTD2PI5MgXHBBsctRpxXl2lhSSuxnPlcmMtqhy57uTGz6eLQxjZw7BfgZEb6k
	PQgg0kw4FyVmdXvh14eOZYMj92nxnpSa+MuZuUc5ij5IdclraliNVHLu+cT+OrEmilg5CAHD6FHm7
	5XI6AmPY3Cnps0qwPU8QEy1CT8YDfNMSreH6szY3yAb2O9UmMqROZpntekwLTL57QgCJIjDWvz+l6
	b+YtVErgYqsn6lM5Zba4F1kLyUQZ2iHEH4fThxo7Kn3XVxyEmELFLyzhm/vGhN5JmnMa2CcGedqaY
	00ZB1KTJOElrPO5Df5xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8NWj-00071B-98; Mon, 25 Mar 2019 11:12:25 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8NWb-0006wr-MO
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 11:12:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so9636950wrp.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAGWjMAs38DEOf/pdjEPeHnYiewe/7N+ZGB7ijz15Bo=;
 b=ql/x+8w0gvnjiOmBFCOu+1IvlNLQrImu2eLZMJAVSkLr+jZwuMb9B181TuREU+XAE7
 AxWFjEkwgWAtQz8ra2n8+XBQUjum6z8lqsIkhKPmHwi1T/6VtQWZs2Ou5gB/WiPlXqp7
 WjqxS3r7Km2Rg0CeuCwrSSsRtMJt80f4kssIE4in9qlkvCWBH/FRXYlGIAorh1uOZbhD
 jvNLGG3NEJv+asBYQrBn5AAvwc1ohR449SBgeSO3FuNCmubw0+2ajLv45dF9/0NqaHAu
 8orkzxE6+8FxHDbRqYLun476oiFoNcwtEJoP5VVRQ1duMwJSLqFiaRbNV6lka/ptUdjk
 WJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAGWjMAs38DEOf/pdjEPeHnYiewe/7N+ZGB7ijz15Bo=;
 b=Bv3guuhe/I+5lt+o7hfeefNyhHT71Z6lIo0aKiG0ncuaTeOVAW6MYmiU1TM4IqivmW
 D3v8f9jfmKZNlV16g9Pc30tOMSeKtpjB/NfjElxjHBnz9xeVN6I9rXbShizyKYGYDJPr
 mN+oGdKT/dareW3B9n7gbNDiPp83wrEF1npyh/LuYQRg1+iN42AH9VQDW6KMPP1Z3bUN
 RVmvM6Ub8aCW+deFVEbrR+1yrTxA1Jzj6iCCDgdRBb7qiQI5fsF/CsaVKgHsIvT2kLgM
 uX4m3ZsUZc9NKRKFNIbPQ+prPKM7UaYOXkh1AOaN+qG2fgV9bx5yNZf7Ku6cLPz1rD0a
 V3Lw==
X-Gm-Message-State: APjAAAUYgLevtdwzfbVjTdvkIhaMQVuGS/CehoDwQrGGuwCG3w1h1QkB
 zcZdfSCvL/m9reHgPQEu22/gfQ==
X-Google-Smtp-Source: APXvYqw/+i+ZkuaKLPTf9yiwTZxD3nYX18DOHDoDAnF8ffCGsjZFKs7JKpqeEN6Fg3pqiwin2yIPwQ==
X-Received: by 2002:a5d:6682:: with SMTP id l2mr14687126wru.33.1553512333489; 
 Mon, 25 Mar 2019 04:12:13 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 n188sm15134301wme.13.2019.03.25.04.12.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 04:12:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/4] clk: meson: g12a: add controller register init
Date: Mon, 25 Mar 2019 12:12:00 +0100
Message-Id: <20190325111200.15940-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_041217_728054_2EABA378 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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
index 6a01f8fd8114..493db74270ac 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2361,10 +2361,16 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12a_mpll_50m,
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
