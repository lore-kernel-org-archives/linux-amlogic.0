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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B65C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8DD60FD7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC8DD60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/YjQxef9CNBnyPWcq0uhJuDW7tu1V7VN5Rvd5PTvs4=; b=Dy9K+RdR0WiuPR
	38YFPcCwd0IDVyEyrsur9P+z5mU5xyv1h1PysnkPxyMlLrQxjCtN8fOmf1SXnpZshjAV5i85nP3e+
	IqMnFB5j0HBRS0wBUf5l0cLHHvIfxeI9qYjQoqPFzhcyAuqQhQU7aB+dR8LmGsUR37S17XgldPseT
	CGt5Xx4nTpBmZ9wLQPP5jOylvVSd4XrDxcVv0xSX1LmrI0aio06ID90sgI+zPOD9YC8LQ4zd//hfW
	0V0ZFD81pcq12rcJxTPKKUBqxNvbD+7UqrnuRCSbSqwN2x4zuMPWmdInzOFukNBhAnRebU60IHISu
	IOykEp0YySm7TMmMECsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Juv-0073Ow-Bp; Fri, 30 Jul 2021 04:14:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9JuY-0073HG-N3; Fri, 30 Jul 2021 04:14:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id nh14so1539648pjb.2;
 Thu, 29 Jul 2021 21:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AoyWEpL0YVaQE9+ONyJr4LFablmBYJyxFXjy9TOBNNM=;
 b=e4g8fCwQWSMiPKyMS3xOy0kn8ySE15HVD9klYxHd0iWkDDCAhg5u1WiUT7OZgaoWOz
 WP4rgRiC7L3WdQL/FXiN6QIMaK9Iu60ECweg38Nqysz/PxliK2vQG7UngRyZabypHCoy
 jB5gdbbQJRakgljm3aaHZBlDj6JqC69f1zIw88Y6Pqpla906qN3Ny0mPSgHWbWcbu+93
 tiSM0FfmpwjET5hATIpcxPJcvkLZ6awmz8H4wt3S5gdua4HVJto2VRUumnAawsznE6Ss
 skxEt/Lp3eVLaV2U3mfw0Sl2nmByonaf0My4XQRa5f6+Fbr+/0stDORGFfRgRSr7A3nL
 ZpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AoyWEpL0YVaQE9+ONyJr4LFablmBYJyxFXjy9TOBNNM=;
 b=osJ8WgpCkMpn+c3F1ugf6rKVINhs05ypa22wVEWIg1niglGtIZcdeM+Iquemnketlm
 /FL/dpJw0d4zlO7GA49UerMKt4q+H8scx2XgBLi8uPu+hRPx110Y8iL+MazCM378td+S
 D79MP/5lZEODhoSq0m73Z9eejBOCNMSo7nlVXSO9Ouslned1NSEXFo1rfSleNZF3bfId
 pcSLArQ+snlhd9HvmUJjR7W7LsMkMxjArTbIIY9wRJd4jWvDxiEhav4PhJBy1Nd2g7EC
 2g308ugmcTDpyofZ5WYU0BiVw2/eqFfTtyWNjp58lJjUoU7cC7lY5Ebd4HkWp9+kUSKo
 y9Uw==
X-Gm-Message-State: AOAM530rFt5sApuZEuCg2QOMVTIkjLpQI2AuU/SVNsFERDAgSADMc0X6
 x6SUc9WpLptXlNHaM9VG1k8=
X-Google-Smtp-Source: ABdhPJwx/PToy3FwF3WwEtnts+RJLI8IjXehkAeFuBJIPYUzM3QTFrLsAXSHWvmAw5W+PHEUysy22g==
X-Received: by 2002:a05:6a00:26d0:b029:32d:7d40:5859 with SMTP id
 p16-20020a056a0026d0b029032d7d405859mr593191pfw.76.1627618454004; 
 Thu, 29 Jul 2021 21:14:14 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:14:13 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
Date: Fri, 30 Jul 2021 12:13:53 +0800
Message-Id: <20210730041355.2810397-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_211414_791739_495E202E 
X-CRM114-Status: GOOD (  10.24  )
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

Add nowayout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..5aebc3a09652 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -29,6 +29,11 @@
 #define GXBB_WDT_TCNT_SETUP_MASK		(BIT(16) - 1)
 #define GXBB_WDT_TCNT_CNT_SHIFT			16
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 struct meson_gxbb_wdt {
 	void __iomem *reg_base;
 	struct watchdog_device wdt_dev;
@@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 	data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
 	data->wdt_dev.min_timeout = 1;
 	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
+	watchdog_set_nowayout(&data->wdt_dev, nowayout);
 	watchdog_set_drvdata(&data->wdt_dev, data);
 
 	/* Setup with 1ms timebase */
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
