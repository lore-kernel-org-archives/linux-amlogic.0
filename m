Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA39BC2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3FUZ/Q4rePrvcubGJGUPnGwRjoQWcfhpLvIg1Ml36A=; b=vwBY0iMjQWolwf
	7Jc6qqxnPBB4BougxhBXquyrOgAMZbK7YZbordYF8pKkOe6cSJwsA1Gh96w5Zs81iasbAj5c9taUY
	b7+A+oUTVIAwgC4/7YBWUguJPvX0bDSnU3EdROafnfmup+2k5N9z+pgbwtLe1+TWlvoLDfIvMkJ2D
	bmHgUWWcqbvcPNMtBCFkEW8PtRNjRvsfC/SqiSl2idV3jmz0mk9DD4sPN2NQZG8GmN0NKDB3zRkPa
	iRp+Q3nneMQ5CeY9H4kyhrv4T3tbmJPsGe/Vq+RLOsBOy7d4vDlTrF6wEi90XO97JIkeoTe1t7TzC
	jIMCWzxAfip2AxE8JBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDr8-0000000BKKJ-1s66;
	Mon, 17 Jun 2024 15:01:14 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkS-0000000Ax3Q-177h
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:30 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-797dcb558ebso286427885a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632215; x=1719237015; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
        b=H9bETH7NPyBdAtafP6V5xbQ/koL+OI/skxFH5OjIBCunDt4oe9dJeKYldJQcmkInKg
         bD+gqpjaJwsyuFBNyOq3vNmc2xhyZqK9XZfxiqzDto78mttz73ui02HEwBSsdpg4bPsA
         UzY1Zo223SuNzuQJ3T6u1Sd8DiXptvmzSsPvhLTPdPw4/p8BAd6cGqbutGRqshDDwdAG
         1KZa0HlsA0AwOSdDIxhiRjfbsDddZieLf1FP/xXFkzZoew+NblU3BSW5BhZcOrBvdid4
         EaRQf0YAFih7EHaK8bt6ovDorQkwnrg4BQcdSWbBZC2OrXx0OR3Js6DqQmIZssrhD/xw
         z/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632215; x=1719237015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyaMuqBhP7o7wmqZwNnsnkbTtRp5AugJ4lcsefsATFM=;
        b=nThCNnP/0yhnY7dqpAOe6QJ3efLAmRoiUecLLn3LqRV/Rk7ZuMzdLmeOepG0+wcQcb
         W/wVFZ9GaZu89Z4ntrN1IOd8Q5vJjVkwYGqgLCoy0fuCTAEj9daDdqkawi+iSfuos2iO
         NglgLclUaSXlu7HnUc8lxDbpAsVpA4wWhW508yLwZsuQdcuJsvyVimEGP7Fj7P8RRB9N
         0Z1Jr28nmS4TqTudpoNohN8XKw0c+DSc6Ww1/0vEKGjw2aZ1HGkaT1oRTV8fwApU9hxi
         ihmFVm3iXzvhSJK3irGoDngkxOLELyqqJJyT/42Uw24s83lWKvnFcR81QcCTKLjQAJ7d
         9buQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTl05n8beJ3uIY9ZFLwaWdZTYC/UaX7jKlJp0OHMj2Sq0y/n+RR5Iw8fYO+Z6zzS0s8QAbHMxwTmzPASCpS5/os5G1OBpokAzGtTda9itjcgA=
X-Gm-Message-State: AOJu0Yzi7+kYCspe41GtCKPYP3lgdg4sfTQw/taxkzHc+2b3l3UdwFzp
	DPyITJeUWxl90S2DJMesgCoYj6N9uncpMRqfjXAWNCApKcR4h2p5DBOrvQRtwC0=
X-Google-Smtp-Source: AGHT+IG9rvLxXHys5yM3fiDf+G14AWJNmGoLIu5wSpeGGOXNzHBF3wjPuE24N3ncETdlUUNQNA6oSA==
X-Received: by 2002:a05:620a:45aa:b0:795:4e64:dbbe with SMTP id af79cd13be357-798d1f824a7mr1191474185a.0.1718632214915;
        Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:14 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:54 -0400
Subject: [PATCH v3 14/41] iio: adc: mp2629_adc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-14-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065016_753243_B9BD3B3A 
X-CRM114-Status: GOOD (  11.09  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL21wMjYyOV9hZGMuYyB8IDE5ICsrKysrKysrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9tcDI2MjlfYWRjLmMgYi9kcml2ZXJzL2lp
by9hZGMvbXAyNjI5X2FkYy5jCmluZGV4IDdjNjZjMmNkNWJlMi4uNWY2NzI3NjVkNGEyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvbXAyNjI5X2FkYy5jCisrKyBiL2RyaXZlcnMvaWlvL2Fk
Yy9tcDI2MjlfYWRjLmMKQEAgLTEzMSw5ICsxMzEsOCBAQCBzdGF0aWMgaW50IG1wMjYyOV9hZGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbmZvLT5kZXYgPSBkZXY7CiAJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaW5kaW9fZGV2KTsKIAotCXJldCA9IHJlZ21hcF91
cGRhdGVfYml0cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkwsCi0JCQkJTVAyNjI5
X0FEQ19TVEFSVCB8IE1QMjYyOV9BRENfQ09OVElOVU9VUywKLQkJCQlNUDI2MjlfQURDX1NUQVJU
IHwgTVAyNjI5X0FEQ19DT05USU5VT1VTKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoaW5mby0+
cmVnbWFwLCBNUDI2MjlfUkVHX0FEQ19DVFJMLAorCQkJICAgICAgTVAyNjI5X0FEQ19TVEFSVCB8
IE1QMjYyOV9BRENfQ09OVElOVU9VUyk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGRldiwgImFk
YyBlbmFibGUgZmFpbDogJWRcbiIsIHJldCk7CiAJCXJldHVybiByZXQ7CkBAIC0xNjMsMTAgKzE2
Miw5IEBAIHN0YXRpYyBpbnQgbXAyNjI5X2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlpb19tYXBfYXJyYXlfdW5yZWdpc3RlcihpbmRpb19kZXYpOwogCiBmYWlsX2Rp
c2FibGU6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENf
Q1RSTCwKLQkJCQkJIE1QMjYyOV9BRENfQ09OVElOVU9VUywgMCk7Ci0JcmVnbWFwX3VwZGF0ZV9i
aXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKLQkJCQkJIE1QMjYyOV9BRENf
U1RBUlQsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19B
RENfQ1RSTCwKKwkJCSAgTVAyNjI5X0FEQ19DT05USU5VT1VTKTsKKwlyZWdtYXBfY2xlYXJfYml0
cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkwsIE1QMjYyOV9BRENfU1RBUlQpOwog
CiAJcmV0dXJuIHJldDsKIH0KQEAgLTE4MCwxMCArMTc4LDkgQEAgc3RhdGljIHZvaWQgbXAyNjI5
X2FkY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlpb19tYXBfYXJy
YXlfdW5yZWdpc3RlcihpbmRpb19kZXYpOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJl
Z21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKLQkJCQkJIE1QMjYyOV9BRENfQ09OVElOVU9VUywg
MCk7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGluZm8tPnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RS
TCwKLQkJCQkJIE1QMjYyOV9BRENfU1RBUlQsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGluZm8t
PnJlZ21hcCwgTVAyNjI5X1JFR19BRENfQ1RSTCwKKwkJCSAgTVAyNjI5X0FEQ19DT05USU5VT1VT
KTsKKwlyZWdtYXBfY2xlYXJfYml0cyhpbmZvLT5yZWdtYXAsIE1QMjYyOV9SRUdfQURDX0NUUkws
IE1QMjYyOV9BRENfU1RBUlQpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBtcDI2MjlfYWRjX29mX21hdGNoW10gPSB7CgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
