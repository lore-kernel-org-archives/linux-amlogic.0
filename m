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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAB9C48BDF
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2C366128C
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Jun 2021 02:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2C366128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxK6JzOxpqSKFhAdbO4pFcPSQHNw7hLRKR+HwU4EjWg=; b=lpmUQ6ShQ6yzMI
	qqA3K5QO3rj71qGaFJavjqZOv40V5+0LwpJDJ/jaQHZS6VBRG65NQ3JziV1/fp1tL7TVXz/TNuaLU
	AzU2jGBKbQ+lq9ukF42PbEiYrGUygV3CYB1E9sqGITwy4Yemk5ighsF/fgIcBRNosrS4BcSHGPjxs
	C6RTAm+EbhlTgQ1a40+b3GHVOF0dFpeCosrL/7QutjLS9Gz0dc7YLnNGVufWaOIvm4nk0CbaKGeqz
	isbjEAmlCaX5AC8W6YydyaCAPEP80yyI03Z4sR3KEYWYaPZj5cQ0thVbv5bTiO6vY88emlU6KF42d
	4fvYxG+k3hj+3sDxZXZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvstG-0093oo-94; Wed, 23 Jun 2021 02:45:22 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvssv-0093jf-Uv; Wed, 23 Jun 2021 02:45:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id m2so508709pgk.7;
 Tue, 22 Jun 2021 19:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukleBmqzIpGM4yU6BPMvH09lh3OTDa2cYsNSJ3nPLR8=;
 b=TyN1gQL11qwfLDcx39jyQkRAkmxIqe/+31eEwGe4MiGfspVcaYvdC+Jz8HAJO6eHXS
 BEzFELqdsY5jbJDsBpW0FTUIub4kCgRI2EJx3PdfarOz4h13NvT2N2DgTbD/wT3PqfzD
 IoqqPDdcIDpm38c5qZYOXmvE+jye8Y83og6joyDxCnL2Z1QqdUi/YbqXoLNNMRq3imrM
 BoJqkaYg2XxiQ7GYqKZ6TB7X6vM3o9ZtIM0qqtTT0i2ZRwJQphFc+YLprZ8YaeOVssiB
 7rlrJV8Vm78v/MOFxuBMuiY3bBp80Sr6bVpGSG/dzGYIziRx/MIvSD4PjtCBofDrICXF
 qvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukleBmqzIpGM4yU6BPMvH09lh3OTDa2cYsNSJ3nPLR8=;
 b=Zn+q57/4iaz9s841b2TAu96YW441VUZLslVjiAaXI8c1tN2VxzpelCVJntDI+fh6+e
 BVC9GkuXfItiC+EPvx8a05GS+7ZfvJW+m0xmZJV36TsN0LXJ6Kgh1qZJ2hq5zU++csZ3
 UbSRDk4zIeemZTt6shZaNYQZI/x1MdhrnT6GDbHeKt33RMvf0a487ZP3WCgUgwDDmcAH
 UFuPRAXFkkVLmBLW0qs4eVAUXEAE1TNtKk7gQJjbzHMDLAQ14GgpZSGiJqkInitJd+41
 32NA7gPSmrAsL7RYBj77WBz7QlZE0mzQWk7mYpL4LFeTlx+QdhR24roHpeoOcSACWubO
 MiJw==
X-Gm-Message-State: AOAM531FoRVQybCG9Zs1ewBXYqMK6N3PxstcswGuXmeDkdw9MGvDZ0r7
 3/Kz4jCWiEgvBI1H5kw3h+g=
X-Google-Smtp-Source: ABdhPJz8HDIKbB6CQrQ6YOtKvfhXIK3pg5WpG6McX20IWNwWHQCWMy8aD5gr19NU20lbCFPFC0jIpA==
X-Received: by 2002:a63:df56:: with SMTP id h22mr1646988pgj.224.1624416301246; 
 Tue, 22 Jun 2021 19:45:01 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id z17sm556307pfq.218.2021.06.22.19.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 19:45:00 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 1/5] watchdog: meson_gxbb_wdt: remove watchdog_stop_on_reboot
Date: Wed, 23 Jun 2021 10:44:25 +0800
Message-Id: <20210623024429.1346349-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210623024429.1346349-1-art@khadas.com>
References: <20210623024429.1346349-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_194502_054451_D5CBCCD9 
X-CRM114-Status: GOOD (  10.13  )
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

Remove watchdog_stop_on_reboot (still can be activated by
watchdog.stop_on_reboot=1) i think this driver configuration more useful
becouse we can get reboot waranty for abnormal situations on shutdown stage

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 5a9ca10fbcfa..3f86530c33b0 100644
--- a/drivers/watchdog/meson_gxbb_wdt.c
+++ b/drivers/watchdog/meson_gxbb_wdt.c
@@ -186,7 +186,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
 
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
