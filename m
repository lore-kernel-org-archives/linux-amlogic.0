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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE2BC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F8A61054
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51F8A61054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJ/BoGO0np7SC91zxTj31lPpxdAydquGo3+IAAt2GhI=; b=VjM0iUct4/rDfs
	EOG/XQuoQY3E4p43PknUKv9h6hefytsUc1MKjX4iAxFbJ7yQIUMGrqAA6VfPpnWrJ68mijKEHxTNg
	pvLQm4ANmF7vEnWg+WPdf9aAcB3g9yzVOEo9E/ZmjZ9wp7+huRv47LD2f3XdSnhDa5y0hdw3grwkb
	7z+uXu9JnX5xU0HCZMWJ9REnt1B4oZ3bc8EP0+wTDmA+62E1a6PQYy5V7pBUlYxCWLqmFMEGapzsF
	p1pso8FxMldR4xYg8Z9XN7VNrmNT+f9mHtvDbU9UsE1F05zLIb/ODF6afb6jn4GfbOWjuoooWGo8q
	0HZHQdGXolkz/tk+qiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m90PH-003OjZ-GY; Thu, 29 Jul 2021 07:24:39 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m90Os-003Oam-FA; Thu, 29 Jul 2021 07:24:15 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso7975351pjo.1; 
 Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xQ7/1DfrNRJ45H+W3f9Rw2cpCH1NPP5TLpi8qbhtTMs=;
 b=mF/HYZbpFZ8pkbLuKfvn6MfD/1/1PsljR+EN+iZ5tVaETldfVQGCR0Ht0vxD2CkFXn
 HSUu/z5ETa2T52U3KplVzDhPQ+BAAhw0MFwKpB8Py/mQdNeRoKmNshE4NhrtJqnm3Uwv
 7StQlGrvfL2frwpUOKIqdj02XYBpSg61owhi36FNhQbHjovPCE7gG5jHVdd98SWHPeLz
 9fscKpGc5u3J+YMJgdCOEnThe/yVro9MDPqDiV9TnVzgnN3qGC1s+KvZu5EwdW0gYfZ/
 yxDRO8rjFbp1Jb1coW/x/Tp45Ru/t1fV088Zg9wzCiVAHNvxCiD3MXnf8WyTrYg9LwK3
 bhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xQ7/1DfrNRJ45H+W3f9Rw2cpCH1NPP5TLpi8qbhtTMs=;
 b=CO3nH1KedNQGyXUysb2vgd37GLkvoM2uoyzzQkyN+M1LG69JRjMMCji9hbs/8IoQXu
 0G8f5fdy+HyDhLvH/2KUlWhGIGp7N06mkjMazR6rrRxdVDC9M4G9taQGqmR9xkIgb4v3
 Z7OTdm3dUcs0GWDkYxicPCo530FIVP98a70CS2vq39zzPHhhTtWfVEEPaG3Ig3vpT6ez
 y4IvDK+XVlz1jbzPFKA0Uy0L74zFyrmTxUji5APTNo1SvBBA+iecU0vTE16pVZO0spcg
 KVv9tBAZejEsc/MGmkKe12c+AcxuiIYTmT8NrT5kRTiOFeXIS79g9RR8ovXOEAAI/4F6
 ev5A==
X-Gm-Message-State: AOAM531PDYVlOyUVR4rom1dkEbKeMAxbcndm/Ujy9lfhy1ig6TBGL9eF
 +Y4usCz9K1wZqHemsIYatMk=
X-Google-Smtp-Source: ABdhPJxFNBy2+YgD1/m2YORZ9tY9MV+wbmfG8Bruauj/29dn7TZdgF+hsWc55pUfPJJXc3BE8rHWug==
X-Received: by 2002:a17:902:bd82:b029:129:2e87:9946 with SMTP id
 q2-20020a170902bd82b02901292e879946mr3464634pls.53.1627543453630; 
 Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:24:13 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: add timeout parameter
Date: Thu, 29 Jul 2021 15:23:07 +0800
Message-Id: <20210729072308.1908904-3-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_002414_563569_24FA67A9 
X-CRM114-Status: UNSURE (   9.41  )
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
index 5aebc3a09..3f3866878 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static unsigned int timeout = DEFAULT_TIMEOUT;
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
