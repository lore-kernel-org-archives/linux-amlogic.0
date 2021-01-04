Return-Path: <SRS0=8AZD=GH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675A2C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F04207AE
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jan 2021 13:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F04207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D0pCo567a6YBwhQOUQi5LPIT6uRvldYT644fEYnhEsI=; b=AOslplu7fRcet5vOtmh8CJXb6
	SpyKzFefv/mhMiv1uhjnjx9tsolXPlpUxUHEq8iXJ0Jg1Rkp7q03QKpu/+Bt5mNl/CIIrTLFh1DJb
	O1DQupXwxDQH5zvi0iatPd1tfB8c2DRFgnjgM6cnKtolZ+XdtvOxxkw+aFzgFU5+igAjWe2Q+guX7
	a8DCybpVoXwwQA3cHA7DDY7OvCtNfi27Rr33dGuCUulw7kAdIlSW1PqwAQ0kjRzkCIc6Qa5KndiOU
	f1IHBFckWkdQyALIwji5kqBk8h1OnQgslNXcJnhGjVu0uA31P4HfymQEDaaa70q9F2Cp/yKNgks/1
	1LkV5jrOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwPvK-00077m-Jt; Mon, 04 Jan 2021 13:29:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwPv9-000724-DO; Mon, 04 Jan 2021 13:29:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id c5so32157908wrp.6;
 Mon, 04 Jan 2021 05:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ju+fvznWpdnqKgL0XY4kkDus/LAK39t8IpQPOIIruIQ=;
 b=McBUAzMdLiwYXD5jLCbq0wTAXfCoJ093gSi/QpaxlQr0YZKpvEOIWm95LBuOwPAWMo
 cFTd/0EBuKZP2EKuzGxry+pOeCmeXVoqYjwImBgDg7+lAdgeL6ZFqICN1eoNwbwIASVa
 yRQWBi6E5ghBLs6J81QGYsdYfteZGCY5KAjMmeHseB8hjVqYxWEgDCq5OYdrNY3/Gmfg
 YM2QkFqj4c2qHqnr7Pg2/N70/kffN/Uv3LaA/pfsFVVD+XsQgDXcZ+BECc8UWUw/fFS9
 5D/qd3KjxpYfMn6qG4zl7o9zcfF1pS8K6EXYt32LNIuCNZ6ssIIXKFLiTvj76STyxO3R
 j8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ju+fvznWpdnqKgL0XY4kkDus/LAK39t8IpQPOIIruIQ=;
 b=RgyK989tzcFwMMarZUbf4cztq9gRJT0921fLk3AVG462J5BMZSdWcKJKaZgJMVlA2H
 8bEF9KTK3nJhYaaOfTs0AmxXHc+LYto76AcYNcwDys1FLtShh5KiSBtWUa5EL3LHKugz
 Kd3SPpFTJ6ksO1g3S2UXP3UQq0QlSP4X1Pws/r2RD4FKs7zlsa0j2ny/V+2kUyZo1XO5
 TX2PYM0IWZr9vNQWEu3lHLB5YXcGER7QKkFCJ/6603aBI3nZsC+gV6uOfHoanop5oDX7
 18RVErl3QmeKKxMcp8TCpgFLJYN5Akuv9maXtW8X0zAr+qJATDFBJWbY9fWWdsyTfLZA
 lozw==
X-Gm-Message-State: AOAM530LtrFlbvk6ofZKHifv8xjrMqIK4HqF/FTT/U7N30jcWJHEBgsE
 q+0pJjEXMvu1QB6MQBwBC2Y=
X-Google-Smtp-Source: ABdhPJy587NnvO7AefdsF/KjjG1iHKv9GXok92rFrI/AXc+PCpiFAKZ+4KV++7y69fgEPyBWbaMgNQ==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr79255592wrs.82.1609766953904; 
 Mon, 04 Jan 2021 05:29:13 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id c4sm99916521wrw.72.2021.01.04.05.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 05:29:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/5] clk: meson: meson8b: define the rate range for the
 hdmi_pll_dco clock
Date: Mon,  4 Jan 2021 14:28:03 +0100
Message-Id: <20210104132806.720558-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
References: <20210104132806.720558-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_082915_519757_B57F3885 
X-CRM114-Status: GOOD (  11.80  )
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

According to the public S805 datasheet the HDMI PLL VCO frequency has to
be between 1.2GHz and 3.0GHz. Add this range in our driver so we won't
get too low (which means the PLL won't lock) or too high.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index f8bd211db720..16ab595ab1a4 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -3781,6 +3781,11 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
 		return;
 	}
 
+	/* The HDMI PLL VCO is limited to 1.2G~3.0GHz */
+	clk_hw_set_rate_range(clk_hw_onecell_data->hws[CLKID_HDMI_PLL_DCO],
+			      1200 * 1000UL * 1000UL,
+			      3000 * 1000UL * 1000UL);
+
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get,
 				     clk_hw_onecell_data);
 	if (ret)
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
