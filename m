Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ED5C282C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q0DUtJQayzMji9fK8ZIB26oXtujUBPjujfnaGO2QKQ=; b=jySHxo8N7bLQpa
	rPzaOR0preRifIOs+s0uD2zyDtYwTd0TJ4qqtS6C1NmO9Aiw2ZLLkEdRCzlJmCRFttOj7itI7AXtv
	/7pLTrYz56ndWTjb1ssNTjvigWr04ydzmZ2f4RgUdEV0OfB7KI/5y7a6AXiOEoJBDlMx+KHX7IFNi
	kKfZzLs3DqcRa1VwhrYXZIA6GYj/GJYp0TvCivd41IQg6YvQD2yIH/yW7G/3UZIFGX3/+DIoKIZbB
	n71JyOAX4ZS4GKDEZwZ5ejJ5+kffNNLuRZmllEbTAQGASIaGXEtJU/5RYfPa3gg/mhiPQnXcvBTtG
	IbqgFVxP9cHm1yzqP+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to16H-0000000BCZv-2sc6;
	Fri, 28 Feb 2025 14:12:25 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11R-0000000BB3g-0gNH
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e4b410e48bso3226213a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=cRR+sLzvYmRpnUm8TutgPqD8mFWYqWuH2uzh48t0dexjeT9733sszbXz/8Y0v99P60
         EILafaEk2Geen28LLpCTLlcV1vaZ4itBLoy8SH6Hd7VtOFdKKOXHpd4S/xQ/IOzTh/S8
         j9+P9hKUXVI69aJdlXjjBJpn+6NW5A/6PPDX8i1IxDwFl9kzXuoaU+7R5Wop44zgcKha
         ZVspKwFr0SXsQQO/qVdC7KkgPv+PE5yDi1zOf5qHs/rRrXhvMo4sEkN0ztRBaLpW9977
         43bXPqCOoG5cg4kMBgFum2/vg6TWSu44VShcYLdD5Q7U/taTUpWThtoz5oj5KWo9ReiE
         gdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEusmS+5iWAG1jDnjFt/eyKJ89b8w4e+6UytiCX0MQA=;
        b=mxAJ8zlYMnatdN3YLRz1Lfz1Q+5w4bCDcTAUeeZSl0uIktHEN3e8hDbV5F6h78IIK9
         flUAF/366LItZ3jzGrnDvWLR4tgtyTi3+h6htW+875NehSWU9cztpNDqkSxj4+7f/eme
         RdVphEhHdekQEYbaPvoo+nqPMwQPfLAVouUV09Uj/lyYhAyFuxgzrkSlq/KsBrUNUvFs
         Lx2Ot3KnCAKl4bszqnJ3B+lhFlXT9wRMEj7Cvwa+YpKQ3o0j6aEUqcm7EfcoaQk1cuU/
         B3igtm6Z+bcN07oMA6b1lEG/QjInMPqmc5DZ22kh4W1zCF5No9uWWDQ9qCEZzUo5Shve
         jbIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXNjAVv42U4c5PQsHTBGwu7+oXAi/63LrrzAQRROYt55ANP1xiUslOABZmWS6e8uckPyZPunn2WN30gY17@lists.infradead.org
X-Gm-Message-State: AOJu0YzE2iHlYe9qm8Oy3nFMZypvGxj87WDrc8NzYiuuqjF6iD7Ren5n
	k1yile33ZO5EI1GWYQVi95yZJuaaGi/DM08uH/jVyiYynmcAxTfVS1EBsPE15bY=
X-Gm-Gg: ASbGncvR04+LBS5XEVhurZUopVCi12SDkIKGTZdbH/zQXQ7MgFsp/9ruC8J300EzfEn
	zeLo1Pt2r7f9rQtcDE5DIt81kHmiFgrGerMTt7PktP6SXawb66hk2jolN8V31uXnsiHUIOVbX7J
	pZkuAa6hcvO35gwCNawiabYazRxJ/9S4KMYOs/pcvaQkw9uagjoSFdm6KJ1szNJc5zNE2/rAkVV
	rBTP9z9H2vNME9Cian1KTe6OKRJ1213A2E+QbNJ9sYOd3X+raq3q0DcmI0NWn5FHMiLqFrPGFCn
	3oz1VwQw9AeUQy5c8SMOKEfFkuItVJiKBp0POfghbQ3xE4yGrZ/g2QFiWSLmtt0MzQhU5iP3BjW
	VBN3lhQBJ4g==
X-Google-Smtp-Source: AGHT+IHzPJx5i3RI7O2yaVdHtPJ0az692A2jfkouiK94jhHcaAYqi/2J0zpg5aMdk74cXIZT8BcCug==
X-Received: by 2002:a05:6402:42cb:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5e4d6af0565mr2697422a12.11.1740751643440;
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:15 +0000
Subject: [PATCH 02/18] rtc: s5m: drop needless struct s5m_rtc_info::i2c
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-2-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060725_223673_98E72595 
X-CRM114-Status: GOOD (  13.18  )
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
bWVtb3J5IGNvbnN1bXB0aW9uIGJ5IGEgZmV3IGJ5dGVzLgoKU2lnbmVkLW9mZi1ieTogQW5kcsOp
IERyYXN6aWsgPGFuZHJlLmRyYXN6aWtAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3J0Yy9ydGMt
czVtLmMgfCAxMiArKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXM1bS5jIGIvZHJp
dmVycy9ydGMvcnRjLXM1bS5jCmluZGV4IDM2YWNjYTViMjYzOWUyNzJkZDliYWVkMDZlYTU1ODJm
NjM1NzAyYjAuLjc3ZGQ2MWMzMDY4MWI4ZjBhMmYyMzA2M2FkNWY3ZWI1MmY1YjcxNTggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1zNW0uYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtczVtLmMK
QEAgLTE0Niw3ICsxNDYsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHM1bV9ydGNfcmVnX2NvbmZp
ZyBzMm1wczE1X3J0Y19yZWdzID0gewogCiBzdHJ1Y3QgczVtX3J0Y19pbmZvIHsKIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXY7Ci0Jc3RydWN0IGkyY19jbGllbnQgKmkyYzsKIAlzdHJ1Y3Qgc2VjX3BtaWNf
ZGV2ICpzNW04N3h4OwogCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKIAlzdHJ1Y3QgcnRjX2Rldmlj
ZSAqcnRjX2RldjsKQEAgLTY0MCw2ICs2MzksNyBAQCBzdGF0aWMgaW50IHM1bV9ydGNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc2VjX3BtaWNfZGV2ICpz
NW04N3h4ID0gZGV2X2dldF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOwogCXN0cnVjdCBzNW1f
cnRjX2luZm8gKmluZm87CisJc3RydWN0IGkyY19jbGllbnQgKmkyYzsKIAljb25zdCBzdHJ1Y3Qg
cmVnbWFwX2NvbmZpZyAqcmVnbWFwX2NmZzsKIAlpbnQgcmV0LCBhbGFybV9pcnE7CiAKQEAgLTY3
NSwxNCArNjc1LDE0IEBAIHN0YXRpYyBpbnQgczVtX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gLUVOT0RFVjsKIAl9CiAKLQlpbmZvLT5pMmMgPSBkZXZt
X2kyY19uZXdfZHVtbXlfZGV2aWNlKCZwZGV2LT5kZXYsIHM1bTg3eHgtPmkyYy0+YWRhcHRlciwK
LQkJCQkJICAgICAgUlRDX0kyQ19BRERSKTsKLQlpZiAoSVNfRVJSKGluZm8tPmkyYykpIHsKKwlp
MmMgPSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCZwZGV2LT5kZXYsIGkyYy0+YWRhcHRlciwK
KwkJCQkJUlRDX0kyQ19BRERSKTsKKwlpZiAoSVNfRVJSKGkyYykpIHsKIAkJZGV2X2VycigmcGRl
di0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBmb3IgUlRDXG4iKTsKLQkJcmV0dXJuIFBU
Ul9FUlIoaW5mby0+aTJjKTsKKwkJcmV0dXJuIFBUUl9FUlIoaTJjKTsKIAl9CiAKLQlpbmZvLT5y
ZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X2kyYyhpbmZvLT5pMmMsIHJlZ21hcF9jZmcpOworCWlu
Zm8tPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGkyYywgcmVnbWFwX2NmZyk7CiAJaWYg
KElTX0VSUihpbmZvLT5yZWdtYXApKSB7CiAJCXJldCA9IFBUUl9FUlIoaW5mby0+cmVnbWFwKTsK
IAkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIFJUQyByZWdpc3RlciBt
YXA6ICVkXG4iLAoKLS0gCjIuNDguMS43MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
