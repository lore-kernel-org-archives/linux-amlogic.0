Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400E4C2BA18
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+LRLU4CC/G/41vNJNGZlHYge7OvmFeeggBUKTmK6mU=; b=QD52nm9wWk+SVi
	yMEbyiQPJ++ucFm3W6HAwT8LC6dIQ7rz8g26xfwZ5WrytEDpmAx01qPsSuuUYccg4rplvyAzN+GQT
	p/kSywyOohxIBqyleDQn13RuuYOPvnSVjSVNvl+hw+xIRBb9X626DBqDdIsBCELSKxd5am+4XsHg3
	U4feGwvkQp0/6HFpuGlh+9ca+ul6cjC1NbDJSq8fZG5+IwURgEI5nUIasSlVTkyNwpnCrm0BxvYDp
	gYlJXE131VlHOkRNE2CI1wkG6oLMGzmwfwuTDSpcTCtXq0yiLkTroteHG/y5ZLlc9KzyhetaFi9MX
	KPdQkbgB132VV3OGYGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCmt-0000000Ayvh-3VGA;
	Mon, 17 Jun 2024 13:52:47 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkn-0000000AxMy-210j
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:44 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3d220039bc6so2467514b6e.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632236; x=1719237036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
        b=agdx/ZVnEa91hR8XzFNY+x3QAA+PPy8FUm9bUqm8SAqrbQQWT3DXrwoaDyc2r1TuUk
         I8+ZT2KAljjJsYtUPBA5MJBHfLzyMCQTlqDdtibKfAzc3F7U64fvb5/OHeFeb5XWJfrk
         POZf75oRfD+j+C4po3YED2LZSjYzDna6EV94XfZrplSUTnyT/Y8ybwjPKNRTR/I/qOSC
         wIPiuL6abanTTP0SUVZwdyNVJjK7QTzbSuuxD6Wnis7XTPyiJMwoXyFDd5/qCEwi3KW3
         YJwdaWMIxUmOSdWHcy0rUQgSJwZ5ian3ucvBzziyUps6B3oC1EUlaAYh+w/6cYMO7paP
         h1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632236; x=1719237036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGWBtK2gGzg6dOcIkV68NwvgEBcr/hA30WsTyKyEtwo=;
        b=EBx5XtqnSq6GpIGc1NrMhtPdrJ8HtXVD414pM0SZ3QhJfOf13KBuI3DnQyG17AHq7o
         oNqxbjktglAIKIftGTGsHkOAa+LbhCZiToyDG2SwigvfwKd3YgvKOfTUfugKZkV0WiQp
         bOA61zAEmxATcanqCKBvdBWmJ27aPepOZVd1tjb9+LkKeHK9b07AU9MBFl2L9xWcdGdY
         uh1wF+GPbh7XlwqBhk8x1PFu8dSj6Hi9VtGS4OYMoB7E+3S2xxxZiX3pjHjPyGvdozUz
         LEXJFAskq07kdolCUjyMJqyFxwdIDq+lfcTnMqGMfevAAAF5SGCr3mu0eLHzkwotwhP6
         ANsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjVsS/zqdzQuQ70B2WB2arukD1zPNduVIks/TpFKE4H8SySZ8cq/YxDWYaMmFhOpQZzxSagR3fjktUffSS0nBt/RL/qyDspn/r7iohWe5ghMc=
X-Gm-Message-State: AOJu0Yzuu3c3DrhPFeHhQ2LIe4VTjVvrpC0eTXlhJAaU2U2UYXqNFAmY
	Bsghnaoo4/5I4RqE0HF6FNVSvtNcwjORlzBMWOMHyf+P9o6SKjJe13MZDjovP00=
X-Google-Smtp-Source: AGHT+IENHYKm3NgqHa1MPYUPJeZqzEGABKtYhMj6CIPi8s9CW+uIlwWgMeUoLMPd9TX2TqZf6pVe1w==
X-Received: by 2002:a05:6808:e83:b0:3d2:27d3:2928 with SMTP id 5614622812f47-3d24e8f5deamr10493207b6e.28.1718632234195;
        Mon, 17 Jun 2024 06:50:34 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:03 -0400
Subject: [PATCH v3 23/41] iio: health: afe4403: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-23-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065037_856407_7CA1E539 
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vaGVhbHRoL2FmZTQ0MDMuYyB8IDkgKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDAzLmMgYi9kcml2ZXJzL2lpby9oZWFsdGgvYWZl
NDQwMy5jCmluZGV4IDFkYmU0OGRhZTc0ZS4uNTIzMjZkYzUyMWFjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2lpby9oZWFsdGgvYWZlNDQwMy5jCisrKyBiL2RyaXZlcnMvaWlvL2hlYWx0aC9hZmU0NDAz
LmMKQEAgLTQyMiw5ICs0MjIsOCBAQCBzdGF0aWMgaW50IGFmZTQ0MDNfc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCiAJc3RydWN0IGFmZTQ0MDNfZGF0YSAqYWZlID0gaWlvX3ByaXYoaW5kaW9f
ZGV2KTsKIAlpbnQgcmV0OwogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFw
LCBBRkU0NDBYX0NPTlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsCi0JCQkJ
IEFGRTQ0MFhfQ09OVFJPTDJfUEROX0FGRSk7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGFmZS0+
cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJICAgICAgQUZFNDQwWF9DT05UUk9MMl9QRE5f
QUZFKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC00NDksOCArNDQ4LDggQEAgc3Rh
dGljIGludCBhZmU0NDAzX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NP
TlRST0wyLAotCQkJCSBBRkU0NDBYX0NPTlRST0wyX1BETl9BRkUsIDApOworCXJldCA9IHJlZ21h
cF9jbGVhcl9iaXRzKGFmZS0+cmVnbWFwLCBBRkU0NDBYX0NPTlRST0wyLAorCQkJCUFGRTQ0MFhf
Q09OVFJPTDJfUEROX0FGRSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
