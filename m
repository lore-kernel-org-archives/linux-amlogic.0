Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE63C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BF72064A
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T30BHJ7X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jTJto0ZX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BF72064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sP2jTFQO91/hnc51SyQc4qlDAl3VibQuMZsYHOX1s4U=; b=T30BHJ7X7c5Rbs
	zSV1B4CfRJYs2X1TyXl0Mwq//GhiVkCF7DtgXkGU+3RS/s0yUVV+mGHgfG/Vc/jYwj2Mv2uUGI+0S
	0a1/eYh4PZ734p4fEpTrELKGJkVQ1UlR8OPsBK8DtO7nneVhV5t8lpCdUgjI8nlYZsMtEUtutCbwX
	IrRivsjv5FGtwm70UtTUzaLCB8C4yB0RY2L0YP50iPlbH67oNKo6C8GROe8aYZC8x+Moi8Ztv2FO1
	h2QjLv2DyKlCRlebLhqdSdJkrRLZrPaXng0B5oy1HdF/yDrTFg/1Ih8w0V4c8SqSOHmfjz2do5wjZ
	PPso4ANcMcERiFl6Q8nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3wc-0001Wu-RS; Thu, 04 Apr 2019 15:06:22 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3w1-0000Z5-OG
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 15:05:55 +0000
Received: by mail-wr1-x444.google.com with SMTP id j9so4231823wrn.6
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzS9le92cojNiBwsEcpVtVjv6C+c3kU/euAgZOl/ICU=;
 b=jTJto0ZXpcizm1AebWMBhu3/fxNqSf460QjW0538A70L95HJpM+9AnJafbMr6ON/1l
 A8dJ5Qz+x9hc9VetY3PqxNJoE/DfVyWPOej/Dmx/NAVmtp7NerkGZJuCSQxdjoy49fq1
 5cIR4goC1kvjh4JuprqmzkcvZBrMafLSqpqmhfz4t7GPApUmymkrx3LonXZok9smVkJC
 KpsVYIHSoJS9CfB5ZT9CgegAph0WBhUTBB0BDVPDi2CxRJkSs2avpsUDYsBkD1hQg/7O
 1M+H0+iVBAIkdScCpUGMUpcWFlM0UmsloYFJM1PXJyhDz5SY7YS0AyenqmoDXxge64mh
 4rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzS9le92cojNiBwsEcpVtVjv6C+c3kU/euAgZOl/ICU=;
 b=R+MD5sfM0c/GJxs1Di0HlSA7v6FyPXj98vhVkAWMluUkWM6oHHtNHINhNaJmM+q4Qw
 CHwHmeV4hK7vV2RlXzfXr01jnos14Q0shWU/X0zvUggLmST1f/dy+0d0+dcUI74C0q7u
 v0FNiO5JC5yGopGMUkqAPhAF9wVRx6CF2CiuAH0VfkaYhTNevMrzwi690XJiXR8wDOD1
 l88O5kQOWSbolp8jjT1FcPcG3ac3eTuwrtoW4eJ7BNARnzo4BWcfysoo8J+Y9TqINiDm
 W92Gl7+6UqI0FKSInRXrKvwmH/gv0bCb3k4yormGSXjpgH0SExx3Bxp3mdVCLRmQJRnO
 EIgA==
X-Gm-Message-State: APjAAAXtWGM0qyqRsk51zEZCWQ4q9ZGAMDY3E7IuYG0Y40b2a1D4JCeT
 kN3KbHxyf99HUOX4MkmTdqbX2g==
X-Google-Smtp-Source: APXvYqyZfZQ4gNDAxpQZSyJGinCu8vxmTWP6jr51aQb+A4G7jVIbw9tgWcnqtl1MXVr3JQlytlUT4A==
X-Received: by 2002:a5d:4646:: with SMTP id j6mr4838442wrs.56.1554390343904;
 Thu, 04 Apr 2019 08:05:43 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 08:05:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH 3/6] clk: meson: g12a: mark fclk_div3 as critical
Date: Thu,  4 Apr 2019 17:05:15 +0200
Message-Id: <20190404150518.30337-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_080546_337236_63571AD6 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

This patch patch marks this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 14aaa02bb621..3554d1172169 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1060,6 +1060,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
