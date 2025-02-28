Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA635C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aranpZdSt1cw12y5/jrCsTV+SO1rjCNIp6bxUFqMqX0=; b=i2Pq90VFasiUvL
	fJhvcNwaPNE+dPQ9qxv/Uz04+wIGDSl9MzY8g7aii0tXjKkHC6TRJSMJCzpogb6MhkkYcvwuVrE0M
	9gVy5vAN4/xV8C00Sh3Ie6o4B4gK4j9iQrIXbtyaVtF5BbdeiyT7klIgQwJqMlp1bHA7ynA+bXc+I
	VIFg/8JnBvNse2wQ4rOvD+Rmm6AxDyRWjaPZ32Dg/TIoGkm8uTBuH8/1Ngq2TiRi3Gfs7jRHVwknP
	axo0DzUYdkOzzC3SUfydVvGdnUD8jDVIixxB8CcB2aJTbWCZu7Dzei+BGzGDOzj7Y6LJbpNq2LiCn
	9AucRmAJ//kynNdkaHkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Rn-0000000BHhX-2iF1;
	Fri, 28 Feb 2025 14:34:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Z-0000000BBE3-1lHt
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:34 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so3679101a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=YZeC+M6Me/z7YSpmh9nb/WtaJiOnbiAHHqVPoMHfTiaJimq7IBVjsEOfyOlzSke1vz
         CTJxfsyDshy97kPS1Sn5UpjhVWLxNp9CsQb9UR5faqU75+o6H9UHJxngthiTcq5kCrub
         N6Bzqt3DdKyWyqladqyu8NT4r/sdUyn4K5PmHhmJNoUtg19RMj7K+yidAJ6ej76WKjkY
         /F8xvTz/As3Ai4brgJBwXo8i0mzQE1qCsOPn5FCWD9J6rO7eXCTe01/jWwlkGOnWsJrq
         YBxVWbhAMcUjnmxcqNkQhkQcKEf4UG4nw9xC/RAlbJmyUOCqaNlPgPKCKKW+zsoBBWgI
         CdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1wrjOZ25AMEbbC5RG2Bl34Xp7n5uiu5eMlW7fz5kxo=;
        b=CoH9/hOmkONsd9YnXge3iUSHc/BXGCZWVVqNG74sQ0K/T2zcG9YEHkSMr7LdVB5Ajr
         g/QdT74clYuEcYK5XLKgKA0XXc+e9qsHxfU/0eS5nNDDblyUjMJlQ51cwRHB+uoNinS1
         ENn7AoZFXzaDX7av3IU0MwvX4B0OYlqpo3K7SjpbgnxXpF5EbSP5ZudZsnWWcaMHZ+dg
         ++QNTg06lGtdqYljVWjB/Fe5zq/TLr1BROiwWFp9PZughRieASfLs7EW9X3/tXEVDIog
         7US/tLDERkGs6O0Z5gnp2TNp7IbJtzVzb4Ob1dYPyjToTBdaXFUO93y6pJACIMDyD6BH
         F0zw==
X-Forwarded-Encrypted: i=1; AJvYcCVZv7PGWn8b0hva89qVYajY0D8+J/TjWeG88ywsrvmtFDcMd8LU/6LdBTg3lA3DlZ5erjfurW8OCdKE3KqW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7pYQlNJJ6DsxYOsaEC/B6a5HU6bEEWLlxSuDlzDzZwhboBTUY
	8dUjpoNGW0maurrZmOozOUmSkpnogcZGUJkTA9TwONap4ukhYcI55b4QUa5dwvk=
X-Gm-Gg: ASbGncshrmQLgmym+6qYA7vY/f3rwkFs7vA0sqgsHEviQnN5cV+2van2uJInyCgzpwP
	PMi1efR5ImqpbCvsv3DWKyoXqt3Gg9OTdvdfzst0F/c/LXzxOvCJPevA9TUfOJCoKJpx0OBFj73
	UfJDx9CnVkCXZsDoiAUITJF+yxW7yyUvgw0+WjqAyXZuL/Yo0QpfhhEeKuXmtlpiKAtvD3x8e7T
	Bbqi4H3EH4ujxZ+jZZSZoqgInPYp6bP6xpvMkg47llTJywbmb2aim0R3SFhzfEIDfjNPdWANZJK
	ti3RQxY+XmZs1cRagAMtgzm1gt8+RJ5FmtVq7kWF52hJRshNq6UP9pD/ayRlm86dOKZjh2eFP0y
	pVOip15AxsQ==
X-Google-Smtp-Source: AGHT+IH8oBqlrNujitdioxAVXjdPgLAryRZxpXTnrztyLFYptlh+GD/CB4rbFiDA0RhEFxZK1lBu3A==
X-Received: by 2002:a05:6402:35c6:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5e4d6ad4a6amr2900190a12.3.1740751651952;
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:30 +0000
Subject: [PATCH 17/18] rtc: max77686: use dev_err_probe() where appropriate
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-17-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060733_452385_76F31734 
X-CRM114-Status: GOOD (  11.26  )
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

ZGV2X2Vycl9wcm9iZSgpIGV4aXN0cyB0byBzaW1wbGlmeSBjb2RlIGFuZCBoYXJtb25pc2UgZXJy
b3IgbWVzc2FnZXMsCnRoZXJlJ3Mgbm8gcmVhc29uIG5vdCB0byB1c2UgaXQgaGVyZS4KClNpZ25l
ZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMgfCAyOSArKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIGIvZHJpdmVycy9ydGMvcnRj
LW1heDc3Njg2LmMKaW5kZXggNmIwZDAyYjQ0YzgwOTc0NTNmNzA0Y2JlYzlmMDI1ODBmYjg2OWNh
My4uNjllYTNjZTc1YjVhNTQyNmQ0YTU2Yjk3OTc3M2JlNzFjNGVlNzU2MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2
LmMKQEAgLTcwNCwxMCArNzA0LDkgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0X3J0Y19yZWdt
YXAoc3RydWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCX0KIAogCWluZm8tPnJlZ21hcCA9
IGRldl9nZXRfcmVnbWFwKHBhcmVudCwgTlVMTCk7Ci0JaWYgKCFpbmZvLT5yZWdtYXApIHsKLQkJ
ZGV2X2VycihpbmZvLT5kZXYsICJGYWlsZWQgdG8gZ2V0IHJ0YyByZWdtYXBcbiIpOwotCQlyZXR1
cm4gLUVOT0RFVjsKLQl9CisJaWYgKCFpbmZvLT5yZWdtYXApCisJCXJldHVybiBkZXZfZXJyX3By
b2JlKGluZm8tPmRldiwgLUVOT0RFViwKKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHJ0YyByZWdt
YXBcbiIpOwogCiAJaWYgKGluZm8tPmRydl9kYXRhLT5ydGNfaTJjX2FkZHIgPT0gTUFYNzc2ODZf
SU5WQUxJRF9JMkNfQUREUikgewogCQlpbmZvLT5ydGNfcmVnbWFwID0gaW5mby0+cmVnbWFwOwpA
QCAtNzE2LDI4ICs3MTUsMjQgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0X3J0Y19yZWdtYXAo
c3RydWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCiAJY2xpZW50ID0gZGV2bV9pMmNfbmV3
X2R1bW15X2RldmljZShpbmZvLT5kZXYsIHBhcmVudF9pMmMtPmFkYXB0ZXIsCiAJCQkJCSAgIGlu
Zm8tPmRydl9kYXRhLT5ydGNfaTJjX2FkZHIpOwotCWlmIChJU19FUlIoY2xpZW50KSkgewotCQlk
ZXZfZXJyKGluZm8tPmRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSBJMkMgZGV2aWNlIGZvciBSVENc
biIpOwotCQlyZXR1cm4gUFRSX0VSUihjbGllbnQpOwotCX0KKwlpZiAoSVNfRVJSKGNsaWVudCkp
CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGluZm8tPmRldiwgUFRSX0VSUihjbGllbnQpLAorCQkJ
CSAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBJMkMgZGV2aWNlIGZvciBSVENcbiIpOwogCiAJaW5m
by0+cnRjX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwKIAkJCQkJCWluZm8t
PmRydl9kYXRhLT5yZWdtYXBfY29uZmlnKTsKLQlpZiAoSVNfRVJSKGluZm8tPnJ0Y19yZWdtYXAp
KSB7Ci0JCXJldCA9IFBUUl9FUlIoaW5mby0+cnRjX3JlZ21hcCk7Ci0JCWRldl9lcnIoaW5mby0+
ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdtYXA6ICVkXG4iLCByZXQpOwotCQlyZXR1
cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGluZm8tPnJ0Y19yZWdtYXApKQorCQlyZXR1cm4gZGV2
X2Vycl9wcm9iZShpbmZvLT5kZXYsIFBUUl9FUlIoaW5mby0+cnRjX3JlZ21hcCksCisJCQkJICAg
ICAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdtYXBcbiIpOwogCiBhZGRfcnRjX2lycToKIAly
ZXQgPSByZWdtYXBfYWRkX2lycV9jaGlwKGluZm8tPnJ0Y19yZWdtYXAsIGluZm8tPnJ0Y19pcnEs
CiAJCQkJICBJUlFGX09ORVNIT1QgfCBJUlFGX1NIQVJFRCwKIAkJCQkgIDAsIGluZm8tPmRydl9k
YXRhLT5ydGNfaXJxX2NoaXAsCiAJCQkJICAmaW5mby0+cnRjX2lycV9kYXRhKTsKLQlpZiAocmV0
IDwgMCkgewotCQlkZXZfZXJyKGluZm8tPmRldiwgIkZhaWxlZCB0byBhZGQgUlRDIGlycSBjaGlw
OiAlZFxuIiwgcmV0KTsKLQkJcmV0dXJuIHJldDsKLQl9CisJaWYgKHJldCA8IDApCisJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGluZm8tPmRldiwgcmV0LAorCQkJCSAgICAgIkZhaWxlZCB0byBhZGQg
UlRDIGlycSBjaGlwXG4iKTsKIAogCXJldHVybiAwOwogfQoKLS0gCjIuNDguMS43MTEuZzJmZWFi
YWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
