Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07476C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQ0JGMSfI+1KFmM257fBJRG01zuKrEyTSxARsLB+XtI=; b=b8FUozpqBQs4nU
	I3QXyFct2/g0xt/k6pfTqGz1MtacTEbkZtuO7gM/6bChFXMfKuDVkK3Jz69sst8CsUVlI7llydTXd
	SkeyFItY+aiiQbfb/HPugY1HDRY3IRhbeeaRRQHWyizLFGG8BmJ2su5EvrNKRQg1W43PJtA+cY3x+
	7Bya1JZgxqbqGsqyxY35h/d3o78sOxcc/+CiucOWUumBMMDlhKE2yy6B8Cr+HODDE0gA/lv+EOFSC
	3Ynb+YtMDqjYkxuZjKx3iS553y/8UVbkx1rxSTBdZnuk3jNn5fdjQMbKow2CuOzfaSYPo73EsIDPh
	QHT2PJD1NrtUsxjD7qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1H1-0000000BFMY-1DfL;
	Fri, 28 Feb 2025 14:23:31 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11V-0000000BB8h-0oxM
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e5050d19e9so1068057a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=rSrf8/d8uc8mn1pQwKYXTj5/VzZDMToUwpAawpOtroUC5mgEaTidwjRN1vvSxF1Z9B
         /31zNJIB0jeRfO6MKmXWapI9P7YQPo2juPOQ4hx/mk4pFbFNuZsJ7cv8hYUGlr55krto
         85Tgc1zu4rSaEcwmR43brfrbTgqL21/taFaZjZZr0EyqfsvzhwjKLSKVWP+L+LZO/LFB
         /UcVXuKxiZ/rAwIi335Rk1n85DMjqlFczwbMCgtGUJjWtI7SZ3hFWjyLYBC9rl6NDIpq
         OkJ26yk6QrjBbbp/GbU82SQKT4RbRc3Fs8A1RnQVf/qJ3rub4eO3wTRIFvVSRVlUuRKu
         ChWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0FEi4ElpfP7bsjHYl+IPy7QOEVjafD0mk0qg+EAmzU=;
        b=g8WoCOBvtqZUu/aV3X+SGWB1hHuUDH94okYMHk0VQ8AIbKIAGLblx5x7u9tcBgIiLc
         RIol6kojwymLWkT5Cuo4eI4ONk0956/6OYXZdDSaI2O/gTPs2M+cs3HdE2nE5wCQta/p
         3IaO8ZS9NvugL69V0dX7lW63TcSgd98dQYyBHlymsJpevLHo8rSpOZywzXd1XL1BZcyn
         VdSzLrsrunQI1dcNzDU8Q6gsiLMgk5rfdTlaAmF058L4AK0mA9s6ZHvYSeWHOfDEHOFO
         JXvIip76tPJ/Co4KbC7sBJMKj26Ub8IwHFVfJ3kvM/+4jd1M04dLWxfMm/ehObBBRvU6
         9c8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUT16NTJ+5KyHHnUQt4UhSwq3h+f9X3CM6gMDd/N+8ufPUB08NmOxBvhBzeIfMkcCTSJkT7w04wN2FjX5bG@lists.infradead.org
X-Gm-Message-State: AOJu0YyNT5ot32f2CcdE4gxwhpumbdVXgk9aeMkQXw+BHug7OjZnfj3D
	xB+nGy9p/UH+Ayjl+iHPj6FqIQFj9Wb10s9APg3Ym7y2Qf7IvW6F5X6L104rBcA=
X-Gm-Gg: ASbGncsyq7g0v9bAD/XmPQqO+0OH7xdpRpBHBUNJrXAln0nsjANkil8fKm6549091KZ
	hi0qzidyeyaBgwDKKC8Wq82/C7qEvfZQ2gIJelwJBdCXhFs6YRX6B4QF3UvFS9HtrzZzztzqHVw
	l3SFRUKB/QXtHiwGMqZGsH/1vDyC0El44YdjdQDykqn7iI/o2BOcusZ8FlCgifAVf9Ff79DIuNT
	UZcLOVGqZHhmlKcwb2pMSQ5PmFBYEbqzmCgtuhHjwNl7TVpzgWjDg7/dumSHECdxHXPMBXTjUYa
	FMlsVL1vK3yQHtaAIpKSLKD97TD4h2yASfP4ChvGVNmL/YzDRG9LWuqKDn3u0qgWSBe93h86JeP
	FdszcsrwPdQ==
X-Google-Smtp-Source: AGHT+IFd5qkPHWKs7u0kGQaxuAKFWYEyb+eqqsQgE6/A1ZcU9oZLI/LHqjeh9PQlI3f0EWIivI7Brw==
X-Received: by 2002:a05:6402:26c2:b0:5db:f423:19c5 with SMTP id 4fb4d7f45d1cf-5e4d6ac4066mr2619097a12.5.1740751647799;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:23 +0000
Subject: [PATCH 10/18] rtc: pl030: drop needless struct pl030_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-10-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060729_259399_26261716 
X-CRM114-Status: GOOD (  11.35  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXBsMDMwLmMgfCAxNCArKysrKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtcGwwMzAuYyBiL2RyaXZlcnMvcnRjL3J0Yy1w
bDAzMC5jCmluZGV4IDM5MDM4YzA3NTRlZTU1YTk1MmU1OTg2YWZlNzExY2ZmZmYzNTg0MGIuLmU3
YzgxNzQwMDYxYmI2MGM0ZDg0NDdkNjUyMjgxOTY4NWJlYTkxODAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvcnRjL3J0Yy1wbDAzMC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1wbDAzMC5jCkBAIC0yMSw3
ICsyMSw2IEBACiAjZGVmaW5lIFJUQ19DUl9NSUUJKDEgPDwgMCkKIAogc3RydWN0IHBsMDMwX3J0
YyB7Ci0Jc3RydWN0IHJ0Y19kZXZpY2UJKnJ0YzsKIAl2b2lkIF9faW9tZW0JCSpiYXNlOwogfTsK
IApAQCAtODYsNiArODUsNyBAQCBzdGF0aWMgaW50IHBsMDMwX3Byb2JlKHN0cnVjdCBhbWJhX2Rl
dmljZSAqZGV2LCBjb25zdCBzdHJ1Y3QgYW1iYV9pZCAqaWQpCiB7CiAJc3RydWN0IHBsMDMwX3J0
YyAqcnRjOwogCWludCByZXQ7CisJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0Y19kZXY7CiAKIAlyZXQg
PSBhbWJhX3JlcXVlc3RfcmVnaW9ucyhkZXYsIE5VTEwpOwogCWlmIChyZXQpCkBAIC05NywxNCAr
OTcsMTQgQEAgc3RhdGljIGludCBwbDAzMF9wcm9iZShzdHJ1Y3QgYW1iYV9kZXZpY2UgKmRldiwg
Y29uc3Qgc3RydWN0IGFtYmFfaWQgKmlkKQogCQlnb3RvIGVycl9ydGM7CiAJfQogCi0JcnRjLT5y
dGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJmRldi0+ZGV2KTsKLQlpZiAoSVNfRVJSKHJ0
Yy0+cnRjKSkgewotCQlyZXQgPSBQVFJfRVJSKHJ0Yy0+cnRjKTsKKwlydGNfZGV2ID0gZGV2bV9y
dGNfYWxsb2NhdGVfZGV2aWNlKCZkZXYtPmRldik7CisJaWYgKElTX0VSUihydGNfZGV2KSkgewor
CQlyZXQgPSBQVFJfRVJSKHJ0Y19kZXYpOwogCQlnb3RvIGVycl9ydGM7CiAJfQogCi0JcnRjLT5y
dGMtPm9wcyA9ICZwbDAzMF9vcHM7Ci0JcnRjLT5ydGMtPnJhbmdlX21heCA9IFUzMl9NQVg7CisJ
cnRjX2Rldi0+b3BzID0gJnBsMDMwX29wczsKKwlydGNfZGV2LT5yYW5nZV9tYXggPSBVMzJfTUFY
OwogCXJ0Yy0+YmFzZSA9IGlvcmVtYXAoZGV2LT5yZXMuc3RhcnQsIHJlc291cmNlX3NpemUoJmRl
di0+cmVzKSk7CiAJaWYgKCFydGMtPmJhc2UpIHsKIAkJcmV0ID0gLUVOT01FTTsKQEAgLTEyMSw3
ICsxMjEsNyBAQCBzdGF0aWMgaW50IHBsMDMwX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqZGV2
LCBjb25zdCBzdHJ1Y3QgYW1iYV9pZCAqaWQpCiAJaWYgKHJldCkKIAkJZ290byBlcnJfaXJxOwog
Ci0JcmV0ID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Yy0+cnRjKTsKKwlyZXQgPSBkZXZt
X3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjX2Rldik7CiAJaWYgKHJldCkKIAkJZ290byBlcnJfcmVn
OwogCgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
