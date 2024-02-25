Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1693AC54798
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Feb 2024 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=To54eC24sUuvJoVYlnp4MF2BDmLQg87GrzY/apIPq4E=; b=EU33+bx/vbgTg4
	SvkFfyBfYdY5NnPZs0dNI0lX+wyiXzeyBKPEeQdR8BEXOfeUuBE7iC0gDK6Ye5X6pP2txO/pIgpLh
	kXw0VWwMrcqT78rZU2iYdvhryW5yMEan3v8yBWdZi35NdOGd6L1qQoBMSICxV8hscSM7BS7+9ebo4
	i5tNS2Nrx3J1o647tqOLwU9rUy2JZ89GM77rqF6TU6pWS/sRv4c7fW+L82voc/sxRc/1iMugvzuQa
	n1W6nehOa45u3FuRRX1VxiDf7OqF8iX2spPE3+v7zSWg3y1WiCOE4l3yVefuJqTxZ4FMluHHerK2Z
	01oSYaSRQR/aXcRkLgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCk-0000000F9GZ-1w86;
	Sun, 25 Feb 2024 15:14:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reGCV-0000000F97S-2px1;
	Sun, 25 Feb 2024 15:14:02 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so2870777a12.3;
        Sun, 25 Feb 2024 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708874035; x=1709478835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqzAK/rpa5OgHPM2K5eydECFHp0Pspegr4Gfp32qYnk=;
        b=Gs9mV4nVsWjZ9rCnsyyFce8NVP6lE+K69Tpr0P9v88KLLq0+rtybiAyIrZTA6MU7+Q
         89JDC4dOZA1NkzLE19zSyOUiWjQBcTQqVDtv0vSrBlVoEjgAalctx9Rs3ksJDwcvlvYc
         0NFNr/7FRWvNyp5fsljHwl39n2iVWuAu1lsccfj0Fj9UfG0d+2NUeEGJb9lrGB5Ko9Ld
         qFvMxbdujvGuzxmDxW+UWJBhw3t6HO0mLUZR/9dyeajZnnGew0jgo1leWchdM58KuhQy
         T7Vb4xhZe9bmENFnx3lulMnq2Mgo2RbnTs89YcHL1GX8a/EjbUOI35YfTjzqjIxyZL/3
         Cjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708874035; x=1709478835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqzAK/rpa5OgHPM2K5eydECFHp0Pspegr4Gfp32qYnk=;
        b=GX2u+BgStyE+sDYWOQGmvzZYH4FQAMIimJaknjuRXxIZk3RupYPgudbHBed1r/2pdA
         cBE4Uu+mBy5L9f3FQYfNMCSrgSqCzOBxcGkE0eTfQI5Ck3CMGlnYf7jRuBKDZYKne48j
         dZymY8g/rT5s+wtps886bsAoz7vQ6dLMmupTOQ1HPz4jiUwlxYqdmb+xsuCWFeORM2j8
         oXiEv5yMsHqPddu4n52pDdXJKxiglr8GjLkF/dVJDGuOjmp90uiQZrCKl/WfrdAbvkvd
         dEEHvOWB2cW85pSZEthTCckJvwCyOl3xR6fELGC1WCvUMwT1wb3jNNqT3k7JR5osBAeT
         XVyw==
X-Forwarded-Encrypted: i=1; AJvYcCUYrjdRvzKQcyBHQ/n8pv5VK+o6NaIAoD+HT3kp06Bthj95HFnc+GLIAaxp0wQQ3iLwg1w+EwsZwsla0hC3lbO+zWAlC/I+0wvp7b+i0eI6Cwk=
X-Gm-Message-State: AOJu0YwrRjyZWpSQtfgsOekjf9irUrD9ZxfeP4AXW+KU+/7qJia7BafW
	LXz6cAwAnQKKzkp0ITuXI1nRJPvenMAwO/glIikYO4X+nN7VKBox
X-Google-Smtp-Source: AGHT+IGkQ09BVgHI1DnowCCqKMkEwUFloLKHKWTtL/sGl3j4U7VUMrYUG75/56+rg5mzCYn+UJBPZg==
X-Received: by 2002:a05:6402:2c7:b0:565:8e3a:5add with SMTP id b7-20020a05640202c700b005658e3a5addmr3081349edx.15.1708874035054;
        Sun, 25 Feb 2024 07:13:55 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-94e3-d600-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:94e3:d600::e63])
        by smtp.googlemail.com with ESMTPSA id f5-20020a50d545000000b005651ae4ac91sm1588450edj.41.2024.02.25.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 07:13:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/3] clocksource/drivers/arm_global_timer: Guard against division by zero
Date: Sun, 25 Feb 2024 16:13:35 +0100
Message-ID: <20240225151336.2728533-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
References: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_071359_750367_07D7C2A4 
X-CRM114-Status: GOOD (  13.11  )
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

The result of the division of new_rate by gt_target_rate can be zero (if
new_rate is smaller than gt_target_rate). Using that result as divisor
without checking can result in a division by zero error. Guard against
this by checking for a zero value earlier.
While here, also change the psv variable to an unsigned long to make
sure we don't overflow the datatype as all other types involved are also
unsiged long.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clocksource/arm_global_timer.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index fb3ffd54c822..257599d682f0 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -291,18 +291,17 @@ static int gt_clk_rate_change_cb(struct notifier_block *nb,
 	switch (event) {
 	case PRE_RATE_CHANGE:
 	{
-		int psv;
+		unsigned long psv;
 
-		psv = DIV_ROUND_CLOSEST(ndata->new_rate,
-					gt_target_rate);
-
-		if (abs(gt_target_rate - (ndata->new_rate / psv)) > MAX_F_ERR)
+		psv = DIV_ROUND_CLOSEST(ndata->new_rate, gt_target_rate);
+		if (!psv ||
+		    abs(gt_target_rate - (ndata->new_rate / psv)) > MAX_F_ERR)
 			return NOTIFY_BAD;
 
 		psv--;
 
 		/* prescaler within legal range? */
-		if (psv < 0 || psv > GT_CONTROL_PRESCALER_MAX)
+		if (psv > GT_CONTROL_PRESCALER_MAX)
 			return NOTIFY_BAD;
 
 		/*
-- 
2.44.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
