Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24F8C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:03:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C755620673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="beO/XuKC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BViqmsQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C755620673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiQochgAF0cqjsvHKUh+hgzvhQ6Qh6wiUm7eoTcowx4=; b=beO/XuKCCwQ2It
	Rh8DQdjBI/T/ZS+7FN0KmXhC1p2YH3EXBe4fXIFuD7P2CChAAh+/sr7zEjwgJRihhxJJtMpv09OcS
	rM8Emw7jiuZBEXjuW3asmULNIWMx2keEpeE6/ynzgmPzxMBRgQs8dLkvdXTFxr792mkLzr7otzalM
	6OkB7wUcJImoAtKrfY/zVNnHha2HWwKKthazNEpBe2zbujc6NDdSJuOZcPXZ0dCNNN6T5EYFBhe1y
	wJjYGCziuitmIv/Cgky0EwXPI/PEA9VPv/FVtDYawVKTcMtMzu8m7HaCioSpjDKF6jcsQFasAFG+E
	zeVoEcmyr0xzKYRZ7Rjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdyb7-0005Eh-Jt; Thu, 20 Jun 2019 15:03:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyY7-0003EJ-Ns
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:29 +0000
Received: by mail-wm1-x343.google.com with SMTP id z23so3509477wma.4
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
 b=BViqmsQ5foznBhU97cwBP9VbZrKPmLd0cybtB6EXw4tXt0WePDI0JEDxWIpG6iSQoi
 jXseiSDXzCZWAH+hUXGclwQSkU023IAkyoO97sLtfKaqWDVbwm78SitxkIeQKCPp1MTq
 Ipmp5yuUb24kxuvvJmJE6bdQCpPMwVR0R/yhHa+9DehOo8HgmZUNNP5VCS+9Wb4mVMiT
 r6C/0RSeH3nc/Ru8H7RLDkhx2opcrmeoWebTXbTKOz52XCEKlt7nv+Vs9z8xYJYpYDBx
 Tm8ix/M+0NDe8ba6+KDU/X67qmImXaCr3+SnJAhFIlcOZC361jVgiugWBSPWcwG6wJ1Z
 yvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
 b=iR256xPcApzQlox6Y4STlCBt0/16k/axu6q+hEdN0xmMJ/zG+CscUvevkA26nmP0uX
 NtGV8FI2E4VRH1JgqXW9w3/StU1USKuJWCw9TM9i3AJ/orgTXW5SxjnNGH0NiWMAr/0L
 fZfYnokhFTd9UcEpBwFQ7Os3F8PDBIqfXzg4+cU9KNMlSYOPCkgfp9z19PuHSyQi67Bt
 gQkNKPJusOWE1kH6n86Lr+eIWPjZvUPT5zvtA7d9qnLkiJV+6lgWqFAFPc0wPn6MkI1w
 hQaTInwukUhPcfgeKefgREpQIMVOlImt3zBcqo7Ix25mkzO5+SJPby9F9QkuWJvFWWIi
 dDmA==
X-Gm-Message-State: APjAAAWbEOIzm5xRip+sN/vp7Dwy5CRXU2EVnEcvnTImITrP/SFzuJU5
 slLQ2ZiEwXGtxP5K4fKO2TCDjA==
X-Google-Smtp-Source: APXvYqwW09JatGavk0kfkKK3QI+iY3OiKQCr/aYkFwqWsgEoBB3fJbciAsuTmwz4Yh3rFxMBDCYTQA==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr60560wme.150.1561042826032; 
 Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:25 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 05/14] soc: amlogic: meson-clk-measure: protect measure with
 a mutex
Date: Thu, 20 Jun 2019 17:00:04 +0200
Message-Id: <20190620150013.13462-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080027_789725_C808E48E 
X-CRM114-Status: GOOD (  11.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to protect clock measuring when multiple process asks for
a mesure, protect the main measure function with mutexes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 19d4cbc93a17..c470e24f1dfa 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -11,6 +11,8 @@
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
 
+static DEFINE_MUTEX(measure_lock);
+
 #define MSR_CLK_DUTY		0x0
 #define MSR_CLK_REG0		0x4
 #define MSR_CLK_REG1		0x8
@@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	unsigned int val;
 	int ret;
 
+	ret = mutex_lock_interruptible(&measure_lock);
+	if (ret)
+		return ret;
+
 	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
 
 	/* Set measurement duration */
@@ -377,8 +383,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 
 	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
 				       val, !(val & MSR_BUSY), 10, 10000);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&measure_lock);
 		return ret;
+	}
 
 	/* Disable */
 	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
@@ -386,6 +394,8 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	/* Get the value in multiple of gate time counts */
 	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
 
+	mutex_unlock(&measure_lock);
+
 	if (val >= MSR_VAL_MASK)
 		return -EINVAL;
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
