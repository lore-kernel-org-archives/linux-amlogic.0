Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA4C54798
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Feb 2024 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEsRaCoagv4VQKOsZmvGDlgAxBIk2QBYCK/vI1ALdi4=; b=QOmOKv/nC5Dk3e
	BcS/KFgx6DK3uo0tCsS8zLRWhYDcIQUBQAH11xQJYPjTlecQ3eXLvmCcuqj6wdab9g85hqKJ9g3a8
	aA4sNJ8vOIYYZzCywCq03bv4DZRCcVfPi4ykoV9mwQtzq6OToVBdcRMFBMBKcrAVvsA2laBrij8qW
	al8BiGjiix4xJh6lpBfvTNYd8pImVex+PjX04t8qw8gXSD+qRflMbrWGUj33A3rB8WLZ0WH2BU/ux
	fG5rFFlMqB8qtlPqGF82iNi5zpSgkxL2krb9AJ5xJf+ArWbPYMULVFEZOJYSn52fcdzS5xWf1XyTz
	n2Q73Gkc1AvaLYxvgWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCt-0000000F9ME-3pXL;
	Sun, 25 Feb 2024 15:14:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCV-0000000F97T-2qIs;
	Sun, 25 Feb 2024 15:14:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so2460800a12.0;
        Sun, 25 Feb 2024 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708874036; x=1709478836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRqUqyxM5BwYZ552SwBc1mEqP/KlJT+duufn8/IdCwI=;
        b=ODi0uu/Kq00u+2a34g0M9lq0rzEOdTq/7n+lg8L+nQkcj/yRX2xo9BkWFM/4hVuc5d
         0sxECkInagqxKSmbhCiB6lhWn9MkTgkJYQTSEh5KA5bZSqyo59AVypmiPR9j9jcBgoIR
         a+YCXP7AKRLttfOiaLUlEfKhcaIGekiTotm60tARU22N85/PW8ijPL7qdRYxLeOnCb43
         ZK7rf+njYLRrpTOdViXEzg/rUmB7/BoOMpwiWcQOHg/FXldi2VW+NhJyYYvY5lbmUiMh
         BMCp965PUhlwqHiLp1KTndjcSWo8Q1rrXQeu+N5HVBz8AVhhvDMXygjnAMcVPizELInr
         JBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708874036; x=1709478836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRqUqyxM5BwYZ552SwBc1mEqP/KlJT+duufn8/IdCwI=;
        b=jECQ+aqXbJlQrFh9uqob8a4iBTRX+HnVsUbAm31QpfW3o1aTxhV935gcWzPbYoiRD9
         n8OxiTIgXaYIA1JbrsHfqPwPfxx7hbDfqgpm+bPjPrNG/aoVCa1lYY8VKob1xwJ+Hq/U
         IekLRM5wDUOrw7UtvXiv4NxgoCqInlXRgC49jPcNEvuTlN2YKgkkSuADapCYU0JVMW6F
         oMkAQiirAwi2MTINTfdzK7G1Gg3rVKKvJs0n/+dOg1BUZAyjJCo2s81qaxP6yDHyaLD7
         hVLBuk6SypDlXiaWcCVYB4IN3ydC/J3AhMM0ci7JQFAvb6GIVlLUAqgi4uzNfWwDvwNr
         aG6g==
X-Forwarded-Encrypted: i=1; AJvYcCVio0HBXDT4HoG0lgfdewGHs82RhTfzDrDXXOuaA3IH0rJrix47kZSt/lycRdQH5bbyM/PCMtB1gxvbVGT8EOykdtmc/r+uEyEnuMCnksPrUfo=
X-Gm-Message-State: AOJu0YxMaSinr42AuJpaOrrPG504PquIlq3b4u0e0A4+FL5gahJI2iJ9
	d40G05njo8OwI8Yc8p8RmyNzSe4V03Khho+xipvRSb7+cjkaUxqb
X-Google-Smtp-Source: AGHT+IH/nJnTUXso9xp8HekK1IjRVINalYAkwjwR4Jk7//muUbYijeHEbdBfJgf96o6NZ6fJ/+967A==
X-Received: by 2002:aa7:da09:0:b0:565:cd29:dd30 with SMTP id r9-20020aa7da09000000b00565cd29dd30mr1166096eds.30.1708874035965;
        Sun, 25 Feb 2024 07:13:55 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-94e3-d600-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:94e3:d600::e63])
        by smtp.googlemail.com with ESMTPSA id f5-20020a50d545000000b005651ae4ac91sm1588450edj.41.2024.02.25.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 07:13:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 3/3] clocksource/drivers/arm_global_timer: Simplify prescaler register access
Date: Sun, 25 Feb 2024 16:13:36 +0100
Message-ID: <20240225151336.2728533-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
References: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_071359_749194_70E9C683 
X-CRM114-Status: GOOD (  13.75  )
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
 drivers/clocksource/arm_global_timer.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index 257599d682f0..8a82b60b467b 100644
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
@@ -248,7 +246,7 @@ static void gt_write_presc(u32 psv)
 
 	reg = readl(gt_base + GT_CONTROL);
 	reg &= ~GT_CONTROL_PRESCALER_MASK;
-	reg |= psv << GT_CONTROL_PRESCALER_SHIFT;
+	reg |= FIELD_PREP(GT_CONTROL_PRESCALER_MASK, psv);
 	writel(reg, gt_base + GT_CONTROL);
 }
 
@@ -257,8 +255,7 @@ static u32 gt_read_presc(void)
 	u32 reg;
 
 	reg = readl(gt_base + GT_CONTROL);
-	reg &= GT_CONTROL_PRESCALER_MASK;
-	return reg >> GT_CONTROL_PRESCALER_SHIFT;
+	return FIELD_GET(GT_CONTROL_PRESCALER_MASK, reg);
 }
 
 static void __init gt_delay_timer_init(void)
@@ -273,9 +270,9 @@ static int __init gt_clocksource_init(void)
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
-		if (psv > GT_CONTROL_PRESCALER_MAX)
+		if (!FIELD_FIT(GT_CONTROL_PRESCALER_MASK, psv))
 			return NOTIFY_BAD;
 
 		/*
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
