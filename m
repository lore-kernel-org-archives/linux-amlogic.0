Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7831FC19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ9E/tYiSXFAfGwVx4cfk5cQiNGThrehz3hqLTFApNA=; b=YYfBt1gaQ09YCr
	b2iUIPC/zgQHIOQwy8y/8YRvdA+l0cOE0lNemb3wxWKEei5YkJbqfdDBGJ4VEkOSbnj/0cT0OuXdi
	KPKaXBezT7Bd5y9qFCsCoh7ffYKMc+cLHqpi9NlC8US05W82GTm3J7+DaUz9bLfgXfnK/ih4h3PpR
	aMrFZs/jCd/Iq5yNYoFPdDFLcKy3tZwQKcJF+b6C2bwvafW6603pSUy+QLV5T14U14V6Q+ZS0I62r
	OC2nkF553G8UqkArvxZU30vC+ZmMJyFPWLnsxGBWv8ymPvEchQ5sQWN960IoBJZKQ37ABZ7MbbkAR
	ITwzEYqwG8S+bDIWkcnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Ld-0000000BGQu-0cX2;
	Fri, 28 Feb 2025 14:28:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11W-0000000BBA6-0kOj
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so3923190a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751649; x=1741356449; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=I2QDvE9wN+g16Z7rKZjQU/K6ZyJAh05OKQtvnHRRZ/NX7Qo60eGE+dm8BKfzrU9iKF
         H4VtWcTaPRD6eL+CY91buxH7GcwnUrBJZ1sOvxJMOMk8bNMMlsPmkuULMQYZ8SfeDwAh
         YgMjP+C0daE8bbGNhggoSugyqhKMATjHZjaqz0aakz1z7gaFYEelDwo2P+Hk1MMenrlT
         BLN9w8ax0XNQ/NJGxcVsK2GrHXMq+tqrqKdG0uHBUg0Ylrs8u4l2Gr/qGb0VWM0hsO1n
         avp4lz4rxyTa1oxLElHNz+pDNz2jCIaGgtuNpqbUP7228REVsO3bsVrsDOdwKr46u5NJ
         B/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751649; x=1741356449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka86PnTxcRg56Z11OHXTxcAKX5oZrUWInphsB9KYtsw=;
        b=UD8xjMXcrSjSErYwCVLsyzy8I2+NE48ZuM151Z4gcmXRizGh7itgc3zCskzvmY7eUH
         pJwU6x5TjK5AB8kZYoRtZU8N4oirHzqfSclk/M79oc0vLr9031p7wK24WtU0tb6ndTft
         naTihqqIIQAVsum1JFBHdsusFVFlXwi87CQbaqtG+Jcg1kkoXBzYT86ICe6RCTNMvsc4
         c4Uvc0lWauZjiKuepNY7D/dRanqMyXrfTuaHL4paoHBpWn0xsRgKSnojqRdcW1N2qndE
         XqbUFKJw/Vz0SjHuPbfhelIk32l7iTa4YNfwDK3Fx/V/gEAWDTKk6/6D0dCcxfDX2exI
         mpMg==
X-Forwarded-Encrypted: i=1; AJvYcCUh6szUGan2JqewTl5+l65pMLp6BrQ7jYYib4teWA+oQmeDg6QT7uRG+Gze9RYy9vJy36OE2NzCQ4JaxEsc@lists.infradead.org
X-Gm-Message-State: AOJu0YyMw7sRp61SQpCXgnDwlMnYu64ErJm+QXHDomo3HO2VQYTyaEvj
	Q/05aFNN5HDiLZ0eD6UVq56p2yP0ZJKDJl1X7BiUC+DqWfY/kxdNMkYcqZfIZ1c=
X-Gm-Gg: ASbGncuYFvm6xsH3AOeR69SnHHrcZfJ6OfsEjIH9/rxlTTl4TbuhDmuwKN283+xZ7r5
	kJAnH2JdjxvR6iGwAoAG8xZE8NW7WRLrsxumoRHZGkfXEEptl67IOLJVBmwM+qTIA030PjLFBZp
	Ei/BGvOtM3Kka+eOqIJPvh0ged3G3FY/FHmFFN/GXqTfvc0RI+44A6b5tuc7YX2VSmiTScYB/1s
	rm5D5IE88KX29eRh4ier66IHIZq3QNqJLaGxXgXgfrVlSeyj63mOXeU5N1t3hTv2PZ4c9fYYK2W
	FDv4BEuA5QkAlwVuZ/ds0CPHTbhns4lv5rW6mtRnXT2vhBlMm3NTqedqTA2vO++Gf9MbmEU0KtW
	9Ze/2XWx+iA==
X-Google-Smtp-Source: AGHT+IF1zdUSX6ZhtbedenD60jZMcHzIIU2NhAe4k+oRQ6Wt3d6uE7nze1qy/Ap2/A6npGSF7Q9PVw==
X-Received: by 2002:a05:6402:348a:b0:5d1:f009:925e with SMTP id 4fb4d7f45d1cf-5e4d6b1869bmr2990380a12.16.1740751648743;
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:28 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:25 +0000
Subject: [PATCH 12/18] rtc: s35390a: drop needless struct s35390a::rtc
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-12-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060730_216173_7F2CBCC0 
X-CRM114-Status: GOOD (  14.24  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYyB8IDIyICsrKysr
KysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jIGIvZHJp
dmVycy9ydGMvcnRjLXMzNTM5MGEuYwppbmRleCBlM2RjMTg4ODJmNDE0NDVjNDFmYmVhNTZlZGJk
NWM4Njk1MTQ4ODBjLi4zNDA4ZDJhYjI3NDE5NGUzOWNkZTM4YTgzNTY3ZDM3YmQ1M2Y2NjMyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtczM1MzkwYS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1zMzUzOTBhLmMKQEAgLTYzLDcgKzYzLDYgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgczM1
MzkwYV9vZl9tYXRjaCk7CiAKIHN0cnVjdCBzMzUzOTBhIHsKIAlzdHJ1Y3QgaTJjX2NsaWVudCAq
Y2xpZW50WzhdOwotCXN0cnVjdCBydGNfZGV2aWNlICpydGM7CiAJaW50IHR3ZW50eWZvdXJob3Vy
OwogfTsKIApAQCAtNDIyLDYgKzQyMSw3IEBAIHN0YXRpYyBpbnQgczM1MzkwYV9wcm9iZShzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWludCBlcnIsIGVycl9yZWFkOwogCXVuc2lnbmVkIGlu
dCBpOwogCXN0cnVjdCBzMzUzOTBhICpzMzUzOTBhOworCXN0cnVjdCBydGNfZGV2aWNlICpydGM7
CiAJY2hhciBidWYsIHN0YXR1czE7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2
OwogCkBAIC00NDcsOSArNDQ3LDkgQEAgc3RhdGljIGludCBzMzUzOTBhX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQpCiAJCX0KIAl9CiAKLQlzMzUzOTBhLT5ydGMgPSBkZXZtX3J0Y19h
bGxvY2F0ZV9kZXZpY2UoZGV2KTsKLQlpZiAoSVNfRVJSKHMzNTM5MGEtPnJ0YykpCi0JCXJldHVy
biBQVFJfRVJSKHMzNTM5MGEtPnJ0Yyk7CisJcnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNl
KGRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRSX0VSUihydGMpOwogCiAJZXJy
X3JlYWQgPSBzMzUzOTBhX3JlYWRfc3RhdHVzKHMzNTM5MGEsICZzdGF0dXMxKTsKIAlpZiAoZXJy
X3JlYWQgPCAwKSB7CkBAIC00ODAsMTcgKzQ4MCwxNyBAQCBzdGF0aWMgaW50IHMzNTM5MGFfcHJv
YmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKIAogCWRldmljZV9zZXRfd2FrZXVwX2NhcGFi
bGUoZGV2LCAxKTsKIAotCXMzNTM5MGEtPnJ0Yy0+b3BzID0gJnMzNTM5MGFfcnRjX29wczsKLQlz
MzUzOTBhLT5ydGMtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RBTVBfQkVHSU5fMjAwMDsKLQlzMzUz
OTBhLT5ydGMtPnJhbmdlX21heCA9IFJUQ19USU1FU1RBTVBfRU5EXzIwOTk7CisJcnRjLT5vcHMg
PSAmczM1MzkwYV9ydGNfb3BzOworCXJ0Yy0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFNUF9CRUdJ
Tl8yMDAwOworCXJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9FTkRfMjA5OTsKIAotCXNl
dF9iaXQoUlRDX0ZFQVRVUkVfQUxBUk1fUkVTX01JTlVURSwgczM1MzkwYS0+cnRjLT5mZWF0dXJl
cyk7Ci0JY2xlYXJfYml0KFJUQ19GRUFUVVJFX1VQREFURV9JTlRFUlJVUFQsIHMzNTM5MGEtPnJ0
Yy0+ZmVhdHVyZXMgKTsKKwlzZXRfYml0KFJUQ19GRUFUVVJFX0FMQVJNX1JFU19NSU5VVEUsIHJ0
Yy0+ZmVhdHVyZXMpOworCWNsZWFyX2JpdChSVENfRkVBVFVSRV9VUERBVEVfSU5URVJSVVBULCBy
dGMtPmZlYXR1cmVzKTsKIAogCWlmIChzdGF0dXMxICYgUzM1MzkwQV9GTEFHX0lOVDIpCi0JCXJ0
Y191cGRhdGVfaXJxKHMzNTM5MGEtPnJ0YywgMSwgUlRDX0FGKTsKKwkJcnRjX3VwZGF0ZV9pcnEo
cnRjLCAxLCBSVENfQUYpOwogCi0JcmV0dXJuIGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShzMzUz
OTBhLT5ydGMpOworCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIH0KIAog
c3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIHMzNTM5MGFfZHJpdmVyID0gewoKLS0gCjIuNDguMS43
MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
