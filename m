Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79168C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJAON7D1Gj9k3moNB5RYkJChkCKD+29oGk+cGwhd8I4=; b=wM3z7hu65Lf8vC
	aL8N6ri5nStwWLCulj7wHG2JE4PEACmSyTFPQe3gNYDYdLUJEFPbu1mIPjoiClseSISD51MqynFqP
	pUFYVP0ceYwcL7eeG7g0EWRczKt7gmwbEUSYa5Hm3vOIDOa2ZyVCt4/Yw43eK53AYF3RbYPx913gP
	CXuqKVICAQ7bKyo66LQgp+l+UhiyFV8JHNMh0IH1JAAJqKs6H+Zh//+KB6cFDYxy0PqBHZuDMV0xb
	AzxL3FMHZZFJDnKwzIHCqAZPkkpioSWNdhybgbfwUl2g9kH2NxNqyk/TwCbtiRFLgU30/OtdqsmEQ
	/4UlB5q3JtQoE1sbYDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to17o-0000000BD1z-0MWq;
	Fri, 28 Feb 2025 14:14:00 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11S-0000000BB4l-21w2
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:27 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so3925559a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=G4PPb6eSOqQsfGd5jw8KZtBIDlaZ46OUx8WEWGYE7MpGMr2pdIAXJto70kQmyhvaka
         JutkpevsT0A/Grz9sf3a+6xhtTMiKdIF9OQNKxZKIR81IAGOopAh0oSkIA74wlMoJcC+
         jixqNRFWE4Y7AKLZyEaCsClYmR+D73eHprAbmcXaE9wb5TtkDaRAmlgrloYZk1aFQEs1
         Kx+hVJZIfoHXakIEdS1385F4XGH7yECRxrQm0JeVRb/9h1akck80j2vrCQ6C0F8Bpdva
         1Ku6vhqnK00EznVTbKZK2T+SwFXIg+9m9/NLobkL5bYPzdHCvQZb8ErvodJ5vBT2Wlmm
         2CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=t633fLBLM1kAxvRH1XX7XbCdkLkq4EmIpOobLAGN7m1HW7CnYFFcE3QG6f7bKKJS/x
         So+HVyXNKkLmwWhJffmtArhV4+Tsn/twj2Y07B5smsDMwkHennEBOjW+sGvII11/dKli
         Gtur8ZZqqH20Ewx+IvFJSzX0fCL+ZGUd7MsRQIlNXLcp46gty4jlcZfrTG6AObvR2XB7
         fR7VOYJ0UhtzbAGyB6kFMZop26akrs3wiXPiMX18/jh3MIccFwy6StfswKvaXwgWWuq0
         P9h6ZUVF9ImOU0oV0IntlMPv5yUHBNJLXb9MeY2Kb5CAzddnDPa+SbL6fKY5hdQ39tr4
         fyoA==
X-Forwarded-Encrypted: i=1; AJvYcCUCjgZwEwfG48Ct8lQ153ZWQTe7UL4Ms/De3HUXgOxCpBv5vDTN+K+cIsOh+Cjb/DmKzAbc9R6/xgSE8yFP@lists.infradead.org
X-Gm-Message-State: AOJu0YyZjIzuxirBStRoZGbA1sNgFpqAGpGaO2PQv+M2Rut2pfgjkQrm
	grlqJ2Bv8aj1hiRMSTnlkcoxMS5xpEfBlsljXrsjkEYXXJVu3XH17Ozrys9HRZY=
X-Gm-Gg: ASbGnctllWQMfodc6H3jKSyfMrqYvC1/WYXiQB0syBoM7AyZAVj7GvRbOYDlslcVM1d
	uP5ulW6x5cnuGL4QLg7rkQN5wD9L5r3rWrCR6idEsOiTMBdnh/QFB2ozp0kAORLQQiVYNCn4nXc
	HnTAk1EP6LX4a8Ua3roELTHjpIfx3Vpo+myjd/NpJktS4lUyMA70J4k1rRga1pW53y0XsJriVSC
	O7hTMLETv6eHhRDafVYALqyCUlD7Qw2gVmJsrFGeoSGSFS4B6BT4ZUfmOvpI2bYbw3sLFn4bCuA
	4D9tota7briNG2pEQPcas/j0uLWejTEkUxhXD7AG7eP2CBrcjDw3lHILVmtURWNRsC1J8X/emnl
	wGsl/nUz4Ig==
X-Google-Smtp-Source: AGHT+IFpdib5eLXvAKlYp3fUyW87rQ1IfZ8GEMoJsXuLGkDw56XS2aTZMwaUmenZ5apuVJAYF/Nggw==
X-Received: by 2002:a17:907:c018:b0:ab7:fc9a:28e2 with SMTP id a640c23a62f3a-abf2681f8f2mr377695266b.47.1740751644708;
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:17 +0000
Subject: [PATCH 04/18] rtc: ds2404: drop needless struct ds2404::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-4-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060726_519484_0DBBB6A5 
X-CRM114-Status: GOOD (  12.62  )
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

VGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5IHRoZSA6OnJ0YyBtZW1iZXIgaXMgbWFuYWdlZCB2aWEg
ZGV2cmVzLCBhbmQKbm8gY29kZSBpbiB0aGlzIGRyaXZlciB1c2VzIGl0IHBhc3QgX3Byb2JlKCku
CgpXZSBjYW4gZHJvcCBpdCBmcm9tIHRoZSBzdHJ1Y3R1cmUgYW5kIGp1c3QgdXNlIGEgbG9jYWwg
dGVtcG9yYXJ5CnZhcmlhYmxlLCByZWR1Y2luZyBydW50aW1lIG1lbW9yeSBjb25zdW1wdGlvbiBi
eSBhIGZldyBieXRlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFz
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLWRzMjQwNC5jIHwgMTQgKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWRzMjQwNC5jIGIvZHJpdmVycy9ydGMvcnRj
LWRzMjQwNC5jCmluZGV4IDMyMzFmZDlmNjFkYTQ5YmRhZjAwZTQ2NDg2ZmMzNDgzNjA5NGVlNzgu
LjIxNzY5NGVjYTM2YzM0MzJhOGRiM2I4NzQzNzRlMzQ3ZWViODAyZDkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcnRjL3J0Yy1kczI0MDQuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtZHMyNDA0LmMKQEAg
LTMxLDcgKzMxLDYgQEAgc3RydWN0IGRzMjQwNCB7CiAJc3RydWN0IGdwaW9fZGVzYyAqcnN0X2dw
aW9kOwogCXN0cnVjdCBncGlvX2Rlc2MgKmNsa19ncGlvZDsKIAlzdHJ1Y3QgZ3Bpb19kZXNjICpk
cV9ncGlvZDsKLQlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjOwogfTsKIAogc3RhdGljIGludCBkczI0
MDRfZ3Bpb19tYXAoc3RydWN0IGRzMjQwNCAqY2hpcCwgc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKQEAgLTE4Miw2ICsxODEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19v
cHMgZHMyNDA0X3J0Y19vcHMgPSB7CiBzdGF0aWMgaW50IHJ0Y19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBkczI0MDQgKmNoaXA7CisJc3RydWN0IHJ0Y19k
ZXZpY2UgKnJ0YzsKIAlpbnQgcmV0dmFsID0gLUVCVVNZOwogCiAJY2hpcCA9IGRldm1fa3phbGxv
YygmcGRldi0+ZGV2LCBzaXplb2Yoc3RydWN0IGRzMjQwNCksIEdGUF9LRVJORUwpOwpAQCAtMTkw
LDkgKzE5MCw5IEBAIHN0YXRpYyBpbnQgcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAKIAljaGlwLT5kZXYgPSAmcGRldi0+ZGV2OwogCi0JY2hpcC0+cnRjID0gZGV2bV9y
dGNfYWxsb2NhdGVfZGV2aWNlKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIoY2hpcC0+cnRjKSkK
LQkJcmV0dXJuIFBUUl9FUlIoY2hpcC0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9k
ZXZpY2UoJnBkZXYtPmRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRSX0VSUihy
dGMpOwogCiAJcmV0dmFsID0gZHMyNDA0X2dwaW9fbWFwKGNoaXAsIHBkZXYpOwogCWlmIChyZXR2
YWwpCkBAIC0yMDAsMTAgKzIwMCwxMCBAQCBzdGF0aWMgaW50IHJ0Y19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY2hpcCk7
CiAKLQljaGlwLT5ydGMtPm9wcyA9ICZkczI0MDRfcnRjX29wczsKLQljaGlwLT5ydGMtPnJhbmdl
X21heCA9IFUzMl9NQVg7CisJcnRjLT5vcHMgPSAmZHMyNDA0X3J0Y19vcHM7CisJcnRjLT5yYW5n
ZV9tYXggPSBVMzJfTUFYOwogCi0JcmV0dmFsID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKGNo
aXAtPnJ0Yyk7CisJcmV0dmFsID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Yyk7CiAJaWYg
KHJldHZhbCkKIAkJcmV0dXJuIHJldHZhbDsKIAoKLS0gCjIuNDguMS43MTEuZzJmZWFiYWIyNWEt
Z29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
