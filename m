Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BE1C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3MwfNC5TvONZNcpeJaEaTN24hdSVabAeWUodJq3dAE=; b=bYO9i0MrDDKqaw
	l9UpohnYtFEr+7tw7VL0dgY/bli5AnoSKKRFIon9/GR2tfFJKHZsXi/0QVQMxQsi28bzW+58vWQkn
	UJMWDOv/Jj0iVrPzpEMeA+HYT399UioVKtM/u+n/y4aFyQBaCuVuANt55B0/hD3Nit/QMymBXMyEl
	l8f8qo/p2Ex4TpcyKVvbhEnSjjYh3f38+vHGXQbkRul0WTpJsSBOOk/8e0gNsnoyMH9WClAWrYqFC
	riKGJiepoYzUlgl1REhZJrHwtimysgnK4hh3ucHOpSN/E5CpEvWhcfu+qECwS7uUMWk54L0g1IBPW
	2SyGpBXPMOpq0eK+mpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCms-0000000Aytw-119A;
	Mon, 17 Jun 2024 13:52:46 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCki-0000000AxHr-0JNt
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:42 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7954f8b818fso290900685a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632230; x=1719237030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
        b=WQGmHoQ0VS2USINi7Db71fhi0FwycK1OXvADlvH7nTeTN4iyVVjc7/0lt9SRfx+5LT
         foNYHsuEDzO6fH/K3Auxbr0qUrFCfjWGJMmqhV6oNtsAF/SQBlSH+KJ2oCTzNetHFz2X
         Lqu622pNUhcjGnJf2lbRiQ/2rMsLoMgw84N1n5438eozidEnRanfdDRp0DQ9GlcERMcN
         JBProYA0f6IBMl7QhgCTfX83hdsF1M6Tr5gb7psdlkmU9N1Znl48MtwLgNZUcCKoXwhu
         3nyLErGLifk2vxudySutCeiJA0hQf8qiEsVKT7ghXJspSZi9ZqypJFqC2ZkLxRVkEi6p
         9INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632230; x=1719237030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DerxFnnoYXb7MP4GOUVN2xlgxjAao77OyLSOrDCydO0=;
        b=vxPSgup+JlhR5zLgVq1jMe8H94KnUEucKQ3ifPC3dhfcfGUewq8m8q7Bn5hQwiwYtI
         Kb+IwtIuwNk1DYIkMXSwXT70CvT9WWOUoV9T8rVWIBA2JtdZ4qVbM26hNmpGHhugNn2T
         4LETe1FEOyZ+GM/dCOVQaXiRmx4Gj6ZWnKx6FK7XN8QS65aK6I5QP/zNuN9UoRQGnwL3
         d8Ruit1H3MnM1kceqQtAzJKD3lcn8J0Gjz07qGqCIR70ld0waMmgN5aU7+0YRG7Dytgd
         ur0hcfIijq42mnfBzWmoaY/GSpVJYvtnVo80ydG42h1+ioprRLsLjWOV+jdjiD/LMW4R
         ZqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFVRYAwYnxqokQQgEYod7HbaBFVYTT2SyOYza+izbfGmw7Wb1KzAgE26Udnrh2tpxbXaSHF7r2/MrNUy0JdnFB4nRygabIreynN1CY7XAiKNM=
X-Gm-Message-State: AOJu0YzBC4ZsZY4aYZePQGDAqPJs8zUF7Ez7sMv487gi3oYIRwqANwQ5
	jD/Zxd3z644Jo/6TDV/5DFPIhli9IeTRxI7OFGKC0YKXHKv0LN6Rbswdq/DE+JM=
X-Google-Smtp-Source: AGHT+IHxtzkdFJwlDchh8tO2N+M/GUfc/zgUMeSNzO08CBN63HSCP+uPJVwg8RWxzdMRcwiKU/TPZA==
X-Received: by 2002:a05:620a:2443:b0:795:4e2c:eabf with SMTP id af79cd13be357-798d240dcf1mr1259752585a.26.1718632229931;
        Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:29 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:01 -0400
Subject: [PATCH v3 21/41] iio: gyro: bmg160_core: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-21-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065032_581481_CCE3B095 
X-CRM114-Status: GOOD (  10.66  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vZ3lyby9ibWcx
NjBfY29yZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYyBi
L2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYwppbmRleCAwZTJlYjBlOTgyMzUuLjEwNzI4
ZDVjY2FlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vZ3lyby9ibWcxNjBfY29yZS5jCisrKyBi
L2RyaXZlcnMvaWlvL2d5cm8vYm1nMTYwX2NvcmUuYwpAQCAtMjg1LDggKzI4NSw4IEBAIHN0YXRp
YyBpbnQgYm1nMTYwX2NoaXBfaW5pdChzdHJ1Y3QgYm1nMTYwX2RhdGEgKmRhdGEpCiAJZGF0YS0+
c2xvcGVfdGhyZXMgPSB2YWw7CiAKIAkvKiBTZXQgZGVmYXVsdCBpbnRlcnJ1cHQgbW9kZSAqLwot
CXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIEJNRzE2MF9SRUdfSU5UX0VO
XzEsCi0JCQkJIEJNRzE2MF9JTlQxX0JJVF9PRCwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGF0YS0+cmVnbWFwLCBCTUcxNjBfUkVHX0lOVF9FTl8xLAorCQkJCUJNRzE2MF9JTlQxX0JJ
VF9PRCk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2VycihkZXYsICJFcnJvciB1cGRhdGluZyBi
aXRzIGluIHJlZ19pbnRfZW5fMVxuIik7CiAJCXJldHVybiByZXQ7CgotLSAKMi40NS4yCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
