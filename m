Return-Path: <SRS0=mQoY=XO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA49C49ED7
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 09:37:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9E921907
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Sep 2019 09:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fejxqKlj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZpxIQpFM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E9E921907
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Snj8Egynze9PuH7aFK8BrfYgTFrtFLBGDdYSaX8VJfQ=; b=fejxqKlj1rTT1c
	OeNUiOIxl6zUz/LUmqg3t2JZUT7iQQpmgyjStwqeeD2Uj9wvO0IUt+soK8hI2VGGPG1s2eZbjiTMl
	7CvZMQwYz5I5GLqWjMIQJJ2Qw1WfjLbEp0uXIRPiY/IsMlJfbnmnDKSLCnYNSmSr/68Vvk54iideS
	WjmLzJcPGdMJGNq2+QLosBv4tm8pm+D5sUhM2vz9RjXP8G1UQHQKmYMUAHt4PwR4032+tuNrfMy6/
	m1nMQ2PDnO03QNaSUNTkMOIQOZ2iivHBvZioyXdgrkQaMDMd9rMEsj4ru3EqbUNiVfWJqBL9kx7FD
	T5vf0+RiQH9QYydxO98g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAsrs-000662-CB; Thu, 19 Sep 2019 09:36:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAsrY-0005qZ-Li
 for linux-amlogic@lists.infradead.org; Thu, 19 Sep 2019 09:36:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id r5so2287680wrm.12
 for <linux-amlogic@lists.infradead.org>; Thu, 19 Sep 2019 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HU8Y6pbxWWxRHBUPCakNxeD6oqUY5n5mmhoUaSAT3gk=;
 b=ZpxIQpFM42BVxOwOhk7rXeg7LiQ/OzWnqWklrcETy22L7NdwvJOg25CPHHr/9bBzA7
 yYeWiVE3oPtqE9Erb4DWeZ/tpghfcW9ioBBOioDqpw6G892y1x48m8xMPjmcy18Nry2o
 pw9WB4k9l0ZVsvVLUzhO7itF/vALzH+A5+u7WatGxEyn2WbEkNM7f+iinKkXxLrij3nR
 X8tXVIol/mse55uThB8RwHlSkQ1nypybZx9fynaYkSTUuvRmFID1CcA0+rCFTrRVlBCl
 KMjZIRs1sRY7Iur537wQ8DVFU9fuM+Yg/pHUEo9uqHvs7dUPEpEFnBAop33UTd/G+n80
 QpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HU8Y6pbxWWxRHBUPCakNxeD6oqUY5n5mmhoUaSAT3gk=;
 b=D0SqMCHY92rIqmtRjGq/fSZ+Vf4MwRE/KPuO1HEp+7LlWO/uQoDn3iJGw23bPnAvxZ
 /TigjglTYKyCEXIuLJczBrHCwEBdUWKnPYRKmjPJ3KBOTIVJIQTzEVbP+9VOzfJm1oaz
 Igm1mB43kQQUCq7WSCjTZ078Waz/hMNXP/UxnMEypChaZs4FDvI6SfhDfjrZD4Eowq0B
 uFfw3ZcVd/z+9pRszGBnak0qj9Bh6KuInRmKi7j8Y18jbiVbDEuAh3jhwYc0SKSR0Ewn
 chr91GjTr+WmSbbjWBeaaaidGqnw20gL+K7hCaou1ViBVlqgTKoMPmTSC/tXr9IT4qMA
 iL6Q==
X-Gm-Message-State: APjAAAWNaMrVlASedZMYdqr+XuaSuONSUDybc4gx9bF75HbNc0adPArX
 vinb64y+5zpkjr1ymXOHVfLvzw==
X-Google-Smtp-Source: APXvYqwcwTAoAq6ipI04IFWalCiIwGVkBNhcLNPZV6e9XreTF113hZ1ic9ciMzNKiT6P7nJFBGetVA==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr6926414wrm.26.1568885790071; 
 Thu, 19 Sep 2019 02:36:30 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id q19sm16701186wra.89.2019.09.19.02.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 02:36:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 1/3] clk: meson: g12a: fix cpu clock rate setting
Date: Thu, 19 Sep 2019 11:36:25 +0200
Message-Id: <20190919093627.21245-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190919093627.21245-1-narmstrong@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_023632_773377_EB804391 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CLK_SET_RATE_NO_REPARENT is wrongly set on the g12a cpu premux0 clocks
flags, and CLK_SET_RATE_PARENT is required for the g12a cpu premux0 clock
and the g12b cpub premux0 clock, otherwise CCF always selects the SYS_PLL
clock to feed the cpu cluster.

Fixes: ffae8475b90c ("clk: meson: g12a: add notifiers to handle cpu clock change")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index ea4c791f106d..33c7e04b4a82 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -353,8 +353,7 @@ static struct clk_regmap g12a_cpu_clk_premux0 = {
 			{ .hw = &g12a_fclk_div3.hw },
 		},
 		.num_parents = 3,
-		/* This sub-tree is used a parking clock */
-		.flags = CLK_SET_RATE_NO_REPARENT,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -533,6 +532,7 @@ static struct clk_regmap g12b_cpub_clk_premux0 = {
 			{ .hw = &g12a_fclk_div3.hw },
 		},
 		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
