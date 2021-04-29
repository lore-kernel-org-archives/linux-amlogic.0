Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452D1C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:04:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F85761449
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 09:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F85761449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yEFiytA7wMGFPV6v0Z+bLER93gRNi/xiEB8nX9u6U0o=; b=HWorrSCrDft4GKbRNwL+rw1LVC
	4XRQsDnofDg2eICzVyoIU+/SkTfhTRxbfhViFhrM1Z69CZQ3/pWdne9C9RXjEMjlm32iEvkDXvMim
	wEN7arYav2fcu5rJQiSEGYECJY3YeZou46sBSsolCWMJXisfwoEZ+xgq3ybU6x3iLljse4Nkj3bD5
	mj2Un6g5VMYSkgmTqlANsqm+hBLoR7hwCNgMTxwHqWcsJLjdTmqBBT9YxYYCpX7dDqTfPv3+/QQ/s
	ph14HVtGLvjTxX3ER6i5aQLdmpkmBhbRy0ux1Ew429hDNheildJ4CKeLoJ8QcAQGAW41W648sZG3Q
	PWqTWt6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc2aT-005PFX-DY; Thu, 29 Apr 2021 09:03:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2aR-005PF4-Cb
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 09:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=W+HLzXbkNngIE9tkgHqx97GNCxRpXGXx8Ojt9z/evco=; b=26//cj4RU37kUlev/kL+dJ5UKu
 hwiAEH1IzBajNaBLcbq1c3+DwcPVChP9fIHrIQ6+3/Vr8tvkn9vc8UPJ4WvWIXpcwBFRbfk7Aeox9
 lsyS9FsSEgRQr+lfEDqfPjHkMyDhq0hcPMHjH5TwRC8Sy5BJHpbEquE0lCT1m0nkqpo34D6Gk2l0v
 /+Sc4nXDSCB8KDMbdA5k6QzsdsCgVMxk+qZV7SHJ9x/jTbUYgKjVoLHF0fu+5dfyUyvpZxs94QVL5
 H/p0fsjPUt7HNEIINkm50ZR7tqBCHOlk9DLKMCTAVqJP0J/WKavS/A+QVMj9ZgYnYi8A0kYYet4Bj
 mfcYiqTg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc2aO-000Vc6-87
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 09:03:53 +0000
Received: by mail-ed1-x534.google.com with SMTP id q6so18369874edr.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+HLzXbkNngIE9tkgHqx97GNCxRpXGXx8Ojt9z/evco=;
 b=GBItjtMHIl9+fy1sfAPi2drO9fIPPAf3u5xufxexjqsbdmF4uIINYvXOAIEZgiqqNo
 Wsdh5SY6oBaU0E1YBTd6SU1JID0yqbCaxQnC2QDGLRJDbsf2jA9M1uy6tP9NMdj/TI7O
 0SmHpAVj7lb1ZtvDMcU9EZ6CvFVspZUa6fbJzCGMuw3GbAz9due6dTzo5homhF8iyNJ6
 /XpUIyOnfqwtLwANoXjV3u/TaAUj8Z51+IELjYn2/NvqFiyGamW/0fe71ZpTDQUWqOIv
 N8Tl3L99t3uQNKJ7edqd2pawkvQ66odmZ9Z1yKetCmS56MWyapKxPrweuxY0hGLmW2Ru
 0hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W+HLzXbkNngIE9tkgHqx97GNCxRpXGXx8Ojt9z/evco=;
 b=deracxIM0uww3pUHVI9pTbrOJ1BEk2gXn5KAn55STOHj2Y7shPMxC7XFXTCtcoevM8
 VTjx3yWKiVpj2sy9BvAPqzXAExUDcsAjQ4BjuFRZgTZ9s2Vqj/Cf+Joqv6dTQoVdgPDo
 uwWN/1ElnonhsRiThCE8vN36xuv7NRBLpcYeyifdufjaB/VKW0iftxPMRPXaXelCP3qF
 G2mLRcxLISnZHG8l/x/4ZDDoWAUwLbZullzZQdE/FQKSqqjPf7Ow5VbraPwjaQrttdns
 9Ww8R9iHEVAJqSQrLiD8a7HJ9xt5/cMvw9iuTxCu6rnIikx4uXGo2uogOQe7OuTzsRYG
 Ka3w==
X-Gm-Message-State: AOAM532HMJHrpr23IiZL/PuQhD882b5+OMnbjk6wnb0fZq2sB3knclsp
 Wt7oXdPYjz3Jd5cvF4CUJ2RQs1Mwukb/a1B4
X-Google-Smtp-Source: ABdhPJwI3INalSk/5D1+Nz2RIt7IqV/JfVEmFAdW+NvqkU08BDtWe79kNgj0WIjvOe3XIFipym9Zjg==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr16987380edq.37.1619687030544; 
 Thu, 29 Apr 2021 02:03:50 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id j4sm1441152ejk.37.2021.04.29.02.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 02:03:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
Date: Thu, 29 Apr 2021 11:03:25 +0200
Message-Id: <20210429090325.60970-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_020352_307127_B3FD7F86 
X-CRM114-Status: GOOD (  13.07  )
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

While some SoC samples are able to lock with a PLL factor of 55, others
samples can't. ATM, a minimum of 60 appears to work on all the samples
I have tried.

Even with 60, it sometimes takes a long time for the PLL to eventually
lock. The documentation says that the minimum rate of these PLLs DCO
should be 3GHz, a factor of 125. Let's use that to be on the safe side.

With factor range changed, the PLL seems to lock quickly (enough) so far.
It is still unclear if the range was the only reason for the delay.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b080359b4645..a805bac93c11 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
 };
 
 static const struct pll_mult_range g12a_gp0_pll_mult_range = {
-	.min = 55,
+	.min = 125,
 	.max = 255,
 };
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
