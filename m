Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8D1C282DE
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOnYn67i7kGRJPmH/AAZGgDfaBJkjIWhqsy5ZITOdOA=; b=Jw80o3ryXtv6EH
	kTM7XWDJ08rnaH20YgFEtUh7Z9yWX2WvF2Z+3kYVtaJcWfRwD+frpOs/Mb9fguwMJtQy4Qs3/2Hbb
	uOZwljXvhxgqHsAgPKEqGeeBmOWsMTKj8+D7v/pu4t2aFQ6AZpHpjabglS9Z/ATeynyKkge8WC9y9
	fe1wj7AfAtQMphc9SDopchJjg1UhMQgc/QBF2KyvesqFgBffmMZ5j2q/Sz1aHx6hl1rvI+JzoVy6E
	9HpsdXjUYM/P957u63pm4KuvFN42MxZ6jZWo6ttWihNlRvPG2uv73I6fWNkSG/kiSx+rfkeVnjx09
	zAN00H+gJJALeJemIKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXAJ-00000005scq-2KeE;
	Tue, 04 Mar 2025 18:38:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViB-00000005YEx-2qs4
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=; b=fIgeUlMF6FGNvTYv3Kk08HgH8m
	0iu7RGTxpVSr93J+0elJ6/4g8u031zJij8NOpmjmucHwrvalnA4In3+kL6vMhkAGpnoCmICDZEPH7
	5yHhPX46TmJK7uUAJKnxxXDezzb8Kty2vDE5iTTolxEMQnfSN5XQ1+YjpQplJ2n4OEDzVAvVGkwYa
	9HxJ/klMBmoGXUdOa7LQ9Rx0fHNpySDLpckRPnrO9nlSp1YhOT+9gy72CiBHIVfdxX3hR47cV9xl5
	0uDWhQvu/Htx2AZrZyFj14rvuQCpPoKmfr9Z7PtyhamgIh4NowdQBUoPSNywwF2inAg1kdy6EVFs5
	vQbVYorw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi8-0000000074N-1HDe
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-abf4b376f2fso584950666b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107937; x=1741712737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=ZTO6hmwCTp1YpKlqKax098pS5kZUJQHyYPWj+h3D/hz7WM4xSm6PkQuouMdOxF3usB
         i320238+yKxF0X9yQGc51F88qHAvEhax5SeDeEQQhZse/S2se+4UMtn3Eaz9D0r01NiO
         3kbPDJjTx0xet3Lg1dOtQ61N4lp9h66+9OGKbZzS1vj9Td0Mfs0AsWC4c1Dv8ZwxeW4x
         VzAeVlxO+3zTAyHpATi8j8EmQnKRA2c66EpI7u5IGZss+1uq7zujq6ArjujQgukzJwn8
         xVXAGVgBg/FsCF1e5fwBBTQ3RIfG0A7edfMlazDdPZPCosGX3utOf/JCHoi7zr/yPjdx
         sYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107937; x=1741712737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=uq5mT/uRhHytX5LuiVmYxm05xATJ4iYONTv/Ely8q+OwbR7+V/PkglXsssMT4NAsaO
         OSAp09JwFoB1g2x/KWgTZCKhMPyamQxKTwVTqXmqK0XJsfCR1J6AOwErd7RAdeq85pRi
         CXEe//u2t182zxEif8WTmbQ+z4/dpgdLuO2kbcs3Hztn1ELJ+2GtX+pTCSk73qLUfUmh
         8ZVCiSU9hLFsNXOKxlGtfuGvALsCG1AVvSBxQ1s76w5oXn5fQdHr3szz6ml84m/Giace
         HaRKQDkfmBaapu8n24pte5CISiiUZg97LL07nzkYNVkC+LLSJ0Md8Z0rf86moCphHjvF
         do/w==
X-Forwarded-Encrypted: i=1; AJvYcCVtWuouTVpWZ4AiJIDGdOqbyKOBRduo9v6TGMuWU5BLZiB7tWZ4YjFJblT5fjPbAWAbr4vU2kQBz3Ol9B6i@lists.infradead.org
X-Gm-Message-State: AOJu0YzLoiIB5DS1uDmidmcsqS+XXXIwG91RQsuUGTTvgUxfyCBnuX/f
	8JGlte7rr33QB8nG9BnkdV68xqk6dZRTwq4yOS+0qmcbhq288Mf04+/MHNmwqZg=
X-Gm-Gg: ASbGncsh9XnbmzRL41RL0z28BhJeB5lKlWJd05uEW9hU6Y4tU4/pz1dHsRhxwUq214X
	+aj4e0VG/U0BIGELel8srQcgJDaLKgX1P3wgnUZkPlDpgdB9FdwzllzShf6MYJjskaAIN8J36LS
	oWpdrf9/kmeWD5xdnWWpGN+GhKXjqEPRl1nrkfrsZ/1aYyIgDb+kWbArCrrCnohqH6AAC/prMpa
	m4Qfv9EHtZ5QcAL0sJ/N9U/iC3eliPEvyEVZcgr6Mi5qoLMjSrPRjia9Be21+Hx3thR6Tllar5v
	bBH/QEPXeVVeHqSxehWymJNbg3VmKwJbRQtcT9v/2HINcKZvwiRTPhLd9d3k7Vrjxl0OmFsiqF2
	SZtcSNfsdTzIU80U/FVSceU1aTgcT
X-Google-Smtp-Source: AGHT+IH4UfROsxQRuhFhpuKVUGIkJvl9GfdlUj4CrGm+kiSC0tb2f0MQezXBSz1TfcCGXXToQh+ymA==
X-Received: by 2002:a17:907:7210:b0:abf:778c:58c6 with SMTP id a640c23a62f3a-ac20dab329fmr1852966b.16.1741107936481;
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:36 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:36 +0000
Subject: [PATCH v2 08/16] rtc: meson: drop needless struct meson_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-8-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170540_574186_EDC5D950 
X-CRM114-Status: GOOD (  14.59  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLW1lc29uLmMgfCAxNiArKysrKysr
Ky0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnRjL3J0Yy1tZXNvbi5jIGIvZHJpdmVycy9ydGMvcnRj
LW1lc29uLmMKaW5kZXggZGIxZDYyNmVkY2E1ZmJiNTkwZjI2YzFjZGQwNzc0ZDM1MDI0NGE5OS4u
NDdlOWViZjU4ZmZjMmYyYjZjNjU5MzJmOGVjMzc3M2EyMTNhNjJlZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ydGMvcnRjLW1lc29uLmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLW1lc29uLmMKQEAgLTU5
LDcgKzU5LDYgQEAKICNkZWZpbmUgTUVTT05fU1RBVElDX0RFRkFVTFQgICAgKE1FU09OX1NUQVRJ
Q19CSUFTX0NVUiB8IE1FU09OX1NUQVRJQ19WT0xUQUdFKQogCiBzdHJ1Y3QgbWVzb25fcnRjIHsK
LQlzdHJ1Y3QgcnRjX2RldmljZQkqcnRjOwkJLyogcnRjIGRldmljZSB3ZSBjcmVhdGVkICovCiAJ
c3RydWN0IGRldmljZQkJKmRldjsJCS8qIGRldmljZSB3ZSBib3VuZCBmcm9tICovCiAJc3RydWN0
IHJlc2V0X2NvbnRyb2wJKnJlc2V0OwkJLyogcmVzZXQgc291cmNlICovCiAJc3RydWN0IHJlZ3Vs
YXRvcgkqdmRkOwkJLyogdm9sdGFnZSBpbnB1dCAqLwpAQCAtMjkyLDYgKzI5MSw3IEBAIHN0YXRp
YyBpbnQgbWVzb25fcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfTsK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBtZXNvbl9ydGMgKnJ0
YzsKKwlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjX2RldjsKIAl2b2lkIF9faW9tZW0gKmJhc2U7CiAJ
aW50IHJldDsKIAl1MzIgdG07CkBAIC0zMDAsMTYgKzMwMCwxNiBAQCBzdGF0aWMgaW50IG1lc29u
X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmICghcnRjKQogCQly
ZXR1cm4gLUVOT01FTTsKIAotCXJ0Yy0+cnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlKGRl
dik7Ci0JaWYgKElTX0VSUihydGMtPnJ0YykpCi0JCXJldHVybiBQVFJfRVJSKHJ0Yy0+cnRjKTsK
KwlydGNfZGV2ID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlKGRldik7CisJaWYgKElTX0VSUihy
dGNfZGV2KSkKKwkJcmV0dXJuIFBUUl9FUlIocnRjX2Rldik7CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBydGMpOwogCiAJcnRjLT5kZXYgPSBkZXY7CiAKLQlydGMtPnJ0Yy0+b3BzID0g
Jm1lc29uX3J0Y19vcHM7Ci0JcnRjLT5ydGMtPnJhbmdlX21heCA9IFUzMl9NQVg7CisJcnRjX2Rl
di0+b3BzID0gJm1lc29uX3J0Y19vcHM7CisJcnRjX2Rldi0+cmFuZ2VfbWF4ID0gVTMyX01BWDsK
IAogCWJhc2UgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7CiAJaWYg
KElTX0VSUihiYXNlKSkKQEAgLTM2NSwxMSArMzY1LDExIEBAIHN0YXRpYyBpbnQgbWVzb25fcnRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJbWVzb25fcnRjX252
bWVtX2NvbmZpZy5wcml2ID0gcnRjOwotCXJldCA9IGRldm1fcnRjX252bWVtX3JlZ2lzdGVyKHJ0
Yy0+cnRjLCAmbWVzb25fcnRjX252bWVtX2NvbmZpZyk7CisJcmV0ID0gZGV2bV9ydGNfbnZtZW1f
cmVnaXN0ZXIocnRjX2RldiwgJm1lc29uX3J0Y19udm1lbV9jb25maWcpOwogCWlmIChyZXQpCiAJ
CWdvdG8gb3V0X2Rpc2FibGVfdmRkOwogCi0JcmV0ID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNl
KHJ0Yy0+cnRjKTsKKwlyZXQgPSBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjX2Rldik7CiAJ
aWYgKHJldCkKIAkJZ290byBvdXRfZGlzYWJsZV92ZGQ7CiAKCi0tIAoyLjQ4LjEuNzExLmcyZmVh
YmFiMjVhLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
