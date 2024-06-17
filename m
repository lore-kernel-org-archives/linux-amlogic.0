Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B4BC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wF3vdOViNuSZHyOEpmAAcheUvRTK8pguc3p24rzfUPw=; b=0oaLIIaChpCQos
	8+1c2IHvoQLjMPAITWVT/ao7DQoX9yA0FQvXIPdafta8EJPAz6mLJ3hhQOSMsclzYLKyIcO1nrajI
	Tq7dI9O7+eCb3kc2LOPbtwGErZZnFhtVhz8e1UCgKyweNhn767lOpa4PLAPCT3x5h4eFvkvNkyANr
	64h5X+WlgWuVYCzfG+lC09L3qIDEUAXe8lDijUf/nDflLcMOMV5TvpzZYipnMMg3rbFqD/knyMbVL
	5lYOWaPSQ1HBAhftqRgtnZbyph7FOCr6r0nplk6WQj+0HC5c7uGCfhzw+C3zoX0Q07VDn6+hAYZiO
	fhheq9aqjeJPK7nfEG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnf-0000000Aza0-3ddp;
	Mon, 17 Jun 2024 13:53:35 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCky-0000000AxYO-3ihh
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:55 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-48c38cc7810so1292392137.0
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632247; x=1719237047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DclUw90neJHmAEodckLVU1MrMAClwpCF1mlaeSjcN+U=;
        b=OjFPQkhl6K6SsrQ/CRGORZQTvU5S3AyOvJB0gdCQdYyPzeqmwZw06SzaOAqXDBZaJs
         1yd21oXwFqMtGXskAtLgAKvF0LlDZR5awNL8KgXELcQgMr3S6X1dpA6iQTnnxANfqgjc
         QjG4oiIOh7bx8u7kud0dAw12YIjYLlZ5VOvGXHdF4AkoxDhrAuKzZ5SQ8x1oWCIoS/rU
         48UW/Tyg7DmMqU+EBF9Av/awzKiE1AmKI9h8gRW9aAra4VbYQbsSb8dro55pGpY7bliE
         4Mtd83eGsyi4kPGpz6XT010kXiSoZLTKs4l1gXDtopnBEjKfhHP3KbZMjypQVjOD62ZP
         RzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632247; x=1719237047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DclUw90neJHmAEodckLVU1MrMAClwpCF1mlaeSjcN+U=;
        b=LeK7lpr1LZDCKrVRQP2Q7DeK/pNNr3V56sZ1khypXVQfK1aAK1cJkRSrQmeYZ3+DaP
         y+Oo68Ek/iJzzRcET2MHPGOXyzex0yIJdAoGdNb7qU/2xSqRh7FW3ja6jkKDzOhFRrcR
         jSYwEgWUZuIpSfw7VA0UPSsfBuTmvOxHF+rFa62v9qAL5+xKnbKVNIUKXhmDUfdP0Dkp
         mkkJVvVWJBa84YYAhAhEfFi/wo4XMj+8IqXRi/3OHw9SgpWab7QvfQLiBkmBRyFv7ZTO
         1Rf8f/JeoRUVhvjIuH8Cmcp/ZeCbP7RV7KjZqzB5bDik+tZx2XSKlmB9Cioj+gzmkUU+
         8JzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJXD8YxSK6/uiGBqmmDqZwxZH5aAmwzBrnqiTGV0uqTcU+wWwLPNFviuu87dW++/waacVfzxcarP5hmjXWORfgvLAe1d5xAKGKnB8Rw0lYWl8=
X-Gm-Message-State: AOJu0Yy3KS5a4LV8jedqcWeQw/Pz81RDUB9rjnuWvv2L35P88+7KV8EI
	ISZSc+oGRzNoFxD8VYCZIMCiQv57q/5zTXSs6NBdp96Fkyxs1aCVa+uhJNIbsCI=
X-Google-Smtp-Source: AGHT+IEubRIeXP7Kagp49NVByjjGeveFz51rlB4BKjhqfHfpKBEa7G7VixyRzOvMhLylvoLMhbPrtQ==
X-Received: by 2002:a67:ec98:0:b0:48d:c0ab:ac20 with SMTP id ada2fe7eead31-48dc0abad12mr7057846137.7.1718632247057;
        Mon, 17 Jun 2024 06:50:47 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:09 -0400
Subject: [PATCH v3 29/41] iio: light: iqs621-als: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-29-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065049_156283_48161C3A 
X-CRM114-Status: UNSURE (   9.77  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvaXFz
NjIxLWFscy5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYyBi
L2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYwppbmRleCAwMDRlYTg5MGE0YjIuLjZkZTMz
ZmVhZGEzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vbGlnaHQvaXFzNjIxLWFscy5jCisrKyBi
L2RyaXZlcnMvaWlvL2xpZ2h0L2lxczYyMS1hbHMuYwpAQCAtODYsOCArODYsOCBAQCBzdGF0aWMg
aW50IGlxczYyMV9hbHNfaW5pdChzdHJ1Y3QgaXFzNjIxX2Fsc19wcml2YXRlICppcXM2MjFfYWxz
KQogCWlmIChpcXM2MjFfYWxzLT5wcm94X2VuKQogCQlldmVudF9tYXNrIHw9IGlxczYyeC0+ZGV2
X2Rlc2MtPmlyX21hc2s7CiAKLQlyZXR1cm4gcmVnbWFwX3VwZGF0ZV9iaXRzKGlxczYyeC0+cmVn
bWFwLCBJUVM2MjBfR0xCTF9FVkVOVF9NQVNLLAotCQkJCSAgZXZlbnRfbWFzaywgMCk7CisJcmV0
dXJuIHJlZ21hcF9jbGVhcl9iaXRzKGlxczYyeC0+cmVnbWFwLCBJUVM2MjBfR0xCTF9FVkVOVF9N
QVNLLAorCQkJCSBldmVudF9tYXNrKTsKIH0KIAogc3RhdGljIGludCBpcXM2MjFfYWxzX25vdGlm
aWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbm90aWZpZXIsCgotLSAKMi40NS4yCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
