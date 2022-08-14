Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CFEC25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 21:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nOKQ6myN4ndjOynAd6WeQorwsVhVpvT+nQqd+3jQwL0=; b=puqYWPju5xSeWv
	mzWrQMt1mGY3QfzXW00o7mGGlQRNhTQ3zfeLbPdva7Wj5vgM2XUfAZIpEXjHwZvWoVorVCTbdJ6Od
	ooxFbQOzFG++tL2EL6NArEBe5VB9QJeFhRbIPz1K2ovHP1UlBm5rB8Pn5qC1fFJw+ly0Ph2WUdHUP
	736FUn5odCJ38vqMNkBYzaLEh8+RxDgo6R1+bFumiKHyh7RE83H15oHmYnfxNVKyOR8oYdXmMqu69
	+oMEXWyazcfrpN9VcZ8tU0kTnxlNCB7O4u6MYlP//dfT00RP1XZM9TmKcjXRFfLhGKv5qOtDi9KzK
	xLd2Y+TvMYIWqiNAkwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLB3-009GNk-Sd; Sun, 14 Aug 2022 21:29:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLB1-009GM0-3J; Sun, 14 Aug 2022 21:29:44 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f22so7487451edc.7;
        Sun, 14 Aug 2022 14:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=AqecQy6KL+dyrHbPbN0H6O069pqDD1q//SRpEmJs3Tk=;
        b=ZV4rvAz8j4OiykMmfmEqslHAfRQi0/ErQS12ZPDLOugqNBJOO1Yl1VAOJVeIsa27LX
         JZdPavEDOpXeBMxQ8aoOnRyrlgBPCh7qNWNBWtjJwfUgpk+WSZQDi1P0eo7AYTX4D3/t
         V5i3Q1EV7JV9qE7Cr8wmUQlInqkmdFcSDaOvchlguj0E04zGkS76kpOz2peyPyFTSkFi
         FciIn+XmJIRWhGwow82ujQ/Zbk1q2V0PgYBPB5m8qHfQXVf1/YTWjgHvy+DAwT3s1F5P
         CsLRHQqSoojtlUYd1mP20OBf3B66ZduZLSHEfO4VYo1XG52/kLPRvewKRjA0BavDQ11m
         BDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=AqecQy6KL+dyrHbPbN0H6O069pqDD1q//SRpEmJs3Tk=;
        b=y35gHJZCD49QqxLe0Mz7AIPjWY9s98YLSuJHkUyr4gAP1m7ohg02r/h2jeLTMSHBHq
         vn5QMlzPxcrNe9yImJ79rbGCz+4Kau+FeotzIX4eCPwIkRqLDnLhlUu/7k73fHxqZ6uC
         hu1yyGWrsbrcWjdhLt6Js8R4M62tDhRKJ7+1lKPTTahXjBxo+8OMapsXZxpD6PEU94eC
         8dUFnRsOBe4A5rB1vcZNLEuqFNrWQ6k8lEzu5RN6FejFkliE73EgU43JPoqVZOGoOW2z
         GRz20E32q6jzMVgF0+mlm6crEsV5IC4RoUsORprPMShjb8pKXmErjyu5MaQBb1b0vXfK
         qV4Q==
X-Gm-Message-State: ACgBeo0ryrqYxZGX7jB7f2jSHMsc2T8xS36JJPGgp6N3/HwNKWrbBCxU
	uKpr8AWRyfHYV8ylJ4yV390=
X-Google-Smtp-Source: AA6agR4yRNP/AbhzJeM/gy+WgKeyWQZBV/HqoJ3i5RlhlPeywYgPQj8AjdauI0fnoGinAD4Vf/Dltg==
X-Received: by 2002:a05:6402:42cb:b0:43d:bf29:cf89 with SMTP id i11-20020a05640242cb00b0043dbf29cf89mr11640068edc.400.1660512579811;
        Sun, 14 Aug 2022 14:29:39 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id gv11-20020a170906f10b00b0072af4af2f46sm3325740ejb.74.2022.08.14.14.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:29:39 -0700 (PDT)
Message-ID: <22f1d799-a3bb-3d71-a3fd-f6128b205231@gmail.com>
Date: Sun, 14 Aug 2022 23:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] clk: meson: pll: adjust timeout in meson_clk_pll_wait_lock()
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_142943_272094_0C4B8336 
X-CRM114-Status: GOOD (  10.37  )
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

Currently we loop over meson_parm_read() up to 24mln times.
This results in a unpredictable timeout period. In my case
it's over 5s on a S905X4-based system. Make the timeout
period predictable and set it to 100ms.

Whilst we're at it: All callers of this function return -EIO
in case of failure, therefore we can return this value directly
in the timeout case.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index daa025b6d..d70bee331 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -277,17 +277,17 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	int delay = 24000000;
+	int delay = 5000;
 
 	do {
-		/* Is the clock locked now ? */
+		/* Is the clock locked now ? Time out after 100ms. */
 		if (meson_parm_read(clk->map, &pll->l))
 			return 0;
 
-		delay--;
-	} while (delay > 0);
+		udelay(20);
+	} while (--delay);
 
-	return -ETIMEDOUT;
+	return -EIO;
 }
 
 static int meson_clk_pll_init(struct clk_hw *hw)
@@ -350,10 +350,7 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	/* Take the pll out reset */
 	meson_parm_write(clk->map, &pll->rst, 0);
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
-
-	return 0;
+	return meson_clk_pll_wait_lock(hw);
 }
 
 static void meson_clk_pll_disable(struct clk_hw *hw)
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
