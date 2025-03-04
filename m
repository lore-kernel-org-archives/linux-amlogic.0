Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E414C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xB3rYYB0w3eqMRwA50PS2JgaMaRfZCUkS9BEipI31uw=; b=4PPXJdSigN+BGZ
	7Njfand3u7opTTRfLaVu+aKDWkKElrY1LGCvKz9Jw64RGuArhhHYeA/cvYSnZR1AydVy+0NllgwBB
	+eXw6V8TOANZSFv9OhhtaB6PeqGGe02ll07GIfMXMozZpIytuekWpV3RAG8GdiPqH+DYCs/013y/d
	dHHVk+62qq7ktyQEqlxbKD9pDCV0vWY+xBQYyGWCzj0MFDD+GFyQWc3FhPvGHAEuABpYOO1RRmxNW
	FNG/D8iQisDnngtmLVtNKLOalRw97SU481DL9R2A2rUjSrY6lcD0twx7S95jYsRgNZ7nRa9uZ9Rv5
	3uTdqL4R3OilxmMGzdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXPl-00000005vG9-2ZW7;
	Tue, 04 Mar 2025 18:54:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViM-00000005YIH-3XDT
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=; b=MTQBdKZXbR0HVBdKhmKeVdWH2g
	35FpDic58Uqo4DTVKm318uIYAnhK8rs3EeyOKC5zfmivqILHp7gZ1EiK0NMxFxjDwr6ofdJfYCDQE
	Cwih5kBJ3obuHf09L+fDD3YDyEwn9bizsd84/quGGYJESJ/9DQnKxU1vXigTm03ksO8r/ST++r40b
	FUIQSBgWwaVy0DzSgZTxkB/EOhLOYjyHHX86JIFe0e7B7OZt/IDA8/geEbZwvB0qGsl7qcphH9m0b
	gfofbRIo02/c2ljiev63OzwcXLEG1G1xERZkB0/VUzgCQB1XaJkqSDOMbnvAdWhLEk5R6LqnZTNWG
	rLyifI1w==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViE-00000002D1x-0QgT
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aaedd529ba1so677693866b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107941; x=1741712741; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=fIVFRFcTOlTcsXQITbuSZPKycKETPy6etpRNYPmYcYMdPGyVD/iQn5MbbfQiay1UPZ
         FFu2z2tEk1YJHlVtAMi82nvxmkCJ0TJz/e4wsHkgzt+IFzxsZqM1eYSa/Mx1Azaiu7Og
         zLDMsPnfKH7vbvX9HfuljultEvLmZrvQiwrSkm7Pn5mCyWwUKKoCkzeRdhZRTVAKqVwe
         gW7FtEcB+0gEEUeEJESG7WWiiZYcKYxRCFRMFCZJtwO+1N10troJgKaG7BrMY/4LJ0mq
         FKAXFgZizKTVzQRlCzb+aB6pmzPlBak8HNgH8HHJFMjNxRfgGhyAluIERb8gSir9vWeD
         43VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107941; x=1741712741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDySvxIgslRZrTqVd7bcfGaor7CHMjwsKayUWf5uR70=;
        b=IRccvz2vV3F2atZINUp6s79Af4xL62anZK90cl9qWG4jfwGvHwyZ8yphQGHkUo5REt
         YvgYgJRP2vMDrpjdGOL7sShlHsU9jvMbbBY/7wNl3f/GcgGJwR7DOAZEbtfp7B3M7INP
         xYWl0Ay8jcVnUS+GmANj9WofaaMliZjvxJES2Lpw/X9utuVf5ISTXxJzXG80fY/Kei6/
         ML2aUrNQDthSmLQeCjuG4CCGszdNWhE7DSFirmeYHZuC+lB33S75xycZO5tLdPumjXTk
         siyCHIYCc8GXlmAXnguWGlEWD4T9lW5PFzQyJzDNSHkTyZsqYclgb8gMLzyhIk8nurYw
         wSWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUpThh76TplcBB+vWUED5P5kgv92+Sq9KmYoJphCwmVFa811tPFvijDiZdhiBelKrrFtCUE1rdQgDEkWqd@lists.infradead.org
X-Gm-Message-State: AOJu0YxBa1puaXaqZwXvAkabzAyWLmKqWdXkp9W65dMz7SuuB6R1BOmE
	CLLJhzzmbnsNoxIhKkMLzy4Rd4PebYoKzk3/CVYoAU+RvMVMhCAUW2tLe1Sp0oQ=
X-Gm-Gg: ASbGncssogv6WjKS43wTCKnW/1fF2P6mxrm7O9HcKPfMkNi3HX8I/FQXyEZ8EIS/Fw8
	5ER6xDATwulhzUgwUvENV7pJbxYHH+hdQkHlQk2p+ylE1o41c2GBrN2sDGEjL94zwtmRdPTj3wv
	vWOQ3vjxmTEkm9rPvnLat7sETTDcmloMY+yqFDBI6jtTHrPMb30rrNHJL05BtgYslyQYrTCi8m8
	5VBuZfmUG41E/05y/onTME1vtXD1xqGsQtSPus4GaO0WqalnshmPkvqvHCL+PuNm6f29wzG8P+h
	MxQUV1j0AHaMXUJivi7Scy2B1i4DbcRewzg/Hw1rZgwF2/5G+rQbb7oNazr5xsJWFStnK771r3q
	BQ7W+xH8dErhvZvs3E8n7Qr6OOJ0K
X-Google-Smtp-Source: AGHT+IGw6DMujSSlMe4X/Gi0vjiilArq9AgwOJMWr49ZazH2bLzcdxFw+AmPTscolQ+3wmW3ZQIPiA==
X-Received: by 2002:a05:6402:50d4:b0:5e5:9543:fc0d with SMTP id 4fb4d7f45d1cf-5e59543fd82mr4097180a12.31.1741107940802;
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:40 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:42 +0000
Subject: [PATCH v2 14/16] rtc: sd3078: drop needless struct sd3078
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-14-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_170547_447753_809460E0 
X-CRM114-Status: GOOD (  18.48  )
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
eSBhIGZldyBieXRlcy4KClNpbmNlIHRoaXMgbm93IG1lYW5zIHRoYXQgdGhlIHN0cnVjdHVyZSBo
YXMganVzdCBvbmUgbWVtYmVyIG9ubHkgbGVmdCwKdGhlcmUgIGlzIG5vIG5lZWQgYW55bW9yZSB0
byBhbGxvY2F0ZSBkYXRhIGZvciBpdCBhbmQgcGFzcyB0aGF0IGFyb3VuZAp2aWEgdGhlIHZhcmlv
dXMgY2FsbGJhY2tzLCBqdXN0IHRvIGV4dHJhY3QgdGhhdCBvbmUgbWVtYmVyLgoKSW5zdGVhZCwg
d2UgY2FuIGp1c3QgcGFzcyB0aGF0IG9uZSBtZW1iZXIgYW5kIGF2b2lkIHRoZSBleHRyYSBtZW1v
cnkKYWxsb2NhdGlvbiBmb3IgdGhlIGNvbnRhaW5pbmcgc3RydWN0LCByZWR1Y2luZyBydW50aW1l
IG1lbW9yeQpjb25zdW1wdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRy
ZS5kcmFzemlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jIHwgNzEg
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jIGIvZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jCmluZGV4
IGZlMjdiNTRiZWFhZDFjMDZiNzBiZjdmMjJlNDRjM2Y2ZGEwODcyNjcuLjEwY2MxZGNmYzc3NDgx
NDRmNTFlZjY3NDkzOTUwNmZlZWUxZmI0NzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1z
ZDMwNzguYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtc2QzMDc4LmMKQEAgLTM2LDExICszNiw2IEBA
CiAgKi8KICNkZWZpbmUgV1JJVEVfUFJPVEVDVF9FTgkwCiAKLXN0cnVjdCBzZDMwNzggewotCXN0
cnVjdCBydGNfZGV2aWNlCSpydGM7Ci0Jc3RydWN0IHJlZ21hcAkJKnJlZ21hcDsKLX07Ci0KIC8q
CiAgKiBJbiBvcmRlciB0byBwcmV2ZW50IGFyYml0cmFyeSBtb2RpZmljYXRpb24gb2YgdGhlIHRp
bWUgcmVnaXN0ZXIsCiAgKiB3aGVuIG1vZGlmaWNhdGlvbiBvZiB0aGUgcmVnaXN0ZXIsCkBAIC00
OSwxNCArNDQsMTEgQEAgc3RydWN0IHNkMzA3OCB7CiAgKiAyLiBzZXQgV1JJVEUyIGJpdAogICog
My4gc2V0IFdSSVRFMyBiaXQKICAqLwotc3RhdGljIHZvaWQgc2QzMDc4X2VuYWJsZV9yZWdfd3Jp
dGUoc3RydWN0IHNkMzA3OCAqc2QzMDc4KQorc3RhdGljIHZvaWQgc2QzMDc4X2VuYWJsZV9yZWdf
d3JpdGUoc3RydWN0IHJlZ21hcCAqcmVnbWFwKQogewotCXJlZ21hcF91cGRhdGVfYml0cyhzZDMw
NzgtPnJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMiwKLQkJCSAgIEtFWV9XUklURTEsIEtFWV9XUklU
RTEpOwotCXJlZ21hcF91cGRhdGVfYml0cyhzZDMwNzgtPnJlZ21hcCwgU0QzMDc4X1JFR19DVFJM
MSwKLQkJCSAgIEtFWV9XUklURTIsIEtFWV9XUklURTIpOwotCXJlZ21hcF91cGRhdGVfYml0cyhz
ZDMwNzgtPnJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMSwKLQkJCSAgIEtFWV9XUklURTMsIEtFWV9X
UklURTMpOworCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIFNEMzA3OF9SRUdfQ1RSTDIsIEtF
WV9XUklURTEsIEtFWV9XUklURTEpOworCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIFNEMzA3
OF9SRUdfQ1RSTDEsIEtFWV9XUklURTIsIEtFWV9XUklURTIpOworCXJlZ21hcF91cGRhdGVfYml0
cyhyZWdtYXAsIFNEMzA3OF9SRUdfQ1RSTDEsIEtFWV9XUklURTMsIEtFWV9XUklURTMpOwogfQog
CiAjaWYgV1JJVEVfUFJPVEVDVF9FTgpAQCAtNjksMTQgKzYxLDExIEBAIHN0YXRpYyB2b2lkIHNk
MzA3OF9lbmFibGVfcmVnX3dyaXRlKHN0cnVjdCBzZDMwNzggKnNkMzA3OCkKICAqIDIuIGNsZWFy
IFdSSVRFMyBiaXQKICAqIDMuIGNsZWFyIFdSSVRFMSBiaXQKICAqLwotc3RhdGljIHZvaWQgc2Qz
MDc4X2Rpc2FibGVfcmVnX3dyaXRlKHN0cnVjdCBzZDMwNzggKnNkMzA3OCkKK3N0YXRpYyB2b2lk
IHNkMzA3OF9kaXNhYmxlX3JlZ193cml0ZShzdHJ1Y3QgcmVnbWFwICpyZWdtYXApCiB7Ci0JcmVn
bWFwX3VwZGF0ZV9iaXRzKHNkMzA3OC0+cmVnbWFwLCBTRDMwNzhfUkVHX0NUUkwxLAotCQkJICAg
S0VZX1dSSVRFMiwgMCk7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRzKHNkMzA3OC0+cmVnbWFwLCBTRDMw
NzhfUkVHX0NUUkwxLAotCQkJICAgS0VZX1dSSVRFMywgMCk7Ci0JcmVnbWFwX3VwZGF0ZV9iaXRz
KHNkMzA3OC0+cmVnbWFwLCBTRDMwNzhfUkVHX0NUUkwyLAotCQkJICAgS0VZX1dSSVRFMSwgMCk7
CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMSwgS0VZX1dSSVRF
MiwgMCk7CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0QzMDc4X1JFR19DVFJMMSwgS0VZ
X1dSSVRFMywgMCk7CisJcmVnbWFwX3VwZGF0ZV9iaXRzKHJlZ21hcCwgU0QzMDc4X1JFR19DVFJM
MiwgS0VZX1dSSVRFMSwgMCk7CiB9CiAjZW5kaWYKIApAQCAtODUsMTEgKzc0LDEwIEBAIHN0YXRp
YyBpbnQgc2QzMDc4X3J0Y19yZWFkX3RpbWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRj
X3RpbWUgKnRtKQogCXVuc2lnbmVkIGNoYXIgaG91cjsKIAl1bnNpZ25lZCBjaGFyIHJ0Y19kYXRh
W05VTV9USU1FX1JFR1NdID0gezB9OwogCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB0b19p
MmNfY2xpZW50KGRldik7Ci0Jc3RydWN0IHNkMzA3OCAqc2QzMDc4ID0gaTJjX2dldF9jbGllbnRk
YXRhKGNsaWVudCk7CisJc3RydWN0IHJlZ21hcCAqcmVnbWFwID0gaTJjX2dldF9jbGllbnRkYXRh
KGNsaWVudCk7CiAJaW50IHJldDsKIAotCXJldCA9IHJlZ21hcF9idWxrX3JlYWQoc2QzMDc4LT5y
ZWdtYXAsIFNEMzA3OF9SRUdfU0MsIHJ0Y19kYXRhLAotCQkJICAgICAgIE5VTV9USU1FX1JFR1Mp
OworCXJldCA9IHJlZ21hcF9idWxrX3JlYWQocmVnbWFwLCBTRDMwNzhfUkVHX1NDLCBydGNfZGF0
YSwgTlVNX1RJTUVfUkVHUyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2VycihkZXYsICJyZWFk
aW5nIGZyb20gUlRDIGZhaWxlZCB3aXRoIGVycjolZFxuIiwgcmV0KTsKIAkJcmV0dXJuIHJldDsK
QEAgLTEyMyw3ICsxMTEsNyBAQCBzdGF0aWMgaW50IHNkMzA3OF9ydGNfc2V0X3RpbWUoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnRtKQogewogCXVuc2lnbmVkIGNoYXIgcnRj
X2RhdGFbTlVNX1RJTUVfUkVHU107CiAJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IHRvX2ky
Y19jbGllbnQoZGV2KTsKLQlzdHJ1Y3Qgc2QzMDc4ICpzZDMwNzggPSBpMmNfZ2V0X2NsaWVudGRh
dGEoY2xpZW50KTsKKwlzdHJ1Y3QgcmVnbWFwICpyZWdtYXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEo
Y2xpZW50KTsKIAlpbnQgcmV0OwogCiAJcnRjX2RhdGFbU0QzMDc4X1JFR19TQ10gPSBiaW4yYmNk
KHRtLT50bV9zZWMpOwpAQCAtMTM1LDEwICsxMjMsMTAgQEAgc3RhdGljIGludCBzZDMwNzhfcnRj
X3NldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y190aW1lICp0bSkKIAlydGNf
ZGF0YVtTRDMwNzhfUkVHX1lSXSA9IGJpbjJiY2QodG0tPnRtX3llYXIgLSAxMDApOwogCiAjaWYg
V1JJVEVfUFJPVEVDVF9FTgotCXNkMzA3OF9lbmFibGVfcmVnX3dyaXRlKHNkMzA3OCk7CisJc2Qz
MDc4X2VuYWJsZV9yZWdfd3JpdGUocmVnbWFwKTsKICNlbmRpZgogCi0JcmV0ID0gcmVnbWFwX2J1
bGtfd3JpdGUoc2QzMDc4LT5yZWdtYXAsIFNEMzA3OF9SRUdfU0MsIHJ0Y19kYXRhLAorCXJldCA9
IHJlZ21hcF9idWxrX3dyaXRlKHJlZ21hcCwgU0QzMDc4X1JFR19TQywgcnRjX2RhdGEsCiAJCQkJ
TlVNX1RJTUVfUkVHUyk7CiAJaWYgKHJldCA8IDApIHsKIAkJZGV2X2VycihkZXYsICJ3cml0aW5n
IHRvIFJUQyBmYWlsZWQgd2l0aCBlcnI6JWRcbiIsIHJldCk7CkBAIC0xNDYsNyArMTM0LDcgQEAg
c3RhdGljIGludCBzZDMwNzhfcnRjX3NldF90aW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
IHJ0Y190aW1lICp0bSkKIAl9CiAKICNpZiBXUklURV9QUk9URUNUX0VOCi0Jc2QzMDc4X2Rpc2Fi
bGVfcmVnX3dyaXRlKHNkMzA3OCk7CisJc2QzMDc4X2Rpc2FibGVfcmVnX3dyaXRlKHJlZ21hcCk7
CiAjZW5kaWYKIAogCXJldHVybiAwOwpAQCAtMTY2LDM2ICsxNTQsMzMgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCByZWdtYXBfY29uZmlnIHJlZ21hcF9jb25maWcgPSB7CiBzdGF0aWMgaW50IHNkMzA3
OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogewogCWludCByZXQ7Ci0Jc3RydWN0
IHNkMzA3OCAqc2QzMDc4OworCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKKwlzdHJ1Y3QgcnRjX2Rl
dmljZSAqcnRjOwogCiAJaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0eShjbGllbnQtPmFkYXB0
ZXIsIEkyQ19GVU5DX0kyQykpCiAJCXJldHVybiAtRU5PREVWOwogCi0Jc2QzMDc4ID0gZGV2bV9r
emFsbG9jKCZjbGllbnQtPmRldiwgc2l6ZW9mKCpzZDMwNzgpLCBHRlBfS0VSTkVMKTsKLQlpZiAo
IXNkMzA3OCkKLQkJcmV0dXJuIC1FTk9NRU07Ci0KLQlzZDMwNzgtPnJlZ21hcCA9IGRldm1fcmVn
bWFwX2luaXRfaTJjKGNsaWVudCwgJnJlZ21hcF9jb25maWcpOwotCWlmIChJU19FUlIoc2QzMDc4
LT5yZWdtYXApKSB7CisJcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LCAmcmVn
bWFwX2NvbmZpZyk7CisJaWYgKElTX0VSUihyZWdtYXApKSB7CiAJCWRldl9lcnIoJmNsaWVudC0+
ZGV2LCAicmVnbWFwIGFsbG9jYXRpb24gZmFpbGVkXG4iKTsKLQkJcmV0dXJuIFBUUl9FUlIoc2Qz
MDc4LT5yZWdtYXApOworCQlyZXR1cm4gUFRSX0VSUihyZWdtYXApOwogCX0KIAotCWkyY19zZXRf
Y2xpZW50ZGF0YShjbGllbnQsIHNkMzA3OCk7CisJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwg
cmVnbWFwKTsKIAotCXNkMzA3OC0+cnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlKCZjbGll
bnQtPmRldik7Ci0JaWYgKElTX0VSUihzZDMwNzgtPnJ0YykpCi0JCXJldHVybiBQVFJfRVJSKHNk
MzA3OC0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJmNsaWVudC0+ZGV2
KTsKKwlpZiAoSVNfRVJSKHJ0YykpCisJCXJldHVybiBQVFJfRVJSKHJ0Yyk7CiAKLQlzZDMwNzgt
PnJ0Yy0+b3BzID0gJnNkMzA3OF9ydGNfb3BzOwotCXNkMzA3OC0+cnRjLT5yYW5nZV9taW4gPSBS
VENfVElNRVNUQU1QX0JFR0lOXzIwMDA7Ci0Jc2QzMDc4LT5ydGMtPnJhbmdlX21heCA9IFJUQ19U
SU1FU1RBTVBfRU5EXzIwOTk7CisJcnRjLT5vcHMgPSAmc2QzMDc4X3J0Y19vcHM7CisJcnRjLT5y
YW5nZV9taW4gPSBSVENfVElNRVNUQU1QX0JFR0lOXzIwMDA7CisJcnRjLT5yYW5nZV9tYXggPSBS
VENfVElNRVNUQU1QX0VORF8yMDk5OwogCi0JcmV0ID0gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNl
KHNkMzA3OC0+cnRjKTsKKwlyZXQgPSBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIAlp
ZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0Jc2QzMDc4X2VuYWJsZV9yZWdfd3JpdGUoc2QzMDc4
KTsKKwlzZDMwNzhfZW5hYmxlX3JlZ193cml0ZShyZWdtYXApOwogCiAJcmV0dXJuIDA7CiB9Cgot
LSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
