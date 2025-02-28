Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82875C282C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X12r6SjqMrk1vGTbCo6MKfEk6NoKQAO8AOBGlsMADJ0=; b=WKE+61vG9szVTq
	WSmXqSKloG5e9yMNqJad9uoQxPaF5Vv+E7ul4un8fGsykveBz4CHTvT5MC1yifDWDyNCMC+k5YGA1
	09QJ5GUXOg/TF1IdpRVHXrLVnjDPVkKnzDHdsBMIfRpLIhSkW/e4qAQHtBlvqocmcYPrch6ZVeZAk
	NjFDf203KymVePISRtkYi7lIXnpxbRK4PGgIhvLMc+PIpHPg6/KgnA0NfWjT01Juy6SOgjmRBg8r5
	ivG6UVFo+1CwgOgl9FcyOI+l/Tz/OrZ2lfBy9Teqty4bNH2ul8Z0c9NRjeOdrAtte20VEEzxmnmdm
	LDagDS2ZeyB+FSpG1Ylw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Ld-0000000BGQz-21V1;
	Fri, 28 Feb 2025 14:28:17 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11W-0000000BBAw-3lnN
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so2082520a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=xvns22eqJsqG2Gl+DOBly4VUdih7jhlWc5oKSQYKcXdP+1AirS7tkIXy7iIijS1mJr
         qDpDnqAX9snAsF1OwQOI0OKUQzCTDFU78FNd5KBYO6vXB5bdIsg0XXEyamhZtst+yUVU
         EsKspYjRA9nii9d99C774PlUzMbHKMxtrlPEfyk3cI0jUir+zfsq1ucnKhnARK3NgBwZ
         KzK2RT5ruU9tCDN6Eh8o5SFjp89pZVyJqDn1EvbV7EATSsEfLLzN1ebczVaClz6rnGKD
         5g5I8wCWUu7mZ+mLPaJQ5GR2jKkuJImzq2L6NjizXMuMmAQw999wkmWtb2YbP6OdsZ/b
         oIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKZrDxBZwKYSSWAqYI1nyzOGiPZfFb6S25OWnyP8uMM=;
        b=tZDVQ1LjkOUaUhPzRJC4jb66BeFTcX2YDpAFl30ACzTCP4QFTC8VGeY3IlY2s3sELU
         wx3Q46yFFs5ysgMffBJrHZp0b5SKPQh5Geqn1NaICagCPG283ttZLr84K2wxPtoX+pRB
         7y7s/u9GaoFKMvH2KbQP7bwi1DI2yvDDcNER8+RAwdRDG158vkhU78u6RhUOGdBMRXrn
         V6VAPZ5pmTY7fjuFlj3k6NcgwVXuWa9Aj9fJqktwOal8CaD9/sfg9jRA3ANuLExA2F4m
         A3MDGm1y/XNlxZo9BkWycJRXAl54VL5xU2ke7AqM4HVQqtpY1rM/frqT2zFKxafVFI7l
         oJig==
X-Forwarded-Encrypted: i=1; AJvYcCUtHg/aGfP/t9zvnosalIN37ObCZWmJjXaD4gWEk0EyNzWnS5iWGzj5A26z+oOZqBDCrd9+4iwkrwRR1ptk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe+OxhlSQradchT/ZAK7Qq/gaR2JD7QLPLTzfqPobreAVDwQx3
	7ttQZQbgw5KyIf5eo4M1aIlhWE1SOGSvGh9FswhzD7VTx1tjXsUvwy2xODNUB5Y=
X-Gm-Gg: ASbGncsWPVjbPP8BHwtahhnJxUNpytgYyQcWWtFZNfmlZoyvKFG8hN74auXRGsR4FgV
	PwnCt93sWAjW5TIvaajk3IUZGWhNtEGdzJilRzBQZvX3UWGKZ0TFjegA42CEPP2EEH0h+/yHvvW
	515D6tIWW3JT+E2mhjST6sB38bDFYlsG6arC7ebiRBpuhiGGZSVPo/Fw26KjNAVaSeluocd6qYY
	/zd0l8bcgSFlwz8DZmBx8dboHSXm9/idQiTmmeoK1xVNS07SIqU3dWdW/IY9BGQAsBCz62YplYs
	W3w8N7PAzhRvzpyRPvjkW5++KeGRsLYUK5zk7DWiftnfN5LhvhF+ytuoTu0HybHym8mCsseCeYd
	GXAutQtng4w==
X-Google-Smtp-Source: AGHT+IHq59q43U3ESaHrkdTJX61FFZSQWYbph+vbGLJu0Eb0VqRkvBLNVX+MfvKgdS008nj52Al/2Q==
X-Received: by 2002:a05:6402:5188:b0:5dc:c531:e5c0 with SMTP id 4fb4d7f45d1cf-5e4d6b83d0emr2632501a12.27.1740751649255;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:26 +0000
Subject: [PATCH 13/18] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-13-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060730_936458_E429486B 
X-CRM114-Status: GOOD (  12.84  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXNkMjQwNWFsLmMgfCAxNiArKysr
KysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1zZDI0MDVhbC5jIGIvZHJpdmVycy9y
dGMvcnRjLXNkMjQwNWFsLmMKaW5kZXggZDI1NjhjM2UzODc2NTlkZmVhNTk4Y2QyZWY2YmRkYzVj
MDc2Y2JiOS4uMDBjMzAzM2U4MDc5YjVmMTBhYWFiY2M3YTFkM2YxOTc3MTI2M2EwMiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ydGMvcnRjLXNkMjQwNWFsLmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLXNk
MjQwNWFsLmMKQEAgLTQyLDcgKzQyLDYgQEAKIAogc3RydWN0IHNkMjQwNWFsIHsKIAlzdHJ1Y3Qg
ZGV2aWNlCQkqZGV2OwotCXN0cnVjdCBydGNfZGV2aWNlCSpydGM7CiAJc3RydWN0IHJlZ21hcAkJ
KnJlZ21hcDsKIH07CiAKQEAgLTE2Nyw2ICsxNjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJl
Z21hcF9jb25maWcgc2QyNDA1YWxfcmVnbWFwX2NvbmYgPSB7CiBzdGF0aWMgaW50IHNkMjQwNWFs
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RydWN0IHNkMjQwNWFsICpz
ZDI0MDVhbDsKKwlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjOwogCWludCByZXQ7CiAKIAlpZiAoIWky
Y19jaGVja19mdW5jdGlvbmFsaXR5KGNsaWVudC0+YWRhcHRlciwgSTJDX0ZVTkNfSTJDKSkKQEAg
LTE4MiwxNyArMTgyLDE3IEBAIHN0YXRpYyBpbnQgc2QyNDA1YWxfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkKIAlpZiAoSVNfRVJSKHNkMjQwNWFsLT5yZWdtYXApKQogCQlyZXR1cm4g
UFRSX0VSUihzZDI0MDVhbC0+cmVnbWFwKTsKIAotCXNkMjQwNWFsLT5ydGMgPSBkZXZtX3J0Y19h
bGxvY2F0ZV9kZXZpY2UoJmNsaWVudC0+ZGV2KTsKLQlpZiAoSVNfRVJSKHNkMjQwNWFsLT5ydGMp
KQotCQlyZXR1cm4gUFRSX0VSUihzZDI0MDVhbC0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxv
Y2F0ZV9kZXZpY2UoJmNsaWVudC0+ZGV2KTsKKwlpZiAoSVNfRVJSKHJ0YykpCisJCXJldHVybiBQ
VFJfRVJSKHJ0Yyk7CiAKLQlzZDI0MDVhbC0+cnRjLT5vcHMgPSAmc2QyNDA1YWxfcnRjX29wczsK
LQlzZDI0MDVhbC0+cnRjLT5yYW5nZV9taW4gPSBSVENfVElNRVNUQU1QX0JFR0lOXzIwMDA7Ci0J
c2QyNDA1YWwtPnJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsKKwlydGMt
Pm9wcyA9ICZzZDI0MDVhbF9ydGNfb3BzOworCXJ0Yy0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFN
UF9CRUdJTl8yMDAwOworCXJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsK
IAogCWRldl9zZXRfZHJ2ZGF0YSgmY2xpZW50LT5kZXYsIHNkMjQwNWFsKTsKIAotCXJldCA9IGRl
dm1fcnRjX3JlZ2lzdGVyX2RldmljZShzZDI0MDVhbC0+cnRjKTsKKwlyZXQgPSBkZXZtX3J0Y19y
ZWdpc3Rlcl9kZXZpY2UocnRjKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAoKLS0g
CjIuNDguMS43MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
