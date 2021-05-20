Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E282C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 07:32:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 217FF60FE5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 07:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 217FF60FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DiEfqQZyoEFA1BOUGb+It5nVJ4vr4J0YO2mVnNdThMQ=; b=VF4v62S/H4AE2I9tYwWB5kDoGH
	j45NZThaGHjb5qHuNj0SqTt1sGmVrWjrcVZ9WKa6/CNWPSLPgs2Ue26pSNa3dxRU2Ew/z2uop+JsJ
	lvWc73Bmkedpwg8CGKp0ouDHIRfutoF47JiCTwZQ56SCqXHX+TCPiYnm4gIFgY2Y16j9rWNebzy0X
	zSW83VdnxX4x8wiQUW5fTvOt4jDXjHSgwCL3fgKBBEHaNVnURJts34z0qarKSltUG/VQecie+HZqP
	nPF5OhFLMTZvST5jH2LnvcdD/styD2AGi162HbmjKB3H8fBfjIspIwt6aLr70ovmbEVYk5u911Ssz
	4WZLL9Zw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljd9v-00699N-4L; Thu, 20 May 2021 07:31:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljd9s-006999-PW
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 07:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=AX9UJdkScEdnsuqA+e3cbBPgNM6jgDtJcxN/2LdsVjY=; b=FSuPnm/h0QYlBGfSA0V3l5kShI
 5+BR9kK/sO9SPLlG8rdmwjWjyEoaJfPFfLCHzJFRuE4rx79IfRbL4PBVCGehhPQ147PH+aZfIjBST
 ZjHUUobBqJw3IMDtDKVrdKlSB14+wkUsMXzs8qYFr1+cZLkUrFNqVtLKuKcvKDRoXmlOyaBoDn3Tw
 sp5bvy94xJQ/pNT3Ngo0Os4vlzs+ibufJIL47vXs/qqRAllO8h579uVrnLtZpOCu/PAbGJT3SOnHB
 WG9U7bOzNJ7ZCEC5Pc72d8/QudiBgwYlAGAsKpZSYfR37AqUnhsgtH+Fd7dBi1sS5Fc69ZOS1T0on
 J4d3+qww==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljd9p-00G22G-Cj
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 07:31:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id n2so16588877wrm.0
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 00:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX9UJdkScEdnsuqA+e3cbBPgNM6jgDtJcxN/2LdsVjY=;
 b=NXNdoEChth+QHQQusotYXDdQSrZeyuu2Ac7f0XklNEL6PRynGLj4yBCnsE17osQ2ED
 PLX5QY+M58Qo2KOla6PeAKJwiBv9Mq0Qenzh2kHuMT8bLAqVEBkHZpYdTdXE7hV7i9I8
 kzErqDcXYhYeAQVbJRwns7AcoKx0aKje5kXC+G74BoUIOnI92+44wPxDdbCM/2Tariv/
 mqizsHpbet77RQbuMBM20ma8X4IMfryFFTRayzhkABYjeKn1Q5iHGQc/gWHQChYKTAM7
 4Ct6/ZTsgp2+TYf7Y2kD1Cv6f8ficIhOb4PDbkAMU2cZQ8334dYuXzhz5MffUPJ1Wa0p
 Wzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AX9UJdkScEdnsuqA+e3cbBPgNM6jgDtJcxN/2LdsVjY=;
 b=Wo08IZl8sT8OOkXRccIGootc8aLPus7zqR44ncCJjSCDrQ8RFdryXpFuxTDx5jgJ6G
 e9OJ6/hS/8r3fKevtrax1cf4FPSszaKfkYTcbVr/I0mCHIJoAlbT7gMnxUU0/XSDHLng
 5H3vYow/nFuvnIjDqzoC0eAStVY7+RwjtRJ2UOP1AvUvMs4Jo1kyWZ+9Dmzozy2u2G5I
 qgu0epYYxkXLgUgmu9pXQmx66Gvh/avozjP7LGgc0+RjxTetQC0E4W8m8tKPP7yVvUju
 oKOKU5MApX79NwfQGFUlWb15jFVkZKzUhRlfwXmhQZjAbdM/CMizL/aLuqDZSFFQELHi
 7Gqg==
X-Gm-Message-State: AOAM530GJEFAe+G27BqVdVozyi3QH/QZ7y33Jv3ti6N+1GNf9DZBSRbL
 Jg0KytJhTrJyq4Qe4meDTMDzig==
X-Google-Smtp-Source: ABdhPJyQX1KBfytXyZKHPcLunFU+XbTr8fHcoxEqDTKSWfzltphYDK+CFHr3Jaqjsouy9IyHXiMbIw==
X-Received: by 2002:a05:6000:186a:: with SMTP id
 d10mr2810801wri.41.1621495907520; 
 Thu, 20 May 2021 00:31:47 -0700 (PDT)
Received: from jackdaw.baylibre.com (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id u19sm1637050wmq.7.2021.05.20.00.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 00:31:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: axg-audio: improve deferral handling
Date: Thu, 20 May 2021 09:31:36 +0200
Message-Id: <20210520073136.272925-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_003149_456172_B7AF6799 
X-CRM114-Status: GOOD (  10.49  )
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

Use dev_err_probe() for clock and reset resources to indicate the deferral
reason through sysfs when waiting for the resource to come up.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 This is a follow up on
 https://lore.kernel.org/r/20210429090516.61085-1-jbrunet@baylibre.com

 drivers/clk/meson/axg-audio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 7c8d02164443..bfe36bd41339 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1665,8 +1665,7 @@ static int devm_clk_get_enable(struct device *dev, char *id)
 	clk = devm_clk_get(dev, id);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get %s", id);
+		dev_err_probe(dev, ret, "failed to get %s", id);
 		return ret;
 	}
 
@@ -1811,7 +1810,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret) {
-		dev_err(dev, "failed to reset device\n");
+		dev_err_probe(dev, ret, "failed to reset device\n");
 		return ret;
 	}
 
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
