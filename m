Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311FDC55179
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A674A21D7B
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wx4QHk9i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GEMLmHMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A674A21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JRIOrJZp9iLoNKFiEDk24RHW93ewHln2cO0YNhqD1u0=; b=wx4QHk9i820QwbzfxyHcAhCQj
	JN8kSS1ZZcvoDZrR5evzmeEShLlRTncVillFopVphKSv+6vepPwwcjBONWuZQM3G3MRCaGBvAziEX
	UaHivapj+zlM0Y6KnX6Mz+DHm14YYBKlv6d6lS5NmDG37yjuGxlmimH7spocy0ZWG8b0RWQl4laQr
	FJrUocpoCtr31JW9NVzEz3+ink4UIZUcbqEmYAtFq+5Ecfyd0MGWrAH6Myem9DSUtzNlvtnqMY4le
	adOt5XLSvDqN2Imvqu6W8yHrC74xXhWIE6pUn1NXnYJ4cswF80M8ucru5zn4cCDTkreis77mxYfYj
	rM3E9bMJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVH8b-0005tg-Ba; Wed, 21 Oct 2020 16:38:57 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVH8Y-0005s8-Kp
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:38:55 +0000
Received: by mail-ed1-x541.google.com with SMTP id t21so3230280eds.6
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ohk60Lc9axvVM7bujOFXofpFFhnugPw9JS+9Z6gwq/w=;
 b=GEMLmHMccDitjDiVntpcbZF4/ew82oBOAS/eJriDByqKp2mIvoV8csZuJ7ElVfET9c
 PcaD8VqWlzbIRSW7GeMKFmipRdrjfP9P5SkTvHYbvBqJNuLrh/fpgiCp6PuNPthlU6qb
 K+GSVliaw3BAKJrjsM8UPy1GTY3Ja1KGuxWg4+ir3SE6hlUH7Y3OUV7O0Rnyqdws/kU0
 vtjpHpbFYF9HcXDDD2n7+hrmmu3KE3i+LFQYFw3hae/6G7U3Md+xFv+3afEd1aBsC77v
 eL7fL6EIdwgZ6qg/5wHkXPLJhFsaXsxBUWI5rkrZTGJZYGy2N2izaxPvYtDFKUEVeKjs
 gc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ohk60Lc9axvVM7bujOFXofpFFhnugPw9JS+9Z6gwq/w=;
 b=dSObDea0Nvdu2xJWDe49QU46ZNOc9Wi/CHVpAby2+9LmNWKLPUS6HtqjMi9IVO821A
 7D199Fs0fh0/7ZLMYawOqX7qWndK2WND9kiNV3P486ghDBuDiPepDyvGqHddFBIO2poa
 yI9t/J05QfMoZ4A/6EkSvS3J3qeTEsTExf/GSRPDgKgc9UZZOZBVvm/VPLX7bVa3TiEg
 ONbhZZVuetrPbPcupbtvBVfJhctFV03oc9b6LyDS3EaewR1RWhhMx9pUmv3t1kveDUcB
 yrAtEVZsx8KfEQq7jcGOOxhGffRBStHzWyNJZfpgN2FmkzdRzMPDAgyjFP6SbraTBlQk
 RNaA==
X-Gm-Message-State: AOAM531N0MpB5vqYhWHq05+EVaEPS/yjHbg6fcA5vuVT67HFtmPvtg20
 /VvlEmQ67GhmlQp+jEDcWa+zWA==
X-Google-Smtp-Source: ABdhPJz/xI5mua9UlK4b08PjCq49mDh1kU1oEbpF6dQ0ewYrgkI8rTu2uFdxP/IyjaR8K1h8hzrHCA==
X-Received: by 2002:a05:6402:22e3:: with SMTP id
 dn3mr2970696edb.205.1603298333562; 
 Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/2] clk: add devm variant of clk_notifier_register
Date: Wed, 21 Oct 2020 18:38:46 +0200
Message-Id: <20201021163847.595189-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021163847.595189-1-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_123854_697002_8921AC4E 
X-CRM114-Status: GOOD (  13.82  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a memory managed variant of clk_notifier_register() to make life easier
on clock consumers using notifiers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c   | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/clk.h | 10 ++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d27153f26fa9..e9fdd1d9b3f5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4395,6 +4395,42 @@ int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(clk_notifier_unregister);
 
+struct clk_notifier_devres {
+	struct clk *clk;
+	struct notifier_block *nb;
+};
+
+static void devm_clk_notifier_release(struct device *dev, void *res)
+{
+	struct clk_notifier_devres *devres = res;
+
+	clk_notifier_unregister(devres->clk, devres->nb);
+}
+
+int devm_clk_notifier_register(struct device *dev, struct clk *clk,
+			       struct notifier_block *nb)
+{
+	struct clk_notifier_devres *devres;
+	int ret;
+
+	devres = devres_alloc(devm_clk_notifier_release,
+			      sizeof(*devres), GFP_KERNEL);
+
+	if (!devres)
+		return -ENOMEM;
+
+	ret = clk_notifier_register(clk, nb);
+	if (!ret) {
+		devres->clk = clk;
+		devres->nb = nb;
+	} else {
+		devres_free(devres);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_clk_notifier_register);
+
 #ifdef CONFIG_OF
 static void clk_core_reparent_orphans(void)
 {
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 7fd6a1febcf4..79fb52f93053 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -109,6 +109,16 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb);
  */
 int clk_notifier_unregister(struct clk *clk, struct notifier_block *nb);
 
+/**
+ * devm_clk_notifier_register: register a managed rate-change notifier callback
+ * @dev: device for clock "consumer"
+ * @clk: clock whose rate we are interested in
+ * @nb: notifier block with callback function pointer
+ *
+ * Returns 0 on success, -EERROR otherwise
+ */
+int devm_clk_notifier_register(struct device *dev, struct clk *clk, struct notifier_block *nb);
+
 /**
  * clk_get_accuracy - obtain the clock accuracy in ppb (parts per billion)
  *		      for a clock source.
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
