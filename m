Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F9FC19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVE6+V8ewMiQrmq53tV/nHnnlJ5Zij7gyJzWLYeuBnc=; b=kqy7LHPAdG5XBk
	wkOmY0BeSnbq+IyNWLmzkIJi/OpzTvhhpy6AxRDXp/+cx0CpXmF6666LIrZuWbe9wwo7MHg6Tyl+U
	zu6GaJxnVR8cNFIz3qO/u7odZFa1bDbN9BMs5JCxAau6O68lFGMJKWeu57DfQ6YORplnRx+Uqepka
	tT3hqX/PSCXngqJ35JDwMLK6jk6ksx3JvE06cJ9DuaEufXV91XszmgYx080XSAFjARU9SQGT+S1Cb
	t3TM526+MI0Zp5Jum7tulmFyfVfQKrniqDdZMSKHdHFtE6F34qV/k0t+4BzCD43CB609CUnBTtA6G
	B83JEnJzmQqqCVpytqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1IY-0000000BFjx-1iEV;
	Fri, 28 Feb 2025 14:25:06 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11V-0000000BB9P-2Xue
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:30 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so4075425a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751648; x=1741356448; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=Gf4Kp7HassYmg1Bt0wmPC5X8yp8JsSeJuFeavsXBwKns8Dt33e/hV7STgjF+RhUxAG
         UUJtDJepClki3qSKqnzPonVliB3Q2dZRJmPWiMTNp8wh3C2zZ+toklLQmHZ2aDs+nOWc
         gkJZ3vLHXSYt+YKTK7RmeOjPiKXFG+KWT/bKHuj3he7mvrYSLde3C2+nj5xgMF18xsQU
         GnExY6EWhdna/LYH0vlpzpBF5cTqEeODZgaCBYUcNS1lFrd8mE8Qd6YgJ2xs9ndQKgw/
         7mYTLzwiDM2KJoioygrXw38GuInbmPej6hovLu7PpEAZ90mYONIVI+odTHofvzKrLOxF
         uEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751648; x=1741356448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nzHwlkUM09BG0CuM/bA+EpIQxILewT/ffWeXrAz77U=;
        b=ncbXzUUwgbTtkQGzLFXFCzqUx9847W1kIgz6Sq0STl5e/Xl4Ynr7fwJRXeo+uSMcpo
         9WaH2lgLe3ak7ck52ERgQYbjcv7TY4eiljYbb1uyLdkKgnp7EpJe31ojnvWgH6gEGZL0
         39clQ+Ee9c365BaaGGKTLs4osl30ScY/a6WjV1/L9QQdmauXLSE4xWzjuPEWGCnvR+be
         JrYdrpiDTPnot1yLp2dPiKSD8APnQYAZ8acPEEy22QLqRlUuqYpn7hs0nU+kly8qlQdd
         bw8nG0oRs8Lkhs3hEXxWA2WHhTyz3+Gnj09TIkHjQoQgpEJPSosJMQDh6aj2g9LMannh
         lpTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6HtGoMp3kzUpsm5ZCcz76XCujAFRCn85/hMujN+Gc5n/RDBGc94DCTpp62lQyPJ4awrTD14eIMXq8dIdq@lists.infradead.org
X-Gm-Message-State: AOJu0YyuUVFyytCITfsl8IqFrZ9GnvCcTurwsO++BDF90gWUiwcR01Vc
	AVWpPzl7L3bSLHvXWoPLJ/+0v8fJkGFLRnbw3JGrurWuvsP+SEroo+2i0U00yBc=
X-Gm-Gg: ASbGncutDYX3UCKLTcs8j2d3XTtOit2N+aQy1gwMb8/IbYw4i7YInTQKfDmCehixcKs
	0BR7Ia4JCKb0O2/JQMAC28xD5SmwdRBEkxFW0hBKbiIkBmnnTk7pan0Yk8XzQHBiQ0gGelwn/v4
	lo6xD1zSSfYPcQiFLnQPeuXJzox3PU2A/lQbx4SVPvJM8JtWcwCJ9Q3EXRjSrv1Q/KF1tqPbX/R
	bs77wRfUOLlNM7dYOvDQcgex9ZJnjFuhXIk6q3s3JTwJZRhcO/Q2RrsDzfypFgq9E9iW+APf9Y3
	QrmBtJEamTRmqQXcvQffaIeipn3qYp24D30cDzE0R2H+gkmXOdA63dgGYxu5XAviq7PBamYo76A
	ktbHpQmSYAg==
X-Google-Smtp-Source: AGHT+IGquByOTAI+pOBsMihZmYnZaIy5p2XitRnKkTWDJg07k5RO868wRYsHEejBUavy8mEmWjqo9Q==
X-Received: by 2002:a05:6402:13d4:b0:5e0:8a27:cd36 with SMTP id 4fb4d7f45d1cf-5e4bfacb0a8mr8959084a12.8.1740751648271;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:24 +0000
Subject: [PATCH 11/18] rtc: rx8581: drop needless struct rx8581::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-11-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060729_646337_F6429FA2 
X-CRM114-Status: GOOD (  14.74  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXJ4ODU4MS5jIHwgMjIgKysrKysr
KysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1yeDg1ODEuYyBiL2RyaXZl
cnMvcnRjL3J0Yy1yeDg1ODEuYwppbmRleCBiMThjMTI4ODdiZGMzNzA1ZWE0Y2VlOWI4ZDc1MDg2
YTA1YjI0ZTcxLi43ODVlYmFjYTA3YWM5NzFlZWUzNDU1OWY4ZDFlMGE4YTg3MmNiYmE5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtcng4NTgxLmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLXJ4
ODU4MS5jCkBAIC01NCw3ICs1NCw2IEBACiAKIHN0cnVjdCByeDg1ODEgewogCXN0cnVjdCByZWdt
YXAJCSpyZWdtYXA7Ci0Jc3RydWN0IHJ0Y19kZXZpY2UJKnJ0YzsKIH07CiAKIHN0cnVjdCByeDg1
eDFfY29uZmlnIHsKQEAgLTI1Miw2ICsyNTEsNyBAQCBzdGF0aWMgaW50IHJ4ODU4MV9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCXN0cnVjdCByeDg1ODEgKnJ4ODU4MTsKIAljb25z
dCBzdHJ1Y3Qgcng4NXgxX2NvbmZpZyAqY29uZmlnID0gJnJ4ODU4MV9jb25maWc7CiAJY29uc3Qg
dm9pZCAqZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YSgmY2xpZW50LT5kZXYpOworCXN0
cnVjdCBydGNfZGV2aWNlICpydGM7CiAJc3RhdGljIHN0cnVjdCBudm1lbV9jb25maWcgbnZtZW1f
Y2ZnW10gPSB7CiAJCXsKIAkJCS5uYW1lID0gInJ4ODV4MS0iLApAQCAtMjg2LDIxICsyODYsMjEg
QEAgc3RhdGljIGludCByeDg1ODFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAlp
ZiAoSVNfRVJSKHJ4ODU4MS0+cmVnbWFwKSkKIAkJcmV0dXJuIFBUUl9FUlIocng4NTgxLT5yZWdt
YXApOwogCi0Jcng4NTgxLT5ydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJmNsaWVudC0+
ZGV2KTsKLQlpZiAoSVNfRVJSKHJ4ODU4MS0+cnRjKSkKLQkJcmV0dXJuIFBUUl9FUlIocng4NTgx
LT5ydGMpOworCXJ0YyA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmY2xpZW50LT5kZXYpOwor
CWlmIChJU19FUlIocnRjKSkKKwkJcmV0dXJuIFBUUl9FUlIocnRjKTsKIAotCXJ4ODU4MS0+cnRj
LT5vcHMgPSAmcng4NTgxX3J0Y19vcHM7Ci0Jcng4NTgxLT5ydGMtPnJhbmdlX21pbiA9IFJUQ19U
SU1FU1RBTVBfQkVHSU5fMjAwMDsKLQlyeDg1ODEtPnJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVT
VEFNUF9FTkRfMjA5OTsKLQlyeDg1ODEtPnJ0Yy0+c3RhcnRfc2VjcyA9IDA7Ci0Jcng4NTgxLT5y
dGMtPnNldF9zdGFydF90aW1lID0gdHJ1ZTsKKwlydGMtPm9wcyA9ICZyeDg1ODFfcnRjX29wczsK
KwlydGMtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RBTVBfQkVHSU5fMjAwMDsKKwlydGMtPnJhbmdl
X21heCA9IFJUQ19USU1FU1RBTVBfRU5EXzIwOTk7CisJcnRjLT5zdGFydF9zZWNzID0gMDsKKwly
dGMtPnNldF9zdGFydF90aW1lID0gdHJ1ZTsKIAotCXJldCA9IGRldm1fcnRjX3JlZ2lzdGVyX2Rl
dmljZShyeDg1ODEtPnJ0Yyk7CisJcmV0ID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Yyk7
CiAKIAlmb3IgKGkgPSAwOyBpIDwgY29uZmlnLT5udW1fbnZyYW07IGkrKykgewogCQludm1lbV9j
ZmdbaV0ucHJpdiA9IHJ4ODU4MTsKLQkJZGV2bV9ydGNfbnZtZW1fcmVnaXN0ZXIocng4NTgxLT5y
dGMsICZudm1lbV9jZmdbaV0pOworCQlkZXZtX3J0Y19udm1lbV9yZWdpc3RlcihydGMsICZudm1l
bV9jZmdbaV0pOwogCX0KIAogCXJldHVybiByZXQ7CgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1
YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
