Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E745CC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j71bLT3ewXVsMn2ZZjlEb22NMjoa22JX6S1tbmvOVEw=; b=U5+eguz1ErdJgM
	FzT0MbZzIq3CuHT016OxtAdqWr/VxtnyX1WWXc2UvD/ATb2S5t3l0gs0VVSLqqjcofkQpd/uk4Ilz
	p/QelcNhfPGQn6uU9aY+ot4aD3gE+aiidyNHNparoCB5FVRiXCSaN3lHwL4X0E/KNezKNbH5a8Mzz
	9rV7V7CxJrkCA8rL1F8328nYe5QCkpEUVh7YUeLHJj3z5ZRD3iUKZIKmmM19hTnLTZwxP176MBhdQ
	+qAtZb53HQR1HCKrgI0hezH7iiOoIBfCpOUJGF9nx3KH5vTmmT3NhjCBd2s7Dv4h/Wvf1qOIJXazE
	VfOQ7ZT/z/nZrOMMTgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnJ-0000000AzHN-1zf4;
	Mon, 17 Jun 2024 13:53:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkx-0000000AxWs-05CY
	for linux-amlogic@bombadil.infradead.org;
	Mon, 17 Jun 2024 13:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=; b=oFbsXoGwUMt+azV83qbE1P1Gwa
	rcQpZm+Scr/nuIZNZ0nPT+UnTG+5yWL+1vnistVleboYWKK++Mhd3UGWX7+Ch1OwYthYl7+df+Bmv
	D5FhiwTs4I5H+42vnN1RL8no6NwiHXyqDZTqTfVux6apsVsJT362KnXQFYgBAljrdm48HV0VD5LgH
	T5IkZYuHgQjaR91YB3KZycy/IdFO3nbAM0XjePQpVLeJI8YrIWwT6LfKc3y56F0dcgctwDigwqj86
	bH+aW3Q8jPOxU128wJon3F7a0tu9JD2cXOeaimlj0HYLhqXogQdgAAflNmCQkgfUC0wMcG2CsR8mP
	8VHYRYmw==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCks-00000006RCG-2z3w
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:45 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-795fb13b256so419738585a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632241; x=1719237041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
        b=kStuCXCqRJ1ZA9qQ1TjxEUqnfJTLXF9J2N0zMc6M5BtPTeUmeYgh/mBt7Az74QMQx7
         pFsa+2YF1WwvxfrXhPnsKzkgCv6Kp0hY/UYTEm8aPhioAS4ZhOryxfXOERIluzdeKwtE
         Virid5TMEaWny+79yjInDzuMEzC1KaY2WqTL2fGcSx8F09DKVrOkBO5kueTSjHOSecro
         fU18bJARcx1XpVmXmQsHnkeKDpWR9hTyFOgw2k7L0U5HLgTMMRfKwcSML2Tv6o9w3i/5
         pcN1B5dnI6BuogxlQzNDBRoNAwP6dymYBJtslJdGA2VWUqs1bKM8OFViqRom82JAB7qw
         BycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632241; x=1719237041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9IxtXAJpg0zoHi2O9sRGBPOMzr1DfcZ9EisZFYQElQ=;
        b=CAYME6abnhXqLxcsg9tGyW+3yDFM0lIXpVw6zAJk8A632u2EaVfXaQIWAsI9rwDg3o
         KDCx8m1Pb+yDDYLcQntg/ocMQozbgziDH1VMFWZK39b4WEi+fXyeDN5drzxINyD6u4Ql
         n0qqK+ZM7FqjM5h2utAgLR6N4QF0x7DxOWjASrE5sLq0/xVC2PHz1rpRRwOR5nA9x56U
         3mbC53N+SudI47+DpTcLJOgfk/MnCZrXMmped/zid4PD/fIN0xu3hCJRYuAvi+vmPkzp
         UV6+NDSXX3SWPPguxNKrodKZvtnC8izcnMMG8y2RqUdBBxS/YkvZEyQ6+xmnP3fzUlmi
         Ox5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkBMl2esKP/9os1cW5q3nfwKg9TqMMUEqAIxWY4w0VYb5Igprhq1rMR1hCVKvHF1idF++B9wZStV6URRn1Jwa+EUOH+x7cBMSZkaPkF5tu4pY=
X-Gm-Message-State: AOJu0Yz3TQ6SMPeZlAjfER2mWL57vCXQPXkQnZIAgpELGdp8vVUq8DTM
	JrR/v/0fWNXV6EFqT/+2Co5KyDFI2d5H4n7qNws+Gs7H3mJBSjDzJdXHw7rqUtE=
X-Google-Smtp-Source: AGHT+IEvNWEsHTIz+Kh5SLMDJk99l/NCyLAOM78IKPUk0tI5a9ZCslYv7WlkhqmAtTcQfPh0VS34pA==
X-Received: by 2002:a05:620a:2981:b0:795:5469:1b32 with SMTP id af79cd13be357-798d0242f64mr1752044785a.18.1718632240726;
        Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:06 -0400
Subject: [PATCH v3 26/41] iio: health: max30102: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-26-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_145043_761701_58297B15 
X-CRM114-Status: UNSURE (   9.24  )
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9oZWFs
dGgvbWF4MzAxMDIuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAy
LmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDIuYwppbmRleCA2NjE2NzI5YWY1YjcuLjA3
YTM0M2UzNWE4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAyLmMKKysr
IGIvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAyLmMKQEAgLTQ0OCw5ICs0NDgsOCBAQCBzdGF0
aWMgaW50IG1heDMwMTAyX2dldF90ZW1wKHN0cnVjdCBtYXgzMDEwMl9kYXRhICpkYXRhLCBpbnQg
KnZhbCwgYm9vbCBlbikKIAl9CiAKIAkvKiBzdGFydCBhY3F1aXNpdGlvbiAqLwotCXJldCA9IHJl
Z21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIE1BWDMwMTAyX1JFR19URU1QX0NPTkZJRywK
LQkJCQkgTUFYMzAxMDJfUkVHX1RFTVBfQ09ORklHX1RFTVBfRU4sCi0JCQkJIE1BWDMwMTAyX1JF
R19URU1QX0NPTkZJR19URU1QX0VOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVn
bWFwLCBNQVgzMDEwMl9SRUdfVEVNUF9DT05GSUcsCisJCQkgICAgICBNQVgzMDEwMl9SRUdfVEVN
UF9DT05GSUdfVEVNUF9FTik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKCi0tIAoyLjQ1LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
