Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F0C2D0C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C17120838
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 20:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRPHBt2L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TXs0Sard"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C17120838
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z59SgUVqPHW5G/vhud9KVScLx1rbW08BqomTZUnD7Gk=; b=VRPHBt2L4rAEl4
	bUuz/10EMNqlKq89RPolVbUE99sZkGxa5jzKFgaaE/uShZV66sgfeLLrd+KafyCCjwkeuUaZyYr8M
	s41vNgdwTsh4LOFGyF+UWtUlmGKfRw8GXHgR0jPS/8fzY4tht3tQXKMcuRdMdHQA0jvoYHkATQiTS
	N+t6yiv0JJGzKt34rEJBJr9lV7idlA+hVGjvoi1yqLcBlkRKHfCfL0Q8Fu+1xaFzn5K7kEJA8zIVm
	IAPavhprWA7B5pfSQUolB/ZmF+kFXUPLmxBafD/KVD3MER93d2OpJldJbEXgPqqpcdELc3z3d08T7
	a82QOT1O3n0yDwQs5kQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikZsu-0005N9-B1; Thu, 26 Dec 2019 20:37:28 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikZsg-00058g-UG; Thu, 26 Dec 2019 20:37:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id p9so6648323wmc.2;
 Thu, 26 Dec 2019 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlpoftZGGt5ZxOkzr3Ne9r9WJXqLw/2Ls5n+O9xqa34=;
 b=TXs0SardSpGDFiz51f0yVTJjcIODkle3g80fyVa23yKt5iYDgaTARfMq5JqsWOYcui
 I0JWzavDBYEDVd/pZWQffFwZitdT62trvturTiFl1DbZf8dNd9hbEtIYWe0R5YHeuu8f
 g0xpHZwRUmAQFuK5M23+3b6MnlvJJEw9u+1hhitRu51ByYFg777JWBBNPng3WUoMsUZ/
 cdtAKSaZwkU46Nt8w3SIojkAYAGmSsAYqcFeK0UM8Jnohtdd2BCMrnfM9+NJP6Y1/KmC
 8yhQAW8mu1n01I7STIjjolKGOsCSm4yjumqawxwTZChQpViGIZj0HDhu3C/XQOqADZls
 7T1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlpoftZGGt5ZxOkzr3Ne9r9WJXqLw/2Ls5n+O9xqa34=;
 b=H6q9yMBihpk0VhgtppOnGhnTRcDO/EDRyQAQ17MoKtrz80+GSJ6BQSEpdGM44DeHU5
 1xZQivpbvVR2LTL26Hc5MPmjXZbCJi5cT7udMgGtvpCnLd08DWx1rps/tqJTQjcAimA8
 zYa4oeiDDFCIdx0zgQxTfxcpoGrrhICvFkaElk6yjApGRgjif6mvldiaZRrxuYp8aygK
 0bRo9mqfzV5S2Qz0yzYpD64MBogCHk3jbhwLvW4qU46bIIOHnkr/RtHf++ixY9LaUq7X
 3ZejdUhvCz0tmkigFlySmg3UjE8iUcv3G2T34ayHNbNJF76xQZxFSty9OlJSQYQAHCpe
 loGA==
X-Gm-Message-State: APjAAAWCUfrd2TCJ3V2m0qmROYe5GhxWXho2ue8ufj1f0nFPfenPzICx
 3lbyr0h/TnPzyrTws/yfsmU=
X-Google-Smtp-Source: APXvYqxExgvLmz+gPYWg6NWhbJXHwBZLfEIvVZDWTQrIG6tV/S5JlL+7XfMsoQbMEZbc/nVRgwahbA==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr16019186wmk.68.1577392632618; 
 Thu, 26 Dec 2019 12:37:12 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q3sm32911665wrn.33.2019.12.26.12.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 12:37:12 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: andrew@lunn.ch, f.fainelli@gmail.com, linux-amlogic@lists.infradead.org,
 jianxin.pan@amlogic.com
Subject: [RFC v1 1/2] net: stmmac: dwmac-meson8b: use FIELD_PREP instead of
 open-coding it
Date: Thu, 26 Dec 2019 21:36:54 +0100
Message-Id: <20191226203655.4046170-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191226203655.4046170-1-martin.blumenstingl@googlemail.com>
References: <20191226203655.4046170-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_123714_970623_47611ADC 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Use FIELD_PREP() to shift a value to the correct offset based on a
bitmask instead of open-coding the logic.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 0e2fa14f1423..1483761ab1e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/device.h>
@@ -32,7 +33,6 @@
 #define PRG_ETH0_CLK_M250_SEL_SHIFT	4
 #define PRG_ETH0_CLK_M250_SEL_MASK	GENMASK(4, 4)
 
-#define PRG_ETH0_TXDLY_SHIFT		5
 #define PRG_ETH0_TXDLY_MASK		GENMASK(6, 5)
 
 /* divider for the result of m250_sel */
@@ -261,7 +261,8 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 					PRG_ETH0_INVERTED_RMII_CLK, 0);
 
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
-					tx_dly_val << PRG_ETH0_TXDLY_SHIFT);
+					FIELD_PREP(PRG_ETH0_TXDLY_MASK,
+						   tx_dly_val));
 
 		/* Configure the 125MHz RGMII TX clock, the IP block changes
 		 * the output automatically (= without us having to configure
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
