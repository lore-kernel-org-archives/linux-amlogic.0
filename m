Return-Path: <SRS0=h6Hi=ZV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83CDC432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 16:17:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5E2215A5
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Nov 2019 16:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KuCTIaSC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eg/2w4s0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5E2215A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BPwCvqQGn/yny6EcbFCs93op4Ys8nkOE7VvUNX1el7M=; b=KuCTIaSCtVzWtH
	0WVN7BJfD1i1adry9SkuA0TE1tduV3ts+XjPZxMpN1ULOfykQac4wMgdCkOvEfxVm9B4b2sYL0s5b
	g7sFjy2llj8bpdtGjefXBVSJ9CGErN9I9Qra+vpXKaB5gFr1rsA9iK78o9C9oBJVfGHU/PNywknMP
	OH3BbTxNWnUeAC+dS11QD124j3H5ZjwArNtI/NQ7UCWYStEo8pRwG6UKzqXyPe3sJPmf4e3g73CtI
	EkaNxWQl8KEIF8qmTs5MXLdr02NWeQXLAH0GcV+U/TD81sDTuBgaDc9aenHA9pLgqzpr1yJLVLoJn
	BD9zMJ3To/+qNuiryXCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaixB-00060z-QT; Fri, 29 Nov 2019 16:17:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaix7-00060R-9Y
 for linux-amlogic@lists.infradead.org; Fri, 29 Nov 2019 16:17:07 +0000
Received: by mail-wr1-x441.google.com with SMTP id a15so35846256wrf.9
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Nov 2019 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2u4id74AuIDefeyl6HPZTpmm+BjNUkbxmsv8qghnzxE=;
 b=eg/2w4s0ARwwzJIyvoQV9eZtjhRTG0mLCFM2uJeucVbUwmBbr0EnTlmRi1O5LjCKc4
 Rq3YWQ/7YSShDjqGJvy17FsFYn93axz+BWMlrBUPGtj+jkzfcApSZTuKqKwBu1ubSNOb
 zN24rOxmy4NALD2wKVz+8CZ9A4goebPRfwznoDQ+tGQ7Mc/mM2bAD2xffLeT3Hh0NeYb
 28yfMaszMFyX7HAy7MPZaIMlN1W8JROkY/h0Jz4rVDelMYP9585ksfA6Sfls0TaID75E
 HFOsiJkopxlO2DOarRjQ5qeHmID66xo5V6QdJScr9RDb0oOwILX3eFYwU7ohjicgP/mK
 tTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2u4id74AuIDefeyl6HPZTpmm+BjNUkbxmsv8qghnzxE=;
 b=OGhiBQ4+aI422L3XranBe3HXOrBs+8LT0spEZDlcviyrwKLS7XXO1+dOQ4C2/XxCaK
 pWmWPerPIiCRoQr4Bqp3kR/wep7uKvIR51hCM/I2lRGF+qjPiY0R31lhENmoefbi0J8i
 Gqs6i/QLYK7w4E2CJINkQLdbG2eAO8H9O16t2YYjQWJYbDJduiTMflmi9HFgioZBOtKr
 kVUtuyTNdK0tBiCLHv+PNllgrSTE+5cEv8olMF7vZftPmHwQ8HBgANhm8lyYoJ9ltjFD
 hpSw2mQIJo7OJjNvJuoDC7mg8zVZHDWMc641h9VPWc9QluDeDdpOtKzN9zw9si+ICIoO
 Cr0w==
X-Gm-Message-State: APjAAAXTWj0xe7Z+bCJPHGZBrQhGk+VcWwdFYtAMRR8OukepAVkaliF8
 GKkKQys8I5Zlnv3/Y1/4d3VowA==
X-Google-Smtp-Source: APXvYqxZ+bxdoT3YaQeYAKePtV7Adt55hkXCYBiVIZqfZu8udIBJ2o7TfGUfLVi07mcuZSWRf/kbCw==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr20275395wrs.11.1575044223145; 
 Fri, 29 Nov 2019 08:17:03 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 72sm28730412wrl.73.2019.11.29.08.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Nov 2019 08:17:02 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH] clk: walk orphan list on clock provider registration
Date: Fri, 29 Nov 2019 17:16:58 +0100
Message-Id: <20191129161658.344517-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_081705_334256_31A35C5A 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

So far, we walked the orphan list every time a new clock was registered
in CCF. This was fine since the clocks were only referenced by name.

Now that the clock can be referenced through DT, it is not enough:
* Controller A register first a reference clocks from controller B
  through DT.
* Controller B register all its clocks then register the provider.

Each time controller B registers a new clock, the orphan list is walked
but it can't match since the provider is registered yet. When the
provider is finally registered, the orphan list is not walked unless
another clock is registered afterward.

This can lead to situation where some clocks remain orphaned even if
the parent is available.

Walking the orphan list on provider registration solves the problem.

Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 59 +++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ef4416721777..917ba37c3b9d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3249,6 +3249,34 @@ static inline void clk_debug_unregister(struct clk_core *core)
 }
 #endif
 
+static void __clk_core_reparent_orphan(void)
+{
+	struct clk_core *orphan;
+	struct hlist_node *tmp2;
+
+	/*
+	 * walk the list of orphan clocks and reparent any that newly finds a
+	 * parent.
+	 */
+	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
+		struct clk_core *parent = __clk_init_parent(orphan);
+
+		/*
+		 * We need to use __clk_set_parent_before() and _after() to
+		 * to properly migrate any prepare/enable count of the orphan
+		 * clock. This is important for CLK_IS_CRITICAL clocks, which
+		 * are enabled during init but might not have a parent yet.
+		 */
+		if (parent) {
+			/* update the clk tree topology */
+			__clk_set_parent_before(orphan, parent);
+			__clk_set_parent_after(orphan, parent, NULL);
+			__clk_recalc_accuracies(orphan);
+			__clk_recalc_rates(orphan, 0);
+		}
+	}
+}
+
 /**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
@@ -3259,8 +3287,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
 static int __clk_core_init(struct clk_core *core)
 {
 	int ret;
-	struct clk_core *orphan;
-	struct hlist_node *tmp2;
 	unsigned long rate;
 
 	if (!core)
@@ -3416,27 +3442,8 @@ static int __clk_core_init(struct clk_core *core)
 		clk_enable_unlock(flags);
 	}
 
-	/*
-	 * walk the list of orphan clocks and reparent any that newly finds a
-	 * parent.
-	 */
-	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
-		struct clk_core *parent = __clk_init_parent(orphan);
+	__clk_core_reparent_orphan();
 
-		/*
-		 * We need to use __clk_set_parent_before() and _after() to
-		 * to properly migrate any prepare/enable count of the orphan
-		 * clock. This is important for CLK_IS_CRITICAL clocks, which
-		 * are enabled during init but might not have a parent yet.
-		 */
-		if (parent) {
-			/* update the clk tree topology */
-			__clk_set_parent_before(orphan, parent);
-			__clk_set_parent_after(orphan, parent, NULL);
-			__clk_recalc_accuracies(orphan);
-			__clk_recalc_rates(orphan, 0);
-		}
-	}
 
 	kref_init(&core->ref);
 out:
@@ -4288,6 +4295,10 @@ int of_clk_add_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clock from %pOF\n", np);
 
+	clk_prepare_lock();
+	__clk_core_reparent_orphan();
+	clk_prepare_unlock();
+
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
@@ -4323,6 +4334,10 @@ int of_clk_add_hw_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clk_hw provider from %pOF\n", np);
 
+	clk_prepare_lock();
+	__clk_core_reparent_orphan();
+	clk_prepare_unlock();
+
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
