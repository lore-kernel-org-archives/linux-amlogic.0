Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A82C369A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkIKL4PXjX6ywLMJ5l3hRef0OlZIYPWMrW0kasLsybk=; b=gsqjmBSLTgDgaW
	lUEIp5iMRiVtmHcz/S8gYvosw3aeqUgDURH2QiCUpk11prIoZ7fiuoAFsHAbBKb1szHYOSI32JdIm
	InsjFOSuX/3UGibYNfYhQc4EUxedAAxVxVBj4hqenwcKTIyAQWGk75TjflA04l4btZTnuR0X6KhvQ
	XJrbLiwViZdq/G+GgGU+LhFYEw0ON7NA9sUovtCoSLRYV0gcmJmsl3vbTI8Uij1F93Qko5Ypr/SO3
	DFt1m5g6LE4ioPoYgAmtD7BZ2mxRBisFN9NQcIDuKneV00eSbUE0DmomsK11l0bpT/waMXkZug+My
	PkFWmy8CdcUYh7oT7X6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23TA-000000035It-00ZT;
	Tue, 08 Apr 2025 07:34:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23KR-000000033CD-2ImX
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:25:08 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac339f53df9so909809966b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097102; x=1744701902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=bcu71875aPWcVKmaT5yc7G57I2UHXAtMwxp0JZJj3z2BAVzdY2CGvu18n1Pirm4zbi
         UgF+3xN3Q8EFk/UfUhqwZGqqC3l3yAsmFIEKH8Lx1QVKEM5bojWReh3kHF03rtftwT/Q
         xHdsPHkKGToH7iYqHROFZ8qGoHRQ2YyRQSN0j7wg0DaERRHjlAD9mTdKPk+jKAX9pBGD
         JSrvn2usGJTGUzifVSwMrukHNXpg8u+fQE9MAVcswEzjRKv8b69a71keoIvSeYJ1OX7q
         OtiXIWrVGgPJaQ5Ujl12FiOMk0HbacD5Zp3v7Eq8m3r3qCbgZ500+tFrjf5FUbG5kYcX
         dnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097102; x=1744701902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOjNNeHzyY58LMv3k+FTJZV8HBjSzUrYs1slCEoFb4s=;
        b=fAPAHA5+t90R1+5jFI77lpGlyEpDjb+FBRbdNSlL86uN/hwuHRVqUWDFExfyvE2K+I
         fjgzTehd/YRpAvaT0yqTkr/fT+E3NcCWizqIqB34Gtz6+sRpn1n3fer1IzVJ2I+AX1CL
         byFkBaL2ZDPyz7djcZrkGAtwYyzyzyx4/P1OII0lsgdr42uz+yrbuu0J+9/wJ0D+IWxZ
         aLeyDqIS92peBS+mJ3KuPVxHWqWxWCBkbVoiq7JCZdRg6R1/yrvjCD9geve/eROTuozS
         wmdQergmc8CnC/uvHDPZay3o1cS5/Zrz54J/T8YOh9gEtyTnpNuofFtDZpUgNGlDigmg
         X8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWWBGOYWVnBNg7xS8DOK7erz3xm6LwRH9C1iYTEhAnH+DKlC87rCw84pGpczN/Tfrteg50nuBwklv+stI2o@lists.infradead.org
X-Gm-Message-State: AOJu0YwRuRW5Qi5bE9ksT7piapBmlle/7WNIdPoyJhPsChjstzUnF1n4
	t2HR0hk4+o6s3c1RL5VkY5ztA9Fs3QCuRdqarPQ3g97gTp2/hnIqha2FZsAocIhaG+XHi6kLGUC
	ObtY=
X-Gm-Gg: ASbGncv+rHvcvhkmhixKq9w/wSqSUxOeKWxPKvfvW3Vr4b/OqAH8jjcnmQ3DRLPhp/u
	fKUYrgDbQ4XUp9nl6PhTtzDoORLUPUUo1HpJlh+8vCwN9Qfubkg7qP35cOuUWfSNdgJ1t3ha91r
	bp85t7mlTRAcZE5a0/a3/z9+CoT/9rczf7dpVb+Exf0GA/LZN9T4awUnce2HvLm2ifzMfjx2UC6
	3JY81iyoDXZZeyNpPRLgKpmT439bPEDYzHosZrEkt9jXbBQYT1LJh3NMKe2Bo8AcdhR3nFYlK8f
	wrFwS2v2iW4kbIIfx8+hjooW7hEBS9zv+t6sjQ==
X-Google-Smtp-Source: AGHT+IGDlv/Wz2Tv0JI+8Hx2njCPUM9rczyDR5EAPHa4oqor0nd3oFYHO3dEgeKjIpQ3eleoyeURtg==
X-Received: by 2002:a5d:59ae:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39cb35aa8ecmr14702868f8f.33.1744096676320;
        Tue, 08 Apr 2025 00:17:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:43 +0200
Subject: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zFDAJ44H3rDElvqiaNPmVwvOeCsvopBV8K2+vzPv+N0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2aCcCPhwuF/Scl+dWhUvbWutpdgADlyzo6E
 dkwEIOpAkiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnRjEACRE1eo2DpKjHGbPlQbMpv86tO6SMwS6frSIq+KfYxOaODnxG0vYoNPl1XeTMMPfKWxuKo
 MspJKWTkvUN0QuIxmjcZ8vBjIh2Ssf2biltkgH+3Ut1/ExIvxXr/M7gT0UOy2/r94+c7DkVzBEK
 MXr/4KXQXVZ4OSvLf588xywzpAYfsAPShtYaqDz9OdGk8uc9fPG5lzGH4ccc++V5cuv0ZlY9tD3
 ZXnb+hLdVs0BvC1ESV29eq9xcIkTRj/KhdzH4WdJDJB4Fx4xRvCBxuTrv9+Hv2FE6VyVgnX8Knt
 wPQY7lA3cwjzj0sWtwauKnLeZ0x1DD6IMexNhfxrfvgGpEXh0w3i09yOn6vnAvTxetgrzUoiZsq
 5210n+9CVXDRsBqfEUuqtBOx2/HJBwMibEOeyf/tK8wVBtbrEFq1ji769lP5H/PGJUFNT0bPXLd
 vnKVHrJiJUiyX0REr7gSm1AjTYXZb/jNq6PcBIY1JG8vYGaruh/7KsvN5PbWlmeIxn2DIKitoEB
 5c3paQ4gObhMQ1lHal6NduGavNkTb99awzhp7MjrFLQ7vHEkk6LWPVdn1/obav1Qnh7bwi6/RYI
 rfIeivF5Tge1zaLyASFLrEOQUIffbwsDEofBTf4iFicbK3EDjEXXtUNKuD4DDgO+q2/1XPzUYDj
 IgJ4xDux3XMrr+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002503_579506_78BA4F3F 
X-CRM114-Status: GOOD (  11.01  )
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
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
index ee7bbc72f9b3..a76f266b4b94 100644
--- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
+++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
@@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 				  value ? BIT(bit) : 0);
 }
 
-static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
+static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 {
 	struct aml_gpio_bank *bank = gpiochip_get_data(chip);
 	unsigned int bit, reg;
 
 	aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
 
-	regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
-			   value ? BIT(bit) : 0);
+	return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
+				  value ? BIT(bit) : 0);
 }
 
 static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
@@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
 	.request		= gpiochip_generic_request,
 	.free			= gpiochip_generic_free,
 	.set_config		= gpiochip_generic_config,
-	.set			= aml_gpio_set,
+	.set_rv			= aml_gpio_set,
 	.get			= aml_gpio_get,
 	.direction_input	= aml_gpio_direction_input,
 	.direction_output	= aml_gpio_direction_output,

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
