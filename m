Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5011DC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo/PF/ij93vFYVsvLyEj2QNN+F9BShGxjDwA1M0OshQ=; b=NGxR1f7W94GUpn
	OJYm+gKyu4TZOcfvIOKyqLkEzRyrXczhhjFO35yNiwegzpd7Y/klc9Chw7oRtU1oreFw4lsM8rQ4k
	iSMLw6UbznW0IyKPM45DtoNCoZaMHLvxrTjQ7S1ZcYl1Ip568cYi4rTirWzwLO6dJdZO74i3LyBMo
	YrXiyT2ouFGGWky9oTxD/+e+ABmczWV69oy9F5vGZN5HrJMGt8B0v6wuGuANvkIT3y79x6PSoLfeJ
	Tar8oWPUQNtfVEOOYMxl+zzIH+dXRjyNGajkVONg27eMNdLLbqc5pdaQmYg4uKLrTnATG4UFHp+Ra
	MSyi8kmCHgkvmtR6RKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCog-0000000B0Po-04rz;
	Mon, 17 Jun 2024 13:54:38 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClD-0000000Axlb-0lyG
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:09 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-254d001d03dso2082880fac.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632262; x=1719237062; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
        b=ZRW2ww0NDW4aYlhCaME/E9vKjcSlkZcGcaiSyVic59a87F3AETdPZsaiz6zph5vGTH
         nM34dS38371T4224w6ByUCPjAhz1iL7EmF5oXXc5EfXro7/4v54ijTrMmZygPJbfgJSL
         LB098r6L1aYUYGFx8lg/hKyt4u+Xcb+Tc/zjFZLMK9R0s1TiN+EYb6izxo4EGEV3BX/u
         q7dMrn2sjsHHuL4Ng/BgqzXjBNRRuTDtjrNRZF7A3njS/G+BRc467LQsV7Vh2NVPCpH9
         eBfw9Artxq57vFpZFHpjnJLmEcYYrzOWYx4HqJhFUEe5TLizMFinT8JQM56DtAYpGJXg
         /7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632262; x=1719237062;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tk27b9u+l0CzDHHIWu0wOizrcdk6I7Pf7l1UE2LHs0=;
        b=UGxdZPLPxK9tF9UwfgQNtIB07LJXTqtvAMBF/dh15l578fU/njNh12lV9gtNIhDPGf
         OQOPcmHvU+dkxoSr5+wdptVF4Y8ULPv2zPLiRyaEgG7uzReU+ezJWDoWUtqEa1Ae5KlJ
         XbzLlQUmcdsqc3ODdSlEOSwDAMADL0fwDbV27EmpPu3cpyCRo77Omw987KtMIZFwIQv6
         PVZwMDQ8/Lu32CvBoConJ7zVceCtLnR+PMC4p/1OpysAGkNUU+0Cn4veNbrYgkTWTdCa
         kTIf/W7tayInANI2agKS6QbeFjfV19Ib9hsN+fhDL9U+8iuY2AqzQwn0ABWQeS19GHL0
         9WeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoF7nkTwX5MTUD9fkf+Xwwv2t1IhCGgn5zVTM11q5dmZi2Zz6x2wJmmF1wNbXADFqHz4YQPOvWKAsxnk8Dfpxv7F8U4OJyRy3tBfQT8J9aemg=
X-Gm-Message-State: AOJu0Yz+mUW5OqQdPKO2TrS+uCZWE0VSmI/ke63abZr3tmsIzLv4L+nQ
	xW1fE24vBlFJxgDEam9rGhqQWlyOSE3MbJX2nYDKf96uTVA6CiAmQ7Xxorh/6T0=
X-Google-Smtp-Source: AGHT+IFPuCaLYR0OC2CKxxs6bVWzV0l0Y4GqKpcVsLYm2jLp2HnQirR7TaXtLxRY2U4vfGwAEVGQmA==
X-Received: by 2002:a05:6870:89a4:b0:254:7471:56b7 with SMTP id 586e51a60fabf-25842853b1bmr11345694fac.11.1718632262042;
        Mon, 17 Jun 2024 06:51:02 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:16 -0400
Subject: [PATCH v3 36/41] iio: proximity: sx9324: make use of
 regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-36-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065103_525498_0F559E1A 
X-CRM114-Status: GOOD (  10.12  )
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
dm9yIEdhbWJsaW4gPHRnYW1ibGluQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2lpby9wcm94
aW1pdHkvc3g5MzI0LmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkz
MjQuYyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzMjQuYwppbmRleCBhYTBkMTRhNDlkNWUu
LjYyOWY4M2MzN2Q1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJveGltaXR5L3N4OTMyNC5j
CisrKyBiL2RyaXZlcnMvaWlvL3Byb3hpbWl0eS9zeDkzMjQuYwpAQCAtODM1LDkgKzgzNSw4IEBA
IHN0YXRpYyBpbnQgc3g5MzI0X2luaXRfY29tcGVuc2F0aW9uKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYpCiAJaW50IHJldDsKIAogCS8qIHJ1biB0aGUgY29tcGVuc2F0aW9uIHBoYXNlIG9uIGFs
bCBjaGFubmVscyAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIFNY
OTMyNF9SRUdfU1RBVDIsCi0JCQkJIFNYOTMyNF9SRUdfU1RBVDJfQ09NUFNUQVRfTUFTSywKLQkJ
CQkgU1g5MzI0X1JFR19TVEFUMl9DT01QU1RBVF9NQVNLKTsKKwlyZXQgPSByZWdtYXBfc2V0X2Jp
dHMoZGF0YS0+cmVnbWFwLCBTWDkzMjRfUkVHX1NUQVQyLAorCQkJICAgICAgU1g5MzI0X1JFR19T
VEFUMl9DT01QU1RBVF9NQVNLKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCgotLSAKMi40
NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
