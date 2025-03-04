Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A0C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vyu6XV5xx4pJvAn+yYOG9TJpWc+6FlRg7fDlmHk4xFA=; b=VCh9rU3MRCJgkx
	ZwidJKluASa5CqCdGzV/Sxf+MNh647g7FdDx/ESvoBtLjMgX+Jg1cYeKGLJr8AR/CmsQkzloo76BL
	3rcNpjsgmlF+Tv0O1bkF3832w/6JcBJRE0wLrbtujzR0UbzTGUWSZMpVavdZvUwrPueUZOEVdpvcA
	OvyS9bXSvAVJoaFapNMY/R8rJ+Ysy08ThlSgLaIpQX7HBpnR7wnHTQq2BX5YpSkPet335ALj7GBBX
	S1eXncf/HYk3gDZ3ZiE4HZO1uVWqBEY2r0Ig+m7DhDvEC8wdEqCtMcL+bxTx/vxncX6TYJ0a6lqH1
	iQGKpymDS862octBBupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX11-00000005qmI-15eN;
	Tue, 04 Mar 2025 18:29:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi2-00000005Y8g-1rAA
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e095d47a25so10385418a12.0
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107933; x=1741712733; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=Tv+6R42k9+VdSPd0W031MI4Ake7pCBNw/np5w+TFhNNnH3KEfHG2047cYBtMysqwo4
         M+sYPr1LaXMNmAGXDWAAwhw6Yw2ohfJSMhPxROG9uaNdfrJvC8OE15yW/fL3IUL2w5PJ
         Oc6KxiGGzj5b+L6G5KSVEG4JE5eqfetlyZXvJek1pYV5zI33mUOwdEvGWbi+0mY9PBoR
         MeBBxb0R+gmWCmxNXeqI6i4r4AvhU7DTtY06C85kaPo6c3ZPp4OYSgq9Pc6NZTlj+93y
         L6E/ogHM5WB8h2yqxiet7s6KSx/v8VamxlZsV6M7eNX6XrqjwCloKwDZ6zW10peMNmOy
         jWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107933; x=1741712733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXesqtK3A8i6ZSMFwP8n6Z6kZDUFNsTogrZxF0Gh9Ac=;
        b=JHvH/TgxF4vR+0NalpMiTcGkHFCLe4zTQNtTOMDXlhTwI8bzfXVWnTdO1J/1/jQIh/
         Le6YEBp5sLOzK4kGSRlAtjaW8QdflvgV2WcVjCqboySyEolp4Eg3h9Za6gPtF6I1jGg0
         ADUzr6TAkcVeKTWcrBHoUtkk4V5xdUp7481up1YQv0spcdMJ17XRuWcCwJ6mFHVuVLBI
         lTTf1CuK+4WZdIVx/kVNYEncq/Ubqu54egKHESeYdNbeTvHTXReCbQB4k9R2UGgfhmAU
         hgLGM/JR6lbco4kxXQlJBursayiw8R8ojlfBxcRogb7bTC9ZTHFP/b0IFjXq/Qp4S9kf
         psTA==
X-Forwarded-Encrypted: i=1; AJvYcCULUfGJt9bu96X3EL5ALOYe77ALKd0GfVmyHtm41qgItieKSYImjxlFNR5yDA3XOVgPO0KnV6nZFu+FAwr8@lists.infradead.org
X-Gm-Message-State: AOJu0YzIJn3vCNFV+piNq41BLnfzNjaQnvohJBN+5m3lkGj0Ed16awP7
	e57TC3s8irw/xc8SxdRONdL5Kr+DUfZdy0QWs+QQkar3n3ABy1fO63ksdgnYHKX8uLJm59L4GhF
	SOcM=
X-Gm-Gg: ASbGncts1XN2zfOuFQ6NoF7nCQjMxnn1G1ql4xIJYYip3FIR64+msk+xHYf2jQqJY/B
	OV0AD61CtudkbplxOE6BYBigYjfT9FsCcBTwySbPP2PTkqvvJodJRjS0g9Prpf1c0ZOAzX+eGEt
	5WUKQg2TNhyzB6SFSPQAXTv4Uq3es456ejJkFwSqr8uNkHqD/BDiAFmExm9Ot0xqUb/+mHwgtun
	drulzk4ABeGhP/Plx5+s9LuniumX9wCHY71CmFLGAB3YnxGOeIKdNXO/xdi6ZMyHv9CBwU0O77F
	qFuXQB0NTxeGl6l8xjZyxOhO09pIhS7B7J2NfFQQyo+oLtaA64SUC0xgt5SG3EEsayf10XQH3ms
	kaUNovW0BLbyB2xvVIvz/4yj7jr0H
X-Google-Smtp-Source: AGHT+IHVbcY6l9+JTAHHIw3fmIWanoQo+sapqWdolutCogJsq5sGcHSbYPT4D1lGvFYrwfxZJsMGVg==
X-Received: by 2002:a17:906:f5aa:b0:abf:59a3:df19 with SMTP id a640c23a62f3a-abf59a3fa56mr1580793966b.57.1741107932647;
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:30 +0000
Subject: [PATCH v2 02/16] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-2-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090534_481747_FF9A2368 
X-CRM114-Status: GOOD (  13.93  )
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

V2hlbiB0aGlzIGRyaXZlciB3YXMgY29udmVydGVkIHRvIHVzaW5nIHRoZSBkZXZyZXMgbWFuYWdl
ZCBpMmMgZGV2aWNlCmluIGNvbW1pdCA3ZGI3YWQwODE3ZmUgKCJydGM6IHM1bTogdXNlIGRldm1f
aTJjX25ld19kdW1teV9kZXZpY2UoKSIpLApzdHJ1Y3QgczVtX3J0Y19pbmZvOjppMmMgYmVjYW1l
IGVzc2VudGlhbGx5IHVudXNlZC4KCldlIGNhbiBkcm9wIGl0IGZyb20gdGhlIHN0cnVjdHVyZSBh
bmQganVzdCB1c2UgYSBsb2NhbCB0ZW1wb3JhcnkKdmFyaWFibGUsIHJlZHVjaW5nIHJ1bnRpbWUg
bWVtb3J5IGNvbnN1bXB0aW9uIGJ5IGEgZmV3IGJ5dGVzLgoKUmV2aWV3ZWQtYnk6IEtyenlzenRv
ZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1i
eTogQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4KCi0tLQp2MjoKKiBm
aXggYXJndW1lbnRzIHRvIGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoKSAtIHRvbyBlYWdlciBz
ZWQgLy8sIGFuZAogIGdjYyBkaWRuJ3Qgbm90aWNlLCBvbmx5IGNsYW5nIDotKAotLS0KIGRyaXZl
cnMvcnRjL3J0Yy1zNW0uYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMt
czVtLmMgYi9kcml2ZXJzL3J0Yy9ydGMtczVtLmMKaW5kZXggMzZhY2NhNWIyNjM5ZTI3MmRkOWJh
ZWQwNmVhNTU4MmY2MzU3MDJiMC4uODhhZWQyNzY2MDM0OGEwNTg4NmYwODBhMjg0OGZjYWJiZjk2
NjZkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLXM1bS5jCisrKyBiL2RyaXZlcnMvcnRj
L3J0Yy1zNW0uYwpAQCAtMTQ2LDcgKzE0Niw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgczVtX3J0
Y19yZWdfY29uZmlnIHMybXBzMTVfcnRjX3JlZ3MgPSB7CiAKIHN0cnVjdCBzNW1fcnRjX2luZm8g
ewogCXN0cnVjdCBkZXZpY2UgKmRldjsKLQlzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjOwogCXN0cnVj
dCBzZWNfcG1pY19kZXYgKnM1bTg3eHg7CiAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwogCXN0cnVj
dCBydGNfZGV2aWNlICpydGNfZGV2OwpAQCAtNjQwLDYgKzYzOSw3IEBAIHN0YXRpYyBpbnQgczVt
X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBzZWNf
cG1pY19kZXYgKnM1bTg3eHggPSBkZXZfZ2V0X2RydmRhdGEocGRldi0+ZGV2LnBhcmVudCk7CiAJ
c3RydWN0IHM1bV9ydGNfaW5mbyAqaW5mbzsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjOwogCWNv
bnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY2ZnOwogCWludCByZXQsIGFsYXJtX2ly
cTsKIApAQCAtNjc1LDE0ICs2NzUsMTQgQEAgc3RhdGljIGludCBzNW1fcnRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiAtRU5PREVWOwogCX0KIAotCWluZm8t
PmkyYyA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoJnBkZXYtPmRldiwgczVtODd4eC0+aTJj
LT5hZGFwdGVyLAotCQkJCQkgICAgICBSVENfSTJDX0FERFIpOwotCWlmIChJU19FUlIoaW5mby0+
aTJjKSkgeworCWkyYyA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoJnBkZXYtPmRldiwgczVt
ODd4eC0+aTJjLT5hZGFwdGVyLAorCQkJCQlSVENfSTJDX0FERFIpOworCWlmIChJU19FUlIoaTJj
KSkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWxsb2NhdGUgSTJDIGZvciBS
VENcbiIpOwotCQlyZXR1cm4gUFRSX0VSUihpbmZvLT5pMmMpOworCQlyZXR1cm4gUFRSX0VSUihp
MmMpOwogCX0KIAotCWluZm8tPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGluZm8tPmky
YywgcmVnbWFwX2NmZyk7CisJaW5mby0+cmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoaTJj
LCByZWdtYXBfY2ZnKTsKIAlpZiAoSVNfRVJSKGluZm8tPnJlZ21hcCkpIHsKIAkJcmV0ID0gUFRS
X0VSUihpbmZvLT5yZWdtYXApOwogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYWxs
b2NhdGUgUlRDIHJlZ2lzdGVyIG1hcDogJWRcbiIsCgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1
YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
