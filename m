Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE10C3600C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SBNrJ/vt3s7i3e3GgTMma3BJSEzwGqR5q6GY3gqnofc=; b=mYt1blvch+wdca
	ohRHtPYIxYXRlsTHGM+wHJ8l2ZceLIgMGWNCg7DXxMrTpJ6FAxhY3YHg4v8nheuSgZm099eYJaVKn
	JgehQDaMNKswoRt66kQakYDmFjks9dda/3UAAaiURCcg+xQ/u/+n6zeDKjI0uFWOThQYEOiQ1fzcZ
	YckWsmf+TnjPT7Pp3aGl4XXIQKJ7QgmB29HANxBjhL9qkdM5q4Ba2PxFWnQ/hg25hjP0lWVKsw98F
	a4JL6Iamg9q0G/Da3MACEkSGUcdp9W7m+O1BQ4MKH7Xl5/t3sHm1eN0hXuhFSt+e+bJ7XdP7tfyC/
	+3G+lnyzfmo7VlWyFmgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DW-000000031eq-2RUJ;
	Tue, 08 Apr 2025 07:17:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DS-000000031cg-2gVh
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ede096d73so20958315e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096668; x=1744701468; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yx1TIqghntnSkzos2ma1rb18OugfZ01/6UPIvIRogGo=;
        b=dwRfRuyYaGClG/HU4ejd+ooZ9VgNlK7zZ0KyFj0+ojSQBO/sJWhQ1Tsa/2eRCCA4pO
         FLwHkV3r/iBSejC0GSGLLM47bzJfg8eJ0Vb0YjrdcbtZfBNJZsSN8hsAw+iIAouGmRYB
         tPsc79emQohlbHYRQyI4k/a7B4skNkfiU5wxxXR526adid0vLmPxRcX3aTY/Lfh2quBs
         eznU0ieXNnai1Szty26y8b1HxT4qj+Jntkf8Mf+ob46ZiYiJG1SBTs7GSdJJ/sU/jF06
         9g+i2SWtG8copIlLuZN2QBaYHkaazUyfWhb4L2MhQ3D51Z0yUBBGJMstbINpDYxD+tx/
         zn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096668; x=1744701468;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yx1TIqghntnSkzos2ma1rb18OugfZ01/6UPIvIRogGo=;
        b=M9pyuUvOSPAJyoJ+Om8ddZPzy453EW29YYjzfWv+jWl1MIX3nJS5dxg2ZCOgYJ3rnW
         UDl9Mbz9ruMuRvURuC6xcH4iOg6pcN3JYMJfenvndawl1J+mFg3seg2GhmfYWXNpy/GV
         KE7DJc0YWm9yqgZQIK8g1ynzi9QiJ2IDDvB7Otm9nvBmUilfM/yCEdkEDZmuN6q+vqCx
         gIwklDRTD5FibD4Z26qH7by1iqtrFNj1PzJHZI9Um11XYpqOkho1tIxL+EavERbG8J6c
         zFCJXby6Yzc6cX+HfNTAbRNP54zD+9eCA/ZSrCYM0q9HDHY/A+Wm7Vv2v6hjsx7xjBz2
         yBCA==
X-Forwarded-Encrypted: i=1; AJvYcCVCCSGfQX0MQE+8eUzayEw3xsKFeh5fnphG6IxYMgw60YPK409pRevGCVa0jEGDx2oJqnJwsG9XkcuHKL9C@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0nxlKXIjmEgLSeEAJqFd879rGrLht9OqIDw82qwxN+gY/cYn
	KJuXAyo1EF0h3MPXe51cYP+PtuXor/oG+0fsA0/D64x3kvp6OEGP3+gts7nZ9yg=
X-Gm-Gg: ASbGncsGJ60LXH9Ddtnb7e2k36yGpOSbP9MBlP/lV24j1thm1hL2h2pIZZD6hL0T3OD
	MtmnEoE7TIns0b47TVLyvKe9+qFDPzVaF+BL5H3VR2cukhiR5iLUgcpxE+MvAzdXO2mbs7lLdJM
	lF1ErGrmZJbYjpdTTC9Y7rtlYuILhqe0VG0SE5dEDXxZjZJx+pAIPZB+gKrviJEIegjZJ7u6P6b
	cV9W7ZFycv+oGgdj+2IX+TIMBJsiJtZRJhxukkIT5AvBuVB6eQy1S2z4zw+MiLYy8IEfg6o14rg
	vVu/pfKn81egglostYkDnYzFRUW3RmSlDHO5hQ==
X-Google-Smtp-Source: AGHT+IEkbTOHKioAtONGgwkvAsGOsKfAqzUbUYimlR3mk/qE5gxQcFOeHUOtlCWwIcIjPL5dhBZ8bQ==
X-Received: by 2002:a05:600c:5394:b0:43e:bdf7:7975 with SMTP id 5b1f17b1804b1-43ed0db4aa5mr109160625e9.32.1744096668295;
        Tue, 08 Apr 2025 00:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/10] pinctrl: convert GPIO chips to using new value
 setters
Date: Tue, 08 Apr 2025 09:17:37 +0200
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJHN9GcC/x3MwQqDMAwA0F+RnA003RS3X5EdJMs0IDWkRQbiv
 1s8vss7IIurZHg3B7jsmnVLFdQ2wMuUZkH9VkMMsQuP2ONsuvGihlkK+o6miYuvaJMXQg5CQsO
 LOD6hHuby0//9j5/zvAB86B6ZbwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=URqhQAHIhJ98p7iATPuB6NMM3MUefZcysEx+qAGhUqs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2VxiGLfOGc8w7N9uwqlmDQaQy+QYBveZRbX
 IiqtfRBBzyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNlQAKCRARpy6gFHHX
 cnsRD/9ICdXa8mwRQHn7n5c64t6ndqQWY8pEkRiqIbPQmkznn9iJP58U1NzQQ8sefnwUleqgAEE
 R5FhdR//yzS06E0Ysx0XCDSeqHGzP5jCtZhVqs6swdonrx3uWzWjg5KKLb+rERYLO/PQ2DHua5q
 Q/j8m8DsnDyNbSyxT5fdV4QgwF0n4f63Lfex3iZbzKr/xapVvgZuEIsOKLHwPE7/mzUO6y/e5Yj
 HcHloTKFv/uQHvWbsZcAgFM/QtH2SGQip3cdTnDr/KcSIH29DnzdoXka4ZxVHL4iAapQhhZVUJ5
 m7y3e+r4jHZEsTI7agyFD1QUfvzFDT/Xdrz0WmEZU9ChuHEEMedVnuDjPxJwtZd5aHXI7IOWT2Z
 329DjZ/YDcVXMG4I9X6e0nbLFIEjyJdoAXOwVUmab3gVTzLQKqLbMq1+17hDJ4U0zDX3HZ35Vko
 yHsqspCRKZSsmnXFjMhDXr0EBqhWfJ+GO9eH2J8FuZMxf/lSHqmWWc7p9WeV6a2xZXKxeHU3X9C
 XJIJZAMqh+rv5lFnE/iaTBzT180rr4tNSDyO1YSx/Zb8NL+FVg3ODUkOSYCZwfWXX/0z6OEGnoH
 p3cEU9ef8U6YcFbt+uPm+pdhD4QY/KaM947VDfxr8SK9xopbXadzRaI/lAAa4kqwUd5OFwtIexS
 oJ5sbidkFTFEqUA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001750_681869_A4D4F12A 
X-CRM114-Status: UNSURE (   7.21  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
the first part of pinctrl GPIO controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (10):
      pinctrl: at91-pio4: use new GPIO line value setter callbacks
      pinctrl: rk805: use new GPIO line value setter callbacks
      pinctrl: abx500: enable building modules with COMPILE_TEST=y
      pinctrl: abx500: use new GPIO line value setter callbacks
      pinctrl: meson: use new GPIO line value setter callbacks
      pinctrl: amlogic-a4: use new GPIO line value setter callbacks
      pinctrl: sx150x: enable building modules with COMPILE_TEST=y
      pinctrl: sx150x: use new GPIO line value setter callbacks
      pinctrl: ocelot: use new GPIO line value setter callbacks
      pinctrl: cy8c95x0: use new GPIO line value setter callbacks

 drivers/pinctrl/Kconfig                    |  2 +-
 drivers/pinctrl/meson/pinctrl-amlogic-a4.c |  8 ++++----
 drivers/pinctrl/meson/pinctrl-meson.c      |  6 +++---
 drivers/pinctrl/nomadik/Kconfig            |  8 ++++----
 drivers/pinctrl/nomadik/pinctrl-abx500.c   | 12 ++++--------
 drivers/pinctrl/pinctrl-at91-pio4.c        | 14 +++++++++-----
 drivers/pinctrl/pinctrl-cy8c95x0.c         | 17 +++++++++--------
 drivers/pinctrl/pinctrl-ocelot.c           | 17 +++++++++--------
 drivers/pinctrl/pinctrl-rk805.c            | 26 +++++++++++++-------------
 drivers/pinctrl/pinctrl-sx150x.c           | 23 ++++++++++++-----------
 10 files changed, 68 insertions(+), 65 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250326-gpiochip-set-rv-pinctrl-part1-c0e1e1891c24

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
