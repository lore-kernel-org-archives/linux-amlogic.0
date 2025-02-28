Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3090DC19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OryWiZaTV6UapOy0FhtwfVlibKlGQE1Za3rpdAoGVfE=; b=aUFl+xJM2Gv8pX
	vFxz7V3iialmxPFaZboKwUBiDamOsTmToO3gjGfCYRdXTXev91L3YHi/Dk2z5TCB8A/cdh7via9IE
	i+O6BDFrk0hkbu96FbJKmL1q1528/onHo3jsfGWGQ8ip3tle0FA+dYZaGxkTy0epACvDdbcluL2aV
	5N/FV2Pa3G0BgudyM5Gdjrbhq1yTtiBkfJLSeGLn25FPOtFkHab6fQ8avvMIHniH1XutqnnIEbZzF
	E+tfHclJW/NtQ8xrom3A6qEFky9GTbcRGu+9XG7VlHTBmDmurcb3RaZg+ZLjcHVQ0IJ+7O4jpbMKk
	llCJYyxiqPnJ1A1QNn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1QF-0000000BHL2-2f2U;
	Fri, 28 Feb 2025 14:33:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Y-0000000BBCx-1zD8
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e058ca6806so3334664a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751651; x=1741356451; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=uDAW3GLnbrAOQLZ5OnE65s070o6G9uX+ABQiG/1M6errgVE8AN1q+HNfsHpFTq1yUU
         8jXpdzx69Bib2RNZSBIESad3afM6yTwMkiZtpwqqZM27cijA/4lFiGcgSgStgr7rovrz
         sEzALMQGFeEXwMURA/wXfdlE3sKivTQAlallMjYO5HCTYxSvC36PyE3M7RGbjFA0X6A+
         ORkuQuzvudKaNpMadQquMlk/yRHZMgQyPq1bG0/aWU125zoZBqHG/4WKMbbdKQXvmtN5
         FY0HidUsyl9SZGHfV7sbxGN9LFKnTucEZc3ppHRGM5UYmkHJ868vELSlCen96I099j6/
         myWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751651; x=1741356451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/r1ypkbSjtebcdcKcBz70+d9/hPyy6PTiaBKA6Wiwh8=;
        b=GpF/N+IxUFSOPzWnug4gW3oJxnjItj5Gk/oC1LqaAIOTs/Iipi6uPhtGl3YwuDwNZd
         z5XoY+2PrrtpJi3Cn6lv/+toy0GubtMzC5Iuj00/hCQiF63WFKZvZQrNAk/d6KD6GXbE
         zvQl8CIBuKmRWjUnb9+ee5oMjFK1Bbd4UYBy7TPoDcFABbE01Lb7IxfK4JZf9K7VaA2A
         gQ/RsCu7O7ezSa2gx6Ry7Rihm416zSns++T5pQDJpY6ZNHmrzDYT9dC2KcnaQAWIHzSr
         nIxy3b+Rx7C6g0AiWl+Zt/t2QI8wzKq8TeqpLLVDmW3y90cR6XWXnIHX2Z67r+LemSH0
         ykHA==
X-Forwarded-Encrypted: i=1; AJvYcCXurEv3xw8p+sHLagdAhodWoLUOAMNm735m+fEvszBr7FDFX+2j54DqwYiQdBxBmBjgeySFhr0QSs13qi30@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1LO+7iP/qbi8/UDLV3ZMtmyH3DEqGLK8K1iFokSIHRHOCJQ8j
	xhySgj7SOiZjkLe1MgFOFC/ruWHJPBCykIcHujjqChXTtaywI6auafGzhQ5e8t0=
X-Gm-Gg: ASbGncsw4n9dnX5V0XXq1+/EYeVS9za8tNBfwp1BQ5P2OckhU+N8X8W4VK58F9OrhID
	Lhcfe3XzXsipmJztZFB7NOHthckT98PrCxReGT+wxPtgO0wH0Lif4QBb+qEvaey9+ebaP2wIIjm
	/IC99zCG7dwcqer5lyjZI7B6q92drVUfNoGeG2nCjU5vGahSgQ0HLnO/q0qBTo3/DTG8AMgukyS
	mIQLEyrAMtEFwHKdDs7MLq4fYjUFpUv+Mv2cOLLYQVG/rT2mlOt5L/WoWTMt0DwvU75UyjezqkI
	NWyVDDO+nz4OFtsOBQVJKscj8I9oofE96XlfS1S67zdXq2QWrKbDR2nTmY+zTRALX85JZckwdio
	/f9U2G3hQZw==
X-Google-Smtp-Source: AGHT+IEmNzc9psOsG8S5U8hQjyEGUEZtM5fJSHlUXxz0d+LoEipOpq1K+57NoVXqKGgpzCnWIQsf3g==
X-Received: by 2002:a05:6402:2711:b0:5de:dfd0:9d22 with SMTP id 4fb4d7f45d1cf-5e4d6b6ebf3mr3156214a12.22.1740751650904;
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:30 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:29 +0000
Subject: [PATCH 16/18] rtc: sd3078: drop needless struct sd3078
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-16-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060732_565186_D2720728 
X-CRM114-Status: GOOD (  15.87  )
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

VGhpcyBwcml2YXRlIGRhdGEgc3RydWN0IGhhcyBvbmUgbWVtYmVyIG9ubHksIHRoZXJlIGlzIG5v
IG5lZWQgdG8KYWxsb2NhdGUgZGF0YSBmb3IgaXQgYW5kIHBhc3MgdGhhdCBhcm91bmQgdmlhIHRo
ZSB2YXJpb3VzIGNhbGxiYWNrcywKanVzdCB0byBleHRyYWN0IHRoYXQgb25lIG1lbWJlci4KCklu
c3RlYWQsIHdlIGNhbiBqdXN0IHBhc3MgdGhhdCBvbmUgbWVtYmVyIGFuZCBhdm9pZCB0aGUgZXh0
cmEgbWVtb3J5CmFsbG9jYXRpb24sIHJlZHVjaW5nIHJ1bnRpbWUgbWVtb3J5IGNvbnN1bXB0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9y
Zz4KLS0tCiBkcml2ZXJzL3J0Yy9ydGMtc2QzMDc4LmMgfCA1NSArKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAzNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtc2Qz
MDc4LmMgYi9kcml2ZXJzL3J0Yy9ydGMtc2QzMDc4LmMKaW5kZXggZWJiNGQ0NWNlMjQwOTk4Mjg4
MGFmZmJjN2E4NWQ1ZTc0MTBjOGY0Mi4uMTBjYzFkY2ZjNzc0ODE0NGY1MWVmNjc0OTM5NTA2ZmVl
ZTFmYjQ3MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jCisrKyBiL2RyaXZl
cnMvcnRjL3J0Yy1zZDMwNzguYwpAQCAtMzYsMTAgKzM2LDYgQEAKICAqLwogI2RlZmluZSBXUklU
RV9QUk9URUNUX0VOCTAKIAotc3RydWN0IHNkMzA3OCB7Ci0Jc3RydWN0IHJlZ21hcAkJKnJlZ21h
cDsKLX07Ci0KIC8qCiAgKiBJbiBvcmRlciB0byBwcmV2ZW50IGFyYml0cmFyeSBtb2RpZmljYXRp
b24gb2YgdGhlIHRpbWUgcmVnaXN0ZXIsCiAgKiB3aGVuIG1vZGlmaWNhdGlvbiBvZiB0aGUgcmVn
aXN0ZXIsCkBAIC00OCwxNCArNDQsMTEgQEAgc3RydWN0IHNkMzA3OCB7CiAgKiAyLiBzZXQgV1JJ
VEUyIGJpdAogICogMy4gc2V0IFdSSVRFMyBiaXQKICAqLwotc3RhdGljIHZvaWQgc2QzMDc4X2Vu
YWJsZV9yZWdfd3JpdGUoc3RydWN0IHNkMzA3OCAqc2QzMDc4KQorc3RhdGljIHZvaWQgc2QzMDc4
X2VuYWJsZV9yZWdfd3JpdGUoc3RydWN0IHJlZ21hcCAqcmVnbWFwKQogewotCXJlZ21hcF91cGRh
dGVfYml0cyhzZDMwNzgtPnJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMiwKLQkJCSAgIEtFWV9XUklU
RTEsIEtFWV9XUklURTEpOwotCXJlZ21hcF91cGRhdGVfYml0cyhzZDMwNzgtPnJlZ21hcCwgU0Qz
MDc4X1JFR19DVFJMMSwKLQkJCSAgIEtFWV9XUklURTIsIEtFWV9XUklURTIpOwotCXJlZ21hcF91
cGRhdGVfYml0cyhzZDMwNzgtPnJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMSwKLQkJCSAgIEtFWV9X
UklURTMsIEtFWV9XUklURTMpOworCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIFNEMzA3OF9S
RUdfQ1RSTDIsIEtFWV9XUklURTEsIEtFWV9XUklURTEpOworCXJlZ21hcF91cGRhdGVfYml0cyhy
ZWdtYXAsIFNEMzA3OF9SRUdfQ1RSTDEsIEtFWV9XUklURTIsIEtFWV9XUklURTIpOworCXJlZ21h
cF91cGRhdGVfYml0cyhyZWdtYXAsIFNEMzA3OF9SRUdfQ1RSTDEsIEtFWV9XUklURTMsIEtFWV9X
UklURTMpOwogfQogCiAjaWYgV1JJVEVfUFJPVEVDVF9FTgpAQCAtNjgsMTQgKzYxLDExIEBAIHN0
YXRpYyB2b2lkIHNkMzA3OF9lbmFibGVfcmVnX3dyaXRlKHN0cnVjdCBzZDMwNzggKnNkMzA3OCkK
ICAqIDIuIGNsZWFyIFdSSVRFMyBiaXQKICAqIDMuIGNsZWFyIFdSSVRFMSBiaXQKICAqLwotc3Rh
dGljIHZvaWQgc2QzMDc4X2Rpc2FibGVfcmVnX3dyaXRlKHN0cnVjdCBzZDMwNzggKnNkMzA3OCkK
K3N0YXRpYyB2b2lkIHNkMzA3OF9kaXNhYmxlX3JlZ193cml0ZShzdHJ1Y3QgcmVnbWFwICpyZWdt
YXApCiB7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKHNkMzA3OC0+cmVnbWFwLCBTRDMwNzhfUkVHX0NU
UkwxLAotCQkJICAgS0VZX1dSSVRFMiwgMCk7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKHNkMzA3OC0+
cmVnbWFwLCBTRDMwNzhfUkVHX0NUUkwxLAotCQkJICAgS0VZX1dSSVRFMywgMCk7Ci0JcmVnbWFw
X3VwZGF0ZV9iaXRzKHNkMzA3OC0+cmVnbWFwLCBTRDMwNzhfUkVHX0NUUkwyLAotCQkJICAgS0VZ
X1dSSVRFMSwgMCk7CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0QzMDc4X1JFR19DVFJM
MSwgS0VZX1dSSVRFMiwgMCk7CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0QzMDc4X1JF
R19DVFJMMSwgS0VZX1dSSVRFMywgMCk7CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0Qz
MDc4X1JFR19DVFJMMiwgS0VZX1dSSVRFMSwgMCk7CiB9CiAjZW5kaWYKIApAQCAtODQsMTEgKzc0
LDEwIEBAIHN0YXRpYyBpbnQgc2QzMDc4X3J0Y19yZWFkX3RpbWUoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgcnRjX3RpbWUgKnRtKQogCXVuc2lnbmVkIGNoYXIgaG91cjsKIAl1bnNpZ25lZCBj
aGFyIHJ0Y19kYXRhW05VTV9USU1FX1JFR1NdID0gezB9OwogCXN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQgPSB0b19pMmNfY2xpZW50KGRldik7Ci0Jc3RydWN0IHNkMzA3OCAqc2QzMDc4ID0gaTJj
X2dldF9jbGllbnRkYXRhKGNsaWVudCk7CisJc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gaTJjX2dl
dF9jbGllbnRkYXRhKGNsaWVudCk7CiAJaW50IHJldDsKIAotCXJldCA9IHJlZ21hcF9idWxrX3Jl
YWQoc2QzMDc4LT5yZWdtYXAsIFNEMzA3OF9SRUdfU0MsIHJ0Y19kYXRhLAotCQkJICAgICAgIE5V
TV9USU1FX1JFR1MpOworCXJldCA9IHJlZ21hcF9idWxrX3JlYWQocmVnbWFwLCBTRDMwNzhfUkVH
X1NDLCBydGNfZGF0YSwgTlVNX1RJTUVfUkVHUyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2Vy
cihkZXYsICJyZWFkaW5nIGZyb20gUlRDIGZhaWxlZCB3aXRoIGVycjolZFxuIiwgcmV0KTsKIAkJ
cmV0dXJuIHJldDsKQEAgLTEyMiw3ICsxMTEsNyBAQCBzdGF0aWMgaW50IHNkMzA3OF9ydGNfc2V0
X3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRtKQogewogCXVuc2ln
bmVkIGNoYXIgcnRjX2RhdGFbTlVNX1RJTUVfUkVHU107CiAJc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IHRvX2kyY19jbGllbnQoZGV2KTsKLQlzdHJ1Y3Qgc2QzMDc4ICpzZDMwNzggPSBpMmNf
Z2V0X2NsaWVudGRhdGEoY2xpZW50KTsKKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXAgPSBpMmNfZ2V0
X2NsaWVudGRhdGEoY2xpZW50KTsKIAlpbnQgcmV0OwogCiAJcnRjX2RhdGFbU0QzMDc4X1JFR19T
Q10gPSBiaW4yYmNkKHRtLT50bV9zZWMpOwpAQCAtMTM0LDEwICsxMjMsMTAgQEAgc3RhdGljIGlu
dCBzZDMwNzhfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y190aW1l
ICp0bSkKIAlydGNfZGF0YVtTRDMwNzhfUkVHX1lSXSA9IGJpbjJiY2QodG0tPnRtX3llYXIgLSAx
MDApOwogCiAjaWYgV1JJVEVfUFJPVEVDVF9FTgotCXNkMzA3OF9lbmFibGVfcmVnX3dyaXRlKHNk
MzA3OCk7CisJc2QzMDc4X2VuYWJsZV9yZWdfd3JpdGUocmVnbWFwKTsKICNlbmRpZgogCi0JcmV0
ID0gcmVnbWFwX2J1bGtfd3JpdGUoc2QzMDc4LT5yZWdtYXAsIFNEMzA3OF9SRUdfU0MsIHJ0Y19k
YXRhLAorCXJldCA9IHJlZ21hcF9idWxrX3dyaXRlKHJlZ21hcCwgU0QzMDc4X1JFR19TQywgcnRj
X2RhdGEsCiAJCQkJTlVNX1RJTUVfUkVHUyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2Vycihk
ZXYsICJ3cml0aW5nIHRvIFJUQyBmYWlsZWQgd2l0aCBlcnI6JWRcbiIsIHJldCk7CkBAIC0xNDUs
NyArMTM0LDcgQEAgc3RhdGljIGludCBzZDMwNzhfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IHJ0Y190aW1lICp0bSkKIAl9CiAKICNpZiBXUklURV9QUk9URUNUX0VOCi0J
c2QzMDc4X2Rpc2FibGVfcmVnX3dyaXRlKHNkMzA3OCk7CisJc2QzMDc4X2Rpc2FibGVfcmVnX3dy
aXRlKHJlZ21hcCk7CiAjZW5kaWYKIAogCXJldHVybiAwOwpAQCAtMTY1LDIzICsxNTQsMTkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHJlZ21hcF9jb25maWcgPSB7CiBzdGF0
aWMgaW50IHNkMzA3OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogewogCWludCBy
ZXQ7Ci0Jc3RydWN0IHNkMzA3OCAqc2QzMDc4OworCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKIAlz
dHJ1Y3QgcnRjX2RldmljZSAqcnRjOwogCiAJaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0eShj
bGllbnQtPmFkYXB0ZXIsIEkyQ19GVU5DX0kyQykpCiAJCXJldHVybiAtRU5PREVWOwogCi0Jc2Qz
MDc4ID0gZGV2bV9remFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCpzZDMwNzgpLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIXNkMzA3OCkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlzZDMwNzgtPnJlZ21h
cCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwgJnJlZ21hcF9jb25maWcpOwotCWlmIChJ
U19FUlIoc2QzMDc4LT5yZWdtYXApKSB7CisJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMo
Y2xpZW50LCAmcmVnbWFwX2NvbmZpZyk7CisJaWYgKElTX0VSUihyZWdtYXApKSB7CiAJCWRldl9l
cnIoJmNsaWVudC0+ZGV2LCAicmVnbWFwIGFsbG9jYXRpb24gZmFpbGVkXG4iKTsKLQkJcmV0dXJu
IFBUUl9FUlIoc2QzMDc4LT5yZWdtYXApOworCQlyZXR1cm4gUFRSX0VSUihyZWdtYXApOwogCX0K
IAotCWkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIHNkMzA3OCk7CisJaTJjX3NldF9jbGllbnRk
YXRhKGNsaWVudCwgcmVnbWFwKTsKIAogCXJ0YyA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgm
Y2xpZW50LT5kZXYpOwogCWlmIChJU19FUlIocnRjKSkKQEAgLTE5NSw3ICsxODAsNyBAQCBzdGF0
aWMgaW50IHNkMzA3OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWlmIChyZXQp
CiAJCXJldHVybiByZXQ7CiAKLQlzZDMwNzhfZW5hYmxlX3JlZ193cml0ZShzZDMwNzgpOworCXNk
MzA3OF9lbmFibGVfcmVnX3dyaXRlKHJlZ21hcCk7CiAKIAlyZXR1cm4gMDsKIH0KCi0tIAoyLjQ4
LjEuNzExLmcyZmVhYmFiMjVhLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
