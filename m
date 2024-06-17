Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09653C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osgwKwCWpXNbY8NIYMIShx0Skwk7Qe4IJ5ZWVPz8Qog=; b=egajteAlL8Q3iX
	7d4EdVVNdYWQnsU4s5hojQjUV/M2W4m3zjdAVNFwPmTmP6OSgVaJrglk+Ij9kapxvhXzU0RntsD4c
	EUHe6NbwCbQFV+4CAF9XErfBWrOXE5kMyEa3q1GNzMkDxNHjBkrK9Zeb7OFR+TA+RWHxnNrWUTuGV
	/wDZFPMA3zVj95m9XkeHz0eO1QNJwKfyysUYDiGgyetlLBWNkK/6VlJi4eOje3MxPFKOQhzOzh5ul
	C0kUKCEki8WibutrPtYyBETd4F+nLefXkojm6p5bw9no8xYj+dRMO7oJCin1rjyHUs3QJd/karkk2
	yzJEPqTO4qBhbaNYdgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDri-0000000BKoC-0k27;
	Mon, 17 Jun 2024 15:01:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClV-0000000Ay1M-2ast
	for linux-amlogic@bombadil.infradead.org;
	Mon, 17 Jun 2024 13:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AKnuVsDBtdHGm81QL99oZtdVbIW3JEVTOu6hlNZPjXg=; b=H4JKiuf+/H2K2pDW7QUh8s/lry
	1A2r/xlklaU2Wyjs+Ro+g0ZJ9T0MRGcRzKS348Un9e8wCxNhX42YRkU1MivwIWIA0qboEWDz6589e
	W+vGinfM/qbbVVkRsvj05KcP4lBRyh6RjlU3VF6MeI7ylvriYgI7DtPpQKUUoHWOkxA08ULAoVA6j
	4kuvSS0CdQjHlJwDq8DrB8PoPEhTiln5Xmt0oEXkFW8nFqdRkdNJBEZyqE6j7w+VhWXMFOGe2Mo6H
	dwzx1z7xIrMEe9B2LBYsEP82yeVV8hbPDQ6AYm8Iy8Vgeh25RftSmlcnGp/jwcoyn1q9Lsh8LUYUe
	Ih5TT0OQ==;
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClS-00000006RE8-0Tyd
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:20 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4e4f0020ca3so1319448e0c.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632273; x=1719237073; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKnuVsDBtdHGm81QL99oZtdVbIW3JEVTOu6hlNZPjXg=;
        b=hvoHpOc6QZ+3tKUNT6L7zmg0si9jzTodZx/J7P/Cnf4N+u39FT8HbpUc4ysi5gkJZN
         6vZqOfISn6P7YhLdjOGiDCuJuZzYEgBAy+ntiwUVtpcjnDDRB0ZaeaaN7CBTfCBo7a4F
         vexW/xDL0tk8+5FmTVtQr+Y45612FiDD3Z9qc0MrJ2R/mgjmuBN7SKW9rsTzLwH09pzd
         FfC6QZ2V1cWxcTXWOo+GwEUJCe4A/3yH3tRUfmnnCkGt7HOCjPKuxj5mQs3CT4nYCb/w
         LpPmXRWXFONhvZANXLRU//xRkleFwLrDVYpUdfI35ri5xB6fBhPx9YFR7sYpf1lJP1cp
         Q30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632273; x=1719237073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKnuVsDBtdHGm81QL99oZtdVbIW3JEVTOu6hlNZPjXg=;
        b=OL9G8ZmxGH0d6yS9AX8i3Uz3epduldZnUq832FlfPPZx6jGYhcpTZ6lQIA5G8lIqBa
         V7M5D79kPqy07BGofRO0XPLbhEtrzSxzxyqVi3yPEqNVV3XjFHteinSptdyIZfJKXP4d
         VyPPjBILoiTexpnatKpRaDuOQWovXL2og1jRPdrZuCfZjlRRY3vDZLavKtXQcxulIDwl
         ZAXukT7ua2r5M5Tag5tVRK0QDK+w0+qz6HiPx4mGRboiLRjKHmgXjROpbasoS1gWVzQ1
         tXJizp1f6qF9/d+du8aDIqZ25i+TScaA0HNWB5Fp8ouNlpNT7jEtF9WBWGoUa7DmCAyA
         7TzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb0PK4g7RRdgASOlJ7qutMrufy8+oshMn1ZJ9XShs6ApTCAgsN6CcvPFSPZ6P+KO3ikCw/ycYATaat7hLJAM8fTwVFDFeh28IPeEaW1tZjcAw=
X-Gm-Message-State: AOJu0YxFnxdvrqhnW/kXuzw5nu3HhktlWRd1+2pBWPyNU35zNQ/GRmxK
	jOh9dfnbSe3GzOSei2mJtZoQd3IHDvkAs7V7EQwi7qMCYy4HnK5jORfTBBufM7s=
X-Google-Smtp-Source: AGHT+IHFy1tuFMwxa7P6sFsjYvAHUS1dIKxzAj2HLRYOAmnW2Gug4qjgVMG/WpGom5Qua5PdHz8vPQ==
X-Received: by 2002:a05:6122:915:b0:4ec:efca:d2b with SMTP id 71dfb90a1353d-4ee3e59c40amr7925275e0c.8.1718632272678;
        Mon, 17 Jun 2024 06:51:12 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:51:12 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:21 -0400
Subject: [PATCH v3 41/41] iio: trigger: stm32-timer-trigger: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-41-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_145118_500834_6801E6BD 
X-CRM114-Status: GOOD (  12.89  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMgfCAz
NCArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vdHJp
Z2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMgYi9kcml2ZXJzL2lpby90cmlnZ2VyL3N0bTMyLXRp
bWVyLXRyaWdnZXIuYwppbmRleCBkNzY0NDQwMzBhMjguLjA2ODQzMjk5NTZkOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMKKysrIGIvZHJpdmVy
cy9paW8vdHJpZ2dlci9zdG0zMi10aW1lci10cmlnZ2VyLmMKQEAgLTE1OCw3ICsxNTgsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX3RpbWVyX3N0YXJ0KHN0cnVjdCBzdG0zMl90aW1lcl90cmlnZ2VyICpw
cml2LAogCiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1BTQywgcHJlc2NhbGVyKTsK
IAlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1fQVJSLCBwcmQgLSAxKTsKLQlyZWdtYXBf
dXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUsIFRJTV9DUjFf
QVJQRSk7CisJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9B
UlBFKTsKIAogCS8qIEZvcmNlIG1hc3RlciBtb2RlIHRvIHVwZGF0ZSBtb2RlICovCiAJaWYgKHN0
bTMyX3RpbWVyX2lzX3RyZ28yX25hbWUodHJpZy0+bmFtZSkpCkBAIC0xNjksMTAgKzE2OSwxMCBA
QCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX3N0YXJ0KHN0cnVjdCBzdG0zMl90aW1lcl90cmlnZ2Vy
ICpwcml2LAogCQkJCSAgIDB4MiA8PCBUSU1fQ1IyX01NU19TSElGVCk7CiAKIAkvKiBNYWtlIHN1
cmUgdGhhdCByZWdpc3RlcnMgYXJlIHVwZGF0ZWQgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJp
di0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHLCBUSU1fRUdSX1VHKTsKKwlyZWdtYXBfc2V0
X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHKTsKIAogCS8qIEVuYWJsZSBj
b250cm9sbGVyICovCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwg
VElNX0NSMV9DRU4sIFRJTV9DUjFfQ0VOKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFw
LCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJbXV0ZXhfdW5sb2NrKCZwcml2LT5sb2NrKTsKIAog
CXJldHVybiAwOwpAQCAtMTg5LDE5ICsxODksMTkgQEAgc3RhdGljIHZvaWQgc3RtMzJfdGltZXJf
c3RvcChzdHJ1Y3Qgc3RtMzJfdGltZXJfdHJpZ2dlciAqcHJpdiwKIAogCW11dGV4X2xvY2soJnBy
aXYtPmxvY2spOwogCS8qIFN0b3AgdGltZXIgKi8KLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+
cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUsIDApOwotCXJlZ21hcF91cGRhdGVfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOLCAwKTsKKwlyZWdtYXBfY2xlYXJfYml0
cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQVJQRSk7CisJcmVnbWFwX2NsZWFyX2Jp
dHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJcmVnbWFwX3dyaXRlKHBy
aXYtPnJlZ21hcCwgVElNX1BTQywgMCk7CiAJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElN
X0FSUiwgMCk7CiAKIAkvKiBGb3JjZSBkaXNhYmxlIG1hc3RlciBtb2RlICovCiAJaWYgKHN0bTMy
X3RpbWVyX2lzX3RyZ28yX25hbWUodHJpZy0+bmFtZSkpCi0JCXJlZ21hcF91cGRhdGVfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TMiwgMCk7CisJCXJlZ21hcF9jbGVhcl9i
aXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMiwgVElNX0NSMl9NTVMyKTsKIAllbHNlCi0JCXJlZ21h
cF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TLCAwKTsKKwkJ
cmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IyLCBUSU1fQ1IyX01NUyk7CiAK
IAkvKiBNYWtlIHN1cmUgdGhhdCByZWdpc3RlcnMgYXJlIHVwZGF0ZWQgKi8KLQlyZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHLCBUSU1fRUdSX1VHKTsK
KwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fRUdSLCBUSU1fRUdSX1VHKTsKIAog
CWlmIChwcml2LT5lbmFibGVkKSB7CiAJCXByaXYtPmVuYWJsZWQgPSBmYWxzZTsKQEAgLTQ5OCwx
MSArNDk4LDkgQEAgc3RhdGljIGludCBzdG0zMl9jb3VudGVyX3dyaXRlX3JhdyhzdHJ1Y3QgaWlv
X2RldiAqaW5kaW9fZGV2LAogCQkJCXByaXYtPmVuYWJsZWQgPSB0cnVlOwogCQkJCWNsa19lbmFi
bGUocHJpdi0+Y2xrKTsKIAkJCX0KLQkJCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAs
IFRJTV9DUjEsIFRJTV9DUjFfQ0VOLAotCQkJCQkgICBUSU1fQ1IxX0NFTik7CisJCQlyZWdtYXBf
c2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7CiAJCX0gZWxzZSB7
Ci0JCQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NF
TiwKLQkJCQkJICAgMCk7CisJCQlyZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9D
UjEsIFRJTV9DUjFfQ0VOKTsKIAkJCWlmIChwcml2LT5lbmFibGVkKSB7CiAJCQkJcHJpdi0+ZW5h
YmxlZCA9IGZhbHNlOwogCQkJCWNsa19kaXNhYmxlKHByaXYtPmNsayk7CkBAIC01NTUsNyArNTUz
LDcgQEAgc3RhdGljIGludCBzdG0zMl9zZXRfdHJpZ2dlcl9tb2RlKHN0cnVjdCBpaW9fZGV2ICpp
bmRpb19kZXYsCiB7CiAJc3RydWN0IHN0bTMyX3RpbWVyX3RyaWdnZXIgKnByaXYgPSBpaW9fcHJp
dihpbmRpb19kZXYpOwogCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX1NN
Q1IsIFRJTV9TTUNSX1NNUywgVElNX1NNQ1JfU01TKTsKKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+
cmVnbWFwLCBUSU1fU01DUiwgVElNX1NNQ1JfU01TKTsKIAogCXJldHVybiAwOwogfQpAQCAtNjgz
LDcgKzY4MSw3IEBAIHN0YXRpYyBzc2l6ZV90IHN0bTMyX2NvdW50X3NldF9wcmVzZXQoc3RydWN0
IGlpb19kZXYgKmluZGlvX2RldiwKIAkJcmV0dXJuIHJldDsKIAogCS8qIFRJTXhfQVJSIHJlZ2lz
dGVyIHNob3VsZG4ndCBiZSBidWZmZXJlZCAoQVJQRT0wKSAqLwotCXJlZ21hcF91cGRhdGVfYml0
cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQVJQRSwgMCk7CisJcmVnbWFwX2NsZWFy
X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0FSUEUpOwogCXJlZ21hcF93cml0
ZShwcml2LT5yZWdtYXAsIFRJTV9BUlIsIHByZXNldCk7CiAKIAlyZXR1cm4gbGVuOwpAQCAtNzU3
LDkgKzc1NSw5IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3RpbWVyX2RldGVjdF90cmdvMihzdHJ1Y3Qg
c3RtMzJfdGltZXJfdHJpZ2dlciAqcHJpdikKIAkgKiBNYXN0ZXIgbW9kZSBzZWxlY3Rpb24gMiBi
aXRzIGNhbiBvbmx5IGJlIHdyaXR0ZW4gYW5kIHJlYWQgYmFjayB3aGVuCiAJICogdGltZXIgc3Vw
cG9ydHMgaXQuCiAJICovCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NS
MiwgVElNX0NSMl9NTVMyLCBUSU1fQ1IyX01NUzIpOworCXJlZ21hcF9zZXRfYml0cyhwcml2LT5y
ZWdtYXAsIFRJTV9DUjIsIFRJTV9DUjJfTU1TMik7CiAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFw
LCBUSU1fQ1IyLCAmdmFsKTsKLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1f
Q1IyLCBUSU1fQ1IyX01NUzIsIDApOworCXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwg
VElNX0NSMiwgVElNX0NSMl9NTVMyKTsKIAlwcml2LT5oYXNfdHJnbzIgPSAhIXZhbDsKIH0KIApA
QCAtODIwLDcgKzgxOCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3RpbWVyX3RyaWdnZXJfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJLyogQ2hlY2sgaWYgbm9ib2R5IGVsc2Ug
dXNlIHRoZSB0aW1lciwgdGhlbiBkaXNhYmxlIGl0ICovCiAJcmVnbWFwX3JlYWQocHJpdi0+cmVn
bWFwLCBUSU1fQ0NFUiwgJnZhbCk7CiAJaWYgKCEodmFsICYgVElNX0NDRVJfQ0NYRSkpCi0JCXJl
Z21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOLCAwKTsK
KwkJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7
CiAKIAlpZiAocHJpdi0+ZW5hYmxlZCkKIAkJY2xrX2Rpc2FibGUocHJpdi0+Y2xrKTsKQEAgLTg0
MSw3ICs4MzksNyBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX3RyaWdnZXJfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX1NNQ1IsICZw
cml2LT5iYWsuc21jcik7CiAKIAkJLyogRGlzYWJsZSB0aGUgdGltZXIgKi8KLQkJcmVnbWFwX3Vw
ZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4sIDApOworCQlyZWdt
YXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DUjEsIFRJTV9DUjFfQ0VOKTsKIAkJY2xr
X2Rpc2FibGUocHJpdi0+Y2xrKTsKIAl9CiAKCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
