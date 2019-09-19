Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6AE9C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 10:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9751421929
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 10:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ePcZ23Hx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E+UHiJSG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9751421929
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2daczdjeKMcUrLjEioFm7s1xJiC7jKs7DBICg+Mr+0=; b=ePcZ23HxxF/Lnw
	2UabCQ3la2A5ItsRtbUGcTDHvqD73hADd9n7OcrFh85dEjSrlViERTFAoCBHHvrw76SSshjRoem67
	zTwkTJ9x+QgxVpYFT5+6FL7/2lHd5M6ETYokJIq6DMZtFPPZPeXNNqolDE8OOknBieiFvtz3XMl95
	Wkd5ttghv5YesP07BW3a72+oVk8NjXhUtx7/lA7Iw9mXNlqxtVm7PvgoZFfteSY3rZGDTOyiLPGAW
	7XZnseTeG9767CUGmU/hu+FSW5BVAl3N0b+ubJb7LzXUtGIvLGB2ZuQhVtYkDjbzItmdNxS3r0Dcw
	9tWehFSn23J5YWLgodqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAtdP-0003Re-Cw; Thu, 19 Sep 2019 10:25:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAtcr-0002wN-9t
 for linux-amlogic@lists.infradead.org; Thu, 19 Sep 2019 10:25:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id a11so2533307wrx.1
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Sep 2019 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQH3sxdCSDhIfGdbCjdRoLM/sLLm5iODyAbQ5C/Ltw0=;
 b=E+UHiJSGEVWW51Mla00YaqY1xV4mU3Y+5rJsa4CDkZOUugcHeGYU8NUsvjyGdh1Y9W
 6ARRrK0ebicbUwvDp1hlZN1n7QfctXKyAu4DzKH5+41QbuAvDnrH33FdTGNAFkSJvfLy
 QM3+A4NxjDFI/AEFwzPmTTBsJZuL/7hvlJu+Vf8r89v9tYTyaECETWLTqQFVOI9fDTz6
 jp3aKuYmkkDyi97/DKgrXUPLbOji6zSqzZFO5bhxbSC7m+BZtVgnQ7VgA2ecK075aFiW
 fC7vMa1LtUIZ2tLG8H1NDl9Y2sjMBKz05YG90pNkgwuuimMWh0mQX+blFA/9c8gYS99O
 ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQH3sxdCSDhIfGdbCjdRoLM/sLLm5iODyAbQ5C/Ltw0=;
 b=KHTea1/n94mXlTSU7i1hWG5TLGJsjipUYkKth7+cULB+edL7r0CaCFBBFyM6rr+zle
 r/KirE5tb6dl/HSf1yGj1dijlwgXrLnHji16MfwWTDVbFZ1nKyzRDqKq2d5KN4EtRtnQ
 /7Hxcgk8m6Cncu2umyhBj5Rh1X8xS1nAf3gdTJanj2Bba/nRyuqHfnOnYUuofcQqL4cM
 +yqqUuH9e0Jksczg+P8+hXHYy7m69A/xiYza9eGOekR0mMDMzMveYo2uU2XFOMZo0z+7
 KIkBjYmlyYOcpIzDU3s658vs+ThNf736D309wEZz4UV51xvwBAK4slVReSCYC6t8UYBm
 cXmw==
X-Gm-Message-State: APjAAAWEflfBfQf9FbFYCTPfDkej2pAS/KLZQ8VS4/ajhqRNdVj9vB+O
 VVhco68uiYEldjnxmJnE//IDJw==
X-Google-Smtp-Source: APXvYqzSCZ+aZ9oAmix9jsUH1YYSrCs7/6e+ESB8ntGfVta/Je5txD9GnmfCeBCpuCV6nDG/Eavdjg==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr6749982wro.288.1568888723655; 
 Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id a18sm19542000wrh.25.2019.09.19.03.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sboyd@kernel.org,
	jbrunet@baylibre.com,
	mturquette@baylibre.com
Subject: [PATCH RFC 1/2] clk: introduce clk_invalidate_rate()
Date: Thu, 19 Sep 2019 12:25:17 +0200
Message-Id: <20190919102518.25126-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919102518.25126-1-narmstrong@baylibre.com>
References: <20190919102518.25126-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_032525_341859_5DE18449 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This introduces the clk_invalidate_rate() call used to recalculate the
rate and parent tree of a particular clock if it's known that the
underlying registers set has been altered by the firmware, like from
a suspend/resume handler running in trusted cpu mode.

The call refreshes the actual parent and when changed, instructs CCF
the parent has changed. Finally the call will recalculate the rate of
each part of the tree to make sure the CCF cached tree is in sync with
the hardware.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk.c   | 70 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 13 +++++++++
 2 files changed, 83 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ca99e9db6575..8acf38ce3cc4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2557,6 +2557,76 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 }
 EXPORT_SYMBOL_GPL(clk_set_parent);
 
+/**
+ * __clk_invalidate_tree
+ * @core: first clk in the subtree
+ *
+ * Walks the subtree of clks starting with clk and recalculates the parents,
+ * then accuracies and rates as it goes.
+ */
+static int __clk_invalidate_tree(struct clk_core *core)
+{
+	struct clk_core *parent, *old_parent;
+	int ret, i, num_parents;
+
+	num_parents = core->num_parents;
+
+	for (i = 0; i < num_parents; i++) {
+		parent = clk_core_get_parent_by_index(core, i);
+		if (!parent)
+			continue;
+
+		ret = __clk_invalidate_tree(parent);
+		if (ret)
+			return ret;
+	}
+
+	parent = __clk_init_parent(core);
+
+	if (parent != core->parent) {
+		old_parent = __clk_set_parent_before(core, parent);
+		__clk_set_parent_after(core, parent, old_parent);
+	}
+
+	__clk_recalc_accuracies(core);
+	__clk_recalc_rates(core, 0);
+
+	return 0;
+}
+
+static int clk_core_invalidate_rate(struct clk_core *core)
+{
+	int ret;
+
+	clk_prepare_lock();
+
+	ret = __clk_invalidate_tree(core);
+
+	clk_prepare_unlock();
+
+	return ret;
+}
+
+/**
+ * clk_invalidate_rate - invalidate and recalc rate of the clock and it's tree
+ * @clk: the clk whose rate is too be invalidated
+ *
+ * If it's known the actual hardware state of a clock tree has changed,
+ * this call will invalidate the cached rate of the clk and it's possible
+ * parents tree to permit recalculation of the actual rate.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ * If clk is NULL then returns 0.
+ */
+int clk_invalidate_rate(struct clk *clk)
+{
+	if (!clk)
+		return 0;
+
+	return clk_core_invalidate_rate(clk->core);
+}
+EXPORT_SYMBOL_GPL(clk_invalidate_rate);
+
 static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
 {
 	int ret = -EINVAL;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 853a8f181394..46db47ffb7b2 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -629,6 +629,19 @@ long clk_round_rate(struct clk *clk, unsigned long rate);
  */
 int clk_set_rate(struct clk *clk, unsigned long rate);
 
+/**
+ * clk_invalidate_rate - invalidate and recalc rate of the clock and it's tree
+ * @clk: the clk whose rate is too be invalidated
+ *
+ * If it's known the actual hardware state of a clock tree has changed,
+ * this call will invalidate the cached rate of the clk and it's possible
+ * parents tree to permit recalculation of the actual rate.
+ *
+ * Returns 0 on success, -EERROR otherwise.
+ * If clk is NULL then returns 0.
+ */
+int clk_invalidate_rate(struct clk *clk);
+
 /**
  * clk_set_rate_exclusive- set the clock rate and claim exclusivity over
  *                         clock source
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
