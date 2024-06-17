Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63B8C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o8aHylO8oHvC66W5K9+/dh5P+0g3DtNdYwnPOLcXIY=; b=elVLx81AyqpgVE
	wxdZAS13XWEM1xlw348oepUq4lumR9o5y+5ewnIOCD1d5twUKQtkJJIcaXP8Efi85Rs96n1eVEz2p
	cBhnEp5zTuzHNwJJ/yGjmFNy/1MVP5angaD9Cgvz2SV/u0MWz0KT9fpoZcvb9g2nyFr5Hxf8mrDD9
	WZHlFr/zWMu1weg1/quvgzuxa84b6Z9EAB6z99aMboVw/pDgqIty/kcfRZRlOas5YdVMgMnFAVnSV
	fIOtq/9R0gjfVtURkVQRHVv4NlJBs2Ljm5sDtNCTlr3oItQKoajQEpv7ftvwwabRLgjul7A/P/rLn
	rwkhjJQBFyBQK1nr5CqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl2-0000000Axc6-24OX;
	Mon, 17 Jun 2024 13:50:52 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkF-0000000AwqO-1oh5
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:07 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-797dcb558ebso286406785a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632202; x=1719237002; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=Z62+76zECgvxOVOgdKztbbH4WxdEmspunuLD1LflxLMHormlzfBi2VaNqaZNP5ZrRy
         vqovFwd1Kli9dsIsazA6OQ6SQSIRi3O3YQ2h1O40xA/39nL71SmmNUjsZXxgILsbntSC
         +JhRdHbdOztYBtcDL0yj+RTzogOx72K805xQc7vD68tpeIp//qP85YDF0qJeCtKHHdQc
         Extf5UOpcjcZKR73GGfSKq4wEcj82M9zrCaoZup1NPy4LkXyTCx6HqdRTT57AEde6eTu
         13RQtG7Al25k1n306Lc84faF0723vgcvzyli1NzNw2nPwAfVvv7OsHRth9jOcJGpZMFS
         e8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632202; x=1719237002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J+uii6o7EZaRWTf6fwT0Zq6b6sr2oRr59Sqisc7RFA=;
        b=VidjXZtsMtI6uK87ZW9MBqChrhZ9s9WgmtLcR5X9p0WQJNGxu+VMi7lev8ZIWoFl92
         Ykl3O3p2pgW3FDg0A9ar1MNkfsFZmwkwGiO+JMSIfNxLsOwBplxv/QETO4IaPbaPDsum
         6bwVEARrxa9S3BesKjm8hNnKCHI+65zUk9WCL6ZXYlO78hk3tDYdYyQhoAS2z4Q9G6qB
         HMNndP+IuHH3/Q0+y3g6kElc38i1C1K2mRELS7Vh78P3f+oxroQDunYzOAkOIZlV2Jmi
         zlMS2s6gHfWEsvTk9enXm4oGB+IuZ/Mqfpvm3K3LBelIJk9rxNsTEz7XJeQgAHt4vXyU
         e4+A==
X-Forwarded-Encrypted: i=1; AJvYcCWH8MawagFFE8dvqfvNqQlmFlImkmtGMM1bGbDPFu6YBYgM1gPW8KhLQbf2XO4xnwi/DVUAeAptOpsHQgzfMm1Z2ZU6YqRqGZhg8+TnqQyNFGs=
X-Gm-Message-State: AOJu0Yyo0W2dvk13UVojTyetboPws3ApNmDTFOf7iSEXHX5tCOXjWl6s
	Nv4OpvuO2Bpi1LOa2E3inh8TsxuGsOqbmixLVIRu7bLNM1s5c3frT8Dohf6aAE8z1gTjxJWMbuG
	gOT0=
X-Google-Smtp-Source: AGHT+IHQO7lDiG1TVDzbCtPAbJI8uHKSdU2/yIiDIlagRddBfJsOkXoStyLOw9TY/mBvF1osZeRq9Q==
X-Received: by 2002:a05:620a:2955:b0:792:c34d:482 with SMTP id af79cd13be357-798d2413b26mr1228938285a.25.1718632201881;
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:48 -0400
Subject: [PATCH v3 08/41] iio: adc: berlin2-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-8-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065003_697428_D21C9807 
X-CRM114-Status: GOOD (  11.50  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL2JlcmxpbjItYWRjLmMgfCAyNCArKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYyBiL2Ry
aXZlcnMvaWlvL2FkYy9iZXJsaW4yLWFkYy5jCmluZGV4IGE0ZTdjN2VmZjVhYy4uNGNkZGRjNmUz
NmU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYworKysgYi9kcml2
ZXJzL2lpby9hZGMvYmVybGluMi1hZGMuYwpAQCAtMTI5LDggKzEyOSw4IEBAIHN0YXRpYyBpbnQg
YmVybGluMl9hZGNfcmVhZChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBpbnQgY2hhbm5lbCkK
IAkJCQkJICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoMTAwMCkpOwogCiAJLyogRGlzYWJsZSB0aGUg
aW50ZXJydXB0cyAqLwotCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIEJFUkxJTjJf
U01fQURDX1NUQVRVUywKLQkJCSAgIEJFUkxJTjJfU01fQURDX1NUQVRVU19JTlRfRU4oY2hhbm5l
bCksIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9BRENf
U1RBVFVTLAorCQkJICBCRVJMSU4yX1NNX0FEQ19TVEFUVVNfSU5UX0VOKGNoYW5uZWwpKTsKIAog
CWlmIChyZXQgPT0gMCkKIAkJcmV0ID0gLUVUSU1FRE9VVDsKQEAgLTEzOSw4ICsxMzksOCBAQCBz
dGF0aWMgaW50IGJlcmxpbjJfYWRjX3JlYWQoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwgaW50
IGNoYW5uZWwpCiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYt
PnJlZ21hcCwgQkVSTElOMl9TTV9DVFJMLAotCQkJICAgQkVSTElOMl9TTV9DVFJMX0FEQ19TVEFS
VCwgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX0NUUkws
CisJCQkgIEJFUkxJTjJfU01fQ1RSTF9BRENfU1RBUlQpOwogCiAJZGF0YSA9IHByaXYtPmRhdGE7
CiAJcHJpdi0+ZGF0YV9hdmFpbGFibGUgPSBmYWxzZTsKQEAgLTE4MCw4ICsxODAsOCBAQCBzdGF0
aWMgaW50IGJlcmxpbjJfYWRjX3RzZW5fcmVhZChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2KQog
CQkJCQkgICAgICAgbXNlY3NfdG9famlmZmllcygxMDAwKSk7CiAKIAkvKiBEaXNhYmxlIGludGVy
cnVwdHMgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX1RT
RU5fU1RBVFVTLAotCQkJICAgQkVSTElOMl9TTV9UU0VOX1NUQVRVU19JTlRfRU4sIDApOworCXJl
Z21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9UU0VOX1NUQVRVUywKKwkJ
CSAgQkVSTElOMl9TTV9UU0VOX1NUQVRVU19JTlRfRU4pOwogCiAJaWYgKHJldCA9PSAwKQogCQly
ZXQgPSAtRVRJTUVET1VUOwpAQCAtMTkwLDggKzE5MCw4IEBAIHN0YXRpYyBpbnQgYmVybGluMl9h
ZGNfdHNlbl9yZWFkKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYpCiAJCXJldHVybiByZXQ7CiAJ
fQogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgQkVSTElOMl9TTV9UU0VOX0NU
UkwsCi0JCQkgICBCRVJMSU4yX1NNX1RTRU5fQ1RSTF9TVEFSVCwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMocHJpdi0+cmVnbWFwLCBCRVJMSU4yX1NNX1RTRU5fQ1RSTCwKKwkJCSAgQkVSTElOMl9T
TV9UU0VOX0NUUkxfU1RBUlQpOwogCiAJZGF0YSA9IHByaXYtPmRhdGE7CiAJcHJpdi0+ZGF0YV9h
dmFpbGFibGUgPSBmYWxzZTsKQEAgLTI4NCw4ICsyODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGlpb19pbmZvIGJlcmxpbjJfYWRjX2luZm8gPSB7CiAKIHN0YXRpYyB2b2lkIGJlcmxpbjJfYWRj
X3Bvd2VyZG93bih2b2lkICpyZWdtYXApCiB7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwg
QkVSTElOMl9TTV9DVFJMLAotCQkJICAgQkVSTElOMl9TTV9DVFJMX0FEQ19QT1dFUiwgMCk7CisJ
cmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBCRVJMSU4yX1NNX0NUUkwsIEJFUkxJTjJfU01fQ1RS
TF9BRENfUE9XRVIpOwogCiB9CiAKQEAgLTMzOSw5ICszMzgsOCBAQCBzdGF0aWMgaW50IGJlcmxp
bjJfYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaW5kaW9fZGV2LT5u
dW1fY2hhbm5lbHMgPSBBUlJBWV9TSVpFKGJlcmxpbjJfYWRjX2NoYW5uZWxzKTsKIAogCS8qIFBv
d2VyIHVwIHRoZSBBREMgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBCRVJM
SU4yX1NNX0NUUkwsCi0JCQkgICBCRVJMSU4yX1NNX0NUUkxfQURDX1BPV0VSLAotCQkJICAgQkVS
TElOMl9TTV9DVFJMX0FEQ19QT1dFUik7CisJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwg
QkVSTElOMl9TTV9DVFJMLAorCQkJQkVSTElOMl9TTV9DVFJMX0FEQ19QT1dFUik7CiAKIAlyZXQg
PSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoJnBkZXYtPmRldiwgYmVybGluMl9hZGNfcG93ZXJk
b3duLAogCQkJCSAgICAgICBwcml2LT5yZWdtYXApOwoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
