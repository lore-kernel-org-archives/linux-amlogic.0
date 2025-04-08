Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A9AC3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QIZ8MAWji6opuSbs6/bbQQUTydmxg8NogD64PBJWuOk=; b=1p51Q0N5URvj+I
	D5RFerFDhgchvp/edsL7kCSa5+zo/octAgqLYG8dCaOfMJN/JBu3ca9gmHmY2Yn51Jg/gq8prlysE
	fTxGCJmPxaa2Nbm29QnoE1r9kmvGrGn7gf9xKXza5mElQJ6+Tioga1P01RcAaqihdgdB/eTeCDnb3
	WF8XnxrUY+RZWSmBKfTmAfWLGSd2R2rpXEQKtp7AWkakXxS7/pe5VZUV3fkcAvqRTn/lr8XgIogwo
	lrUpY3Y6GyEAeJrmQ2SwSuNY8cz6Q18a0RcxsY5jyYYfRaH+x1m7wcSzwPq1697UOFjk2XDQDG0Zc
	xKHUgEQRoyOg/jd5jqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Ii-000000032pL-3Szc;
	Tue, 08 Apr 2025 07:23:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DX-000000031eu-1tDg
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so40734255e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096674; x=1744701474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=igWbW1iAw3FYGURemyDT7qynBLbtmjtoSINC03Nh+DjJGxvseSSf7NTW/c1fvdHdnJ
         ZTf02CsSqCooKZnR0JHE9UegJVmok/kAfXagFZNhQ9FV/7RO20a6jA78c2fCQ/6mXKVW
         BxyUagxlO/EQ8yIVHzjOyCCOOWRmZoapcd+P+/6/XxONphk9k2N1mByFWb+0pEL21QbT
         hjj4TAOUSPyUlp+QUxgABZRrM9TK6Jua+JgSTCdqJwGwS46D6v52NreJtI6T8op7k4Pi
         FHNreF4K51uwImA+fWwVsV//edGwqgOtVhDjGGhMyIqXWs70MhnwHOBdSgJ9K6OIoKhK
         OGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096674; x=1744701474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oinSzm+bMahZJYAUWu862y4MPTAeTqz9q0Fj/pnJpP0=;
        b=Zh3h2NyQXy9BN6Zm8dbrXOqLGkTAN8RaSC1Ub/lwzVjsdsk4cXP8oTy0UdxCVmnVFa
         ArTs0AnUlHNBVgO+uxo7+VdPK6lFAwDEIv1z7VYV99ew5Hi5vNp1ZQPSdsis1CEoUxiP
         kC7vRLmtAMzWhRKjy46EifGyIo0QmcXsQDE1NDDzC53SVf5Ln6O+LsrJdE1FOYi0KnAp
         0cKqMJAaem/MhNDNOLTLKv30EmOIMZaYqynQvii7Nav3MLkQG4l7bxTOIgGHc4hn4ExS
         3khvzEt/flR9hGmz52sfRitm2Y1Cpq/WVRLezJT/NihlDzj5tsXvrQteF/f+VNVFgTpZ
         iYoA==
X-Forwarded-Encrypted: i=1; AJvYcCXH7WRZYyUuV1PvHH8QWH1CPOgzHy1u3jfzVlaVFDbOPcTRU4UUeAwPMOO9IwnNOfxeUMZRivo9FiDKyBzm@lists.infradead.org
X-Gm-Message-State: AOJu0YwZeqqvPa8idOcTg4SA0xQnB3myXFQwbig43zb7jdKY29g3xSJM
	lhBL+QqFWiV4gjzudkZw/j3KNrGIFYk4BkNO0vt6E35IGrqo7BipZP4pEC4/Jqk=
X-Gm-Gg: ASbGnctRUhWwDZFYc35qyLhIUxQasALQ1/xw8fyPJC6dRBs6JwB7/ZEn3dxjvDye+yf
	e4/+LWn0lQd5g/9wejtYG9zdztvRzDeRt4lqWocyR4GsEtbKDbVZZgFwV8EfX63Dh5FkDgkr9pV
	c7MWZUXS3uljK0CkT+QCNI4yP6RiUTyrOkONujgKuVs2JuA1dbAJOgipALm/ak35TNnhA8b6xXp
	4R8cH/beRRnJQKZWUB5GPU0kO6HL4Qd/ou6IgB6/rTScSpz5Oocwb6SidPzvs11yDplm0z97bXp
	4m4B8UkmCQM+PCtRsGlJlT9tyPDGARTb0580sQ==
X-Google-Smtp-Source: AGHT+IHrjnllwruX19f7P/GJ6q4XihZ8rfCQK9jOXGEEswSMIiSKCV482ACd4hwI02zSsicA1Cwvhg==
X-Received: by 2002:a05:6000:2289:b0:39c:30f7:a599 with SMTP id ffacd0b85a97d-39d820f7f4emr1793514f8f.18.1744096674126;
        Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:41 +0200
Subject: [PATCH 04/10] pinctrl: abx500: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-4-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nW8gbeASZZPGvCfMjx4XcSCJQKXVyNGKry+o6wrAY6k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZVzNUI3VgRQMzfUNu5ztBdbgFOzKCX2cTD
 gqJRJh5fnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 ckcMD/9lHTxFJCt7mJF9tP1pyTVlOFcI4iTV1L1QK53z5FW2Z3SMIbsg/WP0Ox+KZTEQhQIH3rM
 wwqGzcFbxbursx8+r7+ZvVqkU4QZIBUyACF7u1pek1/n8JBWnexyzkfimQ/4dv84Mg8fblHxX6/
 e9AxG0M296lr/4pAiXZ1OD25/6m9fmgaetnGniuV57A4pLBJe9hlfZ2YzB5mYUgkf1H//Jbwa+A
 6XaU8J7I4WJxHP8tl6QsF4nWHGmtgm2fhT82RFptXXjqk4O4soM7AG+Ss+tjQK6UQz9anNLU6Lm
 rmqduN1o+po7YG+d9QycugTfQLY+ldfFNdSba874x5yFE0yN5u6hWFUlf7kqCSA9/ShGC3h1b1d
 P3SrzAAp/KzpaZ0qz4k3uHr8AWzjtoebNiQLf0np9Rhj6QlsXMPTjpRvO8qu6TwbjgMUVwXs+ML
 LAU2zu2R1fixy6aGTWSrsqOHHB7OOlUsUa2Gx4LvWVk5suCmM1xbfDPoByv89XnsFLphWZVxUvK
 aJGTZoxqeRJVCy+Hfx8X9v29LWuxTlLQC6oNMkvVpk9Pycf8fKsnjpKqnwNQ8Of16WN8gMmVTAb
 w4ONrOgUNVqfGiBiUJqcKD1U3JafBOwIdNX7SuEwqraaSC6bMhiSiynASp0nnYhkZEAuJMLEqV9
 8aWIUWj5E3JEMig==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001755_508450_ACE435E4 
X-CRM114-Status: GOOD (  11.37  )
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
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index 8cd4ba5cf0bd..2f55f83127cf 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -167,14 +167,10 @@ static int abx500_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return bit;
 }
 
-static void abx500_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
+static int abx500_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			   int val)
 {
-	struct abx500_pinctrl *pct = gpiochip_get_data(chip);
-	int ret;
-
-	ret = abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
-	if (ret < 0)
-		dev_err(pct->dev, "%s write failed (%d)\n", __func__, ret);
+	return abx500_gpio_set_bits(chip, AB8500_GPIO_OUT1_REG, offset, val);
 }
 
 static int abx500_gpio_direction_output(struct gpio_chip *chip,
@@ -540,7 +536,7 @@ static const struct gpio_chip abx500gpio_chip = {
 	.direction_input	= abx500_gpio_direction_input,
 	.get			= abx500_gpio_get,
 	.direction_output	= abx500_gpio_direction_output,
-	.set			= abx500_gpio_set,
+	.set_rv			= abx500_gpio_set,
 	.to_irq			= abx500_gpio_to_irq,
 	.dbg_show		= abx500_gpio_dbg_show,
 };

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
