Return-Path: <SRS0=7ebA=ES=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6843BC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 23:01:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5BB20797
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 23:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQ6WTlbp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l2Fb6GIr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F5BB20797
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TE1mhj7jBxINEqDbV1x9SnrzONR3bQCrC0mh+65gYwQ=; b=nQ6WTlbp9brh93TIaKTfwLRGYw
	vy1Wteezlj1n/QZ5QK8mNZpjAsIPK2KOR7YIrw4RfISCrjVEFMvEDdrOEdDyhNs1aBnaDLLgHS24Y
	jFjkf/8O/ufqYIGEX11sU1tpdhzjVvBesUMcWS46/tYaB1TCZH42e+Td+5Uk22s4mBygeUiAvw6IE
	45OsEm1jMRCiIJ+eawuEoM0zDKnjATKJ8RZihKhiGLoqtuQFJxpW71HQkCmci5tbYl+JGS5ntzrS8
	lFrjdXCSldAaUIpat/nxIyNoj7UoogJ3XIsFzqOw474mKa/Fyr6yaMbS70yTuJZmRjPZT26Yjyzk6
	8Gv4kdXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdLb8-0005Ql-Im; Thu, 12 Nov 2020 23:01:46 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdLb2-0005Pu-RC
 for linux-amlogic@lists.infradead.org; Thu, 12 Nov 2020 23:01:44 +0000
Received: by mail-wm1-x343.google.com with SMTP id h2so6648952wmm.0
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 15:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Ay3g0WHJ5Z9sUFSsAiMtS3+CU9KxkEqczCaxCW1Xrgs=;
 b=l2Fb6GIrmV3NoRJY2y5tThITGKwdA6NgrUFo7qxhmNyIc+62ajsl9yBM9kBzY4kfI/
 6zrya4RPSp3Q1hopNqi5WabvuhTfkABp1kemsZhUgjmWeMy7KXQqJ5l4yM9ZqoBBn0tB
 y3gbvZ82PsUKTZfbw2zvaAl4WQfdlxYGD8fKkMmMlIxKv2U524dwT3OKIoY4lgkkNx0F
 ZweSwv4u5pdNR3c+tDswKLi/su1xzWR1gbZuzN3WQBCFHbpb6pGSdHJIRP1SImH9CcvK
 AynSSOMnnlOeB5G39R7YrCGg9++bWzW5O5E32YbNXKAt3cVZ6FlF3fQ2iITPdX3GTAH8
 a7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ay3g0WHJ5Z9sUFSsAiMtS3+CU9KxkEqczCaxCW1Xrgs=;
 b=K6lA3ys6M4yYRUu/pvlLd1Q4rkxsQIh8QJE/vqvTYk3Iw6MqZPpKE5hTHZTH4zB6VD
 BvKvHz4Q3TPKzlGEeADNdj0NUrf94UyetSQkvhTI9JxP8bVIgtuAzjopaz1LmuPfPhV8
 ktB20diWDF2dwcBxsqa1Mzahk4zKjxYkJYwFp6OU6TQcBZNpo3tYGz3HdgAWI43x2SO+
 FEAss+FmJlf7qX8kuEXgDyhxSY5d3UMeQY/QdJTlV5zgRhn0ofulOgAtje4VJlEmSWsz
 q/uYasVia02A/Y6nV0OG09bBnqsW16OlQJ7GVvRIVgnJME5aAQe7awoNwjbjn0+YluyY
 gFZg==
X-Gm-Message-State: AOAM533R5TX1jrG6LLkyxnQ8M1+/E+X6nICTBJiWq4K1SlqqyYrrXe2l
 KKp7DJXQ/EaZAx55cf6q+rnyyg==
X-Google-Smtp-Source: ABdhPJxb0BlqXQvBwyt/FteBmLbQxyaS2N/LIBSC7x1esLzEKogJMph0rp55RJTnahob7LDMp4vhUA==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr124748wmf.66.1605222075499; 
 Thu, 12 Nov 2020 15:01:15 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.googlemail.com with ESMTPSA id h4sm8185984wrq.3.2020.11.12.15.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 15:01:14 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
Date: Fri, 13 Nov 2020 00:00:43 +0100
Message-Id: <20201112230043.28987-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_180141_021489_5BE7F1DF 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The current reset framework API does not allow to release what is done by
reset_control_reset(), IOW decrement triggered_count. Add the new
reset_control_rearm() call to do so.

When reset_control_reset() has been called once, the counter
triggered_count, in the reset framework, is incremented i.e the resource
under the reset is in-use and the reset should not be done again.
reset_control_rearm() would be the way to state that the resource is
no longer used and, that from the caller's perspective, the reset can be
fired again if necessary.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reported-by: Jerome Brunet <jbrunet@baylibre.com>
---
Change since v1: [0]
* Renamed the new call from reset_control_(array_)resettable to 
reset_control_(array_)rearm
* Open-coded reset_control_array_rearm to check for errors before
decrementing triggered_count because we cannot roll back in case an
error occurs while decrementing one of the rstc.
* Reworded the new call's description.

[0] https://lore.kernel.org/lkml/20201001132758.12280-1-aouledameur@baylibre.com

 drivers/reset/core.c  | 73 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/reset.h |  1 +
 2 files changed, 74 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index a2df88e90011..34e89aa0fb5e 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -208,6 +208,39 @@ static int reset_control_array_reset(struct reset_control_array *resets)
 	return 0;
 }
 
+static int reset_control_array_rearm(struct reset_control_array *resets)
+{
+	struct reset_control *rstc;
+	int i;
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		rstc = resets->rstc[i];
+
+		if (!rstc)
+			continue;
+
+		if (WARN_ON(IS_ERR(rstc)))
+			return -EINVAL;
+
+		if (rstc->shared) {
+			if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+				return -EINVAL;
+		} else {
+			if (!rstc->acquired)
+				return -EPERM;
+		}
+	}
+
+	for (i = 0; i < resets->num_rstcs; i++) {
+		rstc = resets->rstc[i];
+
+		if (rstc && rstc->shared)
+			WARN_ON(atomic_dec_return(&rstc->triggered_count) < 0);
+	}
+
+	return 0;
+}
+
 static int reset_control_array_assert(struct reset_control_array *resets)
 {
 	int ret, i;
@@ -325,6 +358,46 @@ int reset_control_reset(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
+/**
+ * reset_control_rearm - allow shared reset line to be re-triggered"
+ * @rstc: reset controller
+ *
+ * On a shared reset line the actual reset pulse is only triggered once for the
+ * lifetime of the reset_control instance, except if this call is used.
+ *
+ * Calls to this function must be balanced with calls to reset_control_reset,
+ * a warning is thrown in case triggered_count ever dips below 0.
+ *
+ * Consumers must not use reset_control_(de)assert on shared reset lines when
+ * reset_control_reset or reset_control_rearm have been used.
+ *
+ * If rstc is NULL the function will just return 0.
+ */
+int reset_control_rearm(struct reset_control *rstc)
+{
+	if (!rstc)
+		return 0;
+
+	if (WARN_ON(IS_ERR(rstc)))
+		return -EINVAL;
+
+	if (reset_control_is_array(rstc))
+		return reset_control_array_rearm(rstc_to_array(rstc));
+
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+			return -EINVAL;
+
+		WARN_ON(atomic_dec_return(&rstc->triggered_count) < 0);
+	} else {
+		if (!rstc->acquired)
+			return -EPERM;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(reset_control_rearm);
+
 /**
  * reset_control_assert - asserts the reset line
  * @rstc: reset controller
diff --git a/include/linux/reset.h b/include/linux/reset.h
index 05aa9f440f48..439fec7112a9 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -13,6 +13,7 @@ struct reset_control;
 #ifdef CONFIG_RESET_CONTROLLER
 
 int reset_control_reset(struct reset_control *rstc);
+int reset_control_rearm(struct reset_control *rstc);
 int reset_control_assert(struct reset_control *rstc);
 int reset_control_deassert(struct reset_control *rstc);
 int reset_control_status(struct reset_control *rstc);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
