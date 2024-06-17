Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB21BC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecwEV98KNSDy29o2/YhzRsJeoZC6zHnejhQuILaNP2w=; b=sltBa7vg4rguzy
	ZqoQwjYLKF8BiPOilDary2BTcHoPmtQC2xmpS+XyrRB2ikBqAIX+LalG6m88kI90QYpbZI2WAkReo
	q4FRl57d5XbC+TZ6xqgLOXTTYAYGs1zNriHd5HF+cCf5k96xesImfmHkm8utvnn+uJyqfy9OhG/F8
	E/5eNKkli9Cc2w5xO5JH5w0GIqZ7RvU4BWutgXFUo6/RSA8yO2rywXJtwqdtLKykJ43nO0J7AHUFv
	RsrL2iM7wX8DpEx8Glf80j1Voz0fzUzejaa4HCpNwxqkRG6agxTuA6Gdujs4p+AFnJ1ciKgzyk9hf
	ov40rgUFD2kRXCUhMOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnR-0000000AzNg-22rF;
	Mon, 17 Jun 2024 13:53:21 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCku-0000000AxU4-08UJ
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:52 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-797f2d8b408so310935385a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632243; x=1719237043; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
        b=AG4OMr5f7mguBjZ04tSh9FwUkTw3wElg4fyZrAxwWZJ/BqYPPNDo8oWGlBdLtlAlRM
         J533p6PHot+Hlrcyj9pvSx4iEvaGcpPWYI76yufYgweC9kQdcGaW36CQrSYNBe1FCE2d
         lq959V12YnYhBO25fpCmdBWbQCPbFTGCwRJmfNuJ/gx5k+IW2w+51k1GCgEknMIWIMfU
         bMR3jH7mN2R77VyMxIFusaSlsNj76qMcZ9Jopvb/aBNEAZjWf2FO6yEq4eYzqWAioNp8
         ydS1HTnn4/CW2nRs+Bt22NyAkvCcPDnaGj0IWTM2/0nPADK3eIfHf13cF4a3xtX41S29
         Pojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632243; x=1719237043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/wwf4Pyf9v8s/HS7lCuvhL4I665hNiJrFxeq5WtNz8=;
        b=urA1H+9zCiVOZtbEnGt7Xsl5q+vcM/Phvaz9VNT3leuZkOANc1cODaDu/KYy9NXJUD
         4j5S8L9gGtrxKBZtS43+VLjcbYk3LzIgrCoRvJNF7vcSV+PQIpjP0sE/XAfbStV/dzKo
         TyT4vm0t9grQXPCKZRe0SF4mngsvY1VxFfZj3Xe+cOLlRfMBDvx5hq04BMZjNBq2mf8m
         IZgMc7+CPG7W8W4th5Co2GL8PP/4F8YmRA0ODuHqmgzs0b8qpnRXyiNUUW8KOmh+2FD8
         N9pv/e3hTQToH3p5vufXC7wqwZoD4EsFnlUvVXxgr4RRoF+KtMEl1amIKAQ5VN621REF
         d+ug==
X-Forwarded-Encrypted: i=1; AJvYcCXqyLZqz3k8ux2BrANOS8LgUA+l2xHBonzXOHmuO0tFJQAJfGS8fdQyKWSSQee4iGltxMSPDeL6IWZ25/R3G1ZbbK3WmF81bCjWRm0/h2Zf98M=
X-Gm-Message-State: AOJu0YwCs89pPRI9kY3VoHb0wbGp4DMO5Pp954Iz7XcIW5CJO5VHfFUW
	0fe1cS1k3FcqnjTg0BYMqmkDVMKNcb6Rwa4kwlbgtIOEBf96AjThcsNG6K+ri4o=
X-Google-Smtp-Source: AGHT+IFGOx2s8Nnos2uW+1yz9gXjI96q1FUrsSHsvdHqjpAdDpOLj6w2PTD0THhqXhocLH6W1aVi0w==
X-Received: by 2002:a05:620a:46a1:b0:79a:2613:9b40 with SMTP id af79cd13be357-79a26139e04mr977624785a.50.1718632242836;
        Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:07 -0400
Subject: [PATCH v3 27/41] iio: imu: inv_icm42600: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-27-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065044_416358_B59222BD 
X-CRM114-Status: GOOD (  11.28  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfYnVm
ZmVyLmMgfCAxNCArKysrKystLS0tLS0tLQogZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9p
bnZfaWNtNDI2MDBfY29yZS5jICAgfCAgOSArKysrLS0tLS0KIGRyaXZlcnMvaWlvL2ltdS9pbnZf
aWNtNDI2MDAvaW52X2ljbTQyNjAwX2kyYy5jICAgIHwgIDQgKystLQogZHJpdmVycy9paW8vaW11
L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfc3BpLmMgICAgfCAgNCArKy0tCiA0IGZpbGVzIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jIGIvZHJpdmVy
cy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfYnVmZmVyLmMKaW5kZXggNjNiODVl
Yzg4YzEzLi41MDlmZTZhM2FlOTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jCisrKyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2J1ZmZlci5jCkBAIC0yNjIsOSArMjYyLDggQEAgaW50IGludl9p
Y200MjYwMF9idWZmZXJfdXBkYXRlX3dhdGVybWFyayhzdHJ1Y3QgaW52X2ljbTQyNjAwX3N0YXRl
ICpzdCkKIAogCS8qIHJlc3RvcmUgd2F0ZXJtYXJrIGludGVycnVwdCAqLwogCWlmIChyZXN0b3Jl
KSB7Ci0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVH
X0lOVF9TT1VSQ0UwLAotCQkJCQkgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lO
VDFfRU4sCi0JCQkJCSBJTlZfSUNNNDI2MDBfSU5UX1NPVVJDRTBfRklGT19USFNfSU5UMV9FTik7
CisJCXJldCA9IHJlZ21hcF9zZXRfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9T
T1VSQ0UwLAorCQkJCSAgICAgIElOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZPX1RIU19JTlQx
X0VOKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQpAQCAtMzA2LDkgKzMwNSw4IEBA
IHN0YXRpYyBpbnQgaW52X2ljbTQyNjAwX2J1ZmZlcl9wb3N0ZW5hYmxlKHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYpCiAJfQogCiAJLyogc2V0IEZJRk8gdGhyZXNob2xkIGludGVycnVwdCAqLwot
CXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9T
T1VSQ0UwLAotCQkJCSBJTlZfSUNNNDI2MDBfSU5UX1NPVVJDRTBfRklGT19USFNfSU5UMV9FTiwK
LQkJCQkgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lOVDFfRU4pOworCXJldCA9
IHJlZ21hcF9zZXRfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9TT1VSQ0UwLAor
CQkJICAgICAgSU5WX0lDTTQyNjAwX0lOVF9TT1VSQ0UwX0ZJRk9fVEhTX0lOVDFfRU4pOwogCWlm
IChyZXQpCiAJCWdvdG8gb3V0X3VubG9jazsKIApAQCAtMzYzLDggKzM2MSw4IEBAIHN0YXRpYyBp
bnQgaW52X2ljbTQyNjAwX2J1ZmZlcl9wcmVkaXNhYmxlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYpCiAJCWdvdG8gb3V0X3VubG9jazsKIAogCS8qIGRpc2FibGUgRklGTyB0aHJlc2hvbGQgaW50
ZXJydXB0ICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYw
MF9SRUdfSU5UX1NPVVJDRTAsCi0JCQkJIElOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZPX1RI
U19JTlQxX0VOLCAwKTsKKwlyZXQgPSByZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNN
NDI2MDBfUkVHX0lOVF9TT1VSQ0UwLAorCQkJCUlOVl9JQ000MjYwMF9JTlRfU09VUkNFMF9GSUZP
X1RIU19JTlQxX0VOKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF91bmxvY2s7CiAKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYyBiL2Ry
aXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYwppbmRleCA5NjEx
NmE2OGFiMjkuLmJiMzAyZjU1NDBjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vaW11L2ludl9p
Y200MjYwMC9pbnZfaWNtNDI2MDBfY29yZS5jCisrKyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNt
NDI2MDAvaW52X2ljbTQyNjAwX2NvcmUuYwpAQCAtNDM1LDkgKzQzNSw4IEBAIHN0YXRpYyBpbnQg
aW52X2ljbTQyNjAwX3NldHVwKHN0cnVjdCBpbnZfaWNtNDI2MDBfc3RhdGUgKnN0LAogCQlyZXR1
cm4gcmV0OwogCiAJLyogc2Vuc29yIGRhdGEgaW4gYmlnLWVuZGlhbiAoZGVmYXVsdCkgKi8KLQly
ZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRGX0NP
TkZJRzAsCi0JCQkJIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzBfU0VOU09SX0RBVEFfRU5ESUFO
LAotCQkJCSBJTlZfSUNNNDI2MDBfSU5URl9DT05GSUcwX1NFTlNPUl9EQVRBX0VORElBTik7CisJ
cmV0ID0gcmVnbWFwX3NldF9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYwMF9SRUdfSU5URl9DT05G
SUcwLAorCQkJICAgICAgSU5WX0lDTTQyNjAwX0lOVEZfQ09ORklHMF9TRU5TT1JfREFUQV9FTkRJ
QU4pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTUzMiw4ICs1MzEsOCBAQCBzdGF0
aWMgaW50IGludl9pY200MjYwMF9pcnFfaW5pdChzdHJ1Y3QgaW52X2ljbTQyNjAwX3N0YXRlICpz
dCwgaW50IGlycSwKIAkJcmV0dXJuIHJldDsKIAogCS8qIERlYXNzZXJ0IGFzeW5jIHJlc2V0IGZv
ciBwcm9wZXIgSU5UIHBpbiBvcGVyYXRpb24gKGNmIGRhdGFzaGVldCkgKi8KLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRfQ09ORklHMSwKLQkJ
CQkgSU5WX0lDTTQyNjAwX0lOVF9DT05GSUcxX0FTWU5DX1JFU0VULCAwKTsKKwlyZXQgPSByZWdt
YXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVF9DT05GSUcxLAorCQkJ
CUlOVl9JQ000MjYwMF9JTlRfQ09ORklHMV9BU1lOQ19SRVNFVCk7CiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZf
aWNtNDI2MDBfaTJjLmMgYi9kcml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYw
MF9pMmMuYwppbmRleCA4ZDMzNTA0ZDc3MGYuLmViYjMxYjM4NTg4MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfaTJjLmMKKysrIGIvZHJpdmVy
cy9paW8vaW11L2ludl9pY200MjYwMC9pbnZfaWNtNDI2MDBfaTJjLmMKQEAgLTI4LDggKzI4LDgg
QEAgc3RhdGljIGludCBpbnZfaWNtNDI2MDBfaTJjX2J1c19zZXR1cChzdHJ1Y3QgaW52X2ljbTQy
NjAwX3N0YXRlICpzdCkKIAkJCSAgIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzZfTUFTSywKIAkJ
CSAgIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzZfSTNDX0VOKTsKIAotCXJldCA9IHJlZ21hcF91
cGRhdGVfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVEZfQ09ORklHNCwKLQkJCQkg
SU5WX0lDTTQyNjAwX0lOVEZfQ09ORklHNF9JM0NfQlVTX09OTFksIDApOworCXJldCA9IHJlZ21h
cF9jbGVhcl9iaXRzKHN0LT5tYXAsIElOVl9JQ000MjYwMF9SRUdfSU5URl9DT05GSUc0LAorCQkJ
CUlOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzRfSTNDX0JVU19PTkxZKTsKIAlpZiAocmV0KQogCQly
ZXR1cm4gcmV0OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2lu
dl9pY200MjYwMF9zcGkuYyBiL2RyaXZlcnMvaWlvL2ltdS9pbnZfaWNtNDI2MDAvaW52X2ljbTQy
NjAwX3NwaS5jCmluZGV4IGNjMmJmMTc5OWE0Ni4uZWFlNWZmN2EzY2MxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYwMF9zcGkuYworKysgYi9kcml2
ZXJzL2lpby9pbXUvaW52X2ljbTQyNjAwL2ludl9pY200MjYwMF9zcGkuYwpAQCAtMjcsOCArMjcs
OCBAQCBzdGF0aWMgaW50IGludl9pY200MjYwMF9zcGlfYnVzX3NldHVwKHN0cnVjdCBpbnZfaWNt
NDI2MDBfc3RhdGUgKnN0KQogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoc3QtPm1hcCwgSU5WX0lDTTQyNjAwX1JFR19JTlRGX0NPTkZJRzQsCi0J
CQkJIElOVl9JQ000MjYwMF9JTlRGX0NPTkZJRzRfSTNDX0JVU19PTkxZLCAwKTsKKwlyZXQgPSBy
ZWdtYXBfY2xlYXJfYml0cyhzdC0+bWFwLCBJTlZfSUNNNDI2MDBfUkVHX0lOVEZfQ09ORklHNCwK
KwkJCQlJTlZfSUNNNDI2MDBfSU5URl9DT05GSUc0X0kzQ19CVVNfT05MWSk7CiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
