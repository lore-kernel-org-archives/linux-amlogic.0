Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0E3C282D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyVr5izLhXb/sSx/VvXcr6KZhXbVONdp3aaTrSadVp0=; b=OOTiPcsjRqJh85
	RB5kLO4YTCjsuK3v+n5V4S3Dcnoki7JkWOBwW3b4OHPltoA/ElsFELtupBTwipXBg9cJ+Tm1bfftV
	sJj/Ipzz1bc95ULFtZf97YIfHEirMdibrxIRzXN0TK+COYepF1OHF22mpPVxVkj/34t4l7CZgl2YX
	AXBiWIWkY49fzk6EMKVsBE4LkUBvmX8I83XpmPrkBd7QlnWcosBGj6H9O9+FpBJzXHf0i8abxROUs
	w9L6GAmA1rq6teneSBuFbA0tXl5exqb8sidQZNGKqzfOk5q5LoGlI0iU19anMx9/4gfUk4nu4cgs5
	28WWCxkBebbYIydVTimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX7D-00000005s8D-2As1;
	Tue, 04 Mar 2025 18:35:39 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi7-00000005YBv-1Pgz
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:40 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so28260345e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=l0sLJdaNaUCZBYSodhVO0/bzhRM6hrtSECo6RonPz+NKsMR3D8JAunIWrid5sle7Eu
         vsscEsMjIYtr/R1QBFNDkI+iNjaRWCPYbqkmoytXvM8vm/h33uKoSI8uF7AHzXXIllmV
         9wSclqqMvq2258JIUzYcJNcifiaC+y7+f3gPzqtr4J4b8maGTTHM3MO5q4fhG+RApX7h
         IIuvrbZwFIjGhlY+jA0JC+E/RaK7F/cA4KtyMth+p8qpwsyRuRsQreuhhkLOltFwYG5u
         DnminasEHfIC+9ENen1X2yW1NPh3INPlEhLc4A8Kwk1rbwgwGzErYGKZfI/DYiIDGovU
         mW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=IbDI0usjUudWUu5yqvDqns/HMR6/FN6KXkrHU5D5tMnydDU26Ym/NsUxUjkjt+dINJ
         EYU6VexDNV7Pix5KC4RY1w6A9lQKfSFY7BOxwtks958AzUR7xfO40GYA7nv1e9mVU7K/
         vXl87eKS+IE+QjHgBLBbWQy23zrG7M4Jj7QKg4ENJFR8XCeGc+yrq4DP2lDKjiC2rv4o
         IR8C+zjvL9TnoHtiuD/KvrO+Wybys1kTv1s4NSz2k2Fumcu4V+wONXzf2YjPiUuGyJPy
         zhPrfsiF6vvAq0sOqbNsmDyObtohHVarNk9oF7MUlDfM1jNj7lrRTeevsdtnSx3MtDiD
         wqjw==
X-Forwarded-Encrypted: i=1; AJvYcCXqcU8eiZcSecaqXRJ/q24j/ZYXqvlLmzkEJ7xqNCW5MeT5qgWxJIe+E3A10irwA1k32djh9R2aK38k1nR8@lists.infradead.org
X-Gm-Message-State: AOJu0YzfUpKN4dN2FjqcJSIAS3gaXaGP4lG8iGtaOygNwTz7RMJvhUpO
	BKVVtJ92Nsvt6tYLJAp9hWcnGWQMDAAi2DpgoXmb3l8SyjJql6RwLaS521G57nU=
X-Gm-Gg: ASbGncuOULpIanH3rss3R+mDahgI81ailFYf5z4iaNETERcscsH3IyOC2GyQBu+GAcA
	fiNhAxScboPcOON1JXZk+BjjtGu3owJFZfDlTEU1LK7o4BETNIC49fwgyuKuiQdGeuYIkrBfBwe
	Prd/Y1CouNI1nqnvYgrg13pq3OZ7UFFm3IPH+yO9lIw+pinJPcAxGQd+Qa6E4hHjUtWnkfLGugt
	Z+Ido8HCpXdOECahQmNUg7rMU3Db73A22o6IpHGYyPq2Ll1AzS5/o7m1JAdJcWfSX+AhTP0Kczh
	LIdfyoKzSRvMBx0dXCG/Y3lm4Qx234DW70DDq39xgJhwTdUoljY6M/s5NptqVWs1cXESctw2eTG
	1Fbzyea+6EcDPKgcc5CAi/Jqz+hmZ
X-Google-Smtp-Source: AGHT+IHZdsv7jYfFsjyY3TIB4euke/dHgzMkeAeSorD4HntlJXvk76kkhxE/lHiggYkJdsJqp3nEfg==
X-Received: by 2002:a05:6000:10c1:b0:38d:df29:e14f with SMTP id ffacd0b85a97d-390eca069a5mr17165829f8f.43.1741107937298;
        Tue, 04 Mar 2025 09:05:37 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:37 +0000
Subject: [PATCH v2 09/16] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-9-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090539_396635_6C50E331 
X-CRM114-Status: GOOD (  13.52  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLW1lc29uLXZydGMuYyB8IDEyICsr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtbWVzb24tdnJ0Yy5jIGIvZHJpdmVycy9y
dGMvcnRjLW1lc29uLXZydGMuYwppbmRleCA1ODQ5NzI5ZjdkMDFkN2VjNzg2OGZmM2JiZGM1ZWQ1
OTlhYWE4MjM4Li43ZDM4MjU4Y2JlMzc2ZTVhMWIyYWY2MjUwY2I2ZDA0YzMxMzE3NWZiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtbWVzb24tdnJ0Yy5jCisrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1tZXNvbi12cnRjLmMKQEAgLTEzLDcgKzEzLDYgQEAKIAogc3RydWN0IG1lc29uX3ZydGNfZGF0
YSB7CiAJdm9pZCBfX2lvbWVtICppb19hbGFybTsKLQlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjOwog
CXVuc2lnbmVkIGxvbmcgYWxhcm1fdGltZTsKIAlib29sIGVuYWJsZWQ7CiB9OwpAQCAtNjUsNiAr
NjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgbWVzb25fdnJ0Y19vcHMg
PSB7CiBzdGF0aWMgaW50IG1lc29uX3ZydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIHsKIAlzdHJ1Y3QgbWVzb25fdnJ0Y19kYXRhICp2cnRjOworCXN0cnVjdCBydGNfZGV2
aWNlICpydGM7CiAKIAl2cnRjID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqdnJ0
YyksIEdGUF9LRVJORUwpOwogCWlmICghdnJ0YykKQEAgLTc4LDEyICs3OCwxMiBAQCBzdGF0aWMg
aW50IG1lc29uX3ZydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHZydGMpOwogCi0JdnJ0Yy0+cnRjID0gZGV2bV9ydGNf
YWxsb2NhdGVfZGV2aWNlKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIodnJ0Yy0+cnRjKSkKLQkJ
cmV0dXJuIFBUUl9FUlIodnJ0Yy0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZp
Y2UoJnBkZXYtPmRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRSX0VSUihydGMp
OwogCi0JdnJ0Yy0+cnRjLT5vcHMgPSAmbWVzb25fdnJ0Y19vcHM7Ci0JcmV0dXJuIGRldm1fcnRj
X3JlZ2lzdGVyX2RldmljZSh2cnRjLT5ydGMpOworCXJ0Yy0+b3BzID0gJm1lc29uX3ZydGNfb3Bz
OworCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIH0KIAogc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBtZXNvbl92cnRjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoK
LS0gCjIuNDguMS43MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
