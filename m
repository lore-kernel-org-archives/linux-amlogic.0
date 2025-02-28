Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C959CC19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16HDefQ86dUJ1JePUj4n0nncHDtCrM8UMCJx6SVQJII=; b=qFi5oQFYoH5HvH
	h+dYjVSdJIumbcUipuUqP8aIZ/wllqgVH1CpvnnssbgNW5sJ4cDkkzB0g62g7UDTOpRoi/ybKrJ10
	ClTNb5xybbj3BnYj2hOd5I/KCexv2SwxZO7tylq2DR6o+qg3vMtuXam+lZIVa2/+8VJZMDXyWqlFv
	6b14ovXM8spjEgSOqlkPtXoTaQq/CPNArKzQtjApJTXK+Zu9VfylbFCTH8kjoEny9tHk9dpfEdkXx
	jesDGKU5UeNBuHiJtfvf1QJaKnO6DvxC2vq2E8yFAV7+c7rd3QtiZtTs7oIdJBhGGUgNljay3NLfU
	e0g2i+9opmVvwnc8ljCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to16I-0000000BCa0-0KdM;
	Fri, 28 Feb 2025 14:12:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11R-0000000BB3v-2BXQ
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so3851603a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751644; x=1741356444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=DIg1kgLt5Oep0o5v4ZjEl3Pao9VvKZWVV1m+kaGGsrYTSXSaODXr9+3PsbZ5X255RK
         EYbFZIXdL0DmN93CzpY7HYqYxJzBSPhCNJjwEs6nwmGXcpexH6WTiJIBWfxd0YHqsxID
         M9Z6PmJsWny0nkQU7S/Tf95w5n12qsqwZDsPokW9AaZz6OlrcQqY1G51T5wChPQZKLkz
         32TKsVSriRYEjPReQ7yYail1oxJ5l/wyMi3eZPEgKmiI0SUxD84Sc2PFUC99ukHJkfHd
         7JPrj+xazWkJQjrfPlzupoEdxlSk1lXBhdT3kpYHcHTvbB6zJwe7G+L9nO6vuUMdtcXK
         iRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751644; x=1741356444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=I8eLd311vvL1IIOPvY8+zhlE2VhbbHDG9wmf3ZBAptJ+YdCxs+Ju0i+vOCSmD3Mbyy
         BoNCK2Tpt2f1GHTksAeQQjV4azEwOk3DRC8DYdMLMS5F3ZLcl0A2YIg13VR4DI4kqZEs
         ZfsUIBK1Gyea6gI1nypwzMtPPqCdl7Tc5H7kRXM5ahn5zLtZgsHGPA58z7Xt2VVAKKQ5
         mp1yZMHdRHTAuA/Lg0RJv/yAlSekMytndiUqCL9adccIXEmyLroA0Pi1GyXn+1NXTwJp
         OHAO+N2V/n6va5tTYhSmuTw5PD7oGz3u8KIbIjK31xZ35vqQIAFN5RZBpdJeKpeoTWKP
         lyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJIlY/7W3rogUjh4f8eiPDbzvs4zXqeTuy/PY5rcI9ZaRK/NSYKNCuHodOpBTSHiNMw6fpkFcDwH9gJPX/@lists.infradead.org
X-Gm-Message-State: AOJu0YyxCnVk+bVGcxg098dcbUGWLanz7Vx2YzUhq98j0q1Kxgso460O
	wI3pW5ospICv12Iph0Dgj3atnHaGjj/OaADsyNcyaReoPD4W4ziiXXiJQVnGJo4=
X-Gm-Gg: ASbGncukeOArTYRVP0im5jH8HdVO4JsCknMqMbdSKEfSkd1HD+t+9KB1Z1ulgUiOtI/
	LCv9kgxYeRCZmZe9xWtU7HU8ldTjgt39qPIKOgaUGSkAsiiNkc6LjwFVyAQ82jLZcWGlASnHXup
	bPZiz1QxqX9cH08w9pygyWyPdaGe5siymPOg9WYRaLTTCKTtlAnvC+q6jL0fgpr/MaOPewC4s8Y
	M+QhbSY3xz/3DReo4qLPoBFywesEzLQE985CF2b9KSKbAcVOq5r4s8m1SZHXV8zVa1W8t6lafOQ
	eJtVimf6wQ5unWiiITZSHxeVmSxZpDDaY4lK19H6PqBpwG3iO57RDIpBZuG98XLVhdjmcRTZTF+
	PdJlscIFABA==
X-Google-Smtp-Source: AGHT+IESLHMD1ALp0fl5UNtQkvu55XFyzsWGAW2ARn4G0KwygGU8Ail6xNyHqVhAMNH9i4466iKXaA==
X-Received: by 2002:a05:6402:848:b0:5dc:d10a:1be8 with SMTP id 4fb4d7f45d1cf-5e4d6b0e6c9mr2959043a12.19.1740751643974;
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:23 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:16 +0000
Subject: [PATCH 03/18] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-3-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060725_556133_AC038FDA 
X-CRM114-Status: GOOD (  13.41  )
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
b24gYnkgYSBmZXcgYnl0ZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUu
ZHJhc3ppa0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1hc3BlZWQuYyB8IDE2ICsr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWFzcGVlZC5jIGIvZHJpdmVycy9y
dGMvcnRjLWFzcGVlZC5jCmluZGV4IDg4MGIwMTVlZWJhZjc5NmY2OGVkODJjMjk5OThmMzQ1ZTFm
ZDQxOGIuLjBkMDA1M2I1MmY5YjkwYTYxNzI1YmYyOTQzNWJmYzgwNzE5NzdmOWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcnRjL3J0Yy1hc3BlZWQuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtYXNwZWVk
LmMKQEAgLTgsNyArOCw2IEBACiAjaW5jbHVkZSA8bGludXgvaW8uaD4KIAogc3RydWN0IGFzcGVl
ZF9ydGMgewotCXN0cnVjdCBydGNfZGV2aWNlICpydGNfZGV2OwogCXZvaWQgX19pb21lbSAqYmFz
ZTsKIH07CiAKQEAgLTg1LDYgKzg0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBydGNfY2xhc3Nf
b3BzIGFzcGVlZF9ydGNfb3BzID0gewogc3RhdGljIGludCBhc3BlZWRfcnRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGFzcGVlZF9ydGMgKnJ0YzsKKwlz
dHJ1Y3QgcnRjX2RldmljZSAqcnRjX2RldjsKIAogCXJ0YyA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKnJ0YyksIEdGUF9LRVJORUwpOwogCWlmICghcnRjKQpAQCAtOTQsMTcgKzk0
LDE3IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlmIChJU19FUlIocnRjLT5iYXNlKSkKIAkJcmV0dXJuIFBUUl9FUlIocnRjLT5i
YXNlKTsKIAotCXJ0Yy0+cnRjX2RldiA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+
ZGV2KTsKLQlpZiAoSVNfRVJSKHJ0Yy0+cnRjX2RldikpCi0JCXJldHVybiBQVFJfRVJSKHJ0Yy0+
cnRjX2Rldik7CisJcnRjX2RldiA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+ZGV2
KTsKKwlpZiAoSVNfRVJSKHJ0Y19kZXYpKQorCQlyZXR1cm4gUFRSX0VSUihydGNfZGV2KTsKIAog
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHJ0Yyk7CiAKLQlydGMtPnJ0Y19kZXYtPm9wcyA9
ICZhc3BlZWRfcnRjX29wczsKLQlydGMtPnJ0Y19kZXYtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RB
TVBfQkVHSU5fMTkwMDsKLQlydGMtPnJ0Y19kZXYtPnJhbmdlX21heCA9IDM4ODE0OTg5Mzk5TEw7
IC8qIDMxOTktMTItMzEgMjM6NTk6NTkgKi8KKwlydGNfZGV2LT5vcHMgPSAmYXNwZWVkX3J0Y19v
cHM7CisJcnRjX2Rldi0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFNUF9CRUdJTl8xOTAwOworCXJ0
Y19kZXYtPnJhbmdlX21heCA9IDM4ODE0OTg5Mzk5TEw7IC8qIDMxOTktMTItMzEgMjM6NTk6NTkg
Ki8KIAotCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjLT5ydGNfZGV2KTsKKwly
ZXR1cm4gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Y19kZXYpOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBhc3BlZWRfcnRjX21hdGNoW10gPSB7CgotLSAKMi40OC4x
LjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
