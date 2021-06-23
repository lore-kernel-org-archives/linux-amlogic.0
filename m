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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62600C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3625261375
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3625261375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHV/bsxLUK95u7A1XqKn/prKFOqG59VwncfA48+ADuQ=; b=Pbo21JR+/AVVeI
	roSmGuZwTPcOWixXYKwWyDkv/sBIgHCFRQv9guQzGENjdPg/XbIqGBSLtmLmGpq1kR78VbRHf5um7
	gE8Z0JcAEySzryYCR/E2VyUYUKFyDJH81Yj7MvdCigj1TGR/8Af+olDoIwzhKHG3uaTLmI/NMlE/u
	7P6KWw3PQkxr28IC9udT3Hy0zuqtv+Nf9ojyaDcLQEME3OO8QROvAb0LaCv3H9kQ55/ypaIle3Bq5
	ABobVBXdX3SVUYXHu5+TwcgYhmc6AMZy2ZcwPBbTupnR6KmKyn0iQWh0JuZ9PRwnc9K3ecVMvVx6h
	3e4AgvmA1q8OPzh0/+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvsuX-0094P7-VC; Wed, 23 Jun 2021 02:46:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvstI-0093pc-Rf; Wed, 23 Jun 2021 02:45:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id t32so1157951pfg.2;
 Tue, 22 Jun 2021 19:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LcifxjeTUDszannHMA8tVPaboMaFqX7AuHfWKGJzjKI=;
 b=JfkHKlHpvuQg3diepBAJEjojfs8YXzRc3xvNfso0Hrc8GQkFBeLP3EDXjQPI1VIJKl
 G3al2vMQ032sv0u8H5FTLNHzKYOgQf0ztNuJhK0qQ1eU2zBdjgcEN4NEi8N84b7Y3fex
 vooAIqWJ+7VWOFZMgiQYNuAP0KbFDkDQsKcKOljozIYft+C+N0BhKUIL3J+3beAdT3kt
 /bXgDg6S3/9OmwmRt6KpNzDrsE80RtjEM7j3hE0NJDz0qzEQ+HZasZKVYEZduOe42hWT
 RdZ5oWfGNc41KAieprAHF78H4qqQPQK7Qiv2Y5j2oOVjHSqi/UUgVyoTmRcrdkBPgMxE
 tTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LcifxjeTUDszannHMA8tVPaboMaFqX7AuHfWKGJzjKI=;
 b=bEywgl1nyt97S7SzCqkn2EdzT8+iRET2ZErf5gFEbaN5A2k6xTUndPUNNrw70SAWXt
 msOHx09vq71C5rjMD8NJvSKsVtyhX5bzti6XeI3XObKe2q5ItXwrDyxGefng6VGtc5dL
 MaILHSljmHXCfORs5P0noZ08o/gRDXJRiRhwlyVsDF8a5KOtGgv7J9SSwwmDOLnErNhy
 ZTa6IxOiNF4uKx7zcuedwYhBbCPnXXzwGa9FewKx28cMhXz9GkqfHiM7h9eHvfPyRwya
 ozBOanIOOjR7rarqVSd10d/DKJ6qrEegg7IddKbv9vnjj48qtQJ+QfEWRMVughbSwNFj
 E+0A==
X-Gm-Message-State: AOAM532qzZq6dQNJC37zQ5jiIKXCbFLylzAlQH/vwFv5+c8lGgZWTFt8
 NZ/45zekJLtFrib9x4V9YFM=
X-Google-Smtp-Source: ABdhPJzTDkJpnFau8uqxddN6VvWamjN+0zFvBtltEsw/1tOk1RZOua6W2lO++aLSf9yfwQkf8CyYEQ==
X-Received: by 2002:a63:1709:: with SMTP id x9mr1605486pgl.245.1624416324113; 
 Tue, 22 Jun 2021 19:45:24 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:45:23 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 5/5] watchdog: meson_gxbb_wdt: add register device status
 notification
Date: Wed, 23 Jun 2021 10:44:29 +0800
Message-Id: <20210623024429.1346349-6-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194524_941375_C0639EBC 
X-CRM114-Status: GOOD (  11.38  )
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

Print watchdog success driver start status notification

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 2dbe254e5122..750b304b460d 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -198,7 +198,14 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_stop_on_unregister(&data->wdt_dev);
 
-	return devm_watchdog_register_device(dev, &data->wdt_dev);
+	ret = devm_watchdog_register_device(dev, &data->wdt_dev);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
+		 data->wdt_dev.timeout, nowayout);
+
+	return ret;
 }
 
 static struct platform_driver meson_gxbb_wdt_driver = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
