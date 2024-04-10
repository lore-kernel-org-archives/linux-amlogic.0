Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D82ACD128A
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 15:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+BtmUV4O1M81S8p1xKKx9YS8l+y3zVlDvYpEVlgEGM=; b=POEe/tfTTwfVwU
	sFB2dal9IXp4xN1rwrsAZBHRiJhlCFTHlhChy0w1IA5ed+Jpb0E2c1tjhRspb+mlUpUGh8rMLBtyP
	2UpqGeJXDTPY/0As484pCl/dLIpNc9ExaioTN8OkLmNa77tPB2GLd3C+lo5OpVwZ+aRxwekQ2H/Rj
	aZ9BtEEq+tNHH9w3G2+KFJerX3MK3Y+Zz3HTKNdcZCQPtW1MU4cWDc/r6svmjss1rlejG9/Zw/iXy
	Xd+cXUXfgXZ0PuEYLLuBeagTlsA74/FyIsx4e+f/IPM8NOwdVHOVWGqp8DLWA108BrFWXRgcHbcx/
	d4pjegVeny9ijrA/hjNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaHA-00000007sU7-3yYR;
	Wed, 10 Apr 2024 15:54:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaH7-00000007sSd-41bs;
	Wed, 10 Apr 2024 15:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63AEE61C50;
	Wed, 10 Apr 2024 15:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F42C433C7;
	Wed, 10 Apr 2024 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712764453;
	bh=bb46vZ/qYJOGEUqqoTrn1SAKdnMs641lNoDDmlmSBP4=;
	h=From:To:Cc:Subject:Date:From;
	b=PmdksDvZxg0DP0QWJHIis2PiQoTUR4cgtizWYpZ/k2OiPuzWvMgndJlbmlQaDp4aP
	 yORgpECpNY3O/9dzpflHaPalZopZlIJ37vwFL3ft4ugAjws4S8HKuwCY+56MTsw4+N
	 OlGIH4DUBSoIBzSDoR9UE4nEzgbH6teJqiSNtRX7GBBF15zUIEPPwi4oliYOz3BTsl
	 93JKL9ektnoMb+BvJ9ZnC1YAdYP0DN1siBUbLAEXO7f/Jv6F1UwMS9cbU++ZR2VCtG
	 +52W8LGfjNwqtTWBDe5GxYZlvdFedIW5I1yrr1qVmqLRmJgLYRnbtCqCTDfCUCzkzL
	 BzizaCcSBLPZA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] clk: meson: s4: fix module autoloading
Date: Wed, 10 Apr 2024 17:54:06 +0200
Message-Id: <20240410155406.224128-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_085414_080467_8D9C46E2 
X-CRM114-Status: UNSURE (   9.24  )
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.  Clocks are considered core
components, so usually they are built-in, however these can be built and
used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/meson/s4-peripherals.c | 1 +
 drivers/clk/meson/s4-pll.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index 6c35de3d536f..22ff030bd6a8 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3799,6 +3799,7 @@ static const struct of_device_id clkc_match_table[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver s4_driver = {
 	.probe		= meson_s4_periphs_probe,
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index 8dfaeccaadc2..8a917b9703bf 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -853,6 +853,7 @@ static const struct of_device_id clkc_match_table[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver s4_driver = {
 	.probe		= meson_s4_pll_probe,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
