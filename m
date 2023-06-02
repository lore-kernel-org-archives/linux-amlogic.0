Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4EC7EE29
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OxmZEELeXBx+gUU7kFf9N/yEMyQOI35ja0W+dTw7w/A=; b=qoo3da0T6l/wTW
	ZfHQsptAHxbOc7y4UmUNpFt979xbXuZdaof51QI4zxQNWNuDRba+Yx9Vj+M+uXJ0MxpxAd3AaYdiJ
	COkEhVONc4BSNgfZrACF98E0Udxfz7x9pfFsOuyamqq8wo4uBSnOQqSontauhTwyTtBO6MxDL5yuf
	QbMVue0UNgZC3pyOSq/HIMbyccjSncpgh+Yv1+286LeVY3iBbdO1BRBLFABArkAKUCT0Tmcj+Jlmv
	X6WXCzJ32EjLjtAKFKFbMlPoOcyJXh69cyhHeNe1Z5v5X5WI3RDjJGIk6pjTKimwgPAbV6u9bl9jP
	6BdYjtf15FmTEdlluAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q525J-006XIs-2g;
	Fri, 02 Jun 2023 10:32:41 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q525G-006XHp-0y;
	Fri, 02 Jun 2023 10:32:40 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2390C5FD03;
	Fri,  2 Jun 2023 13:32:30 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685701950;
	bh=U2UnoUMYRs9m/BLycNQ2iLq6bQeVm56LTFKDcGw5E4A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dDpfb4nspYq2IX79ggRqGaSgsWFxQt9B9+ivAjCuKkPYK+q/bDLe82NvRXQUIoP+J
	 1UgfCSEnRVAf5ne/aOauc+fEm69F8FQcHNj3jabszSu48HnRuxfrN2df70IxJudXUL
	 EbvNvDia+9mnO4Yc2jgEksvdVUhgVqGchpdhHZ3m6PqX55BggvX0jUK6f9Y8poxFpZ
	 cWQX7YPm52iN0PKBRwsknc5qKJgZX6pM4h4ofywpJyYrEW003YvZ8+H+HYySWIge0D
	 wMaJq5LKgKm+TuCkbyW0xzWe44pGE7/VvS1mPdJvdQtxM6Wr43p6CZh8SGtVssXyPz
	 w2WiIR79N/Yvg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Fri,  2 Jun 2023 13:32:29 +0300 (MSK)
From: George Stark <gnstark@sberdevices.ru>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<neil.armstrong@linaro.org>, <khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <hkallweit1@gmail.com>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>, George Stark <GNStark@sberdevices.ru>, Dmitry
 Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH] pwm: meson: compute cnt register value in proper way
Date: Fri, 2 Jun 2023 13:32:11 +0300
Message-ID: <20230602103211.2199283-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/02 03:06:00 #21401484
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_033238_863198_729059D9 
X-CRM114-Status: UNSURE (   8.04  )
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

According to the datasheet, the PWM high and low clock count values
should be set to at least one. Therefore, setting the clock count
register to 0 actually means 1 clock count.

Signed-off-by: George Stark <GNStark@sberdevices.ru>
Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
This patch is based on currently unmerged patch by Heiner Kallweit
https://lore.kernel.org/linux-amlogic/23fe625e-dc23-4db8-3dce-83167cd3b206@gmail.com
---
diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 834acd7..57e7d9c 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -206,6 +206,11 @@
 		channel->pre_div = pre_div;
 		channel->hi = duty_cnt;
 		channel->lo = cnt - duty_cnt;
+
+		if (channel->hi)
+			channel->hi--;
+		if (channel->lo)
+			channel->lo--;
 	}
 
 	return 0;
@@ -340,7 +345,8 @@
 	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
 	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
 
-	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
+	state->period = meson_pwm_cnt_to_ns(chip, pwm,
+					    channel->lo + 1 + channel->hi + 1);
 	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
 
 	return 0;

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
