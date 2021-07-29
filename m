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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C40AC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FF7761054
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Jul 2021 07:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FF7761054
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB0oBG5jouR+xDlJe6piEV+Dzgnc2ykfHs/SC28q+7k=; b=tEJwTn+4kbSGZF
	IZtBw+fEYtAFPoZt/JhpdMQ2ozIY/UZB8ile4UBNVfXS5cHtchye/BFUn0vaTE0VQTjqnGzQQ+lGg
	CVHdTNTz8Jouvn1EoYhtxdsPw7kKKQ7uIg9V5gZLIj67hxxXQ5GB/PwUXra5kGtGy+FoxtnG0tenF
	CW0hik/op5d4hFlbenFeIcE/pAR6kX0lj2wcIQPpXz/b4zOiDcdMTJRitdv2RL1HcRH3tJty9kckb
	bTcF8Mh6zkUwiOWvNPSLqBd7I4PXSGtrJ5PmWTVKUImAQd+i+ViixNAQ3lzgqF/QCk6VTKGfo4JRx
	mGhrWyDAeS5xpOQ0itEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m90P2-003OdR-5w; Thu, 29 Jul 2021 07:24:24 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m90On-003OYj-60; Thu, 29 Jul 2021 07:24:10 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so8124406pjd.0; 
 Thu, 29 Jul 2021 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z06keajlTXWx+2YOib8BW2we7/nwCviWxA3eCYkFm5I=;
 b=MTEJtfylwbquVgpyBWBBlnzqO+eFwdJIE08i4R4YqJoGdOL20Pb6Mu8zTYmfGJueqS
 srMl4LFqt+VGQ4kMtIBJRzJTatAD/jHk+JRpMXSWw2OIFWGUB7ElS14Z3m65heCvOobY
 xBHaqHW9O5cEH1VCuygWEbjreoySqDhkgHxmw6iYIcwdpI1IbE8FsVNjg9JTyXd3dtZo
 Y2L32tXQtNNwe/6Y2MKqdrkAOG71pm2+Fx7SlCpOZfGb2EGMt21kfRw8AXxzuGe3Wln0
 VGPCACYDyiAi9ahQXdOKurRUvD0yseLo6Xf+Cszixg6+T1v4bDBSFqNF39G+lasidVn9
 PXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z06keajlTXWx+2YOib8BW2we7/nwCviWxA3eCYkFm5I=;
 b=Qf9ktBWoz46GNDJyev5Xf6680jZMVc5BgMiOzCZfa4FfBmBBlEKIy7Kb+LRYW79fp2
 JNn1HM/52QfWTXEfNZEjZ2nSlHT1yjtFePhLTX5YN3A+xIbtcgW5fQH/80Y9y38yLEwQ
 Mn1orA1KcPbKG5Vya/J4FAyk+BXRcgT6pNXpG96Gmozg3gfErJJJLFA+uHyofuvxSqYw
 WkXhfY6lbjwJ2WmpPHW/xqVD15bBg1P3Xd5ASI5eyGxlCaGdAaTkT6fC+6eizd5fS9eE
 rM+6nb7OTEvRJ0yGinC2uJTG02rl/1MUUl4+o9U9uL/4py6SfN0bRnjebQ2+HRSrLeYc
 YG8A==
X-Gm-Message-State: AOAM531TLf6Mj8Uf767sJGB40+IlUuAjw9kfo4DbrQJRZpmAyqbx2k70
 fNr/uPp7MJ9XZybt+RBnT3k=
X-Google-Smtp-Source: ABdhPJzEj9HlIHcRVM4prfjqaxAOugltqmoHt4TqkkEQXb6cyb+j7JHwggoYCJY4HRAH+7lj3T75dA==
X-Received: by 2002:a05:6a00:14c4:b029:331:7474:cb4b with SMTP id
 w4-20020a056a0014c4b02903317474cb4bmr3776022pfu.30.1627543448231; 
 Thu, 29 Jul 2021 00:24:08 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id r18sm2609648pgk.54.2021.07.29.00.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:24:07 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH] watchdog: meson_gxbb_wdt: add nowayout parameter
Date: Thu, 29 Jul 2021 15:23:06 +0800
Message-Id: <20210729072308.1908904-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210729072308.1908904-1-art@khadas.com>
References: <20210729072308.1908904-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_002409_266066_15A46685 
X-CRM114-Status: UNSURE (   9.98  )
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

Add nowayout module parameter

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fb..5aebc3a09 100644
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
