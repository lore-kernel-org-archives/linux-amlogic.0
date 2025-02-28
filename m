Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD83C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=honpLzeJN9HARrQ1SV4QPdzugwa15bIeIM+VCyykdk0=; b=u4f8518K9Mpnmk
	8W+gLHKccryP8ZdxHPHUx827oXuvwwQgUL4wW8A3BNBpsrjAA0gqS3JGc+7lUfAYaTX+gASI7VbCL
	+V7ojOuV8643iBvoJUU+bXBR2lpZrmpQKqBb2VfaccAtTt6lgT3tLfyj965T4aYb27x5UkHNXo6g+
	RFMklxRb4j5xwhdZnk6GD4r9W9DxONG5OIcfxBtLkad3cEUUeM/acYZJCzA+iGB9gu0SXSXkh+Ak4
	MJA0NMvhhK4LB7cOo31+jMVL2Cwru5/0uBkwLN3bnQ7MH28PGn/rdJ5vmeL7dqWI9pyleUAlZTG0f
	dRp3mZVG6TGnTw7CnFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1CR-0000000BEKB-13do;
	Fri, 28 Feb 2025 14:18:47 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11T-0000000BB6U-3Ap4
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:28 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e04cb346eeso3601927a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=p4yVOAy3csOTsWpp6mGDNtxmnTrMNFqbdiNd2nBPu2gbRkRykRgqC1KBGPpAPkbz4m
         y17/r+/cbsmh8MzeSUWVINhjhZmzDmXPLP6dkfn5e2C0Uh9necSCION/UxbxGqkhjoqj
         rDHetFl2PR3Hcf51CaG+fmNEOVgZFaijYVDonqVybwN9zwwiIqDtwyitpKlcjM05vLNg
         QeZ7T0MB4OnYWtRAxyEJefo75iRKz6G9n3GUikY54BMUlw6zmngcZmbDhtX1Iha6+ZWF
         6n4mCOOL5XWssG0OPObszW5CNbIyuBbZFVgJqNKA2aWhge/nS98lGd0TEil2M+XlFaCu
         ENGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=JepL5gisFFTK3X2w7NBYJO1uq+LZx3keQw4RAMNU0kbDBvSlq4KCa0Z5d8ptBVJm/i
         2UwQae5L2RayxyRsb0bqWUtLUm4RPPRCIq0eaTq/imcOyH3mUpq90GjPzwuM5o4VPCRf
         dp/z5O0OjSTHssQXCWAcVae8txYU8ViOlzpKTv3eXDu9WHeCY1T8h1WfDScimwkLn1LP
         u8L3aImY4KH+89Olb0Wlf0jSkE525UO5ISSavUoVeteTXFS8BLBNeG8yvuDczx/PX9Xr
         XAbP+qv5beffKzyKyy+vmYnzZitdqhjDzlnRDwFDH/VQL4DdaNRZTm9oEzkAmx8mXv4z
         rsFg==
X-Forwarded-Encrypted: i=1; AJvYcCUFuA4yQ8pD5xzoczX6WgTkKysp8E9kpfEGwrWjriGUj4YR8cMp0494hG8MwWcSnlm624yNBh2mZAQWhZVV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy57y38TxDXV5RSMt2H73GfAnrXoYqwWsERpiduUMlxJpaxJIoW
	oMfsK+yzZqaWdVfn53Wxe1JOE2i/zhhOFuZHCjY2OO8YxIrEHRAvRwwr/JPEnAQ=
X-Gm-Gg: ASbGncur7M67XZRaOCjuYeds6dWq2i4cv5wxFVgDe2EH+l6cb3pZ+piOJGnoClc6hUa
	kCRTTmAtRm/SMiO8jLU3SlloYqhUCFlNJxyMuLGhUxFiKapJjTayLPp8tODvpWs6aXWCF08lrEa
	Bi2eijgl4+y9DlPRFKca9GNurLTR+6X9KdrusxcTlgOC8JCZ+a7xjjB/qQc62LlSNissQCtWEkc
	tlHNhJz7/X1BNaTpanTaCbeGa7fgPW+VHU8F15txGITbUsYANBLjMZqX9V/DbjydKNzjPze8sRt
	8qF35ldX6iqzDdo6JsbsJ2wVM0+PATT8XfZhfSrk8uxU0vs1G/u2Rz0jTJAO5E8ACZIq88nBZL5
	biOvC26f2Qw==
X-Google-Smtp-Source: AGHT+IGw8/Em8B8f2s0ytjmI+eWh2dyA3vFh7dmQ8lnXofAka3id8ECQEXS4gzzEIESeh9rUlyHc/w==
X-Received: by 2002:a05:6402:270d:b0:5de:5263:ae79 with SMTP id 4fb4d7f45d1cf-5e4d6adec08mr2881207a12.12.1740751646341;
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:20 +0000
Subject: [PATCH 07/18] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-7-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060727_810907_139C704E 
X-CRM114-Status: GOOD (  12.67  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLW00OHQ4Ni5jIHwgMTQgKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLW00OHQ4Ni5jIGIvZHJpdmVycy9ydGMvcnRj
LW00OHQ4Ni5jCmluZGV4IGRkNGE2MmUyZDM5YzczYjFjOGMzZjUwYTU5ZmQ0ZmZmYzBiNDUxMDUu
LjEwY2QwNTRmZTg2ZjllNmJlNzRlYjI4MjIyMmIyNzUxZGQ5MWNjN2UgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcnRjL3J0Yy1tNDh0ODYuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtbTQ4dDg2LmMKQEAg
LTQxLDcgKzQxLDYgQEAKIHN0cnVjdCBtNDh0ODZfcnRjX2luZm8gewogCXZvaWQgX19pb21lbSAq
aW5kZXhfcmVnOwogCXZvaWQgX19pb21lbSAqZGF0YV9yZWc7Ci0Jc3RydWN0IHJ0Y19kZXZpY2Ug
KnJ0YzsKIH07CiAKIHN0YXRpYyB1bnNpZ25lZCBjaGFyIG00OHQ4Nl9yZWFkYihzdHJ1Y3QgZGV2
aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgYWRkcikKQEAgLTIxOSw2ICsyMTgsNyBAQCBzdGF0aWMg
Ym9vbCBtNDh0ODZfdmVyaWZ5X2NoaXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHN0
YXRpYyBpbnQgbTQ4dDg2X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBtNDh0ODZfcnRjX2luZm8gKmluZm87CisJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0
YzsKIAl1bnNpZ25lZCBjaGFyIHJlZzsKIAlpbnQgZXJyOwogCXN0cnVjdCBudm1lbV9jb25maWcg
bTQ4dDg2X252bWVtX2NmZyA9IHsKQEAgLTI1MCwxNyArMjUwLDE3IEBAIHN0YXRpYyBpbnQgbTQ4
dDg2X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gLUVO
T0RFVjsKIAl9CiAKLQlpbmZvLT5ydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJnBkZXYt
PmRldik7Ci0JaWYgKElTX0VSUihpbmZvLT5ydGMpKQotCQlyZXR1cm4gUFRSX0VSUihpbmZvLT5y
dGMpOworCXJ0YyA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+ZGV2KTsKKwlpZiAo
SVNfRVJSKHJ0YykpCisJCXJldHVybiBQVFJfRVJSKHJ0Yyk7CiAKLQlpbmZvLT5ydGMtPm9wcyA9
ICZtNDh0ODZfcnRjX29wczsKKwlydGMtPm9wcyA9ICZtNDh0ODZfcnRjX29wczsKIAotCWVyciA9
IGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShpbmZvLT5ydGMpOworCWVyciA9IGRldm1fcnRjX3Jl
Z2lzdGVyX2RldmljZShydGMpOwogCWlmIChlcnIpCiAJCXJldHVybiBlcnI7CiAKLQlkZXZtX3J0
Y19udm1lbV9yZWdpc3RlcihpbmZvLT5ydGMsICZtNDh0ODZfbnZtZW1fY2ZnKTsKKwlkZXZtX3J0
Y19udm1lbV9yZWdpc3RlcihydGMsICZtNDh0ODZfbnZtZW1fY2ZnKTsKIAogCS8qIHJlYWQgYmF0
dGVyeSBzdGF0dXMgKi8KIAlyZWcgPSBtNDh0ODZfcmVhZGIoJnBkZXYtPmRldiwgTTQ4VDg2X0Qp
OwoKLS0gCjIuNDguMS43MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
