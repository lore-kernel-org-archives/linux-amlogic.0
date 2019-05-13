Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF89AC04AA7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C802146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tPhDUdgB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iEprL8LW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C802146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5jirVh8kUE5NbCf3mkeTf5eVHFtv6Jj18pYpuLfwto=; b=tPhDUdgBzcr1hK
	inge3JQmp8UGI5z6WpTIOX1Q13AATZD+65i8p+vGW7WTjm+BoKmzAuI6cAtzLNxHF7ntIVkL3uyW5
	1zNiDs0PKeWoyHoGXig5gQ1iyBSg1eVK5C9IpNIAnYGyq+rXlu+XosOVaPakXFKn//awYrb73uJrp
	nECscSU+yFzS13cFOwYSHcTBcyePM7l8VEjUsSdhgcQc5MtjvmV3dLvoLVZJwaWV+rro6V9tyczzI
	zDIgyf0twdq41ovZMRKOC7NtwfCa/qjUJIPfqrpEklXfjvT7QYzMdjqugU6Xvx8cTLCIQkUMrFIkk
	U405mQCQufkVFI/SieLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA7B-0007S9-37; Mon, 13 May 2019 12:31:33 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA75-0007MJ-TC
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so15065080wre.7
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
 b=iEprL8LWLl8A7xh4GNvz6+BTjvOd9OUeQARGtQ9hS7GYQo1sxl11GkNZR52DmtjVuT
 x51TiXeHsXOTs1GC4jh1pQDR7W85s+mr/FJDkLPXxXa1PusMELawFwZ5GTMZk2NppEdW
 4oSDKD+LCIBbVMe8a0I6PCte3y2oXxY6/7DLQr0jr3m3uizO4k1Hhq3sMF+IAWDEG5aP
 Y5AutyjcAZHFBo7FG7MCxTJzJSShgHGG1XGn25I1wHga2cMvt3XWE70w9xm8FecQ8ubX
 nPjEHAGb9FQpFa6oCgrFunTJrvxffo8a6mXcPd/8VJcW4nNPOGcEfSnvywbSQHMY5qxd
 y7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=StsbiAbV0Vt+lXEMy/BJGmoZrMBaAxbvBsCBZl1IPto=;
 b=k6rgTS8HiCUBnElwgbnUw9Vg7IRFXqfI+FLsW0Rou6VVyBIAYzB+Xpx2Bg7sJk1T7F
 2jyhrN0nu7SDoNOdTA+ORYycclbjH4V8BchpOsY4wybJeV1tABkQLpQqxdZQx/LdnKs0
 TpvAVnRm8Nds6i12kq8EgyaC5nAP5v6UekVmJQFv2ZKCAsVH9eJNhmZi+RAPrIe1zxdz
 3qClYHbzh/89F3MVEwmyiaY0ojOw2p8XOiFYEO2mychQOuAPKXRqeHG3c3iaQng5uzs1
 y4dh9KrwUbUGc0Vd0ytwiOmI6Df2ajdh51DPVFH/2osxyjINFwC1pt07qDSj6ZXxEVAn
 IUbA==
X-Gm-Message-State: APjAAAV1m+CpCvLQ1j80JNrhSRE9NU3eimBrB6M+pXeSwsfPe0iKBu7s
 4jRUJmgweD7fAs7XwQWAqHUeJQ==
X-Google-Smtp-Source: APXvYqxuc8ne4IV9H9oYDb0Z1fLfW2O4+EU4VQcyb6N9zPS21Am/DW97B5/RB95g9ame4z2qq4dViQ==
X-Received: by 2002:adf:fc8f:: with SMTP id g15mr18367933wrr.122.1557750686306; 
 Mon, 13 May 2019 05:31:26 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 3/7] clk: meson: axg: spread spectrum is on mpll2
Date: Mon, 13 May 2019 14:31:11 +0200
Message-Id: <20190513123115.18145-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053127_938878_99B7F5E6 
X-CRM114-Status: GOOD (  12.34  )
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

After testing, it appears that the SSEN bit controls the spread
spectrum function on MPLL2, not MPLL0.

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7a8ef80e5f2c..3ddd0efc9ee0 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -469,11 +469,6 @@ static struct clk_regmap axg_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 0,
@@ -568,6 +563,11 @@ static struct clk_regmap axg_mpll2_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
+		.ssen = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 25,
+			.width	 = 1,
+		},
 		.misc = {
 			.reg_off = HHI_PLL_TOP_MISC,
 			.shift   = 2,
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
