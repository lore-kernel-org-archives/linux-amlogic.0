Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D719DC369A4
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRW/HW8tIuuOmph9+Gbg4ApY29rrYn/BemXY9k+e5Sg=; b=BOdyvDNsZYzsDO
	/j1Z1XgtLvrDpNHOaaIWMRYsIZ7+BuUWUDrLueEVe8TxBJOwcDdivjMvK/MlngL+hPYfdsfZHD+hl
	n+1ds1zfGtkTsZaMHIQUR/kalnC7CuyZPIz9MVrodyV1a7ZCh80NG2oyAw9BqvctUKdRvl6WIqm61
	+NNwplx5tAMZ+hH+EUX2qqYIdYzui34iLvpJqtfSPguzp5S6l6skouqj4mh4B4ejbFttfp1Gx8OxS
	/VvdHxR4JtWptM+hxCFNqsvh/W9s7JBbU6o4zLXcx7G36c7dfAvP47JlwXVZEiWW3evMXU0NMDKFw
	1g6BO2YRRi+s2oQByRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Gz-000000032OL-32zk;
	Tue, 08 Apr 2025 07:21:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23DW-000000031eH-3bBT
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 07:17:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf680d351so36280015e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096673; x=1744701473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=WJww3g8PjrYpTaphVdOKHc2Nh+nHI+oACWaNsBvm7Y8368n4bE1nmqz25mkgitMVrQ
         9yd4i1HdD017vEtzjOe73UjN7pPUax61onolN7YGmUzSTtqwCDZgEqJ+IEyKt+fIa/1U
         yK7ASpQK2SFrM7WF6tYz2Jcxv+GYM+qkL+m+Dfd3C3+4yHI1Z8D3Z5nbroLVtRQtlG8V
         oRkL/qJFGG+TV2ACQlmB96tm6JyAAJtVluz3H7uD8KN49mv1QUZwRTkDBwsk3dHXt/CZ
         I7+GNC8Tfclofi/kfGZLDrtgf0Cy5QOCVX9MehN8F07B6dnFX/ceAZfd/GWrkK4TmdtD
         iOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096673; x=1744701473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=Lh01UbRu+NzXq+BS6zitGmad7SWIL/w10nSc65h8XanlTdlA366QDTFWjSLhZ/ge2L
         9OMxdcO9X/N/8n0+DI7pq9lPcThFDKELHxhoAExIKE07zMwAjGALH3quZltAdTfFJd5W
         Of1kCrpp6Joimtu/Exh/zQCezk0CJK75WBL/NooSEE89Zc9xQKd7OVJJdqp15IS4j0qP
         yrgZpAboYdNrbFsNJyi5CQwtsd5Euq2wSIGbhDUqah6jtDeeXtQL94+zCwePptXkKKL3
         yU97wpy841PNwnU+4VeVH0JwTTsLnMdqewh/kKE4RDoqV0S6GDhRpoTFIJarZdufiNA2
         uorQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxZqb0A7MFU4w2bL+kAzgV6+wTLHuix3d8uN+HoU1LfWe7XJnz43PAyNnid5ujqAt/GPE9MZDXyMGTB4eL@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVtTGKYWyOIQvjoudl2M3wn6Fx/LES6WIS8NMyvVkm1cBthnl
	Hw1iVKQxDZ5WRmBnP8iIi+VWFXgEl0P4MPYWq1SAqQkHhzLOozIiV4K9EVpMca8=
X-Gm-Gg: ASbGncuBwU7xnADcRpUjMjclL9cAPznhWDPyAXB7dlr6FH3yu4LYRZvy9jRi3ZXNOda
	fay7aF1P2RbNzc0/yRNjln/T6wgUXmw53NdoTEFqF+sxSGNZ2X3KWHCX5SK/47N34SSOJd1y+GR
	60CFq3InDE3d5lmkbLHuKDOn32KcJX73KDyoOweO6p6setuFk8YC6Z0MPPQB5H77DZOPgV3K8Tv
	DrA9ccMYVXErJ93++4QC1CfZRjGiLiJHMKw3G3EPTJqTTlZIuRX4ZRWDNEUhuJueg1Q93OsBZ2h
	He3/3iBtPQ+DEFz2zwd7y0mdbTzGAneZB8Arfw==
X-Google-Smtp-Source: AGHT+IFIDoEgtgjZmRm76oLe4qBixaJVFcxIWBxSgP9eQc/+muRPjB5OZ4DhcXqFSFfMWbn8IPCLNw==
X-Received: by 2002:a05:6000:2484:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d820eb1f9mr1593525f8f.25.1744096673169;
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:40 +0200
Subject: [PATCH 03/10] pinctrl: abx500: enable building modules with
 COMPILE_TEST=y
MIME-Version: 1.0
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-3-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7gT59a+ieEBoRyUfHtp8d/jvYbZrPQXR8M3Rkb54480=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2Z62HjgrUOk13umM6zCKtt5wsF8hMyPqGii
 +FbeYzWZu2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cr+9D/4pVK6myjhrhbvOnoR4PHJ367IIWOAh/Zh8cc762qftCq98AjRSHWjpi3KMWk+T1SoewR6
 yd9FAaYyN5ggStwHN8ifchYiv+JA8sO+i6UuSIOQUVQzey/SsbW1SeTgmZ3o/GsdKPG/HjoxejZ
 M1kbfrXMCRWGU5zTxGwLAZl126dUhXDTKScOqGDG6ZLFctZH0MSBmu4Nu7uWpRWQK3R+Xr6OGfa
 +BSLVhz77RThlP5bmwNejIlKFQNdlTKOpKLwZ4d0FEN5QJPa8Epbb+Vvkputkda+ERCCbCEvjf9
 8ZSHC0SCNCcLyorbyOA6rgYWiPo+GZMHSqoF/Pl1OFZzp2mCtAXPyQrKJ2wv0I5KYUJSLuNstbX
 pAA8HtMWVKN2o8VTfFf0kYbEFAo7BM5D+3B86ctemR78XtjX9vA/33qPRw6qbRuWNjF2jLMxwGg
 7sr3CLWFwcyqt8oNdhyjEWmfnIO2z+BYPCo7Btr52pKon7rbGIyJAAG4gxmUqgjRO/PJ06aCPjV
 erKdtcafZvxLT9Mf2jX/+expNbOTo5PKgOvekHmSlI2xdATbBZgMQPxFNUNJVlXLL3UGV8fR/Zh
 +ApMwVs12NjHuf/sT9aZDxPH2zbKJvARpXLKynmGD52HIn+u06LPHHbZH2+obwAez7+Tde1ydSJ
 G1AuErL37JcATMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_001754_901529_E2C07461 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the abx500 modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index aafecf348670..2c1f8a4f5d24 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if ARCH_U8500
+if (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_ABX500
 	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
-	depends on AB8500_CORE
+	depends on AB8500_CORE || COMPILE_TEST
 	select GENERIC_PINCONF
 	help
 	  Select this to enable the ABx500 family IC GPIO driver
 
 config PINCTRL_AB8500
 	bool "AB8500 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_AB8505
 	bool "AB8505 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 endif
 

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
