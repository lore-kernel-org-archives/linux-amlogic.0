Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD74FC282C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLIJqLZw5Ov8NVcIuXN/A4NqJfqK1+Qtfb4NRTQ1R2w=; b=mJHxPF8n7L98tf
	TryqL91e2ALN9X224HLiwrsJtdMHHm8y+R+RfUDWd56DJ7eddFbSVjSYsOd+NRLbKdvp36pSKtCFM
	N3sxk1djkvQrbcrbHQSnSuG3Us/KJQeN+gQMVC0Y8CCdHReQofm5ZYuYZn8WRSAL6o+RIv/npGFHo
	Y7/K9Cik7+Cx4I3zeBMIUeaqn323Re2VRXSrgcuIHNWGp1Ek8tLC81Etp5UEao5FTbHnat132UL+6
	jbD9rncGC02CVI2WYzS5y5yy579eB7cyhsR+A0QSMqhbNDnj/dtWC5InfTwjQSj9D6QRLGZYoHuBH
	vlTD0PlzNzrBkufpc5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1Rn-0000000BHhf-48p5;
	Fri, 28 Feb 2025 14:34:39 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Z-0000000BBEF-3N6J
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e0573a84fcso3088457a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751652; x=1741356452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucCmymGJlfsI4F5PNnMG7qiqKtfzqtFmwv0m9GhXqKs=;
        b=oU+GIRwMvYl1Jj98PGNUWsIeEfT8gDu1c/ELNwP1z82DC8+yZcKG9KhP82pTWOVAC9
         lFKAtNpvoCNFGsHOJ8xYglTbY43BIeQqxfp1TxWB1ixtEdkb6fBViI6Ugc6izyNM5+C5
         skvp27d/cPeCvReeCC7lLU3Jb52GfiBq3Uow0ldLy7zMpVMGW3Jq1QyisB7DaAOHkDCI
         Xzo5i8RnIGEbnOgeBJAyLsgdHtHujBpY4Z18RVBZ3/hlmSXUcUtNMKwQq0WXtiXeX/yR
         MtjvedvfxB54utRnzAxp3IcSuAjY4hrug9hrGRE8/OuHxh0w2Wr1WxiLxkonOkCL9Sm1
         hwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751652; x=1741356452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucCmymGJlfsI4F5PNnMG7qiqKtfzqtFmwv0m9GhXqKs=;
        b=HN7RZsn+AX5wPBbULdxgq/nQiXCgBewX0muKwX+vjR8DgkwV/cPcfVCtW3Htt60Kzv
         egnCyy+tsQQAS4WOH+GTl0ADr6bPKSooEjiZEEVv8PqVnIP0pjEirKs5enSGJ0OwUhdH
         bcn728lS6WoWwglap7rc5AM+FzoKWzDVCfx6pfJWQFPdKhosAAkpCripXtEneUioLiBj
         PudmgLnxJ6JH0Y+S4AwAXGMAAPTFkB1fsciew9D/dg9eQNijln9hnxMJKBfFJ/3LtxYx
         BGy9Z9faJYaYiZCdI5nf8v8Vg960ekDy2sRpBABgJA8rZDDZNTXu7bkGQzDQYeTaNqmZ
         DfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+2NJhHMMPnQYRhYYq9xWzj4M3WkVmacf0O8ch/osOBM1reF9XzZOTT7C2BxuHTtcvKtGJepQlqyCFOEaD@lists.infradead.org
X-Gm-Message-State: AOJu0YyEVy845KhnIVI51Js0u96w/cLZN5R4yX41apt2S88QA+RVkkxt
	6XWpmw+hkhDJJswBi3DTrisuH2bQdKYdIKgPsYLqNSgKVGQTPVbUD3qUnJUBJmA=
X-Gm-Gg: ASbGncsfyua3qhpePlVa+u4bbP0zzW46IqlYD5NFfD8dFYNwL3gucJErixiKUrDO3ZS
	9/VzfS41krRcrYTVg18ubJslsDknZ62faYCeRkuB9JE/lA/cUuCmL8edsvuOvmh/nIT3tgXha6Q
	L8o6AjRCQwWCfJiWhLTd8FD5jv1Ljo0Ua95WG1GVAzLRAwjzmxySZe0w7zAynzcPO7DwRU7QP/t
	MVf6nPFebugbPN07702jEapPGOzs7Inmeky316cqf0D8BeO8pe+iQbDWnVGgBR2xqDSXwyynBoL
	MhobpEdDcGipgVVN1OGQdYkXb7KN7c1lR09TqdqK3yVSphKSsiyNCQdeYaBEhOkSe0W/oHAZqkN
	Bjgg8z/e7uw==
X-Google-Smtp-Source: AGHT+IHUtKBxx/Kb6wMivayuykLjA27f1K+WzySysSQHyW8EvpaAIClZC0PRyUOpjP+2MS95jX29jw==
X-Received: by 2002:a05:6402:35cd:b0:5db:f5bc:f696 with SMTP id 4fb4d7f45d1cf-5e4d6ad3e14mr2592499a12.5.1740751652457;
        Fri, 28 Feb 2025 06:07:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:31 +0000
Subject: [PATCH 18/18] rtc: s5m: convert to dev_err_probe() where
 appropriate
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-18-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060733_843122_19C480B9 
X-CRM114-Status: GOOD (  12.99  )
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
ZHJpdmVycy9ydGMvcnRjLXM1bS5jIHwgNTAgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAy
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtczVtLmMgYi9kcml2
ZXJzL3J0Yy9ydGMtczVtLmMKaW5kZXggNzdkZDYxYzMwNjgxYjhmMGEyZjIzMDYzYWQ1ZjdlYjUy
ZjViNzE1OC4uNGM2NmUzODE0NWIwMjYzOGM0ODY4NTU4MGM3OTQzYmRmNzliZmJkNCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ydGMvcnRjLXM1bS5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zNW0uYwpA
QCAtNjI2LDExICs2MjYsMTAgQEAgc3RhdGljIGludCBzNW04NzY3X3J0Y19pbml0X3JlZyhzdHJ1
Y3QgczVtX3J0Y19pbmZvICppbmZvKQogCX0KIAogCWluZm8tPnJ0Y18yNGhyX21vZGUgPSAxOwot
CWlmIChyZXQgPCAwKSB7Ci0JCWRldl9lcnIoaW5mby0+ZGV2LCAiJXM6IGZhaWwgdG8gd3JpdGUg
Y29udHJvbG0gcmVnKCVkKVxuIiwKLQkJCV9fZnVuY19fLCByZXQpOwotCQlyZXR1cm4gcmV0Owot
CX0KKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoaW5mby0+ZGV2LCByZXQs
CisJCQkJICAgICAiJXM6IGZhaWwgdG8gd3JpdGUgY29udHJvbG0gcmVnXG4iLAorCQkJCSAgICAg
X19mdW5jX18pOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTY2OSwyNiArNjY4LDIxIEBAIHN0YXRp
YyBpbnQgczVtX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlhbGFy
bV9pcnEgPSBTNU04NzY3X0lSUV9SVENBMTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLQkJZGV2X2Vy
cigmcGRldi0+ZGV2LAotCQkJCSJEZXZpY2UgdHlwZSAlbHUgaXMgbm90IHN1cHBvcnRlZCBieSBS
VEMgZHJpdmVyXG4iLAotCQkJCXBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldiktPmRyaXZlcl9k
YXRhKTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5k
ZXYsIC1FTk9ERVYsCisJCQkJICAgICAiRGV2aWNlIHR5cGUgJWx1IGlzIG5vdCBzdXBwb3J0ZWQg
YnkgUlRDIGRyaXZlclxuIiwKKwkJCQkgICAgIHBsYXRmb3JtX2dldF9kZXZpY2VfaWQocGRldikt
PmRyaXZlcl9kYXRhKTsKIAl9CiAKIAlpMmMgPSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCZw
ZGV2LT5kZXYsIGkyYy0+YWRhcHRlciwKIAkJCQkJUlRDX0kyQ19BRERSKTsKLQlpZiAoSVNfRVJS
KGkyYykpIHsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBm
b3IgUlRDXG4iKTsKLQkJcmV0dXJuIFBUUl9FUlIoaTJjKTsKLQl9CisJaWYgKElTX0VSUihpMmMp
KQorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKGkyYyksCisJCQkJ
ICAgICAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBmb3IgUlRDXG4iKTsKIAogCWluZm8tPnJlZ21h
cCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGkyYywgcmVnbWFwX2NmZyk7Ci0JaWYgKElTX0VSUihp
bmZvLT5yZWdtYXApKSB7Ci0JCXJldCA9IFBUUl9FUlIoaW5mby0+cmVnbWFwKTsKLQkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdpc3RlciBtYXA6ICVkXG4i
LAotCQkJCXJldCk7Ci0JCXJldHVybiByZXQ7Ci0JfQorCWlmIChJU19FUlIoaW5mby0+cmVnbWFw
KSkKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihpbmZvLT5yZWdt
YXApLAorCQkJCSAgICAgIkZhaWxlZCB0byBhbGxvY2F0ZSBSVEMgcmVnaXN0ZXIgbWFwXG4iKTsK
IAogCWluZm8tPmRldiA9ICZwZGV2LT5kZXY7CiAJaW5mby0+czVtODd4eCA9IHM1bTg3eHg7CkBA
IC02OTYsMTEgKzY5MCwxMCBAQCBzdGF0aWMgaW50IHM1bV9ydGNfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKIAogCWlmIChzNW04N3h4LT5pcnFfZGF0YSkgewogCQlpbmZvLT5p
cnEgPSByZWdtYXBfaXJxX2dldF92aXJxKHM1bTg3eHgtPmlycV9kYXRhLCBhbGFybV9pcnEpOwot
CQlpZiAoaW5mby0+aXJxIDw9IDApIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0
byBnZXQgdmlydHVhbCBJUlEgJWRcbiIsCi0JCQkJYWxhcm1faXJxKTsKLQkJCXJldHVybiAtRUlO
VkFMOwotCQl9CisJCWlmIChpbmZvLT5pcnEgPD0gMCkKKwkJCXJldHVybiBkZXZfZXJyX3Byb2Jl
KCZwZGV2LT5kZXYsIC1FSU5WQUwsCisJCQkJCSAgICAgIkZhaWxlZCB0byBnZXQgdmlydHVhbCBJ
UlEgJWRcbiIsCisJCQkJCSAgICAgYWxhcm1faXJxKTsKIAl9CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2
ZGF0YShwZGV2LCBpbmZvKTsKQEAgLTcyNCwxMSArNzE3LDEwIEBAIHN0YXRpYyBpbnQgczVtX3J0
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXQgPSBkZXZtX3JlcXVl
c3RfdGhyZWFkZWRfaXJxKCZwZGV2LT5kZXYsIGluZm8tPmlycSwgTlVMTCwKIAkJCQkJCXM1bV9y
dGNfYWxhcm1faXJxLCAwLCAicnRjLWFsYXJtMCIsCiAJCQkJCQlpbmZvKTsKLQkJaWYgKHJldCA8
IDApIHsKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byByZXF1ZXN0IGFsYXJtIElS
UTogJWQ6ICVkXG4iLAotCQkJCWluZm8tPmlycSwgcmV0KTsKLQkJCXJldHVybiByZXQ7Ci0JCX0K
KwkJaWYgKHJldCA8IDApCisJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCByZXQs
CisJCQkJCSAgICAgIkZhaWxlZCB0byByZXF1ZXN0IGFsYXJtIElSUSAlZFxuIiwKKwkJCQkJICAg
ICBpbmZvLT5pcnEpOwogCQlkZXZpY2VfaW5pdF93YWtldXAoJnBkZXYtPmRldiwgdHJ1ZSk7CiAJ
fQogCgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
