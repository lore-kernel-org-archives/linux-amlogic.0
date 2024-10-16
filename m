Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90485D2A529
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2024 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iJDi8xRaul1hUFEAQtpjdQmP0T//ey/0R4ud+g/x0M=; b=T6Gs5LlX9WhD77
	xiC3mALiOYqH0T51PC9vDQhwsTvmEhGe0DUuRHw4+2BqnlZjjpVmA+JRctbeAT2ExrtZsCnJRb70X
	bRoIi+Vzppbr/RKkMtHF/CGFIJdpq0cs7ZyRiHKQM97Xk0+mlCVNI9m98pqv2UCIqSGY2JQUO8Lh/
	7RrzB9RiRiNOCzP7vpfv5PklGd84PPFAgxDSpkF1cNY8Ivw5Sz48jbf53e3lyemhbmIPTHOsvLNai
	X919818e0e90DchUzUGV/3AoYBkVhWsSDH6oBDSVBD14DsRZ3LPtASdBPuWjIj6BoXep8dwch6R08
	aeShgpg2GGMh2GZTaROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ug-0000000CEfn-3jxF;
	Wed, 16 Oct 2024 15:26:14 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t15ub-0000000CEaq-166R;
	Wed, 16 Oct 2024 15:26:12 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 285FF100012;
	Wed, 16 Oct 2024 18:26:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 285FF100012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1729092361;
	bh=NL7Zfmi8yLx1Y81VddpKEj1YM5hXopU8fzyaFR15A60=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RqWx/hQaagFTOTHQOLRK5PFkIPRcfxEMyRQCQFw98MnzDsjllYji6DgaS6jsPTEQN
	 /ylXw8KPHuX5tt30LXXuOfTsjtHtZLv05LBVFJCgEIFAMixfu2M4IHfW16CeFJ0MMb
	 3e/NsDhRfKrrOYFt852f6bgPr+kuvonmtU+wEV544hSczIsZOtdG6cU3eZnyQ8jMub
	 nA7aBT81aKGvV4X1O9Fm3K2WUaf2Uv2gB9D08vMq9d1KA0P5f/6afoPvFLJIALj/fw
	 D9Z0O8UfPF52qb/BuQ9AACA9x1K8DTQ3HL8ogPMqlGZMDcEoHFJDDVRh7CLRRXYOyT
	 oV7n5YM+ym22g==
Received: from smtp.sberdevices.ru (unknown [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 16 Oct 2024 18:26:00 +0300 (MSK)
From: George Stark <gnstark@salutedevices.com>
To: <u.kleine-koenig@pengutronix.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>, George Stark <gnstark@salutedevices.com>
Subject: [PATCH v2 1/4] pwm: meson: Simplify get_state() callback
Date: Wed, 16 Oct 2024 18:25:50 +0300
Message-ID: <20241016152553.2321992-2-gnstark@salutedevices.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241016152553.2321992-1-gnstark@salutedevices.com>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [185.8.126.20]
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188482 [Oct 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 39 0.3.39 e168d0b3ce73b485ab2648dd465313add1404cce, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/10/16 12:08:00 #26762169
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_082610_054704_2408E2F1 
X-CRM114-Status: GOOD (  10.99  )
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

In .get_state() callback meson_pwm_channel struct are used to store
lo and hi reg values but they are never reused after that so
for clearness use local variable instead.

Signed-off-by: George Stark <gnstark@salutedevices.com>
---
 drivers/pwm/pwm-meson.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 98e6c1533312..2ef632caebcc 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -310,6 +310,7 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	struct meson_pwm *meson = to_meson_pwm(chip);
 	struct meson_pwm_channel_data *channel_data;
 	struct meson_pwm_channel *channel;
+	unsigned int hi, lo;
 	u32 value;
 
 	channel = &meson->channels[pwm->hwpwm];
@@ -319,11 +320,11 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	state->enabled = value & channel_data->pwm_en_mask;
 
 	value = readl(meson->base + channel_data->reg_offset);
-	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
-	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
+	lo = FIELD_GET(PWM_LOW_MASK, value);
+	hi = FIELD_GET(PWM_HIGH_MASK, value);
 
-	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
-	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
+	state->period = meson_pwm_cnt_to_ns(chip, pwm, lo + hi);
+	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, hi);
 
 	state->polarity = PWM_POLARITY_NORMAL;
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
