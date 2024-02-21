Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F94BC54788
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Feb 2024 21:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nVngDE6AXtsD65A49552VlOmArgnaSj0pKZOzscJrBI=; b=G6Q1RMCHUA1OP7
	Ebf+ajVjF/TYyfsL46PQi4XgG7GBr/y1hlgBG7aWg6XVME909rJi75Eh3aaKBs0sreRhwgq/9G8ER
	h/DJtdOrZQGoN4WSWyW70srGBoDTCiSreII37hZkawAClcKHNkysVtBvRPez2wKZvUTwIcvUJTpT3
	lReKNZhv65UVt8Qo1gEGqSxc/7wLAR3bumxI99ueZUognzOe7QvrSk9goBxM5EydsdMYOp16fIP0M
	lb93/pxmvHnNVTqB1QoxIohJCP2EhcUMc2ebDaCKcNyF6Vr94swqOszVslZk5RWougUYUjasFfx1X
	DOK0Lekn9BmMjbiEGo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcuNs-00000002hJ1-1g8l;
	Wed, 21 Feb 2024 21:44:08 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcuNp-00000002hAH-0mmi;
	Wed, 21 Feb 2024 21:44:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4127700a384so7681245e9.3;
        Wed, 21 Feb 2024 13:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708551843; x=1709156643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYJRtMoIKJFVH+z/bQCTO72nDr9l+UhUGSu3vRcRBJw=;
        b=lDDM6pbYIpQCLEXNFwM8Y/WZ55FQBQztFMhHF9YApgqCfN1Dj3UoQfMJZA/Yoi1w9s
         4Phy3/AJzqDT5SovHzySVpr+opj1K4ecqG2UAJUvhpVR8F3YeZPiiliGAutZLRmay4/z
         tOhobApt0Wv0Z3l99COOHJ288Lzhz9vVO0uoYHE3aEIh5IrXn/F+MpaTPsvHlCln+495
         XQrPD+4QFEvi68npwmyg/JlA2J1yRypwuK9ZICi4Ry9kjuX9TsZrptZn9wKq96Xo1FhP
         7V9NTeemhLFPcLaa8yTpMumwYJCRsaWG1+LlshCuvjDjfwFImSoQmjb1IdbpWIQTtyqS
         vOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551843; x=1709156643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYJRtMoIKJFVH+z/bQCTO72nDr9l+UhUGSu3vRcRBJw=;
        b=ERRkfzPQUJkpWh2pNmXD1EUjY93ddw4ks2X/pUm8wlJe2CYUGkraFmJEC8lkDN1pMg
         33CcpFfswfkId+ie7e5dosf0c0J7LQjzz8PdiNrnRZvG5Qc7SOAWgBesNV7AZiumT28p
         bcLp2B1224xgg6qkYKwcrUm9yk19ZPYhaUUTZq68vSsLO4CJxlbpwwATZLOXLjYkP80T
         DHGUjT/FJxu8lqox8q9zl/PFco1I7Zl/Ul7/xx8TrKCmWh/gsmlvE84aLeSBN2o8Nen+
         4RlM9lTqxK8EyrNYGjUmpDRqLfZmY2/K6slHGw8NA61czUUtCUPnR199xZt5iPQhypgx
         bQKw==
X-Forwarded-Encrypted: i=1; AJvYcCUvhsb1oH9+AtuCxFI0eFa8KSprwORm2ThAgZbPKc8MNm8sgp+RW1wVBWTYBMHdHMY51a+wrTKNrgF9hHZ5kkvp8GTahpzvHCdOZksOHcqZbt8=
X-Gm-Message-State: AOJu0YwKO9jMfrJycV2nSVm/Ns5j4jEFDFXFxFEMG88STgfxANXW5o9J
	pcVtWJ7JQSUefEzfO8fxyX1bwa04NtAVN1P2OMP+cZW57x9EkdHDWcZXAAhA
X-Google-Smtp-Source: AGHT+IGRxW4BiwFmPDduFWwDS+y14jjIZGwpxNkLGKAqBL8CVe54qT3cRn6tIitS6iXRRC/drR9O4w==
X-Received: by 2002:a5d:5f92:0:b0:33d:82a9:206e with SMTP id dr18-20020a5d5f92000000b0033d82a9206emr2206781wrb.28.1708551842773;
        Wed, 21 Feb 2024 13:44:02 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-bda0-ec00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:bda0:ec00::e63])
        by smtp.googlemail.com with ESMTPSA id h7-20020a056000000700b0033ce214a97csm18021982wrx.17.2024.02.21.13.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:44:02 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1] clocksource/drivers/arm_global_timer: Simplify prescaler register access
Date: Wed, 21 Feb 2024 22:43:48 +0100
Message-ID: <20240221214348.2299636-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_134405_255266_424397CF 
X-CRM114-Status: GOOD (  13.00  )
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
the mask (together with helpers such as FIELD_GET and FIELD_PREP)
instead of needed an additional shift and max value constant.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clocksource/arm_global_timer.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 8dd1e46b7176..1eb91fa00657 100644
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
+		if (psv < 0 || psv > FIELD_GET(GT_CONTROL_PRESCALER_MASK, ~0))
 			return NOTIFY_BAD;
 
 		/*
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
