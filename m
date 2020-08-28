Return-Path: <SRS0=gNbl=CG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E17C433E6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:52:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2411A2075B
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Aug 2020 15:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ei/vJQyQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="ESh/+xyD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2411A2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QKgZk2rNnJfQSs4eoxnO6TNwuehddUTAAzlTW+jkBTI=; b=ei/vJQyQ+INk61Phgag66ubXkb
	pXbj82kXhQ6O0sSaWxc/T1ZcattsfV76jT3cYzE4zQv/qmQicdp+98WjKt3lY8piJ+zDWh8OOifOK
	4JIL6aa5NJCezmuzxN5xkhYXwwONMLLp7X1yzEk9v5LI6uHEE0ZvmUFKwSrSg8HoMF7UuvU4ZiYhH
	pgOp5rgDKLBMKaK20pqgEmgyxd6ILfF+aozUu6kQ4JBcPyNbomIi34W/OIcy7eiHyWp54di9bUJES
	Ul3pB3at7TCgxFBkxLo4HzOIfYjPeKfDpOJi8wn0+F0PrUsAThK2HMq1yCykyRoN5R6m2KLYHMVQo
	+PwjRspQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBgfy-0006Qc-J8; Fri, 28 Aug 2020 15:52:26 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBgfw-0006Pt-Dk; Fri, 28 Aug 2020 15:52:25 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5::4db])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 447C45C95F7;
 Fri, 28 Aug 2020 17:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1598629942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=o6gJHPgz29HyNEp7tVvUTXqsiIrqG4vlD8Mvx37LylM=;
 b=ESh/+xyDYVvJ0e5ntEQbTNpgABcwit7kFnkvpxvH/HXkMmBvKoqsGEMhpd3SetmXSR8hhR
 YB8LxM6gBrlXsQZuPOgXBUBdWYH2M+lzZLHEs/TJykZT9bb+i4ak69GCTxmKryt2N3Q3Ny
 0khkg0/Jv+TIk7HtSOQtsweLLPLHa1A=
From: Stefan Agner <stefan@agner.ch>
To: narmstrong@baylibre.com,
	jbrunet@baylibre.com
Subject: [PATCH v2] clk: meson: g12a: mark fclk_div2 as critical
Date: Fri, 28 Aug 2020 17:52:05 +0200
Message-Id: <577e0129e8ee93972d92f13187ff4e4286182f67.1598629915.git.stefan@agner.ch>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_115224_630001_0705272F 
X-CRM114-Status: GOOD (  18.94  )
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
Cc: sboyd@kernel.org, khilman@baylibre.com, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch,
 Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Amlogic Meson G12b platform, similar to fclk_div3, the fclk_div2
seems to be necessary for the system to operate correctly as well.

Typically, the clock also gets chosen by the eMMC peripheral. This
probably masked the problem so far. However, when booting from a SD
card the clock seems to get disabled which leads to a system freeze.

Let's mark this clock as critical, fixing boot from SD card on G12b
platforms.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
Tested-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/clk/meson/g12a.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index fad616cac01e..6d44cadc06af 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -298,6 +298,17 @@ static struct clk_regmap g12a_fclk_div2 = {
 			&g12a_fclk_div2_div.hw
 		},
 		.num_parents = 1,
+		/*
+		 * Similar to fclk_div3, it seems that this clock is used by
+		 * the resident firmware and is required by the platform to
+		 * operate correctly.
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
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
