Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4472CC2B9F7
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081F361026
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 23:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 081F361026
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DO4bF1CcHgMOhHry1WsQYPSl5wmHdaoKULcWvirC3u4=; b=P/18ytsHkxSfWu
	SU+k8rcUQadRLTS/m/AEfXvyXlCrw5Y77hQiVX6XL0BlFH30AsBJBrA3ocmC2Dfgy7DKoGnbOSuwK
	1hMAs5YHY0iPvzH+p6WU9Rk1xZfMc2Y20azikh0ubwxaLe/UbXOflnbnzrOpU9U4AbLMASa0It3AU
	Oeme/sZoOCSN09qCE5L8O/jOAg4Z14yNexMjJ2BLqnBP5erpw1quodVODaa/7UaLulw1gjU2H190/
	g7n+8xfMrEdvoUZ6gY/AFOpPxMJdvxtjhPOFoHqthjiK+p00cVa5g9Xt1EWtPPveOMPGOEnuaIs7B
	DUAcFVAdCaYms07NbKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llK0O-002LKI-Tj; Mon, 24 May 2021 23:29:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llAtZ-000xxf-Qk; Mon, 24 May 2021 13:45:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id q5so28593261wrs.4;
 Mon, 24 May 2021 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EeXZgICZ0Z3OHOI6Ok7UZ8Rl7RngQhEPXl7GMuZ58Z4=;
 b=mqHqSvWf0wfZVsJwOA4yoT0GvgyqdORSFVATxX3FS9pw+TQbsGfYNWfByKi9GeDwjk
 0xi0l5/2FL3ip9OYJcVHqUvc2C0gcGgM5Bn0DNreRpchYwI6nBg8pwMMzPdwOhUjg4lG
 /qyhqKnKA28WSUgWIehtnP1elwWVLy9FQREWCuqBUhO+qepcUrXFdq4IYrOqzLvOh7O9
 vhMpGXEIfs+rMVig2KLSMEgAXCL2TSIrNWWqcm0HR2kczawpbSGtEHT5n18Hn97tyJg2
 1z0Kth5HKKmp6dWrUOuj7VIPtnY2oidk2pafQKGYgDq/CFTAB7lMj4NMfFEZ9dYaMyb+
 hZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EeXZgICZ0Z3OHOI6Ok7UZ8Rl7RngQhEPXl7GMuZ58Z4=;
 b=gBlZVftopybvsKIG9KrLfHSKJj2JCjQ/5J/yn/gf2HAH6RDkhTZrg7bKEUK/MVNAds
 kYNqjDfXWC0FepzhKdqYTp8nIXyoY3aX9ldg2GH7BZxJ8hkH0zMDGBXXO/ZBlt7fWgBQ
 RuXLk47c3jwyC+COzuxKEuqorgCmKtR8OKHET6lRPsFCn5aLcV2hKd5AUfJ/mpLrBun0
 ua+RcukIJnwi9S7FOvCWb6F4U4TKUZduwRfJSwiSo0yIX7UGCEH2MevoQ/4rY6E39UFO
 MfZWgkEmAooL7VTJ56W3seuTTtVNg8UfzZ0QJz/awMuORHkkHtTtm/apWfa6U02g0fvl
 FyEA==
X-Gm-Message-State: AOAM533scnVnyJteUjdD3dTXb570Ytve2PRlo3y00TR5AWUGyaWMmp7e
 cQVl6439aiFQHZecyWNJwEk=
X-Google-Smtp-Source: ABdhPJzT63Ul/bqB6pl6ZjLa+2aDy2Jm8I+RrICz2ZatOw7KGfEaFEZk8DVBL1gqsUVVcPv9ctEw5A==
X-Received: by 2002:adf:ee11:: with SMTP id y17mr22401706wrn.57.1621863923145; 
 Mon, 24 May 2021 06:45:23 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1370a3a00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:370a:3a00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id b13sm1470159wmj.40.2021.05.24.06.45.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 06:45:22 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT for
 vclk{, 2}_in_sel
Date: Mon, 24 May 2021 15:45:17 +0200
Message-Id: <20210524134517.687089-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_064525_926336_94EC8561 
X-CRM114-Status: GOOD (  13.00  )
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

Use CLK_SET_RATE_NO_REPARENT for the vclk{,2}_in_sel clocks. The only
parent which is actually used is vid_pll_final_div. This should be set
using assigned-clock-parents in the .dts rather than removing some
"unwanted" clock parents from the clock driver.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
After a hint from Jerome (thanks) this is the improved version of
"clk: meson: meson8b: Don't use MPLL1 as parent of vclk_in_sel" from [0]


[0] https://patchwork.kernel.org/project/linux-clk/patch/20210524104533.555953-1-martin.blumenstingl@googlemail.com/


 drivers/clk/meson/meson8b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index a844d35b553a..0f8bd707217a 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -1175,7 +1175,7 @@ static struct clk_regmap meson8b_vclk_in_sel = {
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
@@ -1358,7 +1358,7 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
 		.ops = &clk_regmap_mux_ro_ops,
 		.parent_hws = meson8b_vclk_mux_parent_hws,
 		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
 	},
 };
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
