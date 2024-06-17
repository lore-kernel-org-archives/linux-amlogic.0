Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4D5C2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guHTld2YLBlWsQMFvw6nrl24A0Om54kQRLuqW9KQnlQ=; b=rIlhcW+eWJqKi9
	L+4wCkVdivWAPwRfYYzKjWETCZA3UdY2cKVP/cUhtQ3RUFyvdCN6b6qoR489BqNQ7KVHn8RzHRpRt
	1E9hqJub32bEqwtV+GoC73/ZV3NrwDxyhttSO2Eo1C6C0H3LNn3WGNdSs8sPgPXSg7ygZOCGecSYl
	V92mq+2YJfue3+LSm7clsfzrbOak8p0IBjG5Wxftj2ZZkqwuYocwcNRvDjyYrw9eLg76MWipvOZDD
	cbBk/39TyFUWatGGcWVhDUkrqD9sCeWjzika0QeTYbPTVVQgxElK5e/1JCFiSjNSPTcCmGs8V49Od
	7FTIDf9uOWS4svZztecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrY-0000000BKfZ-2O4c;
	Mon, 17 Jun 2024 15:01:40 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClH-0000000Axpr-2fbk
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:17 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7953f1dcb01so389095585a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632266; x=1719237066; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
        b=XKFv00xUrOTUp57bC52zkN2VFw594bGqRYlm5MvQFRfeTpSgohnH59+eLZARE6fra6
         Lyfd5PboDfmQOn9E4z/VxOAJXtbOU6sOpzDZqEtUCqi3DQZXEVLav1wfg7rT7xMlr6fP
         c4+dr2Ww2Ga5sOjii3axayR7UqPU9zrpGoM0G4ZJMwTNZxz4n85tnNEpqxv4fzJ6rX91
         RcNv02uDl3ABHKK/JbXU8QFRYjC8bLOCrfnw9zgHyWRh2sVjgsDKfjiM7JN14QfPxNvA
         XLmOL3JieuI/prILYClbM0OkITGTDyI7yVfRA7FhQ8SOQHDG5mKzUfq1ytxeXCf7JO4m
         9WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632266; x=1719237066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79Hx9GfOVVYusy8xA5eoh/JX07K+FfT35u2XbTC3DMc=;
        b=Qoj1WI6O44veV29CreVsKIulZ3AArdJgHSDOlCEm0us8KHdDPyNUBYNCebKJc1Lqpr
         xPGrcwXlLOgLng1M0rYd9tBsqqBGX3fZtxupYeMMjTNxKCDq4ulcS+EBZqpG2R8UHszd
         ZFKFOd3zS09tB4mnGu8pAEePrTvLZbXh677EKYNjzbp9a1qF8/3nXpWjmEx7U+9iTTsB
         j7IlAjAR+Vz4a/eG+NOkrK/yTlFatqkIc7Xdjjlt3y6/qTGM9WhCP/aItvHDwAA+QxDd
         QD3Vue+CU5OtSUCjEyfsj8Q2LqNAvVXNhWGUf+ng5KUO139aJE5vs9uGPTuUPokxJtPG
         vv2A==
X-Forwarded-Encrypted: i=1; AJvYcCVYYUV02LTug8Ny0SZ2Q1VRLDyCokgAPRwF2TIPpHfH5xVpb8FJB+UKa10eAWUivL7lwziTpEVXApkLXnGnYh5qLeRYllCF68fst1WStLbIlkE=
X-Gm-Message-State: AOJu0YzSJsbVxbHujV3CSWfJySx0e5z+d525QVy9jAy1WuvJt843mIUG
	wK+6DD7KSjFYYZ+PUVZ2byAsCRGKmJmahgq+Pvq7cFxRqWvYYXjKtyT/jFmkbJ4=
X-Google-Smtp-Source: AGHT+IEx2KbRAk7Gdof/baHhrw8Y3qRBi2Hyio6LTg74NUhbwR1HRET1Zcy3yDqPrTQiSKqEfswRkA==
X-Received: by 2002:a05:620a:1a86:b0:795:5d6f:8bbd with SMTP id af79cd13be357-798d26a4644mr1303274985a.73.1718632266285;
        Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:18 -0400
Subject: [PATCH v3 38/41] iio: proximity: sx9500: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-38-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065108_022122_F3F45D38 
X-CRM114-Status: GOOD (  10.16  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTUwMC5jIHwgMTIgKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDk1MDAuYyBiL2RyaXZlcnMvaWlvL3By
b3hpbWl0eS9zeDk1MDAuYwppbmRleCA1NTBlN2QzY2Q1ZWUuLjQ5ZjRjY2Q4YTVjNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTUwMC5jCisrKyBiL2RyaXZlcnMvaWlvL3By
b3hpbWl0eS9zeDk1MDAuYwpAQCAtMjA5LDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgc3g5NTAwX2lu
Y191c2VycyhzdHJ1Y3Qgc3g5NTAwX2RhdGEgKmRhdGEsIGludCAqY291bnRlciwKIAkJLyogQml0
IGlzIGFscmVhZHkgYWN0aXZlLCBub3RoaW5nIHRvIGRvLiAqLwogCQlyZXR1cm4gMDsKIAotCXJl
dHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCByZWcsIGJpdG1hc2ssIGJpdG1h
c2spOworCXJldHVybiByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCByZWcsIGJpdG1hc2sp
OwogfQogCiBzdGF0aWMgaW50IHN4OTUwMF9kZWNfdXNlcnMoc3RydWN0IHN4OTUwMF9kYXRhICpk
YXRhLCBpbnQgKmNvdW50ZXIsCkBAIC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGludCBzeDk1MDBf
ZGVjX3VzZXJzKHN0cnVjdCBzeDk1MDBfZGF0YSAqZGF0YSwgaW50ICpjb3VudGVyLAogCQkvKiBU
aGVyZSBhcmUgbW9yZSB1c2VycywgZG8gbm90IGRlYWN0aXZhdGUuICovCiAJCXJldHVybiAwOwog
Ci0JcmV0dXJuIHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIHJlZywgYml0bWFzaywg
MCk7CisJcmV0dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJlZ21hcCwgcmVnLCBiaXRtYXNr
KTsKIH0KIAogc3RhdGljIGludCBzeDk1MDBfaW5jX2NoYW5fdXNlcnMoc3RydWN0IHN4OTUwMF9k
YXRhICpkYXRhLCBpbnQgY2hhbikKQEAgLTc5NSw4ICs3OTUsOCBAQCBzdGF0aWMgaW50IHN4OTUw
MF9pbml0X2NvbXBlbnNhdGlvbihzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQogCWludCBpLCBy
ZXQ7CiAJdW5zaWduZWQgaW50IHZhbDsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRh
LT5yZWdtYXAsIFNYOTUwMF9SRUdfUFJPWF9DVFJMMCwKLQkJCQkgU1g5NTAwX0NIQU5fTUFTSywg
U1g5NTAwX0NIQU5fTUFTSyk7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJlZ21hcCwg
U1g5NTAwX1JFR19QUk9YX0NUUkwwLAorCQkJICAgICAgU1g5NTAwX0NIQU5fTUFTSyk7CiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKQEAgLTgxNSw4ICs4MTUsOCBAQCBzdGF0aWMgaW50
IHN4OTUwMF9pbml0X2NvbXBlbnNhdGlvbihzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQogCX0K
IAogb3V0OgotCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNYOTUwMF9SRUdfUFJP
WF9DVFJMMCwKLQkJCSAgIFNYOTUwMF9DSEFOX01BU0ssIDApOworCXJlZ21hcF9jbGVhcl9iaXRz
KGRhdGEtPnJlZ21hcCwgU1g5NTAwX1JFR19QUk9YX0NUUkwwLAorCQkJICBTWDk1MDBfQ0hBTl9N
QVNLKTsKIAlyZXR1cm4gcmV0OwogfQogCgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
