Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9526C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJc1oHTHUhBETRHL3c1nje1bxd9wuTSKHCprwANWEcI=; b=3TBLXM7RapMIme
	X1NfL006g4WDuRh7kf9Gcy4OPzevDR4vhC+uxOFrN/vm+9WQTm9YJFq7WNjb3vVBqoFLR3LH/VaYU
	vRlbYRIPSFN0Dy9YjjSW4ArDxwnAtj0Ib+vCcrncCGWr5Ngfdml0pyDuR7mqT7so5D3oDAqpZNXCY
	uEQw+TRfTHLZ2ow2lVkNhfaQPGkCZHwuQGrXzBx2TxSJr7u6SUzDPhSQHnA5DznZJXJD9IrO8dZHi
	hdKD0i6wP8fZAxzNQPMZD8hkUgejzFuLFLuZ+/8/VgBEnlmxauDKEvztAjxVIRgzt4hHU2rNBtE3I
	e95Ct3X/Xdi2SHMMgCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDra-0000000BKhe-38Oe;
	Mon, 17 Jun 2024 15:01:42 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClK-0000000Axrg-0LN1
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:19 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4415e623653so39613461cf.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632268; x=1719237068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=dlE1MbUV/3GchDyS0Lmy79A/NM8UfMItarSueaNGHATVC6HWI9X0tNztqcH2VVhvdo
         BwOy6ExxPHxbR9JE7iqC1yi2DsdXZ1zMXNzxcLf4WDpd8GGFInSr30iXyMLetS8kDL2p
         KE/WBRX1vyuzJygAnBizDsAMKjjBghuZu8EuyM5ko3Q3fbOteEXLlFO5PyfM9rKwmKEH
         al2gVyxpjvdJkxdiqgH3TJ9Mbu3MnaTERWKaN7SHZaFnzxQ6hKB+g6s2dMICQgnOS3SS
         i4a5kKVrFT6zc4Ixe25d/P4nmpqy0FVfOz3srpQJtERk5N0SFNGT1Jyo38INgHE047dy
         MqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632268; x=1719237068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvabn+RMpG3uovvK1+JaZOuuhTQ0Y5v5qxh3XvN8Rq8=;
        b=hPAWYduWbuvGsAtnOrau7bITtmk621Sf7aNqzecOfBVvSNLaS2HMd1W9REzKEjNWbB
         S9ooTEVbqIMsPZxv8KLY9RffnqzX7T5VU1H0FyL59PttsVeTLVdux1g7Y+FVeXoltvaz
         1iMDJ6+8b3OstTG2E+XZzG3qmu2nQeBceyOv/xyNhLFhBgiM7fn0DMVMwcIH/kHuzaa+
         O7g+kuoDKsM2iFEGgb/QNPSDkw3vydh/XcaUUXKc5sLYVyxaDsOYSejOn1e9yzI+XhTo
         XOnMN4L2MjPkRfN2BUKQapBTGVouzoGPBdtSpOsVRq5dXXAnI+TIZH/iIW5mAjQ92xD1
         dbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDeAtLKZFOQHWiKa+MVgW03BZeEmI5wxcJ+PJasEgArGVZFVKwYz3AvZRmkFrDmDgCJk1970jSgsPvtKbe3Y8hkYYhUl4dh4IO2/EkyQb8B7I=
X-Gm-Message-State: AOJu0YwPZ2+0IQJ21SwjHaiPrXlNxYWdeDdVdb0DlFd87mYcENnXoo6h
	9El36mZ2LApbGqR0FWR9DkiGwzmdU8N/953OqMJRJTudHB7Jyw1Lz4U4V1bUBQc=
X-Google-Smtp-Source: AGHT+IGCNTX7XI85nrdMwm8HgjdhSBF2upAbofRDQ4N0lo0/7MseIEDdacRNTzR/tFRJhwns3PxO2A==
X-Received: by 2002:ac8:71d7:0:b0:442:198e:cb9 with SMTP id d75a77b69052e-442198e0e4bmr132788711cf.27.1718632268400;
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:19 -0400
Subject: [PATCH v3 39/41] iio: proximity: sx_common: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-39-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065110_384929_45F8DCD0 
X-CRM114-Status: UNSURE (   9.36  )
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
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKSW5zdGVhZCBvZiB1c2luZyByZWdtYXBf
dXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMo
KS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jIGIvZHJpdmVycy9paW8v
cHJveGltaXR5L3N4X2NvbW1vbi5jCmluZGV4IGZlMDdkMTQ0NGFjMy4uYTk1ZTk4MTRhYWYyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2lpby9wcm94aW1pdHkvc3hfY29tbW9uLmMKKysrIGIvZHJpdmVy
cy9paW8vcHJveGltaXR5L3N4X2NvbW1vbi5jCkBAIC0xMTEsMTcgKzExMSwxNiBAQCBzdGF0aWMg
aW50IHN4X2NvbW1vbl9lbmFibGVfaXJxKHN0cnVjdCBzeF9jb21tb25fZGF0YSAqZGF0YSwgdW5z
aWduZWQgaW50IGlycSkKIHsKIAlpZiAoIWRhdGEtPmNsaWVudC0+aXJxKQogCQlyZXR1cm4gMDsK
LQlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+Y2hpcF9pbmZv
LT5yZWdfaXJxX21zaywKLQkJCQkgIGlycSA8PCBkYXRhLT5jaGlwX2luZm8tPmlycV9tc2tfb2Zm
c2V0LAotCQkJCSAgaXJxIDw8IGRhdGEtPmNoaXBfaW5mby0+aXJxX21za19vZmZzZXQpOworCXJl
dHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5jaGlwX2luZm8tPnJlZ19p
cnFfbXNrLAorCQkJICAgICAgIGlycSA8PCBkYXRhLT5jaGlwX2luZm8tPmlycV9tc2tfb2Zmc2V0
KTsKIH0KIAogc3RhdGljIGludCBzeF9jb21tb25fZGlzYWJsZV9pcnEoc3RydWN0IHN4X2NvbW1v
bl9kYXRhICpkYXRhLCB1bnNpZ25lZCBpbnQgaXJxKQogewogCWlmICghZGF0YS0+Y2xpZW50LT5p
cnEpCiAJCXJldHVybiAwOwotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBkYXRhLT5jaGlwX2luZm8tPnJlZ19pcnFfbXNrLAotCQkJCSAgaXJxIDw8IGRhdGEtPmNoaXBf
aW5mby0+aXJxX21za19vZmZzZXQsIDApOworCXJldHVybiByZWdtYXBfY2xlYXJfYml0cyhkYXRh
LT5yZWdtYXAsIGRhdGEtPmNoaXBfaW5mby0+cmVnX2lycV9tc2ssCisJCQkJIGlycSA8PCBkYXRh
LT5jaGlwX2luZm8tPmlycV9tc2tfb2Zmc2V0KTsKIH0KIAogc3RhdGljIGludCBzeF9jb21tb25f
dXBkYXRlX2NoYW5fZW4oc3RydWN0IHN4X2NvbW1vbl9kYXRhICpkYXRhLAoKLS0gCjIuNDUuMgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
