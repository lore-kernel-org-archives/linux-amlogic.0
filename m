Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4633DC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAKJcn0PYzxiAcxEcEJo7UjFOo/7VFRuqMv09dDkxtQ=; b=VzKJy4FUxCwxfS
	Ckbziv8tWLPfifu80DXcLiPnBFOGONCppk/6SNy1YstvoxB2TbLziYWd2kvd5atZYn1DluvbnV4KK
	wBvc0mbqeM8q0EKrsybdOpDTOqrJfP/OetEXPow3P61c7itvnUAWATwEbKiGCmRU4/MuXFNaKim9F
	gJ0KtS3GNZ6++1QSRHzme74ueIyhrJuQwyYkKBYvw7u3G++oCASkp9bzXxy/p8taAKsVHBwRzSUBR
	HMTo340caRqDxvDh0kmc/bi+i1sE+pH6NJwMEqWwToHXLC1UjZlYiIFfr/ydBCKo7wW5lhdz1MCaz
	mNJyo6sa37ZZz270MTCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCoM-0000000B0Af-1do1;
	Mon, 17 Jun 2024 13:54:18 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl8-0000000Axht-397n
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:02 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-797a7f9b52eso343353085a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632258; x=1719237058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=MWz7Dyl+VRGMT3tw8aEE19MSPG7Dt7nlCbHV61JNrfNYNw8IiwKuhyCo+/UBbvh7VR
         lxUvV6WjF3rTSDEnRj6ltNiAdCejOQGvXmLlj6SATGGirdK6RDhDnxqFGgD1OoyqU1sm
         gJ9GeWYNQeHmBYqbZe+OGpSldR2a7gLbTBptyQfE6Irf20i3e2YcSwvlD5LL1ZPcZtOM
         EFxZccu1puuFG8kSrcRmFTJXttrm94t+f25+oRKyHTYeaY/IjDHNfPxRY5YKrb7tmDRH
         TxzyeDIW0NaTGfGhNMpZjVA8mFfLyb0MRkHsNZ8xcdA3fWZHwSl2s8ZJi882fgC9/k+I
         wcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632258; x=1719237058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bd9TIH+WbKUd6xwGH770DEQhZI10Wa7zRAAyumCALaY=;
        b=fhmNLHbC4VbrC4Aax/K37rSK0XPySMDXwFKOHqDUORNkIqUMktLrqH2eKXHtj5L5Dg
         kQIbuhZXbBfmejXmAzBZrH7rCFvqxYzknCV1plsa3yCVfzU6WRyqrOjkYE/rgKhOX5qR
         iBiGf0agGMIqlSxiJEil+/5ApjH7ORoMOe8Di9WV/u+tzUCLBrmLu4eHpVjPt3hDt+h2
         ESd6oXBQwXU8XBpEzVvGh0ZXAfWBT06maJcebgsTlrqm4yB9vtZefKQGBpq43Dh3eXVi
         zKFFW7OJcfsz/AjqVAcqvMgbHz2CThn4bvy54jhQc2AHKLkwBAbMpqjUVN7yZUEZh9jJ
         o2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUfqfsj54xLF3FcvkqZRsAixMG72A9HRQv85EcoJJ4+kBpcdmgIgzXwQzNHnOdq+4sT0+i7W1HGPpMP1uHTm175R682gbCsq32KzIqWMx0uJ7k=
X-Gm-Message-State: AOJu0YzY5ilcmxNJxGnHsZiMazPs05pmpocntUgrPY0hk4u/LwRipR0D
	rk6fC3LeSEBV1NK/K915T+/q/0ZgmlGtuq6dGYeP3c2my4G1DeIz4i2MrTzppiE=
X-Google-Smtp-Source: AGHT+IHIgplKyy0pftg/5a2SG9pITo7fxr5SdNNjpCXiI/wTi4jbCSV+DPabl4pWpKgzNJgkUownfQ==
X-Received: by 2002:a05:620a:2684:b0:797:8ee3:9f01 with SMTP id af79cd13be357-798d2437ce1mr1017310785a.34.1718632257705;
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:57 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:14 -0400
Subject: [PATCH v3 34/41] iio: magnetometer: mmc35240: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-34-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_065059_274912_2FD9608E 
X-CRM114-Status: UNSURE (   9.89  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9tYWdu
ZXRvbWV0ZXIvbW1jMzUyNDAuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vbWFnbmV0
b21ldGVyL21tYzM1MjQwLmMgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvbW1jMzUyNDAuYwpp
bmRleCA2YjlmNGIwNTYxOTEuLmVjMzVlOTU0M2E5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8v
bWFnbmV0b21ldGVyL21tYzM1MjQwLmMKKysrIGIvZHJpdmVycy9paW8vbWFnbmV0b21ldGVyL21t
YzM1MjQwLmMKQEAgLTE4Niw5ICsxODYsOCBAQCBzdGF0aWMgaW50IG1tYzM1MjQwX2h3X3NldChz
dHJ1Y3QgbW1jMzUyNDBfZGF0YSAqZGF0YSwgYm9vbCBzZXQpCiAJICogUmVjaGFyZ2UgdGhlIGNh
cGFjaXRvciBhdCBWQ0FQIHBpbiwgcmVxdWVzdGVkIHRvIGJlIGlzc3VlZAogCSAqIGJlZm9yZSBh
IFNFVC9SRVNFVCBjb21tYW5kLgogCSAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRh
LT5yZWdtYXAsIE1NQzM1MjQwX1JFR19DVFJMMCwKLQkJCQkgTU1DMzUyNDBfQ1RSTDBfUkVGSUxM
X0JJVCwKLQkJCQkgTU1DMzUyNDBfQ1RSTDBfUkVGSUxMX0JJVCk7CisJcmV0ID0gcmVnbWFwX3Nl
dF9iaXRzKGRhdGEtPnJlZ21hcCwgTU1DMzUyNDBfUkVHX0NUUkwwLAorCQkJICAgICAgTU1DMzUy
NDBfQ1RSTDBfUkVGSUxMX0JJVCk7CiAJaWYgKHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAJdXNs
ZWVwX3JhbmdlKE1NQzM1MjQwX1dBSVRfQ0hBUkdFX1BVTVAsIE1NQzM1MjQwX1dBSVRfQ0hBUkdF
X1BVTVAgKyAxKTsKQEAgLTE5OCw4ICsxOTcsNyBAQCBzdGF0aWMgaW50IG1tYzM1MjQwX2h3X3Nl
dChzdHJ1Y3QgbW1jMzUyNDBfZGF0YSAqZGF0YSwgYm9vbCBzZXQpCiAJZWxzZQogCQljb2lsX2Jp
dCA9IE1NQzM1MjQwX0NUUkwwX1JFU0VUX0JJVDsKIAotCXJldHVybiByZWdtYXBfdXBkYXRlX2Jp
dHMoZGF0YS0+cmVnbWFwLCBNTUMzNTI0MF9SRUdfQ1RSTDAsCi0JCQkJICBjb2lsX2JpdCwgY29p
bF9iaXQpOworCXJldHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBNTUMzNTI0MF9S
RUdfQ1RSTDAsIGNvaWxfYml0KTsKIAogfQogCgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
