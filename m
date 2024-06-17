Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E24C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7RYGuW/Vd4KXfQigumJ7eMa3du7RhHiCfp0gcGCkCU=; b=PWM3zRh0RtOP93
	VXn4jaqBCCIFSjOGu0LDWGcafEbQ/00zGMVLrlzTOCyHMbaGOaDxnjT+n8/nhfIOL8GBFB33llEXZ
	/SJlZombza4A1CuhsOJEQ9s7me9jj1a1Hl36zld3ywzHepeY5+4Sg95X/7qtpnvtFPVxKen91BRiS
	bhDzNbnlT+2cHQamV2snfBlmjtjZJwUhTMTgvPcAX7hoj163qElEnG3cOeyi5aVMY5pF6BducC3XQ
	5j4w+ZLvl6GE58MPDdhGJ4/znGI7RB/aSgSaROgvo8B3FMSxLbzVMwX2OQnNArREQtG9+Okw9wHFT
	hBdlFH7dJBywldx3kwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDr9-0000000BKL1-37ct;
	Mon, 17 Jun 2024 15:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkh-0000000AxHz-3nET
	for linux-amlogic@bombadil.infradead.org;
	Mon, 17 Jun 2024 13:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=; b=piOsJVPOG3G5053TzFgDdNL2Op
	+K2Is5jiIaJcXJMeRkt8q/GjKcVlzAyisEVjZsRfrQ48I8Q9SoJgLJtCBr0h43G0l+t0vzn7SfMnn
	WW60iAuNTqaF9U2zWA25zIRWJqC20xY/G7Pzh2YuaYQFb2wQgPLS2Ojn8bxAtRdJ1X0oaz+pX8v79
	RUDLgfM5Qq8RY0TTaFF4sUWJ7eK8mDXssqqGFMSnQFcMVuiqXsd0F9Olnbrpb4DFR0bUMykJMHMtB
	fY0WNtnIzNHydCr3MQZUCdqCTPZYTr2iEqm0nwXbWP3FbbPLac+knYNlfi01wPfYQ6TrCTPm0PDAC
	8BLYv4Ng==;
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCke-00000006R9m-1tYG
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:30 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3d226aff122so2395645b6e.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632225; x=1719237025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=NHLDejAHv3kGcPt+hjxgX4CKd4XX35w2tdGirCE706xde1TODvqIQIzYkuFnv/zkMO
         XvFvEtv3QcYZPzCywGVtItATfgxn80dQYb3hXvVC1y4VLEhb0F6FeS7xbTx15llpXJnp
         l5sd7ZTQ63qU1kpk8RldTcQGvUH1SHatIl/gtC29ouRz5q6mVsH453QYAGMJnCZnJex1
         3H7psrJx9Z+lVMAGt9XmLoNqNuZbN2/J69hX8yCbGx0TY7KT+eseYSJm5Ga/yX3oWFq9
         p0SUm33c7c5HkuPOjPpMQhN2x3/8T5oTO2n5f0PaK1U1aNd0uzfAiwHljvnS/CrkqRDh
         wzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632225; x=1719237025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsjL1PDi95mMX5sXzypBRu5MAqP+mGu/27hW1rxKMDQ=;
        b=rDDy2kGFz5/RaguuzW7fY5UostrD8yQ84tD1PcVQxWTTXhnYF537L3p7kVtPM+K3kW
         MkvH/3J2sV2WRzWaE70oBU5eLqllVgN/YAR+5Ff43w1lwYTDYkVmkm65BW8s5El4WyAG
         /D/2QJZs6vECIuq858iT/x0CGuto2IDzI39E93hCkHnVvpDpBBuQHpLqxkNpREKo3Qcp
         SqW90sLGI5cQfitmyKzuNxhICpQmW4SmZ9CybWMish7VDxguUWNF/eOHX7pLlZkA9dmb
         BssayJu2YVZNg53ukPFfHT4FDjcegLv8SwiIfv8/UJnHjUpPzbZqmwgrDklnoSoMJHvD
         XAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVAUrw/mqeak3o2HwRMqEeyZhxFt+Quhez8ADLlpmmKIzQHm3pQGEGi7DIiJwQhLucolXe+HGxEOttp+WWptd9+s8SE25PIknPy3gYyLdCNq+c=
X-Gm-Message-State: AOJu0YwB9n6Zcr2yd56tfLml59tgyB2uGS+/awleezVQITnT9D90tHr7
	h5e9vdGOs9k5ZMsV21Ha82iAJd2FfK1wult6+yhRGnTDXYhMIqdFEHmt8UuLmJQ=
X-Google-Smtp-Source: AGHT+IFvblxIubOLu7csKqd2DaYsYhFE9mHOS6tHSYRNjsfIzum/J8kKl7oiGVOQ0fHTuqtXTzPk8w==
X-Received: by 2002:a05:6870:d383:b0:254:ac99:1152 with SMTP id 586e51a60fabf-25842baade0mr8855321fac.58.1718632225631;
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:59 -0400
Subject: [PATCH v3 19/41] iio: dac: ltc2688: make use of regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-19-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_145028_701663_9DF52ADA 
X-CRM114-Status: UNSURE (   9.94  )
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9kYWMv
bHRjMjY4OC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9kYWMvbHRjMjY4OC5jIGIvZHJp
dmVycy9paW8vZGFjL2x0YzI2ODguYwppbmRleCBjNGIxYmEzMGY5MzUuLmFmNTBkMmE5NTg5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZGFjL2x0YzI2ODguYworKysgYi9kcml2ZXJzL2lpby9k
YWMvbHRjMjY4OC5jCkBAIC04NjAsOSArODYwLDggQEAgc3RhdGljIGludCBsdGMyNjg4X3NldHVw
KHN0cnVjdCBsdGMyNjg4X3N0YXRlICpzdCwgc3RydWN0IHJlZ3VsYXRvciAqdnJlZikKIAkJLyog
YnJpbmcgZGV2aWNlIG91dCBvZiByZXNldCAqLwogCQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAo
Z3BpbywgMCk7CiAJfSBlbHNlIHsKLQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHN0LT5yZWdt
YXAsIExUQzI2ODhfQ01EX0NPTkZJRywKLQkJCQkJIExUQzI2ODhfQ09ORklHX1JTVCwKLQkJCQkJ
IExUQzI2ODhfQ09ORklHX1JTVCk7CisJCXJldCA9IHJlZ21hcF9zZXRfYml0cyhzdC0+cmVnbWFw
LCBMVEMyNjg4X0NNRF9DT05GSUcsCisJCQkJICAgICAgTFRDMjY4OF9DT05GSUdfUlNUKTsKIAkJ
aWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
