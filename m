Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1BCC433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:04:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D118220BED
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 15:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="imXwR+y9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4ySjj6O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D118220BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyZ0+aIqb5Aj7sJUCbVjarwSYAiIW+zhZNOV2sOawdA=; b=imXwR+y9MDTN4f6KO9wEsYSJkU
	U/1iTlaPRsEy1bgoZkVjONFCwLSMaYL65+yvMgHI0ImGIRV41DQTb2p2MLIqo189ec1qhXh2KiHte
	pLiLELjHAhzVoXJSk36Lj1TRwDlf+uUqkr+z3L/sWoDYtkxKo84VB7LNuvX6SWdMPGRu2V+A1Wcwp
	tqwLyIzVMK5Gza+H4fsgIHVhzxQMcIsB0XEuOXG3vxQ7z43tUqznWHjTIyJrJjtl7D5sYNeG1l0j+
	Uq8LzTwgb6nh2bRGlioT31GI00l2KI1Dnt41AJ6yb4jpyQaY6OVG6iCee56EO7Jx/lfRVn4iYoanY
	iBcjZufQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDUIy-0003aa-Va; Wed, 02 Sep 2020 15:04:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDUIv-0003ZA-Oa; Wed, 02 Sep 2020 15:04:07 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8370220FC3;
 Wed,  2 Sep 2020 15:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599059045;
 bh=LN9CdnpYig01xRkC8IS2l0nFAprnIaPmxff2deSsbdM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l4ySjj6OWiLULGbFujoNttxjHcvTS2LNjJ813tKQEwBBwwM/JP6aKrbDFnPg0hkFh
 SpLHJW1E2JjNxHSu4W4Nej/7Xfx8k/dlx8N6T4j0+HeiLFB+ShEsCXvy0UYilPoIER
 hYd9EHZ7Bq02kC+guJsYtkNpKh/BenrYY9Amn0vk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 02/10] clk: fixed: Add missing kerneldoc
Date: Wed,  2 Sep 2020 17:03:40 +0200
Message-Id: <20200902150348.14465-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
References: <20200902150348.14465-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_110406_406091_FFFA55DB 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing kerneldoc to fix compile warnings like:

  drivers/clk/clk-fixed-factor.c:211: warning: Function parameter or member 'node' not described in 'of_fixed_factor_clk_setup'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-fixed-factor.c | 1 +
 drivers/clk/clk-fixed-rate.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index 8b343e59dc61..910e6e74ae90 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -206,6 +206,7 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
 
 /**
  * of_fixed_factor_clk_setup() - Setup function for simple fixed factor clock
+ * @node:	device node for the clock
  */
 void __init of_fixed_factor_clk_setup(struct device_node *node)
 {
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 77499a27c8fb..45501637705c 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -168,6 +168,7 @@ static struct clk_hw *_of_fixed_clk_setup(struct device_node *node)
 
 /**
  * of_fixed_clk_setup() - Setup function for simple fixed rate clock
+ * @node:	device node for the clock
  */
 void __init of_fixed_clk_setup(struct device_node *node)
 {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
