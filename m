Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5415DC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjLCEm3jmGOyhYeUYWUhLV+zNVssXTnehPCbQJEdIRU=; b=LdVV5PSP27lvjj
	GgpgZT0jf/v4JdK3K4QWnw0zuVsxGakfq/4mUeL+kGcH/rmOwXxgg0iDjsTaC3Ey0ljkZWTwSrtBf
	Hkn6kHpCDeAJOZGiS0STaS1zyESmy3+ucb3mKB8nrNDOhGg0CNEVZ1vg6DIsiPchKXJyWr7MbD5lr
	nxnlCxTXxOobfSGfPP8NmONfLYPLVvi6kJkeLmIhafYGxro/wvubZkCCxF5WAZvKfBsxS3PQSCacN
	fdxlywyMcjyOTTB7JsY34Cq3XAFVVwQ2/VgULltcp0BXT3aOQk8cYNq2pmCpi0yDwqSRLi8Ssyd8m
	15CHastixZOW5L/ww1Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrC-0000000BKMm-0VwP;
	Mon, 17 Jun 2024 15:01:18 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkW-0000000Ax7l-1ZoC
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:35 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-796df041d73so313372385a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632219; x=1719237019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
        b=Q+NpJy2Fflq/Y8d09hPhyHpmVZtJR2r66y0SFYH07i/+M3103MZ+t4zroqsNDRuZQl
         keyrgz65ISh9GgCCBnpDxcPRAS8fkhwh1TJaTcExY79cNZqcRYzY3tLhWo7fy+3Q8mby
         xbpFV8zTIHrZ70m/1P587BaI003cSi3VK1OITZ5tjOb11DZSPAS+fWLc3/Dn4I67cUzN
         ppPFC4WLqgJd0H28EPGjeHV4f71T8w+AEU2A5UvWFd0TgIxB3l+WFx+h6XpfABottL2j
         qfxmfr9exqHdbu1CZPGcJQrOJGeEss4AtVsvbexmHQms0E6aPbfR09oFUByCEzuCvpZY
         4Ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632219; x=1719237019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVb/0PilAc52B9kaVfDX+4rlv8WRgZtRLdvIf/r6J1Y=;
        b=GHTGnSAQAkv8UBQ4YvtG9xW9MPhc4VEbnLOI7EmLdFjOHxx30RV0U3hdyVIlqCsH8h
         iqDfBejm8odNFKi9mJbhxMQVtEuRiPTL1APYUPFEEZr+v5p2dKbZHUBlbm5G/TpLyDa+
         wq7d9MhNYmhBoUtM/pWto/j7MhruSjPjgCxCIP3ENGsLcVH/88u2Ih781Q5PQoeQVHMn
         yMJKGCH8oAV03tFxNfXPNhyRcZnd3nN09j60TGdAJL5lUd7V2yqpr4/FkOp1mFHL/x9y
         W+TeelM8OKUDw+hFZzejw71eKSNZix90BEJkNiku3PDAjBd3v81r+hZVZkoOmuHFQCh8
         ufJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkoqXTxWhzp3TR0m1TPIO8ckei9gFjfD3kcv3cjwLDGE6MrtSWigLSKx4+oNzTEXqtsaymVf+dCJMmzAMO2ZJzW4/BXksuuYMcFpnPs8qCVV0=
X-Gm-Message-State: AOJu0YwtqWaS9TWGf79cMS8I4ztmyKsNRomdJs4Jkp/nkEqv0rRgcEUx
	ZKu71o9+rDatnAyFa9wCDLF2BPoZEvkT9pjxAQE+MovqC5ShUvujuJIqwuSkiRw=
X-Google-Smtp-Source: AGHT+IEhAnjjomgk19gOfh4FY6+tmL+ftVg/dpR5n10Qt2NpVGAkWAorRIXV5RllBFaajmvErpGqLg==
X-Received: by 2002:a05:620a:370d:b0:796:842c:77f1 with SMTP id af79cd13be357-798d243aaa6mr1278103785a.36.1718632219186;
        Mon, 17 Jun 2024 06:50:19 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:56 -0400
Subject: [PATCH v3 16/41] iio: adc: rn5t618-adc: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-16-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065021_134458_25E3F554 
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKU3VnZ2VzdGVkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVHJl
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9hZGMv
cm41dDYxOC1hZGMuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRj
LmMgYi9kcml2ZXJzL2lpby9hZGMvcm41dDYxOC1hZGMuYwppbmRleCA2YmYzMjkwN2YwMWQuLmNl
NWYzMDExZmUwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRjLmMKKysr
IGIvZHJpdmVycy9paW8vYWRjL3JuNXQ2MTgtYWRjLmMKQEAgLTEzNyw5ICsxMzcsOCBAQCBzdGF0
aWMgaW50IHJuNXQ2MThfYWRjX3JlYWQoc3RydWN0IGlpb19kZXYgKmlpb19kZXYsCiAKIAlpbml0
X2NvbXBsZXRpb24oJmFkYy0+Y29udl9jb21wbGV0aW9uKTsKIAkvKiBzaW5nbGUgY29udmVyc2lv
biAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhhZGMtPnJuNXQ2MTgtPnJlZ21hcCwgUk41
VDYxOF9BRENDTlQzLAotCQkJCSBSTjVUNjE4X0FEQ0NOVDNfR09ET05FLAotCQkJCSBSTjVUNjE4
X0FEQ0NOVDNfR09ET05FKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoYWRjLT5ybjV0NjE4LT5y
ZWdtYXAsIFJONVQ2MThfQURDQ05UMywKKwkJCSAgICAgIFJONVQ2MThfQURDQ05UM19HT0RPTkUp
OwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40NS4yCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
