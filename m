Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA9C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6K0OvKH8ursNmxUuCynY2JG/lLTCyTaF+RmXXnmz/s=; b=n9v2G0w3PrOpcz
	c0XbQYdlHw6ZwmbFlGADZtU7lXFbHuSAbvAK8jGcxKdx27KuxHNfO9Ap8mkokHi0LC+f6ldF5glwA
	lWKJtszlklMUCRmeCFiB8WBlQzm3G6CfMAy1doQnfCNQGL77XaVnJ1z46d3XkpkkANVP28ZV8u8z8
	TJqTzjK7/DQWjuVpNr4uuoUb/8IrrQcc1YA6tpCFkZ3aZQv2sZVP0dc8yVZf0bmesbT2IIZuy62vB
	vrul97YsSLW9VI0TyRwFydyg9hi0HSlV3eW3sg4Rutol9kLnPqgZV68d38T4Ia2q+JUf7UuCbCSjg
	+UGJclcUi+eFPusNxamg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClX-0000000Ay30-2nJ6;
	Mon, 17 Jun 2024 13:51:23 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkM-0000000AwxF-0oJM
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:13 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-80b9c393cd3so980250241.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632208; x=1719237008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=HAM1LXFSMXBLSiuZPkGSN81N5iHrZsZ+0yFmpZm9XhB0vSMpc1ZakIUS6PZL2o/xmA
         nc3N1FvVfP2ktFeMgiPw39qtnuqTau3PSW8FwnbMKnldlKrqYwybxupUVObgzA6sXHTS
         CrEuI+KNBMrlNhUTaNaXveG586QK1K03bd68Uyo+d9cl9S32l5b7/mE8pc6oT8Bym4DB
         j3pAlvKmVyMkQBynjxcG/dnbUMa3ifFPV2U/smAYQl/4XPLRvRcklkL6UHJ8le/fwIJ0
         cxyvoCwEC5ur+UDJBVhC/t4ij+wm5cjofWTJWTGjxRUaNPrlK0nWO6w+27/AZEk2IFFo
         oAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632208; x=1719237008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SS/VahdjQ8SKQC25MQPNc7rg+KDijJeHwUtRITveNmM=;
        b=mpdTveEh0ILociHLQ4iUi+6CujTnG1AaOaq4j7woZVG4ovikl9koswszewz4BrWIbA
         mc1QNYCmaRX2qEq0PnP3Z9Y2j3+5kEgT8GNBhwGqVLbDv+QR0NHcid9aiHM4RXHprqCE
         7arPNnWJq5ZeTzTou/RGlYC4htiMHsZrSZ/HFQk1t8Sym3tlrs9Ze0h7AcnKjlJ9W/EY
         3gX50K6E9kX8+kU3jdfyOgJndvxUq+qfNPXMqAEFGcTcVIB2LPFmYr5lVPe5z6ZfEdgS
         VZEJRejTGG5Q/B27xYQcJG0kR+GTv4dbg8fA2rg8EIZm95qYqYahGAAxwHICCjitqx6N
         sspA==
X-Forwarded-Encrypted: i=1; AJvYcCWfIXNgoMBbH9vIbuf6c00ot8T7T/rKZ7xOxKci7VYT4SA8nELaFoEosVWCLfq3/TXzOeBifGMiRJ7scOBWcrwAw12I/Lbrk+CJaIUAlRZ6nm4=
X-Gm-Message-State: AOJu0Yx1drdvI8GujGzPf5al6igT1vQZ2+iJXNkLKMTjzjcbQqy4AlMd
	8lSG4iQowhLm9xD3PTgBk9hFZIORrgZ94vOlV+nzxZUVzBfzp4w6+/8j7C+WXik=
X-Google-Smtp-Source: AGHT+IExs5o6BBy2GiVBbRbl5RTcmAHYS/6pj70WZUFQ8c7/pJkIjoippgtnc/biSc9YFfMmt2B/ig==
X-Received: by 2002:a67:f783:0:b0:48d:9b03:3ff4 with SMTP id ada2fe7eead31-48dae3e1559mr9042383137.28.1718632208483;
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:51 -0400
Subject: [PATCH v3 11/41] iio: adc: ina2xx-adc: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-11-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065010_788149_9F0655EA 
X-CRM114-Status: UNSURE (   9.45  )
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2luYTJ4
eC1hZGMuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2luYTJ4eC1hZGMuYyBiL2RyaXZl
cnMvaWlvL2FkYy9pbmEyeHgtYWRjLmMKaW5kZXggOWU1MjIwNzM1MmZiLi43MjdlMzkwYmQ5Nzkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9pbmEyeHgtYWRjLmMKKysrIGIvZHJpdmVycy9p
aW8vYWRjL2luYTJ4eC1hZGMuYwpAQCAtMTA0Niw4ICsxMDQ2LDcgQEAgc3RhdGljIHZvaWQgaW5h
Mnh4X3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWlpb19kZXZpY2VfdW5yZWdp
c3RlcihpbmRpb19kZXYpOwogCiAJLyogUG93ZXJkb3duICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0
ZV9iaXRzKGNoaXAtPnJlZ21hcCwgSU5BMlhYX0NPTkZJRywKLQkJCQkgSU5BMlhYX01PREVfTUFT
SywgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoY2hpcC0+cmVnbWFwLCBJTkEyWFhfQ09O
RklHLCBJTkEyWFhfTU9ERV9NQVNLKTsKIAlpZiAocmV0KQogCQlkZXZfd2FybigmY2xpZW50LT5k
ZXYsICJGYWlsZWQgdG8gcG93ZXIgZG93biBkZXZpY2UgKCVwZSlcbiIsCiAJCQkgRVJSX1BUUihy
ZXQpKTsKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
