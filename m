Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEA8C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Zf98UAJvbcHHPPC3qZk/UA/V0g4IhETadwunu1tLhw=; b=yLfmNzk38X0+RU
	/narGMWNUw+GJYlk3F1owINCEX3PxBWvqK0iPGw+dK0wfWn2tAqOgq25TOEnDIaCtXYKugkw8Dsyr
	fMDdVgyvozyuemG3gZZ2oMlJDrbb6f1fJLbWCNgnINSpea/K5iGw9/GAzrDyd+9Pw/XU4OeWdfV6m
	8LcHx31gpnYLZofFkljcY8r59unuUFE5usiTuqoohc+KXMrgtsmFEHSA7+8VXhWDuW0zKBnAQ8iqb
	gVuXqI+uJfggi4K3yDiJU1kB7H+ZV4B5GoAoUYG4ie0fjO8EH1bvtdgetXDtE5I1paRBmagSabDm8
	7jj19TVfpBTEFeKAJuPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXAJ-00000005scY-0s6N;
	Tue, 04 Mar 2025 18:38:51 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViA-00000005YDP-077z
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:43 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso9281966a12.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107940; x=1741712740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=n6wbLd0c8dLsKU2yPCDre0PPGnFUIbj5o/OMuFvBxxQIbQpP5dAlqCKmUoJFatmEul
         /7L1zj7Kyn9bs+YtgN9usgaVfaBlAua495QOE8ZZjWe999FOfJKC4Blma65r7cEbGUGV
         7YW36FUt3S5cK2wZrMtilVDmmlT+XdTBlEdGBxmv7eOuEvqfiAeGhnol7nGO5QQ5vs96
         6ZfaJZJrXn9ZAL0VsOHLoQjCdGRPOzqErqI8WWrcczagkdXciCxB+qR5hwKcqAv8Qr+s
         DLNsmACwmdlfNC/6y6CrAaD65eSvInAabFJBxjD4ZYE1Ot+eQSYMaN7pzOUJAYysBkjK
         fXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107940; x=1741712740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsaGEw76ofDXd3Q1RIPfSv8CJUvwC0w+ueATTj/NegM=;
        b=oVwP1a0435cFJyEjhUKCEiyrqgVGlUQJwS39Lh1Tl/pbY8IhGAduhvLMHiPSwOUoUj
         T1QBcUMpPSZeVHInkz3m74BIPZZAjyNpiIzz1NCOy1SUXoQERj2ec0GWa0KcSMfvylaq
         o0UpyhzT/innv47EofbY8bgCcSZSlzYGTK5r2fiTNZMkzeGOrsjLBrqLd068k4upXTmQ
         NNiCFYauojj7CklLozupJFi5tIj1CMIIKet7a7VCIRUhCx4RNrhAyPhufMGNnYLhpGhs
         jFDUk+Go2H1Hz8TyFTXfqFtk37uTbTcsGABsYowF0leksUcFdi68vBDBAJSZWuesVWR2
         bR1A==
X-Forwarded-Encrypted: i=1; AJvYcCV8elsSa1wg0ea/DUML5xE8ZXLr15I3U3TWiVefY+U8i/j0+bvhbUOgVltvddhVT4P3GHbtlPQ8WOVFVwui@lists.infradead.org
X-Gm-Message-State: AOJu0YwAEBYhP9KjQQJPSQ1LVRpf54pBoNlxdJgmiYoNa30nyjZYiZ+s
	YMQMTm7ps2mdNYnD0e/yAmHGq0oGiohywCpOqdwPLpMs1mo/At8YHpeYMXNmvWk=
X-Gm-Gg: ASbGncsJCb3aJWloek4Gar3Q51VpnapZnoGKFndIK8MEPVMXl35NM2wWfRYCGYkFzHN
	z05qz+fqWimRGty9fcUDL7KiafvG6RnXMebrXSbZ5gMgU9cLOn8BD2TYh5aGIEthvhOFiro/92B
	iYDS7bIIDH1OSN8foimg+Sq3pCkkJbomBV2r9G5ntLy+8ExpYeNqbW1IS3xDfvAKeiST9OuV45B
	peD4xDOVCcsAFPXm3dWkOY51ZSARGspZSntbFL0E6x/6TeNZks4seoAogKg2chAMGInbRJ46GZr
	jldqb+xnTaBUvh29icHWz0MiKbEJoTB+vjep043Na4IEFXD3bkyLSa4XP38YilRl8yjSo6dTyLQ
	dUrfzJm8qkMoDub+8POo9grevfuYr
X-Google-Smtp-Source: AGHT+IFl6TTi8U8Sph/F6W/xnjfer4H7R9+DXzK4OCCEVcy7pkMVR63rOrht0Su/bmOb+eKFGQTbhQ==
X-Received: by 2002:a17:907:1c8b:b0:abf:38a:6498 with SMTP id a640c23a62f3a-ac20db16fb1mr2300366b.55.1741107940186;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:39 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:41 +0000
Subject: [PATCH v2 13/16] rtc: sd2405al: drop needless struct sd2405al::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-13-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090542_060100_9D09383B 
X-CRM114-Status: GOOD (  13.61  )
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
eSBhIGZldyBieXRlcy4KClRlc3RlZC1ieTogVMOzdGggSsOhbm9zIDxnb21iYTAwN0BnbWFpbC5j
b20+ClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXNkMjQwNWFsLmMgfCAxNiArKysrKysrKy0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1zZDI0MDVhbC5jIGIvZHJpdmVycy9ydGMvcnRjLXNkMjQw
NWFsLmMKaW5kZXggZDI1NjhjM2UzODc2NTlkZmVhNTk4Y2QyZWY2YmRkYzVjMDc2Y2JiOS4uMDBj
MzAzM2U4MDc5YjVmMTBhYWFiY2M3YTFkM2YxOTc3MTI2M2EwMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ydGMvcnRjLXNkMjQwNWFsLmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLXNkMjQwNWFsLmMKQEAg
LTQyLDcgKzQyLDYgQEAKIAogc3RydWN0IHNkMjQwNWFsIHsKIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2
OwotCXN0cnVjdCBydGNfZGV2aWNlCSpydGM7CiAJc3RydWN0IHJlZ21hcAkJKnJlZ21hcDsKIH07
CiAKQEAgLTE2Nyw2ICsxNjYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcg
c2QyNDA1YWxfcmVnbWFwX2NvbmYgPSB7CiBzdGF0aWMgaW50IHNkMjQwNWFsX3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJc3RydWN0IHNkMjQwNWFsICpzZDI0MDVhbDsKKwlz
dHJ1Y3QgcnRjX2RldmljZSAqcnRjOwogCWludCByZXQ7CiAKIAlpZiAoIWkyY19jaGVja19mdW5j
dGlvbmFsaXR5KGNsaWVudC0+YWRhcHRlciwgSTJDX0ZVTkNfSTJDKSkKQEAgLTE4MiwxNyArMTgy
LDE3IEBAIHN0YXRpYyBpbnQgc2QyNDA1YWxfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCkKIAlpZiAoSVNfRVJSKHNkMjQwNWFsLT5yZWdtYXApKQogCQlyZXR1cm4gUFRSX0VSUihzZDI0
MDVhbC0+cmVnbWFwKTsKIAotCXNkMjQwNWFsLT5ydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZp
Y2UoJmNsaWVudC0+ZGV2KTsKLQlpZiAoSVNfRVJSKHNkMjQwNWFsLT5ydGMpKQotCQlyZXR1cm4g
UFRSX0VSUihzZDI0MDVhbC0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2Uo
JmNsaWVudC0+ZGV2KTsKKwlpZiAoSVNfRVJSKHJ0YykpCisJCXJldHVybiBQVFJfRVJSKHJ0Yyk7
CiAKLQlzZDI0MDVhbC0+cnRjLT5vcHMgPSAmc2QyNDA1YWxfcnRjX29wczsKLQlzZDI0MDVhbC0+
cnRjLT5yYW5nZV9taW4gPSBSVENfVElNRVNUQU1QX0JFR0lOXzIwMDA7Ci0Jc2QyNDA1YWwtPnJ0
Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsKKwlydGMtPm9wcyA9ICZzZDI0
MDVhbF9ydGNfb3BzOworCXJ0Yy0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFNUF9CRUdJTl8yMDAw
OworCXJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsKIAogCWRldl9zZXRf
ZHJ2ZGF0YSgmY2xpZW50LT5kZXYsIHNkMjQwNWFsKTsKIAotCXJldCA9IGRldm1fcnRjX3JlZ2lz
dGVyX2RldmljZShzZDI0MDVhbC0+cnRjKTsKKwlyZXQgPSBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZp
Y2UocnRjKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIAoKLS0gCjIuNDguMS43MTEu
ZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
