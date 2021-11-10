Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C101C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Nov 2021 02:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C9561181
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Nov 2021 02:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10C9561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ex6MseI4zJyMZr1M20JG+g+CKZPQep6+RcOWlGk01l0=; b=XM2y9ffAs5dErn
	LjZ+ZxHKBOgLADoOElYKaSsf/zeP/zMEbuqqqxEMWq/p1XNcTvJaFNd+a+ab7DwySmWPhIXV2rqc3
	DaEpWNBFaQY90A1t1HUod5F6IUWIOhZU2G14KHsH61G4StDVIYQ9Ckeq088HYnFZG6RMnI86Z4AzN
	c54XaFmV2/wIOp/4UXG7qgoz175/GhKnwaCCLtcnYWY/P/onK9qGsPHVD7Z/EZtn5KGNXflvl86AE
	3uXxcnQ0/QWVL1iE3c/zg8iWk2LnSU7L98ZZoL1COBom28ws+szQOeKuId/iSpqtltzX7TpeN9SG+
	j1w95WTcNaddYnGmdCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkdJI-004K25-Tl; Wed, 10 Nov 2021 02:26:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkdJ6-004K0N-Ba; Wed, 10 Nov 2021 02:25:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x64so1241707pfd.6;
 Tue, 09 Nov 2021 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5hdjzL4fx6MCYrF1luLAHmrqgFH4sajhljBKE+bpBg=;
 b=Wp+933VhmWr8dtWw/LmFTkCFPa157nh6dtoQBDi+ZbQOVf3NDHU9wcEzgG+H7BEI7K
 NLYHDVZoKBLpaQJMIEjYvlK3Bd/AHs17vskCadVZyTFRr0VdRi86b5RAMizT5UzaxWAs
 EkwfgaYc5n9QNImDflB5KLxL1KBdZC+2VEwXtYeo6zHrUxyzP7xy0NYs8GW6Iwd/ygzs
 RtdBVGVE6Ed7qcZCeUd4S6mfbS77ZXzIix9Gxlv/wp7h70D7WejVaL1L2g/x2nNxNIyO
 GnxU/Sd+s3ZebXJTQtOSNnIJTTvMvoS766KbPjeb1HLUWB4XnAc9i05bwChVHxjLIqDW
 SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q5hdjzL4fx6MCYrF1luLAHmrqgFH4sajhljBKE+bpBg=;
 b=25iDJZuDWgmmOhkr0Z/7glwxjid5/NoH+/be7E6DZ2WlXQYHzzQ9ma03nOEJIjK7eh
 QQDOir3xnlm1xUtqQ6dRtsoEHJfhj267J/WxH+2bS0ssHE4l5fGczCq+qiL4kPujKJI0
 UsmTXlBaxle8E7hhxPkj8rBvQIUWl3q5jNC07hC7JIybxrfQS+zUVQx3iEQXt2tWV8Qf
 4bUi6+SxL5/GuodCsWYzj1G1EiOqZtMIYD1h5KnqhlGiI10iAjUNcrUeXHSUKewCl8hx
 aYsmvvVGo3MYAnWv4kEm7A5hC6b+SrKbdJDOrDZXaZcnDlQRXipydUm0nFs6NQR2pCvi
 qU6Q==
X-Gm-Message-State: AOAM531YZY+LLTgLlR4WYxMEMxraHV1GN1oa/HIelzdLg6zZNFItkF0P
 LqPQ6TCOCFO4dzuDUMVpwLM3Pd+u6dudtQ==
X-Google-Smtp-Source: ABdhPJz1UTTIA0xBXm0xDek+ozp9l2COtEg6hY65GnBGdHEijkLASf7Z9daKMsPvfSp9vInmptn37A==
X-Received: by 2002:a63:b50d:: with SMTP id y13mr9418770pge.286.1636511146444; 
 Tue, 09 Nov 2021 18:25:46 -0800 (PST)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id ns21sm3647887pjb.37.2021.11.09.18.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 18:25:46 -0800 (PST)
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
Date: Wed, 10 Nov 2021 10:25:18 +0800
Message-Id: <20211110022518.1676834-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_182548_423643_D6AC89A3 
X-CRM114-Status: UNSURE (   9.89  )
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

The Meson platform still has some hardware drivers problems for some
configurations which can freeze devices on shutdown/reboot.

Remove watchdog_stop_on_reboot() to catch this situation and ensure that
the reboot happens anyway. Users who still want to stop the watchdog on
reboot can still do so using the watchdog.stop_on_reboot=1 module
parameter.

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

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
