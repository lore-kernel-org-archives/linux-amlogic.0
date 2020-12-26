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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48D2C433DB
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6126B221E2
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Dec 2020 12:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6126B221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7nNJjkln10k4tNpx2LHi5xIaQCQJsEbMwXd+I9KbFuo=; b=on64OF8zhaCa2pEWVVlYLMqIJ
	IcuBinkHarNDWaBTpbp/rXtlUB0Fyt/yB/Ju2U3vnTu9jqqSw1vw7Ndquq4GUHJTZQRm3KELzLIiS
	I2WOARf8leIzPMGcQu0PTEOVQLb2xOlqsvRwkQwfrwJog36k/jPbnlErAOskMNV/qutqPVaiDjCRJ
	6V6Of6u9KvjZ9c+oDiqGehc4jwDJzqEuJPRCxd4qKn4ttso2swwITN/WjjObFLszbMFhOm7Roh82z
	abja6N0bF69p+lJJCqsyGnl63UaQTM28IEf+09bLt9k+N6xUZqf97CgzPhsqg2j5r6Osvr3xqEkoA
	Of6RYYm9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt8Xr-0005XM-Ht; Sat, 26 Dec 2020 12:19:39 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt8Xn-0005V3-EE; Sat, 26 Dec 2020 12:19:36 +0000
Received: by mail-ej1-x634.google.com with SMTP id qw4so8573011ejb.12;
 Sat, 26 Dec 2020 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=91uzX9btarYwTY48OYqVxCEpJMafqGhM2WDmwvMf2Sw=;
 b=o5krIQlBbFhNaKiyKPhMe1CnTfx/qpi2Q/3thkkIJvjGnJC72ealIx5Oh+pdBbZrTf
 NmT/WpQ/EVCy8FMLda5DsUYxqSgCxDYv9GeACSMig54Z0/GaEw42/qFTRZ0pVOyZ8Po8
 5DFy0lvRDSOH/90p5HXIFIAMMPzteeY0yjkQ0PcuzRlPkyI4qTcZorA1zhV3ToEgdsoi
 AaXufWncHt28dOh3/qEudRyVq6BluZCktrI7JYDA9fVjl8B5rRvI/+cZABF9no9czPcV
 a+ztkbfrEwVLtRSXzaMOV6YO8QQwRQW3n8GYB7P2cZJdA73d0M6OnLGS8cODr98tHB/8
 Wp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=91uzX9btarYwTY48OYqVxCEpJMafqGhM2WDmwvMf2Sw=;
 b=XoU7pksAbL3T9JhElWFbbZ1/sv04wWtag3DW/FBLt2HdNz2+B++DjfNw8VEfMbG2Ho
 +BDx+N1BUqy2U3CTmdW5QNWatywH/IzAatZuziT22lQArsr5HBsFXiydfzy5M/R3ByJL
 WXsJZOFeF+um2Z6M+08hrNf6fb8rQCTWrDpD+0/cz0buEGWZFqZSbaVB5A79H+Mfd3g7
 Kvhfb0dqCUF3NxYAQ+NZD2L5bsetUT+/Xgpgd+ofPpNIYnC9D5Qtv26t9hCau1RisY0/
 kHYf5jAAgxW0FGpb5uqP2Q+8+ra+jlPsISaKgF7Cp5Zf3JwlOe4zfEg7uTHSuikKNqSh
 QhHw==
X-Gm-Message-State: AOAM532w9h5b56P+C1uveSukAHJPXKscJmZ1hCOCmnku9vLkxYoJt3w2
 z1Hiz5Bpv7y9Pdi8KePIwAXEpmsCjgM=
X-Google-Smtp-Source: ABdhPJxW3YGRfa4J2RJQPTSv758UIElxdRO96NXJv6iOlUdtwSq6Q9RL32l7OoaHk5kn5ZtqlwHyUA==
X-Received: by 2002:a17:906:174f:: with SMTP id
 d15mr28145594eje.52.1608985174028; 
 Sat, 26 Dec 2020 04:19:34 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137218200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3721:8200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j9sm33842662eds.66.2020.12.26.04.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 04:19:33 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH 1/3] clk: meson: clk-pll: fix initializing the old rate
 (fallback) for a PLL
Date: Sat, 26 Dec 2020 13:15:54 +0100
Message-Id: <20201226121556.975418-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
References: <20201226121556.975418-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_071935_534431_CAD40FCD 
X-CRM114-Status: GOOD (  14.52  )
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

The "rate" parameter in meson_clk_pll_set_rate() contains the new rate.
Retrieve the old rate with clk_hw_get_rate() so we don't inifinitely try
to switch from the new rate to the same ratte again.

Fixes: 7a29a869434e8b ("clk: meson: Add support for Meson clock controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index b17a13e9337c..9404609b5ebf 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -371,7 +371,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (parent_rate == 0 || rate == 0)
 		return -EINVAL;
 
-	old_rate = rate;
+	old_rate = clk_hw_get_rate(hw);
 
 	ret = meson_clk_get_pll_settings(rate, parent_rate, &m, &n, pll);
 	if (ret)
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
