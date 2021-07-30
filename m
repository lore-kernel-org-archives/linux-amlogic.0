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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44F1C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE936101C
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 04:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BE936101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsKgoI+cgoxrSN4S2wctg+Gx27pH8whNG+WKOKXcMzQ=; b=atTMNhmPC0Os+E
	eSuIMzU7QQABYPPtmezTf9O/6l7/V+h9TYalPPNHi4KP85cZR6qczW+3KVzJyajXGv+uEaZCgtPdb
	J+co4nibTa+bx+jhFHBBqD1Tj3Q9y0hjj+xqK5E7s/fpPr1qr5keqXMghaTaFiGFjdAhsH6nB6ejb
	H/pyeqTSOaDQowbnshKTEMM5f7OL7xUWDNYzWJB1b/QHG+CSV3oav/zdOLn3jR/hGxGhafFMh4+FF
	Jp2/ieU5yZN5UgVc0agIt/e+zeg5DIbGfj5YS8bbQczhJ3B6uo/TOMivsIQSIZXDhbA5Fv0VBDlpq
	SgDuckwttj+NSHxoeaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9JvP-0073e1-8L; Fri, 30 Jul 2021 04:15:07 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Juj-0073KU-Qt; Fri, 30 Jul 2021 04:14:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id i10so9552415pla.3;
 Thu, 29 Jul 2021 21:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=THlXvdugKjy738Af7uzCz/sE8sNAleTeISkp07PWT4A=;
 b=H35Ors0FFD34qtaXeNIP4c1cwPkkHP4ht1nwzgRtEWswKY8aa7wM0bzDdrblMnMRiE
 Fcuxs+17mCV4wQSM7/e6+MN730M2l6A5Jb0b0SuEHDsezAOw/q21R86m+3D9jXMRLrco
 Y0HtifeTjE6szdCS6sbtte1nvlYq8DLuhUDzhzxzzOMlZwzF23VOCxGx/FxAfVrcdZe0
 YTuS0LMXEgs/i3yBPygZylVqAYYj4xioM36QXq+RXoBBwQM/vHbhNwjQX28zMUtfyplX
 iRGU3qcPingRUYPqlWeh86+yOmTZgC1hcdKt+xURMvWVXmoE+JvLGPJuo40vDaR7vTPC
 twaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=THlXvdugKjy738Af7uzCz/sE8sNAleTeISkp07PWT4A=;
 b=SsBQB3hnayP8m76CBHdvdemljU62zL33sWerr3VHkFcvrbNtjohH+4yB/zDgNhSPYA
 LodRPZ756oZgRrLYyXondgZg+DYyHXZg1fw6U7WctD5vAzGyObyhjG/+/6K1GM19adZJ
 KNX81Zuj3/CboR/YZy4MLqAwrZ9cjDWO5kUrTelSR95NDz5NUnDdaG6QYxYfw4T5snef
 wI9bZyFyIal5F96sZS1hjtpHizKhfSRsbDvtbb5NTV+W+n/4h3UCD0/pKNVCeiHz7JQd
 PjeMge4iNRWbGLt4RZ7+27GhlbvfyTbtWEOqTHkhLzvsh4aTcw2UaneQRq5uOVjOhsLB
 VEqg==
X-Gm-Message-State: AOAM532wc2tZDHK41o66we1dKMzIkFLjKLgcBYvgtq5rzxT4eIzizuJl
 sg7c+tDlyXz1J0Xs4b16KUU=
X-Google-Smtp-Source: ABdhPJxvMMQTQ8ZucVsWnf6w8qPI5/FCghjRAAqBf7VfGnkGVfCSZ1aInLllbvRQCIWqY/rqbG7lDQ==
X-Received: by 2002:a63:1f5c:: with SMTP id q28mr527713pgm.114.1627618465126; 
 Thu, 29 Jul 2021 21:14:25 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id x4sm440943pfb.27.2021.07.29.21.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 21:14:24 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: wim@linux-watchdog.org, linux@roeck-us.net, khilman@baylibre.com,
 jbrunet@baylibre.com, christianshewitt@gmail.com,
 martin.blumenstingl@googlemail.com, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
Date: Fri, 30 Jul 2021 12:13:55 +0800
Message-Id: <20210730041355.2810397-4-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730041355.2810397-1-art@khadas.com>
References: <20210730041355.2810397-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_211425_931545_5835A33C 
X-CRM114-Status: GOOD (  12.87  )
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

Meson platform still have some hardware drivers problems for some
configurations which can freeze device on shutdown/reboot stage and i
think better to have reboot warranty by default.

I feel that it is important to keep the watchdog running during the
reboot sequence, in the event that an abnormal driver freezes the reboot
process.

This is my personal opinion and I hope the driver authors will agree
with my proposal, or just ignore this commit if not.

https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 drivers/watchdog/meson_gxbb_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
index 945f5e65db57..d3c9e2f6e63b 100644
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
