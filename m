Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2581C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJxmNEavPx6due4CMPsHAHdfzBF+CIQn8709/BG4NhI=; b=YKorSc/hRazDPj
	EVfDlQ5fbEfNijciG7Bycd6p2B9LkuoeBNPdtIVDuxksTi7QZyYeM9Lz3r1EmgrgHa4VaKfrw36G0
	fd6g+2Q73NHoJltD0u/UsLFg+g1AQ0QjLgbvm68CnXY9Q8X/Ap4lc6zLPM7Uk2s7r+anqijotg8Nc
	/XN7swW7Mt8OeqXb4T2xgdOVQ41J9wmg9xRYdVYgDHsRtiyTT5KH8Ks2FjmQTRWde59zevaaY+i+/
	HAkr0VIUh0gzIweu1rEqXkqaRqHPlfJ26G1G7ptjhvyXqgbtaXMcem2615rmy0naQjaPkJBUEu7+H
	Y2MccCYlt1d+WgCboE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnL-0000000AzIs-2dQe;
	Mon, 17 Jun 2024 13:53:15 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCko-0000000AxNT-3HSD
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:47 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-80d68861bf9so1534835241.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632236; x=1719237036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqMe4af98NHJiZdRmZKfGjAtSzwLMs3Usdpoxv76E0s=;
        b=dENKeH5mDMxJgCOAaIQYIUHZngon76uKfFjoMnRycl1dU8WKPBlj3LqHl32j5pMgt7
         Jyn8HQMK8qJ3VWZtFSJWpjNKn0CznBti6HcbUJNdFeI1HCJgzWtb+NRd7aY5JQXCwta5
         MGKBJWGWgGXUcamusJllF4uEUlk5eqJoMAghKf7UQWRzM4UXpFAgbVB4lOlU7+V+HuPy
         MuDNkAxq0e6jVEDPM9Dke0SdsDA7+pguqLed9kEpPrTi3yR3Iv1ecH0sdXVrLf+Kxxbr
         INnMb4mZwXwJG3NU2rYu1FwUWQv5Yjx1Mie1MytyFHv0jSxOxD8bi7IZuXMzFBw0mwg9
         vljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632236; x=1719237036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqMe4af98NHJiZdRmZKfGjAtSzwLMs3Usdpoxv76E0s=;
        b=iQ6olsuKtD5SkDO5mOdrzo8lHM6m/ge73ROMsxb661FD20vpiLgqMxcAISsWQ/aqyA
         yjycKL/3XPXPgkv9Nz2guiNrELWjywrmKXzCqg8IOHAGuK9105Cko52dwlpDiNwljRkd
         2sS09/YYL2d0BDMc0gkYXpCuHmhUuicYbDCZaz9V9yL40KHrDkbvBO5SsAeghzGbwjTN
         DuVzUoBx1PG0V7TYOzZJ2k8IMSH5He74hMWwek7stcJso1CQ9knBV2LGW7abM75rIpmi
         UXO1Fw2DcwzhahkQeIJbNXScLsfaFRqOB2bA9ETdubiCFFSkI0HKWZ7kkXBaYa/1lNS+
         gx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlMq53DQY/PoAWzWz3BidAFUXQxUzxSqo/huwgDhe+9BBjXxGFau1PtDYtjDfpxNTpG+OPvSSJneczWkX5ix8/UXgsYIIF1jyyiGSnEn2nsn0=
X-Gm-Message-State: AOJu0YwHc+e4y84Cx2XAGtW5kp9veD33pH8cqZ7ACk2cubPx++Ew6a3g
	VIj6sDF1TDtNbNcxnEZJ/ee1DzpEC3TMP20+r/V8Ffe2TmeAEmP1apLbSOJm0V4=
X-Google-Smtp-Source: AGHT+IFihHa6bMcNzaeLIOOLDw8PfmzIsl9aK4RVvUYriLx2jOAq5E+Axp1aames8cM1+wIsIKtc2A==
X-Received: by 2002:a05:6102:3b96:b0:48c:19d7:eb83 with SMTP id ada2fe7eead31-48dae3f30ebmr8867679137.34.1718632236471;
        Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:04 -0400
Subject: [PATCH v3 24/41] iio: health: afe4404: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-24-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065039_413512_4562E5A7 
X-CRM114-Status: UNSURE (   9.54  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vaGVhbHRoL2FmZTQ0MDQuYyB8IDkgKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDA0LmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvYWZl
NDQwNC5jCmluZGV4IDc3NjhiMDdlZjdhNi4uNTFmNGJlMzlkMjBiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2lpby9oZWFsdGgvYWZlNDQwNC5jCisrKyBiL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDA0
LmMKQEAgLTQzMCw5ICs0MzAsOCBAQCBzdGF0aWMgaW50IGFmZTQ0MDRfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAJc3RydWN0IGFmZTQ0MDRfZGF0YSAqYWZlID0gaWlvX3ByaXYoaW5kaW9f
ZGV2KTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFw
LCBBRkU0NDBYX0NPTlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsCi0JCQkJ
IEFGRTQ0MFhfQ09OVFJPTDJfUEROX0FGRSk7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGFmZS0+
cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJICAgICAgQUZFNDQwWF9DT05UUk9MMl9QRE5f
QUZFKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC00NTcsOCArNDU2LDggQEAgc3Rh
dGljIGludCBhZmU0NDA0X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NP
TlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsIDApOworCXJldCA9IHJlZ21h
cF9jbGVhcl9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJCUFGRTQ0MFhf
Q09OVFJPTDJfUEROX0FGRSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
