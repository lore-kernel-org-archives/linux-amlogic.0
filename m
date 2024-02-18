Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1CCC54766
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 17:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNetMGHRYmajtWy5+wj7o+TGmDS6lmwMEglztdxNF4g=; b=JkBL50Et+kQtrl
	BRdiizfbi8P6Iy3lZ7BKUKKJY0tnlMwjz76FUq2Ica7GOidLTYPr5y2J8woKn8yscW3ogSEoyZy7b
	Aww0T5+wKHUBOTMm606Q4WGmzj0rE0h+lRb2vZM1LE+QTnY2U1/6r2XAa1ITIZdQab+KHKfWPlTyK
	ZnktST/zuWqT+Rt5k7MZyDRYmwIwJ4ud5XayJii5RDIDK664yJkjNMDW068D7f7Pef2gAUnUwJg1y
	gQkSAeYGZ/ViLSFYXbwKefQcwiwwITXIaQJIX4ms74+B56b7SYXU0wFy+lqFpvL0s1BGSOj1SB90k
	qycsUz7BkN96ndlA+4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblB4-000000087SD-13te;
	Sun, 18 Feb 2024 17:42:10 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rblAt-000000087Oe-1RS0;
	Sun, 18 Feb 2024 17:42:00 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a36126ee41eso471047866b.2;
        Sun, 18 Feb 2024 09:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708278117; x=1708882917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpi6uSrDzTzKIp6zIZ44/XNN4JX5iPXekATyTBKohTk=;
        b=dTpcL5pCKL4p7pk/uWf0+KdJz5PDlzHVoL1y1UqQvEoaWLBjFmwhYkj+vJNcXtr4pu
         zGbhav8cxeYuZACI54xqbla2H1ARQvn6xws4wu+i7E8s+13HERH3k99HGNYnSsyfIfHF
         MotsCHEUoaZFT3wVGLr/epd1yAmxL79UFAis+T4NlvLT38XedUAE81FZ6htJaTDR3K5q
         Lrn4ZPbxDnLYTnHPFZSZx+0kqgSQopUy6fxU+e1FNsaGM1QslCwU0S+Qq2gvIUiArWZr
         EMnszRvBvl32775C09Uh8jT/f9uDd5Ryxd3q/DHkgO2c5oVdFNfoy+KOwv+h6u01AuYB
         jwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708278117; x=1708882917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpi6uSrDzTzKIp6zIZ44/XNN4JX5iPXekATyTBKohTk=;
        b=iHVpQmrIQ27OUXKM43tIt265s4eJ1SIn/Gvgv+zOcJsGUZ/H1UOeLIw48mYfFmKfAq
         RgbBQSLcLZS372nKZ8Kr1YKx7yJYiP4lTWbRE/T1qhrm+zZ/MAjDwegfXlnvNZ/5m9zp
         6ghHEFGx7ItkWlv0GdGhvKv1EYv8HcKRLEY/ca2nmrNJiejR2e0+DWAw2AHFafr97EnL
         Zoxznz3H69lMaxnoaaNeJ6WlJa3e3uKkKHMphVKm1KuQGV8hfg2nO1o2xAfc5jq0tBBq
         iyuwxvRsGsloz/b2oLJ9nkdo+a21rDEG+2ucXlUwPx+5PYoxrX7sPFp5koJvzeSniGYY
         qcMA==
X-Forwarded-Encrypted: i=1; AJvYcCUQws+vATRJ9qDBNbfXbK2zqUSjtqZDrM179ytvaKVJFZWRUu3udCUSfU75GgqMAIbKcPXn83UUgRdSIFsgv4c8/ss9Qoucjnc8yj4DVW2bD3zw/74ILl+h/2FFnwfRQEyvmtm5mR7TRAiraJv1ZkDfYeRhtD+5Pw==
X-Gm-Message-State: AOJu0YyT5S88FfE1RKaWxfpffMfZ5bRp5eBoNoM7HdM46ZL2BLOe7eoC
	Gkb3qmsDvPkk9+wkdlKL0zfjyCLM0eBNVibIEb16QEurkIcUfnc7
X-Google-Smtp-Source: AGHT+IEZJjiygB+673niFbajrVGdnP/raflzAUmK3e598700aY1U+rBSfoed2PYbcGRrMxsete5r+Q==
X-Received: by 2002:a17:907:100b:b0:a3e:876d:1b1 with SMTP id ox11-20020a170907100b00b00a3e876d01b1mr785387ejb.20.1708278117496;
        Sun, 18 Feb 2024 09:41:57 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id r16-20020a1709067fd000b00a3e88f99cf1sm412710ejs.149.2024.02.18.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 09:41:57 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andrea.merello@gmail.com,
	patrice.chotard@foss.st.com,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 2/2] clocksource/drivers/arm_global_timer: Remove stray tab
Date: Sun, 18 Feb 2024 18:41:38 +0100
Message-ID: <20240218174138.1942418-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
References: <20240218174138.1942418-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_094159_403422_EE035AA5 
X-CRM114-Status: GOOD (  12.46  )
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

Remove a stray tab in global_timer_of_register() which is different from
the coding style in the rest of the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clocksource/arm_global_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/arm_global_timer.c b/drivers/clocksource/arm_global_timer.c
index e1c773bb5535..8dd1e46b7176 100644
--- a/drivers/clocksource/arm_global_timer.c
+++ b/drivers/clocksource/arm_global_timer.c
@@ -411,7 +411,7 @@ static int __init global_timer_of_register(struct device_node *np)
 	err = gt_clocksource_init();
 	if (err)
 		goto out_irq;
-	
+
 	err = cpuhp_setup_state(CPUHP_AP_ARM_GLOBAL_TIMER_STARTING,
 				"clockevents/arm/global_timer:starting",
 				gt_starting_cpu, gt_dying_cpu);
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
