Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03943C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8z9oNpUUz/ASqoIOGoyT8kAEkzzeVM71NXW61sPS29o=; b=eQUxGzihJJGMWf
	faLaoa9uAMnwEtdJ9aChRnsXM7GZkH+if5BGTzgw2ERiUEc0hQWzxv0KweguTjwCffbd46U6aF5n1
	bYc/q3mhLha74VpSLKyLKclgMKUvhkJgMBkopF1abxlwhp1uKrv2o0z5BTHkrLMOHc8FNB9Foncbn
	jA4DiOG2QbFHpJ0f9IfnOxS47vmzOceITg0mQ3UIH06V6jRoY4S2udgP10aJ6XHTeZnLZ9Z/KOi5f
	t8GppPP2jjaMDNirzFrTUD8sGGnnSc3JKV8mJdW9Az6fGQMHheXdPBJnIgkQGk4mkLUPkNd8IT6Lf
	0/x1tQ3kiqro88oRQF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClD-0000000AxmO-3IoV;
	Mon, 17 Jun 2024 13:51:03 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkH-0000000AwsV-2ue9
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:09 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7953f1dcb01so389035285a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632204; x=1719237004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=yNeJfl6BraxpB5EAgtCMRVeBOqrTwS7IVIG2jjV86QYKRd3cLc1asf8KDYH1EGcjy+
         8DHCj61IQ9BUAWHb7sFunVxzf907cTu2hlM+echpzyOi46bAEmCo4Pj1cwFnhDLhI3/8
         Nfenmv/6HSUfAS0PvOgrXsSPdMcLPXl7v7WunkpbnJiYcpVmCtpr9/c2pVeeAquFk46i
         xIvuSqXiMz9kA9xtgqYXSRa2jkqxhxNEUqlDxeyAdN8drb9y/jXB6Hurq6Pw5dNWXn1w
         EMqTJyWNiBOejJ0ow8wrbZX8Yv/ZPT9wwqFTtNv1sEbGBjtHTWGq2vGzkeRA6nz27Xar
         0mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632204; x=1719237004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClhrI/fyo1cx6bZjSpXIGRy7tTTxclMqWX7+F4JU4yY=;
        b=Tku54kr69MfTIusI+kBLvU45+w+6BAhsJEAX8xNHTWfVYJVbdA2j8K9KVAx6K8gNZS
         z7CSL3X6hlEUnXfVnHqhkqu3ON0HBj4Ls8M5GaFZTYv+S2ridSbgan5i3tdGTDPNLka7
         xYMXCgAQOWRYOzV9qOfYTw3QwcG6s5OUDvGDY0J20uSU0RAUTcLW+iyXTO3EGuGvZti3
         ykRRAxHtiysypCM7y+iavnR/u8m2j5yTzXq5hTdA0Ee2L2RWWyNeoeGcTnMt+BPUt77j
         nLGWlbxt2tVioi7uZVbbKe2JNTN38V1F6MrfpDLbCeIKz8jd2vPwTiH1nvTf3X7BkS1Q
         bBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvQhqt77XdZHcyfo+4b7yjq3qdBi10zISFfYE6+p5PUVa+86dEqKKnNI9puiG6CgbW0MGKl3SUof3IbA3eihBasfnz/dOab4V86GG20Qzza6Y=
X-Gm-Message-State: AOJu0YwFfUN+mXdcl02Bd8hGAFW4h845ljviZetSJNQ7mzaY4eYAiESH
	PS+2gcbNuBU5OC+jG7jX+xr46+7sq5sHDhp4c1qJFLQ39nxGLSQsup6MRZDzTDA=
X-Google-Smtp-Source: AGHT+IGEJP+y4ORB/qQsSLGS1aQN67uw6XFJYR5D2HpTVdZajfNzX+EcKLbp10S7XC6/Qne2Ev/fMQ==
X-Received: by 2002:a05:620a:4721:b0:795:55a1:9dd3 with SMTP id af79cd13be357-798d23c4382mr1195766785a.16.1718632204033;
        Mon, 17 Jun 2024 06:50:04 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:03 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:49 -0400
Subject: [PATCH v3 09/41] iio: adc: cpcap-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-9-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065006_419288_8D31259B 
X-CRM114-Status: GOOD (  10.03  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jIHwgNDYgKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L2NwY2FwLWFkYy5jIGIvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jCmluZGV4IGI2YzRlZjcw
NDg0ZS4uYzIxOGFjZjZjOWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvY3BjYXAtYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2NwY2FwLWFkYy5jCkBAIC0zODUsOSArMzg1LDggQEAg
c3RhdGljIGlycXJldHVybl90IGNwY2FwX2FkY19pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRh
dGEpCiAJc3RydWN0IGNwY2FwX2FkYyAqZGRhdGEgPSBpaW9fcHJpdihpbmRpb19kZXYpOwogCWlu
dCBlcnJvcjsKIAotCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQ
X1JFR19BRENDMiwKLQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywKLQkJCQkgICBDUENBUF9C
SVRfQURUUklHX0RJUyk7CisJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEtPnJlZywgQ1BD
QVBfUkVHX0FEQ0MyLAorCQkJCUNQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAlpZiAoZXJyb3IpCiAJ
CXJldHVybiBJUlFfTk9ORTsKIApAQCAtNDI0LDIzICs0MjMsMTkgQEAgc3RhdGljIHZvaWQgY3Bj
YXBfYWRjX3NldHVwX2NhbGlicmF0ZShzdHJ1Y3QgY3BjYXBfYWRjICpkZGF0YSwKIAlpZiAoZXJy
b3IpCiAJCXJldHVybjsKIAotCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcs
IENQQ0FQX1JFR19BRENDMiwKLQkJCQkgICBDUENBUF9CSVRfQVRPWF9QU19GQUNUT1IgfAotCQkJ
CSAgIENQQ0FQX0JJVF9BRENfUFNfRkFDVE9SMSB8Ci0JCQkJICAgQ1BDQVBfQklUX0FEQ19QU19G
QUNUT1IwLAotCQkJCSAgIDApOworCWVycm9yID0gcmVnbWFwX2NsZWFyX2JpdHMoZGRhdGEtPnJl
ZywgQ1BDQVBfUkVHX0FEQ0MyLAorCQkJCSAgQ1BDQVBfQklUX0FUT1hfUFNfRkFDVE9SIHwKKwkJ
CQkgIENQQ0FQX0JJVF9BRENfUFNfRkFDVE9SMSB8CisJCQkJICBDUENBUF9CSVRfQURDX1BTX0ZB
Q1RPUjApOwogCWlmIChlcnJvcikKIAkJcmV0dXJuOwogCi0JZXJyb3IgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCSAgIENQQ0FQX0JJVF9BRFRS
SUdfRElTLAotCQkJCSAgIENQQ0FQX0JJVF9BRFRSSUdfRElTKTsKKwllcnJvciA9IHJlZ21hcF9z
ZXRfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURDQzIsCisJCQkJQ1BDQVBfQklUX0FEVFJJ
R19ESVMpOwogCWlmIChlcnJvcikKIAkJcmV0dXJuOwogCi0JZXJyb3IgPSByZWdtYXBfdXBkYXRl
X2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCSAgIENQQ0FQX0JJVF9BU0Ms
Ci0JCQkJICAgQ1BDQVBfQklUX0FTQyk7CisJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEt
PnJlZywgQ1BDQVBfUkVHX0FEQ0MyLCBDUENBUF9CSVRfQVNDKTsKIAlpZiAoZXJyb3IpCiAJCXJl
dHVybjsKIApAQCAtNDU1LDggKzQ1MCw4IEBAIHN0YXRpYyB2b2lkIGNwY2FwX2FkY19zZXR1cF9j
YWxpYnJhdGUoc3RydWN0IGNwY2FwX2FkYyAqZGRhdGEsCiAJCWRldl9lcnIoZGRhdGEtPmRldiwK
IAkJCSJUaW1lb3V0IHdhaXRpbmcgZm9yIGNhbGlicmF0aW9uIHRvIGNvbXBsZXRlXG4iKTsKIAot
CWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19BRENDMSwK
LQkJCQkgICBDUENBUF9CSVRfQ0FMX01PREUsIDApOworCWVycm9yID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MxLAorCQkJCSAgQ1BDQVBfQklUX0NBTF9NT0RF
KTsKIAlpZiAoZXJyb3IpCiAJCXJldHVybjsKIH0KQEAgLTYwMiwyNiArNTk3LDIzIEBAIHN0YXRp
YyB2b2lkIGNwY2FwX2FkY19zZXR1cF9iYW5rKHN0cnVjdCBjcGNhcF9hZGMgKmRkYXRhLAogCQly
ZXR1cm47CiAKIAlpZiAocmVxLT50aW1pbmcgPT0gQ1BDQVBfQURDX1RJTUlOR19JTU0pIHsKLQkJ
ZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAot
CQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywKLQkJCQkJICAgQ1BDQVBfQklUX0FEVFJJR19E
SVMpOworCQllcnJvciA9IHJlZ21hcF9zZXRfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURD
QzIsCisJCQkJCUNQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAkJaWYgKGVycm9yKQogCQkJcmV0dXJu
OwogCi0JCWVycm9yID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19B
RENDMiwKLQkJCQkJICAgQ1BDQVBfQklUX0FTQywKLQkJCQkJICAgQ1BDQVBfQklUX0FTQyk7CisJ
CWVycm9yID0gcmVnbWFwX3NldF9iaXRzKGRkYXRhLT5yZWcsIENQQ0FQX1JFR19BRENDMiwKKwkJ
CQkJQ1BDQVBfQklUX0FTQyk7CiAJCWlmIChlcnJvcikKIAkJCXJldHVybjsKIAl9IGVsc2Ugewot
CQllcnJvciA9IHJlZ21hcF91cGRhdGVfYml0cyhkZGF0YS0+cmVnLCBDUENBUF9SRUdfQURDQzIs
Ci0JCQkJCSAgIENQQ0FQX0JJVF9BRFRSSUdfT05FU0hPVCwKLQkJCQkJICAgQ1BDQVBfQklUX0FE
VFJJR19PTkVTSE9UKTsKKwkJZXJyb3IgPSByZWdtYXBfc2V0X2JpdHMoZGRhdGEtPnJlZywgQ1BD
QVBfUkVHX0FEQ0MyLAorCQkJCQlDUENBUF9CSVRfQURUUklHX09ORVNIT1QpOwogCQlpZiAoZXJy
b3IpCiAJCQlyZXR1cm47CiAKLQkJZXJyb3IgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGRhdGEtPnJl
ZywgQ1BDQVBfUkVHX0FEQ0MyLAotCQkJCQkgICBDUENBUF9CSVRfQURUUklHX0RJUywgMCk7CisJ
CWVycm9yID0gcmVnbWFwX2NsZWFyX2JpdHMoZGRhdGEtPnJlZywgQ1BDQVBfUkVHX0FEQ0MyLAor
CQkJCQkgIENQQ0FQX0JJVF9BRFRSSUdfRElTKTsKIAkJaWYgKGVycm9yKQogCQkJcmV0dXJuOwog
CX0KCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
