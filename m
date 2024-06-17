Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7E6C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTLeQVUwEDz3wC+N4uZJw4XBeffjUuw10vx1l8138xk=; b=tmYyYAqCGrsORU
	dpXKovltJTqpYl1Sa6HEOiIbwGUn0gh2m1d5DwLcGghJ/ejRqKzSnKBZsAQzoWOP7RML1aXA1So4K
	ojGbydoPUezXJ8DrhmVDnhpgbNhvZaJXPtcf4ZZoHlswhJZ7BqBI8yAZZGW6tNe/I+gn61M8Mhy8n
	x7fy9FwyCNMSBY/kwVxTjiK5BQx3AhUA3hJNJgWDhzkN7Mkcnt+li6cIjmSjdOEGJrpEhnXnOyRmi
	3S5i5Mbds/O+46Uv1cK7BJxj7iAC0jQPScAZVp3KOHwIHbE6+3kl7UzI0JkZDPJMI3ahCMuIIqXdz
	bGI9Yp2dTnQjroMXrO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCmz-0000000Az0r-49C3;
	Mon, 17 Jun 2024 13:52:54 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkk-0000000AxKB-1IX6
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:44 +0000
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b9794dad09so1997541eaf.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632232; x=1719237032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
        b=u7CHoGByXn6lSSUB4gpW7X7Riim8LpwTMtmcxHiKek//xHPxLMyXOEDSf7DiJsPOKO
         jbnR58wHsyVx6ERD1PCUp6bFP9Td0qaNJsYDfkrs8VQn9/LPz3rQkhWI9kp8WZv6brEI
         38zhYjJjQ1lOEcyerR2AF12yvu4mZEt+IqB2xMUpv+KP9arfde2Js0+cvMnYs2naJERT
         V6n92wQOlYpUqKzC0e/Pdch42SBshqNt/wI6jO/OIL5HVp6s58qRD+/uWXIt06NfBVVZ
         QzS4XvaGqsbT5wfp9i+uTclJQSx8TrePDH1cYjqlwaeJvwxSkVcqBShu3gZYp4P7ws0L
         aOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632232; x=1719237032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bPhEFIEI65Agzd+gTNE/8pf9Wc0auEQHD6gWw+Mp2Us=;
        b=YJ2lOhjW96Zn0Q40K1hV5ySAerg/HLDVXBKEXt1KGPMDGToXQxjhfP3zHmPWlLG0AQ
         tyQGzXDpwbPjhl2v7mN40ag4HpgxcXnJQ2lCBcuslpAnjSPmvXu+gqUhm7b1RA/Ohp9k
         4UE5RSdIYS1vfxKghmu2j2ZqPKxzH2NZ+mIv+yav8BCivVyDW4e0swqYCkmvUAXmnFzC
         3k1iclJMH0uOPTNMeRIYv7QhBRUqeZ84zc/g5NDLZQKU+AT3aXh4F1UxdmQPL9tfQ9hD
         WlDSYRGVZOGGcSPvXsICrFvuA15L/lit/rxPbgDGWLtMB+EH/7QfXEklw/b0JQml+DfN
         iSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX21O+2+zTXLb8tsxjgo7bSxpMLaL2cLPeAUPLy9yGqNMiX5snbeKGeZEm9qPnF0Cd5x+yadsV/iT03AIPywASMp64YXZ3V0p/1oqGEjZlIhPw=
X-Gm-Message-State: AOJu0YyGACWb+LG8H/VseywPmMSxWNfq/RLyxVwCxLTUEX+6XG+gSKlj
	dmRCRVu4zOxQPOE59lfzzUy0gv9G1Yp9RN3SFljgdtPHOKT/NYH6TxqlTcl2DTU=
X-Google-Smtp-Source: AGHT+IESOlQlf6WzweXkTkf8MrnVQGCcG3xC67OqCrm+RTbQElgJSgw2YCA/KexywnTT/s9UGGqyWA==
X-Received: by 2002:a05:6870:c1d4:b0:24f:dd11:4486 with SMTP id 586e51a60fabf-25842ba209bmr11672904fac.36.1718632232087;
        Mon, 17 Jun 2024 06:50:32 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:31 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:02 -0400
Subject: [PATCH v3 22/41] iio: gyro: mpu3050-core: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-22-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065034_659462_9F703A80 
X-CRM114-Status: GOOD (  10.47  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vZ3lyby9tcHUzMDUwLWNvcmUuYyB8IDMzICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2d5cm8vbXB1MzA1
MC1jb3JlLmMgYi9kcml2ZXJzL2lpby9neXJvL21wdTMwNTAtY29yZS5jCmluZGV4IGE3OTFiYTNh
NjkzYS4uZmYxYzgxNTUzMDQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9neXJvL21wdTMwNTAt
Y29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2d5cm8vbXB1MzA1MC1jb3JlLmMKQEAgLTE5Nyw4ICsx
OTcsOCBAQCBzdGF0aWMgaW50IG1wdTMwNTBfc3RhcnRfc2FtcGxpbmcoc3RydWN0IG1wdTMwNTAg
Km1wdTMwNTApCiAJaW50IGk7CiAKIAkvKiBSZXNldCAqLwotCXJldCA9IHJlZ21hcF91cGRhdGVf
Yml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfUFdSX01HTSwKLQkJCQkgTVBVMzA1MF9QV1JfTUdN
X1JFU0VULCBNUFUzMDUwX1BXUl9NR01fUkVTRVQpOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyht
cHUzMDUwLT5tYXAsIE1QVTMwNTBfUFdSX01HTSwKKwkJCSAgICAgIE1QVTMwNTBfUFdSX01HTV9S
RVNFVCk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNTEzLDEyICs1MTMsOCBAQCBz
dGF0aWMgaXJxcmV0dXJuX3QgbXB1MzA1MF90cmlnZ2VyX2hhbmRsZXIoaW50IGlycSwgdm9pZCAq
cCkKIAkJCQkgIkZJRk8gb3ZlcmZsb3chIEVtcHR5aW5nIGFuZCByZXNldHRpbmcgRklGT1xuIik7
CiAJCQlmaWZvX292ZXJmbG93ID0gdHJ1ZTsKIAkJCS8qIFJlc2V0IGFuZCBlbmFibGUgdGhlIEZJ
Rk8gKi8KLQkJCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhtcHUzMDUwLT5tYXAsCi0JCQkJCQkg
TVBVMzA1MF9VU1JfQ1RSTCwKLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfAotCQkJ
CQkJIE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QsCi0JCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9G
SUZPX0VOIHwKLQkJCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsKKwkJCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhtcHUzMDUwLT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCisJCQkJCSAgICAg
IE1QVTMwNTBfVVNSX0NUUkxfRklGT19FTiB8IE1QVTMwNTBfVVNSX0NUUkxfRklGT19SU1QpOwog
CQkJaWYgKHJldCkgewogCQkJCWRldl9pbmZvKG1wdTMwNTAtPmRldiwgImVycm9yIHJlc2V0dGlu
ZyBGSUZPXG4iKTsKIAkJCQlnb3RvIG91dF90cmlnZ2VyX3VubG9jazsKQEAgLTc5OSwxMCArNzk1
LDggQEAgc3RhdGljIGludCBtcHUzMDUwX2h3X2luaXQoc3RydWN0IG1wdTMwNTAgKm1wdTMwNTAp
CiAJdTY0IG90cDsKIAogCS8qIFJlc2V0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKG1w
dTMwNTAtPm1hcCwKLQkJCQkgTVBVMzA1MF9QV1JfTUdNLAotCQkJCSBNUFUzMDUwX1BXUl9NR01f
UkVTRVQsCi0JCQkJIE1QVTMwNTBfUFdSX01HTV9SRVNFVCk7CisJcmV0ID0gcmVnbWFwX3NldF9i
aXRzKG1wdTMwNTAtPm1hcCwgTVBVMzA1MF9QV1JfTUdNLAorCQkJICAgICAgTVBVMzA1MF9QV1Jf
TUdNX1JFU0VUKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCkBAIC04NzIsOCArODY2LDgg
QEAgc3RhdGljIGludCBtcHUzMDUwX3Bvd2VyX3VwKHN0cnVjdCBtcHUzMDUwICptcHUzMDUwKQog
CW1zbGVlcCgyMDApOwogCiAJLyogVGFrZSBkZXZpY2Ugb3V0IG9mIHNsZWVwIG1vZGUgKi8KLQly
ZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BXUl9NR00sCi0J
CQkJIE1QVTMwNTBfUFdSX01HTV9TTEVFUCwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMo
bXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BXUl9NR00sCisJCQkJTVBVMzA1MF9QV1JfTUdNX1NMRUVQ
KTsKIAlpZiAocmV0KSB7CiAJCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShtcHUz
MDUwLT5yZWdzKSwgbXB1MzA1MC0+cmVncyk7CiAJCWRldl9lcnIobXB1MzA1MC0+ZGV2LCAiZXJy
b3Igc2V0dGluZyBwb3dlciBtb2RlXG4iKTsKQEAgLTg5NSw4ICs4ODksOCBAQCBzdGF0aWMgaW50
IG1wdTMwNTBfcG93ZXJfZG93bihzdHJ1Y3QgbXB1MzA1MCAqbXB1MzA1MCkKIAkgKiB0aGVuIHdl
IHdvdWxkIGJlIHdhc3RpbmcgcG93ZXIgdW5sZXNzIHdlIGdvIHRvIHNsZWVwIG1vZGUKIAkgKiBm
aXJzdC4KIAkgKi8KLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMobXB1MzA1MC0+bWFwLCBNUFUz
MDUwX1BXUl9NR00sCi0JCQkJIE1QVTMwNTBfUFdSX01HTV9TTEVFUCwgTVBVMzA1MF9QV1JfTUdN
X1NMRUVQKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMobXB1MzA1MC0+bWFwLCBNUFUzMDUwX1BX
Ul9NR00sCisJCQkgICAgICBNUFUzMDUwX1BXUl9NR01fU0xFRVApOwogCWlmIChyZXQpCiAJCWRl
dl9lcnIobXB1MzA1MC0+ZGV2LCAiZXJyb3IgcHV0dGluZyB0byBzbGVlcFxuIik7CiAKQEAgLTk5
NywxMSArOTkxLDggQEAgc3RhdGljIGludCBtcHUzMDUwX2RyZHlfdHJpZ2dlcl9zZXRfc3RhdGUo
c3RydWN0IGlpb190cmlnZ2VyICp0cmlnLAogCQkJcmV0dXJuIHJldDsKIAogCQkvKiBSZXNldCBh
bmQgZW5hYmxlIHRoZSBGSUZPICovCi0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhtcHUzMDUw
LT5tYXAsIE1QVTMwNTBfVVNSX0NUUkwsCi0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4g
fAotCQkJCQkgTVBVMzA1MF9VU1JfQ1RSTF9GSUZPX1JTVCwKLQkJCQkJIE1QVTMwNTBfVVNSX0NU
UkxfRklGT19FTiB8Ci0JCQkJCSBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsKKwkJcmV0ID0g
cmVnbWFwX3NldF9iaXRzKG1wdTMwNTAtPm1hcCwgTVBVMzA1MF9VU1JfQ1RSTCwKKwkJCQkgICAg
ICBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fRU4gfCBNUFUzMDUwX1VTUl9DVFJMX0ZJRk9fUlNUKTsK
IAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
