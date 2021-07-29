Return-Path: <SRS0=5MM3=MV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE6C4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11D2F61054
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11D2F61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbUfO6+ui4CC6arYAHwXmHDuTm2/pmo8uEbINwPWkXI=; b=Q8MrXD6up9gJK+
	yLafpQ26B4cSjmQabfFWWP7FUKQZRopYr15XZh0bPv5OtIMvOgG5N9pSEeRInGggrpRWord/IIp9y
	Oni7Uc6TIF+fdgE9suIVg/k/m5fgeTh/uLNpiY/qet34mu0bYp8WwejtW8WBsA37MPFfbpw7SC1t0
	PaNKVQ2iUgdTNaB9xe2YtaPJYg5+B8wrP/yxO20ehXaEKin+O4R0nN/Dtj1Y3cEcYqOIRDFRDYOBN
	4fab+ZYG9rJs1418PtOf6VSrYbsC9oIjkWNy9uuv1xg5zPP0LUGSMFy+HIuPt+yvzSBKc2ihcIk1l
	ihBQ+LVRZM6xNUPY/37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m90PX-003Or2-Ke; Thu, 29 Jul 2021 07:24:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m90Oy-003Oc6-06; Thu, 29 Jul 2021 07:24:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so14174883pja.5; 
 Thu, 29 Jul 2021 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMswTWDvtI4DXxuELsfIeTapWGrqixV6WaQArp0NDx8=;
 b=YAJ5HBfu1f8I+IYA4g4kd7SbYHRqr/mqwUKfrup7IAXbGRP44wtjgHAQnarxHE+dJi
 /lk5rVSR5DNyQ8a1bWFeFM2GtBG/0KKIld0h5HI7Q4xyebFYLS9PhUWkDEWIUj6puxcZ
 sHxFf22tUAxabG9TT+1jxVPREqtTr1vQjln4vUYXSSkorI0vQtqF8KbQUvEYNl2HoJc6
 XZngzzgWmejVIEMiPBMWVXezE1ttgb74r9cGcFAwNkejWOkz0N0WYSvCQN6yeGuDsyid
 XwORDxnCvP3vqm/gSNEwkLsKwQK7o+XxX8K96VKra5AHWyPCAqJ8dAHCX7bLkx1O6H1L
 z0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMswTWDvtI4DXxuELsfIeTapWGrqixV6WaQArp0NDx8=;
 b=IVMgRKTWVx6ylbiN1wfuVTLnzMROetEFfWKPIiAKaeny31sMf9RCWfG7iLTc/rMHS2
 bP0jfTiJFtS+1eBUbnG/g3vvvhwcMjc7v1PRuJguy1RjwMCwTz639EJzjSt6iq6hjoPc
 szC9sy5yRSJjOS0dIC1xezyotO0xhiJvFwWTpX2tEfn+yaGVe9GveV+9aVTu8k3v9fMz
 2TU15LEllRr073ddx5vtviOunchedpHZErRgVc4DFD1g0K6aLi3J87jyDZmSmEcNkFAR
 V2xBu4uZD/VmM7Rf4qyX/7jfmd2aX/PIxGjz+7rA8Dce/wePVbuuLsSXWP8kLAmI2NEm
 FE+w==
X-Gm-Message-State: AOAM533N6n0CRr9uUBSsn192tnHGS96yh7xl1MLr7MWIcnNnIZgSCNAs
 iIGMMPTWZTFstSu+6RdDfg0=
X-Google-Smtp-Source: ABdhPJxjKZYGxl9UmdCm+aHK8JWzKneFtaMZp4OFYm7PF5EkDbyru5cOh1mYJw99LDZEIv0sgFFSsA==
X-Received: by 2002:aa7:8e51:0:b029:332:920f:1430 with SMTP id
 d17-20020aa78e510000b0290332920f1430mr3814819pfr.1.1627543459056; 
 Thu, 29 Jul 2021 00:24:19 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:24:18 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Date: Thu, 29 Jul 2021 15:23:08 +0800
Message-Id: <20210729072308.1908904-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_002420_096763_4372FF52 
X-CRM114-Status: UNSURE (   9.30  )
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

Remove watchdog_stop_on_reboot()

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 3f3866878..cafc6cdc0 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
 	meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
 
-	watchdog_stop_on_reboot(&data->wdt_dev);
 	return devm_watchdog_register_device(dev, &data->wdt_dev);
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
