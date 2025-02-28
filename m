Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DEDC282C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQNc7jsOxspIZyBnQi4vNnsDnVZv4mH2lW7IFI5pJHY=; b=S70rCqTDsFlzMD
	H2qHHVMEhxkml+K+xfi+0hUiN19FSZFX98lI+LfLa8BM+ogb1EUUtcOkjMJNNit2BLaF433troT7q
	G1mv1uQ4KGJRJ9HcSG7+o4nwrgYDHNkWyX3PEeVpk5MvRc6gQefNSPxCn3emFMc+MP8LNRqgg5gC5
	kWTO8EKVSPUNo/y6rWmIk9roS2gN75Ezp40539clvd1BDTVzEJtvr2GbMVZ1vmTmo+gWq4gOeQJqw
	GwwxEBjUHEKiJSuwzFb7WiV8UjgSbrL7xI2zkDwToTwC45Jya+Mj7l6X93tvrvAIic/+TKsSA3HqH
	AJFV5JPVK4Q2KsC66HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1CQ-0000000BEJv-3qjJ;
	Fri, 28 Feb 2025 14:18:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11T-0000000BB5l-149o
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e4ad1d67bdso3214419a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751646; x=1741356446; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=Tete8FJrRmJOVMYDzdfO7FOg3YK6B8VAh+fDA3yTBC6G623oCWjYNz4cNn6uxg9GeS
         Y7kq2HgqXo7qFWMXM7O2RaY35+/Zz0tqKDWBQYBrUwJ3AUVmzjlqXk8uCZgskXhzyjII
         m0ssSIwhTxK3EW6e7seGS6Y+2NuQIznXJ7CWX2DPDnB3Cc+VrYgMwfBUsG/zNJby6CDC
         Rr7PsmHPYGZuL9//Z+2Jd0edzBWRA0pf7UiZZKK0o7tV+iB8lFLGsfXRhtYWhjkPEHUL
         kLD4vMhKR8OGzxGk6C+FG8zLcDTmgyM0w0cpDxBL/NOmZvaeNpyFkIucf6R3jVjdSmb3
         TarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751646; x=1741356446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZH0eiBnc3WyY94yEis5FUZqmpsbyvfcyDb3myV5OX0=;
        b=tBYvnWxl9wW0xMGR6b4uZCf0rQ1zWpPHHUjzbmz7QAWv0bxNMjSEsiHwJiwIobQXVw
         ArHVjRs/pfTxuJIbGoScXf39HUAyt5KFjXlOtc1OpudMyGEILnqbtjpVu0yUvNutv+Kp
         FIxYI/lTcKOve7PtiPahBNX571dWw/PyfgVcZe7RViyO0Sbo0V/8t78+OxhHy6KG5DaE
         l+BHoYME+sAAonwRFXITg9dpgQYAf7BiZnj4gKdr1xr/0BeYv3/y+NlGM+qEfki+MF6c
         2y5GQcb7neVJF0EtePlZUHJAByxrx7xd+7tWWUz+qFjK2n5ZxaHRMWJInEqIdT/hEuEG
         0Czw==
X-Forwarded-Encrypted: i=1; AJvYcCXyKGeGvocU5GRiSGcP5t4tWaJSkFUZFuQzCYyfgvX4gOifzidckQ6EjrlvVRMpvRaB3EibJBOPSv7lvmF9@lists.infradead.org
X-Gm-Message-State: AOJu0YwNy/4Ek7l0SO/ADha11Zv+nAzG5sUMHStiQ7TLZ2k+MZBIe1rl
	MRZlbD2YM1L6+Oj+TtiK35WqfsXYfNyEjq2hSKrWN1gz/tbx5qgH/uM09DjaJ44=
X-Gm-Gg: ASbGncs6yYDq02a940E7KMZh6b3J9TR/ky+Xf0TbHvJoFu6Yhnp7C0wT2Ps/SM8wz1e
	Ke80XwZztD4P0BAnNvb3fKH4tb0cMmDDMlEWqAJc30hyIjbX73qTJysPwwFUWOFWyWlZyacrDU7
	GWxNP9V0dXMooIg6gznlDOa+Pl27XW2KhLEeEeBTVpja78N045F1thwtWpNKJjK7iGBNg0ivYpp
	Dk80kN5Uj7DvIxLD1Y8y8pEc4OCZqlwuWegPkcknuMBfvuQljpWhyi14DLLacfZ05f9Y84lJRVY
	sePDBtPWmX41LaTFVsXJTPtJ7nOYhlydfzkLFsjNGraixqW0cUIEsivagRCL3kg8Tv/sjEXHR5l
	cDsUcJHpH6w==
X-Google-Smtp-Source: AGHT+IFbzXWayjdSMfWjy9cwjYueSFy4YBp7IQ8OjzR2IKI5f4QLOeDnV9cvNi5W4D61UevFMTrZwA==
X-Received: by 2002:a05:6402:239a:b0:5e5:552:32a8 with SMTP id 4fb4d7f45d1cf-5e5055238efmr931950a12.8.1740751645786;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:19 +0000
Subject: [PATCH 06/18] rtc: ftrtc010: drop needless struct
 ftrtc010_rtc::rtc_dev member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-6-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060727_330100_CA64A186 
X-CRM114-Status: GOOD (  12.50  )
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
ZHJhc3ppa0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1mdHJ0YzAxMC5jIHwgMTcg
KysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWZ0cnRjMDEwLmMgYi9kcml2
ZXJzL3J0Yy9ydGMtZnRydGMwMTAuYwppbmRleCBjYjRhNWQxMDFmNTM3ZTIwYTY4NWJiMDIyZTZm
NjUxNmIwZGY4MjcxLi4wMjYwOGQzNzg0OTU4ZTY5ZWMwZWNiZGI5ZmNjOGIzMzNiMTllN2NjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtZnRydGMwMTAuYworKysgYi9kcml2ZXJzL3J0Yy9y
dGMtZnRydGMwMTAuYwpAQCAtMjgsNyArMjgsNiBAQCBNT0RVTEVfTElDRU5TRSgiR1BMIik7CiBN
T0RVTEVfQUxJQVMoInBsYXRmb3JtOiIgRFJWX05BTUUpOwogCiBzdHJ1Y3QgZnRydGMwMTBfcnRj
IHsKLQlzdHJ1Y3QgcnRjX2RldmljZQkqcnRjX2RldjsKIAl2b2lkIF9faW9tZW0JCSpydGNfYmFz
ZTsKIAlpbnQJCQlydGNfaXJxOwogCXN0cnVjdCBjbGsJCSpwY2xrOwpAQCAtMTEzLDYgKzExMiw3
IEBAIHN0YXRpYyBpbnQgZnRydGMwMTBfcnRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJc3RydWN0IGZ0cnRjMDEwX3J0YyAqcnRjOwogCXN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7CiAJc3RydWN0IHJlc291cmNlICpyZXM7CisJc3RydWN0IHJ0Y19kZXZpY2Ug
KnJ0Y19kZXY7CiAJaW50IHJldDsKIAogCXJ0YyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBz
aXplb2YoKnJ0YyksIEdGUF9LRVJORUwpOwpAQCAtMTYwLDI5ICsxNjAsMjggQEAgc3RhdGljIGlu
dCBmdHJ0YzAxMF9ydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290
byBlcnJfZGlzYWJsZV9leHRjbGs7CiAJfQogCi0JcnRjLT5ydGNfZGV2ID0gZGV2bV9ydGNfYWxs
b2NhdGVfZGV2aWNlKGRldik7Ci0JaWYgKElTX0VSUihydGMtPnJ0Y19kZXYpKSB7Ci0JCXJldCA9
IFBUUl9FUlIocnRjLT5ydGNfZGV2KTsKKwlydGNfZGV2ID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2
aWNlKGRldik7CisJaWYgKElTX0VSUihydGNfZGV2KSkgeworCQlyZXQgPSBQVFJfRVJSKHJ0Y19k
ZXYpOwogCQlnb3RvIGVycl9kaXNhYmxlX2V4dGNsazsKIAl9CiAKLQlydGMtPnJ0Y19kZXYtPm9w
cyA9ICZmdHJ0YzAxMF9ydGNfb3BzOworCXJ0Y19kZXYtPm9wcyA9ICZmdHJ0YzAxMF9ydGNfb3Bz
OwogCiAJc2VjICA9IHJlYWRsKHJ0Yy0+cnRjX2Jhc2UgKyBGVFJUQzAxMF9SVENfU0VDT05EKTsK
IAltaW4gID0gcmVhZGwocnRjLT5ydGNfYmFzZSArIEZUUlRDMDEwX1JUQ19NSU5VVEUpOwogCWhv
dXIgPSByZWFkbChydGMtPnJ0Y19iYXNlICsgRlRSVEMwMTBfUlRDX0hPVVIpOwogCWRheXMgPSBy
ZWFkbChydGMtPnJ0Y19iYXNlICsgRlRSVEMwMTBfUlRDX0RBWVMpOwogCi0JcnRjLT5ydGNfZGV2
LT5yYW5nZV9taW4gPSAodTY0KWRheXMgKiA4NjQwMCArIGhvdXIgKiAzNjAwICsKLQkJCQkgIG1p
biAqIDYwICsgc2VjOwotCXJ0Yy0+cnRjX2Rldi0+cmFuZ2VfbWF4ID0gVTMyX01BWCArIHJ0Yy0+
cnRjX2Rldi0+cmFuZ2VfbWluOworCXJ0Y19kZXYtPnJhbmdlX21pbiA9ICh1NjQpZGF5cyAqIDg2
NDAwICsgaG91ciAqIDM2MDAgKyBtaW4gKiA2MCArIHNlYzsKKwlydGNfZGV2LT5yYW5nZV9tYXgg
PSBVMzJfTUFYICsgcnRjX2Rldi0+cmFuZ2VfbWluOwogCiAJcmV0ID0gZGV2bV9yZXF1ZXN0X2ly
cShkZXYsIHJ0Yy0+cnRjX2lycSwgZnRydGMwMTBfcnRjX2ludGVycnVwdCwKIAkJCSAgICAgICBJ
UlFGX1NIQVJFRCwgcGRldi0+bmFtZSwgZGV2KTsKIAlpZiAodW5saWtlbHkocmV0KSkKIAkJZ290
byBlcnJfZGlzYWJsZV9leHRjbGs7CiAKLQlyZXR1cm4gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNl
KHJ0Yy0+cnRjX2Rldik7CisJcmV0dXJuIGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShydGNfZGV2
KTsKIAogZXJyX2Rpc2FibGVfZXh0Y2xrOgogCWNsa19kaXNhYmxlX3VucHJlcGFyZShydGMtPmV4
dGNsayk7CgotLSAKMi40OC4xLjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
