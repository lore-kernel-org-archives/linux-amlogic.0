Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB49C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZldQVknX7A1fT+Dk9le3szaxWPs3dos9cm1iksar+Ik=; b=U9ypaIsC/wdBzp
	dWZQanqM5C6hDAGm7ZIpMZwhfJlpFhkji68F3YVw55p8NhAZeYovrWxTXN5P2BjB9kk3KP/GspCQo
	wACeAJcOq6LRQkwHnRVPpwpN3JjCPfM846SJtrIhkB6huAu+8NOW0iqkPHviibPJ/rXfjsXh8UeaW
	khAJrr0m2nu0P0o/Dil+e1381ezgsm4h9+6S6CbqAntxwSFa3ElxP92NiwpmyuDwFue8dN4du6Ss1
	jwGGxrZRsq7PeTu0rfE5VNEQGdQS1TkbGw7ygbjJmXaNmrdu7geOyQNY1peyB4+KotQ+Kkb8XXoGs
	QenpNETyOz5v37Mn3Hsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkV-0000000Ax7i-2wtZ;
	Mon, 17 Jun 2024 13:50:19 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk8-0000000Awlm-1ZO4
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:57 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-795fb13b256so419680485a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632195; x=1719236995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
        b=DENyv7BI6gz0r+lI7wOQfQ5PznjHP19nJOH6y7Ni7xtXbpuHKOXI+Omdl0U3G78avv
         eJ8hUfzBPT7BqpFH8objYMTcVu0fEZB+rGU2ktzjNHqlciApm5qiSTjV/YwQEvfSzshK
         5HjrewBAZzH+1FabTpPgUrlRPMp6EOA0EOKhFQNHCH5M0/19mvnVyoWwlvHrkp3AcKCk
         uul0Muhrh2NYqxFqd6VrUGDpkeAU2/Dtgsxr2toqhJ+cNN6j8NIf+oLV0k0IffRRdqHb
         M0TVHredsAhyqol4U61P1sSyak9enuFg6RaXOfZOf2EamOv9GiiNnMur2spbqWZZOn6j
         rAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632195; x=1719236995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sTXUSoBs+YlsgH71N9X/wOixyDVYk1BR8pUCCabPaI=;
        b=wWw4cPYK5ljadhzFBhewlPNoRCd0i2d7z3jd0PWA64Qun71OGaM0vk31u9F0aB5g0/
         4dhs23/BXj+IXZL1/LFv13lx7/GuCRhblZqAJCX3gpW1Equt/PsQgMJYXIaQTvVORiRI
         t+GoZLEriX3ITY1CPJ3cJliq5x4jiUaJleX3S/E9ZroXA2zDDFgrClNuFkyKGZ61SIrf
         lYYaH936yZNaD/o2kgB8mjpmsyfDcQUmsHGqp8+IzC25T6qYX09HJSNN3pD7Jf9bFTja
         r6uoj2Giw1pSbRPDjE/xBOMz/rWXI886ZH4cuA8c9WSAd3Bf90F1Hey1XRBJz0qSRbic
         MiJg==
X-Forwarded-Encrypted: i=1; AJvYcCUXhCSnzwruVYpJdAho2Kmubrc33wn/E9cusGzmw9TWTHINbuM8PoOzni7xWUEF2v0/VvdbBzu0fNl/rwmeKVySQ76YLzaNhx0We3Efc20usyY=
X-Gm-Message-State: AOJu0YxbgZmePA09xJKaqRnLISCoMnZsAal//8+hQIfERHPZ23Zu7N8v
	kaUSksbotqF9dOYpvbGlQwj/v2nhxC5fajMc9YMOKbZRyPptw7q5e7JqkysptgU=
X-Google-Smtp-Source: AGHT+IGjHbBOrTl20NthbniN5xVzM8rCge08JoanAoI0amw+zX4G0dqtT7iYT1wcjjqa5iiFtvInEw==
X-Received: by 2002:a05:620a:44c4:b0:795:5b00:edcb with SMTP id af79cd13be357-798d0243396mr1793084785a.21.1718632195400;
        Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:45 -0400
Subject: [PATCH v3 05/41] iio: adc: axp20x_adc: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-5-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064956_461287_4C20010D 
X-CRM114-Status: UNSURE (   9.30  )
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
YXhwMjB4X2FkYy5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYXhwMjB4X2FkYy5j
IGIvZHJpdmVycy9paW8vYWRjL2F4cDIweF9hZGMuYwppbmRleCBkNmM1MWIwZjQ4ZTMuLjAwYzFh
MDFjYWM2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2F4cDIweF9hZGMuYworKysgYi9k
cml2ZXJzL2lpby9hZGMvYXhwMjB4X2FkYy5jCkBAIC03MTIsOSArNzEyLDggQEAgc3RhdGljIGlu
dCBheHAyMHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZWdtYXBfd3Jp
dGUoaW5mby0+cmVnbWFwLCBBWFAyMFhfQURDX0VOMSwgaW5mby0+ZGF0YS0+YWRjX2VuMV9tYXNr
KTsKIAogCWlmIChpbmZvLT5kYXRhLT5hZGNfZW4yX21hc2spCi0JCXJlZ21hcF91cGRhdGVfYml0
cyhpbmZvLT5yZWdtYXAsIEFYUDIwWF9BRENfRU4yLAotCQkJCSAgIGluZm8tPmRhdGEtPmFkY19l
bjJfbWFzaywKLQkJCQkgICBpbmZvLT5kYXRhLT5hZGNfZW4yX21hc2spOworCQlyZWdtYXBfc2V0
X2JpdHMoaW5mby0+cmVnbWFwLCBBWFAyMFhfQURDX0VOMiwKKwkJCQlpbmZvLT5kYXRhLT5hZGNf
ZW4yX21hc2spOwogCiAJLyogQ29uZmlndXJlIEFEQ3MgcmF0ZSAqLwogCWluZm8tPmRhdGEtPmFk
Y19yYXRlKGluZm8sIDEwMCk7CgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
