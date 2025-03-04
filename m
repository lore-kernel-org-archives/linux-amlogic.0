Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BB3C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cU9IhZroV9b1snft+UW62CBTtzq25JHNv43e1Ptrp1w=; b=L01PFFvBOOpxPP
	en8COArPKzqicuHqXR3d9yRCAR/ctb7kkMWgFXDVXvIxJgz9Cgad7OonfWitbDNqqsUUAgEk0jbr5
	ctgDLE3wFpvNNzlH9aHSOsZ747TNYAsgoFv6HK9VeYcsSc1oTIN6hmBSMJD+GvE2wEHOJpDEkiaOj
	taEryhML0U90nGbqn6IhXfbkbA0niMLqdKJWtUrBETGCf9zxtnb19LNlOYc7zYLtEB+i0Gh7PREuH
	zcusgvb1THc9ePkYq/QzzsyaCxU0pzfiBLVMeVT/xbKAmZhZ+WnJ8T7i/uog9biBG4eKR//DRlHLj
	XfzDxTgjEZnDpSnbHpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXBq-00000005srS-2Lid;
	Tue, 04 Mar 2025 18:40:26 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViB-00000005YEs-3KFx
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:44 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390fdaf2897so3096897f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=LU1OU3IkdWNWsUt/aewhUUtEn25SNdRZ7BOkoZwYtNsRO5HvLPGDu53YbqBeBoGAIy
         s7zOskvE1NFqsk6mLZsBeFW/OK+2B8AMN50c2ITZH1UxsWAdZRLnA8B1rElC3jETrswO
         rFdIhDOhNKMoAKhdS4rKAbC0Ft4gUMjRX9+CXzEyDCdlomCH1Oa6MvX0qHq0xxZ/92W/
         RXdqio9G/wDbo3GHnsFabNQXLBIDODdX8vpE4vdvvEOjJn/E0P/AuGfKswljqz3GXGRi
         AeBtaSoZ7qxgLQTcAW+LtkPmX0TgTLcTjCYkLqc1jLpIYzwauiABuAZd3A9TbKyo+p9a
         ji6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+a3Z9er7HS5GhzYho010S7pznnO0QcQ46P/wgZR3Rg=;
        b=Ii/dPyClIMpdotEkiI6Y5Rfr66Lzcvl/M1RbdaMxpuB+09tvPJwrbQa7ED1j94Ogvf
         /nffHdeb3uO3mjcy8A7xCe9gEPUmzkswqhNLYqSsuLVlKYurg5ZlE29sbognZrmoSf/n
         DmpNWTBg7tA7CjKYQVBtmz6YnxeRlsnmJOrl3zJqmqxUB1v7YxR/U5SsAwyDCfg1iGFb
         IR9BXnkRND3PFmB0DXwtKvCz3zLNAcg3ThtW3n9WU+RCKIxElzpeKA8oY1swZNgh8Xbq
         TOiuEDKIwlkr/w/RupCsKYm6lZL5WjbXZn632jVH+k+gfYRUheWMb09dqu2BO+ETVETt
         2Fsw==
X-Forwarded-Encrypted: i=1; AJvYcCWKhgPkRtyPeSQ2uPeox7RayAI/kdA/z+W8pAGrasyskUig+vWv7u62CV6mHWL2Iuw/r7P59peT4AXhqsxM@lists.infradead.org
X-Gm-Message-State: AOJu0YznahNFTpYg4/17VOGpThUR3LMjNCvHg+tbyoFNBVbHVfUtFDKF
	ImtCsKjuYhX8bmtF/KSCL0CTufF9qJzI0A5EOUtC2P376Wx+8kAWWbztmW1g03k=
X-Gm-Gg: ASbGncslHE0HdHb3Z/i5g2/CTYceTFSC2r4flaifzNEsbAro4W25wzncafZ/8pyoU54
	hAzWgsbtmlixwEFVFOb5Cm2y7prfdmV/Ex4UCwLh75CsFAMp1tsZTlkJL5yhulRRK8wDciu0fTf
	WDDV+B04Xft30JosPSLlWnMz3T1Lllw6NPCoheOt2RmxvxIfNfTEwZWeoglMLlTNP7oZiF5EenQ
	YUMi9rMNuGqxnHMQMdbYb/ivP0PPsadE1v3qQZt4nKh2kAkGDDQkrhOJTR5QkjYW/YiofU6vJge
	JiqDuxN/MaxvHZPXfuxNPJVl6EjSFgBrGwlQJmXOjD54CJzPguzVpemDUUzuSvXJLTtmZHun22a
	Mv0QZsOm12w0JlDjju6WP1dBH5caa
X-Google-Smtp-Source: AGHT+IFBi6JjsYJDnSEwMCPY80NtpnY/0pWo317IbLvcMp22I1j/lVgkodnN+FQ/p9Zn6V6GISOI9g==
X-Received: by 2002:a05:6000:178c:b0:390:debd:70c3 with SMTP id ffacd0b85a97d-390eca25fbdmr19248281f8f.54.1741107941433;
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:43 +0000
Subject: [PATCH v2 15/16] rtc: max77686: use dev_err_probe() where
 appropriate
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-15-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090543_835515_8F7BF6B5 
X-CRM114-Status: GOOD (  11.98  )
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
b3IgbWVzc2FnZXMsCnRoZXJlJ3Mgbm8gcmVhc29uIG5vdCB0byB1c2UgaXQgaGVyZS4KClJldmll
d2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+ClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMgfCAyOSArKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIGIvZHJpdmVy
cy9ydGMvcnRjLW1heDc3Njg2LmMKaW5kZXggNmIwZDAyYjQ0YzgwOTc0NTNmNzA0Y2JlYzlmMDI1
ODBmYjg2OWNhMy4uNjllYTNjZTc1YjVhNTQyNmQ0YTU2Yjk3OTc3M2JlNzFjNGVlNzU2MiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMKKysrIGIvZHJpdmVycy9ydGMvcnRj
LW1heDc3Njg2LmMKQEAgLTcwNCwxMCArNzA0LDkgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0
X3J0Y19yZWdtYXAoc3RydWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCX0KIAogCWluZm8t
PnJlZ21hcCA9IGRldl9nZXRfcmVnbWFwKHBhcmVudCwgTlVMTCk7Ci0JaWYgKCFpbmZvLT5yZWdt
YXApIHsKLQkJZGV2X2VycihpbmZvLT5kZXYsICJGYWlsZWQgdG8gZ2V0IHJ0YyByZWdtYXBcbiIp
OwotCQlyZXR1cm4gLUVOT0RFVjsKLQl9CisJaWYgKCFpbmZvLT5yZWdtYXApCisJCXJldHVybiBk
ZXZfZXJyX3Byb2JlKGluZm8tPmRldiwgLUVOT0RFViwKKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0
IHJ0YyByZWdtYXBcbiIpOwogCiAJaWYgKGluZm8tPmRydl9kYXRhLT5ydGNfaTJjX2FkZHIgPT0g
TUFYNzc2ODZfSU5WQUxJRF9JMkNfQUREUikgewogCQlpbmZvLT5ydGNfcmVnbWFwID0gaW5mby0+
cmVnbWFwOwpAQCAtNzE2LDI4ICs3MTUsMjQgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0X3J0
Y19yZWdtYXAoc3RydWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCiAJY2xpZW50ID0gZGV2
bV9pMmNfbmV3X2R1bW15X2RldmljZShpbmZvLT5kZXYsIHBhcmVudF9pMmMtPmFkYXB0ZXIsCiAJ
CQkJCSAgIGluZm8tPmRydl9kYXRhLT5ydGNfaTJjX2FkZHIpOwotCWlmIChJU19FUlIoY2xpZW50
KSkgewotCQlkZXZfZXJyKGluZm8tPmRldiwgIkZhaWxlZCB0byBhbGxvY2F0ZSBJMkMgZGV2aWNl
IGZvciBSVENcbiIpOwotCQlyZXR1cm4gUFRSX0VSUihjbGllbnQpOwotCX0KKwlpZiAoSVNfRVJS
KGNsaWVudCkpCisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGluZm8tPmRldiwgUFRSX0VSUihjbGll
bnQpLAorCQkJCSAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBJMkMgZGV2aWNlIGZvciBSVENcbiIp
OwogCiAJaW5mby0+cnRjX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwKIAkJ
CQkJCWluZm8tPmRydl9kYXRhLT5yZWdtYXBfY29uZmlnKTsKLQlpZiAoSVNfRVJSKGluZm8tPnJ0
Y19yZWdtYXApKSB7Ci0JCXJldCA9IFBUUl9FUlIoaW5mby0+cnRjX3JlZ21hcCk7Ci0JCWRldl9l
cnIoaW5mby0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdtYXA6ICVkXG4iLCByZXQp
OwotCQlyZXR1cm4gcmV0OwotCX0KKwlpZiAoSVNfRVJSKGluZm8tPnJ0Y19yZWdtYXApKQorCQly
ZXR1cm4gZGV2X2Vycl9wcm9iZShpbmZvLT5kZXYsIFBUUl9FUlIoaW5mby0+cnRjX3JlZ21hcCks
CisJCQkJICAgICAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdtYXBcbiIpOwogCiBhZGRfcnRj
X2lycToKIAlyZXQgPSByZWdtYXBfYWRkX2lycV9jaGlwKGluZm8tPnJ0Y19yZWdtYXAsIGluZm8t
PnJ0Y19pcnEsCiAJCQkJICBJUlFGX09ORVNIT1QgfCBJUlFGX1NIQVJFRCwKIAkJCQkgIDAsIGlu
Zm8tPmRydl9kYXRhLT5ydGNfaXJxX2NoaXAsCiAJCQkJICAmaW5mby0+cnRjX2lycV9kYXRhKTsK
LQlpZiAocmV0IDwgMCkgewotCQlkZXZfZXJyKGluZm8tPmRldiwgIkZhaWxlZCB0byBhZGQgUlRD
IGlycSBjaGlwOiAlZFxuIiwgcmV0KTsKLQkJcmV0dXJuIHJldDsKLQl9CisJaWYgKHJldCA8IDAp
CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGluZm8tPmRldiwgcmV0LAorCQkJCSAgICAgIkZhaWxl
ZCB0byBhZGQgUlRDIGlycSBjaGlwXG4iKTsKIAogCXJldHVybiAwOwogfQoKLS0gCjIuNDguMS43
MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
