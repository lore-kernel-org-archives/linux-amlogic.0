Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017C6C282D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIL++x8T3BkXtRTQOtFCJ5vgOIFtA8VKoLyVHxAAukc=; b=XQWD9XYBMVF/vo
	cZie0ZpESGsSBnwXKIth5Enl8fYR8DXpeKgXg2ivRNmZDa5BCcmCMjM14El/T9RS9vzI9EfCC9DSZ
	AjycNCORj2DJjs3SniRBdwKLi7Cd3fQDKaNt551aVn50Nq0j9Aq/NSF/QEyZ0y8JaJIROoplslKyW
	DFYhnepap2zYsrLR7RqwDMCZ0rLyNktAil1Al7iRbdfitC4yAdnisXn6MZIc6/mT/eCCCsUNk5tZt
	rkCE46BpjocRLusPP3bQgFspiw5wkPunqy2xZhCl/rbJHcQCFOxzYMNYkR/t7R8uIWH8qT+eTpMsV
	TN8yHdKB+qypFMgLm5zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXEu-00000005t6e-3HBG;
	Tue, 04 Mar 2025 18:43:36 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViC-00000005YF6-13vo
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:46 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab78e6edb99so816702766b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107942; x=1741712742; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=EE2OgQlutDc7K1zO5JyyjECN8fM57xCEZJHv0GnxImS30+jRC4hO3NAtU829DcU44J
         y+R99mNtxnWxBf097AayPnq/eGWoerqW2jiwtVEGSjQTxCuGyb1PwBmF5ttp6pha8bOl
         3MxD8G6Cg/Lo8tWBdrSOXep62pQfZGSXXR5WBIXPLlmp/NaIA+apjVWqZ5EvCfG4SNLL
         WmZLHpeSl9cvy0jL7RhXcvfzddOATrvq05Rn4rTjBoAroz1KEzX+gTnc37020lKPYSZy
         qv0sh+4e4g12uK6HVTCWqmyGElId85xUN2YsfCIxCX6TK9+/tHZze9aY+8KV/GAStFKz
         1CjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107942; x=1741712742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKiEbfv2wxdcP+dRwBnTiew8ux2INId3e+zLxFho3GE=;
        b=lzjZC8lGlqjcz0L7uhz+J5ZtoTJU4tax2JzPw8iY8w3gEfKkXeLQYTf0X65qPxoYt9
         g0sGcuHSAbYk+NTuy+9lhs3czgHxKBwx+9zQxp850qfc0qQsIjN3533Ra7Qe1b1Nw/2o
         Oyero3PgbjQy89DhYucB3VXgVNRsOdk3Jk9c0fOzhu/QAubN657Kx9lZUzTGQRY9qiSf
         QEb07MDKDXYZsNYAU8RWIbAjcLhAOp7V6qMiXHjYeenJhL6geRbB9hZoAIZefMS5Xs1U
         Gp2svHthrTKdhiCLrw/5q3h4SZkHDlWwsihK8i9bhFz0Eo5CvFQtiFJYMURTI1NJAzt5
         NMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUTJ4pX8GXvyBQcsiGpHG7n3asEhs0+Z6VKPSWNWhwuqUWetZtH154CJm0pASByisGhkgxJThRHZR34HI/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3KMCAOAS0esCtmK17IQDeTVA6XmCjs/Y5MyTrd4K5pJOCJsUM
	x6wSWOxOYgz27bDIq8gUDgbavNZ0w58LfF5wDfExfCrrVNsZcbnujtkqBfpoqEg=
X-Gm-Gg: ASbGncs6MVnwbbTiWzbJ7iuv1yUcK8aYmpGST6zB0S+ml7MaAMISrJySEt5DSuzxYbi
	XipjoMLnxvuPsoVaUM3X6mK/ZHFAToQxOCuAJyuipG/eZconPuREgqreFPwD2K/36k08QkzDdd2
	VTs18XC1U99bbtOG5wuDUQNPiMEwsm8dklYnCKB0JQgn9wmbuev6UILh5IsRCXupVezXL6CvgBG
	0GfqQ9WmHEWAcmWT/UQ/LPho9+WUv6r400brC532ikycDQMyqEbO3KixfucrNulQU0lQ6XHPBT/
	PLBbX/qYx96gajIsTKOHOL9SPYz6C9SLxu6aB5KS3ksrnweAOqWDaoay8ca3CdSLDlbf4r5qyx9
	GSXNveAXnyaazWsttKrRN0mPKfntG
X-Google-Smtp-Source: AGHT+IFbhvINfL30hs3YpvAxvNGhpuF08a7SPp+ErND7dZCCpi05AobDmHrT2jaUznfQQ+NeOSHQXw==
X-Received: by 2002:a17:907:2d0d:b0:abf:777d:fb7a with SMTP id a640c23a62f3a-ac20da97c7dmr2947466b.46.1741107942351;
        Tue, 04 Mar 2025 09:05:42 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:41 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:44 +0000
Subject: [PATCH v2 16/16] rtc: s5m: convert to dev_err_probe() where
 appropriate
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-16-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090544_294623_6DFD2C30 
X-CRM114-Status: GOOD (  13.72  )
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
cmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXM1bS5jIHwgNTAgKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRp
b25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtczVt
LmMgYi9kcml2ZXJzL3J0Yy9ydGMtczVtLmMKaW5kZXggODhhZWQyNzY2MDM0OGEwNTg4NmYwODBh
Mjg0OGZjYWJiZjk2NjZkMC4uZGI1YzliNjQxMjc3MjEzYWExMzcxNzc2YzYzZTJlZGEzZjIyMzQ2
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLXM1bS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1zNW0uYwpAQCAtNjI2LDExICs2MjYsMTAgQEAgc3RhdGljIGludCBzNW04NzY3X3J0Y19pbml0
X3JlZyhzdHJ1Y3QgczVtX3J0Y19pbmZvICppbmZvKQogCX0KIAogCWluZm8tPnJ0Y18yNGhyX21v
ZGUgPSAxOwotCWlmIChyZXQgPCAwKSB7Ci0JCWRldl9lcnIoaW5mby0+ZGV2LCAiJXM6IGZhaWwg
dG8gd3JpdGUgY29udHJvbG0gcmVnKCVkKVxuIiwKLQkJCV9fZnVuY19fLCByZXQpOwotCQlyZXR1
cm4gcmV0OwotCX0KKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoaW5mby0+
ZGV2LCByZXQsCisJCQkJICAgICAiJXM6IGZhaWwgdG8gd3JpdGUgY29udHJvbG0gcmVnXG4iLAor
CQkJCSAgICAgX19mdW5jX18pOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTY2OSwyNiArNjY4LDIx
IEBAIHN0YXRpYyBpbnQgczVtX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQlhbGFybV9pcnEgPSBTNU04NzY3X0lSUV9SVENBMTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoK
LQkJZGV2X2VycigmcGRldi0+ZGV2LAotCQkJCSJEZXZpY2UgdHlwZSAlbHUgaXMgbm90IHN1cHBv
cnRlZCBieSBSVEMgZHJpdmVyXG4iLAotCQkJCXBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldikt
PmRyaXZlcl9kYXRhKTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJCXJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIC1FTk9ERVYsCisJCQkJICAgICAiRGV2aWNlIHR5cGUgJWx1IGlzIG5vdCBz
dXBwb3J0ZWQgYnkgUlRDIGRyaXZlclxuIiwKKwkJCQkgICAgIHBsYXRmb3JtX2dldF9kZXZpY2Vf
aWQocGRldiktPmRyaXZlcl9kYXRhKTsKIAl9CiAKIAlpMmMgPSBkZXZtX2kyY19uZXdfZHVtbXlf
ZGV2aWNlKCZwZGV2LT5kZXYsIHM1bTg3eHgtPmkyYy0+YWRhcHRlciwKIAkJCQkJUlRDX0kyQ19B
RERSKTsKLQlpZiAoSVNfRVJSKGkyYykpIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVk
IHRvIGFsbG9jYXRlIEkyQyBmb3IgUlRDXG4iKTsKLQkJcmV0dXJuIFBUUl9FUlIoaTJjKTsKLQl9
CisJaWYgKElTX0VSUihpMmMpKQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQ
VFJfRVJSKGkyYyksCisJCQkJICAgICAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBmb3IgUlRDXG4i
KTsKIAogCWluZm8tPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGkyYywgcmVnbWFwX2Nm
Zyk7Ci0JaWYgKElTX0VSUihpbmZvLT5yZWdtYXApKSB7Ci0JCXJldCA9IFBUUl9FUlIoaW5mby0+
cmVnbWFwKTsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyBy
ZWdpc3RlciBtYXA6ICVkXG4iLAotCQkJCXJldCk7Ci0JCXJldHVybiByZXQ7Ci0JfQorCWlmIChJ
U19FUlIoaW5mby0+cmVnbWFwKSkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwg
UFRSX0VSUihpbmZvLT5yZWdtYXApLAorCQkJCSAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBSVEMg
cmVnaXN0ZXIgbWFwXG4iKTsKIAogCWluZm8tPmRldiA9ICZwZGV2LT5kZXY7CiAJaW5mby0+czVt
ODd4eCA9IHM1bTg3eHg7CkBAIC02OTYsMTEgKzY5MCwxMCBAQCBzdGF0aWMgaW50IHM1bV9ydGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCWlmIChzNW04N3h4LT5pcnFf
ZGF0YSkgewogCQlpbmZvLT5pcnEgPSByZWdtYXBfaXJxX2dldF92aXJxKHM1bTg3eHgtPmlycV9k
YXRhLCBhbGFybV9pcnEpOwotCQlpZiAoaW5mby0+aXJxIDw9IDApIHsKLQkJCWRldl9lcnIoJnBk
ZXYtPmRldiwgIkZhaWxlZCB0byBnZXQgdmlydHVhbCBJUlEgJWRcbiIsCi0JCQkJYWxhcm1faXJx
KTsKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9CisJCWlmIChpbmZvLT5pcnEgPD0gMCkKKwkJCXJl
dHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIC1FSU5WQUwsCisJCQkJCSAgICAgIkZhaWxl
ZCB0byBnZXQgdmlydHVhbCBJUlEgJWRcbiIsCisJCQkJCSAgICAgYWxhcm1faXJxKTsKIAl9CiAK
IAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBpbmZvKTsKQEAgLTcyNCwxMSArNzE3LDEwIEBA
IHN0YXRpYyBpbnQgczVtX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
CQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKCZwZGV2LT5kZXYsIGluZm8tPmlycSwg
TlVMTCwKIAkJCQkJCXM1bV9ydGNfYWxhcm1faXJxLCAwLCAicnRjLWFsYXJtMCIsCiAJCQkJCQlp
bmZvKTsKLQkJaWYgKHJldCA8IDApIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0
byByZXF1ZXN0IGFsYXJtIElSUTogJWQ6ICVkXG4iLAotCQkJCWluZm8tPmlycSwgcmV0KTsKLQkJ
CXJldHVybiByZXQ7Ci0JCX0KKwkJaWYgKHJldCA8IDApCisJCQlyZXR1cm4gZGV2X2Vycl9wcm9i
ZSgmcGRldi0+ZGV2LCByZXQsCisJCQkJCSAgICAgIkZhaWxlZCB0byByZXF1ZXN0IGFsYXJtIElS
USAlZFxuIiwKKwkJCQkJICAgICBpbmZvLT5pcnEpOwogCQlkZXZpY2VfaW5pdF93YWtldXAoJnBk
ZXYtPmRldiwgdHJ1ZSk7CiAJfQogCgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
