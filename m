Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2044C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A17D420674
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V/fPA/gj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xbMqCO6z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A17D420674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YM6DMOCAgbzRX1f2Cnd6sPoiz6OsfIuJjGVlRY0hxSM=; b=V/fPA/gjMz6dfi
	+LOVthGgC1YbT41gIanPa+XXUISYRf0iEvVBq5FUyyAkag5vLB441/QLG3Vk9YJMR8dkC1cBpg/8G
	bIdUuiZhTTv979evf+k2FXLD36qxSHfjYpf3KxoM55td4Qwg+qsdOH3qsR8Ksvw7G+k3InntepQZ7
	045YPa02DSkA7M8gAyV95vnwH2h7VNRxcbo85/EQFOjLbodujsfXAMZwpeeVsJV0caekd/DQuTevD
	8e4VEe+jDS+qOxro6MjwJLK9FM15wGhww3Ub8UcOiYzbEG9BsjfjiTN5A5c5UTESqcXtoLHN5jaWb
	JoPrXthdiH3zYXX9QzWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKE-0005e0-OI; Tue, 23 Apr 2019 09:02:50 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKB-0005bo-CA
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id t17so7424018wrr.4
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VS6sWtIBcpW++wv0mYIjcVLqIR7LghrNYUg8/Ta7WWE=;
 b=xbMqCO6zj/632iEPHiWSPhZGMBKBsDiZrQeirlU04yPkWiApOm24k7zLVyG5N1k4ZS
 fRf30jGYSKoSdVluBAAxFRnrxdV1uMkUIBU9ZIlhwO2NPoKtjJOBE3/L2tp34JpdjWTu
 uCQaT5k/IM10+QaOAd/NEVTX+lTW9dI8CMNXUPv6AecORRQres0ZqV6wz7G4tdiU8N8X
 M+FxI87l3FQXlJdI8UvEkd3dSwBOCoPsKBLbbqZmobuUT8Qqn2SHZEjYsV9HXy49HzGq
 1i4rmkfEokMShkmMUvIf4jkscOg9xyIImE3i+kurOVotZf3Qwu5sPLb907IzKSLd5JDt
 RBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VS6sWtIBcpW++wv0mYIjcVLqIR7LghrNYUg8/Ta7WWE=;
 b=ETLW3kCWHd3gwsq26YlXXg0NxTrwC5KsxpQt3Q2/S+X67pty3MAg2HYuy/lyYz6Grr
 eab0PtAp1He6I2xa2Q0yysN0rfLIHhd9vWOAjlrtfrmeSE0KxxKbTEo6UH/EaqNZW7zb
 6kkDPYIANClrmNXqoekxVbdZ0FWh0jx6VRYPufNlRZa8zC9L337NM0Swtw8cRhgZ4Umm
 bcf83GBb5fs5WHnKVPKmVy+uu2H+0bX6Juw8Xdhzkn2Hh5OVDgaA90cpEI5Uw4Uo5f/U
 lPkApiXwa4Oki4nAivmR6eQGVw5Bl1VtlBRvbiPXEDJKDh2xxFz+eIWWOerTx9M2X9AW
 /Q7w==
X-Gm-Message-State: APjAAAXsdjNE6BkCEBjkP9S8yjJhk3jmhGfZ1XPpUwiVC6s9B/mOlEBP
 nS73biCKMC789VU7hafdz8WKcw==
X-Google-Smtp-Source: APXvYqx291aocUxzzWbLRxtrvn///4nfCCUgX6RRRyBi0FRPwZ0/0Vn+i4JlIb15XtkLkI2qr76qUw==
X-Received: by 2002:a5d:6604:: with SMTP id n4mr13301965wru.42.1556010165874; 
 Tue, 23 Apr 2019 02:02:45 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 1/7] mmc: meson-gx: remove open coded read with timeout
Date: Tue, 23 Apr 2019 11:02:29 +0200
Message-Id: <20190423090235.17244-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020247_410542_5F6E6203 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is already a function available to poll a register until a
condition is met. Let's use it instead of open coding it.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
