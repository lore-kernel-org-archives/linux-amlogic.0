Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2252C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JthkRTW1yUhrJAt4EcFWebKqVByFcoFtNeYuyKteFBg=; b=Qe5rE6AQW+SLKR
	8BFtWX+1zcA12WTBgvhteDgsS+NocoUHrD0X6QbfEJXH32oHaD270p1I5SoP1TtTQ5F+MbuNC7hCS
	5AhSbFTK+vzvJ0XNMmyyDTV7CwxSDlPjnO177ePQY2ZrmntZ6VO9OwpE/2z1B72C8kij9VTCzpxYD
	LgEnc1TjPlgIm4FlaFsuto0WGz/VMftJ8OawyNDH9z/bLThwQeMFeN7Oz0WSJVKq6TzX+OGT7V20u
	3v4bNMQYukuDcG1ukly2jxZ5b8Ypm6ss9ZOlvAuDDGN0VLEN+mcdsSHsoNCcBmLZVvIAUeGFMWani
	1nqMSZRp9AJ/FYLZ2iGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1N9-0000000BGe2-2366;
	Fri, 28 Feb 2025 14:29:51 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11X-0000000BBBe-1YDY
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:32 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso3821085a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751650; x=1741356450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=Tbt1ZyYbw0fhZvWj/Jp6/ghf3SHPTn23gLzNSV4wEwbD4MLfoCMmkkjoOMhnXsetx+
         p4WxGnqMOt9LaAsXXzXbhW/r7TKvzMiZlxhnOe3cQ0U4/LUH8ulUHahrMp5tNuRunADt
         u1pclU0GQJ0X/T0tLk/8vlhl/E1j91woQDuRjb6x4r8i7fxsFtogFncr/FA5W6WTY3Ai
         0nJOTx2ta57oFenNKDSD++kiyyRT1AVE5YuYs2j1JpsqAK6a9TPDdi2I7jFj9IQU/F4C
         PC+OnA92/AYvqX3TYmE0rWpPieJiWp/5N8lW/Tx7NXLclt8NHCDMP0Buolk2Zx4DPkys
         be9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751650; x=1741356450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVgVdQhbC2YyNwH7K95+EhEh/kAvax64uDHN7A2amTM=;
        b=ir1YYlfkVJqga4kzwFIQ3RXBR3e5HVy8HpKPB4qHxy2WGG+txIPoevvhyzcg66zUwY
         NUa1p91jWARU+dVzaiztcMSFAMNCtnccVRUfr3ddFKFDvEJagVD2C9vnBPxTRgjxLmoY
         QRvgRlbOJBoYihsk1b3qI19sJvhcxnYqTDPQ++4lB0AlBa1ZVGiBxU/7Atdh1sHnuy4T
         mbMlonpDKKqs3zRPpv5wvxs66wDBIXTq4sRGNXsItQzMc3EJZKdkQ6XFmMUYhY4iEXEl
         bRCYv3Vo2qJAHaOAFe2ohjEz0Pn9n7tPiKKPubNdiheXoHL5OvaNcgbC+yHcYImR+ymG
         PIhw==
X-Forwarded-Encrypted: i=1; AJvYcCWicBmuAQWkFdCRXHcYL16NiW8+oqD+tx9aD/7xX/C836o5uabwQUELeNFra8667m2NxaySJd0J335tqXFb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9NVmpqmXC0o99ERd2079br3KPcJYhQB/JzyUoatYyD1FKBiYM
	wqGM6YICaFfE9s08bUPCv4c27f60o1md7L5uDsvDWdOIWhpyRRi/dgzf/lR7T4c=
X-Gm-Gg: ASbGncuQ0WpFY+waSWw8liiaoptp/s+UmmwzT+EakdS/n9/g0ukbSQ3S/VvMxlC9X+9
	g0KaK+BHYyI/mzcNgJ1UpqQrOGExgSTauFjORokVxnvwR8zv8q/cPqziHJMyWX2llBYyyEb1ERc
	fqqbxuRpravQAGIUI9MEoWx3ryYt7GKJtccY2bz3beiPF9a2dBU/DSDlusXWlhy00zBiOMBFtpg
	ub/o3slpRJsdLg2gSwNn7VhzJIJxqx1Bgu4zQDvemA4OL3ia0J2D3aIqfi/6da7BX30KR1SfJb5
	Hsy8DDmW6ErvbxHrGysMjNiw9wCe/cX7C3WJuMaZSgS+5xoIgVDPnoPNOKtiakUJYQI2O7FY5Ie
	Q8Eujo324CA==
X-Google-Smtp-Source: AGHT+IHCyDQzEJ6kBhW3v4N+pYx5F1W3SqfuZOszPC9Ixk4jqjoqtVWckx72H2jiEWEF9nyPWj82Qw==
X-Received: by 2002:a05:6402:254d:b0:5e4:cfe8:3502 with SMTP id 4fb4d7f45d1cf-5e4d6afa314mr2938285a12.17.1740751649850;
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:29 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:27 +0000
Subject: [PATCH 14/18] rtc: sd3078: drop needless struct sd3078::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-14-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060731_413247_0D4FAD4A 
X-CRM114-Status: GOOD (  11.96  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jIHwgMTYgKysrKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtc2QzMDc4LmMgYi9kcml2ZXJzL3J0Yy9y
dGMtc2QzMDc4LmMKaW5kZXggZmUyN2I1NGJlYWFkMWMwNmI3MGJmN2YyMmU0NGMzZjZkYTA4NzI2
Ny4uZWJiNGQ0NWNlMjQwOTk4Mjg4MGFmZmJjN2E4NWQ1ZTc0MTBjOGY0MiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLXNkMzA3OC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zZDMwNzguYwpA
QCAtMzcsNyArMzcsNiBAQAogI2RlZmluZSBXUklURV9QUk9URUNUX0VOCTAKIAogc3RydWN0IHNk
MzA3OCB7Ci0Jc3RydWN0IHJ0Y19kZXZpY2UJKnJ0YzsKIAlzdHJ1Y3QgcmVnbWFwCQkqcmVnbWFw
OwogfTsKIApAQCAtMTY3LDYgKzE2Niw3IEBAIHN0YXRpYyBpbnQgc2QzMDc4X3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpCiB7CiAJaW50IHJldDsKIAlzdHJ1Y3Qgc2QzMDc4ICpzZDMw
Nzg7CisJc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YzsKIAogCWlmICghaTJjX2NoZWNrX2Z1bmN0aW9u
YWxpdHkoY2xpZW50LT5hZGFwdGVyLCBJMkNfRlVOQ19JMkMpKQogCQlyZXR1cm4gLUVOT0RFVjsK
QEAgLTE4MywxNSArMTgzLDE1IEBAIHN0YXRpYyBpbnQgc2QzMDc4X3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpCiAKIAlpMmNfc2V0X2NsaWVudGRhdGEoY2xpZW50LCBzZDMwNzgpOwog
Ci0Jc2QzMDc4LT5ydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZpY2UoJmNsaWVudC0+ZGV2KTsK
LQlpZiAoSVNfRVJSKHNkMzA3OC0+cnRjKSkKLQkJcmV0dXJuIFBUUl9FUlIoc2QzMDc4LT5ydGMp
OworCXJ0YyA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmY2xpZW50LT5kZXYpOworCWlmIChJ
U19FUlIocnRjKSkKKwkJcmV0dXJuIFBUUl9FUlIocnRjKTsKIAotCXNkMzA3OC0+cnRjLT5vcHMg
PSAmc2QzMDc4X3J0Y19vcHM7Ci0Jc2QzMDc4LT5ydGMtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RB
TVBfQkVHSU5fMjAwMDsKLQlzZDMwNzgtPnJ0Yy0+cmFuZ2VfbWF4ID0gUlRDX1RJTUVTVEFNUF9F
TkRfMjA5OTsKKwlydGMtPm9wcyA9ICZzZDMwNzhfcnRjX29wczsKKwlydGMtPnJhbmdlX21pbiA9
IFJUQ19USU1FU1RBTVBfQkVHSU5fMjAwMDsKKwlydGMtPnJhbmdlX21heCA9IFJUQ19USU1FU1RB
TVBfRU5EXzIwOTk7CiAKLQlyZXQgPSBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2Uoc2QzMDc4LT5y
dGMpOworCXJldCA9IGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShydGMpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKCi0tIAoyLjQ4LjEuNzExLmcyZmVhYmFiMjVhLWdvb2cKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
