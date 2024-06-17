Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996F7C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxEi6VOvUhM1YMeB6SvW6nYQP+gbjHnjTQyy8bGsAlQ=; b=HukGJmKcabgOrk
	jFCdpuM0AkyVewsMVvoSzh8Ia2L0LLQ0eqsgYX684utmqgRhkTxb5WQgIPYh+yR5P5ImAsC9wa9us
	+PhmQp8daSsRxzcndMgVfxr00MXetoKLsxs6IsYvMFQlebooWQLpfvQ5YSkMsjqyoh4ASrqLpyOom
	pUMK7mQbrbPkyQkCO/6Cm7/mW5yuzctPbKTR52xrmVJbxPws0ulxXbZjDraZPFJN5Z5918yqlEBXL
	mlNaZJCXvKgxHF3Ls6tk0iMd/ybFnItx+O1fGRVcT0keBuulVbWgGcWHcn6OSrtP9uQcTZsrBgixd
	o5YM29C0z+a5AVEq/MjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnP-0000000AzML-39BP;
	Mon, 17 Jun 2024 13:53:19 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkq-0000000AxPP-2mM1
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:49 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-795502843ccso252193085a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632238; x=1719237038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=HuYwajOAyk/559EmR/1/W2S88i14JG8kW8dyNbnb8zSSQj00EpMtJ7gjkCez2o7Zk5
         8Wxd4vbM7vbp4LAXgPF3EaY2URqMqb4sOH/9kXHdf3T8MW0avLcSr9Z+yNJ2iSn9D22K
         v+i0wM/plmXuhS9AhxqCeeDRIC0XWy/KPPiMPbSGBQ/tQZwUtMVhC9Ef+tCsaJNdOs4x
         ZrwR6OJZdmGgoAgG3Qg85/thGTPDZ2yWAiVZ8VlmCc81hncKkmiGNMnuf29CFNZOSF+C
         GVMbLY7/8GWHBnEMMnk7noJha80tjmNKlu31DlKbr/Aca2aZy+AUqWxNJQJ+PbEhbuXC
         Po0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632238; x=1719237038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7n1vQrJKdah20S8ZMrVRWoElzUuvEAd8XeagF8Tz1M4=;
        b=t8ZxtAefZl7MjLVJeJkX751W2trB17yOnF3DP3ThGxW+bAbrPS8Q7tzUd5uUUc7mWw
         0eZhLUAtsqQkUdjNT7/UJwQ53KsB8xTRjkbR8p/+hKEq78ddKlOp4X3ef5Q1+USnGE4z
         jGnymoKUvzzxdHPzvKdwZl191jd1icZxOljxxl2pxlBzYNvuuYAnDvJPWu3wdC5yT7Id
         rEV7EvlHXic4cxlVwoqzM0aGBDVEj2vllk/wF1yiqV8dFTaDpPV1f9dP5yP6Y09joEzv
         z937EBN4gaIGoPZXlwlW7q4xzmnFoeMyTOzAC0bstuNm0z9ac4Gg7MkP5psWE5e8Dt17
         vVXg==
X-Forwarded-Encrypted: i=1; AJvYcCWy5BMBY9WCwfM2sfUfn+qUtjz4DRhcojYTIM1WW3m+Z8uCOAEWuR290HZTG+4FUH/QXHoWj60Y3YWwbMUmLAAgub/2nyVXe2cu80DxsEzNOm0=
X-Gm-Message-State: AOJu0YwR4ERvW4xiG5r4ggeJ55yV7Sb8OgDPkmOw98pya5hfYXjhVuWg
	XFNa/XsQnfyb4JD9lmoFhChGOhqT6Rp4kOgL/YR/2fN6LFJDQdPJ8pdpL9LzIPw=
X-Google-Smtp-Source: AGHT+IFPBsXk8OC1fXhOsjN5sQEyfL0NaDJoRNSti0BCnQHlNJa0XX2KPq4TD0tgoqruv2mBvc8G+w==
X-Received: by 2002:a05:620a:2947:b0:795:60b0:3f5 with SMTP id af79cd13be357-798d2430e27mr984123785a.34.1718632238585;
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:38 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:05 -0400
Subject: [PATCH v3 25/41] iio: health: max30100: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-25-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065041_349210_4DF94971 
X-CRM114-Status: UNSURE (   9.69  )
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
dGgvbWF4MzAxMDAuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAw
LmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvbWF4MzAxMDAuYwppbmRleCA2MjM2YjRkOTYxMzcuLmMx
ODY3YzJlZjhlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAwLmMKKysr
IGIvZHJpdmVycy9paW8vaGVhbHRoL21heDMwMTAwLmMKQEAgLTM2Myw5ICszNjMsOCBAQCBzdGF0
aWMgaW50IG1heDMwMTAwX2dldF90ZW1wKHN0cnVjdCBtYXgzMDEwMF9kYXRhICpkYXRhLCBpbnQg
KnZhbCkKIAlpbnQgcmV0OwogCiAJLyogc3RhcnQgYWNxdWlzaXRpb24gKi8KLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBNQVgzMDEwMF9SRUdfTU9ERV9DT05GSUcsCi0J
CQkJIE1BWDMwMTAwX1JFR19NT0RFX0NPTkZJR19URU1QX0VOLAotCQkJCSBNQVgzMDEwMF9SRUdf
TU9ERV9DT05GSUdfVEVNUF9FTik7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJlZ21h
cCwgTUFYMzAxMDBfUkVHX01PREVfQ09ORklHLAorCQkJICAgICAgTUFYMzAxMDBfUkVHX01PREVf
Q09ORklHX1RFTVBfRU4pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
