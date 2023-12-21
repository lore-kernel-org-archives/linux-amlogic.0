Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C866C46CCD
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Dec 2023 21:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sxOOdlhWKidmCw25b1wU4IehJ2I3Xov6PfXS5L24XIg=; b=vdKduie7QUA5UU
	Fc5UJ5KSaD6vWkRcb9L8PpyjFJSYwhx89cVPjZ+M6NCvClMnajlFVC5d6FtY8NlidOpOTy2rNC4nR
	Ma38WzEOC9+X5RhN9CaxhiUh8BQXVtIe83SnIDpvElVQfXwIywWbZCkOJ4fGfLCkJR+MkAKARM42p
	j6qvkNxHdLJxc+BZmm03VS3Ry7THLyBpFQAxvkmca2URZfGjmg7TaEwXVRnXeFwTnSWTEJfQy5t9v
	YXR11Vh1EZyrkIOfMmhTZ5a3QglsaobN+UmUMa8ocj9YM6nJVWXG/4GnMTHqNskYJXI1FIefZymU/
	k7vpI1oVfK6ThEDgtxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQLW-004791-0N;
	Thu, 21 Dec 2023 21:12:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGQLS-00478W-36
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Dec 2023 21:12:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40d12b56a38so12741055e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 21 Dec 2023 13:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1703193160; x=1703797960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4Cbsukg0G3muNGOdfceGuCWeyDTmVu8AAhb+DgFIkI=;
        b=QSJcdUINoBkIYdPfYEL9Gtg6f5G8c9pvn24gcnjWkfWMpTidXnFFfgspPhaQMX89wb
         iEKCfdhOkGk+DgNgExj6UU5H4morgk9okRtBwmT/xpoTakSVUblQFe1g27psYxbgJc5d
         fZs89WHIbuGTIcllMf1/kHOrELIiN5MjyRBgcUcqyxZbaKcZI/G4QIXwAvYUdbya/bf2
         1gXDykJYYwR7rwr5xqnBuyG6XuF5tnhQnrdRNt0mriEMrwlIS5WZMHBvKT5GCOgILs3H
         gfSQITOyrTtGUI8V3s6OpbJENfz802DviK21CY2GiBPtVZzgNqQVlEXDuiCXnncWSiVh
         IP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703193160; x=1703797960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4Cbsukg0G3muNGOdfceGuCWeyDTmVu8AAhb+DgFIkI=;
        b=htLIgrhqkYONOPiqcqEKg8Vnen+HUEKPkNk95Q2lZ5F9EoJuTnUCErKtUWywg2Dcur
         EKNqWwk4XSvvyV13M8CMlZSFsOsj+cTWUQHzcg1G1y2tYJ6NyAgksg1LQCGMTPYZtEzl
         fE7+mGQjuZJlBi5LNDUG7aQZbtaHppj+jQfsUlic/tIeWA3RovLmdxJbNf3seEChMdzU
         U3M2auGVZCLnr+8BHK5OR089DZMMWt67jY+EU11RQ0N9uqWbGhmWo7FzoDC30TvQ09nx
         sCc5H+x0F9X44VK83IulQIVJBUI6kFPolyUk6WohdbAl1roi3/Q3RJuwLVVi3vdMgtgx
         MMaA==
X-Gm-Message-State: AOJu0YxtjYS2EeAXybeW0bblyZ77CWZysxA1U8F5sNt2IziL0KjviEg9
	eeCVWZA/uHFd32HkORVTGiA=
X-Google-Smtp-Source: AGHT+IHmELJUnkQDo5KJjUSCQrDQziZzRPhiuycQ2ms54XOnISGI1jfghQbrIMYzE02RPLo8s0fN8w==
X-Received: by 2002:a05:600c:ccf:b0:40d:3d57:eaf5 with SMTP id fk15-20020a05600c0ccf00b0040d3d57eaf5mr105640wmb.164.1703193159410;
        Thu, 21 Dec 2023 13:12:39 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c23-b96c-7a00-0000-0000-0000-0e63.c23.pool.telefonica.de. [2a01:c23:b96c:7a00::e63])
        by smtp.googlemail.com with ESMTPSA id uz16-20020a170907119000b00a2685eca385sm1341669ejb.195.2023.12.21.13.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 13:12:38 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1] regulator: pwm-regulator: Fix continuous get_voltage for disabled PWM
Date: Thu, 21 Dec 2023 22:12:22 +0100
Message-ID: <20231221211222.1380658-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_131243_020301_58220F2A 
X-CRM114-Status: GOOD (  25.84  )
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

Odroid-C1 uses a Monolithic Power Systems MP2161 controlled via PWM for
the VDDEE voltage supply of the Meson8b SoC. Commit 6b9352f3f8a1 ("pwm:
meson: modify and simplify calculation in meson_pwm_get_state") results
in my Odroid-C1 crashing with memory corruption in many different places
(seemingly at random). It turns out that this is due to a currently not
supported corner case.

The VDDEE regulator can generate between 860mV (duty cycle of ~91%) and
1140mV (duty cycle of 0%). We consider it to be enabled by the bootloader
(which is why it has the regulator-boot-on flag in .dts) as well as
being always-on (which is why it has the regulator-always-on flag in
.dts) because the VDDEE voltage is required for the Meson8b SoC to work.
The public S805 datasheet [0] states on page 17 (where "A5" refers to the
Cortex-A5 CPU cores):
  [...] So if EE domains is shut off, A5 memory is also shut off. That
  does not matter. Before EE power domain is shut off, A5 should be shut
  off at first.

It turns out that at least some bootloader versions are keeping the PWM
output disabled. This is not a problem due to the specific design of the
regulator: when the PWM output is disabled the output pin is pulled LOW,
effectively achieving a 0% duty cycle (which in return means that VDDEE
voltage is at 1140mV).

The problem comes when the pwm-regulator driver tries to initialize the
PWM output. To do so it reads the current state from the hardware, which
is:
  period: 3666ns
  duty cycle: 3333ns (= ~91%)
  enabled: false
Then those values are translated using the continuous voltage range to
860mV.
Later, when the regulator is being enabled (either by the regulator core
due to the always-on flag or first consumer - in this case the lima
driver for the Mali-450 GPU) the pwm-regulator driver tries to keep the
voltage (at 860mV) and just enable the PWM output. This is when things
start to go wrong as the typical voltage used for VDDEE is 1100mV.

Commit 6b9352f3f8a1 ("pwm: meson: modify and simplify calculation in
meson_pwm_get_state") triggers above condition as before that change
period and duty cycle were both at 0. Since the change to the pwm-meson
driver is considered correct the solution is to be found in the
pwm-regulator driver which now considers the voltage to be at the
minimum or maximum (depending on whether the polarity is inverted) if
the PWM output is disabled. This makes the VDDEE regulator on Odroid-C1
read 1140mV while the PWM output is disabled, so all following steps try
to keep the 1140mV until any regulator consumer (such as the lima
driver's devfreq implementation) tries to set a different voltage
(1100mV is the target voltage).

[0] https://dn.odroid.com/S805/Datasheet/S805_Datasheet%20V0.8%2020150126.pdf

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Sending this as RFC as I'm not 100% sure if this is the correct way to
solve my problem. Reverting commit 6b9352f3f8a1 (which I found via git
bisect) also works, but it seems hacky.

Once we agreed on the "correct" solution I will add Fixes tags as needed


 drivers/regulator/pwm-regulator.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index 2aff6db748e2..30402ee18392 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -157,7 +157,12 @@ static int pwm_regulator_get_voltage(struct regulator_dev *rdev)
 
 	pwm_get_state(drvdata->pwm, &pstate);
 
-	voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
+	if (pstate.enabled)
+		voltage = pwm_get_relative_duty_cycle(&pstate, duty_unit);
+	else if (max_uV_duty < min_uV_duty)
+		voltage = max_uV_duty;
+	else
+		voltage = min_uV_duty;
 
 	/*
 	 * The dutycycle for min_uV might be greater than the one for max_uV.
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
