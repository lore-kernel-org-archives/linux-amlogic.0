Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EB7C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gxj2qgoSgEHfxeYfVmlU8iWxz7cOUEI2AiscqLypEfI=; b=ZcO0mrpug1V+hm
	RjuvmDmSSv2VqUJvvJtp2nzFTSfP8hwaYWAmYVVtDxvTIih5XE/vWj9QG7gnASHSGAaOoD9d+98pe
	ZKqG656PykqwyqeCaqzfGR7PR8BaLYdm1UQOToNItbbrUoKgpyi14/I1bqNr/BTuy+YhdDkkuzW1C
	BCSCmXmICg2/JvFd/4M3b3F2iGUdfPTup5DOiAy1S8x16myb8+7zqa6J+Y7fhNY0gMe5bDG6VnEhr
	6soSiVULSQQ46GkL2U1hs/Fo1QktRrgEhfulQtZzMogwhn6yyyeV3BDZesq5vmV9YZi8nLDJFornj
	aPvkaR0qR827sxCTRqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClZ-0000000Ay5C-31EY;
	Mon, 17 Jun 2024 13:51:25 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkN-0000000Awyk-3kan
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:17 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7955f3d4516so481862885a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632210; x=1719237010; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
        b=SIB/YZ5EL9WTjFOX0NhJG1I8ywfsqImD9AwpVfHikf3PXxGQBNnCjxEdI1oyLXs5iy
         nTiceQriXx2wCw1UCw8BBTjXtKqcRPbNBTE3Pw2FXwJHsDxWP/bEZavE/YIVCGICnFGO
         m26qua77bB9MUZb3AUELEsVxEDWpTbDFkaM/vjiuh73JXBLIrH3laepYcxPu21kbjEY+
         65Num2UO9DFmQQJwgchmJWXsSVFNgBdzuYsM35B1C2dkBMP+y5VvOtPbPKiEa+my5Wdv
         YyQq68y+ooDICwtDTG++v1Dok5kqNyVoBqBEmRPl6jhCvPjogZCEHu0sIdXRGeA3mvdt
         FhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632210; x=1719237010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyBlb3Ba1k/jlth0MsPpVigCEg60zHZmfggBIvSR+YQ=;
        b=UERpO6mxj4bTc5CDfgkWBx9dDaeuKHyJemAMeEcBHUvRb4z6sf9Ay4gwDLcWhBpUsW
         2RAVScCYvIMyWQxQzFRctiwvxb6FFFE3DLlgKfDHtiF1/exAy3p0wvkSeJP6uY55ktvQ
         /HlLFg7/YKub4w4mIwMuN6UfRofjc+SV96RMB7/eoBg4nkXxcqWhywY+WjfO/fm4pX15
         MDzsd5O+OsAAPhjwTD8QCtRvhB61FDNjX21rsHSW9oltlRP/ej6ysMf+p3hgJdaVnM0A
         sJ96egU/3kndOtdwDdxD74WqLf3rmJXF6tnCc/Vx3r3nP/IhXnnd+gZPcQ6wNoGUnYMA
         fDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrF9boCaujinYdtAy9cYagWxPXHdQVebE1OTBDmjSTbpiSXUwQ+CfFTS8onPj2WA5AGhe4fmt9hx/uVYiZlntzlax9+LLeNkzNfamlBgNvZAo=
X-Gm-Message-State: AOJu0YwISAIx4/i4r2UujsBkBPFII8JalJr0rFn9tt3IHTAl6AvEoPuC
	jr0QbFu5AuN37SCSyr4PUQ5Ww/R1tpncm868rEgNvtv+bJ6u5/wYeEH/0gamCO0=
X-Google-Smtp-Source: AGHT+IHWmg+UOH3erM5jeRd6l80OV3UNPvKSawdtaAa099apOKn54lBrRboJnTNNmboBsmxvynve5Q==
X-Received: by 2002:a05:620a:408a:b0:799:b171:b1fe with SMTP id af79cd13be357-799b171b5f4mr1409403885a.14.1718632210646;
        Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:10 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:52 -0400
Subject: [PATCH v3 12/41] iio: adc: intel_mrfld_adc: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-12-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065012_290352_0BE7725B 
X-CRM114-Status: UNSURE (   9.71  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2ludGVs
X21yZmxkX2FkYy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9h
ZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9hZGMuYwppbmRleCBjN2Y0MGFlNmU2
MDguLjA1OTBhMTI2ZjMyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2ludGVsX21yZmxk
X2FkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9pbnRlbF9tcmZsZF9hZGMuYwpAQCAtODEsOCAr
ODEsOCBAQCBzdGF0aWMgaW50IG1yZmxkX2FkY19zaW5nbGVfY29udihzdHJ1Y3QgaWlvX2RldiAq
aW5kaW9fZGV2LAogCiAJcmVpbml0X2NvbXBsZXRpb24oJmFkYy0+Y29tcGxldGlvbik7CiAKLQly
ZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFwLCBCQ09WRV9NQURDSVJRLCBCQ09WRV9BRENJUlFfQUxM
LCAwKTsKLQlyZWdtYXBfdXBkYXRlX2JpdHMocmVnbWFwLCBCQ09WRV9NSVJRTFZMMSwgQkNPVkVf
TFZMMV9BREMsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHJlZ21hcCwgQkNPVkVfTUFEQ0lSUSwg
QkNPVkVfQURDSVJRX0FMTCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBCQ09WRV9NSVJR
TFZMMSwgQkNPVkVfTFZMMV9BREMpOwogCiAJcmV0ID0gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0
KHJlZ21hcCwgQkNPVkVfR1BBRENSRVEsIHJlcSwKIAkJCQkgICAgICAgIShyZXEgJiBCQ09WRV9H
UEFEQ1JFUV9CVVNZKSwKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
