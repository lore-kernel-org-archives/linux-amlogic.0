Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51772C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjMLik7gl9RTTgRDjpva/kTZfC+rXvE2TljqGwJvGYQ=; b=X2dMm6b05M82kl
	qBK11+yyK1C6CJKCvVjukIeeuwdG9r1+bRRgFj2gIe5aVPxwFyDY4vnsKQ7VCEg1SWVYWbjwecsFN
	qRMMZ+gsvNgEOQCFeBwE+3V0i9e39o6zAPAfFOVALmSamFbLkmmgGmGTzeT7FlB7REWHY8jqdvEvp
	IXG5huG6gb/SIzAOc47pl2aFgGassJYWte0dTEiQXjHe3hVGcaQP66qlujAbSaTJ33oNYL04MfCcu
	rpK+d7LtcA7btJyuLLwV+0UlT1y5T/zqFbW6rw2Mf8LZt9eWiVV5dbcsKti37R/AiqEloY2Mrn5jT
	XsCD771etXGcVPmceSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkO-0000000AwzH-0jJv;
	Mon, 17 Jun 2024 13:50:12 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCk6-0000000AwkX-3VrM
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:49:56 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3d227b1f4f0so2385960b6e.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632193; x=1719236993; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=J/7agfne7tU6CRXIFGIpvWDHjGHCgF4Scqa7m+d/e6OFW1YAV1cXG8DXkV2xOSNTmG
         RjhDklAHEfMa1DxAsW9QDousc+CLRy5OurBgSSAgCrEHpJj0Zot4Hh2qVauDt0bykcLa
         MEqKdjW/Pcxfq+hxIMyUiScO2pqHamkwh3oWXCNOUieBTYOQucZnzaVseLb7/1vwfgJ2
         ZLDQvYsnPP5+Cy5HC/cwyMltoKZmxnpSvpdPavzGKvdeNsMJjDaEnX5b4UiH0krPrdHF
         zQh9q0AuzGJju1Fy3WnezqBwcAcCN4noXXyCYv6ptvXU3iIx/ikW0+MyA/PYaw+wC+7j
         q0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632193; x=1719236993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcLjABCmPDgHOzLEYjNK5DROGA4JTxd15k6kwWpFoxg=;
        b=TnnP7MnqDbMrEUBoB97+pS6jK30ZrFndunAwd8Gv5cdY41y311y8xiZXwBS1TxcC1+
         nNEF+0zgp7fI738zcw2eoXTn2u1Q+JSImg9uy5O1p+USr0DejPn5vDDVh/JlMaIASMxq
         3UfLwpmPf716tTzn75U7++AKPyU6vhImWf+JBljQnVxToxO6a2aD1kgdCXyPqyCQSJzc
         u6hdCDvj7GMiQrfwzfvkq0KJAppCNqy+WLsyEmwM19jqVpITFnqNhck43cGLMAubqeSr
         66FWUWBRem6AtpEyZCZ46ZXd9A0cEPy10alVrTGoval1ebY0sDhJ/7OXQ7JYuCr69XaI
         CVPA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ila6uV3O+/54Y9aC8CBrjYEhnDEjfQVeqvSXeSvwto8oQJ9MLl7GbRUIpCx6RhIuPQiXTfxj+lwVMkaBHNZ0DwYnFBod2FJw50N31hQBM4g=
X-Gm-Message-State: AOJu0YzYBRhpFyi779dT3wrzXj3tAN5o2PIhFJnmGO9YODVM43K7zg9Z
	znGoqMWc3ZseKSjBYTzvSh32ApMwjO3fK4GeENwS9nDjmoO7r6/NpeAhsEDVeQM=
X-Google-Smtp-Source: AGHT+IGzXK8LLO+jQf8g3iL5MCifYqjIipjPlFcW7eDQk67H8aKJxfmuoG4FYBXo33Z8PvtltK6jug==
X-Received: by 2002:a05:6870:4728:b0:24f:d9de:3bed with SMTP id 586e51a60fabf-25842b793famr10756815fac.41.1718632193273;
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:49:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:44 -0400
Subject: [PATCH v3 04/41] iio: adc: ad4130: make use of regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-4-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_064955_084262_C317BA94 
X-CRM114-Status: GOOD (  10.44  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2FkNDEz
MC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hZDQxMzAuYyBiL2RyaXZlcnMvaWlv
L2FkYy9hZDQxMzAuYwppbmRleCBhYWYxZmIwYWM0NDcuLmUxMzRkNjQ5NzgyNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9paW8vYWRjL2FkNDEzMC5jCisrKyBiL2RyaXZlcnMvaWlvL2FkYy9hZDQxMzAu
YwpAQCAtMTg4Myw4ICsxODgzLDggQEAgc3RhdGljIGludCBhZDQxMzBfc2V0dXAoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldikKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKHN0LT5yZWdtYXAsIEFENDEzMF9GSUZPX0NPTlRST0xfUkVHLAotCQkJ
CSBBRDQxMzBfRklGT19DT05UUk9MX0hFQURFUl9NQVNLLCAwKTsKKwlyZXQgPSByZWdtYXBfY2xl
YXJfYml0cyhzdC0+cmVnbWFwLCBBRDQxMzBfRklGT19DT05UUk9MX1JFRywKKwkJCQlBRDQxMzBf
RklGT19DT05UUk9MX0hFQURFUl9NQVNLKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCgot
LSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=
