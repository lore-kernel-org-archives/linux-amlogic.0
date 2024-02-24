Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FAAC48BF6
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Feb 2024 21:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b+DCGIrqQgjI3QQ4n5w7B4rAtulRu/6HERnH54dB3zg=; b=ZO4ixMZug1cx4M
	UU7FUg945nSWv1tPieZttx6vsSWSpk3kXUqGWvJpBwUh0wejJ5cwGYPDyCfGu1CWrmMH4Tsg201Wu
	O7kbxI2HWnncScnNIfOg8f8BsNFaBSEXzQb/RrtCQztE5w2AySxA0c1qUxBYrJysC2oS70hI4pYIL
	LAjH0JcU97cZggydh+vQHq7SNtR5QNy/FgnFa6b7nGFxNinHNdI5EiwbflNwflDdeBFTUjIx/O+69
	qn4RKbsT5/beIh+NFZMH0CGFBJvXVNDJL+8FV5LrAW5xhElR6Zp5i5mcSN+xq3EVfui9vDS8su2xf
	8XKFjQ0XAowdSLxTDi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdzgl-0000000DiLi-2G3i;
	Sat, 24 Feb 2024 21:36:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdzgO-0000000DiHD-1tWK;
	Sat, 24 Feb 2024 21:35:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-412a0398fa0so1937605e9.2;
        Sat, 24 Feb 2024 13:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708810542; x=1709415342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfyUUPIObrJI/AdJkHzfZnrS5Mew7GMKv0WrMYMijQA=;
        b=PLBHOOhtklJzohUIAgrkFOSx+wqFTenQEUzH3OOnmdM1Z27w9X+2l7SR6QI5kbxdyi
         f5qoG2Hmn6gw9IFZWcofv20Sy23GPW6Nl7xyJNXwlV3JhsPNaiNIy+F9sfAqaFNZSUVS
         2cAYkZMH12V52T4o0Jpy/knWIrgeifO12gXcNBV1mihluRm6+BcqQNr/pBkRLfYYeHbO
         QKnf/VrZfqDtFxIX+vJPKP2tlv6C61wRZCYaq626thQlc9cDwjSNW03eISjYfqiNrfmG
         /Ogikk1atoJiq2YssjzpgB+b7VtuKppSyE2fe3Oq+ajth53XD+NzYPkyByCE51JTbV2y
         NFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708810542; x=1709415342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfyUUPIObrJI/AdJkHzfZnrS5Mew7GMKv0WrMYMijQA=;
        b=p7S8lpQXX67aWSr9IJ9hnMe9audguYRHdplQg2c5k7Ixpt8p2SOE69dt0T8VIi7EyO
         3XePHU7p0+yvH00YacjElg1UFzlXAS+WNg+nQ9ADWjdJcVO5+DjEsnWs73CimqAGe26x
         o6b9mL4uj282G+ZErYOZmu+f+BDcMdYIfDa2GyQlIxU+8CGpnS4qyky/ZW4BGG2xYXso
         7pvY/MAvwBr/2wKH/vWy70o63autBZ17dYLqkEr2hGXeZuvvvMDhm2X28a52ikRNExJf
         JzhD4Mvk11S0OxXEMlii3lbt/lYw6bqcakgJ2us3w9sHfjwZfpuOQavugj8GApEsCjVt
         Y8hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqtUlPYlNRokrZ3Z31/7K3fkk4GJQoUq/emnXHH3NxnNDhbHLbEMSOP3EVb39aOj8O5Bms6C8RQV/ulfZJYBwU16BCVAd1wnmDPlrBZQA6jF8=
X-Gm-Message-State: AOJu0YzzTY+ws0GfwAGWTmb9N8KzqN/REHrjHkZ+qdAcPFsNXi2+A2OH
	875bYZ95zuyfO3KcO0zD8xhLnt8DMyBbL8APRCJ7EuHPWQxVNxjo
X-Google-Smtp-Source: AGHT+IHRXkPpZgMScDvUKW2hl6gXaSeJDpy0KyrAjMC1XYbCNqWWEU+e/zerWBbZqhXcOpN2zNh5ow==
X-Received: by 2002:a05:600c:1d22:b0:412:90e4:6a1d with SMTP id l34-20020a05600c1d2200b0041290e46a1dmr2663360wms.41.1708810542090;
        Sat, 24 Feb 2024 13:35:42 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-c5cc-b000-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:c5cc:b000::e63])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm757065wmp.1.2024.02.24.13.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 13:35:41 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2] clocksource/drivers/arm_global_timer: Simplify prescaler register access
Date: Sat, 24 Feb 2024 22:35:29 +0100
Message-ID: <20240224213529.2601333-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_133544_516696_0DDEE0D5 
X-CRM114-Status: GOOD (  13.05  )
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

Use GENMASK() to define the prescaler mask and make the whole driver use
the mask (together with helpers such as FIELD_{GET,PREP,FIT}) instead of
needing an additional shift and max value constant.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes from v1 at [0]:
- use FIELD_FIT() to check whether psv overflows the register
- update the description accordingly


[0] https://lore.kernel.org/lkml/20240221214348.2299636-1-martin.blumenstingl@googlemail.com/


 drivers/clocksource/arm_global_timer.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 8dd1e46b7176..49b094a20717 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -9,6 +9,7 @@
 
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/bitfield.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -31,10 +32,7 @@
 #define GT_CONTROL_COMP_ENABLE		BIT(1)	/* banked */
 #define GT_CONTROL_IRQ_ENABLE		BIT(2)	/* banked */
 #define GT_CONTROL_AUTO_INC		BIT(3)	/* banked */
-#define GT_CONTROL_PRESCALER_SHIFT      8
-#define GT_CONTROL_PRESCALER_MAX        0xFF
-#define GT_CONTROL_PRESCALER_MASK       (GT_CONTROL_PRESCALER_MAX << \
-					 GT_CONTROL_PRESCALER_SHIFT)
+#define GT_CONTROL_PRESCALER_MASK	GENMASK(15, 8)
 
 #define GT_INT_STATUS	0x0c
 #define GT_INT_STATUS_EVENT_FLAG	BIT(0)
@@ -247,7 +245,7 @@ static void gt_write_presc(u32 psv)
 
 	reg = readl(gt_base + GT_CONTROL);
 	reg &= ~GT_CONTROL_PRESCALER_MASK;
-	reg |= psv << GT_CONTROL_PRESCALER_SHIFT;
+	reg |= FIELD_PREP(GT_CONTROL_PRESCALER_MASK, psv);
 	writel(reg, gt_base + GT_CONTROL);
 }
 
@@ -256,8 +254,7 @@ static u32 gt_read_presc(void)
 	u32 reg;
 
 	reg = readl(gt_base + GT_CONTROL);
-	reg &= GT_CONTROL_PRESCALER_MASK;
-	return reg >> GT_CONTROL_PRESCALER_SHIFT;
+	return FIELD_GET(GT_CONTROL_PRESCALER_MASK, reg);
 }
 
 static void __init gt_delay_timer_init(void)
@@ -272,9 +269,9 @@ static int __init gt_clocksource_init(void)
 	writel(0, gt_base + GT_COUNTER0);
 	writel(0, gt_base + GT_COUNTER1);
 	/* set prescaler and enable timer on all the cores */
-	writel(((CONFIG_ARM_GT_INITIAL_PRESCALER_VAL - 1) <<
-		GT_CONTROL_PRESCALER_SHIFT)
-	       | GT_CONTROL_TIMER_ENABLE, gt_base + GT_CONTROL);
+	writel(FIELD_PREP(GT_CONTROL_PRESCALER_MASK,
+			  CONFIG_ARM_GT_INITIAL_PRESCALER_VAL - 1) |
+	       GT_CONTROL_TIMER_ENABLE, gt_base + GT_CONTROL);
 
 #ifdef CONFIG_CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
 	sched_clock_register(gt_sched_clock_read, 64, gt_target_rate);
@@ -301,7 +298,7 @@ static int gt_clk_rate_change_cb(struct notifier_block *nb,
 		psv--;
 
 		/* prescaler within legal range? */
-		if (psv < 0 || psv > GT_CONTROL_PRESCALER_MAX)
+		if (psv < 0 || !FIELD_FIT(GT_CONTROL_PRESCALER_MASK, psv))
 			return NOTIFY_BAD;
 
 		/*
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
