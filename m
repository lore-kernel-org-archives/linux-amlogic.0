Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CAD7C282D0
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2JkIuJg8JSjJaUPUO3pXwDkCdc95M1wvfqmIQLTszA=; b=Trifp+klSp9j0C
	6OXRe0HnlTFKgqowsjbkteMKu3CEyWYHvQQZUHCRW9OJLiTapjWRdAF3Z4Z2LlpAdFMOx3mwytmzi
	7xY7aiadGSY7A1X8Q87ud+rQbwHsfrGwW5r9XAeAMjabHtZrmRBdc6hmokzvbrRF2XANB1t+29IX9
	wbUxIJ8nRUVSHJNecjvFxJ9nA7oU8AkvCxEv2KtBMWhnbcqCk8aYOfF5H5EhJ3A/igd8R1z/kksPM
	BwLUTRd2QQJ1jgwuVj3rGGq+CeOKTCoJQJPT969D/zHkfrzQuPKYQCQlxYz6h6hQsqGlxITyWq0yC
	Manz3EBbvgQb48yqSRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYQd-000000068Jg-0HFL;
	Tue, 04 Mar 2025 19:59:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViL-00000005YI2-1OcI
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=; b=arwdDrJ5nxUaqiXcnprFNMi6rt
	NyiiJeRBQOQwZ19lYuYOvgMngKdIa2acf8681Y/r0CyLZQubERvC8mOFr/9XaN9TOTWM2IEtJlj6v
	SsHlz9ELkiLES5kCsbbe77RO2s8LacXeaGG0H+uxoMAV+ny5EySQSCE9ufGpS3RYohhpdbt5BQU7b
	w8V9r/xCHs0/nwtVg6c8bUu27Dpve/jJeOIWMBhmjWrEn7Rpzhwg9i63EEwkfo6r/2HQGe4O6r+/f
	4D6QBUrc6xg/fJg0ytuC0yscacn2GQEfUNCwX3Cor7m/+raFecyTjn4fHRZih41025ZxmpJNMLzAS
	8LitMknA==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi9-00000002D0X-0TrQ
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:52 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e538388dd1so3544507a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107938; x=1741712738; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=j3Um0OTITg7odN79pu3s5Us+3s8CK0yWy6ssNGqA9JvDSIfcW+qG5HfzEAf/PYTAzm
         J0rhEInhemNDMXWaoRFGoBKjXEwgZ9LjNe5eZndPQvUsRQWF56SBptOKJ67iUCLiDjuU
         DaTnvdGM2oIxyZzkOqO/Ld8d5j8AK3N2UV6lcO0XaD871Ets3iXFyzFYADSYUNBReOOX
         H68KDwO25ZCfy24fLvOOcfBgMM7/KixNVpfGp646dDyQ8cmGhh7y/uY0Nd8h1S3i/fXS
         CRnJER4ybjfBzwcZwsGpKOMztwWDco103srIVBPfGDALtf+l8CWP/N08uo8LtpxXZ9IX
         oZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107938; x=1741712738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1dbxTlHkaw5uSKNsqDfe9Jgr4Kg+vWUXd+ullz5kUQ=;
        b=HjsVV9yYGKoYaDvcW/FAHNyuEC96LEsVWVfze9d3jpesgegc4XiH+dfKMMA6lE9ix7
         ANuZPBrDmnmcgAMR/0URnU+TeO15qKY+EkPcCnEK9oNNNgEGQe4nWoDga+IbkHxpfeqd
         SR4tAP2ooJW9bzenLstZm7OXnGjReTcCiZD0uBOmlvCKs76Ry3RQkgxi1WA00ZllKfOc
         W/YUZi/FNSeihGb+VzMVEEIBPhsbQJTjLGiobdroerRfAz21kfihQOwtrSih2kzs0Rh1
         fMpflZQlfNijFORlWKtI+TJIw9xbW8UKwjdmV42Dfc0tmGxj379Bn5GVjJjN5z/FSTfW
         RMeA==
X-Forwarded-Encrypted: i=1; AJvYcCWc26f6LSC2k4r9CNRss8GFDIZRtGX1AM9nFCmERfF2cBvwUnJFi0vVBZ84o3r6eWSUioZtT6nO68I7Ov8u@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/UvwdxZXbAO5OZGZtvQ6kEzIli1mAp+A7j4CuJCNL8wYplZxr
	l840dvrG2U7D95NSjoqVzUcRI4Cciqm767oOj37/mSkL5zBNUoIaQSLe59uaB+A=
X-Gm-Gg: ASbGncvlaQ2RoJgS9qPspTtTb1D9hE9m76JmoiYBKZ8d1uOCtou9YUs27ZDrkmRZ0Kw
	quxc3YIci0DFdwf6hFn4IyduV15z7ppJyEV/wekR3AAAFydG3jGD1PqtsB0tLlwAUCD+9E8RfsG
	f9rsHpCAgRmJZB/c2/B7wtFAiorjNnUzatdGladpagoxNqa9bk1RBoBqxbXuK+EheF9iKfxDOfZ
	voGTmI22veMJNK1aHlPdwsY65YI64cbFTIJOmYccoBA2wIWe3ce3EA9JhOEcePIRMj0hnivDzp/
	8WcsuCa0SZqEBgV5pT5wZEbbhd5EEXbi1JvV0nZuLW3UUaCfedhZwhy9VvIObhhgAfPggYu5DSx
	S0J1+u0utBETvYJWmDwSbdH4IPkhD
X-Google-Smtp-Source: AGHT+IHF998NpSXE/Qa2EdiSn4vtx17I0lnFV/wyKnxAJsCHaDM1j6HSEMvcUwtHdnvoXlFd/CgYog==
X-Received: by 2002:a05:6402:d0b:b0:5e4:c532:d693 with SMTP id 4fb4d7f45d1cf-5e4d6b8535fmr16782448a12.31.1741107937989;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:38 +0000
Subject: [PATCH v2 10/16] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-10-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
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
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170542_889685_31C6BF9E 
X-CRM114-Status: GOOD (  12.00  )
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
eSBhIGZldyBieXRlcy4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlr
QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXBsMDMwLmMgfCAxNCArKysrKysrLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtcGwwMzAuYyBiL2RyaXZlcnMvcnRjL3J0Yy1wbDAz
MC5jCmluZGV4IDM5MDM4YzA3NTRlZTU1YTk1MmU1OTg2YWZlNzExY2ZmZmYzNTg0MGIuLmU3Yzgx
NzQwMDYxYmI2MGM0ZDg0NDdkNjUyMjgxOTY4NWJlYTkxODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cnRjL3J0Yy1wbDAzMC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1wbDAzMC5jCkBAIC0yMSw3ICsy
MSw2IEBACiAjZGVmaW5lIFJUQ19DUl9NSUUJKDEgPDwgMCkKIAogc3RydWN0IHBsMDMwX3J0YyB7
Ci0Jc3RydWN0IHJ0Y19kZXZpY2UJKnJ0YzsKIAl2b2lkIF9faW9tZW0JCSpiYXNlOwogfTsKIApA
QCAtODYsNiArODUsNyBAQCBzdGF0aWMgaW50IHBsMDMwX3Byb2JlKHN0cnVjdCBhbWJhX2Rldmlj
ZSAqZGV2LCBjb25zdCBzdHJ1Y3QgYW1iYV9pZCAqaWQpCiB7CiAJc3RydWN0IHBsMDMwX3J0YyAq
cnRjOwogCWludCByZXQ7CisJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0Y19kZXY7CiAKIAlyZXQgPSBh
bWJhX3JlcXVlc3RfcmVnaW9ucyhkZXYsIE5VTEwpOwogCWlmIChyZXQpCkBAIC05NywxNCArOTcs
MTQgQEAgc3RhdGljIGludCBwbDAzMF9wcm9iZShzdHJ1Y3QgYW1iYV9kZXZpY2UgKmRldiwgY29u
c3Qgc3RydWN0IGFtYmFfaWQgKmlkKQogCQlnb3RvIGVycl9ydGM7CiAJfQogCi0JcnRjLT5ydGMg
PSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJmRldi0+ZGV2KTsKLQlpZiAoSVNfRVJSKHJ0Yy0+
cnRjKSkgewotCQlyZXQgPSBQVFJfRVJSKHJ0Yy0+cnRjKTsKKwlydGNfZGV2ID0gZGV2bV9ydGNf
YWxsb2NhdGVfZGV2aWNlKCZkZXYtPmRldik7CisJaWYgKElTX0VSUihydGNfZGV2KSkgeworCQly
ZXQgPSBQVFJfRVJSKHJ0Y19kZXYpOwogCQlnb3RvIGVycl9ydGM7CiAJfQogCi0JcnRjLT5ydGMt
Pm9wcyA9ICZwbDAzMF9vcHM7Ci0JcnRjLT5ydGMtPnJhbmdlX21heCA9IFUzMl9NQVg7CisJcnRj
X2Rldi0+b3BzID0gJnBsMDMwX29wczsKKwlydGNfZGV2LT5yYW5nZV9tYXggPSBVMzJfTUFYOwog
CXJ0Yy0+YmFzZSA9IGlvcmVtYXAoZGV2LT5yZXMuc3RhcnQsIHJlc291cmNlX3NpemUoJmRldi0+
cmVzKSk7CiAJaWYgKCFydGMtPmJhc2UpIHsKIAkJcmV0ID0gLUVOT01FTTsKQEAgLTEyMSw3ICsx
MjEsNyBAQCBzdGF0aWMgaW50IHBsMDMwX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqZGV2LCBj
b25zdCBzdHJ1Y3QgYW1iYV9pZCAqaWQpCiAJaWYgKHJldCkKIAkJZ290byBlcnJfaXJxOwogCi0J
cmV0ID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Yy0+cnRjKTsKKwlyZXQgPSBkZXZtX3J0
Y19yZWdpc3Rlcl9kZXZpY2UocnRjX2Rldik7CiAJaWYgKHJldCkKIAkJZ290byBlcnJfcmVnOwog
CgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
