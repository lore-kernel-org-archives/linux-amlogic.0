Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC83C43612
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 21:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9C621871
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Dec 2018 21:30:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S8T/aMvJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="JT/ZsqfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9C621871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ma5bAIidHSb/HRld8b+TCJyP9yx4yIxbav1QYkmIyZg=; b=S8T/aMvJuxFwuthMCnmyW/GpIn
	6Tqgd8d07A5y7Lwj/zAZDcw2J+TvD80NZJcxE/qb0jt9G8q0yxjQ9oIR3N2t3ncwHvSPA+f+l61Bi
	T6NkPkK7PsFA46YYGD1KsF4LMnGObEhvCIXavvFtU80iUv4rC06cRMnB7c6i2NRPjnNHAx0YzJ2vW
	0d+kzsVf663VJoodNPwIG0mMdb0s8M9DOmBIInCOrvZ0V3p/tL06Cy3B49g9ZhW5f5WxW6hoZxKu1
	pOc4BdSYNDRZuHbahiWs+CbTbsyz24dxWFe2jpTInhLklnl7HHD71xb4fe3WSoOfjT8Lk/y3G5Sw1
	CQSdum4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZMws-0003Gz-9j; Tue, 18 Dec 2018 21:30:42 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZMvj-0000sS-Ly
 for linux-amlogic@lists.infradead.org; Tue, 18 Dec 2018 21:29:48 +0000
Received: by mail-wm1-x343.google.com with SMTP id m1so4098453wml.2
 for <linux-amlogic@lists.infradead.org>; Tue, 18 Dec 2018 13:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+kk49u2E8Mo1JNxE8BrR9oOARp9WmK1DmRN/2CO3j/8=;
 b=JT/ZsqfQLVVSX+jbMOMwvdmTraAUh2j/2iIoSl0jGXgA15MSLhzzoSfM9jCn+rNy9i
 k0FnfddkVZjRaa3CS8Q2P9eoYYMhlpkT6CslTRnZ7GLniqwBtx4ehL/B93ISFzEMf//6
 fG7g3U/ReKJQHa6S/EMTgVhtGkPbKfd0r9bC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+kk49u2E8Mo1JNxE8BrR9oOARp9WmK1DmRN/2CO3j/8=;
 b=jaZtzQCnnWqHdmWfnSTV1nLp/TxPh7MLbaHdVOWXrlYarUnNxhY/ScTCpSZEZbYr94
 uYXNubchZO5VVP+BLUZ+FHttT2Nsh1LpGE02sdeMQnMPi2ZsRTMNb9hCcJxmWY1xCaIO
 tyefcw/71Hr1hBuvwmCE2ioy7vNtoOeKMiGty5UgVHZuKLN9+pDJYjcK/n9yDUJJ0AE5
 oVWm1XhRwP+soq8HOYhCG/3pPs8Kv2aAge3uCex1pWkP02srqbk250neZ0syvNJ1RrKg
 GU55H7xSvHTfmEkJ+nnqjc8w/a0VIpqoimmNenBmC77hl0tZSHVfzWx+XFGbwUQdLZuF
 RJpg==
X-Gm-Message-State: AA+aEWa2YJtUHOyhtgpTGMpqhAhPqFee9F2wsZVab57g5BLvzQitYfM5
 sZnv80dDV6zHSrypxO8JDI2kgg==
X-Google-Smtp-Source: AFSGD/XiEeq+vDeKGNZkt57dLzm/xXk4gUU9JTvpHHo4mRvG7y+KrZgN/UlfX6m1Ak8NNfX0sYi5hg==
X-Received: by 2002:a1c:ae88:: with SMTP id x130mr4442834wme.91.1545168559808; 
 Tue, 18 Dec 2018 13:29:19 -0800 (PST)
Received: from localhost.localdomain (105.50.92.92.rev.sfr.net. [92.92.50.105])
 by smtp.gmail.com with ESMTPSA id o4sm4153485wrq.66.2018.12.18.13.29.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Dec 2018 13:29:19 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 07/25] clocksource/drivers/meson6_timer: Implement the ARM
 delay timer
Date: Tue, 18 Dec 2018 22:28:25 +0100
Message-Id: <20181218212844.30445-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218212844.30445-1-daniel.lezcano@linaro.org>
References: <d3f1255a-592d-13d9-5d3f-bd3ec7a36742@linaro.org>
 <20181218212844.30445-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181218_132932_284515_39DA3EE7 
X-CRM114-Status: GOOD (  11.65  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Implement an ARM delay timer to be used for udelay(). This allows us to
skip the delay loop calibration at boot.

With this patch udelay() is now independent of CPU frequency changes.
This is a good thing on Meson8, Meson8b and Meson8m2 because changing
the CPU frequency requires running the CPU clock off the XTAL while
changing the PLL or it's dividers. After changing the CPU clocks we need
to wait a few usecs for the clock to become stable. So having an
udelay() implementation that doesn't depend on the CPU frequency is
beneficial.

Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/meson6_timer.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clocksource/meson6_timer.c b/drivers/clocksource/meson6_timer.c
index 23c7638e2bb3..84bd9479c3f8 100644
--- a/drivers/clocksource/meson6_timer.c
+++ b/drivers/clocksource/meson6_timer.c
@@ -22,6 +22,10 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 
+#ifdef CONFIG_ARM
+#include <linux/delay.h>
+#endif
+
 #define MESON_ISA_TIMER_MUX					0x00
 #define MESON_ISA_TIMER_MUX_TIMERD_EN				BIT(19)
 #define MESON_ISA_TIMER_MUX_TIMERC_EN				BIT(18)
@@ -54,6 +58,18 @@
 
 static void __iomem *timer_base;
 
+#ifdef CONFIG_ARM
+static unsigned long meson6_read_current_timer(void)
+{
+	return readl_relaxed(timer_base + MESON_ISA_TIMERE);
+}
+
+static struct delay_timer meson6_delay_timer = {
+	.read_current_timer = meson6_read_current_timer,
+	.freq = 1000 * 1000,
+};
+#endif
+
 static u64 notrace meson6_timer_sched_read(void)
 {
 	return (u64)readl(timer_base + MESON_ISA_TIMERE);
@@ -192,6 +208,12 @@ static int __init meson6_timer_init(struct device_node *node)
 
 	clockevents_config_and_register(&meson6_clockevent, USEC_PER_SEC,
 					1, 0xfffe);
+
+#ifdef CONFIG_ARM
+	/* Also use MESON_ISA_TIMERE for delays */
+	register_current_timer_delay(&meson6_delay_timer);
+#endif
+
 	return 0;
 }
 TIMER_OF_DECLARE(meson6, "amlogic,meson6-timer",
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
