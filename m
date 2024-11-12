Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891C2D42B8E
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 14:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zh1uS5zlO8kipL9nNYlVRPdXa0RsKOSvXQhWLRZgQGU=; b=cdQ3Zk+ZY90fBK
	ldqmJjj2xnfw8iDtrWJ6zlh8KbHuPco+PQyfmnaWgDKIsfj15q0QD75ZeMXR5eRdE5shEALq/5pXn
	k5Bo8XbOswfcN2yjLnKV92rprVDjqXe9+3kP1BFE3rLWzjK4+08CN7e/EdjXFFlrzjHf9H1HpiYI4
	zzHmXZEZTJ5JqWRgdmfjDVe5s7j74nlYZy5y/8RcAJgaWcA1PyeV60oZ7IhhdHKihtzQ36nSkX/pB
	WgZ75a9+XrGsc2x+5eCFmBArybPKIofFcvtzIs1DKxFa7tjxT574LALLn4O7UIuLgRo7FHMoVkg41
	0i3UitHvzijtSL5SFUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs8v-00000003o1a-2owa;
	Tue, 12 Nov 2024 14:45:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs0p-00000003mFN-2DKj
	for linux-amlogic@lists.infradead.org;
	Tue, 12 Nov 2024 14:37:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05EB3E0002;
	Tue, 12 Nov 2024 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731422216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aJFnJDAFTBKSIxX6b5Pe3koShCEbFS2HnrAwtx42ffc=;
	b=jc0Cclrg0P6NeE/g2h2R05ymYh2BbiAaXrZJDL2mXdBja7XqKDo8+6DxTvWVdjxJIw0nFp
	85kXoFYkwGQrBZDD40Tve+G8MAspmKsi1262SId7spG/eIolHidEZJ6jR3EmH0SaUcrGij
	lmTqH4Dof7ulzgfFbKu2zv9x6c/suTshCZuogfmLqOrOZx43xyWuiSfZjaq2ZYEo4pqnaP
	P/rEwg5bogCnZJMnuGqszRji7p0AueKkebL3OVK2lUhN27KaWsVBIwWP8HtwmZrGp1gO13
	StOsZKz9/8D3Ev9AnCjG138MCCf/FqroUkW1aG+Ql/2EMd+THm8yGz+Chno1tA==
From: alexandre.belloni@bootlin.com
To: Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: amlogic-a4: drop error messages
Date: Tue, 12 Nov 2024 15:36:52 +0100
Message-ID: <20241112143652.3445648-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063659_725606_5E3D9D8F 
X-CRM114-Status: UNSURE (   8.39  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Drop error message because there is a high probability they will never be
seen and the final user action is clear, the time has to be set again.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-amlogic-a4.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 9423dce4193d..4960790c4b24 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -102,10 +102,8 @@ static int aml_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	u32 time_sec;
 
 	/* if RTC disabled, read time failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read time failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_REAL_TIME, &time_sec);
 	if (rtc->config->gray_stored)
@@ -145,10 +143,8 @@ static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	time64_t alarm_sec;
 
 	/* if RTC disabled, set alarm failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, set alarm failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_update_bits(rtc->map, RTC_CTRL,
 			   RTC_ALRM0_EN, RTC_ALRM0_EN);
@@ -174,10 +170,8 @@ static int aml_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	int alarm_mask;
 
 	/* if RTC disabled, read alarm failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read alarm failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_ALARM0_REG, &alarm_sec);
 	if (rtc->config->gray_stored)
@@ -201,10 +195,8 @@ static int aml_rtc_read_offset(struct device *dev, long *offset)
 	int sign, match_counter, enable;
 
 	/* if RTC disabled, read offset failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, read offset failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	regmap_read(rtc->map, RTC_SEC_ADJUST_REG, &reg_val);
 	enable = FIELD_GET(RTC_ADJ_VALID, reg_val);
@@ -231,10 +223,8 @@ static int aml_rtc_set_offset(struct device *dev, long offset)
 	u32 reg_val;
 
 	/* if RTC disabled, set offset failed */
-	if (!rtc->rtc_enabled) {
-		dev_err(dev, "RTC disabled, set offset failed\n");
+	if (!rtc->rtc_enabled)
 		return -EINVAL;
-	}
 
 	if (offset) {
 		enable = 1;
-- 
2.47.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
