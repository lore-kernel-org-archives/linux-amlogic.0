Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ED8C2BB9A
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+cAdZgQxh6A41KeUHcfZxWjqyDBpjYwEHULcHub6dw=; b=n3TD+nMW7Ap/OE
	kmml40CJgQSrao1/aT4jkPsiVBdtM4WKCxClBynBkcSV+fap577/waw8c0f8j5ael9QZ2jP6MF5IM
	5wQ/nHtTxCKead4cEbnGfKnXfLIex7S1zN/4ykFuUx9yTxx3vQf2dUN3K4Vf68lyW6VdhNlFe1LiU
	bEPVwbaDGtfQ2TWsZEdHPdZizZTvzWeC1JfaRMJssMjDVEr/mLXW6vt3ZHHD/9+H4Jh85cdpf3ym2
	E9MhJLATG+NkJjYglZSmJcmeXR/dUQuYDs6YUtWfjSgmaOl1/fEqsuQPhD3PIFW1ybBokN4eL7z4f
	dOIR4KkyS3JI6gU5RhOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCne-0000000AzYp-0lEr;
	Mon, 17 Jun 2024 13:53:34 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkw-0000000AxWO-3fGu
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:54 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-24c9f892aeaso2293608fac.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632245; x=1719237045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=no5e4JgYnxUL9VEAR0MyhLfYZ2Dji3NZkE6FFtqTn2Y=;
        b=zz496VrjVwl92+1Ot4/1+YZWIy2OF5HEGiCxXfHX9bH7EmDHh30qB8kIoOwWfq1fRa
         jLi3Qp5gcaDp3GIbEAvk4U8Br0P/S0pyGLxYVW9mgkB2zze/XSjK3p4Qcx0r8Qb1gdnJ
         VPa0j5nEhak801O69pqBb304CqHRV3K7SpIpLfyfvuGA7/fRtW2CCfTTttX919DfMYh5
         kKh94HNfb2mWhCNaJqxEWUNoly/ZB+MBJgkhO971FT0nHtLmZFOVj+vx2Vn8211TDJtv
         AxH0qa3o6VvLnR2GgGJGMPAAdFDVCmpyTbp/y8Go/FiO1WoUpoPg37HzItt9iul6UFQt
         4hcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632245; x=1719237045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no5e4JgYnxUL9VEAR0MyhLfYZ2Dji3NZkE6FFtqTn2Y=;
        b=CsGZJMTmXoAV8Prxf87+4jedfxjtWaljy04Q4WHMOPzQkb1m+u8VjfDaFd8SkJ93/k
         oaUoUUgtrQyZIwLaty/feLG07Sa8PCdb7du7r5v0WeSoeDo8EF23jqv6mTcvJ9cFXjA5
         x7lADvZbO3lttL9q0SE0mWFt+LhDFot6HjtQSG+vasQVKRgemhAuSdiagXf4YbswMsN4
         bYpzsPBbQbzGahRbebyLMVNVPnV2D+60u8w29VwMoTxYkxaOYMYAMBcYGgdC3J36rcVi
         m1524WjufklOSFZndR+3P6eMcpTfni208uMC9k+A7cAdi0spDLAMjo5Rh4dd5QKKWfut
         QnYg==
X-Forwarded-Encrypted: i=1; AJvYcCWPa7H+0OuBw+FarvBe0PvA1Ws5La9Tu9ygL+KBap8XtBV40X7dldOFgG7ZGUJkvcvlXexiIRqq4WiadPD8nDvDxUT761UTmSSLmIaGSZrPeTk=
X-Gm-Message-State: AOJu0YyAkvytt1mtMegbxWiIFbLozrK/PqX1jRphA0/KjNo+BaHMIs5v
	1Y/ffaLY0KGGSOHxEZgNLqgKZ/seA0Usadt9QK0/JNZqdddBhGv9wgwYeuEE+M8=
X-Google-Smtp-Source: AGHT+IGU9b+YnJX5hCRw1ClyleRAxjZc2rSg4p660bR5sIf4JFOEx4FbnA14YINHS71KeMJAZo8MSg==
X-Received: by 2002:a05:6870:472c:b0:24f:c95b:ab6 with SMTP id 586e51a60fabf-2584288ca57mr11986485fac.8.1718632244964;
        Mon, 17 Jun 2024 06:50:44 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:44 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:08 -0400
Subject: [PATCH v3 28/41] iio: light: adux1020: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-28-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065047_554787_2A51FE22 
X-CRM114-Status: GOOD (  10.42  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvYWR1eDEwMjAuYyB8IDEzICsrKysrKy0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vbGlnaHQvYWR1eDEwMjAuYyBiL2RyaXZlcnMvaWlvL2xpZ2h0
L2FkdXgxMDIwLmMKaW5kZXggYWE0YTZjNzhmMGFhLi4zNDIzMGU2OTlkMjcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaWlvL2xpZ2h0L2FkdXgxMDIwLmMKKysrIGIvZHJpdmVycy9paW8vbGlnaHQvYWR1
eDEwMjAuYwpAQCAtNTM5LDkgKzUzOSw4IEBAIHN0YXRpYyBpbnQgYWR1eDEwMjBfd3JpdGVfZXZl
bnRfY29uZmlnKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJCSAqIFRyaWdnZXIgcHJveGlt
aXR5IGludGVycnVwdCB3aGVuIHRoZSBpbnRlbnNpdHkgaXMgYWJvdmUKIAkJICogb3IgYmVsb3cg
dGhyZXNob2xkCiAJCSAqLwotCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBBRFVYMTAyMF9SRUdfUFJPWF9UWVBFLAotCQkJCQkgQURVWDEwMjBfUFJPWF9UWVBFLAotCQkJ
CQkgQURVWDEwMjBfUFJPWF9UWVBFKTsKKwkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGRhdGEtPnJl
Z21hcCwgQURVWDEwMjBfUkVHX1BST1hfVFlQRSwKKwkJCQkgICAgICBBRFVYMTAyMF9QUk9YX1RZ
UEUpOwogCQlpZiAocmV0IDwgMCkKIAkJCWdvdG8gZmFpbDsKIApAQCAtNzQ4LDggKzc0Nyw4IEBA
IHN0YXRpYyBpbnQgYWR1eDEwMjBfY2hpcF9pbml0KHN0cnVjdCBhZHV4MTAyMF9kYXRhICpkYXRh
KQogCiAJZGV2X2RiZygmY2xpZW50LT5kZXYsICJEZXRlY3RlZCBBRFVYMTAyMCB3aXRoIGNoaXAg
aWQ6IDB4JTA0eFxuIiwgdmFsKTsKIAotCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5y
ZWdtYXAsIEFEVVgxMDIwX1JFR19TV19SRVNFVCwKLQkJCQkgQURVWDEwMjBfU1dfUkVTRVQsIEFE
VVgxMDIwX1NXX1JFU0VUKTsKKwlyZXQgPSByZWdtYXBfc2V0X2JpdHMoZGF0YS0+cmVnbWFwLCBB
RFVYMTAyMF9SRUdfU1dfUkVTRVQsCisJCQkgICAgICBBRFVYMTAyMF9TV19SRVNFVCk7CiAJaWYg
KHJldCA8IDApCiAJCXJldHVybiByZXQ7CiAKQEAgLTc2NCw4ICs3NjMsOCBAQCBzdGF0aWMgaW50
IGFkdXgxMDIwX2NoaXBfaW5pdChzdHJ1Y3QgYWR1eDEwMjBfZGF0YSAqZGF0YSkKIAkJcmV0dXJu
IHJldDsKIAogCS8qIFVzZSBMRURfSVJFRiBmb3IgcHJveGltaXR5IG1vZGUgKi8KLQlyZXQgPSBy
ZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBBRFVYMTAyMF9SRUdfTEVEX0NVUlJFTlQs
Ci0JCQkJIEFEVVgxMDIwX0xFRF9QSVJFRl9FTiwgMCk7CisJcmV0ID0gcmVnbWFwX2NsZWFyX2Jp
dHMoZGF0YS0+cmVnbWFwLCBBRFVYMTAyMF9SRUdfTEVEX0NVUlJFTlQsCisJCQkJQURVWDEwMjBf
TEVEX1BJUkVGX0VOKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDUu
MgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
