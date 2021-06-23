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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF7C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19A266128C
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19A266128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwHbaD6pMToWvJSV0Gznuo7V3ET7AJ3M88PwyxIpbMU=; b=j+ouqTb1/HrDpK
	eVQzNHkNL6NPJ5irk5ehKfyu19S5bcVQXQVkVHZ+fBO8Aybs5Rftbwnbm5l3SL0lxogU8FhBZycbi
	cXH3MhTJti98Jsk2dxgw5hxjCp3M35QJR2+s2itgd5zEvso1VwQEGsbk/yvfy4iSfGDpoHxjA6cX6
	DMBtgL0gmbzlvGfUasP2JIHjdkRnFsp8Q4fk4Reo3FZklZo4E/F+nohVMbphuPV4/x8hnNgpQnjLx
	Kh0RAeLxIele3abHliMQzU29Qj5rmfs8Q5rqrJBAPWJsldy4abpXqXELzux6uTe7bTn/r0tINEJru
	cN2sonMeKhictf+NG5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvsu2-00948Q-4X; Wed, 23 Jun 2021 02:46:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvstC-0093ne-UT; Wed, 23 Jun 2021 02:45:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 p4-20020a17090a9304b029016f3020d867so468784pjo.3; 
 Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ip7ajlGeYj7m17iAVH4CDZ+K9tw9hchuXGcTy/Lm6iQ=;
 b=ZLHfABsqlgyddU1GXYU9y5z08Y+mthiwFyIpXRHJYRuxFLzMQ87pEBVg79j10WS2qY
 FiShyYhNhx8+VW+95/cNH4rGhSuBAAmbdjA6dutHC2p26uj1ug1lutM/V+BNia93oByg
 2FGz4R/kGqk37obq3lHyBVkQg0JD87lvKHgLfCUapD4yrMv0vctofqM31YhBXVCl8tUB
 pE9sgqKfduGMzqYg6xtrA5J/bH3d6yCwI33BoDzoMOb42bDmByANRj3A9Zh0sKu9MQBY
 GnVMrXqqaoxd+vdiW1PWVLvjFpWn8V+yrQUV72n3YSzP3UI5g7C+5OfNRbD+xPsMCWGM
 6Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ip7ajlGeYj7m17iAVH4CDZ+K9tw9hchuXGcTy/Lm6iQ=;
 b=C6ELA9t+WZQqMDsG5FjmVsSmkdsZJd7UVELcINHn0W1MjzoTmWTXmX0KswFsebxQi6
 WXwScYZlD+BClPZSOr1gnuLKeCrx+e8Kns/LShHvcPs1uhXejFHnuJZT9/wixSX4dSZR
 1m9lr+HrfUtKRLg7RyN/zXkqYYUjrMqkD5rfRscM0thdmcsk+mrDha0u7K074nYsFR/y
 zXC6CILBYQzewf7h0LdOsN1q59vhSQOop8A7snDUgPJ9Sw9dAo+XiQU/BHP7q6Zfx5go
 wVnUV+gbtfzfn5Tckghm/55KEy3GCqCOM91H6sutRiP25z4X5puWw7e4uAMVyfykymo8
 JpqA==
X-Gm-Message-State: AOAM532tr9kk9Dzy/vXvjufoIXc+I1n+i/Lgc7WosyWZaFWQQFkDQ5cn
 ZKo/DZ5jKtwPpoYDB3XNSTE=
X-Google-Smtp-Source: ABdhPJyhCZwjN/m4vhnNitMbn91dSnkTedliyYAJ/e5+IN8eggGCWtWL3XZgZhB48Y3cBOXQ/yZ8uw==
X-Received: by 2002:a17:90a:c8b:: with SMTP id
 v11mr7062600pja.114.1624416318293; 
 Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:45:18 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 4/5] watchdog: meson_gxbb_wdt: add stop_on_unregister
Date: Wed, 23 Jun 2021 10:44:28 +0800
Message-Id: <20210623024429.1346349-5-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194519_031982_BB27FBF2 
X-CRM114-Status: UNSURE (   8.81  )
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

Added missed watchdog_stop_on_unregister call

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 0bf5dccf70b1..2dbe254e5122 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -196,6 +196,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
+	watchdog_stop_on_unregister(&data->wdt_dev);
 
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
