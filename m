Return-Path: <SRS0=vTSx=TM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4957EC04A6B
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 20:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2E920C01
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 May 2019 20:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PthHlva1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hPLqw9Nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2E920C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1eAYLPGonP1n1m6w4IZaXtbiClZhsPtP1WJHbgFgeTc=; b=PthHlva1Z4bI3R
	i/UN5HgONodMPnbIhpBu4F8AL+omWOxWWNtTrnwiAWCFQ/Z8MTDg2J3OAhrytSRCyWaBJa59sHPO8
	bTgVZHCQxpLH59tlQm2CkDtiJz3WzpBsNbxGPJfcR3OomEM6ip3l/teKwzIHC2eSRFcAlLtbNjDYe
	o4JE9N2I8oxSr1avWSy3g+bnjrjjgD0f2u4PpJ4kdu9StMw0vh1GuaHwpeE1vo9tItsC+Ik3ia71O
	fnzhYl3kSDamQuqcTR4cNKWPtGjyEKRwX9MvpX3RHwjjykFzmIItvk5hcuxKBqBsOLNrEig6QHoNA
	HhuEt8+9YrXjh4iZqxtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPvXr-0008AR-QQ; Sun, 12 May 2019 20:58:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPvXo-00089D-PO
 for linux-amlogic@lists.infradead.org; Sun, 12 May 2019 20:58:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id e15so602736wrs.4
 for <linux-amlogic@lists.infradead.org>; Sun, 12 May 2019 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sm9UEwQ3mt6/GT1ya/gcLVA0odO8xivuaaUGOOt4No4=;
 b=hPLqw9NroyF97KvvhKpIe0wPnef3gIPB4pjDSJW9Jzke60ROE+9tnEZ8Z+AOiwE47K
 TJEoGTYE4jfwwz4sE8mkYttcVJyaT4XHE1IL4g+689KKKC3SZyNqcq+hMYpnvwJDo3Ly
 /GAkrLx9wjGbbbbGrSOyc6Kqld4m2KRu4d/eE4haXvTR2s8uUtzTqwusuY2JMNImsIb1
 7w2hheTMNGldIiGpKYG3uJjEWWca9SrmgxrpQGJAorSmd7HGDQxrO9oEpVjzvf5O6knc
 z2fSkgBwQHyrB+yh6lXbsYvPpM84xjHEXHBENz30aooPFuy554whRfhtUCR/GxlqMc+G
 h3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sm9UEwQ3mt6/GT1ya/gcLVA0odO8xivuaaUGOOt4No4=;
 b=H8SCm0ZF4SVXtgjlyZwsPMdaPcsp5z9Isn2poTU6GNcoaPxjPewpjlFZjxGobzVppE
 BkvpqVSfbtRkssef7aYYvGxUXyV3QrI/VIPAOTGeUY2WJSSt1MBGSMWBnSkG3kMETu/h
 2SS5i3vcFbmxzyFEp5T6tdfHAYhyNVVGi/nWlCenKEd7egeBu7Fx2mpEF5RFf0LVLLa5
 bfkJs9iHpUQI3R5iwLks46xiSpEosMMo4COQadoQN1JerNCDQZbeAMQ/D0CVA9e+7iOu
 +R6nri74+br8SSuvrnRhWGyfkj6G02NUyCilb2rpsnphgmMxME8DlcORFL1TiQBX8QKa
 hgZg==
X-Gm-Message-State: APjAAAWL0pHqe2f7I7xXvTLc22amLZ08N0KiHPkVS5MdlAYchXcKEzVl
 itEjF3o9Nu1EpNBmnuOIVEBFEw==
X-Google-Smtp-Source: APXvYqw8T4YnO6cWYWIIJcnC34eAvY38shlhSF9rcgw5hN8w/eUPE6JNCP2+VaqoLH0QgxrHKgRNUw==
X-Received: by 2002:a5d:5701:: with SMTP id a1mr15615178wrv.52.1557694678203; 
 Sun, 12 May 2019 13:57:58 -0700 (PDT)
Received: from boomer.baylibre.com (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id o81sm21483068wmb.2.2019.05.12.13.57.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 12 May 2019 13:57:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: meson: fix MPLL 50M binding id typo
Date: Sun, 12 May 2019 22:57:43 +0200
Message-Id: <20190512205743.24131-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_135804_827233_66C9472B 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MPLL_5OM (the capital letter o) should indeed be MPLL_50M (the number)
Fix this before it gets used.

Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Fixes: 25db146aa726 ("dt-bindings: clk: meson: add g12a periph clock controller bindings")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c              | 4 ++--
 drivers/clk/meson/g12a.h              | 2 +-
 include/dt-bindings/clock/g12a-clkc.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 739f64fdf1e3..206fafd299ea 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -2734,8 +2734,8 @@ static struct clk_hw_onecell_data g12a_hw_onecell_data = {
 		[CLKID_MALI_1_DIV]		= &g12a_mali_1_div.hw,
 		[CLKID_MALI_1]			= &g12a_mali_1.hw,
 		[CLKID_MALI]			= &g12a_mali.hw,
-		[CLKID_MPLL_5OM_DIV]		= &g12a_mpll_50m_div.hw,
-		[CLKID_MPLL_5OM]		= &g12a_mpll_50m.hw,
+		[CLKID_MPLL_50M_DIV]		= &g12a_mpll_50m_div.hw,
+		[CLKID_MPLL_50M]		= &g12a_mpll_50m.hw,
 		[CLKID_SYS_PLL_DIV16_EN]	= &g12a_sys_pll_div16_en.hw,
 		[CLKID_SYS_PLL_DIV16]		= &g12a_sys_pll_div16.hw,
 		[CLKID_CPU_CLK_DYN0_SEL]	= &g12a_cpu_clk_premux0.hw,
diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
index 39c41af70804..bcc05cd9882f 100644
--- a/drivers/clk/meson/g12a.h
+++ b/drivers/clk/meson/g12a.h
@@ -166,7 +166,7 @@
 #define CLKID_HDMI_DIV				167
 #define CLKID_MALI_0_DIV			170
 #define CLKID_MALI_1_DIV			173
-#define CLKID_MPLL_5OM_DIV			176
+#define CLKID_MPLL_50M_DIV			176
 #define CLKID_SYS_PLL_DIV16_EN			178
 #define CLKID_SYS_PLL_DIV16			179
 #define CLKID_CPU_CLK_DYN0_SEL			180
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 82c9e0c020b2..e10470ed7c4f 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -130,7 +130,7 @@
 #define CLKID_MALI_1_SEL			172
 #define CLKID_MALI_1				174
 #define CLKID_MALI				175
-#define CLKID_MPLL_5OM				177
+#define CLKID_MPLL_50M				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
 #define CLKID_VDEC_1				204
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
