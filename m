Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A55C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4Rd0UPd49yFwtLyTnzOJp8kEsHRpcaNTAt4XwA2K4M=; b=k4E2tlhxSo6i5o
	h+2qt0z6o9LHWUigLx8FNb/Bwp1vChJSothKUIOLfRzFGcufPAatDU6F/bozA+uXwXN/6p/jnoEnB
	Zy1UnsMuezhsdx0c+L5UAM6jiU/iGPRQ5eCt9f7w+T6HfhNYZsPTtnIcfogo4KKJtYUqEtTt8F5pi
	BDlOi4FBVPxusltfAGJ83HlPKCnv0D1L+cCbIE/b9Nw5++mhjrKOeF+KegteGV9Tijv4NEtcctn1A
	wb/kRmRwEbTRpJszrp3Uq4ntdjYHEm/ICZ+DcKGqeSyZxlBJNSkpyOPfHhtp5vOSSixlWaAhstEsq
	m2b0cKYV8ABPqaaV/F5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkD-0000000AwpN-175a;
	Mon, 17 Jun 2024 13:50:01 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk0-0000000Awgn-0cfG
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:51 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3d21e00d9cfso2635055b6e.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632187; x=1719236987; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=yoWAMTktXbKE90Y6crZFtx49v0F0zvrKPsuqAE1IdRf0m8AvbUIXb86As4RrldrplA
         DccmIpgH1K4W6QWWggnWN2z/mCjOGokZqunGa6xqkb3U/K6yjr2H2/2/T+QVRsP0VZ02
         9q3mlxAVNI4vifG1PPGGEqulVO+B5ztIe4a75iJjMPbvQBHdmVVTWBnGpgwF+baoifCf
         pXFUVcbVYQmndnTJD5LISRwD9SuzgNSla9nd+EqJrCJCogAEbHC5cQ/59e7kdXm07KYM
         U/WHKamSEwDZsTbnzh9088vpzh2EW7wDFxEKvLDvz2d7MiNYwjM1vGaey44zm0mVcPx+
         SWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632187; x=1719236987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOw9ZuYF7yVVJfGh3LeTM6VDPH42QqBSzznALZp99zM=;
        b=LPtmvptyAuq3CZ05kmxRGTzV8Z+DFKM2gFHhxnX2OxARHZcQ0BA5Wqswc6LPFKc+Ey
         Kj8OChUnX7ZCzYq8YI45l52fgIhXie+K7DqyNru3NmblMWHQBuoYVrC35OZNgqeGTsHZ
         r9b0WIr3NPFNFVHMFZekxOqEJR3lQFNEFaGAzWIKbaWLMDFNu+hEPseF4gbLQ3Fl6aQF
         6tpg/hmwE72+ic1pOoBfZj0BAE1Zlld3ESXNw8SMmaRx6pgxrCcalWFskwBWdY8B6XAP
         aIAy9qvH5ZrI4t8d+2ue+sGl6OxYg9u5+cu0ERa6OT+uSnzxafqr2LSs1OOe1sMCUQ90
         B9Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWtmm61g6844GQl+bXvbmFAS3wl6mqFS9uo9G9gT0p3wbdas+9Ig9j0DjIxrsdRl9VhP0f/ABi3HZKxuUzSVeDgqaQ7i20oMCV/cIhu2wXJ+Xs=
X-Gm-Message-State: AOJu0YyZ59EGP8gfG76RWDIua5nGpz2Kj1RxRinxRdTCkl6ijE/9nxr/
	4GwgrhExgYTeyCx4HrldFdg4vIirCLLiHzmKACNLSu2R1h5NgOnbu8USr3U6OC0=
X-Google-Smtp-Source: AGHT+IFJGSJ8d0p4WXCzz2NyljOfF1k3KjSXOWFFs3OCSrxLmfdmtEDsU18y1hD0hfEhjyu+NXEwMw==
X-Received: by 2002:a05:6870:8188:b0:255:1bb8:85ec with SMTP id 586e51a60fabf-2584288e46bmr10661973fac.12.1718632186790;
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:41 -0400
Subject: [PATCH v3 01/41] iio: accel: fxls8962af-core: Make use of
 regmap_set_bits(), regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-1-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064948_236407_B16A125F 
X-CRM114-Status: UNSURE (   9.51  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWNjZWwvZnhsczg5NjJhZi1jb3JlLmMgfCAxOCArKysr
KysrKy0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYtY29yZS5j
IGIvZHJpdmVycy9paW8vYWNjZWwvZnhsczg5NjJhZi1jb3JlLmMKaW5kZXggNGZiYzAxYmRhNjJl
Li5kMjVlMzE2MTM0MTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYt
Y29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2FjY2VsL2Z4bHM4OTYyYWYtY29yZS5jCkBAIC0yMjgs
OCArMjI4LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX3Bvd2VyX29mZihzdHJ1Y3QgZnhsczg5
NjJhZl9kYXRhICpkYXRhKQogCiBzdGF0aWMgaW50IGZ4bHM4OTYyYWZfc3RhbmRieShzdHJ1Y3Qg
Znhsczg5NjJhZl9kYXRhICpkYXRhKQogewotCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0
YS0+cmVnbWFwLCBGWExTODk2MkFGX1NFTlNfQ09ORklHMSwKLQkJCQkgIEZYTFM4OTYyQUZfU0VO
U19DT05GSUcxX0FDVElWRSwgMCk7CisJcmV0dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJl
Z21hcCwgRlhMUzg5NjJBRl9TRU5TX0NPTkZJRzEsCisJCQkJIEZYTFM4OTYyQUZfU0VOU19DT05G
SUcxX0FDVElWRSk7CiB9CiAKIHN0YXRpYyBpbnQgZnhsczg5NjJhZl9hY3RpdmUoc3RydWN0IGZ4
bHM4OTYyYWZfZGF0YSAqZGF0YSkKQEAgLTc4NSw5ICs3ODUsOCBAQCBzdGF0aWMgaW50IGZ4bHM4
OTYyYWZfcmVzZXQoc3RydWN0IGZ4bHM4OTYyYWZfZGF0YSAqZGF0YSkKIAl1bnNpZ25lZCBpbnQg
cmVnOwogCWludCByZXQ7CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBGWExTODk2MkFGX1NFTlNfQ09ORklHMSwKLQkJCQkgRlhMUzg5NjJBRl9TRU5TX0NPTkZJRzFf
UlNULAotCQkJCSBGWExTODk2MkFGX1NFTlNfQ09ORklHMV9SU1QpOworCXJldCA9IHJlZ21hcF9z
ZXRfYml0cyhkYXRhLT5yZWdtYXAsIEZYTFM4OTYyQUZfU0VOU19DT05GSUcxLAorCQkJICAgICAg
RlhMUzg5NjJBRl9TRU5TX0NPTkZJRzFfUlNUKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
CkBAIC04MzAsOSArODI5LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX2J1ZmZlcl9wb3N0ZW5h
YmxlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJZnhsczg5NjJhZl9zdGFuZGJ5KGRhdGEp
OwogCiAJLyogRW5hYmxlIGJ1ZmZlciBpbnRlcnJ1cHQgKi8KLQlyZXQgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGF0YS0+cmVnbWFwLCBGWExTODk2MkFGX0lOVF9FTiwKLQkJCQkgRlhMUzg5NjJBRl9J
TlRfRU5fQlVGX0VOLAotCQkJCSBGWExTODk2MkFGX0lOVF9FTl9CVUZfRU4pOworCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhkYXRhLT5yZWdtYXAsIEZYTFM4OTYyQUZfSU5UX0VOLAorCQkJICAgICAg
RlhMUzg5NjJBRl9JTlRfRU5fQlVGX0VOKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBA
IC04NTEsOCArODQ5LDggQEAgc3RhdGljIGludCBmeGxzODk2MmFmX2J1ZmZlcl9wcmVkaXNhYmxl
KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJZnhsczg5NjJhZl9zdGFuZGJ5KGRhdGEpOwog
CiAJLyogRGlzYWJsZSBidWZmZXIgaW50ZXJydXB0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9i
aXRzKGRhdGEtPnJlZ21hcCwgRlhMUzg5NjJBRl9JTlRfRU4sCi0JCQkJIEZYTFM4OTYyQUZfSU5U
X0VOX0JVRl9FTiwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBG
WExTODk2MkFGX0lOVF9FTiwKKwkJCQlGWExTODk2MkFGX0lOVF9FTl9CVUZfRU4pOwogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
