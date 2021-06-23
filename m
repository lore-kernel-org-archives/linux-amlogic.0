Return-Path: <SRS0=X5xV=LR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5404C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9497660E0B
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9497660E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1TzaDrPh+gm0mz7cto7uFH2WaiuNN/Y0+U3mhinQXo=; b=IICUZe3GYy0E/+
	W8Q4JOzZ7p9NOjTy/tPtyiAn4pDEPntxwMdFHibZafEVQWvS3QOGBIX6g/G8L2FTpIze0D6XSWNyW
	5CGonAVfIm1OH0c+ejIrG22M3RBzyiTgYtbSFeLqPD5oUNfFvjJdDYrPYJZEidkG9GAxXJm8lVq6t
	LA6yacHs/QhSrPRpd9nKg2VSEZNd4y6sYLVpMaLPMafHHUunvbbIFeHsa0B2HxJRV5JpZyoQ4YcPG
	J1xdZXbHdIxLbONrS3SgHzKgx+5rnbGOzXaSipIYKazHpvEC7AnkLuEIusZhal2RhTcq74Q5ZDan0
	aLluk+6jt1p671T3GMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvstV-0093uJ-GT; Wed, 23 Jun 2021 02:45:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvst2-0093kn-62; Wed, 23 Jun 2021 02:45:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 13-20020a17090a08cdb029016eed209ca4so481048pjn.1; 
 Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nG+pOWS0M1Gfo+8ACN/8exbFFB4o94YMeK4YKBZapj4=;
 b=cpNOD0m8KCln4XWBzXCOomTryHpX4+7fjUmu0naJBD3pDivMn28fjGbIoG1Mn0HDgw
 pkNRXwmd1ybS9wi50MtXc/hkARPDVFEDPYwGd9R4t/XL3vgAYxuN/rNlK5blPGCYGcrv
 c5BCCL71L/3wEu+IG4/DP8T7ssl1eYgMmqcYnCZ2tjj1DoxFKckRpcN2DV8A6Iu00wBJ
 88BJQPkjQUUg8gp48SB0rv8i7EttqSqJACftm8rpCbpkZS5RbL8TaLzcS05aAFgwMrqA
 ZC07hHSJZ3LYRi2KUXpWBYtjcoi7hZ29Javr2hCakL6Pi0exeew9ok2WUjte9b97tsbr
 ccjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nG+pOWS0M1Gfo+8ACN/8exbFFB4o94YMeK4YKBZapj4=;
 b=rLvv5cvtGg9A+FLLqBFUnTrNpbFSScVoAZumDMtkvu5KTK6jgWic74xtwbL7gSaQnk
 FTNzZg4wGDHK6ozIHIN/8+jFnxz5LZfgKixzXFoy0bIBJ++g6MWIDpCB3LEI8P6oJJkF
 HOoi3NOF9Cf58OHggh9wXLIzIE2AeZEicRRqfMrS7RFxFv0GUd4bdUIeNWACSwOnjU8q
 tqeqwHtgeTLVYsBIqpaxWOOwLa9npqNcQpCbuF4P4Jw1qyC4kXLqjoE+0RK3YQk7TXKb
 uuBqD4iIos7BCyAyYjOR9Qc00VkQWlPDMyNn8+o8YgwG4fMS/KfTNvMqmGwguKAg3a5x
 ec0A==
X-Gm-Message-State: AOAM530hp5l/ernVWP2e4mgZHkYXaMDkFwhn7/sNMOb41x2H4KPlrgMp
 IwMtd00OMtBsKW5Vzt4VaqA=
X-Google-Smtp-Source: ABdhPJwsLQJvoBHZ3TUXW9rr+r5o9aPuwYapZ4TRZKG3aXcbL73IaxtwdfygcLWNOILymoz7XNoxeA==
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id
 v19-20020a17090331d3b02900eebccde686mr25856408ple.1.1624416306583; 
 Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:45:06 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 2/5] watchdog: meson_gxbb_wdt: add timeout module param
Date: Wed, 23 Jun 2021 10:44:26 +0800
Message-Id: <20210623024429.1346349-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194508_296589_09CEC70F 
X-CRM114-Status: GOOD (  11.84  )
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

Added timeout module param same as in other modules

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 3f86530c33b0..ecd1fc6f48ba 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -29,6 +29,11 @@
 #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
 #define GXBB_WDT_TCNT_CNT_SHIFT			16
 
+static unsigned int timeout = DEFAULT_TIMEOUT;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -174,7 +179,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.ops = &meson_gxbb_wdt_ops;
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
-	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	data->wdt_dev.timeout = timeout;
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
