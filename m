Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D629DC6FD18
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 21:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yoKDwnoahN+aqcWWBeUwGpRMTyELi1w993HydhPhfcg=; b=1zo8wC32GBI3gS
	ribOlWJe9iO1jfj0iQa/BZBK2KT+++jNFT9xugxdcmNOC35BqUaueLk7Vfzm+DVTNv3e3fFJPxUPd
	de6NrUw2bm4M00bwb1162w9gebEuv2qkIuZocm/QJCzuQ/mrbvLNB1tciJocw/uvYEKOS9olVXcYS
	W0k1msNnEFY3eFb6g1N+O232t/5YFEQTM1/ZeDl90hcI70bCGqPyELA7MWJURlv/3Z/L4HftF5ers
	9MtPL8Tq57XqUH1gaKd5eJ8araatvDnvk4hmSLM4SAB5WEwcjW/6GyWbc+CQQslwONfoHi8jW//Os
	7NVmwlmAaSq6GDiCpGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppFOS-006Pph-1a;
	Wed, 19 Apr 2023 21:31:12 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppFOO-006PoY-0Z;
	Wed, 19 Apr 2023 21:31:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id xd13so1770083ejb.4;
        Wed, 19 Apr 2023 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681939862; x=1684531862;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdlVVXg/ZDVV5S2Y7DqG2qcaIisv4Xg/5TG8KpoazMI=;
        b=Mksh8Hgb6Cu6CSOGNzvfNY33gkMQvzctZxYJ+oI0EmzpEOiH61SRTQbI6b+y8um2tE
         a6F0mCIaqrOT/o/q40jLcjvbAaJaSyihDMx/2nyAdcF9yI87Yu8gBWUu1d45ZGbRz4lO
         VuXdPxzCeKjQCpE5TPhpLR5J9G6Aj77H4T3pfgQE8pwO1rxFlWVREvX731MPHVOcDoCN
         TXvfgFNvX52/60wfiHd8XeB8ndEZd4UBZaQqNH61oP/ZbQfCSJJBaP7uLe4dUrudt2wc
         RY5xsgevQtwSRhdp8Iaw/Xn0hQRGVYrcqUwvzGi1n9ELtlxvdAmLp79518L1y5GKsqz/
         vt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939862; x=1684531862;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MdlVVXg/ZDVV5S2Y7DqG2qcaIisv4Xg/5TG8KpoazMI=;
        b=hm5rjFZ/6V4TQPKzeHEHzYIGrTV/xJF6bJVxxTZOWfOn/KYLLFLI85S8nhoK54mShf
         /eLC9eAdV0r+bWhT9ocPsIJ12CVQcSxMlhNFCm1qgaCa+mhtZn/OflXmhVFZD7VUu6Km
         Z3AC+B1tBFz9AutSU023r6pa1XtXaRXL6mHCTp7QPgIajHS7Y/udA9TlHTFMaGN2ea8n
         ZtHAcCIWXrGW67kFg7yMvoLqDu4LjWx5Hy7atiXFbWo/vAYjM8YkPDElBOZrxyDSPm+R
         FhW1dh6qBXfEuuUIx3Mu6PXrAsdEVrnodNAJLXX/Ap/n2xfyCY+pEFzMLipyflMOE5JN
         dkSw==
X-Gm-Message-State: AAQBX9eItw+hXwlEjN2WeauDKZHG3aubpgmR8uc9sfXgufN+RrilnwPf
	ghuj8LsHkLGiSjN9DRWuMTI=
X-Google-Smtp-Source: AKy350ZleavQgkE/Gu30oz7ELytf+JQ1woNamGjopo1D5tmuCezKZMrWw904ZpcaQrn3VlUlejRPPw==
X-Received: by 2002:a17:906:4e55:b0:921:7e42:2777 with SMTP id g21-20020a1709064e5500b009217e422777mr18918154ejw.69.1681939861834;
        Wed, 19 Apr 2023 14:31:01 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9499:ff00:939:7c23:9a91:9bcd? (dynamic-2a02-3100-9499-ff00-0939-7c23-9a91-9bcd.310.pool.telefonica.de. [2a02:3100:9499:ff00:939:7c23:9a91:9bcd])
        by smtp.googlemail.com with ESMTPSA id bf18-20020a0564021a5200b00506b88e4f17sm11009edb.68.2023.04.19.14.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 14:31:01 -0700 (PDT)
Message-ID: <5a5920db-4c32-25e8-d1e3-bd2f724dd242@gmail.com>
Date: Wed, 19 Apr 2023 23:30:55 +0200
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
 linux-pwm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] pwm: meson: simplify calculation in meson_pwm_get_state
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_143108_217660_787418A4 
X-CRM114-Status: GOOD (  10.59  )
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

I don't see a reason why we should treat the case lo < hi that
different and return 0 as period and duty_cycle. Let's handle it as
normal use case and also remove the optimization for lo == 0.
I think the improved readability is worth it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
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
