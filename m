Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98EEC021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YUs05DhFs+LgAiWCc16LXWwILhsHrllKlQ8YfVHzKU=; b=1lfEqAN2qmmk/n
	DcOyjQkhZgRkRYg8M4HrMsD76Ampr7TBMwMztcQgylTg9sX/ZmVZSltNg5u+aSe7uXVotTYKbBPA9
	Wm7ULD1eRjOmOmmmUV/odTdfekrXa/uTlZs8v5wOExc9gLs2N6CvM8D4vfz0NZY/wRwPPk9LyENgL
	wqS0kBLpuD8a0IfXQcyOtTHM0hfWt4oNm4aDKCcPI+Rcv0ZSjU62gDgsubWuYQPTGO7re5FLsUlDD
	9kBMZhVGfLMeYzrzWHPOX0wcr0lAkbqRXFZThxVp9rA6jfWRls/A7j0LhFgS5ab4Qh4o9Uhd1fL1K
	A8iy80LXp/eT1SCkwAqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX2Y-00000005r8Y-2Kr4;
	Tue, 04 Mar 2025 18:30:50 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi4-00000005YAI-2uDh
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:37 +0000
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab744d5e567so998009266b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107934; x=1741712734; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=HTuCJfvYaW9iA83wrLWbMwOiDuSHeyh5f9M/YtpHhTlbmmxFU7cwQAzrGRKrd6Exy2
         y0vqpA0FEy+S/s3m7J55BNJYwvfWbfswWokElsu2AZXYM3AsI/hRSPBMd6uIOxQrMVcF
         Lyau/ot+g1MEs1OEp0DK36K7/Bfx4PLVVyvsY2iqS6AqvjVsaSknz6dAJ/hNyvLvuc8p
         fvp/dQqE9dr9uy31S8RJlbyfHg9XIDR8ewJRxNHfo73Q8Vy7ehEc9SthUahmTF0o9EHC
         LTR5BbZxcrnaIBbmnY0ZEx4qDXt3/dunkL3ZkIM9c1N4SNmMPqpzlm61GB/0gUWxtC3u
         lDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107934; x=1741712734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0DbxfKxGvd2WW4HNIqxG+j4XJyJfuCMmLSYkWj7Rsc=;
        b=tMQt1xZ7IIshHCUstzIVmBbijSdli6VqPO69IFlk8XCilrUYn3qcuwnrmSvTQEvJLt
         fRXq071FsSmQM+jOrr3VjZ3m3enfWRIVDNFeSg3NmmVhWOBihnN0CsK4rV74Y84E5Tfq
         +0yAamQZfRemX6p7rVjh12JdvdsEIo6gbw4hTFvm/7skutHh12cuN3WT1oE+SuFj3rBo
         fBtJhGbAqvStXJs0JUIHNPJKm2QF3Yhk7jzWQRTpB7PMJHZmq4I1l22TP7gCtEoBK4UT
         CCey/P0ko7CT/5KA6N/e34jTDrZIahwskDGOny1IhkeCj91MYAUVlzLTVUqpOzCgRjjW
         XayQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf8JMNNVU0E0jGBwKCeTZ0s72+gh2roPYZpQMXh17zDFzHGNcZ3m5rKBLhSKS52DWVSy58KV+nFfj0ELcI@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpcst5a+q1AVEBaJFs+uCmLjYtadRycFhZnpRjOQlkpZsMdQkc
	LisXoYST16J4J9j5g5bTpWbPXzsRcx+7eqaFf5JeHrMb6GYTWb+S9uJ7E6EcBuE=
X-Gm-Gg: ASbGncsYZQAWkowI2uY9ZzW0sWTneoVI8vbCP7Z/uL1YYLjeBsCtqakkMs2Z3utCzmb
	p/R5oqLg8hczVnFH3wV1EcrLOPT+O5sf2ma2/MC0hQe+LXPz552+sHI0cpGwlv0R0D3TuyCluJ4
	rLrx0yKewJvN/Zm4m6t5XbuZxRdrTmTvixccFxGgqipa2nU5MhCJ47jOqK64sI36c2BrBTkfrs/
	paKHhZa8Zhdw+oEdspXFbNO8reb+YPrzAzTS5paMYLLniPif8UJDFnV16Nm4LYpKo/uJjiPyA1A
	4G57fHhqfirj5V9XEV7X82oHtI2LZFH84WncNmK84s2I2CZu0eQITOyL0LZnC3RmUdO8G3QaqKL
	R+L3+wjaWT3oeSjLZbPhYe9AWye4v
X-Google-Smtp-Source: AGHT+IGsdjvAcycMp31oFEdsdwWFqJQmXbxtDBoL5DRz6SC3HgSNRmbkL1ZXNDzmFm2b5aF1OyYNnA==
X-Received: by 2002:a17:906:c150:b0:abf:4a62:6e5b with SMTP id a640c23a62f3a-ac1f0e60023mr427555766b.5.1741107934486;
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:34 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:33 +0000
Subject: [PATCH v2 05/16] rtc: ep93xx: drop needless struct ep93xx_rtc::rtc
 member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-5-d4689a71668c@linaro.org>
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
X-CRM114-CacheID: sfid-20250304_090536_729964_1639B372 
X-CRM114-Status: GOOD (  14.05  )
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
