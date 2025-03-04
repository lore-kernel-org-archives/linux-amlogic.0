Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD97C282DC
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJAON7D1Gj9k3moNB5RYkJChkCKD+29oGk+cGwhd8I4=; b=A9i5APkGZUYK8x
	ZyeDCrOa8iNYSw4JwZl2QdnWhuIHe0PQBQ08rFr2Imd/Eji29UnvKtGrEbZIb4yM4Be2jI1ih8hTS
	bagoA6ZaFNYZA3D5gBPwbm01H0RGkuy+RDy5slcQBGsztA/6qLUVWhOY/ZVHv02wYgxmnEvK+zILm
	XueisMlObPy9uYrn5N7lTd7fMhYfZdTxejmQ1MuLYVWq+gc2cQKRUuL9q22OuN9HdXm0D/wG7Nvg+
	n6WbdnCS1s+fONXgxV0KdfMLbhZH3jhCWSfiC4FayQBtUSpZL4+kznrsUwZnOKbi9/j6zduEPgcGg
	KMXwMrxzOehSirub0jhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXEv-00000005t6j-0TvO;
	Tue, 04 Mar 2025 18:43:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViE-00000005YGG-0Qzb
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=; b=bQQszX39yxgp3p66hYi440F0zx
	cZzrOlsldi3Q0JskZa0xOJo4o5uxiZoKleaoJPOicRAxnqotXibsK/0kOZQUWZseLqZ2lL3lztkkr
	Mfh++TpNeFLGMcR6TIQtmfEmO2RIerJGyUwi2EUjgFGSYLlGbcTVQuBRDRKevaM/DvUsC9NXmi8cU
	P0oTnXON/WSRHvL7Cca7Cc9vYaxZDYTg8aKIT9l3zIgi7MskaVc8Bh1LkzN1H8iDXQlqtSY9sfs+4
	rcnO6TYy7SeU+jI2NA5LZOEHU9ahr4EmsK4hNIdIo7IcaWZMb5Y7UwZVcpkMUImuUh8abvKcZqClH
	GlXtvQyQ==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi4-00000002CxM-2d1E
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e0813bd105so9364091a12.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=kuAd1/dKo/4AHvwOMLmrfBaSb4+a05OJVDllMApD/dEdL+qY5LNLHXnRf4FOjXnVUE
         cZhUm/IDYhzVIioNL66Qv5rl3GVA3qpzDD3cSyXrnsIuIITtv5hOO16wjdCyLUQJSUrV
         uWMDrONpTjN83pe5ylwRKKpHMYVF0FKCMwGVGdpAbWaXCrbfR9Kmc7mFIxN0ZImLSr07
         HR6k27foVimjCSvhrSPO3+L3+9kbhQI3sQZ+dMtRpRTt7izhp4Qpvly/6mGcyyUh7DFK
         2/fX1GfmWJawjSu5KB6BsCzCCtwjDyl91NfXbA+A8ZTVOYpWa3ZDJxmxnazveCiCvghb
         rj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnUvUu9cMY/Mxw4Q1sllPthcln3NtgGY7cjKJANyPvk=;
        b=fXVu3/jhXUN7i+sh0dgozsE2WUOlvLtPXRS/PWd8bd0g2iDJwHbptnggx/lvFChbwi
         43aRrijDUyA5TUz4s6LB8BtekWvXwbWAV0+DIH8KPRj744g98o41aklzrG3kxq53a5VP
         k5MWqP9NJzd/EWXdLXEHJttjvVU3FbIeoU93xrwx4iMLBN+bX+iYB/66+XHScExxJMJA
         nxm7XGirmrEmO0fKL3rkFUOsJc2u6VWgRTRuAhwi4as4atK3LHlEST5c5JsrMwFB5HZ9
         txIeZVDVDUeuiI4Ji4LEkxbFHLDcabkh0VNdNadcNEAVjl3w4cakx5kSxEdKkyxV6YxD
         HeWw==
X-Forwarded-Encrypted: i=1; AJvYcCVfT1MQMVa4/CB9+Z/15XsaBmiPoX7LHnpUid8m9dHwCGrbOes8hUFSIA6d5Uiu8+JL5XdMPtsBy9U76+zJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyofaT1ZokARGon9NdtpaZn2omRsNhBwsVnZdX7F0FQ1NQNO5rJ
	Pe3BpzVAT0dX3X4wLuZiLnuYHVnBDzIX+QDuEf5gYbnXr8BAOJor3WYX/eQLJMM=
X-Gm-Gg: ASbGncs17JK1inPg6cjmLOQRX5vSpoJ6NWL3/QCnHiG1jwVIIL0inhoE9+IyQLM7Yyi
	5mMk9XBxsgCrKOjwtjx+g3j/Jf1EqI9gq1wbqZtJYmiStggp/INjkoNYSNpOOHFRMWkdaYYl/Tj
	BJNxX9UaHZiC6/ISs9qP/Bzltr9XTjVf+B5GeOLOlN8U5PLpmFmOIUSp8rYPm0uhyZO2AA1bQAI
	+BYAumXCm922B0O+EFxLnpxg8sYqFWIUbXUS/GH7A2YUFP+xb2VFNrpCSVpd1e7orP5bpgCgq8t
	giSEqpTXupUyUFwayxQApF19RdipNzJxa3d3s7hvdWdNw+kIozHGnC1N542BTietyFs9kjf0fdL
	nXxg8iFq75lVgji31oQ3tPafcXus7
X-Google-Smtp-Source: AGHT+IH7IWkH6sGgCqXOqo1X+qUMKDFtMNOejwKoQaGxlKvxwXw1Icl3WBZaF1ebexseFdyLVEv5Qg==
X-Received: by 2002:a05:6402:847:b0:5e4:cd5c:50f6 with SMTP id 4fb4d7f45d1cf-5e4d6afaf1dmr21403911a12.18.1741107933866;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:32 +0000
Subject: [PATCH v2 04/16] rtc: ds2404: drop needless struct ds2404::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-4-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170536_939735_A3E7778E 
X-CRM114-Status: GOOD (  12.03  )
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
