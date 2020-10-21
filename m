Return-Path: <SRS0=FfFd=D4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BE1C56201
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AA1222E9
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Oct 2020 16:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1XkBOFA3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="atuMiwpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AA1222E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f+eL6UlWxu0igGqIjCGKa8iQ6n2RxiOvQLV07qZ8tyY=; b=1XkBOFA30YppvHkEIwMvr2sgU
	SIFDo8xxEhJKGpNBWcaiiUFq/zjmxohTNMwWOuqN4ELHNmey9NP49ALL1QSAHQg7eXkkeigrAnx2L
	l4v5df9yGgrSO9rLHTFzKaXkR1Q9K1gOu2nMtTBx98B9U/CG//EkDubIXIKnNo8pns8R3C/28dY9A
	5UKKUjaDXnTgFl1hDJEDvpKuw4PSdL0vTeIVB6r2hTApK8csf/28CMRvObfyynoyLIx3/+YuyGw1b
	1yYQIK1vBeK9HLnsuzxhcgcWS5X/9IuOjngc771KrRaeWB4LcglZVN10FBXJLjqhBUVJjvlkPZeGS
	7sq3a916g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVGsC-0003pR-Qz; Wed, 21 Oct 2020 16:22:00 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVGs8-0003mZ-9n
 for linux-amlogic@lists.infradead.org; Wed, 21 Oct 2020 16:21:57 +0000
Received: by mail-ej1-x641.google.com with SMTP id p5so4120009ejj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Oct 2020 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NbaOJdOhMnQWRBlP6WkK3ZzL8S9aIykVLGSDrM3lt1Y=;
 b=atuMiwpUbK1Yyl/B+DN8Fvaeg7nklmy8ZUDhvZaHpqL3qGMMtDhAgYWiCLlPwGc7a0
 UWcyK0DKuTDlS7j8AaLrgmldLACb/cy4kdThvmBt4G+mQ3GYNmxb3DxcuRmsFFB+kFfb
 aKWAN5esyrKSvQ5jR0PboxYNxDKwD7TqTonHG+wftLNZSZsGNJyWk4ENFO3/50k/JVez
 r5OB2AuadXu66MOzxx8U4SKqtWCa3dKWL7BD4m6+2IiUOBDcJ6NrVCR6atVzig7IKpP0
 MMZGk97bygy33+2y61VJ0HLaLwl8bcqZvbmWWWPejek+4j5u8RWC6DMI6OURiV/HfyME
 MFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NbaOJdOhMnQWRBlP6WkK3ZzL8S9aIykVLGSDrM3lt1Y=;
 b=BFnLzl11bDO+tJacM0e+RjUQWTNyUEwGentagcYSVk8X8U1bKSMwQReBS8ZeErAKHj
 FwUbVXmmEkWksfU/iGmpl7FEfiDXNrOPGrqWbkl6+gzCHiuE8TIHdA+bRTfet4v19RzS
 p7mrxNT+taUPwinYilfMkHmbbeHXK0ngZxbzVAz4qAro9kxZqh+5SSedOJpRpbQomsYW
 jAfngefCgsGsvJfzODnjz/FmPBB/civODf2VBW+i1D4jK7vwqb3VejpMm8ugCK070NPI
 7Pil8gkKQoYVxv9gpYRqhWGt+ww34zG0+Xg+n8cmg228qc3UexwrCmkm8x/dEJUhwv3J
 tnKQ==
X-Gm-Message-State: AOAM53115ZUNaWrBad+wZS8CFcRxTLF10kUCsv8EvKSeX6nT+c6BHweZ
 slk/oqjtNDydEfDVYeCyuO7SsA==
X-Google-Smtp-Source: ABdhPJzgn7NLcmefXgPTla5nK9XVbWc6TU9L61aXbeTJFTr26tzoKCNwiKGKQ9Yo08mn74gsn+j8sg==
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr4213435ejg.456.1603297314846; 
 Wed, 21 Oct 2020 09:21:54 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 11sm2566667ejy.19.2020.10.21.09.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:21:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/3] clk: avoid devm_clk_release name clash
Date: Wed, 21 Oct 2020 18:21:45 +0200
Message-Id: <20201021162147.563655-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_122156_355953_296FE38E 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In clk-devres.c, devm_clk_release() is used to call clk_put() memory
managed clock. In clk.c the same name, in a different scope is used to call
clk_unregister().

As it stands, it is not really a problem but it does not readability,
especially if we need to call clk_put() on managed clock in clk.c

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0a9261a099bd..88e5797bb6b4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4068,12 +4068,12 @@ void clk_hw_unregister(struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_unregister);
 
-static void devm_clk_release(struct device *dev, void *res)
+static void devm_clk_unregister_cb(struct device *dev, void *res)
 {
 	clk_unregister(*(struct clk **)res);
 }
 
-static void devm_clk_hw_release(struct device *dev, void *res)
+static void devm_clk_hw_unregister_cb(struct device *dev, void *res)
 {
 	clk_hw_unregister(*(struct clk_hw **)res);
 }
@@ -4093,7 +4093,7 @@ struct clk *devm_clk_register(struct device *dev, struct clk_hw *hw)
 	struct clk *clk;
 	struct clk **clkp;
 
-	clkp = devres_alloc(devm_clk_release, sizeof(*clkp), GFP_KERNEL);
+	clkp = devres_alloc(devm_clk_unregister_cb, sizeof(*clkp), GFP_KERNEL);
 	if (!clkp)
 		return ERR_PTR(-ENOMEM);
 
@@ -4123,7 +4123,7 @@ int devm_clk_hw_register(struct device *dev, struct clk_hw *hw)
 	struct clk_hw **hwp;
 	int ret;
 
-	hwp = devres_alloc(devm_clk_hw_release, sizeof(*hwp), GFP_KERNEL);
+	hwp = devres_alloc(devm_clk_hw_unregister_cb, sizeof(*hwp), GFP_KERNEL);
 	if (!hwp)
 		return -ENOMEM;
 
@@ -4167,7 +4167,7 @@ static int devm_clk_hw_match(struct device *dev, void *res, void *data)
  */
 void devm_clk_unregister(struct device *dev, struct clk *clk)
 {
-	WARN_ON(devres_release(dev, devm_clk_release, devm_clk_match, clk));
+	WARN_ON(devres_release(dev, devm_clk_unregister_cb, devm_clk_match, clk));
 }
 EXPORT_SYMBOL_GPL(devm_clk_unregister);
 
@@ -4182,7 +4182,7 @@ EXPORT_SYMBOL_GPL(devm_clk_unregister);
  */
 void devm_clk_hw_unregister(struct device *dev, struct clk_hw *hw)
 {
-	WARN_ON(devres_release(dev, devm_clk_hw_release, devm_clk_hw_match,
+	WARN_ON(devres_release(dev, devm_clk_hw_unregister_cb, devm_clk_hw_match,
 				hw));
 }
 EXPORT_SYMBOL_GPL(devm_clk_hw_unregister);
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
