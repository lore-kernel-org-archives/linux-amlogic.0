Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCA8C282C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wuAmRTy2KtlEBSLLLvNjVThuURvHNwQbYG0H2U2Sgvc=; b=xyvw+dM8kYCRjq
	Vs/Rgc2kLOz+LAPcxobKu5mZ2KBUnX1j/qhUAVi+AxNFXIIzr0D0EIN4xW46EF5LYyW2HfSos3tIM
	A4PGnA+yAsDCa+oNfD29Vgbj07hvzaNVtaqlADEyy2ZQnaeez443EtN/e6GtD4SVE1HJcUbcCQAV0
	FgBNZOKlSyHJc0O+iMFa8Tyh96Aui25B5AOeeOqaxzBpkdatPVPXe3srGxlAYzAX5hKB21ZWIraXR
	1VKc7Qb2ckjgZLOjlfF7nEVRb0xQzua/WJKY5XaRWmvjStMGTSavWqqRgjyUlABG3DHrM9af9xWx4
	kGg8OUQ9nIzmxTuSuxYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to13D-0000000BBlM-2ibW;
	Fri, 28 Feb 2025 14:09:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11P-0000000BB33-3MV5
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:25 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so3366977a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751642; x=1741356442; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=YCveMr2crzPRsU0zjO5QqERVT3ZajubiPM3jVF0/CdFyMtwVUcF3vLdR6TMm9N9kTJ
         gmk6wYBvLVzlTuICtJq3DflifGp8bW0ZRZVqEbjNxbWfvcARSyx8b9nK3uWDKSrSmyfW
         b1qR8geKeAoA1+P8Iy4K1okVWHgCX53P/OvM8dZsqX0ud8uI1oP8GDtkqjwTWIKtCGN3
         TZ6a2jaAa3vE576HpypAgRqoYAkMbQ8Nceb0RJnI0V1hw+6ap1e7PUHBfBELj2AFMzzG
         G5ZLfvxR74qMg1qQjPpTWyrXArCDPyYFu5/sAMSuVju6S3hCVoz5P+WyL2NCL2YLY4+y
         wTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751642; x=1741356442;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhLZqgcaujiFhw9G1dCH5p0FiLmGyvslkaMt4uwl9Do=;
        b=P/YFNNZC6gFk1FgxAWWQTnevC3GFs/zPNERaz70sksAMQqlrhZVthu2ZFwEQ1rnVXG
         8KjChyJqVu2XWKpUPHO/vvJ6OQY1RCyF2OlTdShBI04XfbyIE1L17OgsWqm2kizHvzej
         FQiVAjAQUb+CeALJNqY7ANGzD1CFEXO3zRTLYeWxT0KauuDcPHhm2I6TR6qz8gqp9fPn
         YXcrXakCI/ZsnXlPqXS7+v3R8Izbynp/fp1yHzoSoknB3juMbwe4TqByBqkQRYkUDRTm
         snI6O2LLFqWIwp4i0SEAIIdO3ba4omLu+p0jmrBm2cCDNl5kty0ROk19RZaLTb3IpzlQ
         9a7g==
X-Forwarded-Encrypted: i=1; AJvYcCVj2i5cYV8MaYUe5jqZF602LaQ+T8H2r1LyXSez4iBtIRkSc/dVq0t6IB7Eo+WwClAp0I8HCAHd4fUOeYja@lists.infradead.org
X-Gm-Message-State: AOJu0YzyM0sHpCTV7z7zXO8l/7A3f9QYfGVVKuwtXfSvyGjCWksnlVjh
	V4jgTG+wH5SBh7dINVjsQTZN6rgI3MJHfdwwEK1Q5xlage+dzrU7Vxqgklkgs1s=
X-Gm-Gg: ASbGncvSlyP/tqx8aCqPAXZ8Z0W/ITLAxCiCUaspm4fRwed+FnSPOPdoLAtE+I4KTV+
	Es3LLZx4RQZAFb5AOoaB8svEiZNNhWLX28cDff0ChTGosX2muu+dRqRuVZgsGJ0aHB/3qs+eKe3
	P0wss6DHUu468TyNtyYmFIIRZT8mMIyS17EIAZZCysgQbTqwpxP1eWM4QUc5msZdAP5z7yRWlYS
	QRDV1kVDsDPWhDc574R7I9xqFbDYuV4hy9rHJxzRYARLYNZ6BnSVnjiq4Ib4hB2nUin4ufle7NA
	S5lLmKXp4hfv+sg8u1/zf6t31HJbYP0XpTy7v2KEDZqWp7sjka57mFQifKADdyT0BeS1XZmGSXE
	I2Bg5c1Ff3A==
X-Google-Smtp-Source: AGHT+IHP7pUAJMVQB1Guj47dyI47K7YXQj82SFh5z5QQxgHATc6r4NQ1/TjLpJM/Ncf+/B2eBWDZ7w==
X-Received: by 2002:a05:6402:5242:b0:5e4:cfb0:f667 with SMTP id 4fb4d7f45d1cf-5e4d6b691d6mr2481074a12.21.1740751641613;
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:21 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 00/18] a few rtc driver cleanups
Date: Fri, 28 Feb 2025 14:07:13 +0000
Message-Id: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABHDwWcC/x3MQQqAIBBA0avIrBN0SoiuEi3MphoIE60IxLsnL
 d/i/wyJIlOCQWSI9HDi01foRoDbrd9I8lINqNAoxF7Gy0l3kPV3SFKjU7PR2JLtoCYh0srvvxu
 nUj6cRcJTXgAAAA==
X-Change-ID: 20250228-rtc-cleanups-12c0b5123ea4
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
X-CRM114-CacheID: sfid-20250228_060723_846011_CB67031F 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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

SGksCgpXaGlsZSBsb29raW5nIGF0IFJUQywgSSBub3RpY2VkIHRoYXQgdmFyaW91cyBkcml2ZXJz
IGFyZSBrZWVwaW5nCnBvaW50ZXJzIHRvIGRhdGEgdGhhdCB0aGV5J3JlIG5vdCB1c2luZyB0aGVt
c2VsdmVzIHRocm91Z2hvdXQgdGhlaXIKbGlmZXRpbWUuCgpTbyBJIHRvb2sgdGhlIGxpYmVydHkg
dG8gZHJvcCB0aGVzZSBwb2ludGVycyBhbmQgdGhpcyBzZXJpZXMgaXMgdGhlCnJlc3VsdC4KClRo
ZSBsYXN0IHR3byBwYXRjaGVzIGFsc28gY29udmVydCB0d28gZHJpdmVycyB0byB1c2luZyBkZXZf
ZXJyX3Byb2JlKCksCmFzIEkgbG9va2VkIHNsaWdodGx5IGNsb3NlciBpbnRvIHRob3NlIHR3by4g
VGhleSBkb24ndCBleGFjdGx5IGZpdCB0aGUKZ2VuZXJhbCBzdWJqZWN0IG9mIHJlbW92YWwgb2Yg
dW5uZWVkZWQgcG9pbnRlcnMsIGJ1dCBJIHdhbnRlZCB0byBzaGFyZQp0aGVtIGFueXdheSwgc2lu
Y2UgdGhleSdyZSByZWFkeS4KCkFsbCBvZiB0aGlzIHdhcyBjb21waWxlLXRlc3RlZCBvbmx5LgoK
Q2hlZXJzLApBbmRyZScKClNpZ25lZC1vZmYtYnk6IEFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFz
emlrQGxpbmFyby5vcmc+Ci0tLQpBbmRyw6kgRHJhc3ppayAoMTgpOgogICAgICBydGM6IG1heDc3
Njg2OiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtYXg3NzY4Nl9ydGNfaW5mbzo6cnRjIG1lbWJlcgog
ICAgICBydGM6IHM1bTogZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgczVtX3J0Y19pbmZvOjppMmMgbWVt
YmVyCiAgICAgIHJ0YzogYXNwZWVkOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBhc3BlZWRfcnRjOjpy
dGNfZGV2IG1lbWJlcgogICAgICBydGM6IGRzMjQwNDogZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgZHMy
NDA0OjpydGMgbWVtYmVyCiAgICAgIHJ0YzogZXA5M3h4OiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBl
cDkzeHhfcnRjOjpydGMgbWVtYmVyCiAgICAgIHJ0YzogZnRydGMwMTA6IGRyb3AgbmVlZGxlc3Mg
c3RydWN0IGZ0cnRjMDEwX3J0Yzo6cnRjX2RldiBtZW1iZXIKICAgICAgcnRjOiBtNDh0ODY6IGRy
b3AgbmVlZGxlc3Mgc3RydWN0IG00OHQ4Nl9ydGNfaW5mbzo6cnRjIG1lbWJlcgogICAgICBydGM6
IG1lc29uOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl9ydGM6OnJ0YyBtZW1iZXIKICAgICAg
cnRjOiBtZXNvbi12cnRjOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBtZXNvbl92cnRjX2RhdGE6OnJ0
YyBtZW1iZXIKICAgICAgcnRjOiBwbDAzMDogZHJvcCBuZWVkbGVzcyBzdHJ1Y3QgcGwwMzBfcnRj
OjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogcng4NTgxOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCByeDg1
ODE6OnJ0YyBtZW1iZXIKICAgICAgcnRjOiBzMzUzOTBhOiBkcm9wIG5lZWRsZXNzIHN0cnVjdCBz
MzUzOTBhOjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogc2QyNDA1YWw6IGRyb3AgbmVlZGxlc3Mgc3Ry
dWN0IHNkMjQwNWFsOjpydGMgbWVtYmVyCiAgICAgIHJ0Yzogc2QzMDc4OiBkcm9wIG5lZWRsZXNz
IHN0cnVjdCBzZDMwNzg6OnJ0YyBtZW1iZXIKICAgICAgcnRjOiByeDg1ODE6IGRyb3AgbmVlZGxl
c3Mgc3RydWN0IHJ4ODU4MQogICAgICBydGM6IHNkMzA3ODogZHJvcCBuZWVkbGVzcyBzdHJ1Y3Qg
c2QzMDc4CiAgICAgIHJ0YzogbWF4Nzc2ODY6IHVzZSBkZXZfZXJyX3Byb2JlKCkgd2hlcmUgYXBw
cm9wcmlhdGUKICAgICAgcnRjOiBzNW06IGNvbnZlcnQgdG8gZGV2X2Vycl9wcm9iZSgpIHdoZXJl
IGFwcHJvcHJpYXRlCgogZHJpdmVycy9ydGMvcnRjLWFzcGVlZC5jICAgICB8IDE2ICsrKystLS0t
LQogZHJpdmVycy9ydGMvcnRjLWRzMjQwNC5jICAgICB8IDE0ICsrKystLS0tCiBkcml2ZXJzL3J0
Yy9ydGMtZXA5M3h4LmMgICAgIHwgMTYgKysrKy0tLS0tCiBkcml2ZXJzL3J0Yy9ydGMtZnRydGMw
MTAuYyAgIHwgMTcgKysrKystLS0tCiBkcml2ZXJzL3J0Yy9ydGMtbTQ4dDg2LmMgICAgIHwgMTQg
KysrKy0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1tYXg3NzY4Ni5jICAgfCAzNyArKysrKysrKystLS0t
LS0tLS0tCiBkcml2ZXJzL3J0Yy9ydGMtbWVzb24tdnJ0Yy5jIHwgMTIgKysrLS0tLQogZHJpdmVy
cy9ydGMvcnRjLW1lc29uLmMgICAgICB8IDE2ICsrKystLS0tLQogZHJpdmVycy9ydGMvcnRjLXBs
MDMwLmMgICAgICB8IDE0ICsrKystLS0tCiBkcml2ZXJzL3J0Yy9ydGMtcng4NTgxLmMgICAgIHwg
ODUgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMv
cnRjL3J0Yy1zMzUzOTBhLmMgICAgfCAyMiArKysrKystLS0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1z
NW0uYyAgICAgICAgfCA1OCArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMv
cnRjL3J0Yy1zZDI0MDVhbC5jICAgfCAxNiArKysrLS0tLS0KIGRyaXZlcnMvcnRjL3J0Yy1zZDMw
NzguYyAgICAgfCA3MSArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDE0IGZp
bGVzIGNoYW5nZWQsIDE4MyBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCi0tLQpiYXNl
LWNvbW1pdDogMDIyNmQwY2U5OGE0Nzc5MzdlZDI5NWZiN2RmNGNjMzBiNDZmYzMwNApjaGFuZ2Ut
aWQ6IDIwMjUwMjI4LXJ0Yy1jbGVhbnVwcy0xMmMwYjUxMjNlYTQKCkJlc3QgcmVnYXJkcywKLS0g
CkFuZHLDqSBEcmFzemlrIDxhbmRyZS5kcmFzemlrQGxpbmFyby5vcmc+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
