Return-Path: <SRS0=15i7=ZZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2E2C432C0
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 08:08:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A3720675
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2019 08:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h8G0V9BE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ACE03k+J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A3720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EcuptSNeCVkGUC7N8WppOcV0jfc67naD2KkYfacpNrs=; b=h8G0V9BEI3N5hb
	4cdCjnR3D2PbyRGW7ieBhguEu+pEUKn+Px29cWdNyZhk4WGYWcVu5qn7VYyklCAP4wwRvI57UN8Kp
	hVPGO2i3KN/0vg2/nXaSKFfIWeDvsy0l3J24wNQDgSPJTjmYKF8krPW7hhBl5kjoopGEHBOL7Xuit
	tWtJ7fkDXOOBKygofQDM2CadW4UvmA2J/VcRB53DlugwzQfkpjDSLTkD0H8fKl4Hfvod5STK+KIon
	Fwkwpju30ITOGmaA1w88Cu0S+ZyKwPC1scXcH7L6HE9/Y0BmNqkVAeC0LYqDO8+w/ONHJcejUsTjZ
	MV9ReeZlzF0o6G/D9ieQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic3Ec-0000Ny-QF; Tue, 03 Dec 2019 08:08:38 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic3EZ-0000Ko-M5
 for linux-amlogic@lists.infradead.org; Tue, 03 Dec 2019 08:08:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id q10so2380243wrm.11
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Dec 2019 00:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0R64hlt7XwI/N3fKuGoKmEX8pew5cHbSg5pee7ssZ9M=;
 b=ACE03k+J3bQYPwGdDs/MDRbltZ5w+dOYRY4LzkdTknCOZD557nirzb765JXZ7FZ8Ul
 xv4aFc5ZN8JbbPfx/TescvxkpcO7bwV5Q8vW+IeHNgueM1NWrW7XVJM1r7A4LjDFK/k6
 E+si2lf4uiq4Az948pp/rkYSasS92LC/fdTWYktd/Qt/Y0yitT/ok2VM9yx5xeeUSkW+
 sLiRHq5pTyxiPkTvLa0o35awHgg8mNV27eVd/hm/W7aNs36bbOat00hLv8ycdIQ4Eahl
 t7VPgrfpdsHwLOOYOTIOq8nrR6GQT4WGjgqCDJt6/0/Pv7j+SqmKkyuyhL+uKqodPUmi
 8lXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0R64hlt7XwI/N3fKuGoKmEX8pew5cHbSg5pee7ssZ9M=;
 b=aQNvNd6rtjS4dJteKC2Rd6ZWp5Qpwi7s9HRkj7R2Zo8FZ9b5aR2xFHkGj3CnZtvDsz
 27/kbKKIf/5l2Cw+994CeUMmzMEHCPK7jJ+a95IubkYqINR1p4ey1D5C9jKgz35shKNa
 PP9NJKhBtBHQfkE8FM7P6LAtytjj1so3+DGrXkvYuI3Gfldt95YIMJshtMrbXiTjBUQA
 mkq9YV3h3UDqyKm3kDRu72IfwRNe4yjuyHtAZ7hWOizR7IMtcRzp4eWkACYaGLkGXqDW
 3dvrNEqQrd98IL5zEeuzYUniPOdkQjQecgLvUsdFsg/FR0RUd6G/KLe3ayaw+91l/bZl
 51iQ==
X-Gm-Message-State: APjAAAWJeMMkHGHKVjfIXfmm6AYcWPHJQJ/+5le7aBf4DE4iNS6ouRCU
 yIyi96wvEq+x6DJAoVXUZruUTg==
X-Google-Smtp-Source: APXvYqz8AVR9cMm++hDehzZTHRh4xWczw0r4rSWNjQHKTYEvMNTRYnQzW4NwG/numStsR1+76rhwSw==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr3569496wrn.75.1575360513938;
 Tue, 03 Dec 2019 00:08:33 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id w12sm2084204wmi.17.2019.12.03.00.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 00:08:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v2] clk: walk orphan list on clock provider registration
Date: Tue,  3 Dec 2019 09:08:05 +0100
Message-Id: <20191203080805.104628-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_000835_963111_480FF423 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Jian Hu <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Reported-by: Jian Hu <jian.hu@amlogic.com>
Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 62 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ef4416721777..df16a535e800 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3249,6 +3249,41 @@ static inline void clk_debug_unregister(struct clk_core *core)
 }
 #endif
 
+static void clk_core_reparent_orphans_nolock(void)
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
+static void clk_core_reparent_orphans(void)
+{
+	clk_prepare_lock();
+	clk_core_reparent_orphans_nolock();
+	clk_prepare_unlock();
+}
+
 /**
  * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
@@ -3259,8 +3294,6 @@ static inline void clk_debug_unregister(struct clk_core *core)
 static int __clk_core_init(struct clk_core *core)
 {
 	int ret;
-	struct clk_core *orphan;
-	struct hlist_node *tmp2;
 	unsigned long rate;
 
 	if (!core)
@@ -3416,27 +3449,8 @@ static int __clk_core_init(struct clk_core *core)
 		clk_enable_unlock(flags);
 	}
 
-	/*
-	 * walk the list of orphan clocks and reparent any that newly finds a
-	 * parent.
-	 */
-	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
-		struct clk_core *parent = __clk_init_parent(orphan);
+	clk_core_reparent_orphans_nolock();
 
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
@@ -4288,6 +4302,8 @@ int of_clk_add_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clock from %pOF\n", np);
 
+	clk_core_reparent_orphans();
+
 	ret = of_clk_set_defaults(np, true);
 	if (ret < 0)
 		of_clk_del_provider(np);
@@ -4323,6 +4339,8 @@ int of_clk_add_hw_provider(struct device_node *np,
 	mutex_unlock(&of_clk_mutex);
 	pr_debug("Added clk_hw provider from %pOF\n", np);
 
+	clk_core_reparent_orphans();
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
