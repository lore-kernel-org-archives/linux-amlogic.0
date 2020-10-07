Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB769C4727F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BEE120872
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X853TnTS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="j1ZHC/Pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BEE120872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7zadDKr8iAV0QpjNX6Labn2C5++L0y1UtcNAk5FIoM=; b=X853TnTSZpbMb7MHxrB/b1Mss
	XQGjDyYtQWdks0I75Z26QG6qDmlycBgvHJ/MUWQCaDQga/ONEttmNDF/ISlgwAa9HZob+fxtIVd3o
	7DN3V8gZf7f8srJ0uoQCbs/F9NfjAC7oJ3ryfnJxgDUZnIdqpHOhsjzO9lYTAF/e7NznW4B6vECac
	3blBZiGlqkncP4Ht62ryO7Jl5CkgjuFSvvy7EufdnpxwxEmzF/kLpEPKrdkRTbUsuD4BJ0q5r7pRN
	LljapLI2y8StP9D+HJR8eHkfw5TWe98wpFbFl22PndsSnq2mVDhHlPM0vBT9t534Mr8l8HAVAc3Wh
	qd/1/gcJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Uk-0000Jc-RT; Wed, 07 Oct 2020 08:08:18 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Ue-0000FN-KA
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 08:08:15 +0000
Received: by mail-ed1-x544.google.com with SMTP id 33so1161231edq.13
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZhbU6JmaVfKgD1s4cybkcHTBk+tY6By/eFQji3AClKY=;
 b=j1ZHC/Plvx7SgnRFbucisI2F2GM2pxPOw0vRjiREHyMPuFtNMjkipgmBzOHJa/VcAi
 FJqJ7PJrOdaLjZnGcPG8L2qFMIp16S/A+06M+a5G+WQtwkIKheWGILG89/UVb7V298tf
 Nzj4aDM7+puXmcfD2kVkm90kdtH8z3HuE34USZLscGcU5WH+wzCfrnSiy5Z7CO9aTqgU
 NLca3DEDaNIqyGlboBbdI6tOT31AbHnwtuA1Ub+mYRtY3sLUMub7XvCfmvX0yXHeP4s0
 QmE6pVN0y2nDyVSAKQy8sLD6Q6giiQy9lu8IbqlrTRql76vwYnvcfQSJ1McPiTlEJnLX
 amPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhbU6JmaVfKgD1s4cybkcHTBk+tY6By/eFQji3AClKY=;
 b=eSayLy4PRZJVk2M1dr4SHJQgTpqpxaCvGIB78Ni0h/9ldjtq/Gi/9kP2uegXx7RpJ0
 61I1XjbEusqDNqzJMkRuupa0tuONp5/OcOxcym1EKZSnooRkLRS2JhthwrIDvyuJ/WYB
 YUUtyNSvoJ+7LlqhvPbxR2Kv+KqPp+ePxJkfVen0Ehho3EZEK+vQXk5t951s35OMGaXu
 tyq94YtNSZCD+mbJ8gGlPtxcYxcEGfWKgtkwbkG3wiQVABVhKISKaprpc+U7VwwgVRjr
 0Z/HbJZKVnPRogu1uMvl7+J4sbEjNi7CwjNR6/pExL63iKgn/+M5HaD6I9cKo2Kllg1T
 GstA==
X-Gm-Message-State: AOAM530PRy2gsbwYxb68wmK3fjIyJITyd9bFu9ykcSLcu+iZF11t+aQu
 VuU1l1L/2GGkb2dBJe2ASTb7Ww==
X-Google-Smtp-Source: ABdhPJx0XWEkI4HBlS99pxTK0t4QJZzkpystYXF06tW6acHL9Sam6bWwntQ8rUxJW+MCVvIhEPpYlA==
X-Received: by 2002:a50:c309:: with SMTP id a9mr2285070edb.199.1602058089334; 
 Wed, 07 Oct 2020 01:08:09 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:08:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wolfram Sang <wsa@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/3] i2c: meson: fix clock setting overwrite
Date: Wed,  7 Oct 2020 10:07:49 +0200
Message-Id: <20201007080751.1259442-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007080751.1259442-1-jbrunet@baylibre.com>
References: <20201007080751.1259442-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_040812_707122_26C1D1B4 
X-CRM114-Status: GOOD (  14.10  )
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
 linux-i2c@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the slave address is written in do_start(), SLAVE_ADDR is written
completely. This may overwrite some setting related to the clock rate
or signal filtering.

Fix this by writing only the bits related to slave address. To avoid
causing unexpected changed, explicitly disable filtering or high/low
clock mode which may have been left over by the bootloader.

Fixes: 30021e3707a7 ("i2c: add support for Amlogic Meson I2C controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/i2c/busses/i2c-meson.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index c5dec572fc48..dac0d2a00cec 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2014 Beniamino Galvani <b.galvani@gmail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/i2c.h>
@@ -38,6 +39,12 @@
 #define REG_CTRL_CLKDIVEXT_SHIFT 28
 #define REG_CTRL_CLKDIVEXT_MASK	GENMASK(29, 28)
 
+#define REG_SLV_ADDR		GENMASK(7, 0)
+#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
+#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
+#define REG_SLV_SCL_LOW		GENMASK(27, 16)
+#define REG_SLV_SCL_LOW_EN	BIT(28)
+
 #define I2C_TIMEOUT_MS		500
 
 enum {
@@ -147,6 +154,9 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
 			   (div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
 
+	/* Disable HIGH/LOW mode */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
+
 	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
 		clk_rate, freq, div);
 }
@@ -280,7 +290,10 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
 	token = (msg->flags & I2C_M_RD) ? TOKEN_SLAVE_ADDR_READ :
 		TOKEN_SLAVE_ADDR_WRITE;
 
-	writel(msg->addr << 1, i2c->regs + REG_SLAVE_ADDR);
+
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
+			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
+
 	meson_i2c_add_token(i2c, TOKEN_START);
 	meson_i2c_add_token(i2c, token);
 }
@@ -461,6 +474,10 @@ static int meson_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Disable filtering */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
+			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
+
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
 	return 0;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
