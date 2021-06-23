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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A33C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067C660E0B
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 067C660E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89wV2FE96BTZH9LTIjjtJC9mvGOkJouD/kkSc9n1xk8=; b=x+TJyY4u6Nxltp
	hoOh2D24B0JhlpC5PSBsOo+eZ7M+M6eDZBfbEKmGst5MeiSrXpaTFlvmYd81tsdg6pNkRallfgbQm
	+14Xsc32w6FSckaJIS+xZXMcLggMRGIoZswkbvDtyblaEB+mQAEM1Rc0vNsiAWG/jbJ97cwZS2s7k
	8K9VpHiS74oZe6DElg9rgZI0l4n131jOG/HOnJjePwpmUuOx+scoriakUm0IcPFxkxFreq+jY3L6Z
	cjI/1EFCgrx7EKNqufdv9AiIFQCrJvaY4RFZH6c90E+fkbwO/3cS2v0pPJJ1DCHUamWQ9BAo2/fu5
	2ACV7mouLIIHKlzkff7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvstl-00940w-VF; Wed, 23 Jun 2021 02:45:53 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvst7-0093m2-54; Wed, 23 Jun 2021 02:45:14 +0000
Received: by mail-pg1-x52c.google.com with SMTP id u190so506789pgd.8;
 Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPFqIATPhWWwBTYdqzNzQjdIULoWnpFZ7XCB+e8mlfk=;
 b=oJ88LhcP9HqT1fGzZFb67TsqQRaDN38sPdX0NmNJFzbd9NIlE++SsQMnmyB8ojSCbO
 VlNUFttnGpkXRHP5w5JSfajVOpcU2bf5grt47BDK+sur4bF9zlgV30HpXG1lJoFqWSeZ
 T9cs60SJ3yTNhwoATG3xzt1VprROWKtTGPZDb1j2syfzREO5RDzXyqIlCCiRLM/Am8la
 bFxFXo2wwfwGp19GsHUWeziWWKwWK6ue5B+GyDOXbpOyD0caM6cuMHaqnlLUymn3TIno
 IQyXYSJ+bx/TFx1Q7gPXarRi5GFGs8NTpt22UQ3CwE88bA8oVmFDxkW/1xGcBFx/TenQ
 oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPFqIATPhWWwBTYdqzNzQjdIULoWnpFZ7XCB+e8mlfk=;
 b=rdtbNYIkiZZkHJ+5Tw+gS8owYVDNeS7qBSnIhfiii8rwGX24m4Mu1A7QJfqplCv8ET
 USqYYvIQG/g65S+M364zmTV+NTj41EPqpblXHq7BOA+M0gN+bZpNdCcjzYaazJl3fPH3
 DVLCc3nWENehLzkP39lhjoD1P8hD+igoDaH9yFNhFQtHcK7B8ukwl8gLw1PYnecU7dnZ
 VhfQEQaaALuOocOkK1hK9Sdn3UH/jU4pYhTWWCBnWEYFJLZqsyBJ/ivYMHl93P9tIY2c
 xjYG052JZAIVwdtYP+ib46Df42lCQzKCxkkTgr/5lF4GDvGxJBwj0O75P7rP6HeztViS
 Hwbg==
X-Gm-Message-State: AOAM530XM9uv1I5TQXWWTGJbgEMk+kpNTqhMZ4ESGra0TwMMmPqYkA/p
 9IhrZCxUp2LqGa+Wan3rZJ4=
X-Google-Smtp-Source: ABdhPJz+I1L0ABLlcsBsdA8QhWfERDGtZruZ9FPqljRPK4ZF+kys/jHnsu4bYcMWJfFkyX75iKtu+Q==
X-Received: by 2002:a63:5f11:: with SMTP id t17mr1639630pgb.91.1624416312431; 
 Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:45:12 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 3/5] watchdog: meson_gxbb_wdt: add nowayout module param
Date: Wed, 23 Jun 2021 10:44:27 +0800
Message-Id: <20210623024429.1346349-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194513_252456_2E776F6E 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Added nowayout module param same as in other moduels

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index ecd1fc6f48ba..0bf5dccf70b1 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
 		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -190,6 +195,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 		data->reg_base + GXBB_WDT_CTRL_REG);
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
