Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BB9C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ltZ2jcDCaEn7dknqAVoPYIGatIkTBYGhtgZZgfqOnI=; b=Cvw4hvEidE9iZx
	AWOOe3nSttkYVUfgQCt1vQSFrJ4awl1tS9593fwGnwjptJ4OfaNNmIW8oxTAbq8AsRpQ7K8X320Z0
	Vw4OEmbdb94bSBDJNJh1tNQ8NGOUjgz/r7tvFQx5vAXirg4burGyBTyW21Slj2FWS9qq1r4/cKPcz
	cOuSIrZc4LAJYUt7ylwcmSy1sFm5ygw76w1soD0xbBy8N7zDmyDF1TEWXVpZigJmic8AblaWH0VHh
	AJLKvq+bPOpS08nHH0XN3PvCbRf0MF65fz1ZLRS5GANQ3NDF0nTqhRQgjBaVIxBh0WoE3lBh4+37D
	iKp3EEEQarKeK3UjtVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23MB-000000033Vy-2L2E;
	Tue, 08 Apr 2025 07:26:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DY-000000031g2-3xDc
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4559748f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096675; x=1744701475; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=P5L+fkuIKBj1aFekzclEylg1x7sz6YuH6XFHbIFChe+DSxC8z4UzW/rzRp5gS/8RTi
         JHmRRhaQClGkP4CXe9TnNqVwfps1Jcw2npDuD9eep5AD+V10be3wzFrbr+E7z9joNHng
         nJuaxqLc01Mw3BhCfkIsUVwHW5J+ltckIwm8uRpbwQdf1+PYvR30uv76+VsmZY+6Y9X3
         r4ieWkzMEu1gPC14zezDA9DwF8Z4H5hOTiT3jmTCjsKsiCQ8jJ3z+4A86OAmNcGszp1y
         ocKNmrbH7BlBqaIhcS9518r1op3e1VeTALX4E9iorwrYHrBfcrAGF1+YUrBjhsbXCT8l
         H5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096675; x=1744701475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVFJWADW/y0RMccjVQrvsZvTL6Kql3Z12L3/megvx2A=;
        b=uCZqpknBiaBZYWhubfjTD6gz310i9sZ7cyNwW8NOx6UOqHw9UfO5M2yx9kLOUC3uBo
         Gb/fdTrs1oDL8sAjE8zdssd2/YsTGT2fmjJvPS3aYjkVsHwChYY/MTJFE7tAjQ6WAZiK
         K3vU5aMY26i/s4DZTdHWI32Ma80wgg1xdiuLSGIO/oBusYhM+imrz45yG92VKS3iOGRF
         Y3usfbc9fD2ZVilRvb3+IEENnDKFEjY4qPnQPaVTK0PDhvuOrUH8Mn62cjvu6M7UfLBE
         wJmAYpSU+fTY54G2GMm7a8tzlaC7iMz99lJUvZBGGKfE19rBGKD0N24iKusEYIUWQ9Vp
         7FKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHceWxTb6freoTOpJOzJZ+4cXUhLKTi61eHYqIddXuExx4R0rlP7VCq59RMkZHUPMT5IkCzz5RSQ14ZMOw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh6DLMhIXOR16LOj0GdNEdqDuLYme6VaKvl4cdxFoWNav7IbMu
	g5vwQ84FMn3JFr8zXrWCCMYX/3gS1uO7FXK4JDeBg9IFEaNJNL6XVVXuPauDJpk=
X-Gm-Gg: ASbGncutj6RX5pQ4rrW8UJ0xb1w0CPAtlEB54s6UOWIcI8Vt6TukgqGZD3zKgcvT1kE
	Jztr5BLXfwbo7he3Klwol05tN05hJw7fi0DLkvst9ZX6A6++OjAMvvUySDm6PQbgA/O4CbtSYhV
	2X/FpH+ckNfSKhbsqUR1q9NFsuCcSwzdw/OUxitzF47yHt+guZ5CClrXmnhadtqRMvddoHV2Yy+
	k4aO4834QRNTMEa7LcHuEEBCgwAfGd8jtcvLksCvC1ecYR0omJff+6ZphVs+klj5oDnzkR0RGXf
	bcGXi6ai/9IShvF1dnt3vqy1FtmaztQTzt2iSQ==
X-Google-Smtp-Source: AGHT+IGb12K5x3MyGax1/meWBHx/ceb2e/LqJgU9QQIZHIFbzKHDCky62yygJ2VTuSCj50YJyfE4bw==
X-Received: by 2002:a05:6000:4313:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39d0de679d1mr13305391f8f.47.1744096675082;
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:42 +0200
Subject: [PATCH 05/10] pinctrl: meson: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-5-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=S3igGGikbfII9kNPL0KKjqnS8YUnpBiOi6WZKLdujUk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a21smivbrNX7hovJ5AmOVQjkGrJhwqOgTw
 9GIegrUEM2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 ci67EADKEh90ymTKMGsCY74l9LHK8QIQ4v/81+Rc6Eqfw4wVjL+lPNaGTcSBP2utqyO2KrQMMFw
 Ud7MCMHcZm7kzMCKgZhr4Q5hxKegKb2tXZsgsyhV8YdIebBSZmZS3xjHm1FTslGntrxTtZfUcgD
 9Ncx7bkinKF9GE+JhCUYTwm5rX/ImXZPua18/+263zoA9IcowGvpu+sHiPYBinPQTG/NzQUeczO
 GStvT8lo/PvFW5C2evtDAAac3WkpMH72Zd++nH3ZSzFjmh6wa+JuZj4++IaVtdQvf34/rVmBvxm
 6lfHwsxcLCcvsiKLGQvJ0pyMUTgjTXWuCVx1yI4OFqh/vGStiEpFn/FM4m6cgY2+8721nFS0XSg
 skTUnIqE+icmuFIxh33ZNyBinNKoXfA262Dd1FT4UU/UGWwK/zVzRXebNxxuWVofBCrpGfvckJj
 5An31hmmubXfJwwqfo1WCobGVNTYhODCiiFTT1nEEdIOgEF1ogNVoLg7ND2vY3mbvxs/m59mrBt
 Ghvcu71zj2ubCbOCger+FJ91d0OXgTTDx3l6RxskE+/H9YiT3YVPYtaxsW15NZ/wrgk3dpqh3Pb
 pxgF2SOpd2n46VLipFyjCU5PmDaB9KG2fyxu5yKFQym8Uk1AbdlkcgldvEzqzVK06tjwV4yQehq
 CrMwCr4lgCvIlLQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001756_990511_A8766672 
X-CRM114-Status: GOOD (  10.44  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 253a0cc57e39..e7485c82089c 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -580,9 +580,9 @@ static int meson_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 					      gpio, value);
 }
 
-static void meson_gpio_set(struct gpio_chip *chip, unsigned gpio, int value)
+static int meson_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
-	meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
+	return meson_pinconf_set_drive(gpiochip_get_data(chip), gpio, value);
 }
 
 static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
@@ -616,7 +616,7 @@ static int meson_gpiolib_register(struct meson_pinctrl *pc)
 	pc->chip.direction_input = meson_gpio_direction_input;
 	pc->chip.direction_output = meson_gpio_direction_output;
 	pc->chip.get = meson_gpio_get;
-	pc->chip.set = meson_gpio_set;
+	pc->chip.set_rv = meson_gpio_set;
 	pc->chip.base = -1;
 	pc->chip.ngpio = pc->data->num_pins;
 	pc->chip.can_sleep = false;

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
