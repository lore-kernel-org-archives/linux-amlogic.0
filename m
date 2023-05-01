Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14DC77B61
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 May 2023 14:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MjfFfOwqqpMOhvMVkLfM1dIjrAEGDDJOq0A3NCg1YzY=; b=wZ1p4LI6LyC9TB
	5e3G14vedP9MyLfLkjpTPNfdEYrIaTCNexqqNC8OQRQP5MHLVmfSJxGcFUWA+JAAQdScFAlq1UYvj
	pnf7kUACi/90OWPoFrVy6dtICCZSDAN82Ku5mf1AxqoDY+pyX4P8Jfx2C5CZVTzBphLq6vZmaSUht
	yRbSD15JOnA6u5w5bh7V77n3gdQd8r0/iSQe01oXYNl8UHbymQyrdPF8t/RpPysCFPaLRaNGi83hT
	dzdzadjBmLsONIErTVsGUVPZ90NcCSt4lUcsc9pgpwL++7OfVouZMpMXiLCEj5LHonBfpJIv6HlMm
	YWEpqIHr2p/Jtks7+6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptU7j-00G6yW-1n;
	Mon, 01 May 2023 14:03:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptU7f-00G6xa-33;
	Mon, 01 May 2023 14:03:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f196e8e2c6so24839285e9.1;
        Mon, 01 May 2023 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682949802; x=1685541802;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPKLIXENJWwnp6qccK2W7S+dB0m6Orv/h3gsSqIcq0o=;
        b=GBDrRMx/hWswUbeEHT9HXtvGsYYcp8hwfjkQw5wVAL7EknjfxsPOOlP/jCOr7rwLI5
         87RFr+y0D5MPOagJjxH2CbvxX3Ga79NezmJdQUsTAkwdgnJK32mDHlgTFPTJRgDs/7w2
         X+JLWhM4k214r0J5MbBZv/kLzKSb0XXiaoh4REGXWSgz56Q4Zqs8g6yZns5WgiCUjAlO
         PaGzUyumtNwWqqZDFGFFs7NJbHAbmkIfen/y21DLDrCysc5KxhBkw02pY5qq7yKYvbbO
         RVU+W0XjXoEq4zmB2BAkIeiLm7VAjhikGEieAxyRutBLAYKU8j3WVSBb10FJTk7e+EVb
         R7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682949802; x=1685541802;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yPKLIXENJWwnp6qccK2W7S+dB0m6Orv/h3gsSqIcq0o=;
        b=BJZrQkyP0gkd8bCJP/0H7+V30eTSZ+zX5WhJX/qL2q2PWXhJ1W7RdKxbUmEuWSRz9E
         wR/Gf63LsJFNF9SziDZ0zx4QHXnka8BchN4BqnH/IDpUCtkUQMMTPfErW2TqVlVNYp6p
         zRae7308HAqSgbxuixwpMX/yhkP0htMDooAPSwJYn4roEhHIO8ibdYukB3Cd8TSrnzzr
         AxUY5Ihj4CffcFYcgUMyM9SBJZmLHJwmwda79pbeY5OTVHJXB6GFertc4jBFlcQZpGFw
         jgPkgsw7TxJPce3b/oGybC4zixtpmNqftwqdvb9OVe8bR5Yn1lcRfOv/j2nftUgmPk/j
         WpTQ==
X-Gm-Message-State: AC+VfDzSvgvcV31uP/MO5DsDNleIvDrHaEaW2EnXftyCY1ZgwIa57zpj
	se684kKIBb2hMB1DLHxEveA=
X-Google-Smtp-Source: ACHHUZ6MPj9x4HSQDZyR5H3TnuNnERkVGEPbo4DKVB09sdN5x23YMfIs/BN0HTeGtDYUPTomX9+JAw==
X-Received: by 2002:a1c:7312:0:b0:3f3:2e4e:c738 with SMTP id d18-20020a1c7312000000b003f32e4ec738mr5839980wmb.3.1682949801869;
        Mon, 01 May 2023 07:03:21 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9bd:5800:60ec:422b:628c:6ca5? (dynamic-2a01-0c23-b9bd-5800-60ec-422b-628c-6ca5.c23.pool.telefonica.de. [2a01:c23:b9bd:5800:60ec:422b:628c:6ca5])
        by smtp.googlemail.com with ESMTPSA id v9-20020a05600c444900b003f173be2ccfsm47610223wmn.2.2023.05.01.07.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 07:03:21 -0700 (PDT)
Message-ID: <f48f17a7-7f50-c5ef-cc8f-007d0cb302b0@gmail.com>
Date: Mon, 1 May 2023 16:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] pwm: meson: modify and simplify calculation in
 meson_pwm_get_state
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_070323_980412_A55D4331 
X-CRM114-Status: GOOD (  10.86  )
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

I don't see a reason why we should treat the case lo < hi differently
and return 0 as period and duty_cycle. The current logic was added with
c375bcbaabdb ("pwm: meson: Read the full hardware state in
meson_pwm_get_state()"), Martin as original author doesn't remember why
it was implemented this way back then.
So let's handle it as normal use case and also remove the optimization
for lo == 0. I think the improved readability is worth it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- improve commit description
---
 drivers/pwm/pwm-meson.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 5732300eb..3865538dd 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -351,18 +351,8 @@ static int meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	channel->lo = FIELD_GET(PWM_LOW_MASK, value);
 	channel->hi = FIELD_GET(PWM_HIGH_MASK, value);
 
-	if (channel->lo == 0) {
-		state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
-		state->duty_cycle = state->period;
-	} else if (channel->lo >= channel->hi) {
-		state->period = meson_pwm_cnt_to_ns(chip, pwm,
-						    channel->lo + channel->hi);
-		state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm,
-							channel->hi);
-	} else {
-		state->period = 0;
-		state->duty_cycle = 0;
-	}
+	state->period = meson_pwm_cnt_to_ns(chip, pwm, channel->lo + channel->hi);
+	state->duty_cycle = meson_pwm_cnt_to_ns(chip, pwm, channel->hi);
 
 	state->polarity = PWM_POLARITY_NORMAL;
 
-- 
2.40.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
