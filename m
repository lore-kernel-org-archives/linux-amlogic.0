Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D984C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46eXasSDcRrsg87oH+gbPHumUXdfNkrpkHDT5JJSZSc=; b=LkBW5dZOoSJ58c
	V+u5rf+9Ma1/YH9STUrkY/8ApDuouUHtDMHXSYNHaYnpQAWybfcipxuoIWnJ/drMaK/qNXxv+z8Ma
	t3ZRComYHz2b5dToGl7+4dMs4DZd2WdTnynf18kymaBtObdvFGVkOrgy6ZDmAQPEESzVPDSMhNDEj
	XtsLbOlSl/+34kQybO76zWp5U/E6DB230YVDaPAG3lz57vyF7HGfEoA/yUsrctiFsEgOt3HlV6TZB
	Ob6ip/fMEO/vJr9Je7zbZhJnDB0F0JbtbENTlygzwUXVJYYrNzOq7qcwXYfI3mLAXIbaq5GpEYkCK
	RwCX9QQdv0zBG78aBypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClE-0000000Axne-3qGk;
	Mon, 17 Jun 2024 13:51:04 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkJ-0000000Awuj-36SN
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:12 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-796df041d73so313356285a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632206; x=1719237006; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=XWNna51lU41pDVbKmjaafsvSd9elL4Pi0RVMcBXnziO4Qjikz119sp05vdPKFXruKS
         ceCS5v/s/gBzgVEb6zYTbXMzLfrh1DNCqeRfs4dVSx2bFGDTXCjmcwOpbP5jEGE1BRFP
         tr4GavNLQhDApCQi+CK7qSaMzV2Gf6C/Ng0B7sQVIdj94iA9O1/AaCH7yj1R8drbPBBQ
         /fm7hf9rvizewD5VpzbxRJVioHqhjdgJ1IjvqTa0yV47d1JILxXAtG40jMUJL4GdNqf3
         C7ZP0MwCXB9EA51jRoiNTAsIz5lVnRcQk6wNpu8zxeT0FJtwq33jv6WpeyXuBfiC0+xR
         dxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632206; x=1719237006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=UGJsNz7R3H1hxU5nloOoV7Zhiew13LtsjT/QD3wCzuotkbi7bcQuqha3iEoLDJfE1W
         PX2wH0r+Xvnyluahy1OjRfGUTbF6eiBibdfPkftWd0q3O4VjGyPhNZAW6fQAAAKMSflB
         xri5Vf6koVu4SPMONMn5t2EOiypn5Hewg0s8w+V+14rllRMpsweGqbwbGf8dSKrPOsxC
         rbFAth21ki2WfZdnkn9fCbO6tXiC3Uatb5rvNI8Kgqrk0Jiuamk58DSNPBaGB9Ybai7a
         uqvT0LfIfLk6bxYKNnUO5tv2jrMIrhUUXpDCmfLo9AJCF4tpGQxeqyJ3VlMzvsi9IXyH
         K97w==
X-Forwarded-Encrypted: i=1; AJvYcCWFbZ4zpGGvOjQdDUZ6As+bzeJpSjierT13mLLaVRnijqSLFU5iOePGsZLRziYr+PBNzZF1n48oFI3DDgP5JnbXO9Swa3j43JQdlN/PN9EY3DQ=
X-Gm-Message-State: AOJu0Yz13XbMB76zuAt9b0avtqPnCJo18lgrCAfW8jtWzCWt4FG0tcqz
	huuivajKqTLl0DkgKmUyLapGk02MxpGXjYq/FIzX6FCUZc/cW9r/aDc/GleOxxA=
X-Google-Smtp-Source: AGHT+IEuE3X+Ttrgd1pciF1gOmiGqm6CNudwXH5GABygzdDAc5BXX3iLlJx1my8INZ4E7qgPOczVYA==
X-Received: by 2002:a05:620a:444f:b0:795:5815:2f9f with SMTP id af79cd13be357-798d241d00fmr1205475685a.25.1718632206164;
        Mon, 17 Jun 2024 06:50:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:50 -0400
Subject: [PATCH v3 10/41] iio: adc: fsl-imx25-gcq: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-10-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065008_187898_57938425 
X-CRM114-Status: GOOD (  11.00  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYyB8IDE2ICsrKysrKyst
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYyBiL2RyaXZlcnMv
aWlvL2FkYy9mc2wtaW14MjUtZ2NxLmMKaW5kZXggYjY4MDY5MDYzMWRiLi5iM2YwMzc1MTBlMzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9mc2wtaW14MjUtZ2NxLmMKKysrIGIvZHJpdmVy
cy9paW8vYWRjL2ZzbC1pbXgyNS1nY3EuYwpAQCAtODcsMTMgKzg3LDEzIEBAIHN0YXRpYyBpcnFy
ZXR1cm5fdCBteDI1X2djcV9pcnEoaW50IGlycSwgdm9pZCAqZGF0YSkKIAlyZWdtYXBfcmVhZChw
cml2LT5yZWdzLCBNWDI1X0FEQ1FfU1IsICZzdGF0cyk7CiAKIAlpZiAoc3RhdHMgJiBNWDI1X0FE
Q1FfU1JfRU9RKSB7Ci0JCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FEQ1Ff
TVIsCi0JCQkJICAgTVgyNV9BRENRX01SX0VPUV9JUlEsIE1YMjVfQURDUV9NUl9FT1FfSVJRKTsK
KwkJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9NUiwKKwkJCQlNWDI1X0FE
Q1FfTVJfRU9RX0lSUSk7CiAJCWNvbXBsZXRlKCZwcml2LT5jb21wbGV0ZWQpOwogCX0KIAogCS8q
IERpc2FibGUgY29udmVyc2lvbiBxdWV1ZSBydW4gKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJp
di0+cmVncywgTVgyNV9BRENRX0NSLCBNWDI1X0FEQ1FfQ1JfRlFTLCAwKTsKKwlyZWdtYXBfY2xl
YXJfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FEQ1FfQ1IsIE1YMjVfQURDUV9DUl9GUVMpOwogCiAJ
LyogQWNrbm93bGVkZ2UgYWxsIHBvc3NpYmxlIGlycXMgKi8KIAlyZWdtYXBfd3JpdGUocHJpdi0+
cmVncywgTVgyNV9BRENRX1NSLCBNWDI1X0FEQ1FfU1JfRlJSIHwKQEAgLTExNSwxMSArMTE1LDEw
IEBAIHN0YXRpYyBpbnQgbXgyNV9nY3FfZ2V0X3Jhd192YWx1ZShzdHJ1Y3QgZGV2aWNlICpkZXYs
CiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9JVEVNXzdfMCwKIAkJICAgICBN
WDI1X0FEQ1FfSVRFTSgwLCBjaGFuLT5jaGFubmVsKSk7CiAKLQlyZWdtYXBfdXBkYXRlX2JpdHMo
cHJpdi0+cmVncywgTVgyNV9BRENRX01SLCBNWDI1X0FEQ1FfTVJfRU9RX0lSUSwgMCk7CisJcmVn
bWFwX2NsZWFyX2JpdHMocHJpdi0+cmVncywgTVgyNV9BRENRX01SLCBNWDI1X0FEQ1FfTVJfRU9R
X0lSUSk7CiAKIAkvKiBUcmlnZ2VyIHF1ZXVlIGZvciBvbmUgcnVuICovCi0JcmVnbWFwX3VwZGF0
ZV9iaXRzKHByaXYtPnJlZ3MsIE1YMjVfQURDUV9DUiwgTVgyNV9BRENRX0NSX0ZRUywKLQkJCSAg
IE1YMjVfQURDUV9DUl9GUVMpOworCXJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdzLCBNWDI1X0FE
Q1FfQ1IsIE1YMjVfQURDUV9DUl9GUVMpOwogCiAJdGltZV9sZWZ0ID0gd2FpdF9mb3JfY29tcGxl
dGlvbl9pbnRlcnJ1cHRpYmxlX3RpbWVvdXQoCiAJCSZwcml2LT5jb21wbGV0ZWQsIE1YMjVfR0NR
X1RJTUVPVVQpOwpAQCAtMjcyLDkgKzI3MSw4IEBAIHN0YXRpYyBpbnQgbXgyNV9nY3Ffc2V0dXBf
Y2ZncyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkJCSAgIE1YMjVfQURDUV9DRkdf
UkVGTl9NQVNLLAogCQkJCSAgIHJlZnAgfCByZWZuKTsKIAl9Ci0JcmVnbWFwX3VwZGF0ZV9iaXRz
KHByaXYtPnJlZ3MsIE1YMjVfQURDUV9DUiwKLQkJCSAgIE1YMjVfQURDUV9DUl9GUlNUIHwgTVgy
NV9BRENRX0NSX1FSU1QsCi0JCQkgICBNWDI1X0FEQ1FfQ1JfRlJTVCB8IE1YMjVfQURDUV9DUl9R
UlNUKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVncywgTVgyNV9BRENRX0NSLAorCQkJTVgy
NV9BRENRX0NSX0ZSU1QgfCBNWDI1X0FEQ1FfQ1JfUVJTVCk7CiAKIAlyZWdtYXBfd3JpdGUocHJp
di0+cmVncywgTVgyNV9BRENRX0NSLAogCQkgICAgIE1YMjVfQURDUV9DUl9QRE1TSyB8IE1YMjVf
QURDUV9DUl9RU01fRlFTKTsKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
