Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3A6C46470
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DC22146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 12:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mCI4YiUP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zpNEfai/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07DC22146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A8e6nAn8cCF9/K63csXMzzKs1xLDZwnRO7AwqVReJa8=; b=mCI4YiUPq5zVxy
	AxtCaZP1udld81NAQzZvOBwH2utzC+hgjB6iSOqgCZBDikP3LPVesZw+u9jehEv9i7kFKUl1kXO1q
	dqvGtnJmRzdGPA5zjhhrR8n1OC1DIjObtwz1E82lqDt4sT1TsmYqIVg6YRQsywHotkpIpag+X0y4K
	wSdL6uAp3PA5GvwTrXwQbIk8AbtKVNYonULNqM8cMxD3vMPtefO+dWyRwxvkY6ouaJcyXTkZuHWa8
	78zzogmwdbCjcVKjNSR/sKRGZkj1oIU6LsLJIfJJ+er1rlQuVfxQi4JTZOaczO7YbNO3kM9nfyRqT
	5KU9wV1ZzBKfdXgCwgnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQA79-0007QO-Ry; Mon, 13 May 2019 12:31:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQA74-0007M5-UZ
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 12:31:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id e15so2656864wrs.4
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mW2Fqi37nfrJWuA7Y78Xlr35mQpQP8Au1z+vEQpFR/c=;
 b=zpNEfai/ShFL9b9BqnxeB/Z0ueU/STT54nBh4jzNCSq8avg67UIuysT+FBIdpsciGJ
 fH+PJQ9dp/RC7UD4U5T30ILymLeLPSwMCGXbRrY5FXFhGMJXH/+xZrPQkS/NROWCtXPG
 Y7ljuoZE9vGoccHwsjUOCzX8dVYDO7DZe8QJuNXNCAPU66G93Qz+KX2xdn/T7cRrxtNc
 8oB5kEqR8RaHUs3dERDJiu2eG5YGccaZMM0q08ciUhiKKYmMbNuj7N6p3ewMaIvPWP4C
 DeWdKERkqxW3JlXFcHB6roMjM7t/OioSCWUmH/ADLTHh0+Plh+vhbwRRRN3wuazodw3q
 8xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mW2Fqi37nfrJWuA7Y78Xlr35mQpQP8Au1z+vEQpFR/c=;
 b=FgMWDqQkYTJ+YlfShhgSFgtMGii33pk961aUUHIZEEd35OFLxjKZLgy+Yn97HzovTO
 bN/T79FDkReqSoD7vj1jDWLzzbmp6liGzg5XkHWeIHxZAUTDw7HRshNdShs/musPqMtx
 b16mGkrvN41JuNTbGND+cr0UuAgQJVfgXpMA1Gojr0QcB5pTirY0RBhI+JTT94266Ewc
 nIzPRPuoaTjQ9VmJaMbRsyJwCn9Qsujd0w6KPVRDL+jZl7flSAxpSk4IBO8sK2zcZVuu
 cpdi96OL34NmdoPING//CWv4e/FUr4PoUuZeAqWghgv3DIPXHVG9RI+hxi9yhBazMQx7
 6TTA==
X-Gm-Message-State: APjAAAWaXCE5DejudjOQJUNF1Zzf2pf27YfGGm3VtnOJDTvmnHx+vh2R
 8djD3ZGT419aC8M9rSbGJquwHw==
X-Google-Smtp-Source: APXvYqzMT85oqFabMAnmREk8mC5CwV17opJfsoHj/As/U4QV+LoR1dwrkdAtQjJSAYM8uOuBfPWaiw==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr18014405wrj.66.1557750685310; 
 Mon, 13 May 2019 05:31:25 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 05:31:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/7] clk: meson: gxbb: no spread spectrum on mpll0
Date: Mon, 13 May 2019 14:31:10 +0200
Message-Id: <20190513123115.18145-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_053126_979859_8786E105 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The documentation says there is an SSEN bit on mpll0 but, after testing
it, no spread spectrum function appears to be enabled by this bit on any
of the MPLLs.

Let's remove it until we know more

Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 29ffb4fde714..dab16d9b1af8 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -679,11 +679,6 @@ static struct clk_regmap gxbb_mpll0_div = {
 			.shift   = 16,
 			.width   = 9,
 		},
-		.ssen = {
-			.reg_off = HHI_MPLL_CNTL,
-			.shift   = 25,
-			.width	 = 1,
-		},
 		.lock = &meson_clk_lock,
 	},
 	.hw.init = &(struct clk_init_data){
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
