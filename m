Return-Path: <SRS0=tT5V=F6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36218C433DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:20:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6584221E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6584221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dgVVc8Yc7kVImuWwkGcYfniq/qrG1y9aaleF6iepnPE=; b=FujkRpCShZBPDwmKTdinlUc/4
	50/FmHpK4M6JqAV0AcNMcDG1OGs4Aha2HsJFnMxFZLgZ5xPm90l1ACPWyM5zDY2bgZyMMyS74SyJH
	5LeCQdGCfT46rKua5838TCT3ktRQMrdZhw3VqKQzNDlz841z4KDtvlkOEm20SwQxoOUzAB8/bvqvf
	I6e5J86oDw2eif5vK87ZdII7VykkR5tCdtJSXAqOikrUDLc8hBkBXYfIJGj9rUYe+F8UDEBOxvIKR
	meYsaoBSOBl1JFgESOs6xTFi0n6xgHo20jJ6Zg9R8r1ZC0kjx2WPfNDRzXJxBJVeT3JobfF6B4hmH
	hkUkTL+sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt8YC-0005fa-TO; Sat, 26 Dec 2020 12:20:00 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt8Xp-0005Vl-7f; Sat, 26 Dec 2020 12:19:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id d17so8603000ejy.9;
 Sat, 26 Dec 2020 04:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jgtk+KcYyeTyKMF2wBck7uk+kOOkd8Plk6T6cyUk1SU=;
 b=h0MV1bgX+w+hpPaEDwSDbkou5jwKH2cZNkqWGQYlliiu2AMHrlF2ho8iDlO9vofXAO
 aGz2mnJENLqSqhGBCtvqTiuratZ/R9LSU1zSAcRJZvTteBi/lvdxd3AoXz7jmng7fm/R
 VG7MpdnH17d3SFXK5/oeB8PjLdiZJKL5hHgYuxk1A5RxxEv2K47il3iB5+Ue+f+X/tey
 agltcayNClMcjHi0IDZTW5xkR9eSesUqcBCMtu2j5XA7QiH2PMH3Qwm1kfHfAZSUd/rw
 FS0kJajLFOJkpJ3yHuakUICrDiukBLweKzekiB1IOLcnGu1kOvqrtgsnusIQrf3cbhoG
 j7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jgtk+KcYyeTyKMF2wBck7uk+kOOkd8Plk6T6cyUk1SU=;
 b=ab7lk2FteRu7Qa7VBmK1thQbmKNXhyBMdTmsBLuk7fGvlm8S+HeAntM8CCXXxXtMvE
 UarXjl13e1LZZWgOs34PeiO/aeYpDgS/pzx+a7UJZdOGBCopxrObVkOjknGaafxbxw4s
 bXrI+O49L1hvKQvJm9WZCwuQSDjTe6RauinAijoqQ1ybRv7+Kh7LzNapScOWrBMpgEmz
 R22zJpCoEwp/ShEIyYyx2xH+N5MpkWt9UlZ/4H8coUncyKC6O4F4E1udfhstwx33huF3
 4pwA6LJdLRQsTO+PVE31eS/PM93XsrkQBr0+/2tJNm1iuLA47zUOQfYlc3UCqjlpaRVB
 uUgQ==
X-Gm-Message-State: AOAM533JaIeGDzTWDlCIFGbI2PwVxsTA14/MaBI9JqAFn5xqIc/Lth5Q
 xnO0IdNgwafkv2GDkq0nVUrekj/m9tU=
X-Google-Smtp-Source: ABdhPJzHaWUeLtjGXKYoDfO7HC3w7pkh1RekDFMx1JlDPGbafzIaTA84by+pmeSOGaq0otfnF7PKrg==
X-Received: by 2002:a17:906:971a:: with SMTP id
 k26mr35375666ejx.515.1608985175831; 
 Sat, 26 Dec 2020 04:19:35 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137218200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3721:8200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j9sm33842662eds.66.2020.12.26.04.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 04:19:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 3/3] clk: meson: clk-pll: propagate the error from
 meson_clk_pll_set_rate()
Date: Sat, 26 Dec 2020 13:15:56 +0100
Message-Id: <20201226121556.975418-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_071937_323036_A8F1D88B 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Popagate the error code from meson_clk_pll_set_rate() when the PLL does
not lock with the new settings.

Fixes: 722825dcd54b2e ("clk: meson: migrate plls clocks to clk_regmap")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-pll.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 5b932976483f..49f27fe53213 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -394,7 +394,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!enabled)
 		return 0;
 
-	if (meson_clk_pll_enable(hw)) {
+	ret = meson_clk_pll_enable(hw);
+	if (ret) {
 		pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
 			__func__, old_rate);
 		/*
@@ -406,7 +407,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		meson_clk_pll_set_rate(hw, old_rate, parent_rate);
 	}
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
