Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A50C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOnYn67i7kGRJPmH/AAZGgDfaBJkjIWhqsy5ZITOdOA=; b=fwxIIePohyBc1V
	KuG3tCTvddMaSFU8PanXlRMQUdPRFO5c+jAuGG/3L5hhWnk/WK0Uy9OdNTAAI7eqDY/LkB6IvIT9S
	h3aKq69s9ceqhOyIhMZqmqF3m6TkzQNOoz7KrlD969O3gpi7nEnSGdA01laL0d/JvHt3MYxP6Yrig
	fxqD+tl5t5XGgQ5eRBERkhLfnKcoPtX4MPo0SxtZCvhHLhCN+NinrtIjmAFQPdf9HDPmtPdqcCPkQ
	TiFZZ2zEWJIlgjwxc384JznXi5OE1dPrcLx9bxBJNZ/8/il6bWZkBlavWYRwMMeFG9C8qjPINxOaA
	YFjFNIQ7yLTfoNfFIU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Dx-0000000BEeq-15yR;
	Fri, 28 Feb 2025 14:20:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11U-0000000BB7J-0uTR
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-abf3d64849dso62140966b.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=aVcetOIQHsUcyIeSUA7ovu5xYQAymhLIBjvDdHoVM4DkeqHws9LSRYQFQLjDA2RxDI
         0lAMT0wfcc0y8jYudqXaZUGp3QIGN7gEkoKxUgA1F+wJik1kNXEiklFkzzD0h6MgZeLN
         13mGxVQ0JEMOBsdjCuews3QsPBzwWyzo06O013+An7I5FMoaAzc4gUhPd/UYJnhFLy1c
         Ef30Q6cQzE+nrLNB5sSrhNateSfrbGOFsmuEI4FbofAhbx8Avk1jWarjAOrHGIW2EjTd
         /Lob8Uviw9gas12/0pCMA9MJFNfxWcIgjBGk1ECjHR/C8MNVp0u/aexZpBaZUPalOMvM
         74/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfBBNFFxoATgsY5PG9x5TDiO1XW3it+ha4dH0f4d6kY=;
        b=RVJPQiWkG65L2WbDor4x16uoVv5Pu6XzDdvyvxegVYOe/swLTm0M8oE3VWAyiIGh96
         VRLPrb3WGs5e4xaHRmuZGaUwmzRcZEf7+WTfsz1l6AIMLexUq9UFE4/xsbKW9BS3FCQi
         e5m3wX7wzjU5zavLPfrxTy64lnlfg/xZF1/ChgcVhXkrLxy1BWPfp9RbonNFtUY9doKB
         4p5xnjMITiVXECIQLPYY9QsOWDl3Ws59UyGFGX5ECQcpLKPR31AfiJHFuPAY8ai6cQBb
         9LwlaLqR6BlT8mrwrqUMlwRZYVMh2KFOMS/R85mptRiCAg/xssqN5+y7Ro4BWaYMnXA/
         wiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIKwi3zL+EVQOJ36MHun3V5EzFosvFG5ZCReCdbC13ue565LO4yfb2RA1o1XiLxrH4Nuvuz4DXWVi5924d@lists.infradead.org
X-Gm-Message-State: AOJu0YxNGuwHaKy9wxSEWqUssep9ECpac/7H/iOr/bo7sufgwxbF97EQ
	q2cKI43oEn1qUKmtzNkhMpQJHjOf4IwB8f5y8uEXTbcBgZNyOthgBL0XR+2epwZdru4PSCfMptL
	Fczk=
X-Gm-Gg: ASbGncvzOXTDeHMazHrjnfupfbA7C31TeWTV/wKG2RiQRzAK+oTucXm18sxTYuibr9/
	e/iuMpJwRjhCIOu6ahlyr0cyWxB7sWFTpgIez14kzXBbkdweebcGBVA0X+5q792t22VeruaHz6b
	mjT2r6p2VC5IY+ZwfsvwV+7/Xz3Dm2SfyxmeNtxV5r7icBLCfEGPJSn2IMXZ1wlm6QhrXTJLZWU
	GATrFmpwUH0sWl77KhPv2jobV/9TfMlZ8r+9Riy2aUeB4tPQDfRRQFqPrg2RZ6PZOyJkE2lEztG
	NwmCE1xTq2fdZN2iL0RxkEoFdtSfd31UvMpwYooGG/RfYUcVy+Ia3xIvaqopn/2mJRAWYleadwu
	FkM8VtiptsQ==
X-Google-Smtp-Source: AGHT+IELhJPOd4W0qPAgNgABcD5moXsKlcKW8ZKlMd0/6RuVXfSWqRkHz67gqaNmak1AZcnDjWmnpg==
X-Received: by 2002:a05:6402:50d0:b0:5e0:818a:5f4d with SMTP id 4fb4d7f45d1cf-5e4d6b628aamr8322653a12.28.1740751646827;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:21 +0000
Subject: [PATCH 08/18] rtc: meson: drop needless struct meson_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-8-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060728_269937_3AB75358 
X-CRM114-Status: GOOD (  13.92  )
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
