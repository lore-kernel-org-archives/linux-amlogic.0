Return-Path: <SRS0=PnGF=DE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F1FC4727F
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 19:55:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2747F21531
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2020 19:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dM+27POJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2747F21531
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=inria.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLKjEudDSIiBGLnGHxp4ZiZAMI2P/UA1fD0akYriyek=; b=dM+27POJUDCxJ6KCgtj9krvmM3
	75JzjqMqnee+SNWP3wGn/sGsd7kpHVp29tHB69qLnPfOOcbhV4HchGFLVQQ6LAZDk3WDUFgTRgTAW
	qo0OEiMf3er5ucOejS8+iPq7sMzKVD7GHySA1fbWKO9vl1VQ9mbJwclhsLyYMCDwQOOZNj1YB4hVj
	aruAvHs+UHiOsTL0R+/jFSbfHDHF17r/k187qTW9BMIYL33b+APfBPkYHDAoyacuKzDJIupCZVGai
	gan3Xj2beXfEOkWOQBiKDxUa8JisJ3Kvc/nj/X05hln5VofW4GlmSh3RtZJ9cJq+xYlNywI6TfjWJ
	g3Lq0bkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMclv-0003y9-5F; Sun, 27 Sep 2020 19:55:47 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMclV-0003rE-Ih; Sun, 27 Sep 2020 19:55:23 +0000
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169498"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 27 Sep 2020 21:55:13 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 10/18] clk: meson: use semicolons rather than commas to
 separate statements
Date: Sun, 27 Sep 2020 21:12:20 +0200
Message-Id: <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_155521_862916_8B3387EF 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/meson/meson-aoclk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index bf8bea675d24..3a6d84cd6601 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -57,7 +57,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	rstc->data = data;
 	rstc->regmap = regmap;
 	rstc->reset.ops = &meson_aoclk_reset_ops;
-	rstc->reset.nr_resets = data->num_reset,
+	rstc->reset.nr_resets = data->num_reset;
 	rstc->reset.of_node = dev->of_node;
 	ret = devm_reset_controller_register(dev, &rstc->reset);
 	if (ret) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
