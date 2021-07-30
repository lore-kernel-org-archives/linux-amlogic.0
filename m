Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB6BC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E69AA60FED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E69AA60FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqx87pGklioYiPTvH+fiVA/FAS90/LVlTKA1mS+pPlk=; b=CVURVipgOtezHB
	/+JMNNyWZ2q3QLDNeNwvXF4tfTKS4rknwiHjfthqK2IwA7rrxPB5cjlQT9KkVc1LYScC3CZ+P96HC
	BEpK0ovO3wO4pY1qy69hsgdmg336KH2F1WL3bRlVyrh49CCNYp9W4yIuwe16Aerq5+2RO5CO6As7T
	m/BuO5cnLH5SJ8I1oXCClk+M1/tQRTFsEW54STvjGDfGY46xWAV/exQVf+CMEGkrWpI0LZRsCbSld
	hywWYSjy6d3WK/Pxs9OjMlcOW+IYUaARWYVK2pXHY+qfcpprww+1e2R69lQc8zRw2MBE5xly4g3dU
	wTCpAyeAc2HD3l0Igx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9JvA-0073Vg-2C; Fri, 30 Jul 2021 04:14:52 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Jud-0073Ij-TM; Fri, 30 Jul 2021 04:14:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so18869239pjm.4; 
 Thu, 29 Jul 2021 21:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CedIVTVLdu/lypJPj4Dg+lxWwqXrdBZt0BeM9wWDGz8=;
 b=jZ6MhW4oRJotCzmn9yT9MzAXcuBUV4+57oKI8XRLcj5BfUBrWhl+uwGd7F82BKF8pf
 2c65NwcMmRf/nSdIRKYUcqzqhtpou4abeb4Ybc+mn06aHa/21n5HQeCL2pKcGd57TBxz
 ZBYpPZbt4axbS0We7eLYBb9y490YVQkggWcgf+PFyov6L+VmI0HdFmqNt34ih3C0VqDK
 N6US9Tbo10ixo3qPxXM47CupTy23gPjLzUlmkaA95zzCItYAd4TQyEb8tc6I99/Fz9Pk
 diUucro3uDhnpqsaxEXmbvJJs0NUwZn426AKrqMZROSxvv20o5uRKGsBIQXEqMpo4lgP
 Z4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CedIVTVLdu/lypJPj4Dg+lxWwqXrdBZt0BeM9wWDGz8=;
 b=sr28C5ujcWS34aMqeSo7zmP2ucwC45l0YeroyPcwQztBclrk9RuG9/6WS49+kRipOb
 KYnterCMZhmVfKTV7hne2nlVmdO/YAK5R/+NK/lkZILTD4QgV1RGDpfA2yE5RwHz/+1Y
 wKgd6t6i4BXWcW1hQtwzeadTJeaO8u57dd5BF9+GNK10NbE311S4Sj26dVapMHX/bkP6
 NsnDXvPLdFvVb1DZJy8JvM59F7LKybqaYK+xRzi6TYnv5prg74h7oTcgE8p+bL8+5cQR
 KSDpF/fwZ6sjTw9Z5/H0kGVs+fjw++CfnffQ0a/EjL5AiDNoXzOdHPzz1z4PMLo2NjTx
 kycw==
X-Gm-Message-State: AOAM532DlgQUwcFTGIuXKCTcdPXOdYudtPGEpoyNpK1tr8Pmcj5rJDSm
 vL+2SkD9ullgRpgvHKJ0IDI=
X-Google-Smtp-Source: ABdhPJy3kNbcx3oc1mWZ4cBWSGRz4ql7ZJ9dNzE7MfbESnJvcd7q99M/D3ctid0xDHHp5sx1BUSIlw==
X-Received: by 2002:a05:6a00:1352:b029:331:afed:38b5 with SMTP id
 k18-20020a056a001352b0290331afed38b5mr793450pfu.5.1627618459222; 
 Thu, 29 Jul 2021 21:14:19 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:14:18 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
Date: Fri, 30 Jul 2021 12:13:54 +0800
Message-Id: <20210730041355.2810397-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_211420_005535_2129A247 
X-CRM114-Status: UNSURE (   9.47  )
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

Add timeout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5aebc3a09652..945f5e65db57 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static unsigned int timeout;
+module_param(timeout, uint, 0);
+MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
+		 __MODULE_STRING(DEFAULT_TIMEOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	watchdog_init_timeout(&data->wdt_dev, timeout, dev);
 	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
