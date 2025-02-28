Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC02C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YUs05DhFs+LgAiWCc16LXWwILhsHrllKlQ8YfVHzKU=; b=y9m18JkR5VeRoI
	2AIbpBwSG9DAvYAWZ2osP7X6zHTIpTafB+/ztfYgbgeLqdMsNhaP24F11uT7eSPVkTROIdKxWGiRt
	wkl+goCZlYM5P51dLWAcJMOJUlXjMEFnuicHgo/Z+zurFcMgyoelroyRiFvFo+Y4lx6PQwFGGmQOw
	LE5zXksg1b2kJZZRJ0npGBTCBxJEESOxSJGrsAMVR18MYLJ6AXRNlkjU42hdPdAL2aNESamOLdqRI
	vzjD1wwh9C1dP+iftPvgpix5IFLPg6UgaN0AT7J4m9iCxTXX7/aC7X9L7wggZkE+oy7/hcMXiV0Wx
	P+m4Nw8eC32CinNamkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1At-0000000BDqy-3P9y;
	Fri, 28 Feb 2025 14:17:11 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11T-0000000BB5L-05IE
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:28 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so3925584a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751645; x=1741356445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=jeU2JtskMdAYZtNYJ8cEX2hQiiFRABy15ZOpG+7C3G+2Brg3oejPx1FemRGjnRXTyc
         3G5Q0LpfOvREynm1O7rtv9W7qI/CLpTONiHzThsbP7FmYuTWPy29Kh7N94ezawSEEXMh
         hd3oljXol9S1QIasSrTRyappJOVYuONc6uAwL2iknvlJCW4ypE87hKuncG+ui1i4TEQf
         uhPH2T56QzfZyHYLqvN/6wc3WPsEBxZ/sX+gEoUO9SQhrflkdO7XOuetK8F91hgxtzQ2
         BwNGPu2ikkxKOPYHVclXI1spoVBWtHfH/fLnq2mdeOkHJlEGz+gq3EyUQvXBSxZ5UVE3
         IKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751645; x=1741356445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=jOr/7tR0Myv60gqda95AoMcA1ozDmhaki/+DLfGHwuWT1XWUj1C30xJKuJerahCi9s
         mmdF5rgW0j7Qpqu4ocjhl5+1I0UPL68Jd+NzUPEw3QJvRGS7vwjyIpcw71e4of/ffDHQ
         1RvH/76M3h+JxIwcbJobC9fDbkhLc86mi1EIeRQ1etsXrWsk8GmmpGwBXJLqkphY9kL1
         Xkpai676ut5xdSUn860JDS/fgj8dYb5Hs4YEIlMZ9SGjb3kS9S02Vus0pJG72cFeQMHY
         vD8Gnhzy/hTg8zNUFzkO7REZ/nMfEQNLkXkZsKqyRrZQu2NloCbwAgSt7tSdGXbZj1pc
         Qmzg==
X-Forwarded-Encrypted: i=1; AJvYcCVeiYzX4NEB4m6rvJYOxjhukgyWe+bk0fKiYt1ryzLeR4Zt/I2Bt19auObrxuCVq9eou0Et+rlNpkO6OmJt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpses8nYimsBO70VEg0UB0A/ViT13KrjRYx4p7W1Ew9Ha31VAt
	A+P47uZOUOBKv66+wqt1VOZtAp6+mALTtHI+4jAm2MiuORcpFTUFUg2rTl4rHfY=
X-Gm-Gg: ASbGnctUvXKop+w7ZtYleJkNxFArqLiJ1AZjt6K1KWI4HUg59eP/Z1+LsLAv6dKtbtY
	unk0+Lh5Yo+sPGdeHvMh8rG++Ffrh8658X9nUGkHjJ7Nf1GbQ6gVrxD6LW2mQW2rIIZDgb/G5WX
	JXsaylaYZLzuNaDC+RncYxppUcvvKXFU8dEMDhB+g1VkWkBlmHrQbf9gycOEueDsagUe84rxbYs
	d5sukBRDjSVZNYgOZAY6EoTVPINy/loio2aA6iURHQChJAIR111EJCII9vBSgZmnvYkuoTqBFHL
	9Jxu+qg0rk9qc5fRM9/riY9eQsnfAb5z135sqIUfcv2ty3aI8B/PBcOTkxT6q57TFreS9qw/uDw
	HVsPrZBSO/A==
X-Google-Smtp-Source: AGHT+IFjP5A5it0oOhAqjGMiq+zBlLn6/wyStXZ9TEpg3CsfQx18Ux73fzaAw5ZlIGleu7roV3QB1Q==
X-Received: by 2002:a05:6402:84d:b0:5df:5188:11cc with SMTP id 4fb4d7f45d1cf-5e4d6b702a7mr2552045a12.20.1740751645245;
        Fri, 28 Feb 2025 06:07:25 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:24 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:18 +0000
Subject: [PATCH 05/18] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-5-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060727_055885_5F024762 
X-CRM114-Status: GOOD (  13.32  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLWVwOTN4eC5jIHwgMTYgKysrKysr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtZXA5M3h4LmMgYi9kcml2ZXJzL3J0Yy9y
dGMtZXA5M3h4LmMKaW5kZXggMWZkZDIwZDAxNTYwZWY0ZmFlMmI5OTZjZjM2NmI0ZjgxMjMyOTIy
NS4uZGNkY2RkMDZmMzBkMWZmNmQwOTM5ZjZiY2FkMmMxN2MwM2M1YTY1ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ydGMvcnRjLWVwOTN4eC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1lcDkzeHguYwpA
QCAtMjgsNyArMjgsNiBAQAogCiBzdHJ1Y3QgZXA5M3h4X3J0YyB7CiAJdm9pZCBfX2lvbWVtCSpt
bWlvX2Jhc2U7Ci0Jc3RydWN0IHJ0Y19kZXZpY2UgKnJ0YzsKIH07CiAKIHN0YXRpYyBpbnQgZXA5
M3h4X3J0Y19nZXRfc3djb21wKHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgc2hvcnQgKnBy
ZWxvYWQsCkBAIC0xMjMsNiArMTIyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVf
Z3JvdXAgZXA5M3h4X3J0Y19zeXNmc19maWxlcyA9IHsKIHN0YXRpYyBpbnQgZXA5M3h4X3J0Y19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBlcDkzeHhfcnRj
ICplcDkzeHhfcnRjOworCXN0cnVjdCBydGNfZGV2aWNlICpydGM7CiAJaW50IGVycjsKIAogCWVw
OTN4eF9ydGMgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCplcDkzeHhfcnRjKSwg
R0ZQX0tFUk5FTCk7CkBAIC0xMzUsMTggKzEzNSwxOCBAQCBzdGF0aWMgaW50IGVwOTN4eF9ydGNf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIGVwOTN4eF9ydGMpOwogCi0JZXA5M3h4X3J0Yy0+cnRjID0gZGV2bV9ydGNfYWxs
b2NhdGVfZGV2aWNlKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIoZXA5M3h4X3J0Yy0+cnRjKSkK
LQkJcmV0dXJuIFBUUl9FUlIoZXA5M3h4X3J0Yy0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxv
Y2F0ZV9kZXZpY2UoJnBkZXYtPmRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRS
X0VSUihydGMpOwogCi0JZXA5M3h4X3J0Yy0+cnRjLT5vcHMgPSAmZXA5M3h4X3J0Y19vcHM7Ci0J
ZXA5M3h4X3J0Yy0+cnRjLT5yYW5nZV9tYXggPSBVMzJfTUFYOworCXJ0Yy0+b3BzID0gJmVwOTN4
eF9ydGNfb3BzOworCXJ0Yy0+cmFuZ2VfbWF4ID0gVTMyX01BWDsKIAotCWVyciA9IHJ0Y19hZGRf
Z3JvdXAoZXA5M3h4X3J0Yy0+cnRjLCAmZXA5M3h4X3J0Y19zeXNmc19maWxlcyk7CisJZXJyID0g
cnRjX2FkZF9ncm91cChydGMsICZlcDkzeHhfcnRjX3N5c2ZzX2ZpbGVzKTsKIAlpZiAoZXJyKQog
CQlyZXR1cm4gZXJyOwogCi0JcmV0dXJuIGRldm1fcnRjX3JlZ2lzdGVyX2RldmljZShlcDkzeHhf
cnRjLT5ydGMpOworCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIH0KIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZXA5M3h4X3J0Y19vZl9pZHNbXSA9IHsK
Ci0tIAoyLjQ4LjEuNzExLmcyZmVhYmFiMjVhLWdvb2cKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
