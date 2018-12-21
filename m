Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C0AC43614
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C3721920
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VL51g3Wp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="su6N+hDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C3721920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRYOECK/llrRi/mXubejz04n9eSVl3CkK7um94UcAYg=; b=VL51g3WprXtH13
	DWDp3XETCCrnxNpXVf6t/RlFn23Nk/SRaXElOa50LlYn7fwwl0JgX3ZLB5A1o/iX+n6Ed3rUYCZsu
	2kWolKllEgjsimueSxP91ChsbDYUolqdLZxIEKkuCdA7j+Y0k+OusMUieI6UvbpZklHmwOQ7qwHWk
	0yA4PlubpXdYT9+JItrR4HMuu5Wn7o75zMxDX0Y7XjZ8n9huQuHUFq3VMgGaGHdJePTDI7+2k3+WD
	pTPUBTE9P3IDa/JWYo+ayGnWB8vzKk1ybAX1vHQ11k0gaJICd4hZzsA9qBkK5V6XlAz3SIXt5x7A9
	hjVeVdVccPMADu6MinFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNGV-0000Lu-3D; Fri, 21 Dec 2018 16:03:07 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNGO-0000GB-JC
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 16:03:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id p6so6203862wmc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDOhg70hFYOwseCBHyxAEd0RE2ixDZurR5a6abXMMmM=;
 b=su6N+hDKVAiNS5Jd6Z/sNgQPv6iyvC3hN2KRF7OOWM2CwwEs91Vj9dgAps9xVxc/4w
 QbcwQ7hGyQeizNHXM84Hc8y1knKW/tcgNaE3ZKM57o8XG0h4+mzfwK4JPnMutPLm4nBr
 ufMJP7PhF/VGKbY/Qfz69pV5mzjdV/ppemgr8C9c0NOGdGg5/SpD6FcQT+iQkGBRNLq4
 6bb6I7xzvDHiY7xoSuuhHqes1Bg/KI1lhMijFkvilm9BcmyeMk76AKAOu6w+tQuryDZN
 HU59twCQWCJA7Y2mEcmEGXcNLCwkP3Y3CX2PNrEahxvyFGskfsM1ZSC6M9bymqdufCId
 K3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDOhg70hFYOwseCBHyxAEd0RE2ixDZurR5a6abXMMmM=;
 b=U3gb6rPFr51HABTG2uSKX0HYNXPZk/0f0BEv/WaZfssDgNZsIR9JyNObH57X/aPZ9A
 hEkP4DUNR4eWTcBUj/r7t93EheIDClb6S6lUmvc2etoWfjV/4r9L/Os3kRS0uxNIVHrS
 xLaZbPXMAwpY97rkiztMKC21/tJw+D87vL/FxoDyddf1jO3YetyrZ/gEyDAy8UhqDdw0
 Rd2Cc9H71QNrDKjULmzfXVvM3H0ZNhPF/P9xaNEXGHB3UNmVcullz90LsZwJZqeDfFuT
 zn4pwLxM9SVlyoMz80zXNzP/baHYziJB61JZHxUJYvDezMnQJEnu13GpKh4v+szlTMnS
 KnJA==
X-Gm-Message-State: AA+aEWZJd9xC7aWRao2SqEZakFkrENKcuvJVSfOMz8wXeVuXwCbTRkY3
 /Yh7oJrOY10eMsQ+8WvE18YO/w==
X-Google-Smtp-Source: ALg8bN4chblCMfZezJ4NOJzu7yuQDWL120ghh9NaRoNpwN2pTUp9Mh15rexywcQDtXlMIvGEymFG6g==
X-Received: by 2002:a1c:5dd1:: with SMTP id r200mr3487436wmb.93.1545408170446; 
 Fri, 21 Dec 2018 08:02:50 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 y138sm13044021wmc.16.2018.12.21.08.02.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 08:02:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 2/5] clk: meson: clean-up clock registration
Date: Fri, 21 Dec 2018 17:02:36 +0100
Message-Id: <20181221160239.26265-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181221160239.26265-1-jbrunet@baylibre.com>
References: <20181221160239.26265-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_080300_630630_5F852D6C 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Order, ids and size  between the table of regmap clocks and the onecell
data table could be different.

Set regmap pointer in all the regmap clocks before starting the
registration using the onecell data, to make sure we don't
get into an incoherent situation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-aoclk.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index f965845917e3..258c8d259ea1 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -65,15 +65,20 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Populate regmap and register all clks
-	 */
-	for (clkid = 0; clkid < data->num_clks; clkid++) {
+	/* Populate regmap */
+	for (clkid = 0; clkid < data->num_clks; clkid++)
 		data->clks[clkid]->map = regmap;
 
+	/* Register all clks */
+	for (clkid = 0; clkid < data->hw_data->num; clkid++) {
+		if (!data->hw_data->hws[clkid])
+			continue;
+
 		ret = devm_clk_hw_register(dev, data->hw_data->hws[clkid]);
-		if (ret)
+		if (ret) {
+			dev_err(dev, "Clock registration failed\n");
 			return ret;
+		}
 	}
 
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
