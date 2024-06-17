Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F0C2BB9A
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSmg/6RRZrA3vYwawcKn00YQYpnLMOz4UuLub2zT8bg=; b=M9h9TkkjDLORI+
	gWJLiyAtJazbiziP4hE1U24I6wmCRYr++/lZiJTWEmQi8QSV6ukguWrQ3oDE9+jHrX5xwn87wcYZz
	qsJHNpeswK2I/rw0EdPs4ccVBgdzGy5dKZQqbvFJFK7qD4jb6Ps6a9RH9AEXyJS5l35WLw4c8qMFc
	pmL4JI2K51uCR5BnLaIh059DtTZdBIVf+TyayfbXYS293uLy6OJm9ZrKfMY2DSGndAuBdHl15r1Ry
	nEDdlWu5qBpWxcyvcYpzRGE35unXin1EYaRSwvAYJVSgon6CL0MIGA1EnRf9SPtgwVPjZ7pye3DPX
	vnKJstrhXiOJ0EHU2oTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrA-0000000BKLF-0swv;
	Mon, 17 Jun 2024 15:01:16 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkU-0000000Ax5q-0uZ6
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:33 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7954f8b818fso290886685a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632217; x=1719237017; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJ898fDCKj42D5/vtQAto1s5SAQxhzxV4OLmCarOpnQ=;
        b=j6cCNDY8oru7YYO0M2rpNXdb80xaSJFKwL+zv8yrRfSogy52hSKrlphTr/xAONgbdD
         k4jBeBM1noy/lk4hLLx9yhDAdcUR2tOojFgaTueamJ9FatIRqyF1uDUc64RX4jFzT40k
         XIn1duUvT7p14Yielq2q6yduxqH5qM4draXHFPG+I3copzmCA9wet+jftylwDCL6CV7b
         H90zNJyHSqAbudlnQUlpjsVVE8GLGUZPj6gPhVa9KDfZS9ovijnIZDpTsD12PaaSo+Df
         YD74gG5lWI6gkuWq8gGrT7z6eyYgouPtsaKk61DFfQHbTLDnc3qDr39IwaQEPg/7S6VS
         J+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632217; x=1719237017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJ898fDCKj42D5/vtQAto1s5SAQxhzxV4OLmCarOpnQ=;
        b=aYItOuibz/HxOFQmvDADTJ75YqkLceJ2MjV76aU/q/hQxp12FdJYRc9hQ0xt3Xd5ln
         iszkmWuu2NvZcpEvixlfhkhrrTFq2MmsSycFdnjW/iHA/eel8YyDvc0DEHEZ+uXllaTx
         y3qc2YOOktHgzDX3/OW8h4TV6j6CVLmkIxlfeXq7PBGuHrpSamq7KkEWYtLPdAanCmlG
         QwQA2tulCR+ftnIGbqNw8PQPioQddmR0WhDV/Q+qO0TL9K41b14NqR9Ydf/0jXZ34WqW
         6eQUiSY2slFP6zA1gTZcHaK6G+Hyu/O3rkjZhhXtxDt5YkIyWoDH8HZ1BLrr9aaNu/0i
         E36Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeyRKdHBa8a5XMBTnoihQn6QIHAZ3TcvH0h0u92PwHgpcb34CiS1o/PuRCNPA2fa8JY8ZiZ92YwptX26mbRXgQQgyr5w00pJqe6eXfUUQmtOU=
X-Gm-Message-State: AOJu0YxzjI1mw/uUkB/NhkBaGEYv+fzivdCaIp616B3TUMk6JaX1u7ya
	WV/eRbl3gZS/Vd+AqaBqPvk/zpzS4b0O5Uho8EZQMpDLMjeFTEi1LWJ8zTcvKGs=
X-Google-Smtp-Source: AGHT+IG7O2bJi0GCfnphwmiN8zuYwAKTZAA7K/LgtdsfOhK/hCe8sAhzrzmLoDYS8PhLsNItnynlLA==
X-Received: by 2002:a05:620a:404a:b0:795:2307:97ec with SMTP id af79cd13be357-798d2588f12mr1074628285a.56.1718632217032;
        Mon, 17 Jun 2024 06:50:17 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:16 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:55 -0400
Subject: [PATCH v3 15/41] iio: adc: qcom-spmi-rradc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-15-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065018_472675_B05B5B86 
X-CRM114-Status: GOOD (  10.91  )
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
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS1ycmFkYy5jIHwgNTAgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRj
L3Fjb20tc3BtaS1ycmFkYy5jIGIvZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS1ycmFkYy5jCmlu
ZGV4IDU2YTcxMzc2Njk1NC4uMTQwMmRmNjhkZDUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9h
ZGMvcWNvbS1zcG1pLXJyYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS1ycmFk
Yy5jCkBAIC0zNTgsMTUgKzM1OCwxNSBAQCBzdGF0aWMgaW50IHJyYWRjX2VuYWJsZV9jb250aW51
b3VzX21vZGUoc3RydWN0IHJyYWRjX2NoaXAgKmNoaXApCiAJaW50IHJldDsKIAogCS8qIENsZWFy
IGNoYW5uZWwgbG9nICovCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwg
Y2hpcC0+YmFzZSArIFJSX0FEQ19MT0csCi0JCQkJIFJSX0FEQ19MT0dfQ0xSX0NUUkwsIFJSX0FE
Q19MT0dfQ0xSX0NUUkwpOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhjaGlwLT5yZWdtYXAsIGNo
aXAtPmJhc2UgKyBSUl9BRENfTE9HLAorCQkJICAgICAgUlJfQURDX0xPR19DTFJfQ1RSTCk7CiAJ
aWYgKHJldCA8IDApIHsKIAkJZGV2X2VycihjaGlwLT5kZXYsICJsb2cgY3RybCB1cGRhdGUgdG8g
Y2xlYXIgZmFpbGVkOiVkXG4iLCByZXQpOwogCQlyZXR1cm4gcmV0OwogCX0KIAotCXJldCA9IHJl
Z21hcF91cGRhdGVfYml0cyhjaGlwLT5yZWdtYXAsIGNoaXAtPmJhc2UgKyBSUl9BRENfTE9HLAot
CQkJCSBSUl9BRENfTE9HX0NMUl9DVFJMLCAwKTsKKwlyZXQgPSByZWdtYXBfY2xlYXJfYml0cyhj
aGlwLT5yZWdtYXAsIGNoaXAtPmJhc2UgKyBSUl9BRENfTE9HLAorCQkJCVJSX0FEQ19MT0dfQ0xS
X0NUUkwpOwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIoY2hpcC0+ZGV2LCAibG9nIGN0cmwg
dXBkYXRlIHRvIG5vdCBjbGVhciBmYWlsZWQ6JWRcbiIsCiAJCQlyZXQpOwpAQCAtMzc0LDkgKzM3
NCw4IEBAIHN0YXRpYyBpbnQgcnJhZGNfZW5hYmxlX2NvbnRpbnVvdXNfbW9kZShzdHJ1Y3QgcnJh
ZGNfY2hpcCAqY2hpcCkKIAl9CiAKIAkvKiBTd2l0Y2ggdG8gY29udGludW91cyBtb2RlICovCi0J
cmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFzZSArIFJSX0FE
Q19DVEwsCi0JCQkJIFJSX0FEQ19DVExfQ09OVElOVU9VU19TRUwsCi0JCQkJIFJSX0FEQ19DVExf
Q09OVElOVU9VU19TRUwpOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhjaGlwLT5yZWdtYXAsIGNo
aXAtPmJhc2UgKyBSUl9BRENfQ1RMLAorCQkJICAgICAgUlJfQURDX0NUTF9DT05USU5VT1VTX1NF
TCk7CiAJaWYgKHJldCA8IDApCiAJCWRldl9lcnIoY2hpcC0+ZGV2LCAiVXBkYXRlIHRvIGNvbnRp
bnVvdXMgbW9kZSBmYWlsZWQ6JWRcbiIsCiAJCQlyZXQpOwpAQCAtMzg5LDggKzM4OCw4IEBAIHN0
YXRpYyBpbnQgcnJhZGNfZGlzYWJsZV9jb250aW51b3VzX21vZGUoc3RydWN0IHJyYWRjX2NoaXAg
KmNoaXApCiAJaW50IHJldDsKIAogCS8qIFN3aXRjaCB0byBub24gY29udGludW91cyBtb2RlICov
Ci0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFzZSArIFJS
X0FEQ19DVEwsCi0JCQkJIFJSX0FEQ19DVExfQ09OVElOVU9VU19TRUwsIDApOworCXJldCA9IHJl
Z21hcF9jbGVhcl9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFzZSArIFJSX0FEQ19DVEwsCisJ
CQkJUlJfQURDX0NUTF9DT05USU5VT1VTX1NFTCk7CiAJaWYgKHJldCA8IDApCiAJCWRldl9lcnIo
Y2hpcC0+ZGV2LCAiVXBkYXRlIHRvIG5vbi1jb250aW51b3VzIG1vZGUgZmFpbGVkOiVkXG4iLAog
CQkJcmV0KTsKQEAgLTQzNCw4ICs0MzMsOCBAQCBzdGF0aWMgaW50IHJyYWRjX3JlYWRfc3RhdHVz
X2luX2NvbnRfbW9kZShzdHJ1Y3QgcnJhZGNfY2hpcCAqY2hpcCwKIAkJcmV0dXJuIC1FSU5WQUw7
CiAJfQogCi0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFz
ZSArIGNoYW4tPnRyaWdnZXJfYWRkciwKLQkJCQkgY2hhbi0+dHJpZ2dlcl9tYXNrLCBjaGFuLT50
cmlnZ2VyX21hc2spOworCXJldCA9IHJlZ21hcF9zZXRfYml0cyhjaGlwLT5yZWdtYXAsIGNoaXAt
PmJhc2UgKyBjaGFuLT50cmlnZ2VyX2FkZHIsCisJCQkgICAgICBjaGFuLT50cmlnZ2VyX21hc2sp
OwogCWlmIChyZXQgPCAwKSB7CiAJCWRldl9lcnIoY2hpcC0+ZGV2LAogCQkJIkZhaWxlZCB0byBh
cHBseSB0cmlnZ2VyIGZvciBjaGFubmVsICclcycgcmV0PSVkXG4iLApAQCAtNDY5LDggKzQ2OCw4
IEBAIHN0YXRpYyBpbnQgcnJhZGNfcmVhZF9zdGF0dXNfaW5fY29udF9tb2RlKHN0cnVjdCBycmFk
Y19jaGlwICpjaGlwLAogCXJyYWRjX2Rpc2FibGVfY29udGludW91c19tb2RlKGNoaXApOwogCiBk
aXNhYmxlX3RyaWdnZXI6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+
YmFzZSArIGNoYW4tPnRyaWdnZXJfYWRkciwKLQkJCSAgIGNoYW4tPnRyaWdnZXJfbWFzaywgMCk7
CisJcmVnbWFwX2NsZWFyX2JpdHMoY2hpcC0+cmVnbWFwLCBjaGlwLT5iYXNlICsgY2hhbi0+dHJp
Z2dlcl9hZGRyLAorCQkJICBjaGFuLT50cmlnZ2VyX21hc2spOwogCiAJcmV0dXJuIHJldDsKIH0K
QEAgLTQ4MSwxNyArNDgwLDE2IEBAIHN0YXRpYyBpbnQgcnJhZGNfcHJlcGFyZV9iYXR0X2lkX2Nv
bnZlcnNpb24oc3RydWN0IHJyYWRjX2NoaXAgKmNoaXAsCiB7CiAJaW50IHJldDsKIAotCXJldCA9
IHJlZ21hcF91cGRhdGVfYml0cyhjaGlwLT5yZWdtYXAsIGNoaXAtPmJhc2UgKyBSUl9BRENfQkFU
VF9JRF9DVFJMLAotCQkJCSBSUl9BRENfQkFUVF9JRF9DVFJMX0NIQU5ORUxfQ09OViwKLQkJCQkg
UlJfQURDX0JBVFRfSURfQ1RSTF9DSEFOTkVMX0NPTlYpOworCXJldCA9IHJlZ21hcF9zZXRfYml0
cyhjaGlwLT5yZWdtYXAsIGNoaXAtPmJhc2UgKyBSUl9BRENfQkFUVF9JRF9DVFJMLAorCQkJICAg
ICAgUlJfQURDX0JBVFRfSURfQ1RSTF9DSEFOTkVMX0NPTlYpOwogCWlmIChyZXQgPCAwKSB7CiAJ
CWRldl9lcnIoY2hpcC0+ZGV2LCAiRW5hYmxpbmcgQkFUVCBJRCBjaGFubmVsIGZhaWxlZDolZFxu
IiwgcmV0KTsKIAkJcmV0dXJuIHJldDsKIAl9CiAKLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMo
Y2hpcC0+cmVnbWFwLAotCQkJCSBjaGlwLT5iYXNlICsgUlJfQURDX0JBVFRfSURfVFJJR0dFUiwK
LQkJCQkgUlJfQURDX1RSSUdHRVJfQ1RMLCBSUl9BRENfVFJJR0dFUl9DVEwpOworCXJldCA9IHJl
Z21hcF9zZXRfYml0cyhjaGlwLT5yZWdtYXAsCisJCQkgICAgICBjaGlwLT5iYXNlICsgUlJfQURD
X0JBVFRfSURfVFJJR0dFUiwKKwkJCSAgICAgIFJSX0FEQ19UUklHR0VSX0NUTCk7CiAJaWYgKHJl
dCA8IDApIHsKIAkJZGV2X2VycihjaGlwLT5kZXYsICJCQVRUX0lEIHRyaWdnZXIgc2V0IGZhaWxl
ZDolZFxuIiwgcmV0KTsKIAkJZ290byBvdXRfZGlzYWJsZV9iYXR0X2lkOwpAQCAtNTAwLDEyICs0
OTgsMTIgQEAgc3RhdGljIGludCBycmFkY19wcmVwYXJlX2JhdHRfaWRfY29udmVyc2lvbihzdHJ1
Y3QgcnJhZGNfY2hpcCAqY2hpcCwKIAlyZXQgPSBycmFkY19yZWFkX3N0YXR1c19pbl9jb250X21v
ZGUoY2hpcCwgY2hhbl9hZGRyZXNzKTsKIAogCS8qIFJlc2V0IHJlZ2lzdGVycyBiYWNrIHRvIGRl
ZmF1bHQgdmFsdWVzICovCi0JcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+
YmFzZSArIFJSX0FEQ19CQVRUX0lEX1RSSUdHRVIsCi0JCQkgICBSUl9BRENfVFJJR0dFUl9DVEws
IDApOworCXJlZ21hcF9jbGVhcl9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFzZSArIFJSX0FE
Q19CQVRUX0lEX1RSSUdHRVIsCisJCQkgIFJSX0FEQ19UUklHR0VSX0NUTCk7CiAKIG91dF9kaXNh
YmxlX2JhdHRfaWQ6Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKGNoaXAtPnJlZ21hcCwgY2hpcC0+YmFz
ZSArIFJSX0FEQ19CQVRUX0lEX0NUUkwsCi0JCQkgICBSUl9BRENfQkFUVF9JRF9DVFJMX0NIQU5O
RUxfQ09OViwgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMoY2hpcC0+cmVnbWFwLCBjaGlwLT5iYXNl
ICsgUlJfQURDX0JBVFRfSURfQ1RSTCwKKwkJCSAgUlJfQURDX0JBVFRfSURfQ1RSTF9DSEFOTkVM
X0NPTlYpOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTk2NSw5ICs5NjMsOSBAQCBzdGF0aWMgaW50
IHJyYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlpZiAoYmF0dF9p
ZF9kZWxheSA+PSAwKSB7CiAJCWJhdHRfaWRfZGVsYXkgPSBGSUVMRF9QUkVQKEJBVFRfSURfU0VU
VExFX01BU0ssIGJhdHRfaWRfZGVsYXkpOwotCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoY2hp
cC0+cmVnbWFwLAotCQkJCQkgY2hpcC0+YmFzZSArIFJSX0FEQ19CQVRUX0lEX0NGRywKLQkJCQkJ
IGJhdHRfaWRfZGVsYXksIGJhdHRfaWRfZGVsYXkpOworCQlyZXQgPSByZWdtYXBfc2V0X2JpdHMo
Y2hpcC0+cmVnbWFwLAorCQkJCSAgICAgIGNoaXAtPmJhc2UgKyBSUl9BRENfQkFUVF9JRF9DRkcs
CisJCQkJICAgICAgYmF0dF9pZF9kZWxheSk7CiAJCWlmIChyZXQgPCAwKSB7CiAJCQlkZXZfZXJy
KGNoaXAtPmRldiwKIAkJCQkiQkFUVF9JRCBzZXR0bGluZyB0aW1lIGNvbmZpZyBmYWlsZWQ6JWRc
biIsCgotLSAKMi40NS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
