Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4B2C19776
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2025 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XyVr5izLhXb/sSx/VvXcr6KZhXbVONdp3aaTrSadVp0=; b=xctO9elbZ3Cylr
	SuRXLtGYET4xNRKZD/BBWbmqeXKYqBCtSaDu1S2UgGPdB1tv3JmMg9nXJmw1xv+xaG3+/s+x3X080
	V8elmpJUVNHWuZlTum5ckhKy6Zkdsbj1uDBcsmbnJVAZfYtinIUibrs+UCVy5R1hPyNga6d+00I4D
	AAulpS9i5cRQJs8qA+P/aIASixOYYPYNtFSuW+p7rYnJ5UpF+/gg/HijaPuZ/zru8XxtrbhEOAy1f
	EA4oG6i8yDCsre3ARNZPZHdRndIE893XH38W79dDiMv5fLuYj5Ob/nF2fL5wcVuzM+4rajzaJnMhT
	aalt+p9nJMRfS+kWgR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1FU-0000000BF5O-1FbV;
	Fri, 28 Feb 2025 14:21:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11U-0000000BB7t-3BEp
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:29 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so933670a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=Skmg0PDZ6aTEM1UQM2YOYOU4KpBZIBFqyoOQ5W5ch3JCED4Sw62F9ujqUT0TZE+lf/
         9zoRCEezZiJ8Ja5hhMhtbjvGTZfhOAu0IpQjlCMFOLi+jh5kQ8FaHhOw1snclIBL1v0W
         aooVUH8fn5+R8Qji2X6xLdaS2TbVyRl0TE8qrlfAjtUkYhh35/MAZDYLJp/zoOZP8xrw
         oYtIOK9sbLjLS3PTHGd+bBaKG8AqXS/Iu/8GNpBfZLixMrHonhL++ifyPGTC5gT2oqKU
         wJgFeb3YhxIn02RDelaltOnsOMLI2CGKuZ2N/WtlJhe0rk4zoW8isBn8mtY/yoSKhJSp
         +aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=bO8w4pLLHPc6i6BrKOayWG/euzpfzgvduDD0muKb4Dw+07PWeFVbzpAS5kG8QxZ4w7
         hV1PezTuOqTKOhQ8565hBPdu3+2mSwF7sscgPZk0YKinqewSp7gKSxJFWCSqjsw7Rlel
         lvM2/77HWrgj+18SLh8AUyJLpMFyp+YsArRs+AxlSSVO2c67RraylqG+cojOIqrFUNg5
         at9rI0ANLxNkHLVNi9rQc4tOrgyDjfsD/6zBNHA/kIdunv9DMvxNZNDkZwNKjj451/tR
         dhcIcs/qCHC8m9Fb2I9vuy5N0noUNRpLagzFOAuGswneuipQoOQeZqCLWAA/uMqs/iJw
         DD3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCxMO9P1OY5wpyHk/e0cg+kMr/25SafmNlUF0GqWZ3ZrQEHclKDgz363WJarLi31OT06v/YeNFPlxr6zNG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8iP4UPPcLMn3vocmBmV2bwDdhd+I34Ju7MROOhBuPs3Rfb9f
	KxaRJeNiLtv+IUsHTXVIT9BmceRqa2SYHkKfqhGAJU77j9nPu402bpGplSd84G8=
X-Gm-Gg: ASbGncvrqzRg7WO48vW/NXZ/QVDjXkSy+fSpnQtPbQWcRDkVpPei6NN70XP2TQ5BZHj
	aXIVP5hikGsM7c5ilOM3aDKY16NZRCIVtRsmY+RRlNIj1NNDs1U0zWbxMyvLooiUai4Ee3l9Xnz
	QCVpPV0i83eMWeHFORNnpQOIU5B3d7mWlJ+s8XRdnJukvEmDgdP3RHo0FigGQv3Hs2K9mTs69M7
	FYk3R6K2SSifKkRxU4a32f18k9SLFDZ/qeqzC7UYmAGByJu5HHD38S2+GJXcmDoHKOZqJmMq0mh
	KsEPH0JmWCjlLSp9jOdbcl0MDgyTOCMFr7U7XcFg9ngz5UZa0QX4qPzlybtcE/0CL9gO3jHYBGU
	kYOvU8RSm1Q==
X-Google-Smtp-Source: AGHT+IGZCKi+h7liDGF2k254zFpRo0bnTt6a/BEgRPyIDc7kptNekspya74S4whe/rs/kwdpZDQeGw==
X-Received: by 2002:a05:6402:27d1:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5e4d6b6240bmr2836488a12.27.1740751647311;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:22 +0000
Subject: [PATCH 09/18] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
MIME-Version: 1.0
Message-Id: <20250228-rtc-cleanups-v1-9-b44cec078481@linaro.org>
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
X-CRM114-CacheID: sfid-20250228_060728_800939_3F91CA27 
X-CRM114-Status: GOOD (  12.80  )
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
emlrQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ydGMvcnRjLW1lc29uLXZydGMuYyB8IDEyICsr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtbWVzb24tdnJ0Yy5jIGIvZHJpdmVycy9y
dGMvcnRjLW1lc29uLXZydGMuYwppbmRleCA1ODQ5NzI5ZjdkMDFkN2VjNzg2OGZmM2JiZGM1ZWQ1
OTlhYWE4MjM4Li43ZDM4MjU4Y2JlMzc2ZTVhMWIyYWY2MjUwY2I2ZDA0YzMxMzE3NWZiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3J0Yy9ydGMtbWVzb24tdnJ0Yy5jCisrKyBiL2RyaXZlcnMvcnRjL3J0
Yy1tZXNvbi12cnRjLmMKQEAgLTEzLDcgKzEzLDYgQEAKIAogc3RydWN0IG1lc29uX3ZydGNfZGF0
YSB7CiAJdm9pZCBfX2lvbWVtICppb19hbGFybTsKLQlzdHJ1Y3QgcnRjX2RldmljZSAqcnRjOwog
CXVuc2lnbmVkIGxvbmcgYWxhcm1fdGltZTsKIAlib29sIGVuYWJsZWQ7CiB9OwpAQCAtNjUsNiAr
NjQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJ0Y19jbGFzc19vcHMgbWVzb25fdnJ0Y19vcHMg
PSB7CiBzdGF0aWMgaW50IG1lc29uX3ZydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIHsKIAlzdHJ1Y3QgbWVzb25fdnJ0Y19kYXRhICp2cnRjOworCXN0cnVjdCBydGNfZGV2
aWNlICpydGM7CiAKIAl2cnRjID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqdnJ0
YyksIEdGUF9LRVJORUwpOwogCWlmICghdnJ0YykKQEAgLTc4LDEyICs3OCwxMiBAQCBzdGF0aWMg
aW50IG1lc29uX3ZydGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHZydGMpOwogCi0JdnJ0Yy0+cnRjID0gZGV2bV9ydGNf
YWxsb2NhdGVfZGV2aWNlKCZwZGV2LT5kZXYpOwotCWlmIChJU19FUlIodnJ0Yy0+cnRjKSkKLQkJ
cmV0dXJuIFBUUl9FUlIodnJ0Yy0+cnRjKTsKKwlydGMgPSBkZXZtX3J0Y19hbGxvY2F0ZV9kZXZp
Y2UoJnBkZXYtPmRldik7CisJaWYgKElTX0VSUihydGMpKQorCQlyZXR1cm4gUFRSX0VSUihydGMp
OwogCi0JdnJ0Yy0+cnRjLT5vcHMgPSAmbWVzb25fdnJ0Y19vcHM7Ci0JcmV0dXJuIGRldm1fcnRj
X3JlZ2lzdGVyX2RldmljZSh2cnRjLT5ydGMpOworCXJ0Yy0+b3BzID0gJm1lc29uX3ZydGNfb3Bz
OworCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjKTsKIH0KIAogc3RhdGljIGlu
dCBfX21heWJlX3VudXNlZCBtZXNvbl92cnRjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoK
LS0gCjIuNDguMS43MTEuZzJmZWFiYWIyNWEtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
