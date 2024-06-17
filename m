Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6CDC2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOYYIaGQSUAaSr4e+aKTZieRH2OvyJZtIrOMfp9XLxo=; b=c4N4UJVlrjf6r3
	0rTKsP4nz3X4JG9tTXQEmMNtK2bhWa1rQzrmFRg6alKIIKml243rBB6iNl/2DRseiVe3SSAW3tfcl
	yIUqbDffmgcKx6VBtwS+ZD0SKBUKn5BdJfshev/7WPnG/zkxSmx/eJ6zBEb41q4fnbup9WYHzZ2TE
	mUamMP90yjXeI4SO9ahfDRdSoLir98W1p2144spxoqujpeB3CczLuxOl7CUP3BJu4ue/XFg/xGHtC
	KAYhMlSZ9PFLRnXJt29mYjvgt3ETzPDvEwPe4Ayv5Gt8A8INsSZYjZnqyJjJ0550irjMSKiJj5xgQ
	RdyP3DncVngoakj6MksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCoG-0000000B05s-1Hua;
	Mon, 17 Jun 2024 13:54:12 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl6-0000000Axg8-3iaY
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:00 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-797b24b8944so418430285a.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632255; x=1719237055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
        b=wngAor7BnaQyPzSHvwXGdPIc3JMqy6/6TBk82G5G6YB2XH9Foat4jH9whiEudDB9YB
         o+wpcDb0VIv2i4kihQmgwGMZh3ysAKHHgeUVtuO+4nXqYPVvxJt7TO9lt9m1xzRXz3QF
         PXdpMkEC53SVMXaCqAx0mouWYaAWBlDx98HKEQVaEzEZ/PpXNn5BRCoT9CoJZ8NZ3BOW
         //xjcGfaM78pA545PRfaCdtg5ASRBdwiNVAxsj5EcCMRdWyg95VIj9aOIouhAAHfV+Zz
         b3P+G1bazUlp51aVW1kXQLXscjbhmcwX+b85HXehDumI62dS60I59HZMGs19KkiQf8yh
         H/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632255; x=1719237055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia4Z2qLqqNhVaFO8MtaqZtGEmhpmvSbj7T0WFgyfsq8=;
        b=K4rdS9kL48CbnTOIblZWdYIYRQWeE3kOZT0P4cpjPxOm1Yk23VuXALPexge67dN49c
         m7KVuQmFy7spQBxF0B0rWa9mMtPCjVup5aP+xr26yBaw+y8OwvuU8SH+gLRaEswcib7b
         l3losfgQwYGPUxX7cym/FICVI3b3C1Uolxd+58HFxP5sFiTI9y1znANBn3PlitwU2L6m
         W83Zn1aE0TinzWTA2OQYInrP9S4vYvaLK17zIfxNvT2xapAHKiEy7wuoPMrWrwSpg4pI
         8BtMSV7KobTQVAnhLQ6VyJ3xX9CBvIbWaJejMMk7PzTIORGdOVyn1wPrtEfJx7kZ1klv
         7ctw==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7bsYqLgb46j1/VY+UUS9yEim3StGQBqqWNqnjvCTNdpbJleYUkV9k5bHOhxuroDyfWzuy+RnvwdwL0XBHMDr+WrJlC9nxZY9IhRmBzFLQ10=
X-Gm-Message-State: AOJu0YyzNOs1tppSGhqgX/WS0beJGQwMOl8gaT3YO/ydLb8tLA6bh61J
	gp3HzwDa8E9lPKmCBhcUWN5XN2V4+367FHEZEhYpCBHYpU1JlAM9w7NxoAc/6Q4=
X-Google-Smtp-Source: AGHT+IEp5RQjN3OqXqNMmTgCMp6Y0MDh6HV8RUCzW71+lzqdiGZxksmwSY5WI1Xptssn8y0vJEqwfQ==
X-Received: by 2002:a05:620a:1921:b0:797:74ba:8ab with SMTP id af79cd13be357-798d26b4a64mr1132760985a.73.1718632255523;
        Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:55 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:13 -0400
Subject: [PATCH v3 33/41] iio: magnetometer: ak8974: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065057_636314_97C603D0 
X-CRM114-Status: UNSURE (   9.50  )
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
ZXRvbWV0ZXIvYWs4OTc0LmMgfCAxMSArKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9tYWdu
ZXRvbWV0ZXIvYWs4OTc0LmMgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWs4OTc0LmMKaW5k
ZXggYzc0ZDExOTQzZWM3Li43MDE3MmI5MThlMTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL21h
Z25ldG9tZXRlci9hazg5NzQuYworKysgYi9kcml2ZXJzL2lpby9tYWduZXRvbWV0ZXIvYWs4OTc0
LmMKQEAgLTMyNywxMCArMzI3LDcgQEAgc3RhdGljIGludCBhazg5NzRfdHJpZ21lYXMoc3RydWN0
IGFrODk3NCAqYWs4OTc0KQogCX0KIAogCS8qIEZvcmNlIGEgbWVhc3VyZW1lbnQgKi8KLQlyZXR1
cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGFrODk3NC0+bWFwLAotCQkJCSAgQUs4OTc0X0NUUkwzLAot
CQkJCSAgQUs4OTc0X0NUUkwzX0ZPUkNFLAotCQkJCSAgQUs4OTc0X0NUUkwzX0ZPUkNFKTsKKwly
ZXR1cm4gcmVnbWFwX3NldF9iaXRzKGFrODk3NC0+bWFwLCBBSzg5NzRfQ1RSTDMsIEFLODk3NF9D
VFJMM19GT1JDRSk7CiB9CiAKIHN0YXRpYyBpbnQgYWs4OTc0X2F3YWl0X2RyZHkoc3RydWN0IGFr
ODk3NCAqYWs4OTc0KQpAQCAtNDM4LDEwICs0MzUsOCBAQCBzdGF0aWMgaW50IGFrODk3NF9zZWxm
dGVzdChzdHJ1Y3QgYWs4OTc0ICphazg5NzQpCiAJfQogCiAJLyogVHJpZ2dlciBzZWxmLXRlc3Qg
Ki8KLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoYWs4OTc0LT5tYXAsCi0JCQlBSzg5NzRfQ1RS
TDMsCi0JCQlBSzg5NzRfQ1RSTDNfU0VMRlRFU1QsCi0JCQlBSzg5NzRfQ1RSTDNfU0VMRlRFU1Qp
OworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhhazg5NzQtPm1hcCwgQUs4OTc0X0NUUkwzLAorCQkJ
ICAgICAgQUs4OTc0X0NUUkwzX1NFTEZURVNUKTsKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoZGV2
LCAiY291bGQgbm90IHdyaXRlIENUUkwzXG4iKTsKIAkJcmV0dXJuIHJldDsKCi0tIAoyLjQ1LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
