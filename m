Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A63C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUV1yTqDeHPfV5uD2/nfl0oDY+7MDFc9tsIudcw4Q/E=; b=R08/bKbnm8q4fQ
	wzj4Wk5mqiXczzZ6IkJELKgdO0Nj0mW3GrGgZaXUMSoeesrToT/JMOUXPab6RHl/2rgTGFtnRNFeb
	Aa8M7MVMq7wXKcSBFvUn9zZgKuNop1AtkBdRLFbYLsNVyS3SfZA2b30vfiKIRUXDffYRQi+c9pqwX
	RI+ysZ62MTBjuvl0An9Q8OX2NiYa7tl/Cy/8+mmrHrT29Ts/2uTaXz85Il9xRTpTai6wbF6YZUACg
	dlvzr+59rnmQlYNLFmu5w3SwqF00Z9SknUKaSplpucN3v24zj95Mnr9lIfjbpZrr92hRz6JYHA0O1
	2iiml9roGK2CvQN5EvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to13D-0000000BBlR-4ABZ;
	Fri, 28 Feb 2025 14:09:15 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11Q-0000000BB3C-2UFz
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:26 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e033c2f106so2449561a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751643; x=1741356443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=GNwV7WePBwGhEVUrY8wkOq3dzITnF6bXyqJEur34Z1CIW6s4R9vz3QrmoEhjsA04eg
         7kbBYDcHmMpkZ3JLtdArC03chuByeVy/vLIRGi7eZfpNV70nu6O3sdU6h5YDnemgokMK
         dT0q24KtC5t2eUsgOPzFWhSPAjNpkjhXEYvoT+g8bNDBoRzfm592WkRpnWNNAxVTPD2d
         D+5n/qz/PdRNzu6HlbjGIVW08hDsvXXfv2MHhEBVKhDMZSnlGGtlYYnydpY0jp41vELK
         eEvnZrF7mM8WY5uj2u8cSCmlVzD4DrV2uK+5bWMpLfnz0L4q0zFdGInPZZtEY429l41d
         HZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751643; x=1741356443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PxV5ubkQILRDTTOOiWiVBaTKuCWcjZ1klG/odToLNLU=;
        b=xD5nkP9V6y7OyzaMuuN9fzQKAYiMuNA4zVtTeEhkTPzoi2/LcQU5lLt7nVL4dOWpgw
         bFPhEMa68iNNbEcaHqCjvsJfDF6cPktVUPUzsIqHK3CwtzjEps7nl24EJmRbofxt47gQ
         x4/qo/cP3qbDearM1sTKqMuTBdTueKnTUFlQwNYhnRquOG4GgL4Peg0AXULjiTUETiVi
         KBSA4BqPwtPfn0wwM129O/xaTsxbTuDqTLKElRDMb7pZHNt1HZzrCJ6ZXC1qxCpdRfEO
         1AxOahZj/Rf6nR5m0KMJnDH4Dat+9wUY+z8Tq2jWuoYKC4lyPk1u+hutuuGW5qDNUFQM
         cbgA==
X-Forwarded-Encrypted: i=1; AJvYcCVqLfMMibzks1LuzfMcoVkDEhyOKVTRh2yql61kZd1xWVK/Ac+XpFxb38gK7/I1DdkNuaVvWCGsT0nUZzmA@lists.infradead.org
X-Gm-Message-State: AOJu0YwUPU8m+W8ta3623aCq8cm2aBMpL0EM7qo3HdOu0+1WfEINFOVW
	pqmUkiCbjkuIz7PLHU4nnrqxfrrDwWey0492TdJ0uaQRaYTpo9L6C3CnmkTeAg4=
X-Gm-Gg: ASbGncskYMl/7ZszHLqRZn3/6MbYxa0+D/HL93nBzH0qOLIlf9T8PGiC1/6VJi+7fTW
	zvpVK3rM7Yr1lpzsYzkDgn6YnpQGeagFq6n29rJxq0xetf6h7XD6nSAoDowwcjG5Y3GGJfqjpa6
	frVj25lZ8jrguEY2bWOphXRQlzX8MEe+K37YD5x45YMHO8xCmUxacOjwIXElcy9h8FnItiCSlSL
	HRAHVJ+dYp9VBgeTLJf2G/9Ugtu/Ld/N20YgvGVy1T4ybWzGXhpJFl/bL06G4N8nyJcxq36sOaL
	DNksK0/xMpRFgF9wq+jNYxmurL3nUJrQ6eYfY1TKFAtYfNqhzg8muBdBeeSQ4+BWRvLf006HEkw
	KqQqUQv22Cg==
X-Google-Smtp-Source: AGHT+IFUL7DUuq/VqTU9dmynPShF+8aK2RXF+k+UR0pl4bWqZxWvS8VoSsjq66EWlcydyD7uTG7tww==
X-Received: by 2002:a05:6402:1d4d:b0:5dc:796f:fc86 with SMTP id 4fb4d7f45d1cf-5e4d6af436amr7325207a12.16.1740751642551;
        Fri, 28 Feb 2025 06:07:22 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:14 +0000
Subject: [PATCH 01/18] rtc: max77686: drop needless struct
 max77686_rtc_info::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-1-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060724_631262_2A2D1747 
X-CRM114-Status: GOOD (  12.89  )
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
ZCBpMmMgZGV2aWNlCmluIGNvbW1pdCA1OWE3ZjI0ZmNlYjMgKCJydGM6IG1heDc3Njg2OiBjb252
ZXJ0IHRvCmRldm1faTJjX25ld19kdW1teV9kZXZpY2UoKSIpLCBzdHJ1Y3QgbWF4Nzc2ODZfcnRj
X2luZm86OnJ0YyBiZWNhbWUKZXNzZW50aWFsbHkgdW51c2VkLgoKV2UgY2FuIGRyb3AgaXQgZnJv
bSB0aGUgc3RydWN0dXJlIGFuZCBqdXN0IHVzZSBhIGxvY2FsIHRlbXBvcmFyeQp2YXJpYWJsZSwg
cmVkdWNpbmcgcnVudGltZSBtZW1vcnkgY29uc3VtcHRpb24gYnkgYSBmZXcgYnl0ZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUuZHJhc3ppa0BsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcnRjL3J0Yy1tYXg3NzY4Ni5jIGIvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMKaW5kZXgg
N2JiMDQ0ZDJhYzI1YWVhYWYyNDA0YjQ3YjdlN2JkNDg1YWUzZDM5ZS4uNmIwZDAyYjQ0YzgwOTc0
NTNmNzA0Y2JlYzlmMDI1ODBmYjg2OWNhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLW1h
eDc3Njg2LmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLW1heDc3Njg2LmMKQEAgLTg1LDcgKzg1LDYg
QEAgc3RydWN0IG1heDc3Njg2X3J0Y19kcml2ZXJfZGF0YSB7CiAKIHN0cnVjdCBtYXg3NzY4Nl9y
dGNfaW5mbyB7CiAJc3RydWN0IGRldmljZQkJKmRldjsKLQlzdHJ1Y3QgaTJjX2NsaWVudAkqcnRj
OwogCXN0cnVjdCBydGNfZGV2aWNlCSpydGNfZGV2OwogCXN0cnVjdCBtdXRleAkJbG9jazsKIApA
QCAtNjkxLDYgKzY5MCw3IEBAIHN0YXRpYyBpbnQgbWF4Nzc2ODZfaW5pdF9ydGNfcmVnbWFwKHN0
cnVjdCBtYXg3NzY4Nl9ydGNfaW5mbyAqaW5mbykKIHsKIAlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQg
PSBpbmZvLT5kZXYtPnBhcmVudDsKIAlzdHJ1Y3QgaTJjX2NsaWVudCAqcGFyZW50X2kyYyA9IHRv
X2kyY19jbGllbnQocGFyZW50KTsKKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50OwogCWludCBy
ZXQ7CiAKIAlpZiAoaW5mby0+ZHJ2X2RhdGEtPnJ0Y19pcnFfZnJvbV9wbGF0Zm9ybSkgewpAQCAt
NzE0LDE0ICs3MTQsMTQgQEAgc3RhdGljIGludCBtYXg3NzY4Nl9pbml0X3J0Y19yZWdtYXAoc3Ry
dWN0IG1heDc3Njg2X3J0Y19pbmZvICppbmZvKQogCQlnb3RvIGFkZF9ydGNfaXJxOwogCX0KIAot
CWluZm8tPnJ0YyA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoaW5mby0+ZGV2LCBwYXJlbnRf
aTJjLT5hZGFwdGVyLAotCQkJCQkgICAgICBpbmZvLT5kcnZfZGF0YS0+cnRjX2kyY19hZGRyKTsK
LQlpZiAoSVNfRVJSKGluZm8tPnJ0YykpIHsKKwljbGllbnQgPSBkZXZtX2kyY19uZXdfZHVtbXlf
ZGV2aWNlKGluZm8tPmRldiwgcGFyZW50X2kyYy0+YWRhcHRlciwKKwkJCQkJICAgaW5mby0+ZHJ2
X2RhdGEtPnJ0Y19pMmNfYWRkcik7CisJaWYgKElTX0VSUihjbGllbnQpKSB7CiAJCWRldl9lcnIo
aW5mby0+ZGV2LCAiRmFpbGVkIHRvIGFsbG9jYXRlIEkyQyBkZXZpY2UgZm9yIFJUQ1xuIik7Ci0J
CXJldHVybiBQVFJfRVJSKGluZm8tPnJ0Yyk7CisJCXJldHVybiBQVFJfRVJSKGNsaWVudCk7CiAJ
fQogCi0JaW5mby0+cnRjX3JlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGluZm8tPnJ0YywK
KwlpbmZvLT5ydGNfcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoY2xpZW50LAogCQkJCQkJ
aW5mby0+ZHJ2X2RhdGEtPnJlZ21hcF9jb25maWcpOwogCWlmIChJU19FUlIoaW5mby0+cnRjX3Jl
Z21hcCkpIHsKIAkJcmV0ID0gUFRSX0VSUihpbmZvLT5ydGNfcmVnbWFwKTsKCi0tIAoyLjQ4LjEu
NzExLmcyZmVhYmFiMjVhLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
