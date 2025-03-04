Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9434C282D6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPngdK5DYbhGAiT7MxWwZIKSvO4D3M6mDFleryhZjHQ=; b=hi2KF30ZF0NSgp
	4ZRIpoEgQqYczuXJE36xK+farQM3+NLwmi0OT3ygEMS7ev6cW75bnTHjBog3D+FwTfM/+FA7SiZvk
	GXMTh6vLogh98dsW5LqbUJDD5mq80m5DeBfDMZ8qY6TEw6y/lHl0Fe84RxPv4NczSfuZAiXig49h2
	GPACCjTwe5v8cMQ1sjOPFbEvflasxwOF1N/rvJrve+ha//KGrTcrC6NwDS5SBQVVMmuniXBHRTN8v
	2X7csmIeOU7v/FIe/Qk0HpT3EoEERyWrJNw56bxO6aZPax7iIYfraDASg5d8xrN4ta+O3WLkPu4TE
	Y6hYIDymkeerAXqKK08g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX11-00000005qmN-2VOH;
	Tue, 04 Mar 2025 18:29:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi2-00000005Y8c-1Py1
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso6933931f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107932; x=1741712732; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=hC8DY/E0iJrbQ6B5sTX1MfLAaFia3ogm1eHufZbXq18YcJ9qsGdMLGPvP4CEqmkqXY
         rKme/EqkXuJhx7Cv4yx/2/Cn7a+JiJIPULm+7LpRXf5eipc2lmMvE+uTdVNiNj80RsSJ
         I2z44wv2KvYsDfSB3MPdpIySbPi90bmTkLlQnCMUCrnnmh0KHVbqB/l+KAmcsf8ZsF04
         IDWm4umDTBORk6jDIA44SsSdFIoY10YFpcpXiOnJMXAesJ3yJsyd35kcX3tfPjTisyt4
         zP4YCqJy042ThfWYAoMrRkZK/Co4vXGfKjPgfN3QQKuS6aruBTCq7vCn/Szjz/Xt0E0x
         EKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107932; x=1741712732;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1Zs+DHu4keoQ7nH0HfotkX9qiVtwoVoQvIhvtnI4DA=;
        b=nuPBtUOeVVY214F4baxfRxhtWzpFPcBxqJbXzonSHfklxlPXNv5MnYyCbGjSCuYF9C
         jTiEeyxopmknGhnEA8ay+7Gi6fQuRenphlvvYk41RQgfOFvhu5aBLrxWGUmfwseBMefJ
         +FJCxrTtkeFA+2wRq3qW//rnsK2bp8FGbUWAiqWhzs0GIdhpZdqYwUmtAOf+48uq10aK
         5N3kLRGU3H0Up53xjBx1qY34j7voujJKFjvG4k8A3IXVIz7QUg1C0Xqv0iu/pY94WM6k
         vRbpHZtAjlCdCY1Xsu+1f1gLa8a2SkU7q5qDFrGLdknSMz6jnpseCt7/ERcuH+EGgRcB
         3o0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9KEetVL6G3uX1dBbotcLHZAQU5sOAnemIHbpDmjM5cjV8TGZrBo0YI/ePnoeyf9djDA74OTpi2xiBQmWq@lists.infradead.org
X-Gm-Message-State: AOJu0YydJkJtdWUMvhpPd5akLUtYTs7e1cSXcaUKX1pao+R9ToAw0S2Z
	BDhJXCcnUmfA6aXrhMaGMklC2LqUO5XfvQq521bUDQSstmfndhJGbABEdVL4AU8=
X-Gm-Gg: ASbGncvht2AeCIjtvpxfm5U0ENclYix6lgbfU1RX7LUUuHvCkrfxhaawrLfAKKZPPpr
	zfJgZhMR7KgN8vHxvI0akszVDryzCYlL5DmBmet2G25h4wp/aZxhA9iWBjZFfWcAgE+GkAuWCg+
	b1hdJP8mKsePzSy7NfFiMsJjeu8UWf0HunmkPA2HYgkzf0/O9vU2Z6Ssdo49t25dvBbcOH6YnPY
	Do9OwuReIlGDsSRyVlkUAL7AsThSWqy5TLnxmzlZQPHHVefhoKs4ZhH6XFW0GHKxUXMB/GQJRXH
	qLGCZJ6F9oM4VjlE1vR4DJN0Zsj1ZQbYInw94mBopfEmai7/NvIi4b0qMmWJLMbmTiOhvSm8qmM
	qs4krWydhOfxNT5voEGVjv2WVzqqP
X-Google-Smtp-Source: AGHT+IHSc8pjwattEBJyeHF3OjOkT41+G9Y/Rh1pozPSubIjG3eC8i5kYIqu87xMZCHZm4ULB7j+yA==
X-Received: by 2002:a05:6000:1faf:b0:391:888:f534 with SMTP id ffacd0b85a97d-3910888f656mr7939190f8f.20.1741107931986;
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:29 +0000
Subject: [PATCH v2 01/16] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-1-d4689a71668c@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_090534_373617_B62CA225 
X-CRM114-Status: GOOD (  13.53  )
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

V2hlbiB0aGlzIGRyaXZlciB3YXMgY29udmVydGVkIHRvIHVzaW5nIHRoZSBkZXZyZXMgbWFuYWdl
ZCBpMmMgZGV2aWNlCmluIGNvbW1pdCA1OWE3ZjI0ZmNlYjMgKCJydGM6IG1heDc3Njg2OiBjb252
ZXJ0IHRvCmRldm1faTJjX25ld19kdW1teV9kZXZpY2UoKSIpLCBzdHJ1Y3QgbWF4Nzc2ODZfcnRj
X2luZm86OnJ0YyBiZWNhbWUKZXNzZW50aWFsbHkgdW51c2VkLgoKV2UgY2FuIGRyb3AgaXQgZnJv
bSB0aGUgc3RydWN0dXJlIGFuZCBqdXN0IHVzZSBhIGxvY2FsIHRlbXBvcmFyeQp2YXJpYWJsZSwg
cmVkdWNpbmcgcnVudGltZSBtZW1vcnkgY29uc3VtcHRpb24gYnkgYSBmZXcgYnl0ZXMuCgpSZXZp
ZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8u
b3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIHwgMTIgKysrKysrLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIGIvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2
LmMKaW5kZXggN2JiMDQ0ZDJhYzI1YWVhYWYyNDA0YjQ3YjdlN2JkNDg1YWUzZDM5ZS4uNmIwZDAy
YjQ0YzgwOTc0NTNmNzA0Y2JlYzlmMDI1ODBmYjg2OWNhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9y
dGMvcnRjLW1heDc3Njg2LmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMKQEAgLTg1
LDcgKzg1LDYgQEAgc3RydWN0IG1heDc3Njg2X3J0Y19kcml2ZXJfZGF0YSB7CiAKIHN0cnVjdCBt
YXg3NzY4Nl9ydGNfaW5mbyB7CiAJc3RydWN0IGRldmljZQkJKmRldjsKLQlzdHJ1Y3QgaTJjX2Ns
aWVudAkqcnRjOwogCXN0cnVjdCBydGNfZGV2aWNlCSpydGNfZGV2OwogCXN0cnVjdCBtdXRleAkJ
bG9jazsKIApAQCAtNjkxLDYgKzY5MCw3IEBAIHN0YXRpYyBpbnQgbWF4Nzc2ODZfaW5pdF9ydGNf
cmVnbWFwKHN0cnVjdCBtYXg3NzY4Nl9ydGNfaW5mbyAqaW5mbykKIHsKIAlzdHJ1Y3QgZGV2aWNl
ICpwYXJlbnQgPSBpbmZvLT5kZXYtPnBhcmVudDsKIAlzdHJ1Y3QgaTJjX2NsaWVudCAqcGFyZW50
X2kyYyA9IHRvX2kyY19jbGllbnQocGFyZW50KTsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
OwogCWludCByZXQ7CiAKIAlpZiAoaW5mby0+ZHJ2X2RhdGEtPnJ0Y19pcnFfZnJvbV9wbGF0Zm9y
bSkgewpAQCAtNzE0LDE0ICs3MTQsMTQgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0X3J0Y19y
ZWdtYXAoc3RydWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCQlnb3RvIGFkZF9ydGNfaXJx
OwogCX0KIAotCWluZm8tPnJ0YyA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoaW5mby0+ZGV2
LCBwYXJlbnRfaTJjLT5hZGFwdGVyLAotCQkJCQkgICAgICBpbmZvLT5kcnZfZGF0YS0+cnRjX2ky
Y19hZGRyKTsKLQlpZiAoSVNfRVJSKGluZm8tPnJ0YykpIHsKKwljbGllbnQgPSBkZXZtX2kyY19u
ZXdfZHVtbXlfZGV2aWNlKGluZm8tPmRldiwgcGFyZW50X2kyYy0+YWRhcHRlciwKKwkJCQkJICAg
aW5mby0+ZHJ2X2RhdGEtPnJ0Y19pMmNfYWRkcik7CisJaWYgKElTX0VSUihjbGllbnQpKSB7CiAJ
CWRldl9lcnIoaW5mby0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBkZXZpY2UgZm9yIFJU
Q1xuIik7Ci0JCXJldHVybiBQVFJfRVJSKGluZm8tPnJ0Yyk7CisJCXJldHVybiBQVFJfRVJSKGNs
aWVudCk7CiAJfQogCi0JaW5mby0+cnRjX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGlu
Zm8tPnJ0YywKKwlpbmZvLT5ydGNfcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50
LAogCQkJCQkJaW5mby0+ZHJ2X2RhdGEtPnJlZ21hcF9jb25maWcpOwogCWlmIChJU19FUlIoaW5m
by0+cnRjX3JlZ21hcCkpIHsKIAkJcmV0ID0gUFRSX0VSUihpbmZvLT5ydGNfcmVnbWFwKTsKCi0t
IAoyLjQ4LjEuNzExLmcyZmVhYmFiMjVhLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
