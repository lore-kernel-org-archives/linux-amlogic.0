Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD24C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:26:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02722147A
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5etCPPM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VEzl5VWi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pAVKDPg0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E02722147A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBFUb2mSzfQnDjfal1IFjhxq3LOATLYwuHhz5ArKlGc=; b=l5etCPPMVu+Ykv
	f/V54AieirbunYTnunQ8TbFCfjmjmVM3xpOJQ5ImO+I+X2f4fOQcO/2ddHfo1EErThIpW5BQg2Lfz
	u+qNINOQ5z4J/2AViBtI+lh8JBqLmkqE0yDqZOgsU0ZgfDgs4aCU6a508u0UCVso+J9BJOHNvlwD+
	HZWzABtU/x6rSUpQoyjRbm+AVsa2Y6pSusH3Y9HMz5/a37y6V6YkmU+zYz7ZKfO8akjbt2Y+5HQKS
	oDSNuyYAJcQXePZtLfB0nh8amxMla4UjPktJ9MwuSbnnlHUkXwzmLxe1pq67fd3Uf0nnIT+eYXfCf
	oLYZxS2S14InR85tJa9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBbX-00039M-Sk; Mon, 28 Jan 2019 18:25:55 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBau-0001gK-V0
 for linux-amlogic@bombadil.infradead.org; Mon, 28 Jan 2019 18:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4wf9FAXSPyYzzMogrRK8K8vMBiOAXKZiQZa3fRw2VeY=; b=VEzl5VWizX/NAuGQe6nObSECxH
 FM0PRhEVQouY9dq/M+1oiL1RG3DzzRonkfjvrXfsg0BoIbxc1komm6k4df4M8KcbwfgTI5d7jzKIN
 tKBgpQTPLZHym0svVhaTTv2QbdNESval1vqpZjwujQcdx0ukOA3uPquFgPxpMfPh5zPSrldiCcOZK
 GEXF5AHkeliHO+qNw2g80SjoRIKg5gkG5CSe3xp6cUJhJqYQiuQ9Tud0f3Jqv7Zp3TD9VxBhrPQ/F
 IPuITrGmCLy7OYy4gJuzEPVImtI7+59L+l1PjwYGUXbcAKUQC0U7/kO8Nm3AqJBmLwKLp66vILtVf
 OwmVcHJw==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBHR-0002ua-EC
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:05:12 +0000
Received: by mail-wm1-x343.google.com with SMTP id y139so14893883wmc.5
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4wf9FAXSPyYzzMogrRK8K8vMBiOAXKZiQZa3fRw2VeY=;
 b=pAVKDPg0Pm08cuC8o0hw5D/VrYpOKQ6CKzqXA6L/cQ6OzR7OMKDBtPu4Aghtl8Sx47
 RoDoP4Yh/ydPBu2tTQGJll0VfUElhArZksnOZ7/SNkJjFsJ+QHBvI02iR//UIU/Zlj92
 AijANg0jt6jMbZpvcNhTRF4fDcWlxphkLBVIFrA/fbCkM7DRbPLNnbLBqsPnvwqLOz4L
 W27uG/V+37FNXPyqp1HysQmNQXBPOFh7qkKPWCHIandCIvV5DoI87D1L/IprVTk7hkyp
 ZQY7s8ze0GnSpSPvsVjNcjIDYU3nwRXnxsXBu1EBBZQYuSnYRn+ejlquTub0LXhjfRoV
 yO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wf9FAXSPyYzzMogrRK8K8vMBiOAXKZiQZa3fRw2VeY=;
 b=flI8kG73mGDqYqpQIBd5TG5UQQCR2YXnL9l8xE2ltRqnvpIkoUzvQRIkBlv7rvguAM
 f+LDmRa+sokBSfmEw1xTbr+jpi+9gna3G1fyVtknKKxdN3Rh3AivkfrXRsYXIOShrmTY
 OZBSmyEScxFKaqeYINbe4GruvtLuwzMtvktLQU/lnkvjxcjlULnZqFslaLTobH88nvs4
 lik9Aq9d+5vtfe+dckggN3Qs9DY7M+Vnsjje0xbiQoH2WrOy9oD8MUswvLo2Ktt9XBKj
 tfnne25RLFSG9CKNC2aqugWbOZTatZknyfwU4stG7ryzBLpV5uqLIQ0pyQsOb/qk9tON
 HYsg==
X-Gm-Message-State: AJcUukcktv1Dw17OeW+LTD5Q41nt4dQ5QOODpS4C+1cBjV141eJ1biT/
 1WZaoL2COxfhInFFBqnO1pFTYg==
X-Google-Smtp-Source: ALg8bN75sC55jztbjVVmJDd8FxG0eY5D28u2GiTxNeyFtpJy0sKx6KZZC4T1/iMaBQT0GzM1D63dLA==
X-Received: by 2002:a1c:a68f:: with SMTP id p137mr16745488wme.64.1548698703842; 
 Mon, 28 Jan 2019 10:05:03 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.05.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:05:03 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 13/14] clk: meson: move sclk-div out of clkc-audio
Date: Mon, 28 Jan 2019 19:04:29 +0100
Message-Id: <20190128180430.28689-14-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_130509_532009_99FAD696 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c                  | 2 +-
 drivers/clk/meson/sclk-div.c                   | 9 ++++++++-
 drivers/clk/meson/{clkc-audio.h => sclk-div.h} | 6 +++---
 3 files changed, 12 insertions(+), 5 deletions(-)
 rename drivers/clk/meson/{clkc-audio.h => sclk-div.h} (79%)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 8db0508ec6ab..7ab200b6c3bf 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -14,11 +14,11 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#include "clkc-audio.h"
 #include "axg-audio.h"
 #include "clk-input.h"
 #include "clk-regmap.h"
 #include "clk-phase.h"
+#include "sclk-div.h"
 
 #define AXG_MST_IN_COUNT	8
 #define AXG_SLV_SCLK_COUNT	10
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index d3eea53945e9..3acf03780221 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -16,8 +16,11 @@
  * duty_cycle = (1 + hi) / (1 + val)
  */
 
-#include "clkc-audio.h"
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+
 #include "clk-regmap.h"
+#include "sclk-div.h"
 
 static inline struct meson_sclk_div_data *
 meson_sclk_div_data(struct clk_regmap *clk)
@@ -242,3 +245,7 @@ const struct clk_ops meson_sclk_div_ops = {
 	.init		= sclk_div_init,
 };
 EXPORT_SYMBOL_GPL(meson_sclk_div_ops);
+
+MODULE_DESCRIPTION("Amlogic Sample divider driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/clkc-audio.h b/drivers/clk/meson/sclk-div.h
similarity index 79%
rename from drivers/clk/meson/clkc-audio.h
rename to drivers/clk/meson/sclk-div.h
index 1eaf4ecac4f7..b64b2a32005f 100644
--- a/drivers/clk/meson/clkc-audio.h
+++ b/drivers/clk/meson/sclk-div.h
@@ -4,8 +4,8 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
-#ifndef __MESON_CLKC_AUDIO_H
-#define __MESON_CLKC_AUDIO_H
+#ifndef __MESON_SCLK_DIV_H
+#define __MESON_SCLK_DIV_H
 
 #include <linux/clk-provider.h>
 #include "parm.h"
@@ -19,4 +19,4 @@ struct meson_sclk_div_data {
 
 extern const struct clk_ops meson_sclk_div_ops;
 
-#endif /* __MESON_CLKC_AUDIO_H */
+#endif /* __MESON_SCLK_DIV_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
