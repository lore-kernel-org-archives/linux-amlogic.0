Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8577BC27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CxQxygNbSNzPkx4T6CYELMBOUqrGwYs+zIn8+7XnvY=; b=R4yIU4Br/jXQkr
	DO4bXZYK3rNgSjkPaqpz8iv2QJ0UXSqHDR76nncqf1hLTGZ+75IGulNXQdk7l755kjNo+a1dqaeCH
	JFiKlinfrcC9YpiQjzPafOUdtIRkvr8xUvpPhm6H0alqHvHj4yJTIbiTSsR6ruN+s4kGtePimY0AB
	ZAuucrELhuxM/IlieVeqwaM5tRdw8NeiU0mfc0nYqERZRRJaGsMsBvsxf6xy6KpDI9BajjYG+jf3D
	mdeUJ56Dp3SpyOlfnRdrJsv0b+Pp6NGcf1Ix+FY7GjZRjIVWQGa889JMGGwATFbLwUARM2Z7Me+gO
	Lvm6+veZCbUsDsgrsw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCmN-0000000AyY4-2ofV;
	Mon, 17 Jun 2024 13:52:15 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkZ-0000000Ax9p-1HGF
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:38 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-24542b8607fso2288757fac.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632221; x=1719237021; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
        b=hDBqs6qsW0yBSifAoTUnfep8qL5VZS3BkpxpEJuu4KBgISgirRgpiKHu6r26H2uJIU
         nJql0pcrlBhcdBP3CO5DOmK64Rjg4S9d42wGDvjP5QT3zYOyjaUiMszLKAaMQCjN1/zC
         YLCXopmis3Qkl+5QSXYdArC8l2VKtjP59ScNsaTnH17TjpbX5tqcA5bMllEf7Qvjdpqp
         XOklv3M1QobwPGOhXD/rAnVSFb85zp+rekVRm2lPTLm3VGqosodaDHt9M4r5PdB2tQDY
         yGvxzBmTSChJNZNqHugwdQlpZBuXtEXmBppu9DoQCtmGW0ULnvOPM90zP1AJEqF5jVEr
         RcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632221; x=1719237021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pghOqqoUrgqxulm8czqYmTg2ejQ+jCMFTS9OcdLe8gI=;
        b=wDt+zSYZDH3J9YgFeIZq7RqiWx4QYNgMJzbj37ZSZRRvGxO3Bb/1FtACGq55SgPTYc
         ZkfcmqHtAds6+dvNatmkeRv/tP4tfuNBuqUMcl2ITKrR54ttw1wLznmqAeacVAE5DhiF
         cs+3RwoiaH/9FrqEWPH1N5ULCIW2+Hq3XwTohs0xufkzAsvNhpzWPz/FCHpv7E+dwIXY
         tFiJisMVuMNRPz2YwC4lWfmXBrA+f4fUilFvElDj4FrPQFe2jVjLvcbxgwZands4y2K9
         ECDrOSXHPFr7LyCM3hw9M+ThqWtZpB1IZTVhFQ8LdObBmEvb+SIj1TZlcLwc/hHf9bu3
         on+A==
X-Forwarded-Encrypted: i=1; AJvYcCXZNI+V8TabyPIFq+ysu2gPb8BRDAkRWUwoWKf6wqn7m0tMMSx59z4WfMe11zSCbrTqnB4gJUiMqOKOKIEdbmmUnACsCV2x9oWSQ3lSl0lwkms=
X-Gm-Message-State: AOJu0Yw4xB3kFqC3qbRGEGeFP0q0FtRiOD1XIi8iAr4xSHgA3vUH0HyC
	jTt0VWEuj/kCq6bU6kdpFTv7ZW6HlYe9XzsmhR4fUJd2HI0p289HwMF1s1Gc4Qw=
X-Google-Smtp-Source: AGHT+IHPRFjhQJMl5A95ZWgXFtrQQKsMmXYW6RVDp9V1gMjS9xuHYY98wxPGrZXsyYueeiP6Xe3wcg==
X-Received: by 2002:a05:6871:5c9:b0:254:94a4:35d2 with SMTP id 586e51a60fabf-25842b7af81mr10339918fac.45.1718632221358;
        Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:57 -0400
Subject: [PATCH v3 17/41] iio: adc: sc27xx_adc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-17-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065023_705932_7F913AA2 
X-CRM114-Status: GOOD (  11.52  )
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
aWJyZS5jb20+ClJldmlld2VkLWJ5OiBCYW9saW4gV2FuZyA8YmFvbGluLndhbmdAbGludXguYWxp
YmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYyB8IDQxICsrKysrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3Nj
Mjd4eF9hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zYzI3eHhfYWRjLmMKaW5kZXggYjRhMmUwNTdk
ODBmLi4yNTM1YzJjM2U2MGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9zYzI3eHhfYWRj
LmMKKysrIGIvZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYwpAQCAtNTA4LDEzICs1MDgsMTMg
QEAgc3RhdGljIGludCBzYzI3eHhfYWRjX3JlYWQoc3RydWN0IHNjMjd4eF9hZGNfZGF0YSAqZGF0
YSwgaW50IGNoYW5uZWwsCiAJCX0KIAl9CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0
YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCi0JCQkJIFNDMjdYWF9BRENf
RU4sIFNDMjdYWF9BRENfRU4pOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhkYXRhLT5yZWdtYXAs
IGRhdGEtPmJhc2UgKyBTQzI3WFhfQURDX0NUTCwKKwkJCSAgICAgIFNDMjdYWF9BRENfRU4pOwog
CWlmIChyZXQpCiAJCWdvdG8gcmVndWxhdG9yX3Jlc3RvcmU7CiAKLQlyZXQgPSByZWdtYXBfdXBk
YXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19JTlRfQ0xSLAot
CQkJCSBTQzI3WFhfQURDX0lSUV9DTFIsIFNDMjdYWF9BRENfSVJRX0NMUik7CisJcmV0ID0gcmVn
bWFwX3NldF9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSArIFNDMjdYWF9BRENfSU5UX0NM
UiwKKwkJCSAgICAgIFNDMjdYWF9BRENfSVJRX0NMUik7CiAJaWYgKHJldCkKIAkJZ290byBkaXNh
YmxlX2FkYzsKIApAQCAtNTM3LDggKzUzNyw4IEBAIHN0YXRpYyBpbnQgc2MyN3h4X2FkY19yZWFk
KHN0cnVjdCBzYzI3eHhfYWRjX2RhdGEgKmRhdGEsIGludCBjaGFubmVsLAogCWlmIChyZXQpCiAJ
CWdvdG8gZGlzYWJsZV9hZGM7CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVn
bWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCi0JCQkJIFNDMjdYWF9BRENfQ0hOX1JV
TiwgU0MyN1hYX0FEQ19DSE5fUlVOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVn
bWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCisJCQkgICAgICBTQzI3WFhfQURDX0NI
Tl9SVU4pOwogCWlmIChyZXQpCiAJCWdvdG8gZGlzYWJsZV9hZGM7CiAKQEAgLTU1OSw4ICs1NTks
OCBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfcmVhZChzdHJ1Y3Qgc2MyN3h4X2FkY19kYXRhICpk
YXRhLCBpbnQgY2hhbm5lbCwKIAl2YWx1ZSAmPSBTQzI3WFhfQURDX0RBVEFfTUFTSzsKIAogZGlz
YWJsZV9hZGM6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSAr
IFNDMjdYWF9BRENfQ1RMLAotCQkJICAgU0MyN1hYX0FEQ19FTiwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCisJCQkgIFND
MjdYWF9BRENfRU4pOwogcmVndWxhdG9yX3Jlc3RvcmU6CiAJaWYgKChkYXRhLT52YXJfZGF0YS0+
c2V0X3ZvbHJlZikgJiYgKGNoYW5uZWwgPT0gMzAgfHwgY2hhbm5lbCA9PSAzMSkpIHsKIAkJcmV0
X3ZvbHJlZiA9IHJlZ3VsYXRvcl9zZXRfdm9sdGFnZShkYXRhLT52b2xyZWYsCkBAIC03NjUsMTUg
Kzc2NSwxNCBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfZW5hYmxlKHN0cnVjdCBzYzI3eHhfYWRj
X2RhdGEgKmRhdGEpCiB7CiAJaW50IHJldDsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhk
YXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5tb2R1bGVfZW4sCi0JCQkJIFNDMjdYWF9NT0RV
TEVfQURDX0VOLCBTQzI3WFhfTU9EVUxFX0FEQ19FTik7CisJcmV0ID0gcmVnbWFwX3NldF9iaXRz
KGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPm1vZHVsZV9lbiwKKwkJCSAgICAgIFNDMjdY
WF9NT0RVTEVfQURDX0VOKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCiAJLyogRW5hYmxl
IEFEQyB3b3JrIGNsb2NrIGFuZCBjb250cm9sbGVyIGNsb2NrICovCi0JcmV0ID0gcmVnbWFwX3Vw
ZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPmNsa19lbiwKLQkJCQkgU0My
N1hYX0NMS19BRENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4sCi0JCQkJIFNDMjdYWF9DTEtf
QURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VOKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMo
ZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+Y2xrX2VuLAorCQkJICAgICAgU0MyN1hYX0NM
S19BRENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4pOwogCWlmIChyZXQpCiAJCWdvdG8gZGlz
YWJsZV9hZGM7CiAKQEAgLTc4OSwxMSArNzg4LDExIEBAIHN0YXRpYyBpbnQgc2MyN3h4X2FkY19l
bmFibGUoc3RydWN0IHNjMjd4eF9hZGNfZGF0YSAqZGF0YSkKIAlyZXR1cm4gMDsKIAogZGlzYWJs
ZV9jbGs6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEt
PmNsa19lbiwKLQkJCSAgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VO
LCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5j
bGtfZW4sCisJCQkgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xLX0VOKTsK
IGRpc2FibGVfYWRjOgotCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZh
cl9kYXRhLT5tb2R1bGVfZW4sCi0JCQkgICBTQzI3WFhfTU9EVUxFX0FEQ19FTiwgMCk7CisJcmVn
bWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+bW9kdWxlX2VuLAor
CQkJICBTQzI3WFhfTU9EVUxFX0FEQ19FTik7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtODAzLDEx
ICs4MDIsMTEgQEAgc3RhdGljIHZvaWQgc2MyN3h4X2FkY19kaXNhYmxlKHZvaWQgKl9kYXRhKQog
CXN0cnVjdCBzYzI3eHhfYWRjX2RhdGEgKmRhdGEgPSBfZGF0YTsKIAogCS8qIERpc2FibGUgQURD
IHdvcmsgY2xvY2sgYW5kIGNvbnRyb2xsZXIgY2xvY2sgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMo
ZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+Y2xrX2VuLAotCQkJICAgU0MyN1hYX0NMS19B
RENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4sIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGRh
dGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPmNsa19lbiwKKwkJCSAgU0MyN1hYX0NMS19BRENf
RU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtfRU4pOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKGRhdGEt
PnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEtPm1vZHVsZV9lbiwKLQkJCSAgIFNDMjdYWF9NT0RVTEVf
QURDX0VOLCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9k
YXRhLT5tb2R1bGVfZW4sCisJCQkgIFNDMjdYWF9NT0RVTEVfQURDX0VOKTsKIH0KIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBzYzI3eHhfYWRjX3ZhcmlhbnRfZGF0YSBzYzI3MzFfZGF0YSA9IHsKCi0t
IAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
