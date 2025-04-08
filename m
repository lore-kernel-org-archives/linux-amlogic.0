Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70F5C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4HPzpStZ+hBRN9D090DW/8UjF33sKgqPYrJrtql3x0=; b=hVrqF+afcnqIN8
	icrmiBw0iY9cURgtfXmlldNo7T8q9RWHTcnETh7IpEGMXWQW5slz7isSJOrpa8d+LWbMIdz+93lUN
	WDeEfFYZ02gf5RRB+NmDfET/86KwLlfUkDM/P3aJBkwVOxYqXofBOZEa3d4Wv/57xs/FHLKfuwP/U
	hga24YDIZT71/T+hiHJIiBMDZzJaIxm4Lx6gKKPeQDCcJXSW6BlQBhGwPQfgBy6lo+oP6nohN+XmD
	glOycsNeF5bBObdYdawr56TSY0PsTsDA1QlsgHmO+b5viM3uAqZKqfDAApW+OtOAnN+Gstpbsb/D0
	UlmziEoM+PxpKggU5amw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Gz-000000032Nz-1bLk;
	Tue, 08 Apr 2025 07:21:29 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DV-000000031e6-3kgq
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so3061470f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096672; x=1744701472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHbdZ8I5zBJbhRifEOkTpCnTw3e9jVPzpvQJpqCzg30=;
        b=w0tMD1QQ3CrVrwot2hVqwf+UUBr2I0A83Sh/N0n0ST6U4mGmYjWOvqLYiC7l8iJUY2
         Rt4/kqR4ga/a4koGK7AHaff77tDUGzSdqf7WbTcLA2JXZdWMzLjmpGiZKbkCoUCK4KHN
         +0YRu+65pDbOW3LcsaYqBPeEfN1aPKlGnpGKIRrbIzFHpmTibNJ6k0r/D+vuCmq4ypKn
         zKKMcSfYXBA2daQ5YKdZSmi1V1LhLYhDiyHY/KGMvVcL0TDek877uyo81QrSrkT+fuBA
         pWdGbmDEW3qIIvmyRPHm7Re/pGYphcx5oGZQb1UsOLTlX5KcLhOL1enivfIN+pODeCmO
         ZolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096672; x=1744701472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbdZ8I5zBJbhRifEOkTpCnTw3e9jVPzpvQJpqCzg30=;
        b=TRbY175LaQgqe5zuuphLzdbTYK0MJ6Vwme6/lfb95KCGn9O1E6XnyahrxKozBZIx4z
         Ur0mpV04uJNQ3wp/xucEAymZGRlj4OB539pOV9wla3p0mh+HmbVhzY1erdawQz035qWb
         DxCBuMbCyMHdTDDCMGaKRetiU+xy9EN3El/ozaNmqtuU1i3AxAVjA9oVU5S7zLTuL76p
         14TqT1wUBMz9NxGyXuy2AHJxUyEyxy7Mj2GbEFIFKUyUuHomWA/OuFqhaNJKA7AoYYEu
         qtyk2iDhGxlTt8gwRb75XWZNNmOF+R4Wt3FD2Yp17L2QIC5yK9mjzmQ3EMYP2O2buS0E
         5QMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Ob4h8T9uGBQ3ENNHH0haiErQ6J2QMGmMz8n6v78i4i/g1HojU6u1TVXHzMgBOPBvDM4gYidrKY5Lk7L5@lists.infradead.org
X-Gm-Message-State: AOJu0YzCvoMfnx/VM2wAImHB43/ORx9DPQEAX+CcE5iCDSLexrBaHT/7
	KQ5szmzvEWiXEfuTP+DCTEcK+tV0NqFh3Q/sjkcbLSs696Wa33v+e2/TUYO5614=
X-Gm-Gg: ASbGncvY/z1a4LLl8kvUqU62yttEs03EUR+m+pY+N+PleukiS1tE2w2X6w2CJHwfzUe
	DvMIZYQrKbB/xK8fr+E6hTqPCnwrndJwJG1DHrcarJ3jxbd8428wlPPHlNAnmKsuLQBOcmEgWTO
	drSaYxoK+JMqahOGf1cilxI/Mi65gsz3Hokf5O/dAksgrLNCqr0EcTqqxbIiDnVtGJ4EfQWSBTh
	17oGYDBEeq+PQO5HfYYsAm83FMjVrIq1lyPDlWEuTOp3qQbBesI8Mk9tbhab4iOynPyHOf6GCc4
	oJ/3Zw4n7QQcgPbwRLAV7+U0RL2A9uN9QsxUug==
X-Google-Smtp-Source: AGHT+IG66JLNMA6/+F4yvPGqakGWzMF6ZtCNetVsbjFv2aPqMbejsIAN56v674i7htexv9OZa2w1UA==
X-Received: by 2002:a5d:5f96:0:b0:390:f2f1:2a17 with SMTP id ffacd0b85a97d-39d1466229bmr14181138f8f.53.1744096672155;
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:39 +0200
Subject: [PATCH 02/10] pinctrl: rk805: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-2-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sUTrzWuOo7PVik1QzFjSyEGMbbgvgdGB1epc3LKWdY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2ZtGmml6ycwEzk3KhRs/YW0AQqsaUfB686c
 +V6uDVoAR+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cttsEACbtqoZ/RYzP/rSItzAm6RyIKDSI67qmiaM3eZO+Qwuz4UvIvJ/GL6pV94KgneXWwmwPKo
 P7ywI2W0szbMsr9K+DM7p2BGeLSS8pyImHtM3ITgmaayPUvVb3Y7MrTj+v9MYNRnjYl5sGRlIjK
 1EmAEesdJqsGiDikg07oXYnqGVad+4NJ2zxDtQ5n7tB3ShEJusRuIFA35sixjIGRTR4Nr+0DmSH
 ARiPMtTFkfjtgsXBEDCv0PRzyup4961wgfvFgQ7GRwqsXxRacjsZAEmoYduAjZjqdJ1dny8C8i/
 Evwq8RUqfgTcjvwjmVDu3klH9BEGNcZX9frolFeag0oRT7/RZHWm0ZxaKaU4rlH/E0Io6pd73nU
 sw0vsjb8AZuD4il5knSflEdQN3RuRoPp/QdnpHdPim0zwLKdIVMyzNu6p2O0tRQGmQi3tJnf6+/
 +iwIO4FrFQOgX9vh4VdG91Tuu+BBuoCRJMWkbcnWF5dZaX6tREBxwtDhCsxPH58+4G5NQgX0XN+
 IJgHJLn/R/KYnp/l1eWewkxcLXRRPGbcaEUJ5lTHuvd6fGpdv0Af4X3rK0WZJ6UwBJw5u6pQLY5
 8YdLZCYvmvA8jSXhIocYAmemyaGKAMW/JnBi6mtMkH5dOwmpnp+SvX5iwwf+9a5m+kDEg4dWidg
 WpA2txNtQ9d547g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001753_949123_1C3CFD34 
X-CRM114-Status: GOOD (  11.20  )
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
 drivers/pinctrl/pinctrl-rk805.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index c42f1bf93404..fc0e330b1d11 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -325,26 +325,26 @@ static int rk805_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & pci->pin_cfg[offset].val_msk);
 }
 
-static void rk805_gpio_set(struct gpio_chip *chip,
-			   unsigned int offset,
-			   int value)
+static int rk805_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rk805_pctrl_info *pci = gpiochip_get_data(chip);
-	int ret;
 
-	ret = regmap_update_bits(pci->rk808->regmap,
-				 pci->pin_cfg[offset].reg,
-				 pci->pin_cfg[offset].val_msk,
-				 value ? pci->pin_cfg[offset].val_msk : 0);
-	if (ret)
-		dev_err(pci->dev, "set gpio%d value %d failed\n",
-			offset, value);
+	return regmap_update_bits(pci->rk808->regmap,
+				  pci->pin_cfg[offset].reg,
+				  pci->pin_cfg[offset].val_msk,
+				  value ? pci->pin_cfg[offset].val_msk : 0);
 }
 
 static int rk805_gpio_direction_output(struct gpio_chip *chip,
 				       unsigned int offset, int value)
 {
-	rk805_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = rk805_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -378,7 +378,7 @@ static const struct gpio_chip rk805_gpio_chip = {
 	.free			= gpiochip_generic_free,
 	.get_direction		= rk805_gpio_get_direction,
 	.get			= rk805_gpio_get,
-	.set			= rk805_gpio_set,
+	.set_rv			= rk805_gpio_set,
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= rk805_gpio_direction_output,
 	.can_sleep		= true,

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
