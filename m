Return-Path: <SRS0=RDff=ST=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2A2C282DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CF12183E
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Apr 2019 20:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="trO70yAD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0CMRmUqU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CF12183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gVVRo2nRYK4mY+B37mM/NgDPREAVBSmh9ibi/v4igg=; b=trO70yADtAg+hX
	9bx/LtEbveGt/BXJM0/uUL8wNUqYFnNeFXsCqYgQN2N6+F+4dhkE4c12CpLuaKHMz4EYNfIaLdCMn
	5LlQiXPnz5Ut/ugxmPeGWBYjeu3y9LI9p1pWRhgCNtoDhwAFJThLP3R6lhhS2P1xdbS38blyPRgJO
	E9+KC0R2PBCdif4X9XxyNwyz0VPNEMjQa+CYRLHp5iRKj3S/frZzJJ3C4aAFA+XUoTL1ACveqY634
	XnZ7FVy+n098MQ0s1+IABAP+jhk0WUyHG970oa+yYUQu6KiaBElh+SIptkZ5fMafr6Hyf+3BSRXv+
	sBV8Wc8gWmCCnctgfQDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGrPj-0002HE-AD; Wed, 17 Apr 2019 20:44:15 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGrPd-0002FC-JK
 for linux-amlogic@lists.infradead.org; Wed, 17 Apr 2019 20:44:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id w18so58512wrv.11
 for <linux-amlogic@lists.infradead.org>; Wed, 17 Apr 2019 13:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85XK5dFLbNA8+J3uTS62n225ZxyTN5YNEbzJYjOQJYI=;
 b=0CMRmUqUZL8eSuaFv8AWE1G/Dp+AJmyE7FjzasQPPO9lvMFXPShi0mRIG1wXHdypkM
 2PHmFlVq9WLs4XzMlfrDM85jmBZN/ZcbQHpa0mVMeB288npUX7nVLUgOep3v84uu66r7
 l8gVwuFIrhHSszYeWTKEYpmJL7UiFALMeLRCJSsoNt3JCG7amlTJ2V5qlyfaOkh4KtZP
 hA2F48yKHTxOCLrQ1g6TJpMXV9QyYPSnHc82vsby+KO+MY8gNv3PjWAgwKNtRF9s+l3A
 udy9ymOe1se5x2gt5aG5gTK4D4oFUIlZ12a8im8LC/o7Jw2J/mKa2AVsgmnJlFyWicx6
 VP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=85XK5dFLbNA8+J3uTS62n225ZxyTN5YNEbzJYjOQJYI=;
 b=ZW6CiwzpAAIvMeLdtsEKcPyCuIkLDrjqmgqoVN0VUlFa6lTauVdjSHHMAqsxna0izY
 3PMcCSXKwceYPJFSN1Xt0aJ6RAOtNyqXag4keOafCVXuE8ZLftPOoIYAQT80v7T5os1+
 sRdEVV/rY2ZeEaQp9NW5hU+in/N/ED/kWXWyTD6OxDsJaHyRIRfqY9C4a7YfJ2ZZMBSt
 WfQNkbK1mlz6Mjj3lx9lFMYoXH5xUhFy0meJEVAjhU1og/rdrKxmO+VlFRNFvNV9XVLE
 Nqm3lxNfz98lL6CI7ygsUljvM7IbW3J4aYccGEYPuF2mBgxv5TqUa/FnHj7T9syguXNt
 /0lQ==
X-Gm-Message-State: APjAAAX9dZgY4j+sxPt762FknDIuX2ufT0u+DoMcGD50MtJEgae+wFbe
 YX2Z73fgHH6l7UISyQqEoYjEIQ==
X-Google-Smtp-Source: APXvYqxcJ09qdX7h+qjEtcqrrRChogD9+j4GpR2dyrrqyeNgu1adXMaIhDaHeetTkTmJHa9deYTH8w==
X-Received: by 2002:adf:f102:: with SMTP id r2mr42879784wro.136.1555533847319; 
 Wed, 17 Apr 2019 13:44:07 -0700 (PDT)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id c20sm98716866wre.28.2019.04.17.13.44.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 17 Apr 2019 13:44:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/7] mmc: meson-gx: remove open coded read with timeout
Date: Wed, 17 Apr 2019 22:43:49 +0200
Message-Id: <20190417204355.469-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190417204355.469-1-jbrunet@baylibre.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_134409_681718_4DD8E377 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is already a function available to poll a register until a
condition is met. Let's use it instead of open coding it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 2eba507790e4..2deeacc051b1 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -23,6 +23,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/device.h>
+#include <linux/iopoll.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/ioport.h>
@@ -1100,7 +1101,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 
 static int meson_mmc_wait_desc_stop(struct meson_host *host)
 {
-	int loop;
 	u32 status;
 
 	/*
@@ -1110,20 +1110,10 @@ static int meson_mmc_wait_desc_stop(struct meson_host *host)
 	 * If we don't confirm the descriptor is stopped, it might raise new
 	 * IRQs after we have called mmc_request_done() which is bad.
 	 */
-	for (loop = 50; loop; loop--) {
-		status = readl(host->regs + SD_EMMC_STATUS);
-		if (status & (STATUS_BUSY | STATUS_DESC_BUSY))
-			udelay(100);
-		else
-			break;
-	}
 
-	if (status & (STATUS_BUSY | STATUS_DESC_BUSY)) {
-		dev_err(host->dev, "Timed out waiting for host to stop\n");
-		return -ETIMEDOUT;
-	}
-
-	return 0;
+	return readl_poll_timeout(host->regs + SD_EMMC_STATUS, status,
+				  !(status & (STATUS_BUSY | STATUS_DESC_BUSY)),
+				  100, 5000);
 }
 
 static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
