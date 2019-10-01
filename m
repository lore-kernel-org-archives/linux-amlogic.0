Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF177C352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9687621920
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olfYtB9e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oWJ+OKnv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9687621920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oBeBE1gaGc5omPTHVkKkbqOGPwFwumwJ0m9HszjTUCU=; b=olfYtB9ea0Q6wl
	y9TSnZfrPUeuSZU/YuMytK4xvUy85hmAz9+PPFNsgKE11SZcFl4rbsnfCjExOW5i8FG8ukN7IErtf
	zwAwIddrAdxflX5YdfBlkAYcj79YOthoiMfukcIhUBeYaLOKyoEmBp54M+Ce3HSyroOkcwpTrCYM7
	J4sHT0UuBArqGdpCQBfygl0+UOeSg0rpUS7F8meGFJ1P8CqL1ySCY46i71D3zOf2BQFw0y4swJui0
	BhKbyYqv3FkdFUA6UXx/XXdxOpgknqAWqa3x0XcVCsQa5RNgsTc994EaJmD/TyTz63h/K+4kGZvue
	BrbI31W2vL1sLjhBxYkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFGkZ-0007D4-HM; Tue, 01 Oct 2019 11:55:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGkS-00073z-9o
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 11:55:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id w12so15143458wro.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nE4XL8qms/9Kpgy3n+0LiYMlRLilMKnu0uTWVFko214=;
 b=oWJ+OKnvV1nEG85+oJzgPToAX9vlxIWdG33ZmNo089bYl4219SMu9P+4ZiKS5alPnv
 5UHCIPKTg/6CjUPmjjl7COJyHASgZ7djN6vERzU3JRqTG5L8bPIElMntHt+sA8PpJI1V
 IvJlWa3b5iRZTemB7JePoQxA3AXeJx/CCyRXUiWTRLx2vb3eXCNIM5RKPGSL/X4pnFF2
 D4F2zIBTK+yyY8Eju1H5Iyw/NAbBZBOyZL4Gb/UDwyYhEwLtKHiaHV8ePa5S72ivUO5X
 opbH8Sxi5bqTWYhRKCyjxnb9bQPWuHeY8sZVnOQd3+cPmzSeWbxKdgHs8yRkyeD1CM2x
 DyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nE4XL8qms/9Kpgy3n+0LiYMlRLilMKnu0uTWVFko214=;
 b=GQUdzGNDQqr/G/w1rB3Rez1eCQ3rMMqOGxO3pFzz2+GmqoG9VxO5EyyBcnr3mj/leQ
 BtbXzA7OnRXWq0ro7cG0x8bQ9E1/3RNhR3WkcCbQdoB/wXt5FBkUnKHyEOEECV6PdSgn
 cXV3Szul9ioVwupo07BVbjOmAEiXIBm3a3lmEjLqQH9Yjn1GL8gr327TGQ83mcont+IK
 mm516jFS0HRCd+BNM14DdMm9iFVjFnkixxS7H+IqPriEe6wph4zpvRtpto/RhDENj22J
 AZs8BYf1lSUNQSQJLiJBhvylVrhrjBJI1lPwI2r512Jq0VwuwfiiHAXwU5GZRJJKHCFl
 vb3A==
X-Gm-Message-State: APjAAAUFgQ9RZvHeqVC/o53r8B8CRMuCUiwpcXe3fdEQvhtCRxBKB38w
 llazaJjqX1Bg+LlMHodaEdaz/w==
X-Google-Smtp-Source: APXvYqxw28X8pR77Rx9+mC0iRniK+Od8uatu5Uhz9j9oHbBWi+WdTmjujMGlSGZOE+lCuwODEk45pA==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr17227829wrj.30.1569930918809; 
 Tue, 01 Oct 2019 04:55:18 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:55:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 4/7] clk: meson: axg-audio: fix regmap last register
Date: Tue,  1 Oct 2019 13:55:07 +0200
Message-Id: <20191001115511.17357-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_045520_350789_C344F753 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since the addition of the g12a, the last register is
AUDIO_CLK_SPDIFOUT_B_CTRL.

Fixes: 075001385c66 ("clk: meson: axg-audio: add g12a support")
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 60ac71856e5e..4b34601342bb 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -997,7 +997,7 @@ static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= AUDIO_CLK_PDMIN_CTRL1,
+	.max_register	= AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
 struct audioclk_data {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
