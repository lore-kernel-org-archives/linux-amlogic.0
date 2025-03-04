Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1792DC282DC
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsV9aN0DobnaXnt+UQ6hyD4z+ZhCqmsho0PPFkm/FsA=; b=RPcGhSstVD+/tq
	GkVJo164agRmXULhn2CIiHPolBts7IASyFwUYzm8z/Q2LIYrFT6COJYVT+lDq4kcG3C108cr6dg3F
	iu+oroffb3WodPOzID0BRE9IpWwf28fVDLv4CX5nKxYLJGC2+/xeAfN1IO6hne+4Q+2Fqt8y5hdKr
	kxXjT8awvniGiyJuT/c3EOksI+NebY+XI7CcXhcrcffoGve1D6EFM2QFCK1lOxWfkx/VQSqmE/+Tt
	Lgtnrb9D/SxGKpL2K1jHQnTwsgI8g8xNSr7t9Rm+DOBgaUMUV3DlNA4VmCOOMjrSXZapBWEq9Z5D8
	PB9xZdpfbKAkEdPzud1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXOC-00000005upN-2cCf;
	Tue, 04 Mar 2025 18:53:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViM-00000005YI4-0iNU
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=; b=o10Zj/sVM8UMTO6ahPhjFH1xrl
	zRR36Gmq7lg38uwhtu7lyNPLDtDPUibLU+5bvgKO3eURiqYVm+DfpNqpGifzx5LJL/FlWS7xSTohI
	U4XTbaaToqvachUzuw6TBYUjTc/BQKpxtW7Py1A3GKg71JJ7aOX/ivzV4gfcP8VZ468Ri6I/c7wfz
	A4RHc7iDxWwyFOx8hhDnpKLZzYdNsLpJ0X1VAZqGENtXNJLlgTA9qzOVMgRZHkeErL4k9Osbn40ZL
	3p6OU/B8W3GC01WDxgiZLzy22fQL6q+TeZK9aboZhotdzt/VafDtnVarAfxP3MByOGZ5zzOihgbof
	BjM/pNmg==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi6-00000002Cy1-03P4
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab771575040so1214216866b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=D2IHIbWXDPORjcb/qb+xsCxCoeS/0og4zCVqNBN+7G2HcnMs0iY/LKiu+ct5kzsNcC
         r0JJtmjgmelZaOFMflOXuB0a0YlGUq3GuKTPXHagDctR44wK5Nm0D+dxfWDfA7Vu53gU
         gxRxKx/a1ucDelKcxtX0CG6ccbLHIHUjjf7GWq7PpZbW5Vb95zX6BCh+0c0cfIcqw6TE
         SbhCVIp+bUAnmQd4dAsERfaSzYpvajCrgG8E0kLkFN/suQwiIRYsSKNQop35MtNse9d5
         yJeoIUoXysT5KETflPZAKBpZ31ldsMuXSRjw+xw4/8c8onTt0gubwNAOQElOfd64si/T
         FG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ1rnmYNsg12IhA38qEJtyyMHRjZg5dsRkHMsIbiHfY=;
        b=TmvtjFjUKKP5tKGtm7zg/wBqxyepSo20bj+fTZDd/BRlpuf0QHDPfTsVEFZuYHVIS4
         ZsnyelMovKgqVZPJkpr+jQZo4mKDpRXiK1S4Q5LSB2JoXf6wyz1ZPB0ndbftdsffLYRY
         TPcVkAMmdDlvIRta5OTSpDUyHHuDqE5J5t27vrNJImsmyxZ/PEE6tByqUOWFgvCaoHpm
         Jn72rbn4tHkX/nWLN1rLUPZ7/fgJtQ3C2BNyKaqqgJgPq6ZSXTjWkx0EG3Moxf/SchGY
         RjHnENUVrK81Fya0Evl4KYY5I1UE5izcBZe/wvAq2K1MxZzurX1uim+7g+NVi8sjq7DK
         DTQg==
X-Forwarded-Encrypted: i=1; AJvYcCXciPDbpa+zCexv7XXmimcdl43J0hyiynaaWMVluxLVrqsLDZ3HVZx8+1cQjQsj0PmKyi/PPt3TufcU+wX8@lists.infradead.org
X-Gm-Message-State: AOJu0YwVUDgQZOUfbtgxaRBVVuWPZgsZemjc87qbjxD55KNyRn0utlWw
	NuW1YbGeRlL3XtYN3YPpslqZmXsxRn6pzm/F/T8EAGS0CM2I+/Mf6Wk8eMJlvbs=
X-Gm-Gg: ASbGncvJ9RSjjdCxFqXb7uHdjT1FRh4R2GSaG80OES2M8JeC0WODH8OyCHYkjLTRXTs
	/k5mwTB29FjW5a/zuy1iruRv1ilML+BYpsRj3s4HEvT0zSX5HpsDfZrj6iwqoW0K0NEiDw3tEU7
	4yPn97izNhAAxW6nmuH867f1HwFzsSFiXB6bDBlSWo6hFkFr21WPWAKRuNb/f7j2YpEkA86qIaN
	vvwFmw+SMR7t4FDEOHuFWA3Y+Z4jmiGlYpDUKPHLOhmuy7TmoE/xlrftKOsDM5bMp6PlWQ12C7g
	j/RIET/FQt+07lK9XpR5XuwSJP+U429fqgEDa8CJ6YnplSBvIjH4B4HGdpDVm7+ntFV4LzDUAPY
	atFeGyx/zJFYmWj/RRBZZg99VrGvQ
X-Google-Smtp-Source: AGHT+IEctYzZlVVwQPucj8CUHKEVuZPV8n583Yq6QohmEvkW8JU3S9SRTA4/uuDakASHnMKJ8bAleA==
X-Received: by 2002:a17:906:3814:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-ac1f11e6c1dmr291303166b.21.1741107935167;
        Tue, 04 Mar 2025 09:05:35 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:34 +0000
Subject: [PATCH v2 06/16] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-6-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170538_180328_F9C382D8 
X-CRM114-Status: GOOD (  11.39  )
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

VGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5IHRoZSA6OnJ0Y19kZXYgbWVtYmVyIGlzIG1hbmFnZWQg
dmlhIGRldnJlcywKYW5kIG5vIGNvZGUgaW4gdGhpcyBkcml2ZXIgdXNlcyBpdCBwYXN0IF9wcm9i
ZSgpLgoKV2UgY2FuIGRyb3AgaXQgZnJvbSB0aGUgc3RydWN0dXJlIGFuZCBqdXN0IHVzZSBhIGxv
Y2FsIHRlbXBvcmFyeQp2YXJpYWJsZSwgcmVkdWNpbmcgcnVudGltZSBtZW1vcnkgY29uc3VtcHRp
b24gYnkgYSBmZXcgYnl0ZXMuCgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJh
c3ppa0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1mdHJ0YzAxMC5jIHwgMTcgKysr
KysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWZ0cnRjMDEwLmMgYi9kcml2ZXJz
L3J0Yy9ydGMtZnRydGMwMTAuYwppbmRleCBjYjRhNWQxMDFmNTM3ZTIwYTY4NWJiMDIyZTZmNjUx
NmIwZGY4MjcxLi4wMjYwOGQzNzg0OTU4ZTY5ZWMwZWNiZGI5ZmNjOGIzMzNiMTllN2NjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZnRydGMwMTAuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMt
ZnRydGMwMTAuYwpAQCAtMjgsNyArMjgsNiBAQCBNT0RVTEVfTElDRU5TRSgiR1BMIik7CiBNT0RV
TEVfQUxJQVMoInBsYXRmb3JtOiIgRFJWX05BTUUpOwogCiBzdHJ1Y3QgZnRydGMwMTBfcnRjIHsK
LQlzdHJ1Y3QgcnRjX2RldmljZQkqcnRjX2RldjsKIAl2b2lkIF9faW9tZW0JCSpydGNfYmFzZTsK
IAlpbnQJCQlydGNfaXJxOwogCXN0cnVjdCBjbGsJCSpwY2xrOwpAQCAtMTEzLDYgKzExMiw3IEBA
IHN0YXRpYyBpbnQgZnRydGMwMTBfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJc3RydWN0IGZ0cnRjMDEwX3J0YyAqcnRjOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZw
ZGV2LT5kZXY7CiAJc3RydWN0IHJlc291cmNlICpyZXM7CisJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0
Y19kZXY7CiAJaW50IHJldDsKIAogCXJ0YyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXpl
b2YoKnJ0YyksIEdGUF9LRVJORUwpOwpAQCAtMTYwLDI5ICsxNjAsMjggQEAgc3RhdGljIGludCBm
dHJ0YzAxMF9ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBl
cnJfZGlzYWJsZV9leHRjbGs7CiAJfQogCi0JcnRjLT5ydGNfZGV2ID0gZGV2bV9ydGNfYWxsb2Nh
dGVfZGV2aWNlKGRldik7Ci0JaWYgKElTX0VSUihydGMtPnJ0Y19kZXYpKSB7Ci0JCXJldCA9IFBU
Ul9FUlIocnRjLT5ydGNfZGV2KTsKKwlydGNfZGV2ID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNl
KGRldik7CisJaWYgKElTX0VSUihydGNfZGV2KSkgeworCQlyZXQgPSBQVFJfRVJSKHJ0Y19kZXYp
OwogCQlnb3RvIGVycl9kaXNhYmxlX2V4dGNsazsKIAl9CiAKLQlydGMtPnJ0Y19kZXYtPm9wcyA9
ICZmdHJ0YzAxMF9ydGNfb3BzOworCXJ0Y19kZXYtPm9wcyA9ICZmdHJ0YzAxMF9ydGNfb3BzOwog
CiAJc2VjICA9IHJlYWRsKHJ0Yy0+cnRjX2Jhc2UgKyBGVFJUQzAxMF9SVENfU0VDT05EKTsKIAlt
aW4gID0gcmVhZGwocnRjLT5ydGNfYmFzZSArIEZUUlRDMDEwX1JUQ19NSU5VVEUpOwogCWhvdXIg
PSByZWFkbChydGMtPnJ0Y19iYXNlICsgRlRSVEMwMTBfUlRDX0hPVVIpOwogCWRheXMgPSByZWFk
bChydGMtPnJ0Y19iYXNlICsgRlRSVEMwMTBfUlRDX0RBWVMpOwogCi0JcnRjLT5ydGNfZGV2LT5y
YW5nZV9taW4gPSAodTY0KWRheXMgKiA4NjQwMCArIGhvdXIgKiAzNjAwICsKLQkJCQkgIG1pbiAq
IDYwICsgc2VjOwotCXJ0Yy0+cnRjX2Rldi0+cmFuZ2VfbWF4ID0gVTMyX01BWCArIHJ0Yy0+cnRj
X2Rldi0+cmFuZ2VfbWluOworCXJ0Y19kZXYtPnJhbmdlX21pbiA9ICh1NjQpZGF5cyAqIDg2NDAw
ICsgaG91ciAqIDM2MDAgKyBtaW4gKiA2MCArIHNlYzsKKwlydGNfZGV2LT5yYW5nZV9tYXggPSBV
MzJfTUFYICsgcnRjX2Rldi0+cmFuZ2VfbWluOwogCiAJcmV0ID0gZGV2bV9yZXF1ZXN0X2lycShk
ZXYsIHJ0Yy0+cnRjX2lycSwgZnRydGMwMTBfcnRjX2ludGVycnVwdCwKIAkJCSAgICAgICBJUlFG
X1NIQVJFRCwgcGRldi0+bmFtZSwgZGV2KTsKIAlpZiAodW5saWtlbHkocmV0KSkKIAkJZ290byBl
cnJfZGlzYWJsZV9leHRjbGs7CiAKLQlyZXR1cm4gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0
Yy0+cnRjX2Rldik7CisJcmV0dXJuIGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShydGNfZGV2KTsK
IAogZXJyX2Rpc2FibGVfZXh0Y2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShydGMtPmV4dGNs
ayk7CgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
