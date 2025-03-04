Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB20C282D9
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=honpLzeJN9HARrQ1SV4QPdzugwa15bIeIM+VCyykdk0=; b=bBBPfbDSx/Ha3V
	Bjn6WkRwJEpEA36dTGbdFqvBS0qhB52RF1Ftb1iXVH6Fe0Nq9/wj3/WuCj9rgk60lHWAvwnT0E3CT
	0pOnU/3zfT+ezePyOl7pm2upd6N6BnEOOuDe/s5W70oiwoOG+jdydNiIRpV8bfbEOGUcYNCA6ZF/3
	DWMl2Q+AClfvImd3iHpKMPWdcYTUhDGF5y+bEFu0JvmAhR03e2TIZ2Exr0NLMwNTBdMTN83SL/Kjo
	TFbmjxivO9mePv9G2MPuyfaLybsH+s4V1HVNx/8k5EJ2nluV+6lDCt1cQG3FpCKtwm6T8j0fNrEO7
	10puTIShM/enwHq0WmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX2Y-00000005r8q-3kx0;
	Tue, 04 Mar 2025 18:30:50 +0000
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi5-00000005YAu-3lrn
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:39 +0000
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abf57138cfaso615829266b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107936; x=1741712736; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=LpeJEz0R5X8T2QR7pofOV8gJkBUXWjwn/cXKloeQc/IAeyCvcl3y/GyhTz8iC+6XWm
         7vlmZDl96pjxW07cDgJQpnC+ZC0omY4n/9vZ4fxBMiuQesFE5wOvuFjyf6a6H56tlTwi
         03CQJqSfZX2DUVV4Wx3TDJjhq+INjqauYZB8OUE0jHg2xbuHl5DCtzYydLY3xX3ilmc9
         u6ciP35/VbpUtmGDCE+OUA3gkaqPpcFG+/q9zWyE1ZwLKXmwtwyZpRrk1OZol6J04aWN
         BIJ5kVb5fLNeCaoevFCD5UENx5zqf+Es5adMIqUIVLirE9Ov1UL177i5jBlJ3sjNRLez
         JT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107936; x=1741712736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgG/ZB1ufhyJ5LLnH+TbRO+Ff9QR7sb5p8sH4cYGYcE=;
        b=G2KDr80Dm3ruSdr/UG1fYZaVW8F+oETIZMOrPPUW40nQCeLJaGY5GE6MmWL3Hg2QRC
         TZU63H2sj0fW35XUKllugGSS5wyp50bIrqpWvqdRShLsoporm6oVRLjPG8XXkY6zkKV3
         fdQa5Md9ooFlOHCalNq/S2VnKDSdRpiMh7ExotqbtkKwTMXmOsOK9o2BmUY7mC9Fe2Wb
         JS+u+aHZsMOTrwVjhyMn8Bb1VxyBjGxthdlQ7Cor/xd7r9EERgHSHv7/EZutiMNIN0yT
         exTSnfeIPjGYy7dboWE2PHZlKBnXeUAsO/k4BGSiUZ7zm9VKUQKJQ12t20z6UoaOHsJ0
         kdPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+c/W0vPbepX0g97JYzGfaD+vYt6s1sIAZHxPgFoZSAnlQCxp3bieo6XTYwL45GRDAona22+ik/P4RGaD8@lists.infradead.org
X-Gm-Message-State: AOJu0YxSBRsCArUhNihUwjOzfRwCOuyVln5sOkrWShvhwmcaU6TbJN/s
	/Q6rJY8KCBNJNJ/dKimPSkZQhF0TCNPgbV+j/kPl4V2gX5/6E/t0Mh3EFh825NI=
X-Gm-Gg: ASbGncv+Ivjs3Y3mhPlTHEw7qdw0HIuisrUJAmcwtAT5hbJzYqKk7Q4Wp1nt0MAFc/z
	KanlSnYy2CW7teYj6A8st0G3m5XQCimlofsneDNXt4Bzw1BXszRAN03xmEgbjqJSu3K/Nrs15L7
	MO2BiHvneqGiuDXYponl4MCea5+2YzMFOXSV1kOzzUOjOi/5s/rPicHFxM+5/oYW2kzF6mev4QK
	NFibK2Valu5ipdL0CcS8vJrg1O0Evx1V7L/CddSw70is0G5rFDaLIABN+R/SRJjKnd/zLW0DSMO
	yeAHiOxvw68HjLF/uu625qA2Qa8tiuEoSnKhdSEpVMoYsmFhFiyPgZttz1iq7HbjzRLkTMhRC32
	VglR/cby7X6QU9bOQw1FnNax9UjSt
X-Google-Smtp-Source: AGHT+IEZSM7e60umftuoTA+5yHKxOw5bEfyTXKI9tFiIm+4qyPCIhcf70tbw/wLp28VjnQQVfyBtmQ==
X-Received: by 2002:a17:907:c2a:b0:abf:6b30:7a94 with SMTP id a640c23a62f3a-abf6b58f60cmr1276559166b.45.1741107935884;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:35 +0000
Subject: [PATCH v2 07/16] rtc: m48t86: drop needless struct
 m48t86_rtc_info::rtc member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-7-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090537_939638_D153E88B 
X-CRM114-Status: GOOD (  13.40  )
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
